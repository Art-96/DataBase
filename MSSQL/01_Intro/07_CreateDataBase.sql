﻿--********************************************************************************
--                            Создание Базы Данных.
--********************************************************************************

-- Создаём базу данных с именем ShopDB.
CREATE DATABASE ShopDB  
ON							  -- Задаем параметры Базы Данных.
(
	NAME = 'ShopDB',
	FILENAME = 'D:\ShopDB.mdf',
	SIZE = 10MB,
	MAXSIZE = 100MB,
	FILEGROWTH = 10MB
)
LOG ON						  -- Задаем параметры журнала Базы Данных.
( 
	NAME = 'LogShopDB',
	FILENAME = 'D:\ShopDB.ldf',
	SIZE = 5MB,
	MAXSIZE = 50MB,
	FILEGROWTH = 5MB
)               
COLLATE Cyrillic_General_CI_AS -- Задаем кодировку для базы данных по умолчанию


----------------------------------------------------------------------------------

-- Выводим информацию о Базе Данных - ShopDB.
EXECUTE sp_helpdb ShopDB;

----------------------------------------------------------------------------------
                     

--********************************************************************************
--                  Создание Таблицы в Базе Данных ShopDB.
--********************************************************************************

USE ShopDB                
GO   

----------------------------------------------------------------------------------

CREATE TABLE MyFriends
(
	FriendId smallint IDENTITY NOT NULL,
	FirstName Varchar(20) NOT NULL,
	LastName Varchar(20) NULL,
	BirthDate date NULL,
	PhoneNumber char(10) NOT NULL
)
GO

----------------------------------------------------------------------------------
