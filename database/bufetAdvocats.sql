-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 21, 2016 at 09:11 AM
-- Server version: 5.5.42
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bufetAdvocats`
--
CREATE DATABASE IF NOT EXISTS `bufetAdvocats` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `bufetAdvocats`;

-- --------------------------------------------------------

--
-- Table structure for table `advocats`
--

CREATE TABLE IF NOT EXISTS `advocats` (
  `idAdvocat` int(10) NOT NULL,
  `especialitat` int(20) NOT NULL,
  `nomAdvocat` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `cognomsAdvocat` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `telefonAdvocat` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `despatx` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `advocats`
--

INSERT INTO `advocats` (`idAdvocat`, `especialitat`, `nomAdvocat`, `cognomsAdvocat`, `telefonAdvocat`, `despatx`) VALUES
(1, 1, 'Juan', 'Sanched Lopez', '935672563', '23'),
(2, 2, 'Maite', 'Perez Narvaez', '935679988', '4'),
(3, 3, 'Joaquim', 'Trujillo Navarro', '935673425', '42'),
(4, 4, 'Jose', 'Urruti Lopez', '935674422', '5'),
(5, 1, 'Julia', 'Sanched Sanchez', '935672563', '11'),
(6, 1, 'Berta', 'Adell Mata', '935679988', '52'),
(7, 3, 'Anna', 'Perelló Anglada', '935676223', '16'),
(8, 4, 'Marta', 'Sanchez Elias', '935674125', '8'),
(9, 3, 'Carlota', 'Mendez Rivas', '935178222', '13');

-- --------------------------------------------------------

--
-- Table structure for table `cites`
--

CREATE TABLE IF NOT EXISTS `cites` (
  `idCita` int(10) NOT NULL,
  `nomClient` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `cognom1Client` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `cognom2Client` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `idAdvocat` int(11) NOT NULL,
  `data` date NOT NULL,
  `realitzada` int(1) NOT NULL,
  `dataAssignacio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `especialitats`
--

CREATE TABLE IF NOT EXISTS `especialitats` (
  `idEspecialitat` int(20) NOT NULL,
  `especialitat` varchar(20) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `especialitats`
--

INSERT INTO `especialitats` (`idEspecialitat`, `especialitat`) VALUES
(1, 'Laboral'),
(2, 'Civil'),
(3, 'Penal'),
(4, 'Familia'),
(5, 'Altres');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advocats`
--
ALTER TABLE `advocats`
  ADD PRIMARY KEY (`idAdvocat`),
  ADD KEY `especialitat` (`especialitat`);

--
-- Indexes for table `cites`
--
ALTER TABLE `cites`
  ADD PRIMARY KEY (`idCita`),
  ADD KEY `idAdvocat` (`idAdvocat`);

--
-- Indexes for table `especialitats`
--
ALTER TABLE `especialitats`
  ADD PRIMARY KEY (`idEspecialitat`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advocats`
--
ALTER TABLE `advocats`
  MODIFY `idAdvocat` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `cites`
--
ALTER TABLE `cites`
  MODIFY `idCita` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `especialitats`
--
ALTER TABLE `especialitats`
  MODIFY `idEspecialitat` int(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `advocats`
--
ALTER TABLE `advocats`
  ADD CONSTRAINT `fkEspecialitat` FOREIGN KEY (`especialitat`) REFERENCES `especialitats` (`idEspecialitat`);

--
-- Constraints for table `cites`
--
ALTER TABLE `cites`
  ADD CONSTRAINT `fkAdvocat` FOREIGN KEY (`idAdvocat`) REFERENCES `advocats` (`idAdvocat`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
