-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2019 at 01:19 AM
-- Server version: 5.5.57-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `MikesBikes`
--

-- --------------------------------------------------------

--
-- Table structure for table `Bikes`
--

CREATE TABLE IF NOT EXISTS `Bikes` (
  `BikeID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(255) DEFAULT NULL,
  `Inventory` varchar(255) DEFAULT NULL,
  `Cost` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`BikeID`),
  UNIQUE KEY `BikeID` (`BikeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `Bikes`
--

INSERT INTO `Bikes` (`BikeID`, `Type`, `Inventory`, `Cost`) VALUES
(1, 'Speed', '10', '1.00'),
(2, 'Mountain', '45', '5.00'),
(3, 'Speed ', '10', '20.00'),
(4, 'Mountain', '15', '100.00'),
(5, 'Road', '5', '35.00');

-- --------------------------------------------------------

--
-- Table structure for table `BikeSupplies`
--

CREATE TABLE IF NOT EXISTS `BikeSupplies` (
  `SupplyID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(255) DEFAULT NULL,
  `Inventory` varchar(255) DEFAULT NULL,
  `Cost` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SupplyID`),
  UNIQUE KEY `SupplyID` (`SupplyID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `BikeSupplies`
--

INSERT INTO `BikeSupplies` (`SupplyID`, `Type`, `Inventory`, `Cost`) VALUES
(1, 'Bells', '15', '30.00'),
(2, 'Stickers', '100', '5.00'),
(3, 'Basket', '10', '150.00'),
(4, 'Pedal', '20', '10.00'),
(5, 'Wheel', '30', '40.00');

-- --------------------------------------------------------

--
-- Table structure for table `Customers`
--

CREATE TABLE IF NOT EXISTS `Customers` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Phone` char(15) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `CustomerID` (`CustomerID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `Customers`
--

INSERT INTO `Customers` (`CustomerID`, `Name`, `Address`, `Phone`) VALUES
(1, 'Dallas ', '2525 Bike Lane ', '7342551547'),
(2, 'Mike', '3698 Amazon CT', '7348587894'),
(3, 'Debbie', '1515 Gordon', '2187451425'),
(4, 'Prescott', '8787 Maine ', '2184744774'),
(5, 'Nancy', '7414 Nexus rd', '1474142568');

-- --------------------------------------------------------

--
-- Table structure for table `Discount`
--

CREATE TABLE IF NOT EXISTS `Discount` (
  `DiscountID` int(11) NOT NULL AUTO_INCREMENT,
  `SupplyID` int(11) NOT NULL,
  `MaintenanceID` int(11) NOT NULL,
  `Cost` decimal(13,2) NOT NULL,
  PRIMARY KEY (`DiscountID`),
  UNIQUE KEY `DiscountID` (`DiscountID`),
  KEY `SupplyID` (`SupplyID`),
  KEY `MaintenanceID` (`MaintenanceID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `Discount`
--

INSERT INTO `Discount` (`DiscountID`, `SupplyID`, `MaintenanceID`, `Cost`) VALUES
(1, 1, 1, '15.00'),
(2, 2, 2, '20.00'),
(3, 3, 3, '5.00'),
(4, 4, 4, '100.00'),
(5, 5, 5, '30.00');

-- --------------------------------------------------------

--
-- Table structure for table `Employees`
--

CREATE TABLE IF NOT EXISTS `Employees` (
  `EmployeeID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE KEY `EmployeeID` (`EmployeeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `Employees`
--

INSERT INTO `Employees` (`EmployeeID`, `Name`) VALUES
(1, 'Susan'),
(2, 'Greg'),
(3, 'Charlotte'),
(4, 'Steve'),
(5, 'Bob');

-- --------------------------------------------------------

--
-- Table structure for table `Maintenance`
--

CREATE TABLE IF NOT EXISTS `Maintenance` (
  `MaintenanceID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(255) DEFAULT NULL,
  `Cost` decimal(13,2) NOT NULL,
  PRIMARY KEY (`MaintenanceID`),
  UNIQUE KEY `MaintenanceID` (`MaintenanceID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `Maintenance`
--

INSERT INTO `Maintenance` (`MaintenanceID`, `Type`, `Cost`) VALUES
(1, 'Tire Patch', '15.00'),
(2, 'Broken Pedal', '20.00'),
(3, 'oil', '5.00'),
(4, 'broken body', '100.00'),
(5, 'frame adjustment', '30.00');

-- --------------------------------------------------------

--
-- Table structure for table `Transaction`
--

CREATE TABLE IF NOT EXISTS `Transaction` (
  `SaleID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerID` int(11) DEFAULT NULL,
  `TransDate` date DEFAULT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SaleID`),
  UNIQUE KEY `SaleID` (`SaleID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `EmployeeID` (`EmployeeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `Transaction`
--

INSERT INTO `Transaction` (`SaleID`, `CustomerID`, `TransDate`, `EmployeeID`) VALUES
(1, 1, '2019-02-07', 2),
(2, 2, '2019-02-08', 1),
(3, 3, '2019-02-09', 3),
(4, 4, '2019-02-11', 4),
(5, 5, '2019-02-12', 5);

-- --------------------------------------------------------

--
-- Table structure for table `TransactionDetail`
--

CREATE TABLE IF NOT EXISTS `TransactionDetail` (
  `BikeID` int(11) DEFAULT NULL,
  `SupplyID` int(11) DEFAULT NULL,
  `MaintenanceID` int(11) DEFAULT NULL,
  `SaleID` int(11) DEFAULT NULL,
  KEY `BikeID` (`BikeID`),
  KEY `SupplyID` (`SupplyID`),
  KEY `MaintenanceID` (`MaintenanceID`),
  KEY `SaleID` (`SaleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TransactionDetail`
--

INSERT INTO `TransactionDetail` (`BikeID`, `SupplyID`, `MaintenanceID`, `SaleID`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3),
(4, 4, 4, 4),
(5, 5, 5, 5);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Discount`
--
ALTER TABLE `Discount`
  ADD CONSTRAINT `Discount_ibfk_1` FOREIGN KEY (`SupplyID`) REFERENCES `BikeSupplies` (`SupplyID`),
  ADD CONSTRAINT `Discount_ibfk_2` FOREIGN KEY (`MaintenanceID`) REFERENCES `Maintenance` (`MaintenanceID`);

--
-- Constraints for table `Transaction`
--
ALTER TABLE `Transaction`
  ADD CONSTRAINT `Transaction_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`),
  ADD CONSTRAINT `Transaction_ibfk_2` FOREIGN KEY (`EmployeeID`) REFERENCES `Employees` (`EmployeeID`);

--
-- Constraints for table `TransactionDetail`
--
ALTER TABLE `TransactionDetail`
  ADD CONSTRAINT `TransactionDetail_ibfk_1` FOREIGN KEY (`BikeID`) REFERENCES `Bikes` (`BikeID`),
  ADD CONSTRAINT `TransactionDetail_ibfk_2` FOREIGN KEY (`SupplyID`) REFERENCES `BikeSupplies` (`SupplyID`),
  ADD CONSTRAINT `TransactionDetail_ibfk_3` FOREIGN KEY (`MaintenanceID`) REFERENCES `Maintenance` (`MaintenanceID`),
  ADD CONSTRAINT `TransactionDetail_ibfk_4` FOREIGN KEY (`SaleID`) REFERENCES `Transaction` (`SaleID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
