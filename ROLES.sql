CREATE LOGIN MANAGER
	WITH PASSWORD = '123'

USE CIELOAZUL
GO
CREATE USER MANAGER FOR LOGIN MANAGER
GO

USE CIELOAZUL
GO
EXEC sp_addrolemember
	'db_owner',
	'MANAGER'
GO

/*-------------------------------------------------------------------------------------------------------*/

CREATE LOGIN GESTIONADOR
	WITH PASSWORD = '321'

USE CIELOAZUL
GO
CREATE USER GESTIONADOR FOR LOGIN GESTIONADOR
GO

USE CIELOAZUL
GO
EXEC sp_addrolemember
	'db_ddladmin',
	'GESTIONADOR'
GO




/*USE CIELOAZUL
SELECT login_name ,
COUNT(session_id) AS 'Inicio de sesion', 
GETDATE() AS timestamp
FROM sys.dm_exec_sessions
GROUP BY login_name;*/  
