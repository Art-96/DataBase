USE AdventureWorks2012
GO

SELECT BusinessEntityID, FirstName, LastName, MiddleName, ModifiedDate FROM Person.Person

--------------------------------------------------------------------------
--				Конструкция ORDER BY - УПОРЯДОЧИТЬ ПО...
--------------------------------------------------------------------------

-- Производим выборку данных из столбцов BusinessEntityID, FirstName, LastName, MiddleName и ModifiedDate,
-- где данные упорядочены по столбцу FirstName, таблицы Person.Person
SELECT BusinessEntityID, FirstName, LastName, MiddleName, ModifiedDate
FROM Person.Person
ORDER BY FirstName;

-- Производим выборку данных из столбцов BusinessEntityID, FirstName, LastName, MiddleName и ModifiedDate, 
-- где данные упорядочены по столбцу ModifiedDate, таблицы Person.Person
SELECT BusinessEntityID, FirstName, LastName, MiddleName, ModifiedDate 
FROM Person.Person
ORDER BY ModifiedDate;

-- Производим выборку данных из столбцов BusinessEntityID, FirstName, LastName, MiddleName и ModifiedDate, 
-- где данные упорядочены по столбцам FirstName и LastName, таблицы Person.Person
SELECT BusinessEntityID, FirstName, LastName, MiddleName, ModifiedDate 
FROM Person.Person
ORDER BY FirstName, LastName;

-- Производим выборку данных из столбцов BusinessEntityID, FirstName, LastName, MiddleName и ModifiedDate, 
-- где данные упорядочены по столбцу FirstName, таблицы Person.Person
SELECT BusinessEntityID, FirstName, LastName, MiddleName, ModifiedDate 
FROM Person.Person
ORDER BY FirstName ASC; -- Сортировка по возрастанию. ASC - по умолчанию.

-- Производим выборку данных из столбцов BusinessEntityID, FirstName, LastName, MiddleName и EmailAddress, 
-- где данные упорядочены в порядке убывания, по столбцу FirstName, таблицы Person.Contact
SELECT BusinessEntityID, FirstName, LastName, MiddleName, ModifiedDate 
FROM Person.Person
ORDER BY FirstName DESC; -- Сортировка по убыванию.