import mysql from 'mysql2'

import dotenv from 'dotenv'
import { text } from 'express'

dotenv.config()

const pool = mysql.createPool({
    host: process.env.MY_HOST,
    user: process.env.MY_USER,
    password: process.env.MY_PASSWORD,
    database: process.env.MY_DATABASE
}).promise()

export async function getDoctors(){
    const [rows] = await pool.query("SELECT * FROM doctor")
    return rows
}

export async function getPatients(){
    const [rows] = await pool.query("SELECT * FROM patient")
    return rows
}

export async function getDoctor(mail, pass){
    const [rows] = await pool.query("SELECT * FROM doctor WHERE doctorMail = ? AND doctorPassword = ?", [mail, pass])
    return rows[0]
}

export async function getDoctorByID(id){
    const [rows] = await pool.query("SELECT * FROM doctor WHERE doctorID = ?", [id])
    return rows
}

export async function getPatient(mail, pass){
    const [rows] = await pool.query("SELECT * FROM patient WHERE PatientMail = ? AND PatientPassword = ?", [mail, pass])
    return rows[0]
}

export async function getPatientByID(id){
    const [rows] = await pool.query("SELECT * FROM patient WHERE PatientID = ?", [id])
    return rows
}

export async function getMessages(sender,reciever){
    const [rows] = await pool.query("SELECT * FROM message Where((messageSender =? AND messageReciever =?) OR (messageReciever =? AND messageSender =?)) ORDER BY messageDate ASC",[sender,reciever,sender,reciever])
    return rows
}

export async function setDoctor(name, mail, pass, photo, gender, disc, mastery1, graduate, workplace, online) {
    const [rows] = await pool.query("INSERT INTO doctor(doctorName, doctorMail, doctorPassword, doctorPhoto, doctorGender, doctorDiscipline, doctorMastery1, doctorGraduate, doctorWorkplace, doctorOnline )VALUES (?,?,?,?,?,?,?,?,?,?)" ,[name, mail, pass, photo, gender, disc, mastery1, graduate, workplace, online])
    return rows
}

export async function setPatient(name, mail, pass, photo, gender, online) {
    const [rows] = await pool.query("INSERT INTO patient(PatientName, PatientMail, PatientPassword, PatientPhoto, PatientGender, PatientOnline)VALUES (?,?,?,?,?,?)" ,[name, mail, pass, photo, gender, online])
    return rows
}

export async function setMessage(sender, sname , reciever, content, media) {
    const [rows] = await pool.query("INSERT INTO message(messageSender, SenderName, messageReciever, messageText,messageMedia) VALUES (?,?,?,?,?)" ,[sender, sname, reciever, content, media])
    return rows
}

export async function updatePatient(name, pass, ID) {
    const [rows] = await pool.query("UPDATE patient SET PatientName = ?, PatientPassword = ? WHERE PatientID = ?", [name, pass,ID])
    return rows
}

export async function updateDoctor(name, pass, workplace ,graduate, disc, mastery1, ID) {
    const [rows] = await pool.query("UPDATE doctor SET doctorName = ?, doctorPassword = ?, doctorWorkplace = ?, doctorGraduate = ?, doctorDiscipline = ?, doctorMastery1 = ? WHERE doctorID = ?", [name, pass, workplace, graduate, disc, mastery1,ID])
    return rows
}
export async function doctorOnlineStatus(status, mail, pass) {
    const [rows] = await pool.query("UPDATE doctor SET doctorOnline = ? WHERE (doctorMail = ? AND doctorPassword = ?)", [status, mail, pass])
    return getDoctor(mail, pass)
}