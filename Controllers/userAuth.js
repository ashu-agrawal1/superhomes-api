const express = require("express")
const { db } = require("../Config/db")
const { sendOtpEmail } = require("../Middleware/mail")

const otpStore = new Map()
const tempUserStore = new Map()

// Function to send OTP
const sendOtp = async (email) => {
  const generatedOtp = Math.floor(100000 + Math.random() * 900000) // Generate 6-digit OTP
  const otpExpiryTime = Date.now() + 15 * 60 * 1000 // OTP valid for 15 minutes

  otpStore.set(email, { otp: generatedOtp, otpExpiryTime }) // Save OTP with expiry
  console.log(`Generated OTP for ${email}: ${generatedOtp}`) // Debugging log

  await sendOtpEmail(email, generatedOtp) // Send OTP to user's email
  console.log(`OTP sent to ${email}`) // Confirmation log

  return { otpExpiryTime }
}

// Helper function to save user to the database
const saveUser = async (name, email, password, role, age, phone_number, birthdate, res) => {
  const insertUserQuery =
    "INSERT INTO userdata (name, age, birthdate, email, phone_number, password, role) VALUES (?, ?, ?, ?, ?, ?, ?)"
  await new Promise((resolve, reject) => {
    db.query(insertUserQuery, [name, age, birthdate, email, phone_number, password, role], (err) => {
      if (err) return reject(err)
      resolve()
    })
  })

  res.status(201).json({
    success: true,
    message: "User registered successfully",
    user: { name, age, birthdate, email, phone_number, role },
  })
}

// Registration Endpoint
const register = async (req, res) => {
  try {
    const { name, email, password, role = "user", age, phone_number, birthdate } = req.body
    console.log("req body ->", req.body);

    // Check for required fields
    if (!name || !email || !password || !age) {
      return res.status(400).json({ error: "Name, email, password, and age are required" })
    }

    // Convert age to a number
    const ageNumber = Number(age)
    if (isNaN(ageNumber)) {
      return res.status(400).json({ error: "Age must be a valid number" })
    }

    // Validate phone number format (optional)
    if (phone_number && !/^\d{10}$/.test(phone_number)) {
      return res.status(400).json({ error: "Phone number must be 10 digits" })
    }

    // Validate birthdate format (optional)
    if (birthdate && isNaN(Date.parse(birthdate))) {
      return res.status(400).json({ error: "Invalid birthdate format" })
    }

    // Validate email format
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
    if (!emailRegex.test(email)) {
      return res.status(400).json({ error: "Invalid email format" })
    }

    // Check if the user already exists
    const existingUserQuery = "SELECT * FROM userdata WHERE email = ?"
    const existingUser = await new Promise((resolve, reject) => {
      db.query(existingUserQuery, [email], (err, result) => {
        if (err) return reject(err)
        resolve(result)
      })
    })

    if (existingUser.length > 0) {
      return res.status(400).json({ error: "User already exists." })
    }

    // Handle admin role with OTP logic
    if (role === "admin" || role==='user') {
      const { otpExpiryTime } = await sendOtp(email)
      tempUserStore.set(email, { name, age, birthdate, email, phone_number, password, role })
      return res.status(200).json({
        message: "OTP sent to your email. Please verify to complete registration.",
        otpExpiryTime,
      })
    }

    // Save user for non-admin roles
    await saveUser(name, email, password, role, age, phone_number, birthdate, res)
  } catch (error) {
    console.error("Error in registration:", error.message)
    res.status(500).json({
      success: false,
      message: "Error in registration",
      error: error.message,
    })
  }
}

// OTP Verification Endpoint
const verifyOtp = async (req, res) => {
  const { email, otp } = req.body

  const storedData = otpStore.get(email)
  if (!storedData) {
    return res.status(400).json({ success: false, message: "No OTP found for this email." })
  }

  const { otp: storedOtp, otpExpiryTime } = storedData

  if (otp == storedOtp && Date.now() < otpExpiryTime) {
    otpStore.delete(email) // Clear OTP after verification

    // Retrieve user data from temp store and save it to the database
    const userData = tempUserStore.get(email)
    if (userData) {
      const { name, password, role, age, phone_number, birthdate } = userData

      try {
        // Save verified admin user to the database
        await saveUser(name, email, password, role, age, phone_number, birthdate, res)
        tempUserStore.delete(email) // Clear temporary data
      } catch (error) {
        console.error("Error saving user:", error.message)
        return res.status(500).json({
          success: false,
          message: "Error saving user to the database.",
        })
      }
    } else {
      return res.status(400).json({ success: false, message: "User data not found." })
    }
  } else {
    return res.status(400).json({ success: false, message: "Invalid or expired OTP." })
  }
}

// Login Endpoint
const login = async (req, res) => {
  try {
    const { email, password } = req.body

    // Check if email and password are provided
    if (!email || !password) {
      return res.status(400).json({ error: "Email and password are required" })
    }

    const trimmedPassword = password.trim()
    const findUserQuery = "SELECT * FROM userdata WHERE email = ?"

    const user = await new Promise((resolve, reject) => {
      db.query(findUserQuery, [email], (err, result) => {
        if (err) return reject(err)
        resolve(result.length ? result[0] : null)
      })
    })

    if (!user) {
      return res.status(400).json({ error: "User does not exist." })
    }

    if (trimmedPassword === user.password.trim()) {
      return res.status(200).json({
        success: true,
        message: "Login successful",
        user: {
          user_id: user.user_id,
          name: user.name,
          age: user.age,
          birthdate: user.birthdate,
          email: user.email,
          phone_number: user.phone_number,
          role: user.role
        },
      })
    } else {
      return res.status(401).json({ error: "Invalid credentials." })
    }
  } catch (error) {
    console.error("Error in login:", error.message)
    res.status(500).json({
      success: false,
      message: "Internal server error",
      error: error.message,
    })
  }
}

const forgotPassword = async (req, res) => {
  try {
    const { email } = req.body

    // Check if user exists
    const findUserQuery = "SELECT * FROM userdata WHERE email = ?"
    const user = await new Promise((resolve, reject) => {
      db.query(findUserQuery, [email], (err, result) => {
        if (err) return reject(err)
        resolve(result.length ? result[0] : null)
      })
    })

    if (!user) {
      return res.status(404).json({ error: "User not found" })
    }

    // Generate and store OTP
    const otp = Math.floor(100000 + Math.random() * 900000)
    const otpExpiryTime = Date.now() + 15 * 60 * 1000 // 15 minutes

    otpStore.set(email, {
      otp,
      otpExpiryTime,
      type: "password-reset",
    })

    // Send OTP email
    await sendOtpEmail(email, otp)

    res.status(200).json({
      success: true,
      message: "Password reset OTP sent to your email",
    })
  } catch (error) {
    res.status(500).json({
      success: false,
      message: "Error in password reset request",
      error: error.message,
    })
  }
}

const resetPassword = async (req, res) => {
  try {
    const { email, otp, newPassword } = req.body

    const storedData = otpStore.get(email)
    if (!storedData || storedData.type !== "password-reset") {
      return res.status(400).json({ error: "Invalid or expired OTP" })
    }

    if (otp != storedData.otp || Date.now() > storedData.otpExpiryTime) {
      return res.status(400).json({ error: "Invalid or expired OTP" })
    }

    // Update password in database
    const updatePasswordQuery = "UPDATE userdata SET password = ? WHERE email = ?"
    await new Promise((resolve, reject) => {
      db.query(updatePasswordQuery, [newPassword, email], (err) => {
        if (err) return reject(err)
        resolve()
      })
    })

    // Clear OTP
    otpStore.delete(email)

    res.status(200).json({
      success: true,
      message: "Password reset successful",
    })
  } catch (error) {
    res.status(500).json({
      success: false,
      message: "Error in password reset",
      error: error.message,
    })
  }
}


module.exports = { register, verifyOtp, login, forgotPassword, resetPassword };