-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 26, 2020 at 09:20 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dezzex`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE `tbl_login` (
  `Id` int(5) NOT NULL,
  `Username` text NOT NULL,
  `Password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`Id`, `Username`, `Password`) VALUES
(1, '8018792445', '8018792445'),
(2, '8018792446', '8018792446'),
(3, '8018792442', '8018792442'),
(4, '1234567890', '1234567890'),
(5, '1234567891', '1234567891');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `Id` int(5) NOT NULL,
  `Full_name` varchar(50) NOT NULL,
  `Date_of_birth` text NOT NULL,
  `Mobile_number` varchar(10) NOT NULL,
  `Email` text NOT NULL,
  `Passport_number` int(20) NOT NULL,
  `Reg_time` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`Id`, `Full_name`, `Date_of_birth`, `Mobile_number`, `Email`, `Passport_number`, `Reg_time`) VALUES
(2, 'surjendu', '2000-04-03', '2147483647', 'abc@gmail.com', 46456343, '2020-07-23 15:01:08.916878'),
(3, 'surjendu', '2000-04-03', '2147483647', 'abc@gmail.com', 46456343, '2020-07-23 15:02:19.458295'),
(4, 'surjendu1', '2000-05-04', '2147483647', 'abc@gmail.com', 46456343, '2020-07-23 15:05:01.960875'),
(5, 'surjendu2', '2001-04-03', '2147483647', 'abc@gmail.com', 46456343, '2020-07-23 15:09:14.382259'),
(6, 'surjendu', '2005-04-03', '8018792444', 'abc@gmail.com', 46456343, '2020-07-23 15:11:19.895860'),
(7, 'surjendu123', '2001-04-03', '8018792445', 'abc@gmail.com', 46456343, '2020-07-23 16:00:08.883674'),
(8, 'surjendu123', '2000-04-03', '8018792446', 'abc@gmail.com', 46456343, '2020-07-24 14:06:22.258260'),
(9, 'Surjendu Panigrahi', '2000-04-03', '8018792442', 'surjendupanigrahi@gmail.com', 46456343, '2020-07-26 11:26:19.668941'),
(10, 'Surjendu Panigrahi', '2000-04-03', '1234567890', 'surjendupanigrahi@gmail.com', 451166548, '2020-07-26 11:39:39.755946'),
(11, 'Surjendu Panigrahi', '2000-04-03', '1234567891', 'surjendupanigrahi@gmail.com', 46456343, '2020-07-26 11:53:55.107841');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_login`
--
ALTER TABLE `tbl_login`
  MODIFY `Id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `Id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
