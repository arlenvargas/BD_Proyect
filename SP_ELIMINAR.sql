-------------------------------------------------Eliminar Cocinero------------------------------------------------------------------
USE CIELOAZUL
GO
CREATE PROC EliminarCocinero (@IdCocinero INT)
AS
	IF (@IdCocinero = '') 
		BEGIN
			PRINT 'EL ID DE COCINERO NO PUEDE SER VACIO'
		END
	ELSE IF EXISTS (SELECT IdCocinero FROM Cocineros WHERE Cocineros.IdCocinero = @IdCocinero )
		BEGIN
		    DELETE FROM Pinches WHERE Pinches.IdCocinero = @IdCocinero
			PRINT 'SE HA ELIMINADO EL PINCHE'
			DELETE FROM Cocineros WHERE Cocineros.IdCocinero = @IdCocinero
			PRINT 'SE HA ELIMINADO EN COCINERO'
		END
	ELSE
		BEGIN
			PRINT 'EL COCINERO NO EXISTE'
		END
--EXEC EliminarCocinero '1'

--SELECT IdCocinero, AnniosServicio, IdEmpleado FROM Cocineros

---------------------------------------Eliminar Empleado ----------------------------------
GO
USE CIELOAZUL
GO
CREATE PROC EliminarEmpleado (@Dni VARCHAR(12))
AS
	IF (@Dni = '') 
		BEGIN
			PRINT 'EL ID DE DE EMPLEADO NO PUEDE SER VACIO'
		END
	ELSE IF EXISTS (SELECT Dni FROM Empleados WHERE Empleados.Dni = @Dni)
		BEGIN
			IF EXISTS (SELECT IdCocinero FROM Cocineros WHERE Cocineros.IdEmpleado = @Dni )
				BEGIN
					PRINT 'Desde if exist'
					DECLARE @IdCocinero varchar(12)
					SELECT @IdCocinero = Cocineros.IdCocinero FROM Cocineros WHERE Cocineros.IdEmpleado = @Dni
					DELETE FROM Pinches WHERE Pinches.IdCocinero = @IdCocinero
				END
			DELETE FROM Empleados WHERE Empleados.Dni = @Dni
			PRINT 'SE HA ELIMINADO EL EMPLEADO'
		END
	ELSE
		BEGIN
			PRINT 'EL DNI NO EXISTE'
		END
	--EXEC EliminarEmpleado '505050505'