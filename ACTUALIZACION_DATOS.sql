USE CIELOAZUL
GO 
--------------Actualizar Empleado------------------------------------

EXEC ActualizarEmpleado '10454879', 'Manuel', 'Valverde', 'Cordoba', 53184, '26656565', 83537229
GO
--SELECT Dni, Nombre, Apellido1, Apellido2, NumSeguro, NumTelefono, NumCelular FROM Empleados

------------Actualizar Cocinero--------------------------------------

EXEC ActualizarCocinero 1, 9, '10454879'
GO
--SELECT IdCocinero, AnniosServicio, IdEmpleado FROM Cocineros

------------Actualizar Pinches----------------------------------------

EXEC ActualizarPinches 1, 1, '2020/05/28', '21036548'
GO
--SELECT IdPinche,IdCocinero,FechaNacimiento,IdEmpleado  FROM Pinches

------------Actualizar Plato------------------------------------------

EXEC ActualizarPlato 1, 'Ensalada', 750
GO
--SELECT IdPlato,NombrePlato,Precio  FROM Platos

------------Actualizar Entrante----------------------------------------

EXEC ActualizarPlatoEntrante 1, 1
GO
--SELECT IdEntrante, IdPlato FROM Entrantes

------------Actualizar Primer Plato------------------------------------

EXEC ActualizarPrimerPlato 1, 3
GO
--SELECT IdPrimerPlato, IdPlato FROM PrimerPlato 

------------Actualizar Segundo Plato-----------------------------------

EXEC ActualizarSegundoPlato 1, 6
GO
--SELECT IdSegundoPlato, IdPlato FROM SegundoPlato 

------------Actualizar Postre------------------------------------------

EXEC ActualizarPostre 1, 8
GO
--SELECT IdPostre, IdPlato FROM Postres 

------------Actualizar Almacen-----------------------------------------

EXEC ActualizarAlmacen 5, 'Almacen Liberia', 'Ubicado en liberia centro'
GO
--SELECT NumAlmacen, Nombre, Descripcion FROM Almacenes

------------Actualizar Estante-----------------------------------------

EXEC ActualizarEstante 1, 'AA', 100.15, 5
GO
--SELECT IdEstante, NombreEstante, TamCentimetros, IdAlmecen FROM Estantes

------------Actualizar Ingrediente---------------------------------------

EXEC ActualizarIngrediente 1, 'Tomate', 70, 1
GO
--SELECT IdIngrediente, NombreIngrediente, CantidadIngrediente, IdEstante FROM Ingredientes

------------Actualizar Plato Ingrediente---------------------------------

EXEC ActualizarPlatoIngrediente 1, 20, 1, 3
--SELECT IdPlatoIngrediente, CantidadIngrediente, IdIngrediente, IdPlato FROM PlatoIngredientes

------------Actualizar Conoce Plato---------------------------------------

EXEC ActualizarConocePlato 1, 1, 3
GO
--SELECT IdConocePlato, IdPlato, IdCocinero FROM ConocePlato

--SELECT IdPlato,NombrePlato,Precio  FROM Platos
--SELECT IdCocinero, AnniosServicio, IdEmpleado FROM Cocineros