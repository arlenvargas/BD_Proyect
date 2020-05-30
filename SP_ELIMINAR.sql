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
		ELSE
			BEGIN
			IF EXISTS ( SELECT IdCocinero FROM Cocineros WHERE Cocineros.IdEmpleado = @Dni )
				BEGIN
					PRINT 'Desde if exist'
						DECLARE @IdCocinero varchar(12)
						SELECT @IdCocinero = Cocineros.IdCocinero FROM Cocineros WHERE Cocineros.IdEmpleado = @Dni
						DELETE FROM Pinches WHERE Pinches.IdCocinero = @IdCocinero
			END

			DELETE FROM Empleados WHERE Empleados.Dni = @Dni
			PRINT 'SE HA ELIMINADO EL EMPLEADO'
	END
	EXEC EliminarEmpleado '505050505'



-------------------------------------------------Eliminar Cocinero------------------------------------------------------------------
USE CIELOAZUL
GO
CREATE PROC EliminarCocinero (@IdCocinero INT)
AS
	IF (@IdCocinero = '') 
		BEGIN
			PRINT 'EL ID DE COCINERO NO PUEDE SER VACIO'
		END
	ELSE
		BEGIN
		    DELETE FROM Pinches WHERE Pinches.IdCocinero = @IdCocinero
			PRINT 'SE HA ELIMINADO EL PINCHE'
			DELETE FROM Cocineros WHERE Cocineros.IdCocinero = @IdCocinero
			PRINT 'SE HA ELIMINADO EN COCINERO'
	END
EXEC EliminarCocinero '1'

SELECT IdCocinero, AnniosServicio, IdEmpleado FROM Cocineros

------------------------------------------------EliminarPinches----------------------------------------------------

USE CIELOAZUL
GO
CREATE PROC EliminaPinches (@IdPinche varchar(8)
                          
)
AS
		IF ((@IdPinche = '')  )
		BEGIN
			PRINT 'NO SE PERMITEN CAMPOS VACIOS'
		END

		ELSE
   
		BEGIN
		    DELETE FROM Empleados WHERE Empleados.Dni = @IdPinche
			PRINT 'SE HA ELIMINADO CORRECTAMENTE EL EMPLEADO'
			DELETE FROM Pinches WHERE Pinches.IdPinche = @IdPinche
			PRINT 'SE HA ELIMINADO EL COCINERO'
	
	END
		
EXEC EliminaPinches 3

SELECT IdPinche,IdCocinero,FechaNacimiento,IdEmpleado  FROM Pinches
