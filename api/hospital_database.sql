-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 11 Oca 2023, 12:25:16
-- Sunucu sürümü: 5.7.36
-- PHP Sürümü: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `hospital_database`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `doctor`
--

DROP TABLE IF EXISTS `doctor`;
CREATE TABLE IF NOT EXISTS `doctor` (
  `doctorID` int(10) NOT NULL AUTO_INCREMENT,
  `doctorName` varchar(50) COLLATE utf16_turkish_ci NOT NULL,
  `doctorMail` varchar(50) COLLATE utf16_turkish_ci NOT NULL,
  `doctorPassword` int(8) NOT NULL,
  `doctorPhoto` mediumblob,
  `doctorGender` varchar(50) COLLATE utf16_turkish_ci NOT NULL,
  `doctorDiscipline` varchar(50) COLLATE utf16_turkish_ci NOT NULL,
  `doctorMastery1` varchar(50) COLLATE utf16_turkish_ci NOT NULL,
  `doctorMastery2` varchar(50) COLLATE utf16_turkish_ci DEFAULT NULL,
  `doctorMastery3` varchar(50) COLLATE utf16_turkish_ci DEFAULT NULL,
  `doctorGraduate` varchar(50) COLLATE utf16_turkish_ci NOT NULL,
  `doctorWorkplace` varchar(50) COLLATE utf16_turkish_ci NOT NULL,
  `doctorOnline` tinyint(1) NOT NULL,
  PRIMARY KEY (`doctorID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf16 COLLATE=utf16_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `messageReciever` int(10) NOT NULL,
  `messageSender` int(10) NOT NULL,
  `messageText` varchar(500) COLLATE utf16_turkish_ci DEFAULT NULL,
  `messageMedia` mediumblob,
  `messageDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf16 COLLATE=utf16_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `PatientID` int(10) NOT NULL AUTO_INCREMENT,
  `PatientMail` varchar(50) COLLATE utf16_turkish_ci NOT NULL,
  `PatientPassword` int(8) NOT NULL,
  `PatientName` varchar(50) COLLATE utf16_turkish_ci NOT NULL,
  `PatientGender` varchar(50) COLLATE utf16_turkish_ci NOT NULL,
  `PatientPhoto` mediumblob,
  `PatientOnline` tinyint(1) NOT NULL,
  PRIMARY KEY (`PatientID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf16 COLLATE=utf16_turkish_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
