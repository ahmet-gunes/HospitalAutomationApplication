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
    return "muz"
}

async function getDoctor(email, pass){
    const [rows] = await pool.query("SELECT * FROM doctor WHERE doctorMail = ? AND doctorPassword = ?", [email, pass])
    return rows[0]
}

async function setDoctor(name, mail, pass, photo, gender, disc, mastery1, mastery2, mastery3, graduate, workplace, online) {
    const [rows] = await pool.query("INSERT INTO doctor(doctorName, doctorMail, doctorPassword, doctorPhoto, doctorGender, doctorDiscipline, doctorMastery1, doctorMastery2, doctorMastery3, doctorGraduate, doctorWorkplace, doctorOnline )VALUES (?,?,?,?,?,?,?,?,?,?,?,?)" ,[name, mail, pass, photo, gender, disc, mastery1, mastery2, mastery3, graduate, workplace, online])
    return rows
}

//const kayit = await setDoctor('ahmet', 'ahmet@gmail.com', 5553, null, 'erkek', 'dermatoloji', 'cilt kanseri', null, null, 'karadeniz teknik universitesi', 'cayeli devlet hastanes', 0)
const item = await getDoctors()
//const doctor = await getDoctor("ahmet@hotmail.com", "5553")


//console.log(kayit)
console.log(item)

