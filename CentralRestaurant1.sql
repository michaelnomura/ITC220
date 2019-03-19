-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2019 at 12:04 AM
-- Server version: 5.5.57-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `CentralRestaurant`
--

-- --------------------------------------------------------

--
-- Table structure for table `Discounts`
--

CREATE TABLE IF NOT EXISTS `Discounts` (
  `DiscountID` int(11) NOT NULL AUTO_INCREMENT,
  `DiscountPercentage` int(11) DEFAULT NULL,
  `DiscountDesc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DiscountID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `Discounts`
--

INSERT INTO `Discounts` (`DiscountID`, `DiscountPercentage`, `DiscountDesc`) VALUES
(1, 5, 'Five'),
(2, 10, 'Ten'),
(3, 15, 'Fifteen'),
(4, 20, 'Twenty'),
(5, 25, 'Twenty Five');

-- --------------------------------------------------------

--
-- Table structure for table `Dishes`
--

CREATE TABLE IF NOT EXISTS `Dishes` (
  `DishID` int(11) NOT NULL AUTO_INCREMENT,
  `DishName` varchar(255) DEFAULT NULL,
  `Price` float(13,2) DEFAULT NULL,
  `DishTypeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`DishID`),
  KEY `DishTypeID` (`DishTypeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `Dishes`
--

INSERT INTO `Dishes` (`DishID`, `DishName`, `Price`, `DishTypeID`) VALUES
(1, 'Chicken Vindaloo', 10.00, 2),
(2, 'Bacon', 0.50, 5),
(3, 'Coke', 1.00, 4),
(4, 'Calamari', 5.00, 1),
(5, 'Chowder', 3.00, 3);

-- --------------------------------------------------------

--
-- Table structure for table `DishTypes`
--

CREATE TABLE IF NOT EXISTS `DishTypes` (
  `DishTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `DishType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DishTypeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `DishTypes`
--

INSERT INTO `DishTypes` (`DishTypeID`, `DishType`) VALUES
(1, 'Appetizer'),
(2, 'Entree'),
(3, 'Side'),
(4, 'Drink'),
(5, 'Misc');

-- --------------------------------------------------------

--
-- Table structure for table `EmployeeRoles`
--

CREATE TABLE IF NOT EXISTS `EmployeeRoles` (
  `EmpRoleID` int(11) NOT NULL DEFAULT '0',
  `EmpRoleName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EmpRoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `EmployeeRoles`
--

INSERT INTO `EmployeeRoles` (`EmpRoleID`, `EmpRoleName`) VALUES
(1, 'Manager'),
(2, 'Waiter'),
(3, 'Chef'),
(4, 'Host'),
(5, 'Bartender');

-- --------------------------------------------------------

--
-- Table structure for table `Employees`
--

CREATE TABLE IF NOT EXISTS `Employees` (
  `EmployeeID` int(11) NOT NULL AUTO_INCREMENT,
  `EmpRoleID` int(11) DEFAULT NULL,
  `PhoneNumber` char(10) DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `EmpRoleID` (`EmpRoleID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `Employees`
--

INSERT INTO `Employees` (`EmployeeID`, `EmpRoleID`, `PhoneNumber`, `FirstName`, `LastName`) VALUES
(1, 1, '5555555555', 'James', 'Mann'),
(2, 2, '6666666666', 'Walt', 'Wait'),
(3, 3, '5554443333', 'Joe', 'Cook'),
(4, 4, '8888888888', 'Harmony', 'Greet'),
(5, 5, '3333333333', 'Bart', 'Daniels');

-- --------------------------------------------------------

--
-- Stand-in structure for view `Menu`
--
CREATE TABLE IF NOT EXISTS `Menu` (
`Type` varchar(255)
,`Name` varchar(255)
,`Price` float(13,2)
);
-- --------------------------------------------------------

--
-- Table structure for table `OrderDetails`
--

CREATE TABLE IF NOT EXISTS `OrderDetails` (
  `OrderID` int(11) DEFAULT NULL,
  `DishID` int(11) DEFAULT NULL,
  KEY `OrderID` (`OrderID`),
  KEY `DishID` (`DishID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `OrderDetails`
--

INSERT INTO `OrderDetails` (`OrderID`, `DishID`) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 1),
(3, 4),
(3, 1),
(4, 4),
(4, 5),
(5, 2),
(1, 1),
(2, 1),
(NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE IF NOT EXISTS `Orders` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `EmployeeID` int(11) DEFAULT NULL,
  `OrderTime` time DEFAULT NULL,
  `DiscountID` int(11) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `EmployeeID` (`EmployeeID`),
  KEY `DiscountID` (`DiscountID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`OrderID`, `EmployeeID`, `OrderTime`, `DiscountID`) VALUES
(1, 2, '01:55:03', NULL),
(2, 2, '02:45:50', NULL),
(3, 1, '03:50:06', 1),
(4, 5, '09:45:18', 2),
(5, 5, '10:07:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Supplies`
--

CREATE TABLE IF NOT EXISTS `Supplies` (
  `SupplyID` int(11) NOT NULL AUTO_INCREMENT,
  `SupplyName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SupplyID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `Supplies`
--

INSERT INTO `Supplies` (`SupplyID`, `SupplyName`) VALUES
(1, 'Salt'),
(2, 'Pepper'),
(3, 'Flour'),
(4, 'Sugar'),
(5, 'Eggs');

-- --------------------------------------------------------

--
-- Table structure for table `SupplyOrderDetails`
--

CREATE TABLE IF NOT EXISTS `SupplyOrderDetails` (
  `SupplyID` int(11) DEFAULT NULL,
  `VendorID` int(11) DEFAULT NULL,
  `SupplyOrderID` int(11) DEFAULT NULL,
  `SupplyCost` float(13,2) DEFAULT NULL,
  KEY `SupplyID` (`SupplyID`),
  KEY `VendorID` (`VendorID`),
  KEY `SupplyOrderID` (`SupplyOrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SupplyOrderDetails`
--

INSERT INTO `SupplyOrderDetails` (`SupplyID`, `VendorID`, `SupplyOrderID`, `SupplyCost`) VALUES
(1, 1, 1, 200.00),
(2, 1, 1, 500.00),
(3, 2, 2, 1000.50),
(3, 1, 3, 30.75),
(4, 3, 4, 2500.45);

-- --------------------------------------------------------

--
-- Table structure for table `SupplyOrders`
--

CREATE TABLE IF NOT EXISTS `SupplyOrders` (
  `SupplyOrderID` int(11) NOT NULL AUTO_INCREMENT,
  `SupplyOrderDate` datetime DEFAULT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SupplyOrderID`),
  KEY `EmployeeID` (`EmployeeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `SupplyOrders`
--

INSERT INTO `SupplyOrders` (`SupplyOrderID`, `SupplyOrderDate`, `EmployeeID`) VALUES
(1, '2019-03-01 02:06:00', 3),
(2, '2019-03-01 02:30:08', 3),
(3, '2019-03-02 02:37:08', 1),
(4, '2019-03-02 03:30:08', 1),
(5, '2019-03-03 02:30:45', 3);

-- --------------------------------------------------------

--
-- Table structure for table `TableOrders`
--

CREATE TABLE IF NOT EXISTS `TableOrders` (
  `TableID` int(11) DEFAULT NULL,
  `OrderID` int(11) DEFAULT NULL,
  KEY `TableID` (`TableID`),
  KEY `OrderID` (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TableOrders`
--

INSERT INTO `TableOrders` (`TableID`, `OrderID`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `Tables`
--

CREATE TABLE IF NOT EXISTS `Tables` (
  `TableID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`TableID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `Tables`
--

INSERT INTO `Tables` (`TableID`) VALUES
(1),
(2),
(3),
(4),
(5);

-- --------------------------------------------------------

--
-- Table structure for table `Vendors`
--

CREATE TABLE IF NOT EXISTS `Vendors` (
  `VendorID` int(11) NOT NULL AUTO_INCREMENT,
  `VendorName` varchar(255) DEFAULT NULL,
  `VendorPhone` char(10) DEFAULT NULL,
  PRIMARY KEY (`VendorID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `Vendors`
--

INSERT INTO `Vendors` (`VendorID`, `VendorName`, `VendorPhone`) VALUES
(1, 'Restaurant Depo', '7777776666'),
(2, 'Sunny Farm', '8887779999'),
(3, 'Acme Supplies', '5556663333'),
(4, 'Great Market', '2223334444'),
(5, 'Other Stuff', '4567891233');

-- --------------------------------------------------------

--
-- Structure for view `Menu`
--
DROP TABLE IF EXISTS `Menu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`mnomura`@`%` SQL SECURITY DEFINER VIEW `Menu` AS select `DishTypes`.`DishType` AS `Type`,`Dishes`.`DishName` AS `Name`,`Dishes`.`Price` AS `Price` from (`Dishes` join `DishTypes` on((`Dishes`.`DishTypeID` = `DishTypes`.`DishTypeID`))) order by `DishTypes`.`DishType`;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Dishes`
--
ALTER TABLE `Dishes`
  ADD CONSTRAINT `Dishes_ibfk_1` FOREIGN KEY (`DishTypeID`) REFERENCES `DishTypes` (`DishTypeID`);

--
-- Constraints for table `Employees`
--
ALTER TABLE `Employees`
  ADD CONSTRAINT `Employees_ibfk_1` FOREIGN KEY (`EmpRoleID`) REFERENCES `EmployeeRoles` (`EmpRoleID`);

--
-- Constraints for table `OrderDetails`
--
ALTER TABLE `OrderDetails`
  ADD CONSTRAINT `OrderDetails_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`),
  ADD CONSTRAINT `OrderDetails_ibfk_2` FOREIGN KEY (`DishID`) REFERENCES `Dishes` (`DishID`);

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employees` (`EmployeeID`),
  ADD CONSTRAINT `Orders_ibfk_2` FOREIGN KEY (`DiscountID`) REFERENCES `Discounts` (`DiscountID`);

--
-- Constraints for table `SupplyOrderDetails`
--
ALTER TABLE `SupplyOrderDetails`
  ADD CONSTRAINT `SupplyOrderDetails_ibfk_1` FOREIGN KEY (`SupplyID`) REFERENCES `Supplies` (`SupplyID`),
  ADD CONSTRAINT `SupplyOrderDetails_ibfk_2` FOREIGN KEY (`VendorID`) REFERENCES `Vendors` (`VendorID`),
  ADD CONSTRAINT `SupplyOrderDetails_ibfk_3` FOREIGN KEY (`SupplyOrderID`) REFERENCES `SupplyOrders` (`SupplyOrderID`);

--
-- Constraints for table `SupplyOrders`
--
ALTER TABLE `SupplyOrders`
  ADD CONSTRAINT `SupplyOrders_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employees` (`EmployeeID`);

--
-- Constraints for table `TableOrders`
--
ALTER TABLE `TableOrders`
  ADD CONSTRAINT `TableOrders_ibfk_1` FOREIGN KEY (`TableID`) REFERENCES `Tables` (`TableID`),
  ADD CONSTRAINT `TableOrders_ibfk_2` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

GRANT ALL PRIVILEGES ON *.* TO 'DBA'@'localhost' IDENTIFIED BY PASSWORD '*98F19B394B58FAC4B01A3D9037B93CA2A17199CF' WITH GRANT OPTION;

GRANT ALL PRIVILEGES ON `CentralRestaurant`.* TO 'DBA'@'localhost';

GRANT USAGE ON *.* TO 'Employees'@'localhost' IDENTIFIED BY PASSWORD '*A41BEE51488264C01B96DE959A9142AF1A75205E';

GRANT ALL PRIVILEGES ON `CentralRestaurant`.* TO 'Employees'@'localhost';

GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`TableOrders` TO 'Employees'@'localhost';

GRANT SELECT, REFERENCES ON `CentralRestaurant`.`Menu` TO 'Employees'@'localhost';

GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`Orders` TO 'Employees'@'localhost';

GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`SupplyOrders` TO 'Employees'@'localhost';

GRANT SELECT, REFERENCES ON `CentralRestaurant`.`Discounts` TO 'Employees'@'localhost';

GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`Tables` TO 'Employees'@'localhost';

GRANT SELECT, REFERENCES ON `CentralRestaurant`.`Supplies` TO 'Employees'@'localhost';

GRANT SELECT, REFERENCES ON `CentralRestaurant`.`Vendors` TO 'Employees'@'localhost';

GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`SupplyOrderDetails` TO 'Employees'@'localhost';

GRANT SELECT, REFERENCES ON `CentralRestaurant`.`DishTypes` TO 'Employees'@'localhost';

GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`Dishes` TO 'Employees'@'localhost';

GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`OrderDetails` TO 'Employees'@'localhost';

GRANT USAGE ON *.* TO 'Managers'@'localhost' IDENTIFIED BY PASSWORD '*74445CD742AF268FD22866DA0D12758951D638F7';

GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`SupplyOrders` TO 'Managers'@'localhost';

GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`Discounts` TO 'Managers'@'localhost';

GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`Menu` TO 'Managers'@'localhost';

GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`Dishes` TO 'Managers'@'localhost';

GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`Vendors` TO 'Managers'@'localhost';

GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`Orders` TO 'Managers'@'localhost';

GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`DishTypes` TO 'Managers'@'localhost';

GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`OrderDetails` TO 'Managers'@'localhost';

GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`SupplyOrderDetails` TO 'Managers'@'localhost';

GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`Tables` TO 'Managers'@'localhost';


GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`Supplies` TO 'Managers'@'localhost';


GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`Employees` TO 'Managers'@'localhost';

GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`EmployeeRoles` TO 'Managers'@'localhost';

GRANT USAGE ON *.* TO 'Vendors'@'localhost' IDENTIFIED BY PASSWORD '*AA5F498BEE9D8E3A091610F6B4456E1A09763C27';

GRANT ALL PRIVILEGES ON `CentralRestaurant`.* TO 'Vendors'@'localhost';

GRANT SELECT, REFERENCES ON `CentralRestaurant`.`Supplies` TO 'Vendors'@'localhost';

GRANT SELECT, REFERENCES ON `CentralRestaurant`.`SupplyOrderDetails` TO 'Vendors'@'localhost';

GRANT SELECT, REFERENCES ON `CentralRestaurant`.`SupplyOrders` TO 'Vendors'@'localhost';

GRANT SELECT, REFERENCES ON `CentralRestaurant`.`OrderDetails` TO 'Vendors'@'localhost';

GRANT SELECT, REFERENCES ON `CentralRestaurant`.`Orders` TO 'Vendors'@'localhost';

GRANT SELECT, REFERENCES ON `CentralRestaurant`.`Menu` TO  'Vendors'@'localhost';
