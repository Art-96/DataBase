﻿--***************************************************************************
--                       Текстовые типы данных в T-SQL
--***************************************************************************

-------------------------------------- Char ---------------------------------

-- допустимое количество символов от 1 до 8000 символов.

-- Char(n), где n - определяет максимальное количество символов(максимально n = 8000).

PRINT 'Char'

DECLARE @char char(5)= 'Hello';
PRINT @char;

SET @char = '1234dfghdf'; -- Часть строки "fghdf" не запишется, т.к. допустимое количество символов (5)
PRINT @char;

-------------------------------------- VarChar ------------------------------

-- диапазон значений от 1 до 2^31 символов.

-- Текстовые типы данных записывается как VarChar(n/max), 
-- где n - определяет максимальное количество символов(максимально n = 8000),
-- или же вместо n записывается max то максимальное количество символов становится 2^31.

PRINT 'VarChar'

DECLARE @vchar varchar(max)='Hello';
PRINT @vchar;

SET @vchar = '1234dfghdf';
PRINT @vchar;

-------------------------------------- NChar --------------------------------

-- диапазон значений от 1 до 4000 символов.

-- Текстовые типы данных записывается как NChar(n), 
-- где n - определяет максимальное количество символов(максимально n = 4000).
-- Если количество вводимых символов меньше n то разница заполниться пробелами 

PRINT 'NChar'

DECLARE @Nchar Nchar(7) = 'Привет!';
PRINT @Nchar;

SET @Nchar = '1234 приехали'; -- Часть строки "иехали" не запишется, т.к. допустимое количество символов (7)
PRINT @Nchar;

------------------------------------- NvarChar ------------------------------

-- диапазон значений от 1 до 2^31 символов.. 

-- Текстовые типы данных записывается как NvarChar(n/max), 
-- где n - определяет максимальное количество символов(максимально n = 4000),
-- или же вместо n записывается max то максимальное количество символов становится 2^31.

PRINT 'NvarChar'

DECLARE @NvarChar NvarChar(max) = 'Привет Мир!';
PRINT @NvarChar;

SET @NvarChar = 'Много много много много много много много много много много много слов';
PRINT @NvarChar;

-----------------------------------------------------------------------------