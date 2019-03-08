CREATE DATABASE CentralRestaurant;

CREATE TABLE DishTypes (
	DishTypeID int NOT NULL AUTO_INCREMENT,
	DishType varchar(255),
	PRIMARY KEY (DishTypeID)
);

INSERT INTO DishTypes (DishTypeID, DishType) VALUES 
(1, 'Appetizer'),
(2, 'Entree'),
(3, 'Side'),
(4, 'Drink'),
(5, 'Misc');


CREATE TABLE Dishes (
	DishID int NOT NULL AUTO_INCREMENT,
	DishName varchar(255),
	Price float(13,2),
	DishTypeID int,
	PRIMARY KEY (DishID),
	FOREIGN KEY (DishTypeID) REFERENCES DishTypes(DishTypeID)
);

INSERT INTO Dishes (DishID, DishName, Price, DishTypeID) VALUES
(1, 'Chicken Vindaloo', 10.00, 2),
(2, 'Bacon', 0.50, 5),
(3, 'Coke', 1.00, 4),
(4, 'Calamari', 5.00, 1),
(5, 'Chowder', 3.00, 3);

CREATE TABLE EmployeeRoles(
	EmpRoleID int,
	EmpRoleName varchar(255),
	PRIMARY KEY (EmpRoleID)
);

INSERT INTO EmployeeRoles (EmpRoleID, EmpRoleName) VALUES 
(1, 'Manager'),
(2, 'Waiter'),
(3, 'Chef'),
(4, 'Host'),
(5, 'Bartender');

CREATE TABLE Employees (
	EmployeeID int NOT NULL AUTO_INCREMENT,
	EmpRoleID int,
	PhoneNumber char(10),
	FirstName varchar(255),
	LastName varchar(255),
	PRIMARY KEY (EmployeeID),
	FOREIGN KEY (EmpRoleID) REFERENCES EmployeeRoles(EmpRoleID)
);

INSERT INTO Employees (EmployeeID,EmpRoleID,PhoneNumber,FirstName,LastName) VALUES 
(1,1,5555555555,'James','Mann'),
(2,2,6666666666,'Walt','Wait'),
(3,3,5554443333,'Joe','Cook'),
(4,4,8888888888,'Harmony','Greet'),
(5,5,3333333333,'Bart','Daniels');

CREATE TABLE Discounts (
	DiscountID int NOT NULL AUTO_INCREMENT,
	DiscountPercentage int,
	DiscountDesc varchar(255),
	PRIMARY KEY (DiscountID)
);

INSERT INTO Discounts (DiscountID, DiscountPercentage, DiscountDesc) VALUES 
(1,5,'Five'),
(2,10,'Ten'),
(3,15,'Fifteen'),
(4,20,'Twenty'),
(5,25,'Twenty Five');

CREATE TABLE Supplies (
	SupplyID int NOT NULL AUTO_INCREMENT,
	SupplyName varchar(255),
	PRIMARY KEY (SupplyID)
);

INSERT INTO Supplies (SupplyID,SupplyName) VALUES 
(1,'Salt'),
(2,'Pepper'),
(3,'Flour'),
(4,'Sugar'),
(5,'Eggs');


CREATE TABLE Tables (
	TableID int NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (TableID)
);

INSERT INTO Tables (TableID) VALUES 
(1),
(2),
(3),
(4),
(5);

CREATE TABLE Vendors (
	VendorID int NOT NULL AUTO_INCREMENT,
	VendorName varchar(255),
	VendorPhone char(10),
	PRIMARY KEY (VendorID)
);

INSERT INTO Vendors (VendorID, VendorName, VendorPhone) VALUES 
(1,'Restaurant Depo',7777776666),
(2,'Sunny Farm',8887779999),
(3,'Acme Supplies',5556663333),
(4,'Great Market',2223334444),
(5,'Other Stuff',4567891233);

DROP TABLE Orders;

CREATE TABLE Orders (
	OrderID int NOT NULL AUTO_INCREMENT,
	EmployeeID int,
	OrderTime time,
	DiscountID int,
	PRIMARY KEY (OrderID),
	FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
	FOREIGN KEY (DiscountID) REFERENCES Discounts(DiscountID)	
);

INSERT INTO Orders (OrderID, EmployeeID, OrderTime, DiscountID) VALUES 
(NULL, '2', '01:55:03', NULL),
(NULL, '2', '02:45:50', NULL),
(NULL, '1', '03:50:06', '1'),
(NULL, '5', '09:45:18', '2'),
(NULL, '5', '10:07:45', NULL);


CREATE TABLE OrderDetails (
	OrderID int,
	DishID int,
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
	FOREIGN KEY (DishID) REFERENCES Dishes(DishID)
);

INSERT INTO OrderDetails (OrderID, DishID) VALUES 
('1','1'),
('1','2'),
('2','3'),
('2','1'),
('3','4'),
('3','1'),
('4','4'),
('4','5'),
('5','2');



CREATE TABLE TableOrders (
	TableID int,
	OrderID int,
	FOREIGN KEY (TableID) REFERENCES Tables(TableID),
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO TableOrders (TableID, OrderID) VALUES 
('1','1'),
('2','2'),
('3','3'),
('4','4'),
('4','5');



CREATE TABLE SupplyOrders (
	SupplyOrderID int NOT NULL AUTO_INCREMENT,
	SupplyOrderDate DATETIME,
	EmployeeID int,
	PRIMARY KEY (SupplyOrderID),
	FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

INSERT INTO SupplyOrders (SupplyOrderID, SupplyOrderDate, EmployeeID) VALUES 
(NULL, '2019-03-01 02:06:00', '3'),
(NULL, '2019-03-01 02:30:08', '3'),
(NULL, '2019-03-02 02:37:08', '1'),
(NULL, '2019-03-02 03:30:08', '1'),
(NULL, '2019-03-03 02:30:45', '3');

DROP TABLE SupplyOrderDetails;

CREATE TABLE SupplyOrderDetails (
	SupplyID int,
	VendorID int,
	SupplyOrderID int,
	SupplyCost float(13,2),
	FOREIGN KEY (SupplyID) REFERENCES Supplies(SupplyID),
	FOREIGN KEY (VendorID) REFERENCES Vendors(VendorID),
	FOREIGN KEY (SupplyOrderID) REFERENCES SupplyOrders(SupplyOrderID) 	
);

INSERT INTO SupplyOrderDetails (SupplyID, VendorID, SupplyOrderID, SupplyCost) VALUES 
('1', '1', '1', '200'), 
('2', '1', '1', '500'),
('3', '2', '2', '1000.50'),
('3', '1', '3', '30.75'),
('4', '3', '4', '2500.45');

SELECT Orders.OrderID, Employees.EmployeeID
FROM Orders
INNER JOIN Employees
ON Orders.EmployeeID=Employees.EmployeeID;