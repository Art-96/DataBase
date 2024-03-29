﻿--***************************************************************************
--                    Типы двоичных данных в T-SQL
--***************************************************************************

------------------------------------ Binary ---------------------------------

-- Типы двоичных данных Binary. 
-- диапазон значений от 1 до 8000 байт. 

-- Типы двоичных данных записывается как Binary(n), 
-- где n - определяет максимальное количество байт(максимально n = 8000).

PRINT 'Binary'

DECLARE @binary Binary(1) = 16;
PRINT @binary;

----------------------------------- VarBinary -------------------------------

-- Типы двоичных данных VarBinary. 
-- диапазон значений от 1 до 2^31 байт. 

-- Типы двоичных данных записывается как VarBinary(n/max), 
-- где n - определяет максимальное количество байт(максимально n = 8000),
-- или же вместо n записывается max то максимальное количество байт становится 2^31.

PRINT 'VarBinary'

DECLARE @varBinary VarBinary(max) = 2147483647;
PRINT @varBinary;

-----------------------------------------------------------------------------