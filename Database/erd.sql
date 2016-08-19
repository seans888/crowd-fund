-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2016 at 05:04 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crowdfund`
--

-- --------------------------------------------------------

--
-- Table structure for table `donor`
--

CREATE TABLE `donor` (
  `id` int(11) NOT NULL,
  `donor_fname` varchar(45) NOT NULL,
  `donor_lname` varchar(45) NOT NULL,
  `donor_address` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `donor`
--

INSERT INTO `donor` (`id`, `donor_fname`, `donor_lname`, `donor_address`) VALUES
(1, 'Daren', 'Cabral', 'Makati City');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `donor`
--
ALTER TABLE `donor`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `donor`
--
ALTER TABLE `donor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
