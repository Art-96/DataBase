USE carsshop;

DELIMITER |

DROP procedure getAllClients; |
CREATE PROCEDURE getAllClients()
BEGIN
    SELECT * FROM clients;
END
|

DELIMITER |
CALL getAllClients();
|



----------------------------------------------------------------------



DELIMITER |
DROP PROCEDURE clientsByName; |

CREATE PROCEDURE clientsByName ( IN cname nvarchar(25) )  
BEGIN
	SELECT * FROM clients WHERE name = cname;
END
|

DELIMITER |
CALL clientsByName('Petro');
|

DELIMITER |
CREATE PROCEDURE clientsByName (IN cname nvarchar(25) )

BEGIN
   IF (cname IS NOT NULL)  
   THEN
	
	SELECT * FROM clients WHERE name like cname; 
    ELSE				
	
	SELECT 'Bad error';
    END IF;
 END
|


DELIMITER |
CALL clientsByName('%t%');  |  

CALL clientsByName('vi%');  
|


------------------------------------------------------------------------------

DELIMITER |
DROP PROCEDURE countClients; |


CREATE PROCEDURE countClients (OUT info int) 

BEGIN
	SELECT Count(*) into info From clients;
END
|

DELIMITER |
CALL countClients(@result);
|

SELECT @result;

|



DELIMITER |
DROP PROCEDURE factorial; |

CREATE PROCEDURE factorial (IN valueIn INT)

BEGIN
	DECLARE inWorking int DEFAULT 1;
    DECLARE result int DEFAULT 1;
    
	WHILE (inWorking <= valueIn)
	 DO
		SET result = result * inWorking;
		SET inWorking = inWorking + 1;
    END WHILE;
    
    SELECT result;
END;
|

DELIMITER |
CALL factorial(5);
|

------------------------------------------------------------------------


USE ShopDB;

DELIMITER |
CREATE FUNCTION Hello() 
RETURNS varchar(30)     
BEGIN 
DECLARE MyVar varchar(20);
SET MyVar = 'Hello World!';
RETURN MyVar; 
END; 
|

DELIMITER |
 SELECT Hello();
|


drop database carsshop; |

create database carsshop; |

use carsshop; |


create table marks(
   id int not null auto_increment primary key,
   mark varchar(20) unique
); |

create table cars(
  id INT NOT NULL auto_increment primary key,
  mark_id INT NOT NULL,
  model varchar(20) NOT NULL,
  price INT NOT NULL,
  foreign key(mark_id) references marks(id)
); |

CREATE TABLE clients
(
	
	 id INT AUTO_INCREMENT NOT NULL,
     name VARCHAR(30),
     age TINYINT,
     phone VARCHAR(15),
     PRIMARY KEY (id)
); |

create table orders(
     id int not null primary key auto_increment,
     car_id int not null,
     client_id int not null,
     foreign key(car_id) references cars(id),
     foreign key(client_id) references clients(id)
); |

INSERT into marks(mark) values('Audi');|
INSERT into marks(mark) values('Porsche'); |

insert into cars(mark_id, model, price) values (1, 'A5', 50000); |
insert into cars(mark_id, model, price) values (2, 'panamera', 100000); |
insert into cars(mark_id, model, price) values (2, 'caymen S', 88000); |

insert into clients(name, age) values ('petro', 20), ('vasya', 25), ('vitaly', 75); |

insert into orders(car_id, client_id) values(1, 1), (2, 2), (1, 3); |

SELECT m.mark, avg(age) FROM marks m 
    INNER JOIN cars c ON m.id = c.mark_id
    INNER JOIN orders o ON o.car_id = c.id
    INNER JOIN clients cl ON o.client_id = cl.id
    GROUP BY m.mark;
    
|
DELIMITER |
CREATE FUNCTION AverageAge(mark varchar(45)) 
RETURNS INT
BEGIN
    RETURN (SELECT AVG(cl.age) FROM clients cl 
            INNER JOIN orders o ON cl.id = o.client_id
			INNER JOIN cars c ON c.id = o.car_id
            INNER JOIN marks m ON c.mark_id = m.id WHERE m.mark = mark);
END
| 

SELECT mark, AverageAge(mark) FROM marks; |

DELIMITER |
DROP FUNCTION AveragePrice; |
CREATE FUNCTION AveragePrice(mark varchar(45))
RETURNS INT
BEGIN
   RETURN (SELECT avg(c.price) FROM cars c 
   INNER JOIN marks m ON m.id = c.mark_id WHERE m.mark = mark);
END
|

SELECT mark, AveragePrice(mark) FROM marks; |

--------------------------------------------------------------------

CREATE DATABASE ShopDB;

USE ShopDB;


DROP TABLE MyEmployee;


CREATE TABLE MyEmployee
(
  EmployeeID int NOT NULL,
  ManagerID int NULL REFERENCES MyEmployee(EmployeeID),
  JobTitle nvarchar(50) NOT NULL,
  LastName nvarchar(50) NOT NULL,
  FirstName nvarchar(50) NOT NULL,
    CONSTRAINT PK_Employee2_EmployeeID PRIMARY KEY CLUSTERED (EmployeeID ASC)
);



INSERT INTO MyEmployee(EmployeeID,ManagerID,JobTitle,LastName,FirstName)
VALUES
  (1, NULL, 'Gen','Andrew', 'Bond'),
  (2, 1, 'Fin', 'Petro', 'Becko'),	
  (3, 1, 'Prog','AA','BB'),		
  (4, 1, 'DEv', 'CC', 'DD'),
  (5, 4, 'Security', 'EE', 'FF'),			
  (8, 5, 'Gruzchik', 'GG', 'HH'),			
  (9, 5, 'Pogruzchik', 'II', 'JJ'),				
  (10 ,5, 'Data Architect', 'KK', 'LL'),			
  (11 ,5, 'Data', 'MM', 'NN'),				
  (6, 4, 'Kto', 'OO', 'PP'),	
  (7, 4, 'Nikto','QQ','RR');				

SELECT * FROM MyEmployee;

SELECT  sub.EmployeeID,
		sub.FirstName,
		sub.LastName
FROM
	MyEmployee as boss
	JOIN
	MyEmployee as sub
	ON boss.EmployeeID = sub.ManagerID;
    



DELIMITER |
CREATE procedure employees ()

BEGIN

 DECLARE employeeCursor CURSOR
FOR
		SELECT * FROM MyEmployee;
		
OPEN contact_cursor;
CLOSE contact_cursor;



END;|




CALL employees(); |

DELIMITER |
DROP procedure employees; |
CREATE procedure employees (id INT)

BEGIN
DECLARE manager nvarchar(45);
DECLARE employee nvarchar(45);
DECLARE job_title nvarchar(45);
DECLARE getId INT;


DECLARE employeeCursor CURSOR 
	FOR
	SELECT 
	e.EmployeeID,
    e.FirstName,
 (SELECT m.FirstName FROM myemployee m
 WHERE m.ManagerID = e.ManagerID and  m.EmployeeID = e.EmployeeID),
 e.JobTitle
 FROM myemployee e;
	
OPEN employeeCursor;

get_emp : LOOP
  FETCH employeeCursor INTO getId, manager, employee, job_title;	
  IF getId = id
     THEN
     SELECT manager, employee, job_title;
   ELSE 
     SELECT 'Different employee';
  END IF;
  END LOOP get_emp;

CLOSE employeeCursor;



END;|

CALL employees(5); |

DROP TABLE BestEmployee; |
CREATE TABLE BestEmployee
(
  EmployeeID int NOT NULL,
  ManagerID int NULL REFERENCES MyEmployee(EmployeeID), 
  JobTitle nvarchar(50) NOT NULL,
  LastName nvarchar(50) NOT NULL,
  FirstName nvarchar(50) NOT NULL,
    CONSTRAINT PK_Employee2_EmployeeID PRIMARY KEY CLUSTERED (EmployeeID ASC)
); |

DELIMITER |
DROP procedure employees; |
CREATE procedure employees () 

BEGIN
DECLARE lastName nvarchar(45);
DECLARE employee nvarchar(45);
DECLARE job_title nvarchar(45);
DECLARE id INT;
DECLARE manager_id INT;

DECLARE employeeCursor CURSOR 
	FOR
	SELECT * FROM MyEmployee;
	
OPEN employeeCursor;

get_emp : LOOP
  FETCH employeeCursor INTO id, manager_id, job_title, lastName, employee;	
  select id, manager_id, job_title, lastName, employee;
    IF id < 5
     THEN 
     INSERT INTO BestEmployee(EmployeeID,ManagerID,JobTitle,LastName,FirstName)
       VALUES (id, manager_id, job_title, lastName, employee);
       END IF;
  END LOOP get_emp;

CLOSE employeeCursor;



END;|

CALL employees(); |

SELECT * FROM BestEmployee;

