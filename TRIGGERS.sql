--------------------------------------Registro Empleado------------------------------------
------------------Insertar------------
USE CIELOAZUL
GO
CREATE TRIGGER TR_Insertar_Empleado
   ON Empleados FOR INSERT
   AS
   declare @USER varchar (200)
   declare @LOGINUSER varchar (200)
   select @USER = ORIGINAL_LOGIN() 
   select @LOGINUSER = SUSER_SNAME()
   EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Registro empleado insertado')
GO
----------------Actualizar-------------
USE CIELOAZUL
GO
CREATE TRIGGER TR_Update_Empleado
	ON Empleados FOR UPDATE
	AS
	declare @USER varchar (200)
    declare @LOGINUSER varchar (200)
    select @USER = ORIGINAL_LOGIN() 
    select @LOGINUSER = SUSER_SNAME()
    EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Se ha Modificado EL registro de un empleado')
GO
----------------Eliminar------------------
USE CIELOAZUL
GO
CREATE TRIGGER TR_Delete_Empleado
	ON Empleados FOR DELETE
	AS
	declare @USER varchar (200)
    declare @LOGINUSER varchar (200)
    select @USER = ORIGINAL_LOGIN() 
    select @LOGINUSER = SUSER_SNAME()
    EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Se ha Eliminado eL registro de un empleado')
GO

-----------------------------------regitros cocinero--------------------------------------
CREATE TRIGGER TR_Insertar_Cocineros
   ON Cocineros FOR INSERT
   AS
   declare @USER varchar (200)
   declare @LOGINUSER varchar (200)
   select @USER = ORIGINAL_LOGIN() 
   select @LOGINUSER = SUSER_SNAME()
   EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Registro Cocinero insertado')
GO


USE CIELOAZUL
GO
CREATE TRIGGER TR_Update_Cocinero
	ON Cocineros FOR UPDATE
	AS
	declare @USER varchar (200)
    declare @LOGINUSER varchar (200)
    select @USER = ORIGINAL_LOGIN() 
    select @LOGINUSER = SUSER_SNAME()
    EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Se ha Modificado EL registro de un empleado')
GO


USE CIELOAZUL
GO
CREATE TRIGGER TR_Delete_Cocinero
	ON Cocineros FOR DELETE
	AS
	declare @USER varchar (200)
    declare @LOGINUSER varchar (200)
    select @USER = ORIGINAL_LOGIN() 
    select @LOGINUSER = SUSER_SNAME()
    EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Se ha Eliminado Un Cocinero')
GO






--------------------------------Registro Pinches---------------------------

CREATE TRIGGER TR_Insertar_Pinches
   ON Pinches FOR INSERT
   AS
   declare @USER varchar (200)
   declare @LOGINUSER varchar (200)
   select @USER = ORIGINAL_LOGIN() 
   select @LOGINUSER = SUSER_SNAME()
   EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Registro Pinche Creado')
GO


CREATE TRIGGER TR_Update_Pinches
   ON Pinches FOR UPDATE
   AS
   declare @USER varchar (200)
   declare @LOGINUSER varchar (200)
   select @USER = ORIGINAL_LOGIN() 
   select @LOGINUSER = SUSER_SNAME()
   EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Registro Pinche Actualizado')
GO


CREATE TRIGGER TR_Delete_Pinches
   ON Pinches FOR INSERT
   AS
   declare @USER varchar (200)
   declare @LOGINUSER varchar (200)
   select @USER = ORIGINAL_LOGIN() 
   select @LOGINUSER = SUSER_SNAME()
   EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Registro Pinche Eliminado')
GO






------------------------------Registro Platos-----------------------------

CREATE TRIGGER TR_Insertar_Platos
   ON Platos FOR INSERT
   AS
   declare @USER varchar (200)
   declare @LOGINUSER varchar (200)
   select @USER = ORIGINAL_LOGIN() 
   select @LOGINUSER = SUSER_SNAME()
   EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Nuevo Plato Agregado')
GO


CREATE TRIGGER TR_Update_Platos
   ON Platos FOR UPDATE
   AS
   declare @USER varchar (200)
   declare @LOGINUSER varchar (200)
   select @USER = ORIGINAL_LOGIN() 
   select @LOGINUSER = SUSER_SNAME()
   EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Nuevo Plato Actualizado')
GO


CREATE TRIGGER TR_Delete_Platos
   ON Platos FOR DELETE
   AS
   declare @USER varchar (200)
   declare @LOGINUSER varchar (200)
   select @USER = ORIGINAL_LOGIN() 
   select @LOGINUSER = SUSER_SNAME()
   EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Nuevo Plato Agregado')
GO





----------------------------Registro Entrante-----------------------

CREATE TRIGGER TR_Insertar_Entrante
   ON Entrantes FOR INSERT
   AS
   declare @USER varchar (200)
   declare @LOGINUSER varchar (200)
   select @USER = ORIGINAL_LOGIN() 
   select @LOGINUSER = SUSER_SNAME()
   EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Nuevo Plato Entrante Agregado')
GO

CREATE TRIGGER TR_Update_Entrante
   ON Entrantes FOR UPDATE
   AS
   declare @USER varchar (200)
   declare @LOGINUSER varchar (200)
   select @USER = ORIGINAL_LOGIN() 
   select @LOGINUSER = SUSER_SNAME()
   EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Plato Entrante Actualizado')
GO


CREATE TRIGGER TR_Delete_Entrante
   ON Entrantes FOR DELETE
   AS
   declare @USER varchar (200)
   declare @LOGINUSER varchar (200)
   select @USER = ORIGINAL_LOGIN() 
   select @LOGINUSER = SUSER_SNAME()
   EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Se Elimino Plato Entrante')
GO




------------------------------Registro Primer Plato---------------------------------

CREATE TRIGGER TR_Insertar_PrimerPlato
   ON PrimerPlato FOR INSERT
   AS
   declare @USER varchar (200)
   declare @LOGINUSER varchar (200)
   select @USER = ORIGINAL_LOGIN() 
   select @LOGINUSER = SUSER_SNAME()
   EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Nuevo Primer Plato Agregado a la lista')
GO

CREATE TRIGGER TR_Update_PrimerPlato
   ON PrimerPlato FOR DELETE
   AS
   declare @USER varchar (200)
   declare @LOGINUSER varchar (200)
   select @USER = ORIGINAL_LOGIN() 
   select @LOGINUSER = SUSER_SNAME()
   EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Primer Plato Eliminado De La Lista')
GO



--------------------------Registro Segundo Plato-----------------------------------


CREATE TRIGGER TR_Insertar_SegundoPlato
   ON SegundoPlato FOR INSERT
   AS
   declare @USER varchar (200)
   declare @LOGINUSER varchar (200)
   select @USER = ORIGINAL_LOGIN() 
   select @LOGINUSER = SUSER_SNAME()
   EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Nuevo Primer Plato Agregado a la lista')
GO

CREATE TRIGGER TR_Update_SegundoPlato
   ON SegundoPlato FOR UPDATE
   AS
   declare @USER varchar (200)
   declare @LOGINUSER varchar (200)
   select @USER = ORIGINAL_LOGIN() 
   select @LOGINUSER = SUSER_SNAME()
   EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Primer Plato Actualizado')
GO

CREATE TRIGGER TR_DELETE_SegundoPlato
   ON SegundoPlato FOR DELETE
   AS
   declare @USER varchar (200)
   declare @LOGINUSER varchar (200)
   select @USER = ORIGINAL_LOGIN() 
   select @LOGINUSER = SUSER_SNAME()
   EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Nuevo Primer Plato Agregado a la lista')
GO




------------------------------Registro Postre------------------------------------------

CREATE TRIGGER TR_Insertar_Postre
   ON Postres FOR INSERT
   AS
   declare @USER varchar (200)
   declare @LOGINUSER varchar (200)
   select @USER = ORIGINAL_LOGIN() 
   select @LOGINUSER = SUSER_SNAME()
   EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Nuevo Postre Agregado a la lista')
GO


CREATE TRIGGER TR_Update_Postre
   ON Postres FOR UPDATE
   AS
   declare @USER varchar (200)
   declare @LOGINUSER varchar (200)
   select @USER = ORIGINAL_LOGIN() 
   select @LOGINUSER = SUSER_SNAME()
   EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Postre Actualizado')
GO

CREATE TRIGGER TR_DELETE_Postre
   ON Postres FOR DELETE
   AS
   declare @USER varchar (200)
   declare @LOGINUSER varchar (200)
   select @USER = ORIGINAL_LOGIN() 
   select @LOGINUSER = SUSER_SNAME()
   EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Se Elimino El Postre de la lista')
GO




------------------------------Registro Almacen-----------------------------------------------

CREATE TRIGGER TR_Insertar_Almacen
   ON Almacenes FOR INSERT
   AS
   declare @USER varchar (200)
   declare @LOGINUSER varchar (200)
   select @USER = ORIGINAL_LOGIN() 
   select @LOGINUSER = SUSER_SNAME()
   EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Se Agregó Un Nuevo Almacen')
GO

CREATE TRIGGER TR_Update_Almacen
   ON Almacenes FOR UPDATE
   AS
   declare @USER varchar (200)
   declare @LOGINUSER varchar (200)
   select @USER = ORIGINAL_LOGIN() 
   select @LOGINUSER = SUSER_SNAME()
   EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Almacen Actualizado')
GO

CREATE TRIGGER TR_Delete_Almacen
   ON Almacenes FOR DELETE
   AS
   declare @USER varchar (200)
   declare @LOGINUSER varchar (200)
   select @USER = ORIGINAL_LOGIN() 
   select @LOGINUSER = SUSER_SNAME()
   EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Se Elimino Un Almacen')
GO


----------------------------Resgistro Estantes-----------------------------------------------

CREATE TRIGGER TR_Insertar_Estantes
   ON Estantes FOR INSERT
   AS
   declare @USER varchar (200)
   declare @LOGINUSER varchar (200)
   select @USER = ORIGINAL_LOGIN() 
   select @LOGINUSER = SUSER_SNAME()
   EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Se agragó Un Nuevo Estante')
GO

CREATE TRIGGER TR_Update_Estantes
   ON Estantes FOR UPDATE
   AS
   declare @USER varchar (200)
   declare @LOGINUSER varchar (200)
   select @USER = ORIGINAL_LOGIN() 
   select @LOGINUSER = SUSER_SNAME()
   EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Estante Actualizado')
GO

CREATE TRIGGER TR_Delete_Estantes
   ON Estantes FOR DELETE
   AS
   declare @USER varchar (200)
   declare @LOGINUSER varchar (200)
   select @USER = ORIGINAL_LOGIN() 
   select @LOGINUSER = SUSER_SNAME()
   EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Estante Eliminado')
GO



--------------------------------Registro Ingredientes-----------------------------------


CREATE TRIGGER TR_Insertar_Ingredientes
   ON Ingredientes FOR INSERT
   AS
   declare @USER varchar (200)
   declare @LOGINUSER varchar (200)
   select @USER = ORIGINAL_LOGIN() 
   select @LOGINUSER = SUSER_SNAME()
   EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Abastecimiento de ingredientes')
GO

CREATE TRIGGER TR_Update_Ingredientes
   ON Ingredientes FOR UPDATE
   AS
   declare @USER varchar (200)
   declare @LOGINUSER varchar (200)
   select @USER = ORIGINAL_LOGIN() 
   select @LOGINUSER = SUSER_SNAME()
   EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Ingredientes Actualizados')
GO

CREATE TRIGGER TR_Delete_Ingredientes
   ON Ingredientes FOR DELETE
   AS
   declare @USER varchar (200)
   declare @LOGINUSER varchar (200)
   select @USER = ORIGINAL_LOGIN() 
   select @LOGINUSER = SUSER_SNAME()
   EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Ingredientes ELiminados')
GO



--------------------------Registro PlatoIngrediente--------------------------------


CREATE TRIGGER TR_Insertar_PlatoIngrediente
   ON PlatoIngredientes FOR INSERT
   AS
   declare @USER varchar (200)
   declare @LOGINUSER varchar (200)
   select @USER = ORIGINAL_LOGIN() 
   select @LOGINUSER = SUSER_SNAME()
   EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Ingredientes para un plato')
GO

CREATE TRIGGER TR_Update_PlatoIngrediente
   ON PlatoIngredientes FOR UPDATE
   AS
   declare @USER varchar (200)
   declare @LOGINUSER varchar (200)
   select @USER = ORIGINAL_LOGIN() 
   select @LOGINUSER = SUSER_SNAME()
   EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Se Han Actualizado los Ingredientes para un plato')
GO

CREATE TRIGGER TR_Delete_PlatoIngrediente
   ON PlatoIngredientes FOR DELETE
   AS
   declare @USER varchar (200)
   declare @LOGINUSER varchar (200)
   select @USER = ORIGINAL_LOGIN() 
   select @LOGINUSER = SUSER_SNAME()
   EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Se Han Eliminado Algunos Ingredientes para un plato')
GO



----------------------------registro Conoce plato------------------------------

CREATE TRIGGER TR_Insertar_ConocePlato
   ON ConocePlato FOR INSERT
   AS
   declare @USER varchar (200)
   declare @LOGINUSER varchar (200)
   select @USER = ORIGINAL_LOGIN() 
   select @LOGINUSER = SUSER_SNAME()
   EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Se Asigno el cocinero que conoce el plato')
GO

CREATE TRIGGER TR_Update_ConocePlato
   ON ConocePlato FOR UPDATE
   AS
   declare @USER varchar (200)
   declare @LOGINUSER varchar (200)
   select @USER = ORIGINAL_LOGIN() 
   select @LOGINUSER = SUSER_SNAME()
   EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Se le asigno un nuevo cocinero que conoce el plato')
GO

CREATE TRIGGER TR_Delete_ConocePlato
   ON ConocePlato FOR DELETE
   AS
   declare @USER varchar (200)
   declare @LOGINUSER varchar (200)
   select @USER = ORIGINAL_LOGIN() 
   select @LOGINUSER = SUSER_SNAME()
   EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Se Elimino al cocinero que conoce el plato')
GO



-------------------------------- Registro PreparaPlato -----------------------

CREATE TRIGGER TR_Insertar_PreparaPlato
   ON PreparaPlato FOR INSERT
   AS
   declare @USER varchar (200)
   declare @LOGINUSER varchar (200)
   select @USER = ORIGINAL_LOGIN() 
   select @LOGINUSER = SUSER_SNAME()
   EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'El Cocinero Prepara El Plato')
GO

CREATE TRIGGER TR_Update_PreparaPlato
   ON PreparaPlato FOR UPDATE
   AS
   declare @USER varchar (200)
   declare @LOGINUSER varchar (200)
   select @USER = ORIGINAL_LOGIN() 
   select @LOGINUSER = SUSER_SNAME()
   EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Se Actualizo al Cocinero Prepara El Plato')
GO

CREATE TRIGGER TR_Delete_PreparaPlato
   ON PreparaPlato FOR DELETE
   AS
   declare @USER varchar (200)
   declare @LOGINUSER varchar (200)
   select @USER = ORIGINAL_LOGIN() 
   select @LOGINUSER = SUSER_SNAME()
   EXECUTE AS USER = ORIGINAL_LOGIN()
INSERT INTO Auditoria values(@USER, @LOGINUSER ,getdate(),'Se Elimino al Cocinero Prepara El Plato')
GO



------select LoginUsario, Fecha, Descripcion from Auditoria
------select LoginUsario, Fecha, Descripcion from Auditoria where Fecha = '2020-05-31'
------select LoginUsario, Fecha, Descripcion from Auditoria where Descripcion ='Almacen Actualizado'