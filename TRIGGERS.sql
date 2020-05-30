USE CIELOAZUL
GO
CREATE TRIGGER TR_Empleado_Insertar
ON Empleados FOR INSERT
AS
DECLARE @Login varchar(50)  
SELECT @Login = login_name
FROM sys.dm_exec_sessions WHERE session_id = @@SPID
INSERT INTO Auditoria values(@Login , getdate(), 'Registro empleado insertado')
GO

SELECT * FROM Auditoria

SELECT login_name 
FROM sys.dm_exec_sessions   
WHERE session_id = @@SPID
ALTER LOGIN MANAGER ENABLE;