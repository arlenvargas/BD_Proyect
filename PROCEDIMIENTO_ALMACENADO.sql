USE CIELOAZUL
GO
CREATE PROC CrearEmpleado (@Dni varchar(12),
    @Nombre varchar(30),
    @Apellido1 varchar(40),
    @Apellido2 varchar(40),
    @NumSeguro varchar(20),
    @NumTelefono varchar(12),
    @NumCelular varchar(12))
AS
	IF ((@Dni = '') OR (@Nombre = '') OR ( @Apellido1 = '') OR (@Apellido2 = '') OR (@NumTelefono = '') OR (@NumCelular = '') OR (@NumSeguro = ''))
		BEGIN
			PRINT 'NO SE PERMITEN CAMPOS VACIOS'
		END
	ELSE IF(ISNUMERIC(@NumSeguro) = 0)
	    BEGIN
            PRINT  'NUMERO DE SEGURO DEBE SER DATOS NUMERICOS'
        END
	ELSE IF(ISNUMERIC(@NumCelular) = 0 OR ISNUMERIC(@NumTelefono) = 0)
	    BEGIN
            PRINT  'NUMERO CELUCAR Y TELEFONO DEBE SER DATOS NUMERICOS'
        END
	ELSE IF (EXISTS(SELECT Dni FROM Empleados WHERE Dni=@Dni))
		BEGIN
			PRINT 'EL EMPLEADO YA EXISTE'
		END
	ELSE
		BEGIN
			INSERT INTO Empleados( Dni, Nombre, Apellido1, Apellido2, NumSeguro, NumTelefono, NumCelular)
			VALUES (@Dni, @Nombre, @Apellido1, @Apellido2, CONVERT(int, @NumSeguro), @NumTelefono, @NumCelular)
			PRINT 'EL REGISTRO SE HA INGRESADO CORRECTAMENTE'
		END
GO
 EXEC CrearEmpleado '504190041', 'Luis', 'Rodriguez', 'Baltodano', 12345, '26656565', 83537229
  EXEC CrearEmpleado '505050505', 'Luis', 'Rodriguez', 'Baltodano', 12345, '26656565', 83537229
/*------------------------------------------------------------------------------------------------------------------------------*/

USE CIELOAZUL
GO
CREATE PROC CrearCocineros (@AnniosServicio varchar(2), @IdEmpleado varchar(12))
AS
	IF((ISNUMERIC(@AnniosServicio) = 0) OR (CONVERT(int, @AnniosServicio) < 0))
		BEGIN
			PRINT 'LOS AÑOS DE SERVICIO DEBE SER DATOS NUMERICOS Y NO PUEDE SER NEGATIVO' 
		END
	ELSE IF ((@IdEmpleado='') OR (@AnniosServicio = ''))
		BEGIN
			PRINT 'NO SE PERMITEN CAMPOS VACIOS'
		END
	ELSE IF (NOT EXISTS(SELECT Dni FROM Empleados WHERE Dni=@IdEmpleado))
		BEGIN
			PRINT 'EL ID DE EMPLEADO NO EXISTE'
		END
	ELSE IF (EXISTS(SELECT IdEmpleado FROM Cocineros WHERE IdEmpleado=@IdEmpleado))
		BEGIN
			PRINT 'ESTE COCINERO YA EXISTE'
		END
	ELSE
		BEGIN
			INSERT INTO Cocineros(AnniosServicio,IdEmpleado)
			VALUES (CONVERT(int, @AnniosServicio) ,@IdEmpleado)
			PRINT 'EL REGISTRO SE HA INGRESADO CORRECTAMENTE'
		END
GO
EXEC CrearCocineros 5, '504190041'
/*------------------------------------------------------------------------------------------------------------------------------*/

USE CIELOAZUL
GO
CREATE PROC CrearPinches (@IdCocinero varchar(5), @FechaNacimiento varchar(10), @IdEmpleado varchar(12))
AS
	IF (@IdCocinero='' OR @FechaNacimiento = '' OR @IdEmpleado='')
		BEGIN
			PRINT 'NO SE PERMITEN CAMPOS VACIOS'
		END
	ELSE IF(ISNUMERIC(@IdCocinero) = 0)
	    BEGIN
            PRINT 'EL ID COCINERO DEBE SER DATOS NUMERICOS'
        END
	ELSE IF(ISDATE(@FechaNacimiento) = 0)
	    BEGIN
            PRINT 'EL FORMATO FECHA NACIMIENTO CORRECTO ES "2000/12/25"'
        END
	ELSE IF NOT EXISTS(SELECT IdCocinero FROM Cocineros WHERE IdCocinero = @IdCocinero)
		BEGIN
			PRINT 'EL ID DE COCINERO YA EXISTE'
		END
	ELSE IF NOT EXISTS(SELECT Dni FROM Empleados WHERE Dni = @IdEmpleado)
		BEGIN
			PRINT 'EL ID DE EMPLEADO NO EXISTE'
		END
	ELSE IF (EXISTS(SELECT IdEmpleado FROM Pinches WHERE IdEmpleado=@IdEmpleado))
		BEGIN
			PRINT 'ESTE EMPLEADO YA ES UN PINCHE'
		END
	ELSE IF (EXISTS(SELECT IdEmpleado FROM Cocineros WHERE IdEmpleado=@IdEmpleado))
		BEGIN
			PRINT 'ESTE EMPLEADO YA ES UN COCINERO'
		END
	ELSE
		BEGIN
			INSERT INTO Pinches(IdCocinero,FechaNacimiento,IdEmpleado)
			VALUES (CONVERT(int, @IdCocinero), CONVERT(date, @FechaNacimiento), @IdEmpleado)
			PRINT 'EL REGISTRO SE HA INGRESADO CORRECTAMENTE'
		END
GO

EXEC CrearPinches 1, '2020/05/28', '505050505'


/*------------------------------------------------------------------------------------------------------------------------------*/

USE CIELOAZUL
GO
CREATE PROC CrearPlato (@NombrePlato varchar(50), @Precio varchar(5))
AS
	IF(@NombrePlato = '' OR @Precio = '')
		BEGIN
			PRINT 'NO SE PERMITEN CAMPOS NULOS'
		END
	ELSE IF (ISNUMERIC(@Precio) = 0) OR (CONVERT(money, @Precio) < 0)
		BEGIN
			PRINT 'EL PRECIO DEBE SER DATOS NUMERICOS Y NO PUEDE SER NEGATIVO'
		END
	ELSE
		BEGIN
			INSERT INTO Platos(NombrePlato,Precio)
			VALUES (@NombrePlato ,CONVERT(money, @Precio))
			PRINT 'EL REGISTRO SE HA INGRESADO CORRECTAMENTE'
		END
GO

/*------------------------------------------------------------------------------------------------------------------------------*/

USE CIELOAZUL
GO
CREATE PROC CrearPlatoEntrante (@IdPlato varchar(5))
AS
	IF (@IdPlato = '')
		BEGIN
			PRINT 'EL ID DEL PLATO NO DEBE SER NULO'
		END
	ELSE IF(ISNUMERIC(@IdPlato) = 0)
	    BEGIN
            PRINT 'EL CAMPO ID PLATO DEBE SER DATOS NUMERICOS Y POSITIVO'
        END
	ELSE IF NOT EXISTS(SELECT IdPlato FROM Platos WHERE IdPlato = @IdPlato)
		BEGIN
			PRINT 'EL PLATO NO EXISTE'
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
			PRINT 'EL ID DEL PLATO NO DEBE SER NULO'
		END
	ELSE IF(ISNUMERIC(@IdPlato) = 0)
	    BEGIN
            PRINT 'EL CAMPO ID PLATO DEBE SER DATOS NUMERICOS Y POSITIVO'
        END
	ELSE IF NOT EXISTS(SELECT IdPlato FROM Platos WHERE IdPlato=@IdPlato)
		BEGIN
			PRINT 'EL PLATO NO EXISTE'
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
			print 'EL ID DEL PLATO NO DEBE SER NULO'
		END
	ELSE IF(ISNUMERIC(@IdPlato) = 0)
	    BEGIN
            PRINT 'EL CAMPO ID PLATO DEBE SER DATOS NUMERICOS Y POSITIVO'
        END
	ELSE IF NOT EXISTS(SELECT IdPlato FROM Platos WHERE IdPlato = @IdPlato)
		BEGIN
			PRINT 'EL PLATO NO EXISTE'
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
			PRINT 'EL ID DEL PLATO NO DEBE DE SER NULO'
		END
	ELSE IF(ISNUMERIC(@IdPlato) = 0)
	    BEGIN
            PRINT 'EL CAMPO ID PLATO DEBE SER DATOS NUMERICOS Y POSITIVO'
        END
	ELSE IF NOT EXISTS(SELECT IdPlato FROM Platos WHERE IdPlato=@IdPlato)
		BEGIN
			PRINT 'EL PLATO NO EXISTE'
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
			PRINT 'LOS CAMPOS NO DEBEN DE SER NULOS'
		END
	ELSE IF((ISNUMERIC(@NumAlmacen) = 0) OR (CONVERT(int, @NumAlmacen) < 0))
	    BEGIN
            PRINT 'EL ID ALMACEN DEBE SER DATOS NUMERICOS Y NO DEBE SER NEGATIVO'
        END
	ELSE IF (EXISTS(SELECT NumAlmacen FROM Almacenes WHERE NumAlmacen=@NumAlmacen))
		BEGIN
			PRINT 'EL ALMACEN YA EXISTE'
		END	
	ELSE
		BEGIN
			INSERT INTO Almacenes(NumAlmacen, Nombre, Descripcion)
			Values (CONVERT(int, @NumAlmacen), @Nombre, @Descripcion)
			PRINT 'EL REGISTRO SE HA INGRESADO CORRECTAMENTE'
		END
GO

/*------------------------------------------------------------------------------------------------------------------------------*/

USE CIELOAZUL
GO
CREATE PROC CrearEstante (@IdEstante varchar(2), @TamCentimetros varchar(5), @IdAlmecen varchar(5))
AS
	IF ((@IdEstante = '') OR (@TamCentimetros = '') OR (@IdAlmecen = ''))
		BEGIN
			PRINT 'LOS CAMPOS NO DEBEN DE SER NULOS'
		END
	ELSE IF (len(@IdEstante) != 2)
		BEGIN
			PRINT 'EL ID DE ESTANTE DEBE SER DE DOS CARACTERES'
		END
	ELSE IF ((CONVERT(float, @TamCentimetros) < 0) OR (ISNUMERIC(@TamCentimetros) = 0))
		BEGIN
			PRINT 'ESTE CAMPO DEBE SER DATOS NUMERICOS Y NO PUEDE SER NEGATIVO'
		END
	ELSE IF(ISNUMERIC(@IdAlmecen) = 0)
	    BEGIN
            PRINT 'EL ID ALMACEN DEBE SER DATOS NUMERICOS'
        END
	ELSE IF (EXISTS(SELECT IdEstante FROM Estantes WHERE IdEstante=@IdEstante))
		BEGIN
			PRINT 'EL ESTANTE YA EXISTE'
		END
	ELSE IF NOT EXISTS(SELECT NumAlmacen FROM Almacenes WHERE NumAlmacen = CONVERT(int, @IdAlmecen))
		BEGIN
			PRINT 'EL ID DEL ALMACEN NO EXISTE'
		END
	ELSE
		BEGIN
			INSERT INTO Estantes(IdEstante, TamCentimetros,IdAlmecen)
			Values (@IdEstante, CONVERT(float, @TamCentimetros), CONVERT(int, @IdAlmecen))
			PRINT 'EL REGISTRO SE HA INGRESADO CORRECTAMENTE'
		END
GO

/*------------------------------------------------------------------------------------------------------------------------------*/

USE CIELOAZUL
GO
CREATE PROC CrearIngredientes (@NombreIngrediente varchar(30), @CantidadIngrediente varchar(5), @IdEstante varchar(2))
AS
	IF (@NombreIngrediente = '' OR @CantidadIngrediente = '' OR @IdEstante = '')
		BEGIN
			PRINT 'NO SE PERMITEN CAMPOS NULOS'
		END
	ELSE IF((ISNUMERIC(@CantidadIngrediente) = 0) OR (CONVERT(int, @CantidadIngrediente) < 0))
		BEGIN 
			PRINT 'ESTE CAMPO SOLO DEBE SER DATOS NUMERICOS Y NO PUEDE SER NEGATIVO'
		END
	ELSE IF NOT EXISTS(SELECT IdEstante FROM Estantes WHERE IdEstante=@IdEstante)
		BEGIN
			PRINT 'EL ESTANTE NO EXISTE'
		END
	ELSE
		BEGIN
			INSERT INTO Ingredientes (NombreIngrediente, CantidadIngrediente, IdEstante)
			VALUES (@NombreIngrediente, CONVERT(int, @CantidadIngrediente), @IdEstante)
			PRINT 'EL REGISTRO SE HA INGRESADO CORRECTAMENTE'
		END
GO

/*------------------------------------------------------------------------------------------------------------------------------*/

USE CIELOAZUL
GO
CREATE PROC CrearPlatoIngredientes (@CantidadIngrediente varchar(5), @IdIngrediente varchar(5), @IdPlato varchar(5))
AS
	IF ((@CantidadIngrediente = '') OR (@IdIngrediente='') OR (@IdPlato = ''))
		BEGIN
			PRINT 'ESTOS CAMPOS NO PUEDEN SER NULOS'
		END
	ELSE IF((ISNUMERIC(@CantidadIngrediente) = 0) OR (ISNUMERIC(@IdIngrediente) = 0) OR (ISNUMERIC(@IdPlato) = 0))
	    BEGIN
            PRINT 'ESTOS CAMPOS SOLO DEBE SER DATOS NUMERICO'
        END
	ELSE IF(CONVERT(int, @CantidadIngrediente) < 0)
		BEGIN
			PRINT 'ESTE CAMPO NO PUEDE SER NEGATIVO'
		END
	ELSE IF NOT EXISTS(SELECT IdIngrediente FROM Ingredientes WHERE IdIngrediente = CONVERT(int, @IdIngrediente))
		BEGIN
			PRINT 'EL INGREDIENTE NO EXISTE'
		END
	ELSE IF NOT EXISTS(SELECT IdPlato FROM Platos WHERE IdPlato = CONVERT(int, @IdPlato))
		BEGIN
			PRINT 'EL PLATO NO EXISTE'
		END
	ELSE
		BEGIN
			INSERT INTO PlatoIngredientes (CantidadIngrediente, IdIngrediente, IdPlato)
			VALUES (CONVERT(int, @CantidadIngrediente), CONVERT(int, @IdIngrediente), CONVERT(int, @IdPlato))
			PRINT 'EL REGISTRO SE HA INGRESADO CORRECTAMENTE'
		END
GO

/*------------------------------------------------------------------------------------------------------------------------------*/ 

USE CIELOAZUL
GO
CREATE PROC CrearConocePlato (@IdPlato varchar(5), @IdCocinero varchar(5))
AS
	IF ((@IdPlato = '') OR (@IdCocinero=''))
		BEGIN
			PRINT 'ESTOS CAMPOS NO PUEDEN SER NULOS'
		END
	ELSE IF((ISNUMERIC(@IdPlato) = 0) OR (ISNUMERIC(@IdCocinero) = 0))
	    BEGIN
            PRINT 'ESTOS CAMPOS DEBEN SER NUMERICOS'
        END
	ELSE IF((CONVERT(int, @IdPlato) < 0) OR (CONVERT(int, @IdCocinero) < 0))
		BEGIN
			PRINT 'ESTOS CAMPOS NO PUEDEN SER NEGATIVOS'
		END
	ELSE IF NOT EXISTS(SELECT IdPlato FROM Platos WHERE IdPlato = CONVERT(int, @IdPlato))
		BEGIN
			PRINT 'EL PLATO NO EXISTE'
		END
	ELSE IF NOT EXISTS(SELECT IdCocinero FROM Cocineros WHERE IdCocinero = CONVERT(int, @IdCocinero))
		BEGIN
			PRINT 'EL COCINERO NO EXISTE'
		END
	ELSE
		BEGIN
			INSERT INTO ConocePlato(IdPlato, IdCocinero)
			VALUES (CONVERT(int, @IdPlato), CONVERT(int, @IdCocinero))
			PRINT 'EL REGISTRO SE HA INGRESADO CORRECTAMENTE'
		END
GO

/*------------------------------------------------------------------------------------------------------------------------------*/ 

USE CIELOAZUL
GO
CREATE PROC CrearPrepararPlato (@IdConocePlato varchar(5), @IdPlato varchar(5))
AS
	IF ((@IdConocePlato = '') OR (@IdPlato=''))
		BEGIN
			PRINT 'ESTOS CAMPOS NO PUEDEN SER NULOS'
		END
	ELSE IF((ISNUMERIC(@IdConocePlato) = 0) OR (ISNUMERIC(@IdPlato) = 0))
	    BEGIN
            PRINT 'ESTOS CAMPOS DEBEN SER NUMERICOS'
        END
	ELSE IF((CONVERT(int, @IdConocePlato) < 0) OR (CONVERT(int, @IdPlato) < 0))
		BEGIN
			PRINT 'ESTE CAMPO NO PUEDE SER NEGATIVO'
		END
	ELSE IF NOT EXISTS(SELECT IdPlato FROM Platos WHERE IdPlato = CONVERT(int, @IdPlato))
		BEGIN
			PRINT 'EL PLATO NO EXISTE'
		END
	ELSE IF NOT EXISTS(SELECT IdConocePlato FROM ConocePlato WHERE IdConocePlato = CONVERT(int, @IdConocePlato))
		BEGIN
			PRINT 'EL ID DEL CONOCE PLATO NO EXISTE'
		END
	ELSE
		BEGIN
			INSERT INTO PreparaPlato(IdConocePlato, IdPlato)
			VALUES (CONVERT(int, @IdConocePlato), CONVERT(int, @IdPlato))
			PRINT 'EL REGISTRO SE HA INGRESADO CORRECTAMENTE'
		END
GO
