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

export async function getDoctor(email, pass){
    const [rows] = await pool.query("SELECT * FROM doctor WHERE doctorMail = ? AND doctorPassword = ?", [email, pass])
    return rows[0]
}

export async function getPatient(email, pass){
    const [rows] = await pool.query("SELECT * FROM patient WHERE PatientMail = ? AND PatientPassword = ?", [email, pass])
    return rows[0]
}

export async function getMessages(sender,reciever){
    const [rows] = await pool.query("SELECT * FROM message Where((messageSender =? AND messageReciever =?) OR (messageReciever =? AND messageSender =?)) ORDER BY messageDate ASC",[sender,reciever,sender,reciever])
    return rows
}

export async function setDoctor(name, mail, pass, photo, gender, disc, mastery1, mastery2, mastery3, graduate, workplace, online) {
    const [rows] = await pool.query("INSERT INTO doctor(doctorName, doctorMail, doctorPassword, doctorPhoto, doctorGender, doctorDiscipline, doctorMastery1, doctorMastery2, doctorMastery3, doctorGraduate, doctorWorkplace, doctorOnline )VALUES (?,?,?,?,?,?,?,?,?,?,?,?)" ,[name, mail, pass, photo, gender, disc, mastery1, mastery2, mastery3, graduate, workplace, online])
    return rows
}

export async function setPatient(name, mail, pass, photo, gender, online) {
    const [rows] = await pool.query("INSERT INTO patient(PatientName, PatientMail, PatientPassword, PatientPhoto, PatientGender, PatientOnline)VALUES (?,?,?,?,?,?)" ,[name, mail, pass, photo, gender, online])
    return rows
}

export async function setMessage(sender, reciever, content, media) {
    const [rows] = await pool.query("INSERT INTO message(messageSender, messageReciever, messageText,messageMedia) VALUES (?,?,?,?)" ,[sender,reciever, content, media])
    return rows
}