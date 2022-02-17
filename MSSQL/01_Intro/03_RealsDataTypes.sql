--***************************************************************************
--                      Вещественные типы данных в T-SQL
--***************************************************************************

------------------------------------- Float ---------------------------------

PRINT 'Float'

DECLARE @float float(24) = 1214782.123;		
PRINT @float;
							
SET @float = 2147482435234412412.4321523598746737654;
PRINT @float;  

------------------------------------ Decimal --------------------------------

PRINT 'Decimal / Numeric'

DECLARE @decimal Decimal(5, 3);

SET @decimal = 1.42;
PRINT @decimal; 
 
SET @decimal = 2.234654;
PRINT @decimal;

SET @decimal = 41.12345;
PRINT @decimal;

---------------------------------- SmallMoney -------------------------------

PRINT 'SmallMoney';

DECLARE @smoney SmallMoney = 214748.3647;
PRINT @smoney;

SET @smoney = -214748.3648;
PRINT @smoney;  

------------------------------------- Money ---------------------------------

PRINT 'Money';

DECLARE @money Money = 1.4234;
PRINT @money;

SET @money = 2.234954;
PRINT @money;

-----------------------------------------------------------------------------