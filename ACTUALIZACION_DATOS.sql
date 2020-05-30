
--------------Actualizar Empleado------------------------------------
USE CIELOAZUL
GO 
EXEC SP_ActualizarEmpleado '10454879', 'Manuel', 'Valverde', 'Cordoba', 53184, '26656565', 83537229

--SELECT Dni, Nombre, Apellido1, Apellido2, NumSeguro, NumTelefono, NumCelular FROM Empleados

------------Actualizar Cocinero--------------------------------------
USE CIELOAZUL
GO 
EXEC SP_ActualizarCocinero 1, 9, '10454879'

--SELECT IdCocinero, AnniosServicio, IdEmpleado FROM Cocineros

------------Actualizar Pinches----------------------------------------
USE CIELOAZUL
GO 
EXEC SP_ActualizarPinche 1, 1, '2020/05/28', '21036548'

--SELECT IdPinche, IdCocinero, FechaNacimiento, IdEmpleado  FROM Pinches

------------Actualizar Plato------------------------------------------
USE CIELOAZUL
GO 
EXEC SP_ActualizarPlato 1, 'Ensalada', 750

--SELECT IdPlato,NombrePlato,Precio  FROM Platos

------------Actualizar Entrante----------------------------------------
USE CIELOAZUL
GO 
EXEC SP_ActualizarPlatoEntrante 1, 1

--SELECT IdEntrante, IdPlato FROM Entrantes

------------Actualizar Primer Plato------------------------------------
USE CIELOAZUL
GO 
EXEC SP_ActualizarPrimerPlato 1, 3

--SELECT IdPrimerPlato, IdPlato FROM PrimerPlato 

------------Actualizar Segundo Plato-----------------------------------
USE CIELOAZUL
GO 
EXEC SP_ActualizarSegundoPlato 1, 6

--SELECT IdSegundoPlato, IdPlato FROM SegundoPlato 

------------Actualizar Postre------------------------------------------
USE CIELOAZUL
GO 
EXEC SP_ActualizarPostre 1, 8

--SELECT IdPostre, IdPlato FROM Postres 

------------Actualizar Almacen-----------------------------------------
USE CIELOAZUL
GO 
EXEC SP_ActualizarAlmacen 5, 'Almacen Liberia', 'Ubicado en liberia centro'

--SELECT NumAlmacen, Nombre, Descripcion FROM Almacenes

------------Actualizar Estante-----------------------------------------
USE CIELOAZUL
GO 
EXEC SP_ActualizarEstante 1, 'AA', 100.15, 5

--SELECT IdEstante, NombreEstante, TamCentimetros, IdAlmecen FROM Estantes

------------Actualizar Ingrediente---------------------------------------
USE CIELOAZUL
GO 
EXEC SP_ActualizarIngrediente 1, 'Tomate', 70, 1

--SELECT IdIngrediente, NombreIngrediente, CantidadIngrediente, IdEstante FROM Ingredientes

------------Actualizar Plato Ingrediente---------------------------------
USE CIELOAZUL
GO 
EXEC SP_ActualizarPlatoIngrediente 1, 20, 1, 3
--SELECT IdPlatoIngrediente, CantidadIngrediente, IdIngrediente, IdPlato FROM PlatoIngredientes

------------Actualizar Conoce Plato---------------------------------------
USE CIELOAZUL
GO 
EXEC SP_ActualizarConocePlato 1, 1, 3

--SELECT IdConocePlato, IdPlato, IdCocinero FROM ConocePlato

--SELECT IdPlato,NombrePlato,Precio  FROM Platos
--SELECT IdCocinero, AnniosServicio, IdEmpleado FROM Cocineros