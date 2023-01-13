-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 13 Oca 2023, 13:39:26
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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf16 COLLATE=utf16_turkish_ci;

--
-- Tablo döküm verisi `doctor`
--

INSERT INTO `doctor` (`doctorID`, `doctorName`, `doctorMail`, `doctorPassword`, `doctorPhoto`, `doctorGender`, `doctorDiscipline`, `doctorMastery1`, `doctorMastery2`, `doctorMastery3`, `doctorGraduate`, `doctorWorkplace`, `doctorOnline`) VALUES
(5, 'halil', 'halil@gmail.com', 1212, NULL, 'erkek gibi erkek', 'erkek doktoru', 'testesteron üreticisi', NULL, NULL, 'kısmetse olur', 'ağrı', 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `messageReciever` int(10) NOT NULL,
  `messageSender` int(10) NOT NULL,
  `SenderName` varchar(100) COLLATE utf16_turkish_ci NOT NULL,
  `messageText` varchar(500) COLLATE utf16_turkish_ci DEFAULT NULL,
  `messageMedia` mediumblob,
  `messageDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf16 COLLATE=utf16_turkish_ci;

--
-- Tablo döküm verisi `message`
--

INSERT INTO `message` (`messageReciever`, `messageSender`, `SenderName`, `messageText`, `messageMedia`, `messageDate`) VALUES
(5, 1, 'Zeyd', 'SELAM', NULL, '2023-01-13 16:25:45'),
(5, 1, 'zeyd', 'eyw', NULL, '2023-01-13 16:37:08'),
(5, 1, 'zeyd', 'naber', NULL, '2023-01-13 16:37:17'),
(1, 5, 'halil', 'zort', NULL, '2023-01-13 16:37:28');

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf16 COLLATE=utf16_turkish_ci;

--
-- Tablo döküm verisi `patient`
--

INSERT INTO `patient` (`PatientID`, `PatientMail`, `PatientPassword`, `PatientName`, `PatientGender`, `PatientPhoto`, `PatientOnline`) VALUES
(1, 'zeyd@gmail.com', 3131, 'Zeyd', 'Zeyd', NULL, 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
