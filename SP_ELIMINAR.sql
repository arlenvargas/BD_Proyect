--------------------------------------------------Eliminar Empleado--------------------------------------------------
GO
USE CIELOAZUL
GO
CREATE PROC SP_EliminarEmpleado (@Dni VARCHAR(12))
AS
	IF (@Dni = '') 
		BEGIN
			PRINT 'EL ID DE DE EMPLEADO NO PUEDE SER VACIO'
		END
	ELSE IF EXISTS (SELECT Dni FROM Empleados WHERE Empleados.Dni = @Dni)
		BEGIN
			IF EXISTS (SELECT IdCocinero FROM Cocineros WHERE Cocineros.IdEmpleado = @Dni )
				BEGIN
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
GO

-------------------------------------------------Eliminar Cocinero------------------------------------------------------------------
USE CIELOAZUL
GO
CREATE PROC SP_EliminarCocinero (@IdCocinero INT)
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
GO

--------------------------------------------------Eliminar Pinche------------------------------------------------------------
USE CIELOAZUL
GO
CREATE PROC SP_EliminarPinche (@IdPinche VARCHAR(12))
AS
	IF (@IdPinche = '') 
		BEGIN
			PRINT 'EL ID DE DE PINCHE NO PUEDE SER VACIO'
		END
	ELSE IF (ISNUMERIC(@IdPinche) = 0) 
		BEGIN
			PRINT 'EL ID DE DE PINCHE NO PUEDE CONTENER LETRAS'
		END
	ELSE IF EXISTS (SELECT IdPinche FROM Pinches WHERE Pinches.IdPinche = @IdPinche)
		BEGIN
			DELETE FROM Pinches WHERE Pinches.IdPinche = @IdPinche
			PRINT 'SE HA ELIMINADO EL PINCHE'
		END
	ELSE
		BEGIN
			PRINT 'EL ID PINCHE NO EXISTE'
		END
GO

--------------------------------------------------Eliminar Plato------------------------------------------------------------
USE CIELOAZUL
GO
CREATE PROC SP_EliminarPlato (@IdPlato VARCHAR(12))
AS
	IF (@IdPlato = '') 
		BEGIN
			PRINT 'EL ID DE DE PLATO NO PUEDE SER VACIO'
		END
	ELSE IF (ISNUMERIC(@IdPlato) = 0) 
		BEGIN
			PRINT 'EL ID DE DE PLATO NO PUEDE CONTENER CARACTERES'
		END
	ELSE IF EXISTS (SELECT IdPlato FROM Platos WHERE Platos.IdPlato = @IdPlato)
		BEGIN
			DELETE FROM Platos WHERE Platos.IdPlato = @IdPlato
			PRINT 'SE HA ELIMINADO EL PLATO'
		END
	ELSE
		BEGIN
			PRINT 'EL ID PLATO NO EXISTE'
		END
GO

--------------------------------------------------Eliminar Entrante------------------------------------------------------------
USE CIELOAZUL
GO
CREATE PROC SP_EliminarPlatoEntrante (@IdEntrante VARCHAR(12))
AS
	IF (@IdEntrante = '') 
		BEGIN
			PRINT 'EL ID DE DE PLATO ENTRANTE NO PUEDE SER VACIO'
		END
	ELSE IF (ISNUMERIC(@IdEntrante) = 0) 
		BEGIN
			PRINT 'EL ID DE DE PLATO ENTRANTE NO PUEDE CONTENER CARACTERES'
		END
	ELSE IF EXISTS (SELECT IdEntrante FROM Entrantes WHERE Entrantes.IdEntrante = @IdEntrante)
		BEGIN
			DELETE FROM Entrantes WHERE Entrantes.IdEntrante = @IdEntrante
			PRINT 'SE HA ELIMINADO EL PLATO ENTRANTE'
		END
	ELSE
		BEGIN
			PRINT 'EL ID PLATO ENTRANTE NO EXISTE'
		END
GO

--------------------------------------------------Eliminar Primer Plato------------------------------------------------------------
USE CIELOAZUL
GO
CREATE PROC SP_EliminarPrimerPlato (@IdPrimerPlato VARCHAR(12))
AS
	IF (@IdPrimerPlato = '') 
		BEGIN
			PRINT 'EL ID DE DE PRIMER PLATO NO PUEDE SER VACIO'
		END
	ELSE IF (ISNUMERIC(@IdPrimerPlato) = 0) 
		BEGIN
			PRINT 'EL ID DE DE PRIMER PLATO NO PUEDE CONTENER CARACTERES'
		END
	ELSE IF EXISTS (SELECT @IdPrimerPlato FROM PrimerPlato WHERE PrimerPlato.IdPrimerPlato = @IdPrimerPlato)
		BEGIN
			DELETE FROM PrimerPlato WHERE PrimerPlato.IdPrimerPlato = @IdPrimerPlato
			PRINT 'SE HA ELIMINADO EL PRIMER PLATO '
		END
	ELSE
		BEGIN
			PRINT 'EL ID DE PRIMER PLATO NO EXISTE'
		END

	EXEC SP_EliminarPrimerPlato '1'
GO

--------------------------------------------------Eliminar Segundo Plato------------------------------------------------------------
USE CIELOAZUL
GO
CREATE PROC SP_EliminarSegundoPlato (@IdSegundoPlato VARCHAR(12))
AS
	IF (@IdSegundoPlato = '') 
		BEGIN
			PRINT 'EL ID DE DE SEGUNDO PLATO NO PUEDE SER VACIO'
		END
	ELSE IF (ISNUMERIC(@IdSegundoPlato) = 0) 
		BEGIN
			PRINT 'EL ID DE DE SEGUNDO PLATO NO PUEDE CONTENER CARACTERES'
		END
	ELSE IF EXISTS (SELECT @IdSegundoPlato FROM SegundoPlato WHERE SegundoPlato.IdSegundoPlato = @IdSegundoPlato)
		BEGIN
			DELETE FROM SegundoPlato WHERE SegundoPlato.IdSegundoPlato = @IdSegundoPlato
			PRINT 'SE HA ELIMINADO EL SEGUNDO PLATO '
		END
	ELSE
		BEGIN
			PRINT 'EL ID DE SEGUNDO PLATO NO EXISTE'
		END
GO

--------------------------------------------------Eliminar Postre------------------------------------------------------------
USE CIELOAZUL
GO
CREATE PROC SP_EliminarPostre (@IdPostre VARCHAR(12))
AS
	IF (@IdPostre = '') 
		BEGIN
			PRINT 'EL ID DEL POSTRE NO PUEDE SER VACIO'
		END
	ELSE IF (ISNUMERIC(@IdPostre) = 0) 
		BEGIN
			PRINT 'EL ID DE DEL POSTRE NO PUEDE CONTENER CARACTERES'
		END
	ELSE IF EXISTS (SELECT @IdPostre FROM Postres WHERE Postres.IdPostre = @IdPostre)
		BEGIN
			DELETE FROM Postres WHERE Postres.IdPostre = @IdPostre
			PRINT 'SE HA ELIMINADO EL POSTRE '
		END
	ELSE
		BEGIN
			PRINT 'EL ID DE POSTRE NO EXISTE'
		END
GO

--------------------------------------------------Eliminar Almacen------------------------------------------------------------
USE CIELOAZUL
GO
CREATE PROC SP_EliminarAlmacen (@NumAlmacen VARCHAR(12))
AS
	IF (@NumAlmacen = '') 
		BEGIN
			PRINT 'EL ID DEL ALMACEN NO PUEDE SER VACIO'
		END
	ELSE IF (ISNUMERIC(@NumAlmacen) = 0) 
		BEGIN
			PRINT 'EL ID DEL ALMACEN NO PUEDE CONTENER CARACTERES'
		END
	ELSE IF EXISTS (SELECT @NumAlmacen FROM Almacenes WHERE Almacenes.NumAlmacen = @NumAlmacen)
		BEGIN
			DELETE FROM Almacenes WHERE Almacenes.NumAlmacen = @NumAlmacen
			PRINT 'SE HA ELIMINADO EL ALMACEN '
		END
	ELSE
		BEGIN
			PRINT 'EL ID DE ALMACEN NO EXISTE'
		END
GO

--------------------------------------------------Eliminar Estante------------------------------------------------------------
USE CIELOAZUL
GO
CREATE PROC SP_EliminarEstante (@IdEstante VARCHAR(12))
AS
	IF (@IdEstante = '') 
		BEGIN
			PRINT 'EL ID DEL ESTANTE NO PUEDE SER VACIO'
		END
	ELSE IF (ISNUMERIC(@IdEstante) = 0) 
		BEGIN
			PRINT 'EL ID DEL ESTANTE NO PUEDE CONTENER CARACTERES'
		END
	ELSE IF EXISTS (SELECT @IdEstante FROM Estantes WHERE Estantes.IdEstante = @IdEstante)
		BEGIN
			DELETE FROM Estantes WHERE Estantes.IdEstante = @IdEstante
			PRINT 'SE HA ELIMINADO EL ESTANTE '
		END
	ELSE
		BEGIN
			PRINT 'EL ID DE ALMACEN NO EXISTE'
		END
GO

--------------------------------------------------Eliminar Ingrediente------------------------------------------------------------
USE CIELOAZUL
GO
CREATE PROC SP_EliminarIngrediente (@IdIngrediente VARCHAR(12))
AS
	IF (@IdIngrediente = '') 
		BEGIN
			PRINT 'EL ID DEL INGREDIENTE NO PUEDE SER VACIO'
		END
	ELSE IF (ISNUMERIC(@IdIngrediente) = 0) 
		BEGIN
			PRINT 'EL ID DEL INGREDIENTE NO PUEDE CONTENER CARACTERES'
		END
	ELSE IF EXISTS (SELECT @IdIngrediente FROM Ingredientes WHERE Ingredientes.IdIngrediente = @IdIngrediente)
		BEGIN
			DELETE FROM Ingredientes WHERE Ingredientes.IdIngrediente = @IdIngrediente
			PRINT 'SE HA ELIMINADO EL INGREDIENTE '
		END
	ELSE
		BEGIN
			PRINT 'EL ID DE INGREDIENTE NO EXISTE'
		END
GO

--------------------------------------------------Eliminar Plato Ingrediente------------------------------------------------------------
USE CIELOAZUL
GO
CREATE PROC SP_EliminarPlatoIngrediente (@IdPlatoIngrediente VARCHAR(12))
AS
	IF (@IdPlatoIngrediente = '') 
		BEGIN
			PRINT 'EL ID DEL PLATO INGREDIENTE NO PUEDE SER VACIO'
		END
	ELSE IF (ISNUMERIC(@IdPlatoIngrediente) = 0) 
		BEGIN
			PRINT 'EL ID DEL PLATO INGREDIENTE NO PUEDE CONTENER CARACTERES'
		END
	ELSE IF EXISTS (SELECT @IdPlatoIngrediente FROM PlatoIngredientes WHERE PlatoIngredientes.IdPlatoIngrediente = @IdPlatoIngrediente)
		BEGIN
			DELETE FROM PlatoIngredientes WHERE PlatoIngredientes.IdPlatoIngrediente = @IdPlatoIngrediente
			PRINT 'SE HA ELIMINADO EL PLATO INGREDIENTE '
		END
	ELSE
		BEGIN
			PRINT 'EL ID DE PLATO INGREDIENTE NO EXISTE'
		END
GO

--------------------------------------------------Eliminar Conoce Plato------------------------------------------------------------
USE CIELOAZUL
GO
CREATE PROC SP_EliminarConocePlato (@IdConocePlato VARCHAR(12))
AS
	IF (@IdConocePlato = '') 
		BEGIN
			PRINT 'EL ID DEL CONOCE PLATO NO PUEDE SER VACIO'
		END
	ELSE IF (ISNUMERIC(@IdConocePlato) = 0) 
		BEGIN
			PRINT 'EL ID DEL CONOCE PLATO NO PUEDE CONTENER CARACTERES'
		END
	ELSE IF EXISTS (SELECT @IdConocePlato FROM ConocePlato WHERE ConocePlato.IdConocePlato = @IdConocePlato)
		BEGIN
			DELETE FROM ConocePlato WHERE ConocePlato.IdConocePlato = @IdConocePlato
			PRINT 'SE HA ELIMINADO EL CONOCE PLATO '
		END
	ELSE
		BEGIN
			PRINT 'EL ID DE CONOCE PLATO NO EXISTE'
	END
GO

--------------------------------------------------Eliminar Preparar Plato------------------------------------------------------------
USE CIELOAZUL
GO
CREATE PROC SP_EliminarPrepararPlato (@IdPreparaPlato VARCHAR(12))
AS
	IF (@IdPreparaPlato = '') 
		BEGIN
			PRINT 'EL ID DEL PREPARA PLATO NO PUEDE SER VACIO'
		END
	ELSE IF (ISNUMERIC(@IdPreparaPlato) = 0) 
		BEGIN
			PRINT 'EL ID DEL PREPARA PLATO NO PUEDE CONTENER CARACTERES'
		END
	ELSE IF EXISTS (SELECT @IdPreparaPlato FROM PreparaPlato WHERE PreparaPlato.IdPreparaPlato = @IdPreparaPlato)
		BEGIN
			DELETE FROM PreparaPlato WHERE PreparaPlato.IdPreparaPlato = @IdPreparaPlato
			PRINT 'SE HA ELIMINADO EL CONOCE PLATO '
		END
	ELSE
		BEGIN
			PRINT 'EL ID DE CONOCE PLATO NO EXISTE'
	END
GO



