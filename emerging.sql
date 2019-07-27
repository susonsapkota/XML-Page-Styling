-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 27, 2019 at 04:42 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `emerging`
--

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `data` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `name`, `data`) VALUES
(1, 'logo', ' '),
(2, 'name', 'WaveTech Solutions'),
(3, 'address', 'Gyaneshor,10.Kathmandu'),
(4, 'CEO', 'Nischal Man Pradhan');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `department_name` varchar(200) NOT NULL,
  `post` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `department_name`, `post`, `name`) VALUES
(1, 'finance', 'vice_president_finance', 'Hari Man Pradhan'),
(2, 'finance', 'accounting', 'Bhaskar Gyawali'),
(3, 'finance', 'treasury', 'Abhishek Dangol'),
(4, 'HR', 'vice_president_HR', 'Alok Pandey'),
(5, 'HR', 'operation_and_recruitment', 'Ashok Koirala'),
(6, 'HR', 'staff_development', 'Prabhat Ligal'),
(7, 'marketing', 'vice_president_marketing', 'Naresh Man Pradhan'),
(8, 'marketing', 'customer_service', 'Sudarshan Gora'),
(9, 'marketing', 'sales', 'Aayush Bati'),
(10, 'research_and_development', 'vice_president_RandD', 'Bipana Shahi'),
(11, 'research_and_development', 'research', 'Kamal Bhattarai'),
(12, 'research_and_development', 'develop', 'Kamlesh Dohi');

-- --------------------------------------------------------

--
-- Table structure for table `development`
--

CREATE TABLE `development` (
  `id` int(11) NOT NULL,
  `development_type` varchar(200) NOT NULL,
  `project_manager` varchar(200) NOT NULL,
  `team_id` int(11) NOT NULL,
  `project_id` varchar(200) DEFAULT NULL,
  `post` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `development`
--

INSERT INTO `development` (`id`, `development_type`, `project_manager`, `team_id`, `project_id`, `post`, `name`) VALUES
(1, 'web_development', 'Rohit Man Shrestha', 1, 'proj01', 'manager', 'Sandesh Karmacharya'),
(2, 'web_development', 'Rohit Man Shrestha', 1, 'proj01', 'developer', 'Prerana Tamrakar'),
(3, 'web_development', 'Rohit Man Shrestha', 1, 'proj01', 'developer', 'Degendra Sivakoti'),
(4, 'web_development', 'Rohit Man Shrestha', 1, 'proj01', 'intern', 'Binod Shrestha'),
(5, 'web_development', 'Rohit Man Shrestha', 2, NULL, 'manager', 'Ram Prashad Rai'),
(6, 'web_development', 'Rohit Man Shrestha', 2, NULL, 'developer', 'Kapil Devkota'),
(7, 'web_development', 'Rohit Man Shrestha', 2, NULL, 'developer', 'Rajesh Shah'),
(8, 'web_development', 'Rohit Man Shrestha', 2, NULL, 'developer', 'Surya Subba'),
(9, 'web_development', 'Rohit Man Shrestha', 2, NULL, 'developer', 'Ankur Maharjan'),
(10, 'web_development', 'Rohit Man Shrestha', 3, 'proj02', 'manager', 'Sujan Subedi'),
(11, 'web_development', 'Rohit Man Shrestha', 3, 'proj02', 'developer', 'Ajaya Karki'),
(12, 'web_development', 'Rohit Man Shrestha', 3, 'proj02', 'developer', 'Aayush Shrestha'),
(13, 'web_development', 'Rohit Man Shrestha', 3, 'proj02', 'developer', 'Sabin Pudasaini'),
(14, 'web_development', 'Rohit Man Shrestha', 3, 'proj02', 'developer', 'Pradip Mandal'),
(15, 'web_development', 'Rohit Man Shrestha', 3, 'proj02', 'developer', 'Ramesh Shuwal'),
(16, 'web_development', 'Rohit Man Shrestha', 3, 'proj02', 'intern', 'Sushant Koirala'),
(17, 'mobile_development', 'Mahesh Pandey', 1, 'proj02', 'manager', 'Dinesh Kafle'),
(18, 'mobile_development', 'Mahesh Pandey', 1, 'proj02', 'developer', 'Laxman KC'),
(19, 'mobile_development', 'Mahesh Pandey', 1, 'proj02', 'developer', 'Prakash Gautam'),
(20, 'mobile_development', 'Mahesh Pandey', 1, 'proj02', 'developer', 'Amit Sharma'),
(21, 'mobile_development', 'Mahesh Pandey', 2, NULL, 'manager', 'Binit Koirala'),
(22, 'mobile_development', 'Mahesh Pandey', 2, NULL, 'developer', 'Raju Mandal'),
(23, 'mobile_development', 'Mahesh Pandey', 2, NULL, 'developer', 'Bimal Bhattarai'),
(24, 'mobile_development', 'Mahesh Pandey', 3, NULL, 'manager', 'Aayush Raj Sahi'),
(25, 'mobile_development', 'Mahesh Pandey', 3, NULL, 'developer', 'Ganesh Acharya'),
(26, 'mobile_development', 'Mahesh Pandey', 3, NULL, 'developer', 'Lila Mani Poudel'),
(27, 'mobile_development', 'Mahesh Pandey', 3, NULL, 'developer', 'Asmita Poudel'),
(28, 'mobile_development', 'Mahesh Pandey', 3, NULL, 'developer', 'Priyanka Ranjit'),
(29, 'mobile_development', 'Mahesh Pandey', 3, NULL, 'intern', 'Sovit Rimal');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `id` int(11) NOT NULL,
  `project_id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `details` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`id`, `project_id`, `name`, `details`) VALUES
(1, 'proj01', 'Student Mgmt. System', 'This system is for managing student details.'),
(2, 'proj02', 'Mobile Banking System', 'Mobile banking app for NIC Aisa Bank.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `development`
--
ALTER TABLE `development`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `development`
--
ALTER TABLE `development`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
