const mysql = require('mysql');
const dotenv = require('dotenv');

dotenv.config();
console.log(process.env.PASSWORD)
const db = mysql.createConnection({
    host: process.env.HOST,
    user: process.env.USER,
    password: process.env.PASSWORD,
    database: process.env.DATABASE,
})

db.connect((err) => {
    if (err) {
      console.error("Error connecting to db1:", err);
    } else {
      console.log("Databse conected sucessfully..");
    }
  });

  module.exports = { db };
