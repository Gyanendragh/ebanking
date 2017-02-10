-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 05, 2015 at 11:04 PM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bankingproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `balance_info`
--

CREATE TABLE IF NOT EXISTS `balance_info` (
  `acc_no` varchar(30) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `balance` float NOT NULL,
  UNIQUE KEY `account_no` (`acc_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `balance_info`
--

INSERT INTO `balance_info` (`acc_no`, `fname`, `lname`, `balance`) VALUES
('0617201515', 'gyanendra', 'ghimire', 5600),
('0617201518', 'ranju', 'grg', 2600),
('0617201522', 'raju', 'grg', 900),
('0617201525', 'Arjun', 'pandey', 12500),
('0617201534', 'bibek', 'dahal', 29000),
('0617201559', 'abishake', 'acharya', 12200),
('0618201513', 'Utkristha', 'Thapa', 12000);

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE IF NOT EXISTS `bank` (
  `bank_ib` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` varchar(30) NOT NULL,
  `contact` double NOT NULL,
  `category` varchar(30) NOT NULL,
  PRIMARY KEY (`bank_ib`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`bank_ib`, `name`, `address`, `contact`, `category`) VALUES
(1, 'Online Banking Limited', 'Kathmandu', 5532247, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `chequeorder`
--

CREATE TABLE IF NOT EXISTS `chequeorder` (
  `acc_no` varchar(30) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `date_order` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `chequebook_no` int(11) NOT NULL,
  UNIQUE KEY `acc_no` (`acc_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chequeorder`
--

INSERT INTO `chequeorder` (`acc_no`, `fname`, `lname`, `date_order`, `chequebook_no`) VALUES
('0617201522', 'raju', 'grg', '2015-06-29 05:56:18', 20),
('0617201525', 'Arjun', 'Pandey', '2015-06-29 22:12:19', 14);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_maintain` varchar(30) NOT NULL,
  `acc_no` varchar(30) NOT NULL,
  `acc_type` varchar(30) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile_no` double NOT NULL,
  `gender` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  `district` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `citizen_no` varchar(30) NOT NULL,
  `acc_maintain_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `acc_no` (`acc_no`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `acc_maintain`, `acc_no`, `acc_type`, `fname`, `lname`, `dob`, `email`, `mobile_no`, `gender`, `country`, `district`, `city`, `citizen_no`, `acc_maintain_on`, `username`, `password`) VALUES
(3, 'kavre', '0617201515', 'saving', 'gyanendra', 'ghimire', '1992-12-03', 'abc@gmail.com', 9849262636, 'Male', 'Nepal', 'kavre', 'banepa', '23741193', '2015-06-18 13:16:40', 'gyanu', 'gyanu'),
(4, 'ktm', '0617201518', 'current', 'ranju', 'grg', '1993-10-10', 'raju@grg.com', 98635273, 'Female', 'nepal', 'biratnagar', 'biratnagar', '3435371', '2015-06-18 12:36:46', 'ranju', 'ranju'),
(5, 'htd', '0617201522', 'operative_call', 'raju', 'grg', '1993-05-05', 'scvbs@jkdv', 35953209, 'Male', 'Nepal', 'tanahu', 'pokhara', '3265783', '2015-06-18 12:37:05', 'raju', 'raju'),
(6, 'Lalitpur', '0617201525', 'current', 'Arjun', 'pandey', '1992-03-03', 'arjun@pandey', 9851034234, 'Male', 'Nepal', 'Bhaktapur', 'bkt', '3502290020', '2015-06-18 12:37:20', 'arjun', 'arjun'),
(9, 'Kathmandu', '0617201534', 'saving', 'bibek', 'dahal', '1983-06-10', 'bibek@gmail.com', 9841005525, 'Male', 'India', 'Newdelhi', 'jamal', '2372188', '2015-06-29 21:55:51', 'bibek', 'bibek'),
(10, 'bhaktapur', '0617201559', 'current', 'Abishake', 'Acharya', '1995-07-13', 'any@anycom', 9741000142, 'Male', 'America', 'Boston', 'SomerVally', '278237845', '2015-06-30 16:30:55', 'abishake', 'qwehf345'),
(11, 'Birgunj', '0618201513', 'current', 'Utkristha', 'Thapa', '1997-10-11', 'utsab@gmail.com', 9849266626, 'Female', 'Nepal', 'Makwanpur', 'Birgunj', '45634567', '2015-06-18 13:19:50', 'utkristha', 'gyanu123');

-- --------------------------------------------------------

--
-- Table structure for table `deposit_info`
--

CREATE TABLE IF NOT EXISTS `deposit_info` (
  `acc_no` varchar(30) DEFAULT NULL,
  `depositBy` varchar(30) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  `amount` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deposit_info`
--

INSERT INTO `deposit_info` (`acc_no`, `depositBy`, `date`, `remark`, `amount`) VALUES
('0617201559', 'gyanendra', '2015-06-29 12:37:12', 'amount deposited', 5000),
('0617201559', 'Bibash', '2015-06-29 12:39:12', 'amount deposited', 4000),
('0617201559', 'Arjun', '2015-06-29 12:41:43', 'amount deposited', 2000),
('0617201522', 'hari', '2015-06-29 15:11:53', 'amount deposited', 5000),
('0617201534', 'jitu', '2015-06-29 15:40:31', 'amount deposited', 15000),
('0617201534', 'kavi', '2015-06-29 15:45:34', 'amount deposited', 1000),
('0617201559', 'hayeman', '2015-07-01 00:23:47', 'amount deposit', 2200);

-- --------------------------------------------------------

--
-- Table structure for table `fund_transfer`
--

CREATE TABLE IF NOT EXISTS `fund_transfer` (
  `acc_no_from` varchar(30) DEFAULT NULL,
  `acc_no_to` varchar(30) DEFAULT NULL,
  `transfer_by` varchar(30) DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  `date_transfer` timestamp NULL DEFAULT NULL,
  `amount` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fund_transfer`
--

INSERT INTO `fund_transfer` (`acc_no_from`, `acc_no_to`, `transfer_by`, `remark`, `date_transfer`, `amount`) VALUES
('0617201559', '0617201522', 'Abishake', 'Transfer fund', '2015-06-29 12:52:12', 5000),
('0617201534', '0617201522', 'Abishake', 'fund transfer', '2015-06-29 15:49:55', 1000),
('0617201522', '0617201559', 'raju', 'fund transfer', '2015-06-29 16:08:05', 1000),
('0617201522', '0617201534', 'raju', 'fund transfer', '2015-06-29 16:43:08', 1000),
('0617201522', '0617201534', 'Abishake', 'fund transfer', '2015-06-29 17:00:07', 1000),
('0617201534', '0618201513', 'bibek', 'amount transfer', '2015-06-29 17:27:10', 3000),
('0617201534', '0618201513', 'utkris', 'amount transfer', '2015-06-29 17:31:16', 3000),
('0617201522', '0617201525', 'raju', 'fund transfer', '2015-06-30 00:11:57', 5500),
('0617201522', '0617201518', 'raju', 'amount transfer', '2015-06-30 05:51:12', 4000),
('0617201534', '0617201525', 'bibek', 'amount transfer', '2015-06-30 05:53:50', 4000),
('0617201534', '0618201513', 'bibek', 'amount transfer', '2015-06-30 06:09:04', 2000),
('0617201534', '0618201513', 'bibek', 'amount transfer', '2015-06-30 06:11:12', 3000),
('0617201522', '0617201518', 'raju', 'amount transfer', '2015-06-30 06:30:23', 2100),
('0617201534', '0618201513', 'bibek', 'fund transfer', '2015-06-30 07:14:14', 2000),
('0617201522', '0617201515', 'raju', 'amount transfer', '2015-06-30 21:49:37', 5000),
('0617201534', '0617201515', 'bibek', 'amount transfer', '2015-07-01 00:25:41', 600),
('0617201522', '0617201518', 'raju', 'amount transfer', '2015-07-01 00:35:39', 1500),
('0617201525', '0617201522', 'Arjun', 'fund transfer', '2015-07-01 00:39:47', 2000),
('0617201522', '0617201518', 'raju', 'amount transfer', '2015-07-01 06:11:56', 1100),
('0617201522', '0617201534', 'raju', 'amount transfer', '2015-07-01 10:24:01', 14000);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `utype` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`, `utype`) VALUES
('gyanu', 'gyanu', 'admin'),
('raju', 'raju', 'customer'),
('bibek', 'bibek', 'customer'),
('ranju', 'ranju', 'customer'),
('utkristha', 'gyanu123', 'customer'),
('arjun', 'arjun', 'customer'),
('abishake', 'abk', 'customer');
