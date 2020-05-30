------------------------------------------ActualizarEmpleado----------------------------------------------------------------
USE CIELOAZUL
GO
CREATE PROCEDURE ActualizarEmpleado
       @Dni varchar(12),
       @Nombre varchar(30),  
	   @Apellido1 varchar(40),  
	   @Apellido2 varchar(40),  
	   @NumSeguro varchar(8),  
	   @NumTelefono varchar(12),  
	   @NumCelular varchar(12)
AS
	IF (@Dni = '')
		BEGIN
			PRINT 'NO SE PERMITEN CAMPOS VACIOS'
		END
	ELSE IF ( EXISTS(SELECT Dni FROM Empleados WHERE Dni=@Dni))
		BEGIN
			IF ((@Nombre = '') OR ( @Apellido1 = '') OR (@Apellido2 = '') OR (@NumTelefono = '') OR (@NumCelular = '') OR (@NumSeguro = ''))
				BEGIN
					PRINT 'NO SE PERMITEN CAMPOS VACIOS'
				END
			ELSE IF((ISNUMERIC(@NumSeguro) = 0) OR (CONVERT(int, @NumSeguro) < 0))
				BEGIN
					PRINT  'NUMERO DE SEGURO DEBE SER DATOS NUMERICOS Y DEBE SER POSITIVO' 
				END
			ELSE IF(ISNUMERIC(@NumCelular) = 0 OR ISNUMERIC(@NumTelefono) = 0)
				BEGIN
					PRINT  'NUMERO CELUCAR Y TELEFONO DEBE SER DATOS NUMERICOS'
				END
			ELSE
				BEGIN
					UPDATE Empleados
						Set	Nombre = @Nombre,
							Apellido1 = @Apellido1,
							Apellido2 = @Apellido2,
							NumSeguro = CONVERT(int, @NumSeguro),
							NumTelefono = @NumTelefono,
							NumCelular = @NumCelular
						WHERE Dni = @Dni
						PRINT 'SE HA ACTUALIZADO CORRECTAMENTE'
				END
		END
	ELSE
        BEGIN
			PRINT 'EL ID EMPLEADO NO EXISTE'
		END
GO
------------------------------------------ActualizarCocineros----------------------------------------------------------------
USE CIELOAZUL
GO
CREATE PROCEDURE ActualizarCocinero
       @IdCocinero varchar(5),
       @AnniosServicio varchar(2),
	   @IdEmpleado varchar(12) 
AS
	IF (@IdCocinero = '')
		BEGIN
			PRINT 'NO SE PERMITEN CAMPOS VACIOS'
		END
	ELSE IF(ISNUMERIC(@IdCocinero) = 0)
		BEGIN
		     PRINT  'NUMERO DE ID DEBE SER DATOS NUMERICOS'
		END
	ELSE IF (EXISTS(SELECT IdCocinero FROM Cocineros WHERE IdCocinero = @IdCocinero))
		BEGIN
			IF ((@AnniosServicio = '') OR ( @IdEmpleado = ''))
				BEGIN
					PRINT 'NO SE PERMITEN CAMPOS VACIOS'
				END
			ELSE IF (EXISTS(SELECT IdPinche FROM Pinches WHERE IdEmpleado = @IdEmpleado))
		
				BEGIN 
					PRINT 'ESTE EMPLEADO YA ES UN PINCHE'
				END
			ELSE IF (EXISTS(SELECT IdCocinero FROM Cocineros WHERE IdEmpleado = @IdEmpleado))
				BEGIN 
					PRINT 'ESTE EMPLEADO ES UN COCINERO'
				END
			ELSE IF (NOT EXISTS(SELECT Dni FROM Empleados WHERE Dni = @IdEmpleado))
				BEGIN 
					PRINT 'ESTE ID EMPLEADO NO EXISTE'
				END
			ELSE IF(ISNUMERIC(@AnniosServicio) = 0)
				BEGIN
					PRINT  'LOS AÑOS DEBE SER NE FORMATO NUMERICO'
				END
			ELSE
				BEGIN
					UPDATE Cocineros
						Set	AnniosServicio = CONVERT(int, @AnniosServicio ),
							IdEmpleado =  @IdEmpleado
						WHERE IdCocinero = CONVERT(int, @IdCocinero)
						PRINT 'SE HA ACTUALIZADO CORRECTAMENTE'
				END
		END
	ELSE
        BEGIN
			PRINT 'EL ID COCINERO NO EXISTE'
		END
GO
-----------------------------------------------ActualizarPinches-------------------------------------------------------
USE CIELOAZUL
GO
CREATE PROCEDURE ActualizarPinche
       @IdPinche varchar(5),
       @IdCocinero varchar(5),
       @FechaNacimiento varchar(10),
	   @IdEmpleado varchar(12)
AS
	IF (@IdPinche = '')
		BEGIN
			PRINT 'NO SE PERMITEN CAMPOS VACIOS'
		END
	ELSE IF(ISNUMERIC(@IdPinche) = 0)
	     BEGIN
		      PRINT  'NUMERO DE ID DEBE SER DATOS NUMERICOS'
		END
	ELSE IF (EXISTS(SELECT IdPinche FROM Pinches WHERE IdPinche = @IdPinche))
		BEGIN
			IF ((@IdCocinero = '') OR ( @FechaNacimiento = '') OR ( @IdEmpleado = ''))
				BEGIN
					PRINT 'NO SE PERMITEN CAMPOS VACIOS'
				END
			ELSE IF(ISNUMERIC(@IdCocinero) = 0)
				BEGIN
					PRINT  'EL ID COCINERO DEBE SER FORMATO NUMERICO'
				END
			ELSE IF (NOT EXISTS(SELECT IdCocinero FROM Cocineros WHERE IdCocinero = @IdCocinero))
				BEGIN
					PRINT 'EL COCINERO NO EXISTE'
				END
			ELSE IF(ISDATE(@FechaNacimiento) = 0)
	           BEGIN
                    PRINT 'EL FORMATO FECHA NACIMIENTO CORRECTO ES "2000/12/25"'
               END
			ELSE IF (EXISTS(SELECT IdCocinero FROM Cocineros WHERE IdEmpleado = @IdEmpleado))
				BEGIN 
					PRINT 'ESTE EMLEADO YA ES UN COCINERO'
				END
			ELSE IF (EXISTS(SELECT IdPinche FROM Pinches WHERE IdEmpleado = @IdEmpleado))
				BEGIN 
					PRINT 'ESTE EMPLEADO ES UN PINCHE'
				END
		 	ELSE
				BEGIN
					UPDATE Pinches
						Set	IdCocinero = CONVERT(int, @IdCocinero ),
							FechaNacimiento = CONVERT(date, @FechaNacimiento),
							IdEmpleado = @IdEmpleado
						WHERE IdPinche = CONVERT(int, @IdPinche)
						PRINT 'SE HA ACTUALIZADO CORRECTAMENTE'
				END
		END
	ELSE
        BEGIN
			PRINT 'EL ID PINCHE NO EXISTE'
		END
GO
---------------------------------------------ActualizarPlato------------------------------------------------
USE CIELOAZUL
GO
CREATE PROCEDURE ActualizarPlato
       @IdPlato VARCHAR(10) ,
       @NombrePlato varchar(50), 
	   @Precio varchar(11)  
AS
	IF (@IdPlato = '')
		BEGIN
			PRINT 'NO SE PERMITEN CAMPOS VACIOS'
		END
	ELSE IF(ISNUMERIC(@IdPlato) = 0)
	     BEGIN
		      PRINT  'NUMERO DE ID DEBE SER DATOS NUMERICOS'
		END
	ELSE IF (EXISTS(SELECT IdPlato FROM Platos WHERE IdPlato = @IdPlato))
		BEGIN
			IF (( @NombrePlato = '') OR ( @Precio = ''))
				BEGIN
					PRINT 'NO SE PERMITEN CAMPOS VACIOS'
				END		
			ELSE IF (ISNUMERIC(@Precio) = 0) OR (CONVERT(money, @Precio) < 0)
				BEGIN
					PRINT 'EL PRECIO DEBE SER DATOS NUMERICOS Y NO PUEDE SER NEGATIVO'
				END
		 	ELSE
				BEGIN
					UPDATE Platos
						Set	NombrePlato = @NombrePlato,
							Precio = CONVERT(money ,@Precio)
					  WHERE IdPlato = CONVERT(int, @IdPlato);
					  PRINT 'SE HA ACTUALIZADO CORRECTAMENTE'
				END
		END
	ELSE
        BEGIN
			PRINT 'EL ID PLATO NO EXISTE'
		END
GO
-----------------------------------------------ActualizarPlatoEntrante---------------------------------------
USE CIELOAZUL
GO
CREATE PROCEDURE ActualizarPlatoEntrante
       @IdEntrante varchar(5),
       @IdPlato varchar(5)	 
AS
   DECLARE @hasCategory BIT = 0
	IF (@IdEntrante = '')
		BEGIN
			PRINT 'EL ID DEL PLATO NO DEBE SER NULO'
		END
	ELSE IF(ISNUMERIC(@IdEntrante) = 0)
	    BEGIN
            PRINT 'EL CAMPO ID PLATO DEBE SER DATOS NUMERICOS Y POSITIVO'
        END
	ELSE IF(EXISTS(SELECT IdEntrante FROM Entrantes WHERE IdEntrante = @IdEntrante))
		BEGIN
			IF((@IdPlato = '') OR (ISNUMERIC(@IdPlato) = 0))
				BEGIN
					PRINT 'EL ID PLATO NO DEBE SER NULO Y TIENE QUE SER NUMERICO'
				END
	        ELSE IF (NOT EXISTS(SELECT IdPlato FROM Platos WHERE IdPlato = @IdPlato))
			    BEGIN
					PRINT 'EL ID DE PLATO NO EXISTE'
				END
			ELSE
				BEGIN
					EXEC @hasCategory = SP_valida_plato_tiene_categoria @IdPlato;
					IF(@hasCategory = 0)
						BEGIN
							UPDATE Entrantes
								Set	IdPlato = CONVERT(int ,@IdPlato)
							  WHERE IdEntrante = CONVERT(int, @IdEntrante);
							  PRINT 'SE HA ACTUALIZADO CORRECTAMENTE'
						END
				END
		END
	ELSE
		BEGIN
			PRINT 'EL ID DEL PLATO ENTRANTE NO EXISTE'
		END
GO
-----------------------------------------PrimerPlato--------------------------------------
USE CIELOAZUL
GO
CREATE PROCEDURE ActualizarPrimerPlato
       @IdPrimerPlato varchar(5),
       @IdPlato varchar(5)	 
AS
   DECLARE @hasCategory BIT = 0
	IF (@IdPrimerPlato = '')
		BEGIN
			PRINT 'EL ID DEL PRIMER PLATO NO DEBE SER NULO'
		END
	ELSE IF(ISNUMERIC(@IdPrimerPlato) = 0)
	    BEGIN
            PRINT 'EL CAMPO ID PRIMER PLATO DEBE SER DATOS NUMERICOS Y POSITIVO'
        END
	ELSE IF  (EXISTS(SELECT IdPrimerPlato FROM PrimerPlato WHERE IdPrimerPlato = @IdPrimerPlato))
		BEGIN
			IF((@IdPlato = '') OR (ISNUMERIC(@IdPlato) = 0))
				BEGIN
					PRINT 'EL ID PLATO NO DEBE SER NULO Y TIENE QUE SER NUMERICO'
				END
	        ELSE IF (NOT EXISTS(SELECT IdPlato FROM Platos WHERE IdPlato = @IdPlato))
			    BEGIN
					PRINT 'EL ID DE PLATO NO EXISTE'
				END
			ELSE
				BEGIN
					EXEC @hasCategory = SP_valida_plato_tiene_categoria @IdPlato;
					IF(@hasCategory = 0)
						BEGIN
							UPDATE PrimerPlato
								Set	IdPlato = CONVERT(int ,@IdPlato)
							  WHERE IdPrimerPlato = CONVERT(int, @IdPrimerPlato);
							  PRINT 'SE HA ACTUALIZADO CORRECTAMENTE'
						END
				END
		END
	ELSE
		BEGIN
			PRINT 'EL ID DEL PLATO PRIMER PLATO NO EXISTE'
		END
GO
--------------------------------------------ActualizarSegundoPlato---------------------------------------
USE CIELOAZUL
GO
CREATE PROCEDURE ActualizarSegundoPlato
       @IdSegundoPlato varchar(5),
       @IdPlato varchar(5)	 
AS
   DECLARE @hasCategory BIT = 0
	IF (@IdSegundoPlato = '')
		BEGIN
			PRINT 'EL ID DEL SEGUNDO PLATO NO DEBE SER NULO'
		END
	ELSE IF(ISNUMERIC(@IdSegundoPlato) = 0)
	    BEGIN
            PRINT 'EL CAMPO ID SEGUNDO PLATO DEBE SER DATOS NUMERICOS Y POSITIVO'
        END
	ELSE IF  (EXISTS(SELECT IdSegundoPlato FROM SegundoPlato WHERE IdSegundoPlato = @IdSegundoPlato))
		BEGIN
			IF((@IdPlato = '') OR (ISNUMERIC(@IdPlato) = 0))
				BEGIN
					PRINT 'EL ID PLATO NO DEBE SER NULO Y TIENE QUE SER NUMERICO'
				END
	        ELSE IF (NOT EXISTS(SELECT IdPlato FROM Platos WHERE IdPlato = @IdPlato))
			    BEGIN
					PRINT 'EL ID DE PLATO NO EXISTE'
				END
			ELSE
				BEGIN
					EXEC @hasCategory = SP_valida_plato_tiene_categoria @IdPlato;
					IF(@hasCategory = 0)
						BEGIN
							UPDATE SegundoPlato
								Set	IdPlato = CONVERT(int ,@IdPlato)
							  WHERE IdSegundoPlato = CONVERT(int, @IdSegundoPlato);
							  PRINT 'SE HA ACTUALIZADO CORRECTAMENTE'
						END
				END
		END
	ELSE
		BEGIN
			PRINT 'EL ID DEL SEGUNDO PLATO NO EXISTE'
		END
GO
--------------------------------------ActualizarPostre--------------------------------------------
USE CIELOAZUL
GO
CREATE PROCEDURE ActualizarPostre
       @IdPostre varchar(5),
       @IdPlato varchar(5)	 
AS
   DECLARE @hasCategory BIT = 0
	IF (@IdPostre = '')
		BEGIN
			PRINT 'EL ID DEL POSTRE NO DEBE SER NULO'
		END
	ELSE IF(ISNUMERIC(@IdPostre) = 0)
	    BEGIN
            PRINT 'EL CAMPO ID POSTRE DEBE SER DATOS NUMERICOS Y POSITIVO'
        END
	ELSE IF  (EXISTS(SELECT IdPostre FROM Postres WHERE IdPostre = @IdPostre))
		BEGIN
			IF((@IdPlato = '') OR (ISNUMERIC(@IdPlato) = 0))
				BEGIN
					PRINT 'EL ID PLATO NO DEBE SER NULO Y TIENE QUE SER NUMERICO'
				END
	        ELSE IF (NOT EXISTS(SELECT IdPlato FROM Platos WHERE IdPlato = @IdPlato))
			    BEGIN
					PRINT 'EL ID DE PLATO NO EXISTE'
				END
			ELSE
				BEGIN
					EXEC @hasCategory = SP_valida_plato_tiene_categoria @IdPlato;
					IF(@hasCategory = 0)
						BEGIN
							UPDATE Postres
								Set	IdPlato = CONVERT(int ,@IdPlato)
							  WHERE IdPostre = CONVERT(int, @IdPostre);
							  PRINT 'SE HA ACTUALIZADO CORRECTAMENTE'
						END
				END
		END
	ELSE
		BEGIN
			PRINT 'EL ID DEL POSTRE NO EXISTE'
		END
GO
------------------------------------ActualizarAlmacen-----------------------------------------------------
USE CIELOAZUL
GO

CREATE PROCEDURE ActualizarAlmacen
      @NumAlmacen varchar(5),
	  @Nombre varchar(40),
	  @Descripcion varchar(100)
AS
	IF (@NumAlmacen = '')
		BEGIN
			PRINT 'NO SE PERMITEN CAMPOS VACIOS'
		END
	ELSE IF((ISNUMERIC(@NumAlmacen) = 0) OR (CONVERT(int, @NumAlmacen ) < 0))
		BEGIN
			PRINT 'EL NUMERO ALMACEN TIENE QUE SER DE CARACTER NUMERICO Y NO DEBE DE SER NEGATIVO'
		END
	ELSE IF ( EXISTS(SELECT NumAlmacen FROM Almacenes WHERE NumAlmacen=@NumAlmacen))
		BEGIN
			IF (@Nombre = '')
				BEGIN
					PRINT 'NO SE PERMITE VACIO EL CAMPO NOMBRE'
				END
			ELSE
				BEGIN
					UPDATE Almacenes
						Set	Nombre = @Nombre,
							Descripcion = @Descripcion
							
				      WHERE NumAlmacen = CONVERT(int, @NumAlmacen);
					  PRINT 'SE HA ACTUALIZADO CORRECTAMENTE'
				END
		END

	ELSE
        BEGIN
			PRINT 'EL ALMACEN NO EXISTE'
		END
GO
----------------------------------------------------------------ActualizarEstante---------------------------------------------------------
USE CIELOAZUL
GO
CREATE PROCEDURE ActualizarEstante
        @IdEstante varchar(5),
		@NombreEstante varchar(2),
		@TamCentimetros varchar(15),
		@IdAlmecen varchar(15)
AS
	IF (@IdEstante = '')
		BEGIN
			PRINT 'NO SE PERMITEN CAMPOS VACIOS'
		END
	ELSE IF((ISNUMERIC(@IdEstante) = 0) OR (CONVERT(int, @IdEstante ) < 0))
		BEGIN
			PRINT 'EL ID ESTANTE TIENE QUE SER DE CARACTER NUMERICO Y NO DEBE DE SER NEGATIVO'
		END
	ELSE IF (EXISTS(SELECT IdEstante FROM Estantes WHERE IdEstante=@IdEstante))
		BEGIN
			IF (@NombreEstante = '') OR (@TamCentimetros ='') OR (@IdAlmecen ='')
				BEGIN
					PRINT 'NO SE PERMITE CAMPOS VACIOS '
				END
			ELSE IF((ISNUMERIC(@TamCentimetros) = 0) OR (CONVERT(float, @TamCentimetros ) < 0))
				BEGIN
					PRINT 'EL TAMAÑO CENTIMETROS TIENE QUE SER DE CARACTER NUMERICO Y NO DEBE DE SER NEGATIVO'
				END
			ELSE IF (NOT EXISTS(SELECT NumAlmacen FROM Almacenes WHERE NumAlmacen=@IdAlmecen))
				BEGIN
						PRINT 'EL ALMACEN NO EXISTE'
				END
			ELSE IF (EXISTS(SELECT NombreEstante FROM Estantes WHERE NombreEstante=@NombreEstante AND IdAlmecen = @IdAlmecen))
				BEGIN
						PRINT 'ESTE ESTANTE YA EXISTE EN EL ALMACEN'
				END
			ELSE
				BEGIN
					UPDATE Estantes
						Set	NombreEstante = @NombreEstante,
							TamCentimetros = CONVERT (float , @TamCentimetros),
							IdAlmecen =  CONVERT (int , @IdAlmecen)		
						WHERE IdEstante = CONVERT(int, @IdEstante);
						PRINT 'SE HA ACTUALIZADO CORRECTAMENTE'
				END
		END
	ELSE
        BEGIN
			PRINT 'EL ESTANTE NO EXISTE'
		END
GO
--------------------------------------------------ActualizarIngredientes--------------------------------------------------
USE CIELOAZUL
GO
CREATE PROCEDURE ActualizarIngrediente
			@IdIngrediente varchar(8),
			@NombreIngrediente varchar(30),
			@CantidadIngrediente varchar(8),
			@IdEstante varchar(5)
AS
	IF (@IdIngrediente = '')
		BEGIN
			PRINT 'NO SE PERMITEN CAMPOS VACIOS'
		END
	ELSE IF((ISNUMERIC(@IdIngrediente) = 0) OR (CONVERT(int, @IdIngrediente ) < 0))
		BEGIN
			PRINT 'EL ID DE INGREDIENTE TIENE QUE SER DE CARACTER NUMERICO Y NO DEBE DE SER NEGATIVO'
		END
	ELSE IF (EXISTS(SELECT IdIngrediente FROM Ingredientes WHERE IdIngrediente=@IdIngrediente))
		BEGIN
			IF (@NombreIngrediente = '') OR (@CantidadIngrediente ='') OR (@IdEstante ='')
				BEGIN
					PRINT 'NO SE PERMITE CAMPOS VACIOS '
				END
			ELSE IF((ISNUMERIC(@CantidadIngrediente) = 0) OR (CONVERT(int, @CantidadIngrediente ) < 0))
				BEGIN
					PRINT 'LA CANTIDAD DE INGREDIENTES TIENE QUE SER DE CARACTER NUMERICO Y NO DEBE DE SER NEGATIVO'
				END
			ELSE IF((ISNUMERIC(@IdEstante) = 0) OR (CONVERT(int, @IdEstante ) < 0))
				BEGIN
					PRINT 'EL ID ESTANTE TIENE QUE SER DE CARACTER NUMERICO Y NO DEBE DE SER NEGATIVO'
				END
			ELSE IF (NOT EXISTS(SELECT IdEstante FROM Estantes WHERE IdEstante=@IdEstante))
				BEGIN
						PRINT 'EL ESTANTE NO EXISTE'
				END
			ELSE
				BEGIN
					UPDATE Ingredientes
						Set	NombreIngrediente = @NombreIngrediente,
							CantidadIngrediente =  CONVERT (int,@CantidadIngrediente),
							IdEstante = CONVERT(int, @IdEstante)	
						WHERE IdIngrediente = CONVERT(int, @IdIngrediente)
				END
		END
	ELSE
        BEGIN
			PRINT 'EL ID DE INGREDIENTE NO EXISTE'
		END
GO
---------------------------------------------ActualizarPlatoIngredientes--------------------------------------------------------------
USE CIELOAZUL
GO
CREATE PROCEDURE ActualizarPlatoIngrediente
			@IdPlatoIngrediente varchar(8),
			@CantidadIngrediente varchar(8),
			@IdIngrediente varchar(8),
			@IdPlato varchar(5)
AS
	IF (@IdPlatoIngrediente = '')
		BEGIN
			PRINT 'NO SE PERMITEN CAMPOS VACIOS'
		END
	ELSE IF((ISNUMERIC(@IdPlatoIngrediente) = 0) OR (CONVERT(int, @IdPlatoIngrediente ) < 0))
		BEGIN
			PRINT 'EL ID PLATO INGREDIENTE TIENE QUE SER DE CARACTER NUMERICO Y NO DEBE DE SER NEGATIVO'
		END
	ELSE IF (EXISTS(SELECT IdPlatoIngrediente FROM PlatoIngredientes WHERE IdPlatoIngrediente=@IdPlatoIngrediente))
		BEGIN
			IF (@CantidadIngrediente = '') OR (@IdIngrediente ='') OR (@IdPlato ='')
				BEGIN
					PRINT 'NO SE PERMITE CAMPOS VACIOS '
				END
			ELSE IF((ISNUMERIC(@CantidadIngrediente) = 0) OR (CONVERT(int, @CantidadIngrediente ) < 0))
				BEGIN
					PRINT 'LA CANTIDAD DE INGREDIENTES TIENE QUE SER DE CARACTER NUMERICO Y NO DEBE DE SER NEGATIVO'
				END
					ELSE IF((ISNUMERIC(@IdIngrediente) = 0) OR (CONVERT(int, @IdIngrediente ) < 0))
				BEGIN
					PRINT 'EL ID INGREDIENTE TIENE QUE SER DE CARACTER NUMERICO Y NO DEBE DE SER NEGATIVO'
				END
					ELSE IF((ISNUMERIC(@IdPlato) = 0) OR (CONVERT(int, @IdPlato ) < 0))
				BEGIN
					PRINT 'EL ID PLATO TIENE QUE SER DE CARACTER NUMERICO Y NO DEBE DE SER NEGATIVO'
				END
			ELSE IF (NOT EXISTS(SELECT IdIngrediente FROM Ingredientes WHERE IdIngrediente=@IdIngrediente))
				BEGIN
						PRINT 'EL INGREDIENTE NO EXISTE'
				END
			ELSE IF (NOT EXISTS(SELECT IdPlato FROM Platos WHERE IdPlato=@IdPlato ))
				BEGIN
						PRINT 'ESTE PLATO NO EXISTE'
				END
			ELSE
				BEGIN
					UPDATE PlatoIngredientes
						Set	CantidadIngrediente = CONVERT(int, @CantidadIngrediente),
							IdIngrediente =  CONVERT (int,@IdIngrediente),
							IdPlato = CONVERT(int, IdIngrediente)
						WHERE IdPlatoIngrediente = CONVERT(int, @IdPlatoIngrediente)
				END
		END
	ELSE
        BEGIN
			PRINT 'EL ID DE PLATO INGREDIENTE NO EXISTE'
		END
GO
--------------------------------------ActualizarConocePlato------------------------------------------------------------------
USE CIELOAZUL
GO
CREATE PROCEDURE ActualizarConocePlato
			@IdConocePlato varchar(8),
			@IdPlato varchar(8),
			@IdCocinero varchar(8)  
AS
	IF (@IdConocePlato = '')
		BEGIN
			PRINT 'NO SE PERMITEN CAMPOS VACIOS'
		END
	ELSE IF((ISNUMERIC(@IdConocePlato) = 0) OR (CONVERT(int, @IdConocePlato ) < 0))
		BEGIN
			PRINT 'EL ID PLATO INGREDIENTE TIENE QUE SER DE CARACTER NUMERICO Y NO DEBE DE SER NEGATIVO'
		END
	ELSE IF (EXISTS(SELECT IdConocePlato FROM ConocePlato WHERE IdConocePlato=@IdConocePlato))
		BEGIN
			IF (@IdPlato = '') OR (@IdCocinero ='') 
				BEGIN
					PRINT 'NO SE PERMITE CAMPOS VACIOS '
				END
			ELSE IF((ISNUMERIC(@IdPlato) = 0) OR (CONVERT(int, @IdPlato ) < 0))
				BEGIN
					PRINT 'LEL ID PLATO TIENE QUE SER DE CARACTER NUMERICO Y NO DEBE DE SER NEGATIVO'
				END
			ELSE IF((ISNUMERIC(@IdCocinero) = 0) OR (CONVERT(int, @IdCocinero ) < 0))
				BEGIN
					PRINT 'EL ID COCINERO TIENE QUE SER DE CARACTER NUMERICO Y NO DEBE DE SER NEGATIVO'
				END
			ELSE IF (NOT EXISTS(SELECT IdPlato FROM Platos WHERE IdPlato=@IdPlato))
				BEGIN
						PRINT 'EL PLATO NO EXISTE'
				END
			ELSE IF (NOT EXISTS(SELECT IdCocinero FROM Cocineros WHERE IdCocinero=@IdCocinero ))
				BEGIN
						PRINT 'ESTE COCINERO NO EXISTE'
				END
			ELSE
				BEGIN
					UPDATE ConocePlato
						Set	IdPlato = CONVERT(int, @IdPlato),
							IdCocinero =  CONVERT (int,@IdCocinero)	
					  WHERE IdConocePlato = CONVERT(int, @IdConocePlato)
				END
		END
	ELSE
        BEGIN
			PRINT 'EL ID CONOCE DE PLATO NO EXISTE'
		END
GO