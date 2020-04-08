drop database ShopDB;
create database ShopDB;
use shopdb;

create table Orders
(
Customer varchar(200),
OrderDate date,
OrederDetalis varchar(200),
Employee varchar(200)
);

insert Orders(Customer, OrderDate, OrederDetalis, Employee)
value 
('Василий Петрович Ляценко; Харьков, Лужная 15; (092)3212211;',
'2009-12-28',
'LV231 Джинсы, 45$, 5, 225$; DG30 Ремень, 30$, 5, 145$; LV12 Обувь, 26$, 5, 125$;',
'Иван Иванович Белецкий');

insert Orders(Customer, OrderDate, OrederDetalis, Employee)
value 
('Зигмунт Федорович Унакий; Киев, Дегтяаревская 5; (092)7612343;',
'2010-09-01',
'GC11 Шапка, 32$, 10, 320$; GC111 Футболка, 20$, 15, 300$;',
'Светлана Олеговна Лялечкина');

insert Orders(Customer, OrderDate, OrederDetalis, Employee)
value 
('Олег Евстафевич Выжлецов; Чернигов, Киевская 5; (044)2134212;',
'2010-09-18',
'LV12 Обувь, 26$, 20, 520$; GC11 Шапка, 32$, 18, 576$;',
'Светлана Олеговна Лялечкина');

select * from Orders;
----------------------------------------------
drop table orders;

use shopdb;

create table orders
(
custfname varchar(15) not null,
custmname varchar(15) not null,
custlname varchar(15) not null,
customercity varchar(15),
customeraddress varchar(15),
phone varchar(12) not null,
orderdate date not null,
productid char(5) not null,
productdescription varchar(15),
unitprice double(5,2) not null,
qty int not null,
totalprice double(5,2),
empfname varchar(15) not null,
empmname varchar(15) not null,
emplname varchar(15) not null
);

insert Orders(custfname, custmname, custlname, customercity, customeraddress, phone,          orderdate,    productid, productdescription, unitprice, qty, totalprice, empfname, empmname,   emplname)
value('Василий', 'Петрович', 'Ляценко', 'Харьков',    'Лужная 15',    '(092)3212211','2009-12-28', 'LV231',     'Джинсы',            45,       5,   225,        'Иван',  'Иванович', 'Белецкий');

insert orders(custfname, custmname, custlname, customercity, customeraddress, phone,          orderdate,    productid, productdescription, unitprice, qty, totalprice, empfname, empmname,   emplname)
value('Василий', 'Петрович', 'Ляценко', 'Харьков', 'Лужная 15', '(092)3212211','2009-12-28','DG30', 'Ремень', 30, 5, 145,'Иван', 'Иванович', 'Белецкий');

insert orders(custfname, custmname, custlname, customercity, customeraddress, phone,          orderdate,    productid, productdescription, unitprice, qty, totalprice, empfname, empmname,   emplname)
value('Василий', 'Петрович', 'Ляценко', 'Харьков', 'Лужная 15', '(092)3212211','2009-12-28','LV12', 'Обувь', 26, 5, 125,'Иван', 'Иванович', 'Белецкий');

insert orders(custfname, custmname, custlname, customercity, customeraddress, phone,          orderdate,    productid, productdescription, unitprice, qty, totalprice, empfname, empmname,   emplname)
value('Зигмунт', 'Федорович', 'Унакий', 'Киев', 'Дегтяаревская 5', '(092)7612343','2010-09-01','GC11', 'Шапка', 32, 10, 320,'Светлана', 'Олеговна', 'Лялечкина');

insert orders(custfname, custmname, custlname, customercity, customeraddress, phone,          orderdate,    productid, productdescription, unitprice, qty, totalprice, empfname, empmname,   emplname)
value('Зигмунт', 'Федорович', 'Унакий', 'Киев', 'Дегтяаревская 5', '(092)7612343','2010-09-01','GC111', 'Футболка', 20, 15, 300,'Светлана', 'Олеговна', 'Лялечкина');

insert orders(custfname, custmname, custlname, customercity, customeraddress, phone,          orderdate,    productid, productdescription, unitprice, qty, totalprice, empfname, empmname,   emplname)
value('Олег', 'Евстафевич', 'Выжлецов', 'Чернигов', 'Киевская 5', '(044)2134212', '2010-09-18', 'LV12', 'Обувь', 26, 20, 520, 'Светлана', 'Олеговна', 'Лялечкина');

insert orders(custfname, custmname, custlname, customercity, customeraddress, phone,          orderdate,    productid, productdescription, unitprice, qty, totalprice, empfname, empmname,   emplname)
value('Олег', 'Евстафевич', 'Выжлецов', 'Чернигов', 'Киевская 5', '(044)2134212', '2010-09-18','GC11', 'Шапка', 32, 18, 576, 'Светлана', 'Олеговна', 'Лялечкина');

select * from orders;

drop table orders;

create table orders
(
orderid int not null,
lineitem int not null,
custfname varchar(15) not null,
custmname varchar(15) not null,
custlname varchar(15) not null,
customercity varchar(15),
customeraddress varchar(15),
phone varchar(12) not null,
orderdate date not null,
productid char(5) not null,
productdescription varchar(15),
unitprice double(5,2) not null,
qty int not null,
totalprice double(5,2),
empfname varchar(15) not null,
empmname varchar(15) not null,
emplname varchar(15) not null,

primary key (orderid, lineitem)
);

insert Orders(orderid, lineitem, orderdate, custfname, custmname, custlname, customercity, customeraddress, phone,              productid, productdescription, unitprice, qty, totalprice, empfname, empmname,   emplname)
value(1,1,'2009-12-28','Василий', 'Петрович', 'Ляценко', 'Харьков',    'Лужная 15',    '(092)3212211', 'LV231',     'Джинсы',            45,       5,   225,        'Иван',  'Иванович', 'Белецкий');

insert orders(orderid, lineitem, orderdate,custfname, custmname, custlname, customercity, customeraddress, phone,              productid, productdescription, unitprice, qty, totalprice, empfname, empmname,   emplname)
value(1,2,'2009-12-28','Василий', 'Петрович', 'Ляценко', 'Харьков', 'Лужная 15', '(092)3212211','DG30', 'Ремень', 30, 5, 145,'Иван', 'Иванович', 'Белецкий');

insert orders(orderid, lineitem, orderdate,custfname, custmname, custlname, customercity, customeraddress, phone,              productid, productdescription, unitprice, qty, totalprice, empfname, empmname,   emplname)
value(1,3,'2009-12-28','Василий', 'Петрович', 'Ляценко', 'Харьков', 'Лужная 15', '(092)3212211','LV12', 'Обувь', 26, 5, 125,'Иван', 'Иванович', 'Белецкий');

insert orders(orderid, lineitem, orderdate,custfname, custmname, custlname, customercity, customeraddress, phone,             productid, productdescription, unitprice, qty, totalprice, empfname, empmname,   emplname)
value(2,1,'2010-09-01','Зигмунт', 'Федорович', 'Унакий', 'Киев', 'Дегтяаревская 5', '(092)7612343','GC11', 'Шапка', 32, 10, 320,'Светлана', 'Олеговна', 'Лялечкина');

insert orders(orderid, lineitem, orderdate,custfname, custmname, custlname, customercity, customeraddress, phone,             productid, productdescription, unitprice, qty, totalprice, empfname, empmname,   emplname)
value(2,2,'2010-09-01','Зигмунт', 'Федорович', 'Унакий', 'Киев', 'Дегтяаревская 5', '(092)7612343','GC111', 'Футболка', 20, 15, 300,'Светлана', 'Олеговна', 'Лялечкина');

insert orders(orderid, lineitem, orderdate,custfname, custmname, custlname, customercity, customeraddress, phone,            productid, productdescription, unitprice, qty, totalprice, empfname, empmname,   emplname)
value(3,1,'2010-09-18','Олег', 'Евстафевич', 'Выжлецов', 'Чернигов', 'Киевская 5', '(044)2134212',  'LV12', 'Обувь', 26, 20, 520, 'Светлана', 'Олеговна', 'Лялечкина');

insert orders(orderid, lineitem, orderdate,custfname, custmname, custlname, customercity, customeraddress, phone,             productid, productdescription, unitprice, qty, totalprice, empfname, empmname,   emplname)
value(3,2,'2010-09-18','Олег', 'Евстафевич', 'Выжлецов', 'Чернигов', 'Киевская 5', '(044)2134212', 'GC11', 'Шапка', 32, 18, 576, 'Светлана', 'Олеговна', 'Лялечкина');

select * from orders;

-------------------------------------------------

DROP TABLE Orders;
DROP TABLE Employees;
DROP TABLE Customers;
DROP TABLE OrderDetails;

CREATE TABLE Employees
	(
		EmployeeID int NOT NULL auto_increment 
			PRIMARY KEY,
		FName nvarchar(15) NOT NULL,
		LName nvarchar(15) NOT NULL,
		MName nvarchar(15) NOT NULL,
		Salary double(7, 2) NOT NULL,
		PriorSalary double(7,2) NOT NULL,
		HireDate date NOT NULL,
		TerminationDate date NULL,
		ManagerEmpID int NULL
	);
    
    CREATE TABLE Customers
	(
	CustomerNo int NOT NULL auto_increment
		PRIMARY KEY,
	FName nvarchar(15) NOT NULL,
	LName nvarchar(15) NOT NULL,
	MName nvarchar(15) NULL,
	Address1 nvarchar(50) NOT NULL,
	Address2 nvarchar(50) NULL,
	City nchar(10) NOT NULL,
	Phone char(12) NOT NULL UNIQUE,
	DateInSystem date NULL
	); 


CREATE TABLE Orders
(
	OrderID int NOT NULL auto_increment PRIMARY KEY,
	OrderDate date NOT NULL,
	CustomerNo int,
	EmployeeID int,

	FOREIGN KEY(CustomerNo) REFERENCES Customers(CustomerNo),
	FOREIGN KEY(EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE OrderDetails
(
	OrderID int NOT NULL,
	LineItem int NOT NULL,
	ProductID char(5) NOT NULL,
	ProductDescription varchar(15),
	UnitPrice double NOT NULL,
	Qty int NOT NULL,
	TotalPrice int,

    FOREIGN KEY(OrderID) REFERENCES Orders(OrderID),
	PRIMARY KEY (OrderId, LineItem)
);

INSERT Employees
(FName, MName, LName, Salary, PriorSalary, HireDate, TerminationDate, ManagerEmpID)
VALUES
('Василий', 'Петрович', 'Лященко', 5000, 800, '2009-11-20', NULL, NULL);
INSERT Employees
(FName, MName, LName, Salary, PriorSalary, HireDate, TerminationDate, ManagerEmpID)
VALUES
('Иван', 'Иванович', 'Билецкий', 5000, 800, '2009-11-20', NULL, NULL);
INSERT Employees
(FName, MName, LName, Salary, PriorSalary, HireDate, TerminationDate, ManagerEmpID)
VALUES
('Александр', 'Дячков', 'Лященко', 6000, 900, '2009-11-20', NULL, NULL);
INSERT Employees
(FName, MName, LName, Salary, PriorSalary, HireDate, TerminationDate, ManagerEmpID)
VALUES
('Вадим', 'Горкавенко', 'Лященко', 5000, 800, '2009-11-20', NULL, NULL);


INSERT Customers 
(LName, FName, MName, Address1, Address2, City, Phone,DateInSystem)
VALUES
('Круковский','Анатолий','Петрович','Лужная 15',NULL,'Харьков','(092)3212211','2009-11-20');
INSERT Customers 
(LName, FName, MName, Address1, Address2, City, Phone,DateInSystem)
VALUES
('Дурнев','Виктор','Викторович','Зелинская 10',NULL,'Киев','(067)4242132','2010-03-08');
INSERT Customers 
(LName, FName, MName, Address1, Address2, City, Phone,DateInSystem)
VALUES
('Унакий','Зигмунд','федорович','Дихтяревская 5',NULL,'Киев','(092)7612343','2010-08-17');
INSERT Customers 
(LName, FName, MName, Address1, Address2, City, Phone,DateInSystem)
VALUES
('Левченко','Виталий','Викторович','Глущенка 5','Драйзера 12','Киев','(053)3456788','2010-08-20');
INSERT Customers 
(LName, FName, MName, Address1, Address2, City, Phone,DateInSystem)
VALUES
('Выжлецов','Олег','Евстафьевич','Киевская 3','Одесская 8','Чернигов','(044)2134212','2010-09-18');


INSERT Orders(OrderDate, CustomerNo, EmployeeID)
VALUES
( '2009-12-28', 1, 2);
INSERT Orders(OrderDate, CustomerNo, EmployeeID)
VALUES
( '2010-09-01', 3, 4);
INSERT Orders(OrderDate, CustomerNo, EmployeeID)
VALUES
( '2010-09-18', 5, 4);


INSERT OrderDetails (OrderID, LineItem, ProductID, ProductDescription, UnitPrice, Qty, TotalPrice)
VALUES
( 1, 1, 'LV231', 'Джинсы', 45, 5, 5*45 );

INSERT OrderDetails (OrderID, LineItem, ProductID, ProductDescription, UnitPrice, Qty, TotalPrice)
VALUES
( 1, 2, 'DG30', 'Ремень', 30, 5, 30*5 );

INSERT OrderDetails (OrderID, LineItem, ProductID, ProductDescription, UnitPrice, Qty, TotalPrice)
VALUES
( 1, 3, 'LV12', 'Обувь', 26, 5, 26*5 );

INSERT OrderDetails (OrderID, LineItem, ProductID, ProductDescription, UnitPrice, Qty, TotalPrice)
VALUES
( 2, 1, 'GC11', 'Шапка', 32, 10, 10*32 );

INSERT OrderDetails (OrderID, LineItem, ProductID, ProductDescription, UnitPrice, Qty, TotalPrice)
VALUES
( 2, 2, 'GC111', 'Футболка', 20, 15, 15*20 );

INSERT OrderDetails (OrderID, LineItem, ProductID, ProductDescription, UnitPrice, Qty, TotalPrice)
VALUES
( 3, 1, 'LV12', 'Обувь', 26, 20, 20*26 );

INSERT OrderDetails (OrderID, LineItem, ProductID, ProductDescription, UnitPrice, Qty, TotalPrice)
VALUES
( 3, 2, 'GC11', 'Шапка', 32, 18, 18*32 );


SELECT * FROM Customers;
SELECT * FROM Employees;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;

------------------------------------------

DROP TABLE OrderDetails;
DROP TABLE Products;

CREATE TABLE Products
(
	ProductID char(5) NOT NULL PRIMARY KEY,
	Description varchar(15),
	UnitPrice float(5,2) NOT NULL,
	Weight int NULL
);


CREATE TABLE OrderDetails
(
	OrderID int NOT NULL,
	LineItem int NOT NULL,
	ProductID char(5) NOT NULL,
	Qty int NOT NULL,

    FOREIGN KEY(OrderID) REFERENCES Orders(OrderID),
	FOREIGN KEY(ProductID) REFERENCES Products(ProductID),
	PRIMARY KEY (OrderId, LineItem)
);

INSERT Products(ProductID, Description, UnitPrice, Weight)
VALUES
( 'LV231', 'Джинсы', 45, 2);
INSERT Products(ProductID, Description, UnitPrice, Weight)
VALUES
( 'DG30', 'Ремень', 30,  1);
INSERT Products(ProductID, Description, UnitPrice, Weight)
VALUES
( 'GC111', 'Футболка', 20,  2);
INSERT Products(ProductID, Description, UnitPrice, Weight)
VALUES
( 'LV12', 'Обувь', 26,  2);
INSERT Products(ProductID, Description, UnitPrice, Weight)
VALUES
( 'GC11', 'Шапка', 32,  1);


INSERT OrderDetails (OrderID, LIneItem, ProductID, Qty)
VALUES
( 1, 1, 'LV231', 5 );
INSERT OrderDetails (OrderID, LIneItem, ProductID, Qty)
VALUES
( 1, 2, 'DG30', 5 );
INSERT OrderDetails (OrderID, LIneItem, ProductID, Qty)
VALUES
( 1, 3, 'LV12', 5 );
INSERT OrderDetails (OrderID, LIneItem, ProductID, Qty)
VALUES
( 2, 1, 'GC11', 10 );
INSERT OrderDetails (OrderID, LIneItem, ProductID, Qty)
VALUES
( 2, 2, 'GC111', 15 );
INSERT OrderDetails (OrderID, LIneItem, ProductID, Qty)
VALUES
( 3, 1, 'LV12', 20 );
INSERT OrderDetails (OrderID, LIneItem, ProductID, Qty)
VALUES
( 3, 2, 'GC11', 18 );


SELECT * FROM Customers;
SELECT * FROM Employees;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM Products;

----------------------------------

DROP TABLE OrderDetails;

CREATE TABLE OrderDetails
(
	OrderID int NOT NULL,
	LineItem int NOT NULL,
	ProductID char(5) NOT NULL,
	Qty int NOT NULL,
	TotalPrice int,

    FOREIGN KEY(OrderID) REFERENCES Orders(OrderID),
	FOREIGN KEY(ProductID) REFERENCES Products(ProductID),
	PRIMARY KEY (OrderId, LineItem)
);

INSERT OrderDetails(OrderID, LineItem, ProductID, Qty, TotalPrice)
VALUES 
( 1, 12, 'LV231', 5, 5 * (select UnitPrice FROM Products where ProductID = 'LV231'));

INSERT OrderDetails(OrderID, LineItem, ProductID, Qty, TotalPrice)
VALUES 
( 1, 2, 'DG30', 5, 5 * (select UnitPrice FROM Products where ProductID = 'DG30'));

INSERT OrderDetails(OrderID, LineItem, ProductID, Qty, TotalPrice)
VALUES 
( 1, 3, 'LV12', 5, 5 * (select UnitPrice FROM Products where ProductID = 'LV12'));

INSERT OrderDetails(OrderID, LineItem, ProductID, Qty, TotalPrice)
VALUES 
( 2, 1, 'GC11', 10, 10 * (select UnitPrice FROM Products where ProductID = 'GC11') );

INSERT OrderDetails(OrderID, LineItem, ProductID, Qty, TotalPrice)
VALUES 
( 2, 2, 'GC111', 15, 15 * (select UnitPrice FROM Products where ProductID = 'GC111') );

INSERT OrderDetails(OrderID, LineItem, ProductID, Qty, TotalPrice)
VALUES 
( 3, 1, 'LV12', 20, 20 * (select UnitPrice FROM Products where ProductID = 'LV12') );

INSERT OrderDetails(OrderID, LineItem, ProductID, Qty, TotalPrice)
VALUES 
( 3, 2, 'GC11', 18, 18 * (select UnitPrice FROM Products where ProductID = 'GC11') );


SELECT * FROM OrderDetails;