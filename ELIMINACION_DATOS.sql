---Eliminar Datos

---Eliminar Empleado
USE CIELOAZUL
GO
EXEC SP_EliminarEmpleado '10454879'
EXEC SP_EliminarEmpleado '21036548'
EXEC SP_EliminarEmpleado '50123458'
Exec SP_ObtenerEmpleados 

---Eliminar Cocinero
USE CIELOAZUL
GO
EXEC SP_EliminarCocinero 1
Exec SP_ObtenerCocineros


---Eliminar Pinche
USE CIELOAZUL
GO
EXEC SP_EliminarPinche 1
Exec SP_ObtenerPinches


--Eliminar Plato
USE CIELOAZUL
GO
EXEC SP_EliminarPlato 1
EXEC SP_EliminarPlato 3
EXEC SP_EliminarPlato 6
EXEC SP_EliminarPlato 11
Exec SP_ObtenerPlatos


--Eliminar Tipos Platos
USE CIELOAZUL
GO
EXEC SP_EliminarPlatoEntrante 1
Exec SP_ObtenerEntrantes

EXEC SP_EliminarPrimerPlato 1
Exec SP_ObtenerPrimerPlato

EXEC SP_EliminarSegundoPlato 1
Exe SP_ObtenerSegundoPlato

EXEC SP_EliminarPostre 1
Exec SP_ObtenerPostres

---Eliminar Almacen
USE CIELOAZUL
GO
EXEC SP_EliminarAlmacen 5
Exec SP_ObtenerAlmacenes

---Eliminar Estante 
USE CIELOAZUL
GO
EXEC SP_EliminarEstante 1
Exec SP_ObtenerEstantes

---Eliminar Ingrediente
USE CIELOAZUL
GO
EXEC SP_EliminarIngrediente 1
Exec SP_ObtenerIngredientes


---Eliminar Plato ingrediente 
USE CIELOAZUL
GO
EXEC SP_EliminarPlatoIngrediente 1
Exec SP_ObtenerPlatosIngredientes

---Eliminar Conoce Plato
USE CIELOAZUL
GO
EXEC SP_EliminarConocePlato 1
Exec SP_ObtenerConocePlato


---Eliminar Prepara Plato
USE CIELOAZUL
GO
EXEC SP_EliminarPrepararPlato 1
Exec SP_ObtenerPreparaPlato

