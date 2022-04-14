USE ShopDB 
GO

DROP TABLE Customers;

DROP TABLE Orders;

CREATE TABLE Customers					
(                                      
	CustomerNO int IDENTITY NOT NULL 
		PRIMARY KEY,				  
	CustomerName varchar(25) NOT NULL,
	Address1 varchar(25) NOT NULL,
	City     varchar(15) NOT NULL,
	Contact  varchar(25) NOT NULL,
	Phone char(12)
)
GO

CREATE TABLE Orders
(
	OrderID int IDENTITY NOT NULL
		PRIMARY KEY,
	CustomerNo int NULL DEFAULT 2 ,
	OrderDate date NOT NULL,
	EmployeeId int NULL 
)
GO

ALTER TABLE Orders
ADD CONSTRAINT FK_CustomersCustomerNo
FOREIGN KEY (CustomerNo) REFERENCES Customers(CustomerNo);

INSERT INTO Customers																			   
(CustomerName, Address1, City, Contact, Phone)
VALUES
('Petrenko Petr Petrovich', 'Ћуганска¤ 25', ' онотоп', 'PetrPetrenko@mail.ru', '(093)1231212'),
('Ivanenko Ivan Ivanovich', 'ƒихт¤ревска¤ 5', '„ернигов', 'IvanenkoIvan@gmail.com', '(095)2313244');	

INSERT INTO Orders
(CustomerNo, OrderDate,	EmployeeId)
VALUES
(1, GETDATE(), 1);

SELECT * FROM Customers;
SELECT * FROM Orders;

-- Невозможно удалить запись из родительской таблицы, так как на нее имеетс¤ ссылка из дочерней таблицы.
DELETE Customers
WHERE CustomerName = 'Petrenko Petr Petrovich';

-------------------------------------------------------------------------
--              ограничения ссылочной целостности
-------------------------------------------------------------------------

-- 1. CASCADE -	при UPDATE, DELETE в родительской таблице ключевого значени¤,
--				в дочерней таблице также выполняется  UPDATE на новое значение, 
--				или DELETE	строк из дочерней таблицы соответственно

ALTER TABLE Orders
DROP CONSTRAINT FK_CustomersCustomerNo;
GO

ALTER TABLE Orders
ADD CONSTRAINT FK_CustomersCustomerNo
FOREIGN KEY (CustomerNo) REFERENCES Customers(CustomerNo)
	ON DELETE CASCADE 
GO

DELETE Customers
WHERE CustomerName = 'Petrenko Petr Petrovich';

SELECT * FROM Customers;
SELECT * FROM Orders;

DBCC CHECKIDENT("Customers",RESEED,0); -- Обновление значение IDENTITY = 0
GO

INSERT INTO Customers																			   
(CustomerName, Address1, City, Contact, Phone)
VALUES
('ѕетренко ѕетр ѕетрович', 'Ћуганска¤ 25', ' онотоп', 'PetrPetrenko@mail.ru', '(093)1231212')

DBCC CHECKIDENT("Customers",RESEED,2) -- Обновление значение IDENTITY = 2
GO
DBCC CHECKIDENT("Orders",RESEED,0); -- Обновление значение IDENTITY = 0
GO

INSERT INTO Orders
(CustomerNo, OrderDate,	EmployeeId)
VALUES (1,GETDATE(),1);
GO

SELECT * FROM Customers;
SELECT * FROM Orders;

-- 2. SET NULL - при UPDATE, DELETE в родительской таблице ключевого значения,
--				 в дочерней таблице все значений, составляющие эти внешние ключи, 
--				 будут изменены на NULL

ALTER TABLE Orders
DROP CONSTRAINT FK_CustomersCustomerNo;
GO
 
ALTER TABLE Orders
ADD CONSTRAINT FK_CustomersCustomerNo
FOREIGN KEY (CustomerNo) REFERENCES Customers(CustomerNo)
	ON DELETE SET NULL 
GO

DELETE Customers
WHERE CustomerName = 'ѕетренко ѕетр ѕетрович';
GO

SELECT * FROM Customers;
SELECT * FROM Orders;

DBCC CHECKIDENT("Customers",RESEED,0); -- Обновление значение IDENTITY = 0
GO

INSERT INTO Customers																			   
(CustomerName, Address1, City, Contact, Phone)
VALUES
('Petrenko Petr Petrovich', 'Ћуганска¤ 25', ' онотоп', 'PetrPetrenko@mail.ru', '(093)1231212')

DBCC CHECKIDENT("Customers",RESEED,2) -- Обновление значение IDENTITY = 2
GO

DELETE Orders WHERE OrderID = 1;
GO

DBCC CHECKIDENT("Orders",RESEED,0); -- Обновление значение IDENTITY = 0
GO

INSERT INTO Orders
(CustomerNo, OrderDate,	EmployeeId)
VALUES (1,GETDATE(),1);
GO

SELECT * FROM Customers;
SELECT * FROM Orders;


-- 3. SET DEFAULT - при UPDATE, DELETE в родительской таблице ключевого значени¤,
--					в дочерней таблице все значени¤, составл¤ющие эти внешние ключи, 
--					будут изменены на значение по умолчанию.


ALTER TABLE Orders
DROP CONSTRAINT FK_CustomersCustomerNo;
GO

ALTER TABLE Orders
ADD CONSTRAINT FK_CustomersCustomerNo
FOREIGN KEY (CustomerNo) REFERENCES Customers(CustomerNo)
	ON DELETE SET DEFAULT  
GO

DELETE Customers
WHERE CustomerName = 'Petrenko Petr Petrovich';
GO

SELECT * FROM Customers;
SELECT * FROM Orders;


DBCC CHECKIDENT("Customers",RESEED,0);
GO

INSERT INTO Customers																			   
(CustomerName, Address1, City, Contact, Phone)
VALUES
('Petrenko Petr Petrovich', 'Ћуганска¤ 25', ' онотоп', 'PetrPetrenko@mail.ru', '(093)1231212')

DBCC CHECKIDENT("Customers",RESEED,2)
GO

DELETE Orders WHERE OrderID = 1;
GO

DBCC CHECKIDENT("Orders",RESEED,0);
GO

INSERT INTO Orders
(CustomerNo, OrderDate,	EmployeeId)
VALUES (1,GETDATE(),1);
GO

SELECT * FROM Customers;
SELECT * FROM Orders;

-- 4. NO ACTION (по умолчанию) - запрещает выполнение UPDATE, DELETE!

ALTER TABLE Orders
DROP CONSTRAINT FK_CustomersCustomerNo;
GO

ALTER TABLE Orders
ADD CONSTRAINT FK_CustomersCustomerNo
FOREIGN KEY (CustomerNo) REFERENCES Customers(CustomerNo)
	ON DELETE NO ACTION 
GO

DELETE Customers
WHERE CustomerName = 'Petrenko Petr Petrovich';

SELECT * FROM Customers;
SELECT * FROM Orders;