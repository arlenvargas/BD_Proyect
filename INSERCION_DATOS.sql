--insertar datos

--crear Empleados
USE CIELOAZUL
GO
EXEC SP_CrearEmpleado '10454879', 'Manuel', 'Valverde', 'Cordoba', 53184, '26656565', 83537229
EXEC SP_CrearEmpleado '11012145', 'Luis', 'Rodriguez', 'Baltodano', 65978, '26656565', 83537229
EXEC SP_CrearEmpleado '20142657','Tatiana','Morales', 'Mendez',64877, '26652525', '84848484'

EXEC SP_CrearEmpleado '21036548','Ricardo','Morataya', 'Sandoval',15479, '62548759', '7584596'
EXEC SP_CrearEmpleado '22154789','Arlen','Vargar', 'Galves',02145, '8585896', '87459625'
EXEC SP_CrearEmpleado '30112455','Erick','Parra', 'Parra',302412, '8789878', '85968547'
EXEC SP_CrearEmpleado '30214547','Pedro','Guzman', 'Mendoza',78021, '26652525', '82828282'
EXEC SP_CrearEmpleado '41245478','Ana','Mora', 'Juarez',31479, '26652525', '65656565'

EXEC SP_CrearEmpleado '42314578','Ruben','Jimenes', 'Carvajal',03114, '26652525', '87878787'
EXEC SP_CrearEmpleado '48011246','Emilio','Guzman', 'Carrillo',10324, '26652525', '85858585'
EXEC SP_CrearEmpleado '50123458','Andres','Elisondo', 'Carrillo',47891, '26652525', '83838383'

EXEC SP_ObtenerEmpleados

--crear Cocineros
USE CIELOAZUL
GO
EXEC SP_CrearCocinero 9, '10454879'
EXEC SP_CrearCocinero 8,'11012145'
EXEC SP_CrearCocinero 5,'20142657'

EXEC SP_ObtenerCocineros

--crear Pinches
USE CIELOAZUL
GO
EXEC SP_CrearPinche  1, '2020/05/28', '21036548'
EXEC SP_CrearPinche  1, '1990/11/10', '22154789'
EXEC SP_CrearPinche  2, '1987/07/05', '30112455'
EXEC SP_CrearPinche  2, '1997/04/25', '30214547'
EXEC SP_CrearPinche  3, '1997/11/05', '41245478'

EXEC SP_ObtenerPinches

--crear Platos
USE CIELOAZUL
GO
EXEC SP_CrearPlato 'Ensalada', 750
EXEC SP_CrearPlato 'Turrón ', 800

EXEC SP_CrearPlato 'Pizza',  5500
EXEC SP_CrearPlato 'Casado', 3000
EXEC SP_CrearPlato 'Arroz con pollo', 2500

EXEC SP_CrearPlato 'Bistec con cebolla', 3500
EXEC SP_CrearPlato 'Chuleta', 3000

EXEC SP_CrearPlato 'Helado de Fresa', 1400
EXEC SP_CrearPlato 'Helado de vainilla', 1400
EXEC SP_CrearPlato 'Helado de Chocolate', 1400

EXEC SP_CrearPlato 'Vigoron', 2000
EXEC SP_CrearPlato 'Chifrijo', 2500
EXEC SP_CrearPlato 'Olla de carne', 1500

EXEC SP_ObtenerPlatos

--Crear Entrantes
USE CIELOAZUL
GO
EXEC SP_CrearPlatoEntrante 1
EXEC SP_CrearPlatoEntrante 2

EXEC SP_ObtenerEntrantes

--Crear Primer Plato
USE CIELOAZUL
GO
EXEC SP_CrearPrimerPlato 3
EXEC SP_CrearPrimerPlato 4
EXEC SP_CrearPrimerPlato 5

EXEC SP_ObtenerPrimerPlato

--Crear Segundo Plato
USE CIELOAZUL
GO
EXEC SP_CrearSegundoPlato 6
EXEC SP_CrearSegundoPlato 7

EXEC SP_ObtenerSegundoPlato

--Crear Postre
USE CIELOAZUL
GO
EXEC SP_CrearPostre 8
EXEC SP_CrearPostre 9
EXEC SP_CrearPostre 10

EXEC SP_ObtenerPostres

--Crear Almacen
USE CIELOAZUL
GO
EXEC SP_CrearAlmacen 5, 'Almacen Liberia', 'Ubicado en liberia centro'
EXEC SP_CrearAlmacen 10, 'Almacen Nicoya', 'Ubicado en Nicoya centro'
EXEC SP_CrearAlmacen 1, 'Almacen Santa Cruz', ''

EXEC SP_ObtenerAlmacenes

--Crear Estante
USE CIELOAZUL
GO
EXEC SP_CrearEstante 'AA', 100.15, 5
EXEC SP_CrearEstante 'AB', 95.25,  5
EXEC SP_CrearEstante 'AC', 75.30,  5
EXEC SP_CrearEstante 'AD', 95.30,  5

EXEC SP_CrearEstante 'AA', 100.15, 10
EXEC SP_CrearEstante 'AB', 95.25,  10
EXEC SP_CrearEstante 'AC', 75.30,  10
EXEC SP_CrearEstante 'AD', 95.30,  10

EXEC SP_ObtenerEstantes

--Crear Ingredientes
USE CIELOAZUL
GO
EXEC SP_CrearIngrediente 'Tomate', 70, 1
EXEC SP_CrearIngrediente 'Queso', 70, 1
EXEC SP_CrearIngrediente 'Harina', 70, 3
EXEC SP_CrearIngrediente 'Cebolla', 70, 2
EXEC SP_CrearIngrediente 'Carnes', 70, 2
EXEC SP_CrearIngrediente 'Arroz', 70, 4
EXEC SP_CrearIngrediente 'Leche', 70, 5
EXEC SP_CrearIngrediente 'Cacao', 70, 6
EXEC SP_CrearIngrediente 'Frijoles', 70, 7
EXEC SP_CrearIngrediente 'Chile', 70, 8

EXEC SP_ObtenerIngredientes


--Crear PlatoIngredientes
USE CIELOAZUL
GO
EXEC SP_CrearPlatoIngredientes 20, 1, 3		
EXEC SP_CrearPlatoIngredientes 2, 2, 3
EXEC SP_CrearPlatoIngredientes 10, 3, 3

EXEC SP_CrearPlatoIngredientes 15, 4, 6
EXEC SP_CrearPlatoIngredientes 5,  5, 6

EXEC SP_CrearPlatoIngredientes 5,  5, 7

EXEC SP_ObtenerPlatosIngredientes

--Crear Conoce Plato
USE CIELOAZUL
GO
EXEC SP_CrearConocePlato 3, 1												--Plato 3 con el cocinero 1
EXEC SP_CrearConocePlato 6, 2												--Plato 6 con el cocinero 2
EXEC SP_CrearConocePlato 7, 3												--Plato 7 con el cocinero 3

EXEC SP_ObtenerConocePlato

EXEC SP_ObtenerPlatos
EXEC SP_ObtenerCocineros

--Crear Preparar Plato
USE CIELOAZUL
GO
EXEC SP_CrearPrepararPlato 1, 3											--Conoce Plato 1 con el Plato 3
EXEC SP_CrearPrepararPlato 2, 6											--Conoce Plato 2 con el Plato 6
EXEC SP_CrearPrepararPlato 3, 7											--Conoce Plato 3 con el Plato 7



