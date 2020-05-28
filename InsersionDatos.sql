--insertar datos

--creacion empleados
EXEC CrearEmpleado '504190041', 'Manuel', 'Rodriguez', 'Baltodano', 12345, '26656565', 83537229
EXEC CrearEmpleado '505050505', 'Luis', 'Rodriguez', 'Baltodano', 12345, '26656565', 83537229
EXEC CrearEmpleado '501457820','Tatiana','Morales', 'Mendez',52158, '26652525', '66666666'
EXEC CrearEmpleado '78965877','Ricardo','Morataya', 'Sandoval',21546, '62548759', '7584596'
EXEC CrearEmpleado '456987448','Arlen','Vargar', 'Galves',222215, '8585896', '87459625'
EXEC CrearEmpleado '102365889','Erick','Parra', 'Parra',52158, '8789878', '85968547'
EXEC CrearEmpleado '201455445','Pedro','Guzman', 'Mendoza',52158, '26652525', '66666666'
EXEC CrearEmpleado '320145588','Ana','Mora', 'Juarez',52158, '26652525', '66666666'
EXEC CrearEmpleado '652365236','Ruben','Jimenes', 'Carvajal',52158, '26652525', '66666666'
EXEC CrearEmpleado '201325522','Emilio','Elisondo', 'Carrillo',52158, '26652525', '66666666'
EXEC CrearEmpleado '102548899','Jafet','Elisondo', 'Carrillo',52158, '26652525', '66666666'
EXEC CrearEmpleado '14525214','Enrique','Elisondo', 'Carrillo',52158, '26652525', '66666666'
EXEC CrearEmpleado '20132569','Daniel','Elisondo', 'Carrillo',52158, '26652525', '66666666'
SELECT Dni, Nombre, Apellido1, Apellido2, NumSeguro, NumTelefono, NumCelular  FROM Empleados

--creacion de Cocineros
EXEC CrearCocineros 5, '504190041'
EXEC CrearCocineros 38,'504190041'
EXEC CrearCocineros 44,'501457820'
EXEC CrearCocineros 27,'78965877'
EXEC CrearCocineros 34,'456987448'
EXEC CrearCocineros 34,'652365236'
EXEC CrearCocineros 34,'201325522'
SELECT IdCocinero, AnniosServicio, IdEmpleado FROM Cocineros

--crear pinches
EXEC CrearPinches 1, '2020/05/28', '505050505'
EXEC CrearPinches  1, '1997/11/05', '504190041'
EXEC CrearPinches  1, '1997/11/05', '501457820'
EXEC CrearPinches  1, '1997/11/05', '78965877'
EXEC CrearPinches  1, '1997/11/05', '456987448'
EXEC CrearPinches  1, '1997/11/05', '102365889'
SELECT IdPinche,IdCocinero,FechaNacimiento,IdEmpleado  FROM Pinches

--crear platos
EXEC CrearPlato 'Pinto', 1200
EXEC CrearPlato 'Arroz', 1200
EXEC CrearPlato 'pizza', 8471

SELECT IdPlato,NombrePlato,Precio,IdCocinero  FROM Platos
