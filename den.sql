-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: May 29, 2020 at 09:19 PM
-- Server version: 8.0.18
-- PHP Version: 7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `den`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `email`, `password`) VALUES
(1, 'denisse@gmail.com', '123456'),
(2, 'admin@admin.com', 'admin1');

-- --------------------------------------------------------

--
-- Table structure for table `clonehistory_clone`
--

DROP TABLE IF EXISTS `clonehistory_clone`;
CREATE TABLE IF NOT EXISTS `clonehistory_clone` (
  `email` varchar(50) NOT NULL,
  `eid` text NOT NULL,
  `asistencia` int(11) NOT NULL,
  `invitados_adicionales` int(11) NOT NULL,
  `S0` varchar(255) DEFAULT NULL,
  `S1` varchar(255) DEFAULT NULL,
  `S2` varchar(255) DEFAULT NULL,
  `S3` varchar(255) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clonehistory_clone`
--

INSERT INTO `clonehistory_clone` (`email`, `eid`, `asistencia`, `invitados_adicionales`, `S0`, `S1`, `S2`, `S3`) VALUES
('lupita', 'asdkjg51ap', 0, 0, '0.34', '0', '0', '0'),
('lupita', 'asdkjg51ap', 0, 0, '0.34', '0', '0', '0'),
('lupita', 'asdkjg51ap', 0, 0, '0.34', '0', '0', '0'),
('lupita', 'asdkjg51ap', 0, 0, '0.34', '0', '0', '0'),
('lupita', 'asdkjg51ap', 0, 0, '0.34', '0', '0', '0'),
('den', 'kmasa873m', 0, 0, '0.34', '0', '1.02', '0'),
('den', 'kmasa873m', 0, 0, '0.34', '0', '1.02', '0');

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

DROP TABLE IF EXISTS `data`;
CREATE TABLE IF NOT EXISTS `data` (
  `email` varchar(50) NOT NULL,
  `eid` text NOT NULL,
  `asistencia` int(11) NOT NULL,
  `invitados_adicionales` int(11) NOT NULL,
  `S0` varchar(255) DEFAULT NULL,
  `S1` varchar(255) DEFAULT NULL,
  `S2` varchar(255) DEFAULT NULL,
  `S3` varchar(255) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `data`
--

INSERT INTO `data` (`email`, `eid`, `asistencia`, `invitados_adicionales`, `S0`, `S1`, `S2`, `S3`) VALUES
('den', 'kmasa873m', 0, 0, '0.34', '0', '1.02', '0'),
('den', 'kmasa873m', 0, 0, '0.34', '0', '1.02', '0'),
('lupita', 'asdkjg51ap', 1, 0, '1', '', '', ''),
('lupita', 'asdkjg51ap', 0, 0, '0', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
CREATE TABLE IF NOT EXISTS `options` (
  `qid` varchar(50) NOT NULL,
  `option` varchar(5000) NOT NULL,
  `optionid` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`qid`, `option`, `optionid`) VALUES
('asdkjg51ap', 'Sí', '1'),
('asdkjg51ap', 'No', '0'),
('asdm501', 'Sí', '1'),
('asdm501', 'No', '0'),
('asdm502', 'Ninguno', '0'),
('asdm502', '1', '1'),
('asdm502', '2', '2'),
('asdm502', '3', '3'),
('asdm503', '', '1');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `eid` text NOT NULL,
  `qid` text NOT NULL,
  `qns` text NOT NULL,
  `choice` int(10) NOT NULL,
  `sn` int(11) NOT NULL,
  `part` int(5) NOT NULL,
  `ciclo` int(2) DEFAULT NULL,
  `hanger` text,
  `type_score` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`eid`, `qid`, `qns`, `choice`, `sn`, `part`, `ciclo`, `hanger`, `type_score`) VALUES
('asdkjg51ap', '34kb241', '¿Podrás asistir?', 2, 1, 1, 1, NULL, 1),
('kmasa873m', 'asdm501', '¿Podrás asistir?', 2, 1, 1, 2, NULL, 1),
('kmasa873m', 'asdm502', 'Selecciona cuántas personas te acompañarán', 4, 2, 2, 2, NULL, 1),
('kmasa873m', 'asdm503', 'Ingresa sus nombres', 1, 3, 2, 2, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
CREATE TABLE IF NOT EXISTS `quiz` (
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `eid` text NOT NULL,
  `total` int(11) NOT NULL DEFAULT '1',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`email`, `eid`, `total`, `description`) VALUES
('lupita', 'asdkjg51ap', 1, 'Clave eid para invitados sin acompanantes'),
('den', 'kmasa873m', 4, 'Usar respectivo eid cuando pueden asistar +1 perso');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `company` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`company`, `email`, `password`) VALUES
('none', 'lupita', 'e10adc3949ba59abbe56e057f20f883e');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
