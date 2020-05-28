USE CIELOAZUL
GO
CREATE PROC CrearEmpleado (
	@Dni varchar(12),
    @Nombre varchar(30),
    @Apellido1 varchar(40),
    @Apellido2 varchar(40),
    @NumSeguro varchar(20),
    @NumTelefono varchar(12),
    @NumCelular varchar(12))
AS
	IF ((@Dni = '') OR (@Nombre = '') OR ( @Apellido1 = '') OR (@Apellido2 = '') OR (@NumTelefono = '') OR (@NumCelular = '') OR (@NumSeguro = ''))
		BEGIN
			PRINT 'No se permiten campos vacios'
		END
	ELSE IF(ISNUMERIC(@NumSeguro) = 0)
	    BEGIN
            PRINT  'Numero de seguro debe ser un numero valido'
        END
	ELSE IF(ISNUMERIC(@NumCelular) = 0 OR ISNUMERIC(@NumTelefono) = 0)
	    BEGIN
            PRINT  'Numero de ceuluar y telefono deben ser un numero valido'
        END
	ELSE
		BEGIN
			INSERT INTO Empleados( Dni, Nombre, Apellido1, Apellido2, NumSeguro, NumTelefono, NumCelular)
			VALUES (@Dni, @Nombre, @Apellido1, @Apellido2, CONVERT(int, @NumSeguro), @NumTelefono, @NumCelular)
			PRINT 'EL REGISTRO SE HA INGRESADO CORRECTAMENTE'
		END
GO

EXEC CrearEmpleado '504190041','Luis','Rodriguez', 'Baltodano','514267', '26652525', '83537229'
EXEC CrearEmpleado '501457820','Tatiana','MORales', 'Mendes',124587, '26652525', '66666666'

SELECT Dni, Nombre, Apellido1, Apellido2, NumSeguro, NumTelefono, NumCelular  FROM Empleados
/*------------------------------------------------------------------------------------------------------------------------------*/

USE CIELOAZUL
GO
CREATE PROC CrearCocineros (@AnniosServicio varchar(2), @IdEmpleado varchar(12))
AS
	IF((ISNUMERIC(@AnniosServicio) = 0) OR (CONVERT(int, @AnniosServicio) < 0))
		BEGIN
			PRINT 'El campo años de servicios no puede ser negativo y debe ser datos numericos' 
		END
	ELSE IF ((@IdEmpleado='') OR (@AnniosServicio = ''))
		BEGIN
			PRINT 'No se permiten campos vacios'
		END
	ELSE IF (NOT EXISTS(SELECT Dni FROM Empleados WHERE Dni=@IdEmpleado))
		BEGIN
			PRINT 'EL id del empleado no exite'
		END
	ELSE
		BEGIN
			INSERT INTO Cocineros(AnniosServicio,IdEmpleado)
			VALUES (CONVERT(int, @AnniosServicio) ,@IdEmpleado)
			PRINT 'EL REGISTRO SE HA INGRESADO CORRECTAMENTE'
		END
GO


EXEC CrearCocineros '12', '501457820'
EXEC CrearCocineros '2','501457820'

SELECT IdCocinero, AnniosServicio, IdEmpleado FROM Cocineros

/*------------------------------------------------------------------------------------------------------------------------------*/

USE CIELOAZUL
GO
CREATE PROC CrearPinches (@IdCocinero varchar(5), @FechaNacimiento date, @IdEmpleado varchar(12))
AS
	IF (@IdCocinero='' OR @FechaNacimiento = '' OR @IdEmpleado='')
		BEGIN
			PRINT 'No se permiten campos vacios'
		END
	ELSE IF(ISNUMERIC(@IdCocinero) = 0)
	    BEGIN
            PRINT 'El campo Id cocinero debe ser un número valido y positivo'
        END
	ELSE IF NOT EXISTS(SELECT IdCocinero FROM Cocineros WHERE IdCocinero = @IdCocinero)
		BEGIN
			PRINT 'EL id cocinero no exite'
		END
	ELSE IF NOT EXISTS(SELECT Dni FROM Empleados WHERE Dni = @IdEmpleado)
		BEGIN
			PRINT 'EL id del empleado no exite'
		END
	ELSE
		BEGIN
			INSERT INTO Pinches(IdCocinero,FechaNacimiento,IdEmpleado)
			VALUES (CONVERT(int, @IdCocinero), @FechaNacimiento, @IdEmpleado)
			PRINT 'EL REGISTRO SE HA INGRESADO CORRECTAMENTE'
		END
GO


EXEC CrearPinches 1, '1997/11/05', '504190041'
EXEC CrearPinches  1, '1997/11/05', '501457820'

SELECT IdPinche,IdCocinero,FechaNacimiento,IdEmpleado  FROM Pinches
/*------------------------------------------------------------------------------------------------------------------------------*/

USE CIELOAZUL
GO
CREATE PROC CrearPlato (@NombrePlato varchar(50), @Precio varchar(5), @IdCocinero varchar(5))
AS
	IF(@NombrePlato = '' OR @Precio = '' OR @IdCocinero = '')
		BEGIN
			PRINT 'No se permiten campos vacios'
		END
	ELSE IF((ISNUMERIC(@IdCocinero) = 0) OR (CONVERT(int, @IdCocinero) < 0))
	    BEGIN
            PRINT 'El campo Id cocinero debe ser un numero valido y positivo'
        END
	ELSE IF (ISNUMERIC(@Precio) = 0) OR (CONVERT(money, @Precio) < 0)
		BEGIN
			PRINT 'El precio debe ser datos numericos y no debe ser negativo'
		END
	ELSE IF NOT EXISTS(SELECT IdCocinero FROM Cocineros WHERE IdCocinero=@IdCocinero)
		BEGIN
			PRINT 'EL id cocinero no exite'
		END
	ELSE
		BEGIN
			INSERT INTO Platos(NombrePlato,Precio,IdCocinero)
			VALUES (@NombrePlato ,CONVERT(money, @Precio) , CONVERT(int, @IdCocinero))
			PRINT 'EL REGISTRO SE HA INGRESADO CORRECTAMENTE'
		END
GO


EXEC CrearPlato 'Pinto', 1200, 1
EXEC CrearPlato 'Arroz', 1200, 1

SELECT IdPlato,NombrePlato,Precio,IdCocinero  FROM Platos

/*------------------------------------------------------------------------------------------------------------------------------*/

USE CIELOAZUL
GO
CREATE PROC CrearPlatoEntrante (@IdPlato varchar(5))
AS
	IF (@IdPlato = '')
		BEGIN
			PRINT 'El id del plato no debe ser nulo'
		END
	ELSE IF(ISNUMERIC(@IdPlato) = 0)
	    BEGIN
            PRINT 'El campo Id plato debe ser un numero valido y positivo'
        END
	ELSE IF NOT EXISTS(SELECT IdPlato FROM Platos WHERE IdPlato = @IdPlato)
		BEGIN
			PRINT 'EL id del plato no exite'
		END
	ELSE
		BEGIN
			INSERT INTO Entrantes(IdPlato)
			VALUES (CONVERT(int, @IdPlato))
			PRINT 'EL REGISTRO SE HA INGRESADO CORRECTAMENTE'
		END
GO

/*------------------------------------------------------------------------------------------------------------------------------*/

USE CIELOAZUL
GO
CREATE PROC CrearPrimerPlato (@IdPlato varchar(5))
AS
	IF (@IdPlato = '')
		BEGIN
			PRINT 'El id del plato no debe ser nulo'
		END
	ELSE IF(ISNUMERIC(@IdPlato) = 0)
	    BEGIN
            PRINT 'El campo Id plato debe ser un numero valido y positivo'
        END
	ELSE IF NOT EXISTS(SELECT IdPlato FROM Platos WHERE IdPlato=@IdPlato)
		BEGIN
			PRINT 'EL id del plato no exite'
		END
	ELSE
		BEGIN
			INSERT INTO PrimerPlato(IdPlato)
			VALUES (CONVERT(int, @IdPlato))
			PRINT 'EL REGISTRO SE HA INGRESADO CORRECTAMENTE'
		END
GO

/*------------------------------------------------------------------------------------------------------------------------------*/

USE CIELOAZUL
GO
CREATE PROC CrearSegundoPlato (@IdPlato varchar(5))
AS
	IF (@IdPlato = '')
		BEGIN
			print 'El id del plato no debe ser nulo'
		END
	ELSE IF(ISNUMERIC(@IdPlato) = 0)
	    BEGIN
            PRINT 'El campo Id plato debe ser un numero valido y positivo'
        END
	ELSE IF NOT EXISTS(SELECT IdPlato FROM Platos WHERE IdPlato = @IdPlato)
		BEGIN
			PRINT 'EL id del plato no exite'
		END
	ELSE
		BEGIN
			INSERT INTO SegundoPlato(IdPlato)
			VALUES (CONVERT(int, @IdPlato))
			PRINT 'EL REGISTRO SE HA INGRESADO CORRECTAMENTE'
		END
GO

/*------------------------------------------------------------------------------------------------------------------------------*/

USE CIELOAZUL
GO
CREATE PROC CrearPostre (@IdPlato varchar(5))
AS
	IF (@IdPlato = '')
		BEGIN
			PRINT 'El id del plato no debe ser nulo'
		END
	ELSE IF(ISNUMERIC(@IdPlato) = 0)
	    BEGIN
            PRINT 'El campo Id plato debe ser un numero valido y positivo'
        END
	ELSE IF NOT EXISTS(SELECT IdPlato FROM Platos WHERE IdPlato=@IdPlato)
		BEGIN
			PRINT 'EL id del plato no exite'
		END
	ELSE
		BEGIN
			INSERT INTO Postres(IdPlato)
			VALUES (CONVERT(int, @IdPlato))
			PRINT 'EL REGISTRO SE HA INGRESADO CORRECTAMENTE'
		END
GO

/*------------------------------------------------------------------------------------------------------------------------------*/

USE CIELOAZUL
GO
CREATE PROC CrearAlmacen (@NumAlmacen varchar(5), @Nombre varchar(40), @Descripcion varchar(100))
AS
	IF ((@NumAlmacen = '') OR (@Nombre = ''))
		BEGIN
			PRINT 'Los campos no deben ser nulos'
		END
	ELSE IF((ISNUMERIC(@NumAlmacen) = 0) OR (CONVERT(int, @NumAlmacen) < 0))
	    BEGIN
            PRINT 'El ID almacen debe ser datos numericos y no debe ser negativo'
        END
	ELSE
		BEGIN
			INSERT INTO Almacenes(NumAlmacen, Nombre, Descripcion)
			Values (CONVERT(int, @NumAlmacen), @Nombre, @Descripcion)
			PRINT 'EL REGISTRO SE HA INGRESADO CORRECTAMENTE'
		END
GO


EXEC CrearAlmacen '123', 'Almacen A1', ''
EXEC CrearAlmacen '45', 'ALMACEN A2', ''

SELECT NumAlmacen, Nombre, Descripcion FROM Almacenes

/*------------------------------------------------------------------------------------------------------------------------------*/

USE CIELOAZUL
GO
CREATE PROC CrearEstante (@IdEstante varchar(2), @TamCentimetros varchar(5), @IdAlmecen varchar(5))
AS
	IF ((@IdEstante = '') OR (@TamCentimetros = '') OR (@IdAlmecen = ''))
		BEGIN
			PRINT 'Los campos no deben ir nulos'
		END
	ELSE IF (len(@IdEstante) != 2)
		BEGIN
			PRINT 'El id de estante debe ser de dos caracteres'
		END
	ELSE IF ((CONVERT(float, @TamCentimetros) < 0) OR (ISNUMERIC(@TamCentimetros) = 0))
		BEGIN
			PRINT 'No puede ingresar valores negativos y debe ser datos numericos'
		END
	ELSE IF(ISNUMERIC(@IdAlmecen) = 0)
	    BEGIN
            PRINT 'El campo Id almacen debe ser un numero valido'
        END
	ELSE IF NOT EXISTS(SELECT NumAlmacen FROM Almacenes WHERE NumAlmacen = CONVERT(int, @IdAlmecen))
		BEGIN
			PRINT 'EL id del almacen no exite'
		END
	ELSE
		BEGIN
			INSERT INTO Estantes(IdEstante, TamCentimetros,IdAlmecen)
			Values (@IdEstante, CONVERT(float, @TamCentimetros), CONVERT(int, @IdAlmecen))
			PRINT 'EL REGISTRO SE HA INGRESADO CORRECTAMENTE'
		END
GO

EXEC CrearEstante 'AB', 5.24, '123'
SELECT IdEstante, TamCentimetros,IdAlmecen  FROM Estantes

/*------------------------------------------------------------------------------------------------------------------------------*/

USE CIELOAZUL
GO
CREATE PROC CrearIngredientes (@NombreIngrediente varchar(30), @CantidadIngrediente varchar(5), @IdEstante varchar(2))
AS
	IF (@NombreIngrediente = '' OR @CantidadIngrediente = '' OR @IdEstante = '')
		BEGIN
			PRINT 'No se permiten campos nulos'
		END
	ELSE IF((ISNUMERIC(@CantidadIngrediente) = 0) OR (CONVERT(int, @CantidadIngrediente) < 0))
		BEGIN 
			PRINT 'Este campo solo admite datos numericos y no puede ser negativo'
		END
	ELSE IF NOT EXISTS(SELECT IdEstante FROM Estantes WHERE IdEstante=@IdEstante)
		BEGIN
			PRINT 'EL id del estante no exite'
		END
	ELSE
		BEGIN
			INSERT INTO Ingredientes (NombreIngrediente, CantidadIngrediente, IdEstante)
			VALUES (@NombreIngrediente, CONVERT(int, @CantidadIngrediente), @IdEstante)
			PRINT 'EL REGISTRO SE HA INGRESADO CORRECTAMENTE'
		END
GO



EXEC CrearIngredientes 123, 100, 'AB'
EXEC CrearIngredientes 'Queso', 20, 'AB'
SELECT NombreIngrediente, CantidadIngrediente, IdEstante FROM Ingredientes
/*------------------------------------------------------------------------------------------------------------------------------*/

USE CIELOAZUL
GO
CREATE PROC CrearPlatoIngredientes (@CantidadIngrediente varchar(5), @IdIngrediente varchar(5), @IdPlato varchar(5))
AS
	IF ((@CantidadIngrediente = '') OR (@IdIngrediente='') OR (@IdPlato = ''))
		BEGIN
			PRINT 'Estos campos no pueden ser nulos'
		END
	ELSE IF((ISNUMERIC(@CantidadIngrediente) = 0) OR (ISNUMERIC(@IdIngrediente) = 0) OR (ISNUMERIC(@IdPlato) = 0))
	    BEGIN
            PRINT 'Estos campos debe ser un numero valido'
        END
	ELSE IF(CONVERT(int, @CantidadIngrediente) < 0)
		BEGIN
			PRINT 'Este campo no puede ser negativo'
		END
	ELSE IF NOT EXISTS(SELECT IdIngrediente FROM Ingredientes WHERE IdIngrediente = CONVERT(int, @IdIngrediente))
		BEGIN
			PRINT 'EL id del ingrediente no exite'
		END
	ELSE IF NOT EXISTS(SELECT IdPlato FROM Platos WHERE IdPlato = CONVERT(int, @IdPlato))
		BEGIN
			PRINT 'EL id del ingrediente no exite'
		END
	ELSE
		BEGIN
			INSERT INTO PlatoIngredientes (CantidadIngrediente, IdIngrediente, IdPlato)
			VALUES (CONVERT(int, @CantidadIngrediente), CONVERT(int, @IdIngrediente), CONVERT(int, @IdPlato))
			PRINT 'EL REGISTRO SE HA INGRESADO CORRECTAMENTE'
		END
GO


EXEC CrearPlatoIngredientes 1,1,1
EXEC CrearPlatoIngredientes 5,2,1

SELECT CantidadIngrediente, IdPlatoIngrediente, IdIngrediente FROM PlatoIngredientes

/*------------------------------------------------------------------------------------------------------------------------------*/ 

USE CIELOAZUL
GO
CREATE PROC CrearConocePlato (@IdPlato varchar(5), @IdCocinero varchar(5))
AS
	IF ((@IdPlato = '') OR (@IdCocinero=''))
		BEGIN
			PRINT 'Estos campos no pueden ser nulos'
		END
	ELSE IF((ISNUMERIC(@IdPlato) = 0) OR (ISNUMERIC(@IdCocinero) = 0))
	    BEGIN
            PRINT 'Estos campos debe ser un numero valido'
        END
	ELSE IF((CONVERT(int, @IdPlato) < 0) OR (CONVERT(int, @IdCocinero) < 0))
		BEGIN
			PRINT 'Este campo no puede ser negativo'
		END
	ELSE IF NOT EXISTS(SELECT IdPlato FROM Platos WHERE IdPlato = CONVERT(int, @IdPlato))
		BEGIN
			PRINT 'EL id del plato no exite'
		END
	ELSE IF NOT EXISTS(SELECT IdCocinero FROM Cocineros WHERE IdCocinero = CONVERT(int, @IdCocinero))
		BEGIN
			PRINT 'EL id del ingrediente no exite'
		END
	ELSE
		BEGIN
			INSERT INTO ConocePlato(IdPlato, IdCocinero)
			VALUES (CONVERT(int, @IdPlato), CONVERT(int, @IdCocinero))
			PRINT 'EL REGISTRO SE HA INGRESADO CORRECTAMENTE'
		END
GO

EXEC CrearConocePlato 1,1

SELECT IdPlato,IdCocinero FROM ConocePlato
/*------------------------------------------------------------------------------------------------------------------------------*/ 

USE CIELOAZUL
GO
CREATE PROC CrearPreparaPlato (@IdConocePlato varchar(5), @IdPlato varchar(5))
AS
	IF ((@IdConocePlato = '') OR (@IdPlato=''))
		BEGIN
			PRINT 'Estos campos no pueden ser nulos'
		END
	ELSE IF((ISNUMERIC(@IdConocePlato) = 0) OR (ISNUMERIC(@IdPlato) = 0))
	    BEGIN
            PRINT 'Estos campos debe ser un numero valido'
        END
	ELSE IF((CONVERT(int, @IdConocePlato) < 0) OR (CONVERT(int, @IdPlato) < 0))
		BEGIN
			PRINT 'Este campo no puede ser negativo'
		END
	ELSE IF NOT EXISTS(SELECT IdPlato FROM Platos WHERE IdPlato = CONVERT(int, @IdPlato))
		BEGIN
			PRINT 'EL id del plato no exite'
		END
	ELSE IF NOT EXISTS(SELECT IdConocePlato FROM ConocePlato WHERE IdConocePlato = CONVERT(int, @IdConocePlato))
		BEGIN
			PRINT 'EL id del conoce plato no exite'
		END
	ELSE
		BEGIN
			INSERT INTO PreparaPlato(IdConocePlato, IdPlato)
			VALUES (CONVERT(int, @IdConocePlato), CONVERT(int, @IdPlato))
			PRINT 'EL REGISTRO SE HA INGRESADO CORRECTAMENTE'
		END
GO

