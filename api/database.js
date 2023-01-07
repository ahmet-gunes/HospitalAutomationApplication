import mysql from 'mysql2'

import dotenv from 'dotenv'

dotenv.config()

const pool = mysql.createPool({
    host: process.env.MY_HOST,
    user: process.env.MY_USER,
    password: process.env.MY_PASSWORD,
    database: process.env.MY_DATABASE
}).promise()

async function getDoctors(){
    const [rows] = await pool.query("SELECT * FROM doctor")
    return rows
}

async function getDoctor(email, pass){
    const [rows] = await pool.query("SELECT * FROM doctor WHERE doctorMail = ? AND doctorPassword = ?", [email, pass])
    return rows
}

const item = await getDoctors()
const doctor = await getDoctor("metehan@gmail.com", "1234")


console.log(doctor)