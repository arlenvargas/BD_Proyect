USE CIELOAZUL

-- simplify syntax for maintaining data dictionary
-- Fuente: https://stackoverflow.com/questions/17173260/check-if-extended-property-description-already-exists-before-adding

IF OBJECT_ID('dbo.usp_addorupdatedescription', 'P') IS NOT NULL
    DROP PROCEDURE dbo.usp_addorupdatedescription;
GO

CREATE PROCEDURE usp_addorupdatedescription @table nvarchar(128), -- table name
                                            @column nvarchar(128), -- column name, NULL if description for table
                                            @descr sql_variant -- description text
AS
BEGIN
    SET NOCOUNT ON;

    IF @column IS NOT NULL
        IF NOT EXISTS(SELECT NULL
                      FROM SYS.EXTENDED_PROPERTIES
                      WHERE [major_id] = OBJECT_ID(@table)
                        AND [name] = N'MS_Description'
                        AND [minor_id] = (SELECT [column_id]
                                          FROM SYS.COLUMNS
                                          WHERE [name] = @column
                                            AND [object_id] = OBJECT_ID(@table)))
            EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = @descr,
                    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
                    @level1name = @table, @level2type = N'COLUMN', @level2name = @column;
        ELSE
            EXECUTE sp_updateextendedproperty @name = N'MS_Description',
                    @value = @descr, @level0type = N'SCHEMA', @level0name = N'dbo',
                    @level1type = N'TABLE', @level1name = @table,
                    @level2type = N'COLUMN', @level2name = @column;
    ELSE
        IF NOT EXISTS(SELECT NULL
                      FROM SYS.EXTENDED_PROPERTIES
                      WHERE [major_id] = OBJECT_ID(@table)
                        AND [name] = N'MS_Description'
                        AND [minor_id] = 0)
            EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = @descr,
                    @level0type = N'SCHEMA', @level0name = N'dbo',
                    @level1type = N'TABLE', @level1name = @table;
        ELSE
            EXECUTE sp_updateextendedproperty @name = N'MS_Description', @value = @descr,
                    @level0type = N'SCHEMA', @level0name = N'dbo',
                    @level1type = N'TABLE', @level1name = @table;
END
GO
-- Empleados
EXEC usp_addorupdatedescription 'Empleados', 'Dni', 'Es el numero de cedula del empleado que funciona como PK'
EXEC usp_addorupdatedescription 'Empleados', 'Nombre', 'Es el nombre del empleado'
EXEC usp_addorupdatedescription 'Empleados', 'Apellido1', 'Es el primer apellido del empleado'
EXEC usp_addorupdatedescription 'Empleados', 'Apellido2', 'Es el segundo apellido del empleado'
EXEC usp_addorupdatedescription 'Empleados', 'NumSeguro', 'Es el numero de seguro del empleado'
EXEC usp_addorupdatedescription 'Empleados', 'NumTelefono', 'Es el numero de telefono de casa del empleado'
EXEC usp_addorupdatedescription 'Empleados', 'NumCelular', 'Es el numero de telefono de celular del empleado'

-- Cocinero
EXEC usp_addorupdatedescription 'Cocineros', 'IdCocinero', 'Es un numero autoincremental que va aumentado de uno en uno, es la PK'
EXEC usp_addorupdatedescription 'Cocineros', 'AnniosServicio', 'Es la cantidad de años de servicio del cocinero'
EXEC usp_addorupdatedescription 'Cocineros', 'IdEmpleado', 'El el numero de cedula del empleado, es una FK'

-- Pinches
EXEC usp_addorupdatedescription 'Pinches', 'IdPinche', 'Es un numero autoincremental que va aumentado de uno en uno, es la PK'
EXEC usp_addorupdatedescription 'Pinches', 'IdCocinero', 'Es el identificador de tabla de cocinero, es la FK'
EXEC usp_addorupdatedescription 'Pinches', 'FechaNacimiento', 'Es la fecha de nacimiento del pinche'
EXEC usp_addorupdatedescription 'Pinches', 'IdEmpleado', 'El el numero de cedula del empleado, es una FK'

-- Platos

EXEC usp_addorupdatedescription 'Platos', 'IdPlato', 'Es un numero autoincremental que va aumentado de uno en uno, es la PK'
EXEC usp_addorupdatedescription 'Platos', 'NombrePlato', 'Es el nombre del plato'
EXEC usp_addorupdatedescription 'Platos', 'Precio', 'Es precio del plato'

-- Plato Entrante

EXEC usp_addorupdatedescription 'Entrantes', 'IdEntrante', 'Es un numero autoincremental que va aumentado de uno en uno, es la PK'
EXEC usp_addorupdatedescription 'Entrantes', 'IdPlato', 'Es numero de identificacion del plato al que esta relacionado'

-- PrimerPlato

EXEC usp_addorupdatedescription 'PrimerPlato', 'IdPrimerPlato', 'Es un numero autoincremental que va aumentado de uno en uno, es la PK'
EXEC usp_addorupdatedescription 'PrimerPlato', 'IdPlato', 'Es numero de identificacion del plato al que esta relacionado'

-- SegundoPlato

EXEC usp_addorupdatedescription 'SegundoPlato', 'IdSegundoPlato', 'Es un numero autoincremental que va aumentado de uno en uno, es la PK'
EXEC usp_addorupdatedescription 'SegundoPlato', 'IdPlato', 'Es numero de identificacion del plato al que esta relacionado'

-- Postres

EXEC usp_addorupdatedescription 'Postres', 'IdPostre', 'Es un numero autoincremental que va aumentado de uno en uno, es la PK'
EXEC usp_addorupdatedescription 'Postres', 'IdPlato', 'Es numero de identificacion del plato al que esta relacionado'
--Almacen
EXEC usp_addorupdatedescription 'Almacenes', 'NumAlmacen', 'Es el numero de identificacion del almacen que funciona como PK'
EXEC usp_addorupdatedescription 'Almacenes', 'Nombre', 'Es el nombre que se le asignara a cada Almacen'
EXEC usp_addorupdatedescription 'Almacenes', 'Descripcion', 'Una descripcion acerca del almacen, por ejemplo ubicacion del almacen'

--Estante
EXEC usp_addorupdatedescription 'Estantes', 'IdEstante', 'Es el numero unico que tendra cada estante que funciona como PK'
EXEC usp_addorupdatedescription 'Estantes', 'NombreEstante', 'Nombre que tendra cada estante, el cual sera de solo dos caracteres'
EXEC usp_addorupdatedescription 'Estantes', 'TamCentimetros', 'Es el tama�o en centimetros que tendra cada estante'
EXEC usp_addorupdatedescription 'Estantes', 'IdAlmecen', 'Es el numero que identificara a que almacen pertenece el estante, es el FK de Almacenes'

--Ingredientes
EXEC usp_addorupdatedescription 'Ingredientes', 'IdIngrediente', 'Es el numero de identificacion del ingrediente que funciona como PK'
EXEC usp_addorupdatedescription 'Ingredientes', 'NombreIngrediente', 'Nombre que tendra cada ingrediente'
EXEC usp_addorupdatedescription 'Ingredientes', 'CantidadIngrediente', 'La cantidad de los ingredientes agregados, datos numericos'
EXEC usp_addorupdatedescription 'Ingredientes', 'IdEstante', 'Es el numero que identificara a que estante se almacena el ingrediente, es el FK de Estantes'

--Plato ingrediente
EXEC usp_addorupdatedescription 'PlatoIngredientes', 'IdPlatoIngrediente', 'Es el numero de identificacion del plato ingrediente que funciona como PK'
EXEC usp_addorupdatedescription 'PlatoIngredientes', 'CantidadIngrediente', 'La cantidad de ingrediente que se utilizara en los platos'
EXEC usp_addorupdatedescription 'PlatoIngredientes', 'IdIngrediente', 'Es el numero que identificara que ingrediente se utilizara en el plato, es el FK de Ingredientes'
EXEC usp_addorupdatedescription 'PlatoIngredientes', 'IdPlato', 'Es el numero que identificara que plato se preparar�, es el FK de Platos'

--Conoce plato
EXEC usp_addorupdatedescription 'ConocePlato', 'IdConocePlato', 'Es el numero de identificacion del conoce plato que funciona como PK'
EXEC usp_addorupdatedescription 'ConocePlato', 'IdPlato', 'Es el numero que identificara el plato que conoce el cocinero, es el FK de Platos'
EXEC usp_addorupdatedescription 'ConocePlato', 'IdCocinero', 'Es el numero que identificara el cocinero que conoce el plato, es el FK de Cocineros'

--Prepara Plato
EXEC usp_addorupdatedescription 'PreparaPlato', 'IdPreparaPlato', 'Es el numero de identificacion del prepara plato que funciona como PK'
EXEC usp_addorupdatedescription 'PreparaPlato', 'IdConocePlato', 'Es el numero que dira el conoce plato, para saber quien conoce el plato, es el FK de ConocePlato'
EXEC usp_addorupdatedescription 'PreparaPlato', 'IdPlato', 'Es el numero que identificara que plato se va a preparar, es el FK de Platos'
EXEC usp_addorupdatedescription 'PreparaPlato', 'FechaCreacion', 'Es la fecha que indicara en que momento se preparo el plato'

--Auditoria
EXEC usp_addorupdatedescription 'Auditoria', 'IdAuditoria', 'Es el numero que identificara el usuario que ingreso a la base de datos, funciona como PK'
EXEC usp_addorupdatedescription 'Auditoria', 'Usuario', 'Es el usuario que ingreso'
EXEC usp_addorupdatedescription 'Auditoria', 'LoginUsuario', 'El nombre de la persona que se logeo e ingreso a la base de datos'
EXEC usp_addorupdatedescription 'Auditoria', 'Fecha', 'Fecha en la que ingreso'
EXEC usp_addorupdatedescription 'Auditoria', 'Descripcion', 'Descripcion de las acciones que realizo este usuario'

