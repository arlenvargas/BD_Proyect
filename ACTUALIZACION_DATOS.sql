
--------------Actualizar Empleado------------------------------------
USE CIELOAZUL
GO 
EXEC SP_ActualizarEmpleado '11012145', 'Manuel', 'Valverde', 'Cordoba', 53184, '26656565', 83537229

EXEC SP_ObtenerEmpleados 

------------Actualizar Cocinero--------------------------------------
USE CIELOAZUL
GO 
EXEC SP_ActualizarCocinero 1, 9, '10454879'

EXEC SP_ObtenerCocineros

------------Actualizar Pinches----------------------------------------
USE CIELOAZUL
GO 
EXEC SP_ActualizarPinche 1, 1, '2020/05/28', '21036548'

EXEC SP_ObtenerPinches

------------Actualizar Plato------------------------------------------
USE CIELOAZUL
GO 
EXEC SP_ActualizarPlato 1, 'Ensalada', 750

EXEC SP_ObtenerPlatos

------------Actualizar Entrante----------------------------------------
USE CIELOAZUL
GO 
EXEC SP_ActualizarPlatoEntrante 1, 1

EXEC SP_ObtenerEntrantes

------------Actualizar Primer Plato------------------------------------
USE CIELOAZUL
GO 
EXEC SP_ActualizarPrimerPlato 1, 3

EXEC SP_ObtenerPrimerPlato

------------Actualizar Segundo Plato-----------------------------------
USE CIELOAZUL
GO 
EXEC SP_ActualizarSegundoPlato 1, 6

EXEC SP_ObtenerSegundoPlato

------------Actualizar Postre------------------------------------------
USE CIELOAZUL
GO 
EXEC SP_ActualizarPostre 1, 8

EXEC SP_ObtenerPostres

------------Actualizar Almacen-----------------------------------------
USE CIELOAZUL
GO 
EXEC SP_ActualizarAlmacen 5, 'Almacen Liberia', 'Ubicado en liberia centro'

EXEC SP_ObtenerAlmacenes

------------Actualizar Estante-----------------------------------------
USE CIELOAZUL
GO 
EXEC SP_ActualizarEstante 1, 'AA', 100.15, 5

EXEC SP_ObtenerEstantes

------------Actualizar Ingrediente---------------------------------------
USE CIELOAZUL
GO 
EXEC SP_ActualizarIngrediente 1, 'Tomate', 70, 1

EXEC SP_ObtenerIngredientes

------------Actualizar Plato Ingrediente---------------------------------
USE CIELOAZUL
GO 
EXEC SP_ActualizarPlatoIngrediente 1, 20, 1, 3
EXEC SP_ObtenerPlatosIngredientes

------------Actualizar Conoce Plato---------------------------------------
USE CIELOAZUL
GO 
EXEC SP_ActualizarConocePlato 1, 1, 3

EXEC SP_ObtenerConocePlato

EXEC SP_ObtenerPlatos
EXEC SP_ObtenerCocineros