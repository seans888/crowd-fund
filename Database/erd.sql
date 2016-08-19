-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2016 at 05:07 AM
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
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `admin_name` varchar(45) NOT NULL,
  `admin_role` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `admin_name`, `admin_role`) VALUES
(1, 'Jordan', 'Leader');

-- --------------------------------------------------------

--
-- Table structure for table `admin_has_project`
--

CREATE TABLE `admin_has_project` (
  `id` varchar(45) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `admin_has_report`
--

CREATE TABLE `admin_has_report` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `report_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign`
--

CREATE TABLE `campaign` (
  `id` int(11) NOT NULL,
  `campaign_name` varchar(45) NOT NULL,
  `campaign_type` varchar(45) NOT NULL,
  `donor_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Table structure for table `donor_has_requirements`
--

CREATE TABLE `donor_has_requirements` (
  `id` varchar(45) NOT NULL,
  `donor_id` int(11) NOT NULL,
  `requirements_id` int(11) NOT NULL,
  `amount_donate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `report_Id` int(11) NOT NULL,
  `expenses_report` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1471574188);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `id` int(11) NOT NULL,
  `project_name` varchar(45) NOT NULL,
  `project_objective` varchar(45) NOT NULL,
  `started_date` date NOT NULL,
  `duration` varchar(45) NOT NULL,
  `cost` varchar(45) NOT NULL,
  `fund_resources` varchar(45) NOT NULL,
  `people_involve` varchar(45) NOT NULL,
  `beneficiaries` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_has_campaign`
--

CREATE TABLE `project_has_campaign` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `id` int(11) NOT NULL,
  `report_type` varchar(45) NOT NULL,
  `project_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `requirements`
--

CREATE TABLE `requirements` (
  `id` int(11) NOT NULL,
  `requirements_type` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `requirements_has_project`
--

CREATE TABLE `requirements_has_project` (
  `id` int(11) NOT NULL,
  `requirements_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_has_project`
--
ALTER TABLE `admin_has_project`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Admin_has_Project_Project1_idx` (`project_id`),
  ADD KEY `fk_Admin_has_Project_Admin1_idx` (`admin_id`);

--
-- Indexes for table `admin_has_report`
--
ALTER TABLE `admin_has_report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Admin_has_Report_Report1_idx` (`report_Id`),
  ADD KEY `fk_Admin_has_Report_Admin1_idx` (`admin_id`);

--
-- Indexes for table `campaign`
--
ALTER TABLE `campaign`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Campaign_Donor1_idx` (`donor_Id`);

--
-- Indexes for table `donor`
--
ALTER TABLE `donor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donor_has_requirements`
--
ALTER TABLE `donor_has_requirements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Donor_has_Requirements_Requirements1_idx` (`requirements_id`),
  ADD KEY `fk_Donor_has_Requirements_Donor1_idx` (`donor_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Expenses_Report1_idx` (`report_Id`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_has_campaign`
--
ALTER TABLE `project_has_campaign`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Project_has_Campaign_Campaign1_idx` (`campaign_id`),
  ADD KEY `fk_Project_has_Campaign_Project1_idx` (`project_id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Report_Project1_idx` (`project_Id`);

--
-- Indexes for table `requirements`
--
ALTER TABLE `requirements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requirements_has_project`
--
ALTER TABLE `requirements_has_project`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Requirements_has_Project_Project1_idx` (`project_id`),
  ADD KEY `fk_Requirements_has_Project_Requirements_idx` (`requirements_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `admin_has_report`
--
ALTER TABLE `admin_has_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `campaign`
--
ALTER TABLE `campaign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `donor`
--
ALTER TABLE `donor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project_has_campaign`
--
ALTER TABLE `project_has_campaign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `requirements`
--
ALTER TABLE `requirements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `requirements_has_project`
--
ALTER TABLE `requirements_has_project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_has_project`
--
ALTER TABLE `admin_has_project`
  ADD CONSTRAINT `fk_Admin_has_Project_Admin1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Admin_has_Project_Project1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `admin_has_report`
--
ALTER TABLE `admin_has_report`
  ADD CONSTRAINT `fk_Admin_has_Report_Admin1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Admin_has_Report_Report1` FOREIGN KEY (`report_Id`) REFERENCES `report` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `campaign`
--
ALTER TABLE `campaign`
  ADD CONSTRAINT `fk_Campaign_Donor1` FOREIGN KEY (`donor_Id`) REFERENCES `donor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `donor_has_requirements`
--
ALTER TABLE `donor_has_requirements`
  ADD CONSTRAINT `fk_Donor_has_Requirements_Donor1` FOREIGN KEY (`donor_id`) REFERENCES `donor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Donor_has_Requirements_Requirements1` FOREIGN KEY (`requirements_id`) REFERENCES `requirements` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `fk_Expenses_Report1` FOREIGN KEY (`report_Id`) REFERENCES `report` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `project_has_campaign`
--
ALTER TABLE `project_has_campaign`
  ADD CONSTRAINT `fk_Project_has_Campaign_Campaign1` FOREIGN KEY (`campaign_id`) REFERENCES `campaign` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Project_has_Campaign_Project1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `fk_Report_Project1` FOREIGN KEY (`project_Id`) REFERENCES `project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `requirements_has_project`
--
ALTER TABLE `requirements_has_project`
  ADD CONSTRAINT `fk_Requirements_has_Project_Project1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Requirements_has_Project_Requirements` FOREIGN KEY (`requirements_id`) REFERENCES `requirements` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
