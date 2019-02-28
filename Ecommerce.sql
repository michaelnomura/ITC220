-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2019 at 01:18 AM
-- Server version: 5.5.57-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `Ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `Customers`
--

CREATE TABLE IF NOT EXISTS `Customers` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) DEFAULT NULL,
  `Phone` varchar(30) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `Customers`
--

INSERT INTO `Customers` (`CustomerID`, `Name`, `Phone`, `Address`, `Email`) VALUES
(1, 'April', '777-777-7777', '1 One St', 'x@x.com'),
(2, 'Bob', '777-777-7777', '2 Two St', 'x@x.com'),
(3, 'April', '777-777-7777', '1 One St', 'x@x.com'),
(4, 'Bob', '777-777-7777', '2 Two St', 'x@x.com'),
(5, 'Cara', '777-777-7777', '3 One St', 'e@e.com'),
(6, 'Cara', '777-777-7777', '3 One St', 'e@e.com'),
(7, 'Jill', '777-777-7777', '4 Five St', 'b@b.com'),
(9, 'Jill', '777-777-7777', '4 Five St', 'b@b.com');

-- --------------------------------------------------------

--
-- Table structure for table `Products`
--

CREATE TABLE IF NOT EXISTS `Products` (
  `ProductID` int(11) NOT NULL AUTO_INCREMENT,
  `PurchasePrice` decimal(13,2) DEFAULT NULL,
  `SalePrice` decimal(13,2) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `ProductType` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `Products`
--

INSERT INTO `Products` (`ProductID`, `PurchasePrice`, `SalePrice`, `Description`, `ProductType`) VALUES
(1, '143.75', '500.00', 'Stuff', 'Stuff'),
(2, '143.75', '500.00', 'Stuff', 'Stuff'),
(3, '50.00', '100.00', 'Other', 'Other'),
(4, '50.00', '100.00', 'Other', 'Other'),
(5, '5.00', '10.00', 'Odd', 'Odd'),
(6, '5.00', '10.00', 'Odd', 'Odd'),
(7, '5.00', '20.00', 'Weird', 'Weird'),
(8, '5.00', '20.00', 'Weird', 'Weird');

-- --------------------------------------------------------

--
-- Table structure for table `SaleDetails`
--

CREATE TABLE IF NOT EXISTS `SaleDetails` (
  `SaleID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  PRIMARY KEY (`SaleID`,`ProductID`),
  KEY `ProductID` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SaleDetails`
--

INSERT INTO `SaleDetails` (`SaleID`, `ProductID`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `Sales`
--

CREATE TABLE IF NOT EXISTS `Sales` (
  `SaleID` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SaleID`),
  KEY `CustomerID` (`CustomerID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `Sales`
--

INSERT INTO `Sales` (`SaleID`, `Date`, `CustomerID`) VALUES
(1, '2019-01-29', 1),
(2, '2019-01-29', 1),
(3, '2019-01-09', 2),
(4, '2019-01-09', 2),
(5, '2019-01-25', 3),
(6, '2019-01-25', 3),
(7, '2019-01-31', 5),
(8, '2019-01-31', 5),
(9, '2019-01-16', 4),
(10, '2019-01-16', 4);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `SaleDetails`
--
ALTER TABLE `SaleDetails`
  ADD CONSTRAINT `SaleDetails_ibfk_1` FOREIGN KEY (`SaleID`) REFERENCES `Sales` (`SaleID`),
  ADD CONSTRAINT `SaleDetails_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `Products` (`ProductID`);

--
-- Constraints for table `Sales`
--
ALTER TABLE `Sales`
  ADD CONSTRAINT `Sales_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
