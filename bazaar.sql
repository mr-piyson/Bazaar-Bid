-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2016 at 03:43 PM
-- Server version: 5.5.32
-- PHP Version: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bazaar`
--
CREATE DATABASE IF NOT EXISTS `bazaar` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bazaar`;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `descri` text NOT NULL,
  `price` int(20) NOT NULL,
  `btime` datetime NOT NULL,
  `cid` int(11) NOT NULL,
  `image` text NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `mob` text NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `cid` (`cid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=70 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`pid`, `title`, `descri`, `price`, `btime`, `cid`, `image`, `name`, `email`, `mob`) VALUES
(1, 'Red Car', 'Sport Racing Car', 89499, '2025-12-31 00:00:00', 5, 'assets/redcar.jpeg', 'Alex', 'alex123@hotmail.com', '46852325');


-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `Email` text NOT NULL,
  `FirstName` text NOT NULL,
  `LastName` text NOT NULL,
  `Mob` text NOT NULL,
  `password` text NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`uid`, `Email`, `FirstName`, `LastName`, `Mob`, `password`) VALUES 
(1, 'vinit1111', 'vinit', 'kumar', '9509042871', '1234567890');

-- --------------------------------------------------------

--
-- Table structure for table `bid`
--

CREATE TABLE IF NOT EXISTS `bid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` text NOT NULL,
  `Price` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `bid`
--

INSERT INTO `bid` (`id`, `Name`, `Price`, `pid`) VALUES
(7, 'ahmed', 3000, 46),
(24, 'mohamed', 90000, 1),
(25, 'sara', 600000, 1),
(26, 'fatima', 600500, 1),
(27, 'ali', 610000, 1),
(28, 'mohamed', 620000, 1),
(29, 'Jassem', 620500, 1),
(30, 'Ahmed', 1234555, 35);

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE IF NOT EXISTS `details` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `Email` text NOT NULL,
  `FirstName` text NOT NULL,
  `LastName` text NOT NULL,
  `Mob` text NOT NULL,
  `password` text NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `details`
--

INSERT INTO `details` (`uid`, `Email`, `FirstName`, `LastName`, `Mob`, `password`) VALUES
(2, 'ujjawalpvce', 'ujjawal', 'kumar', '8389972892', '45322'),
(4, 'vinitraj11', 'Vinit', 'Kumar', '9509042871', '123456'),
(10, 'wewe', 'qwq', 'wqw', 'sa', '123'),
(11, 'ashish11', 'ashish', 'kumar', '9024511865', '112233'),
(12, 'mahi123', 'mahesh', 'kumar', '8290027454', '1234567');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) NOT NULL DEFAULT '',
  `link` varchar(100) NOT NULL DEFAULT '#',
  `parent` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `label`, `link`, `parent`, `sort`) VALUES
(1, 'Jewelry', '#', 0, 0),
(2, 'Furniture', '#', 0, 0),
(3, 'Books', '#', 0, 0),
(4, 'Electronics', '#', 0, 0),
(5, 'Cars', '#', 0, 0),
(6, 'Clothes', '#', 0, 0),
(7, 'Games', '#', 0, 0),
(8, 'Animals', '#', 0, 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `parent` FOREIGN KEY (`cid`) REFERENCES `category` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
