USE CIELOAZUL
GO
CREATE PROC SP_ObtenerEmpleados
AS
	SELECT 'Cedula Empleado' = Dni , Nombre, 'Primer Apellido' = Apellido1, 
	'Segundo Apellido' = Apellido2, 'Numero de Seguro' = NumSeguro, 
	'Numero de Telefono' = NumTelefono, 'Numero de Celular' = NumCelular 
	FROM Empleados
GO

USE CIELOAZUL
GO
CREATE PROC SP_ObtenerCocineros
AS
	SELECT 'Id Cocinero' = IdCocinero, 'Años de Servicio' = AnniosServicio, 
	'Cedula del Empleado' = IdEmpleado 
	FROM Cocineros
GO

USE CIELOAZUL
GO
CREATE PROC SP_ObtenerPinches
AS
	SELECT 'Id Pinche' = IdPinche, 'Fecha de Nacimiento' = FechaNacimiento, 
	'Id Cocinero' = IdCocinero, 'Cedula del Empleado' = IdEmpleado 
	FROM Pinches
GO

USE CIELOAZUL
GO
CREATE PROC SP_ObtenerPlatos
AS
	SELECT 'Id Plato' = IdPlato, 'Nombre del Plato' = NombrePlato, 
	'Precio del plato' = Precio
	FROM Platos
GO

USE CIELOAZUL
GO
CREATE PROC SP_ObtenerEntrantes
AS
	SELECT 'Id Entrante' = IdEntrante, 'Id del Plato' = IdPlato
	FROM Entrantes
GO

USE CIELOAZUL
GO
CREATE PROC SP_ObtenerPrimerPlato
AS
	SELECT 'Id Primer Plato' = IdPrimerPlato, 'Id del Plato' = IdPlato
	FROM PrimerPlato
GO

USE CIELOAZUL
GO
CREATE PROC SP_ObtenerSegundoPlato
AS
	SELECT 'Id Segundo Plato' = IdSegundoPlato, 'Id del Plato' = IdPlato
	FROM SegundoPlato
GO

USE CIELOAZUL
GO
CREATE PROC SP_ObtenerPostres
AS
	SELECT 'Id Postre' = IdPostre, 'Id del Plato' = IdPlato
	FROM Postres
GO

USE CIELOAZUL
GO
CREATE PROC SP_ObtenerAlmacenes
AS
	SELECT 'Id Almacen' = NumAlmacen, Nombre,
	Descripcion
	FROM Almacenes
GO

USE CIELOAZUL
GO
CREATE PROC SP_ObtenerEstantes
AS
	SELECT 'Id Estante' = IdEstante, 'Nombre Estante' = NombreEstante,
	'Tamaño en Centimetros' = TamCentimetros, 'Id Almacen' = IdAlmecen
	FROM Estantes
GO

USE CIELOAZUL
GO
CREATE PROC SP_ObtenerIngredientes
AS
	SELECT 'Id Ingrediente' = IdIngrediente, 'Nombre Ingrediente' = NombreIngrediente,
	'Cantidad de Ingrediente' = CantidadIngrediente, 'Id Estante' = IdEstante
	FROM Ingredientes
GO

USE CIELOAZUL
GO
CREATE PROC SP_ObtenerPlatosIngredientes
AS
	SELECT 'Id Plato Ingrediente' = IdPlatoIngrediente, 'Cantidad Ingrediente' = CantidadIngrediente,
	'Id Ingrediente' = IdIngrediente, 'Id Plato' = IdPlato
	FROM PlatoIngredientes
GO

USE CIELOAZUL
GO
CREATE PROC SP_ObtenerConocePlato
AS
	SELECT 'Id Conoce Plato' = IdConocePlato, 'Id Plato' = IdPlato,
	'Id Cocinero' = IdCocinero
	FROM ConocePlato
GO

USE CIELOAZUL
GO
CREATE PROC SP_ObtenerPreparaPlato
AS
	SELECT 'Id Prepara Plato' = IdPreparaPlato, 'Id Conoce Plato' = IdConocePlato,
	'Id Plato' = IdPlato, 'Fecha de Creacion' = FechaCreacion
	FROM PreparaPlato
GO

USE CIELOAZUL
GO
CREATE PROC SP_ObtenerAuditoria
AS
	SELECT 'Id Auditoria' = IdAuditoria, Usuario,
	'Login Usuario' = LoginUsuario, 'Fecha' = Fecha, Descripcion
	FROM Auditoria
GO