USE CIELOAZUL
--insertar datos

--crear Empleados
EXEC CrearEmpleado '15454879', 'Manuel', 'Rodriguez', 'Baltodano', 4785, '26656565', 83537229
EXEC CrearEmpleado '504190041', 'Luis', 'Rodriguez', 'Baltodano', 65978, '26656565', 83537229
EXEC CrearEmpleado '501457820','Tatiana','Morales', 'Mendez',3244, '26652525', '66666666'
EXEC CrearEmpleado '78965877','Ricardo','Morataya', 'Sandoval',1247, '62548759', '7584596'
EXEC CrearEmpleado '456987448','Arlen','Vargar', 'Galves',02145, '8585896', '87459625'
EXEC CrearEmpleado '102365889','Erick','Parra', 'Parra',302412, '8789878', '85968547'
EXEC CrearEmpleado '201455445','Pedro','Guzman', 'Mendoza',78021, '26652525', '66666666'
EXEC CrearEmpleado '320145588','Ana','Mora', 'Juarez',03214, '26652525', '66666666'
EXEC CrearEmpleado '652365236','Ruben','Jimenes', 'Carvajal',03114, '26652525', '66666666'
EXEC CrearEmpleado '201325522','Emilio','Elisondo', 'Carrillo',10324, '26652525', '66666666'
EXEC CrearEmpleado '1454755','Emilio','Elisondo', 'Carrillo',10324, '26652525', '66666666'

--SELECT Dni, Nombre, Apellido1, Apellido2, NumSeguro, NumTelefono, NumCelular  FROM Empleados
USE CIELOAZUL
GO
--crear Cocineros
EXEC CrearCocineros 5, '504190041'
EXEC CrearCocineros 8,'15454879'
EXEC CrearCocineros 23,'501457820'

--SELECT IdCocinero, AnniosServicio, IdEmpleado FROM Cocineros

--crear Pinches
EXEC CrearPinches  1, '2020/05/28', '78965877'
EXEC CrearPinches  1, '1990/11/10', '456987448'
EXEC CrearPinches  2, '1987/07/05', '320145588'
EXEC CrearPinches  2, '1997/04/25', '102365889'
EXEC CrearPinches  3, '1997/11/05', '201455445'

EXEC ActualizarPinches 30, 10, '2000/12/25', '501457820'
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
--SELECT NumAlmacen, Nombre, Descripcion FROM Almacenes
 

--Crear Estante
EXEC CrearEstante 'AA', 100.15, 5
EXEC CrearEstante 'AB', 95.25,  5
EXEC CrearEstante 'AC', 75.30,  5
EXEC CrearEstante 'AD', 95.30,  5

EXEC CrearEstante 'AA', 110, 10
EXEC CrearEstante 'AB', 120.0,  10
EXEC CrearEstante 'AC', 68.75,  10
EXEC CrearEstante 'AD', 86.30,  10
--SELECT IdEstante, NombreEstante, TamCentimetros, IdAlmecen FROM Estantes

--Crear Ingredientes
EXEC CrearIngredientes 'Tomate', 70, 1
EXEC CrearIngredientes 'Queso', 70, 1
EXEC CrearIngredientes 'Cebolla', 70, 2
EXEC CrearIngredientes 'Carnes', 70, 2
EXEC CrearIngredientes 'Harina', 70, 3
EXEC CrearIngredientes 'Arroz', 70, 4
EXEC CrearIngredientes 'Leche', 70, 5
EXEC CrearIngredientes 'Cacao', 70, 6
EXEC CrearIngredientes 'Frijoles', 70, 7
EXEC CrearIngredientes 'Chile', 70, 8
--SELECT IdIngrediente, NombreIngrediente, CantidadIngrediente, IdEstante FROM Ingredientes


--Crear PlatoIngredientes
EXEC CrearPlatoIngredientes 20, 1, 1 
EXEC CrearPlatoIngredientes 2, 2, 1
EXEC CrearPlatoIngredientes 15, 3, 6
EXEC CrearPlatoIngredientes 5,  4, 6
EXEC CrearPlatoIngredientes 5,  4, 7
EXEC CrearPlatoIngredientes 10, 5, 1
--SELECT IdPlatoIngrediente, CantidadIngrediente, IdIngrediente, IdPlato FROM PlatoIngredientes

--Crear Conoce Plato
EXEC CrearConocePlato 3, 1												--Plato 3 con el cocinero 1
EXEC CrearConocePlato 6, 2												--Plato 6 con el cocinero 2
EXEC CrearConocePlato 7, 3												--Plato 7 con el cocinero 3
--SELECT IdConocePlato, IdPlato, IdCocinero FROM ConocePlato

--Crear Preparar Plato
EXEC CrearPrepararPlato 1, 3											--Conoce Plato 1 con el Plato 3
EXEC CrearPrepararPlato 2, 6											--Conoce Plato 2 con el Plato 6
EXEC CrearPrepararPlato 3, 7											--Conoce Plato 3 con el Plato 7


--SELECT IdPreparaPlato, IdConocePlato, IdPlato FROM PreparaPlato
 

