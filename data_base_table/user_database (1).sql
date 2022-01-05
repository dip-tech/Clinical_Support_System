-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2020 at 06:20 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `user_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ADMIN_ID` varchar(20) NOT NULL,
  `PASS` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ADMIN_ID`, `PASS`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `app_info`
--

CREATE TABLE `app_info` (
  `LOGIN_EMAIL` varchar(40) NOT NULL,
  `PNAME` varchar(40) NOT NULL,
  `PEMAIL` varchar(40) NOT NULL,
  `PMOBILE` varchar(10) NOT NULL,
  `DNAME` varchar(40) NOT NULL,
  `DEMAIL` varchar(40) NOT NULL,
  `DMOBILE` varchar(10) NOT NULL,
  `DSP` varchar(40) NOT NULL,
  `ATIME` varchar(20) NOT NULL,
  `STATUS` varchar(20) NOT NULL,
  `ADAY` varchar(20) NOT NULL,
  `AMONTH` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `doc_info`
--

CREATE TABLE `doc_info` (
  `LICENSE_KEY` varchar(10) NOT NULL,
  `NAME` varchar(30) NOT NULL,
  `MOBILE` varchar(10) NOT NULL,
  `EMAIL` varchar(40) NOT NULL,
  `GENDER` varchar(10) NOT NULL,
  `ADDRESS` varchar(100) NOT NULL,
  `DISTRICT` varchar(40) NOT NULL,
  `STATE` varchar(30) NOT NULL,
  `SPECIALIZATION` varchar(30) NOT NULL,
  `EB` varchar(20) NOT NULL,
  `STATUS` varchar(20) NOT NULL,
  `APP_DAY` varchar(30) NOT NULL,
  `APP_TIME` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doc_info`
--

INSERT INTO `doc_info` (`LICENSE_KEY`, `NAME`, `MOBILE`, `EMAIL`, `GENDER`, `ADDRESS`, `DISTRICT`, `STATE`, `SPECIALIZATION`, `EB`, `STATUS`, `APP_DAY`, `APP_TIME`) VALUES
('DOC-0001', 'Dr S.Bose', '9758887677', 'bose@gmail.com', 'Male', '100/100 Tara Maa Apartment,Chinarpark', 'South 24 Parganas district', 'West Bengal', 'Dentist', 'BDS', 'Verified', '1st Saturday', '10:00-17:00'),
('DOC-0002', 'Dr. Arnab Mondal', '9732553442', 'mondal@gmail.com', 'Male', 'Baikunthapur,Daspur,Sankarpur,', 'Paschim Medinipur district', 'West Bengal', 'Dentist', 'BDS', 'Verified', '1st Monday', '16:00-20:00');

-- --------------------------------------------------------

--
-- Table structure for table `doc_login`
--

CREATE TABLE `doc_login` (
  `LICENSE_KEY` varchar(10) NOT NULL,
  `EMAIL` varchar(40) NOT NULL,
  `PASSWORD` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doc_login`
--

INSERT INTO `doc_login` (`LICENSE_KEY`, `EMAIL`, `PASSWORD`) VALUES
('DOC-0001', 'bose@gmail.com', 'doc123'),
('DOC-0002', 'mondal@gmail.com', 'doc123');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `NAME` varchar(30) NOT NULL,
  `MOBILE` varchar(10) NOT NULL,
  `EMAIL` varchar(40) NOT NULL,
  `GENDER` varchar(10) NOT NULL,
  `DOB` date NOT NULL,
  `ADDRESS` varchar(100) NOT NULL,
  `CITY` varchar(30) NOT NULL,
  `STATE` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_login`
--

CREATE TABLE `user_login` (
  `MOBILE` varchar(10) NOT NULL,
  `EMAIL` varchar(40) NOT NULL,
  `PASSWORD` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ADMIN_ID`);

--
-- Indexes for table `app_info`
--
ALTER TABLE `app_info`
  ADD PRIMARY KEY (`PEMAIL`,`DEMAIL`);

--
-- Indexes for table `doc_info`
--
ALTER TABLE `doc_info`
  ADD PRIMARY KEY (`LICENSE_KEY`,`EMAIL`);

--
-- Indexes for table `doc_login`
--
ALTER TABLE `doc_login`
  ADD KEY `LICENSE_KEY` (`LICENSE_KEY`,`EMAIL`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`MOBILE`,`EMAIL`);

--
-- Indexes for table `user_login`
--
ALTER TABLE `user_login`
  ADD KEY `MOBILE` (`MOBILE`,`EMAIL`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `doc_login`
--
ALTER TABLE `doc_login`
  ADD CONSTRAINT `doc_login_ibfk_1` FOREIGN KEY (`LICENSE_KEY`,`EMAIL`) REFERENCES `doc_info` (`LICENSE_KEY`, `EMAIL`);

--
-- Constraints for table `user_login`
--
ALTER TABLE `user_login`
  ADD CONSTRAINT `user_login_ibfk_1` FOREIGN KEY (`MOBILE`,`EMAIL`) REFERENCES `user_info` (`MOBILE`, `EMAIL`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
