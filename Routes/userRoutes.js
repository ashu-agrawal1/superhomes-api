const express = require("express");
const { register, verifyOtp, login,forgotPassword, resetPassword } = require("../Controllers/userAuth");  
const router = express.Router();

// User authentication routes
router.post("/register", register);
router.post("/verify-otp", verifyOtp); 
router.post("/login", login);
router.post("/forgot-password", forgotPassword);
router.post("/reset-password", resetPassword);

module.exports = router;