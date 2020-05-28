-----------------------------------Restar Ingredientes ----------------------------------------------
USE CIELOAZUL
GO
CREATE PROC SP_ActualizaIngredientes (@IdPlato varchar(5))
AS
	IF (@IdPlato = '')
		BEGIN
			PRINT 'NO SE PERMITEN CAMPOS VACIOS'
			RETURN 
		END
	ELSE IF(ISNUMERIC(@IdPlato) = 0)
	    BEGIN
            PRINT  'ID CONOCE PLATO INVALIDO'
			RETURN 
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
					DECLARE @IdIngrediente INT

					SELECT @IdIngrediente = Ingredientes.IdIngrediente,  @CantidadIngrediente = PlatoIngredientes.CantidadIngrediente , @CantidadIngredienteStock = Ingredientes.CantidadIngrediente
					FROM PlatoIngredientes INNER JOIN Ingredientes ON PlatoIngredientes.IdIngrediente = Ingredientes.IdIngrediente
					WHERE PlatoIngredientes.IdPlatoIngrediente = @IdPlatoIngrediente;

					IF (@CantidadIngrediente < @CantidadIngredienteStock ) 
						BEGIN
							UPDATE Ingredientes SET CantidadIngrediente = ( @CantidadIngredienteStock - @CantidadIngrediente ) WHERE IdIngrediente = @IdIngrediente;
							PRINT 'SE ACTUALIZO EL INGREDIENTE!'
						END
					DELETE TOP(1) FROM @IngredientesLista
				END
			RETURN 
		END
GO




----------------------------------------------------------Verificar Ingredientes---------------------------------------------------------------


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




