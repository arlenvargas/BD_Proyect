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

EXEC usp_addorupdatedescription 'Empleados', 'Dni', 'Es el numero de cedula del empleado que funciona como PK'

EXEC usp_addorupdatedescription 'Almacenes', 'NumAlmacen', 'Es el numero de identificacion del almacen que funciona como PK'
EXEC usp_addorupdatedescription 'Almacenes', 'Nombre', 'Es el nombre que se le asignara a cada Almacen'
EXEC usp_addorupdatedescription 'Almacenes', 'Descripcion', 'Una descripcion acerca del almacen, por ejemplo ubicacion del almacen'

EXEC usp_addorupdatedescription 'Estantes', 'IdEstante', 'Es el numero unico que tendra cada estante que funciona como PK'
EXEC usp_addorupdatedescription 'Estantes', 'NombreEstante', 'Nombre que tendra cada estante, el cual sera de solo dos caracteres'
EXEC usp_addorupdatedescription 'Estantes', 'TamCentimetros', 'Es el tamaño en centimetros que tendra cada estante'
EXEC usp_addorupdatedescription 'Estantes', 'IdAlmecen', 'Es el numero que identificara a que almacen pertenece el estante, es el FK de Almacenes'

EXEC usp_addorupdatedescription 'Ingredientes', 'IdIngrediente', 'Es el numero de identificacion del ingrediente que funciona como PK'
EXEC usp_addorupdatedescription 'Ingredientes', 'NombreIngrediente', 'Nombre que tendra cada ingrediente'
EXEC usp_addorupdatedescription 'Ingredientes', 'CantidadIngrediente', 'La cantidad de los ingredientes agregados, datos numericos'
EXEC usp_addorupdatedescription 'Ingredientes', 'IdEstante', 'Es el numero que identificara a que estante se almacena el ingrediente, es el FK de Estantes'

EXEC usp_addorupdatedescription 'PlatoIngredientes', 'IdPlatoIngrediente', 'Es el numero de identificacion del plato ingrediente que funciona como PK'
EXEC usp_addorupdatedescription 'PlatoIngredientes', 'CantidadIngrediente', 'La cantidad de ingrediente que se utilizara en los platos'
EXEC usp_addorupdatedescription 'PlatoIngredientes', 'IdIngrediente', 'Es el numero que identificara que ingrediente se utilizara en el plato, es el FK de Ingredientes'
EXEC usp_addorupdatedescription 'PlatoIngredientes', 'IdPlato', 'Es el numero que identificara que plato se preparará, es el FK de Platos'

EXEC usp_addorupdatedescription 'ConocePlato', 'IdConocePlato', 'Es el numero de identificacion del conoce plato que funciona como PK'
EXEC usp_addorupdatedescription 'ConocePlato', 'IdPlato', 'Es el numero que identificara el plato que conoce el cocinero, es el FK de Platos'
EXEC usp_addorupdatedescription 'ConocePlato', 'IdCocinero', 'Es el numero que identificara el cocinero que conoce el plato, es el FK de Cocineros'

EXEC usp_addorupdatedescription 'PreparaPlato', 'IdPreparaPlato', 'Es el numero de identificacion del prepara plato que funciona como PK'
EXEC usp_addorupdatedescription 'PreparaPlato', 'IdConocePlato', 'Es el numero que dira el conoce plato, para saber quien conoce el plato, es el FK de ConocePlato'
EXEC usp_addorupdatedescription 'PreparaPlato', 'IdPlato', 'Es el numero que identificara que plato se va a preparar, es el FK de Platos'
EXEC usp_addorupdatedescription 'PreparaPlato', 'FechaCreacion', 'Es la fecha que indicara en que momento se preparo el plato'

EXEC usp_addorupdatedescription 'Auditoria', 'IdAuditoria', 'Es el numero que identificara el usuario que ingreso a la base de datos, funciona como PK'
EXEC usp_addorupdatedescription 'Auditoria', 'Usuario', 'Es el usuario que ingreso'
EXEC usp_addorupdatedescription 'Auditoria', 'LoginUsario', 'El nombre de la persona que se logeo e ingreso a la base de datos'
EXEC usp_addorupdatedescription 'Auditoria', 'Fecha', 'Fecha en la que ingreso'
EXEC usp_addorupdatedescription 'Auditoria', 'Descripcion', 'Descripcion de las acciones que realizo este usuario'