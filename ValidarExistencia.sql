



USE CIELOAZUL
GO
CREATE PROC SP_VerificaIngredientes (@IdPlato varchar(5))
AS
	IF (@IdPlato = '')
		BEGIN
			PRINT 'NO SE PERMITEN CAMPOS VACIOS'

			RETURN 0
		END
	ELSE IF(ISNUMERIC(@IdPlato) = 0)
	    BEGIN
            PRINT  'ID CONOCE PLATO INVALIDO'


			RETURN 0
		END
	ELSE
		BEGIN

			DECLARE @IngredientesLista TABLE(IdPlatoIngrediente INT)
			DECLARE @IdPlatoIngrediente INT

			INSERT @IngredientesLista(IdPlatoIngrediente)
			SELECT IdPlatoIngrediente
			FROM PlatoIngredientes WHERE PlatoIngredientes.IdPlato = @IdPlato

			WHILE(1 = 1)
			BEGIN

				SET @IdPlatoIngrediente = NULL
				SELECT TOP(1) @IdPlatoIngrediente = IdPlatoIngrediente
				FROM @IngredientesLista

				IF @IdPlatoIngrediente IS NULL
					BREAK

				DECLARE @CantidadIngrediente INT = 0;
				DECLARE @CantidadIngredienteStock INT = 0;

				SELECT @CantidadIngrediente = PlatoIngredientes.CantidadIngrediente , @CantidadIngredienteStock = Ingredientes.CantidadIngrediente
				FROM PlatoIngredientes INNER JOIN Ingredientes ON PlatoIngredientes.IdIngrediente = Ingredientes.IdIngrediente
				WHERE PlatoIngredientes.IdPlatoIngrediente = @IdPlatoIngrediente;

				IF (@CantidadIngrediente > @CantidadIngredienteStock ) 
				BEGIN
					RETURN 0
				END
				DELETE TOP(1) FROM @IngredientesLista

			END

			RETURN 1
		END

	GO

USE CIELOAZUL
GO



CREATE PROC PrepararPlato (@IdConocePlato varchar(5), @IdPlato varchar(5))
AS
	IF ((@IdConocePlato = '') OR (@IdPlato = ''))
		BEGIN
			PRINT 'NO SE PERMITEN CAMPOS VACIOS'
		END
	ELSE IF(ISNUMERIC(@IdConocePlato) = 0)
	    BEGIN
            PRINT  'ID CONOCE PLATO INVALIDO'
        END
	ELSE IF(ISNUMERIC(@IdPlato) = 0)
	    BEGIN
            PRINT  'ID DE PLATO INVALIDO'
        END
	ELSE
		BEGIN
			DECLARE @HayIngredientes BIT 
			EXEC @HayIngredientes = SP_VerificaIngredientes @IdPlato

			IF(@HayIngredientes = 1)
				BEGIN
					EXEC SP_ActualizaIngredientes @IdPlato

					INSERT INTO PreparaPlato(IdConocePlato,IdPlato)
					VALUES (CONVERT(int, @IdConocePlato),CONVERT(int, @IdPlato))
					PRINT 'EL PLATO SE HA CREADO CORRECTAMENTE'
		    END
			ELSE 
				BEGIN
					PRINT 'NO HAY INGREDIENTES SUFICIENTES'
			END
	END
	GO
  

  EXEC PrepararPlato 1,1









  ---------------------------------Verificar ingredientes----------------------------------------------

	