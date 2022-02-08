USE ShopDB;

DROP TABLE SubTest1;
DROP TABLE SubTest2;

CREATE TABLE SubTest1
(id1 int,
 name varchar(50));


CREATE TABLE SubTest2
(id2 int,
 name varchar(50));


INSERT SubTest1
VALUES  (1,'one'),
		(2,'two'),
		(3,'three'),
		(4,'four'),
		(5,'five'),
		(9,'nine'),
		(10,'ten');


INSERT SubTest2
VALUES  (1,'one'),
		(2,'two'),
		(3,'three'),
		(4,'four'),
		(5,'five'),
		(6,'six'),
		(7,'seven'),
		(8,'eight');

SELECT * FROM SubTest1;
SELECT * FROM SubTest2;

SELECT * FROM SubTest1
WHERE id1 IN	  
			(SELECT id2 FROM SubTest2);
            
SELECT * FROM SubTest1
WHERE id1 =	  
			(SELECT id2 FROM SubTest2); #error
            
SELECT * FROM SubTest1
WHERE id1 =	  
			(SELECT id2 FROM SubTest2 WHERE name = 'four');
            
-------------------------------------------

USE carsshop;

insert into clients(name, age, phone)
value
('Vasya',22,'88888888'),
('Zigmund',75,'99999999');

SELECT name, phone FROM clients WHERE age = 75; 


SELECT name, phone FROM clients WHERE age = (SELECT MAX(age) FROM clients);

-----------------------------------------------------------------------------------

USE ShopDB;



SELECT * FROM SubTest1 AS ST1					  
WHERE name /* 4 */ = /* 3 */(SELECT name					   
							 FROM SubTest2 AS ST2			   
							 WHERE ST1.id1 = ST2.id2); -- (1)  

SELECT * FROM SubTest1 AS ST1					  
WHERE name=(SELECT name				
			FROM SubTest2 AS ST2			 
			WHERE ST1.id1 = ST2.id2);
			  

SELECT * FROM SubTest1  AS ST1
WHERE EXISTS
    (SELECT * FROM SubTest2	ST2
     WHERE ST1.id1 = ST2.id2);
     								



SELECT * ,(SELECT name	FROM SubTest2 AS ST2 WHERE ST1.id1 = ST2.id2) AS Name2 
FROM SubTest1 AS ST1;


SELECT *,
	   (SELECT id2 FROM SubTest2 AS ST2	WHERE ST1.id1 = ST2.id2) AS Id2,
	   (SELECT name	FROM SubTest2 AS ST2 WHERE ST1.id1 = ST2.id2) AS Name2
FROM SubTest1 AS ST1;
 
SELECT *,
	   (SELECT id2 FROM SubTest2 AS ST2	WHERE ST1.id1 = ST2.id2) AS Id2,
	   (SELECT name	FROM SubTest2 AS ST2 WHERE ST1.id1 = ST2.id2) AS Name2
FROM SubTest1 AS ST1
WHERE ST1.id1 = (SELECT id2 FROM SubTest2 AS ST2 
                  WHERE ST1.id1 = ST2.id2);




SELECT Products.ProdID, Description, Qty, TotalPrice 
   	  FROM Products
INNER JOIN OrderDetails
      ON Products.ProdID = OrderDetails.ProdID;
      

      
SELECT (SELECT  ProdID FROM Products 
	    WHERE Products.ProdID = OrderDetails.ProdID) AS ProdID,
	   (SELECT  Description FROM Products 
	    WHERE Products.ProdID = OrderDetails.ProdID) AS Description, Qty, TotalPrice 
FROM OrderDetails;
	  

SELECT FName, LName, MName, SUM(TotalPrice) AS TotalSold 
		FROM Employees
	     JOIN Orders
			ON Employees.EmployeeID	= Orders.EmployeeID
	     JOIN OrderDetails
			ON Orders.OrderID = OrderDetails.OrderID
GROUP BY  Employees.FName,
		  Employees.LName,  
		  Employees.MName;
		  
 
 
CREATE TEMPORARY TABLE TmpTable
SELECT (SELECT FName FROM Employees 
		WHERE EmployeeID = (SELECT EmployeeID FROM Orders
							WHERE Orders.OrderID = OrderDetails.OrderID)
		) AS FName,
	    (SELECT LName FROM Employees 
		 WHERE EmployeeID = (SELECT EmployeeID FROM Orders
							 WHERE Orders.OrderID = OrderDetails.OrderID)
		) AS LName,
		(SELECT MName FROM Employees 
		 WHERE EmployeeID = (SELECT EmployeeID FROM Orders
							 WHERE Orders.OrderID = OrderDetails.OrderID)
		) AS MName,   
		TotalPrice
FROM OrderDetails;
	

SELECT FName, LName, MName, SUM(TotalPrice) AS TotalSold  FROM TmpTable
GROUP BY FName, LName, MName;