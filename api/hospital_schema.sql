CREATE DATABASE hospital_database;
USE hospital_database;

CREATE TABLE doctors(
    doctor_id integer primary key AUTO_INCREMENT,
    doctor_name VARCHAR(255) NOT NULL,
    doctor_mail VARCHAR(255) NOT NULL,
    doctor_password VARCHAR(30) NOT NULL,
    doctor_photo BLOB,
    doctor_gender VARCHAR(50) NOT NULL;
    doctor_dicipline VARCHAR(255) NOT NULL,
    doctor_mastery_1 VARCHAR(255) NOT NULL,
    doctor_mastery_2 VARCHAR(255),
    doctor_mastery_3 VARCHAR(255),
    doctor_graduate VARCHAR(255) NOT NULL,
    doctor_workplace VARCHAR(255) NOT NULL,
    doctor_online BOOLEAN NOT NULL,
);

CREATE TABLE patients(
    patient_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    patient_name VARCHAR(255) NOT NULL,
    patient_mail VARCHAR(255) NOT NULL,
    patient_password VARCHAR(30) NOT NULL,
    patient_gender VARCHAR(50) NOT NULL,
    patient_photo BLOB,
    patient_online BOOLEAN NOT NULL,
);

CREATE TABLE message(
    message_to VARCHAR(255) NOT NULL,
    message_from VARCHAR(255) NOT NULL,
    message_content TEXT NOT NULL,
    message_media BLOB,
    message_date TIMESTAMP NOT NULL DEFAULT NOW(),
);

