USE CIELOAZUL

-- simplify syntax for maintaining data dictionary

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