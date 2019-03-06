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
(1, 'Chicken', 10.00, 2)
(1, 'Bacon', 0.50, 5)
(1, 'Coke', 1.00, 4)
(1, 'Calamari', 5.00, 1)
(1, 'Chowder', 3.00, 3);

CREATE TABEL EmployeeRoles(
	EmpRoleID int,
	EmpRoleName varchar(255),
	PRIMARY KEY (EmpRoleID)
);

CREATE TABLE Employees (
	EmployeeID int NOT NULL AUTO_INCREMENT,
	EmpRoleID int,
	PhoneNumber char(9),
	FirstName varchar(255),
	LastName varchar(255),
	PRIMARY KEY (EmployeeID),
	FOREIGN KEY (EmpRoleID) REFERENCES EmployeeRoles(EmpRoleID)
);

CREATE TABLE Discount (
	DiscountID int NOT NULL AUTO_INCREMENT,
	DiscountAmount int,
	PRIMARY KEY (DiscountID)
);

CREATE TABLE Supplies (
	SupID int NOT NULL AUTO_INCREMENT,
	SupName varchar(255),
	PRIMARY KEY (SupplyID)
);

CREATE TABLE Tables (
	TableID int NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (TableID)
);

CREATE TABLE Vendors (
	VendorID int NOT NULL AUTO_INCREMENT,
	VendorName varchar(255),
	VendorPhone char(9),
	PRIMARY KEY (VendorID)
);

CREATE TABLE Orders (
	OrderID int NOT NULL AUTO_INCREMENT,
	EmployeeID int,
	OrderTime time,
	DiscountID int,
	ItemTotal float(13,2),
	GrandTotal float(13,2),
	PRIMARY KEY (OrderID),
	FOREIGN KEY (DiscountID) REFERENCES Discounts(DiscountID)	
);


CREATE TABLE OrderDetails (
	OrderID int,
	DishID int,
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
	FOREIGN KEY (DishID) REFERENCES Dishes(DishID)
);

CREATE TABLE TableOrders (
	TableID int,
	OrderID int,
	FOREIGN KEY (TableID) REFERNECES Tables(TableID),
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE SupOrders (
	SupOrderID int NOT NULL AUTO_INCREMENT,
	TotalSupCost float(13,2),
	SupOrderDate date,
	EmployeeID int,
	PRIMARY KEY SupOrderID,
	FOREGN KEY EmployeeID REFERNECES Employees(EmployeeID)
);

CREATE TABLE SupOrderDetails (
	SupID int,
	VendorID int,
	SupOrderID int,
	SupCost float(13,2),
	FOREIGN KEY SupID REFERENCES Supplies(SupID),
	FOREIGN KEY VendorID REFERENCES Vendors(VendorID),
	FOREIGN KEY SupOrderID REFERENECES SupOrderDetails(SupOrderID) 	
);