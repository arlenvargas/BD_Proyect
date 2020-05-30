--insertar datos

--crear Empleados
USE CIELOAZUL
GO
EXEC CrearEmpleado '10454879', 'Manuel', 'Valverde', 'Cordoba', 53184, '26656565', 83537229
EXEC CrearEmpleado '11012145', 'Luis', 'Rodriguez', 'Baltodano', 65978, '26656565', 83537229
EXEC CrearEmpleado '20142657','Tatiana','Morales', 'Mendez',64877, '26652525', '84848484'

EXEC CrearEmpleado '21036548','Ricardo','Morataya', 'Sandoval',15479, '62548759', '7584596'
EXEC CrearEmpleado '22154789','Arlen','Vargar', 'Galves',02145, '8585896', '87459625'
EXEC CrearEmpleado '30112455','Erick','Parra', 'Parra',302412, '8789878', '85968547'
EXEC CrearEmpleado '30214547','Pedro','Guzman', 'Mendoza',78021, '26652525', '82828282'
EXEC CrearEmpleado '41245478','Ana','Mora', 'Juarez',31479, '26652525', '65656565'

EXEC CrearEmpleado '42314578','Ruben','Jimenes', 'Carvajal',03114, '26652525', '87878787'
EXEC CrearEmpleado '48011246','Emilio','Guzman', 'Carrillo',10324, '26652525', '85858585'
EXEC CrearEmpleado '50123458','Andres','Elisondo', 'Carrillo',47891, '26652525', '83838383'

--SELECT Dni, Nombre, Apellido1, Apellido2, NumSeguro, NumTelefono, NumCelular  FROM Empleados

--crear Cocineros
EXEC CrearCocineros 9, '10454879'
EXEC CrearCocineros 8,'11012145'
EXEC CrearCocineros 5,'20142657'

--SELECT IdCocinero, AnniosServicio, IdEmpleado FROM Cocineros

--crear Pinches
EXEC CrearPinches  1, '2020/05/28', '21036548'
EXEC CrearPinches  1, '1990/11/10', '22154789'
EXEC CrearPinches  2, '1987/07/05', '30112455'
EXEC CrearPinches  2, '1997/04/25', '30214547'
EXEC CrearPinches  3, '1997/11/05', '41245478'
--SELECT IdPinche,IdCocinero,FechaNacimiento,IdEmpleado  FROM Pinches

--crear Platos
EXEC CrearPlato 'Ensalada', 750
EXEC CrearPlato 'Turrón ', 800

EXEC CrearPlato 'Pizza',  5500
EXEC CrearPlato 'Casado', 3000
EXEC CrearPlato 'Arroz con pollo', 2500

EXEC CrearPlato 'Bistec con cebolla', 3500
EXEC CrearPlato 'Chuleta', 3000

EXEC CrearPlato 'Helado de Fresa', 1400
EXEC CrearPlato 'Helado de vainilla', 1400
EXEC CrearPlato 'Helado de Chocolate', 1400

EXEC CrearPlato 'Vigoron', 2000
EXEC CrearPlato 'Chifrijo', 2500
EXEC CrearPlato 'Olla de carne', 1500
--SELECT IdPlato,NombrePlato,Precio  FROM Platos

--Crear Entrantes
EXEC CrearPlatoEntrante 1
EXEC CrearPlatoEntrante 2
--SELECT IdEntrante, IdPlato FROM Entrantes 

--Crear Primer Plato
EXEC CrearPrimerPlato 3
EXEC CrearPrimerPlato 4
EXEC CrearPrimerPlato 5
--SELECT IdPrimerPlato, IdPlato FROM PrimerPlato 

--Crear Segundo Plato
EXEC CrearSegundoPlato 6
EXEC CrearSegundoPlato 7
--SELECT IdSegundoPlato, IdPlato FROM SegundoPlato 

--Crear Postre
EXEC CrearPostre 8
EXEC CrearPostre 9
EXEC CrearPostre 10
--SELECT IdPostre, IdPlato FROM Postres 

--Crear Almacen
EXEC CrearAlmacen 5, 'Almacen Liberia', 'Ubicado en liberia centro'
EXEC CrearAlmacen 10, 'Almacen Nicoya', 'Ubicado en Nicoya centro'
EXEC CrearAlmacen 1, 'Almacen Santa Cruz', ''
--SELECT NumAlmacen, Nombre, Descripcion FROM Almacenes
 

--Crear Estante
EXEC CrearEstante 'AA', 100.15, 5
EXEC CrearEstante 'AB', 95.25,  5
EXEC CrearEstante 'AC', 75.30,  5
EXEC CrearEstante 'AD', 95.30,  5

EXEC CrearEstante 'AA', 100.15, 10
EXEC CrearEstante 'AB', 95.25,  10
EXEC CrearEstante 'AC', 75.30,  10
EXEC CrearEstante 'AD', 95.30,  10
--SELECT IdEstante, NombreEstante, TamCentimetros, IdAlmecen FROM Estantes

--Crear Ingredientes
EXEC CrearIngredientes 'Tomate', 70, 1
EXEC CrearIngredientes 'Queso', 70, 1
EXEC CrearIngredientes 'Harina', 70, 3
EXEC CrearIngredientes 'Cebolla', 70, 2
EXEC CrearIngredientes 'Carnes', 70, 2
EXEC CrearIngredientes 'Arroz', 70, 4
EXEC CrearIngredientes 'Leche', 70, 5
EXEC CrearIngredientes 'Cacao', 70, 6
EXEC CrearIngredientes 'Frijoles', 70, 7
EXEC CrearIngredientes 'Chile', 70, 8
--SELECT IdIngrediente, NombreIngrediente, CantidadIngrediente, IdEstante FROM Ingredientes


--Crear PlatoIngredientes
EXEC CrearPlatoIngredientes 20, 1, 3		
EXEC CrearPlatoIngredientes 2, 2, 3
EXEC CrearPlatoIngredientes 10, 3, 3

EXEC CrearPlatoIngredientes 15, 4, 6
EXEC CrearPlatoIngredientes 5,  5, 6

EXEC CrearPlatoIngredientes 5,  5, 7

--SELECT IdPlatoIngrediente, CantidadIngrediente, IdIngrediente, IdPlato FROM PlatoIngredientes

--Crear Conoce Plato
EXEC CrearConocePlato 3, 1												--Plato 3 con el cocinero 1
EXEC CrearConocePlato 6, 2												--Plato 6 con el cocinero 2
EXEC CrearConocePlato 7, 3												--Plato 7 con el cocinero 3
--SELECT IdConocePlato, IdPlato, IdCocinero FROM ConocePlato

--SELECT IdPlato,NombrePlato,Precio  FROM Platos
--SELECT IdCocinero, AnniosServicio, IdEmpleado FROM Cocineros

--Crear Preparar Plato
EXEC CrearPrepararPlato 1, 3											--Conoce Plato 1 con el Plato 3
EXEC CrearPrepararPlato 2, 6											--Conoce Plato 2 con el Plato 6
EXEC CrearPrepararPlato 3, 7											--Conoce Plato 3 con el Plato 7
--SELECT IdPreparaPlato, IdConocePlato, IdPlato FROM PreparaPlato

