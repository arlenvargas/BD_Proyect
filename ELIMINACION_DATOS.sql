---Eliminar Datos
USE CIELOAZUL
GO
---Eliminar Empleado
EXEC SP_EliminarEmpleado '10454879'
EXEC SP_EliminarEmpleado '21036548'
EXEC SP_EliminarEmpleado '50123458'

--SELECT IdCocinero, AnniosServicio, IdEmpleado FROM Cocineros
--SELECT IdPinche,IdCocinero,FechaNacimiento,IdEmpleado  FROM Pinches
--SELECT Dni, Nombre, Apellido1, Apellido2, NumSeguro, NumTelefono, NumCelular  FROM Empleados

---Eliminar Cocinero
EXEC SP_EliminarCocinero 1

--SELECT IdCocinero, AnniosServicio, IdEmpleado FROM Cocineros
--SELECT IdPinche,IdCocinero,FechaNacimiento,IdEmpleado  FROM Pinches
--SELECT IdCocinero, AnniosServicio, IdEmpleado FROM Cocineros

---Eliminar Pinche
EXEC SP_EliminarPinche 1

--SELECT IdPinche,IdCocinero,FechaNacimiento,IdEmpleado  FROM Pinches
--SELECT IdCocinero, AnniosServicio, IdEmpleado FROM Cocineros

--Eliminar Plato
EXEC SP_EliminarPlato 1
EXEC SP_EliminarPlato 3
EXEC SP_EliminarPlato 6
EXEC SP_EliminarPlato 11

--SELECT IdEntrante, IdPlato FROM Entrantes 
--SELECT IdSegundoPlato, IdPlato FROM SegundoPlato 
--SELECT IdPostre, IdPlato FROM Postres 
--SELECT IdPlato,NombrePlato,Precio  FROM Platos

--Eliminar Tipos Platos
EXEC SP_EliminarPlatoEntrante 1

EXEC SP_EliminarPrimerPlato 1

EXEC SP_EliminarSegundoPlato 1

EXEC SP_EliminarPostre 1

---Eliminar Almacen
EXEC SP_EliminarAlmacen 5
--SELECT NumAlmacen, Nombre, Descripcion FROM Almacenes

---Eliminar Estante 
EXEC SP_EliminarEstante 1

--SELECT IdEstante, NombreEstante, TamCentimetros, IdAlmecen FROM Estantes

---Eliminar Ingrediente
EXEC SP_EliminarIngrediente 1

--SELECT IdIngrediente, NombreIngrediente, CantidadIngrediente, IdEstante FROM Ingredientes

---Eliminar Plato ingrediente 
EXEC SP_EliminarPlatoIngrediente 1

--SELECT IdPlatoIngrediente, CantidadIngrediente, IdIngrediente, IdPlato FROM PlatoIngredientes

---Eliminar Conoce Plato
EXEC SP_EliminarConocePlato 1

--SELECT IdConocePlato, IdPlato, IdCocinero FROM ConocePlato

---Eliminar Prepara Plato
EXEC SP_EliminarPrepararPlato 1

--SELECT IdPreparaPlato, IdConocePlato, IdPlato FROM PreparaPlato