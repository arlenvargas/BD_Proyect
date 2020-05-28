	USE MASTER
	GO 
	CREATE DATABASE  CIELOAZUL
	ON PRIMARY
	(NAME = 'CIELOAZUL_Data',
	FILENAME= 'C:\SQLData\CIELOAZUL_Data.Mdf',
	SIZE = 5Mb,
	MAXSIZE = 10Mb,
	FILEGROWTH = 1Mb)
	LOG ON
	(NAME = 'CIELOAZUL_Log',
	FILENAME= 'C:\SQLLog\CIELOAZUL_Log.Ldf',
	SIZE = 5Mb,
	MAXSIZE = 10Mb,
	FILEGROWTH = 1Mb)
	GO

	USE CIELOAZUL
	GO 
	CREATE TABLE Empleados(
		Dni varchar(12) NOT NULL,
		Nombre varchar(30) NOT NULL,
		Apellido1 varchar(40) NOT NULL,
		Apellido2 varchar(40),
		NumSeguro int NOT NULL,
		NumTelefono varchar(12),
		NumCelular varchar(12) NOT NULL,
		CONSTRAINT PK_Dni PRIMARY KEY (Dni)
	)
	GO

	USE CIELOAZUL
	GO 
	CREATE TABLE Cocineros( 
	    IdCocinero int  IDENTITY (1,1)  NOT NULL  ,
		AnniosServicio int NOT NULL,
		IdEmpleado varchar(12) NOT NULL,
		CONSTRAINT PK_IdCocinero PRIMARY KEY (IdCocinero),
		CONSTRAINT FK_IdEmpleado_Cocinero FOREIGN KEY (IdEmpleado) REFERENCES Empleados(Dni),
		CONSTRAINT CK_AnniosServicio CHECK(AnniosServicio >= 0)

	)
	GO

	USE CIELOAZUL
	GO 
	CREATE TABLE Pinches(
		IdPinche int IDENTITY (1,1) NOT NULL,
		IdCocinero int NOT NULL,
		FechaNacimiento date NOT NULL,
		IdEmpleado varchar(12) NOT NULL,
		CONSTRAINT PK_IdPinche PRIMARY KEY (IdPinche),
		CONSTRAINT FK_IdEmpleado_Pinche FOREIGN KEY (IdEmpleado) REFERENCES Empleados(Dni)
	)
	GO

	USE CIELOAZUL
	GO 
	CREATE TABLE Platos(
		IdPlato int IDENTITY (1,1) NOT NULL,
		NombrePlato varchar(50) NOT NULL,
		Precio money NOT NULL,
		CONSTRAINT PK_IdPlato PRIMARY KEY (IdPlato),
	)
	GO

	USE CIELOAZUL
	GO 
	CREATE TABLE Entrantes (
		IdEntrante int  IDENTITY (1,1) NOT NULL,
		IdPlato int NOT NULL,
     	CONSTRAINT PK_IdEntrante PRIMARY KEY (IdEntrante),
		CONSTRAINT FK_IdPlato_Entrante FOREIGN KEY (IdPlato) REFERENCES Platos(IdPlato)
	)
	GO

    USE CIELOAZUL
	GO 
	CREATE TABLE PrimerPlato (
		IdPrimerPlato int  IDENTITY (1,1) NOT NULL,
		IdPlato int NOT NULL,
     	CONSTRAINT PK_IdPrimerPlato PRIMARY KEY (IdPrimerPlato),
		CONSTRAINT FK_IdPlato_Primero FOREIGN KEY (IdPlato) REFERENCES Platos(IdPlato)
	)
	GO

	USE CIELOAZUL
	GO 
	CREATE TABLE SegundoPlato (
		IdSegundoPlato int  IDENTITY (1,1) NOT NULL,
		IdPlato int NOT NULL,
     	CONSTRAINT PK_IdSegundoPlato PRIMARY KEY (IdSegundoPlato),
		CONSTRAINT FK_IdPlato_Segundo FOREIGN KEY (IdPlato) REFERENCES Platos(IdPlato)
	)
	GO

	USE CIELOAZUL
	GO 
	CREATE TABLE Postres (
		IdPostre int  IDENTITY (1,1) NOT NULL,
		IdPlato int NOT NULL,
     	CONSTRAINT PK_IdPostre PRIMARY KEY (IdPostre),
		CONSTRAINT FK_IdPlato_Postre FOREIGN KEY (IdPlato) REFERENCES Platos(IdPlato)
	)
	GO

	USE CIELOAZUL
	GO 
	CREATE TABLE Almacenes (
		NumAlmacen int NOT NULL,
		Nombre varchar(40) NOT NULL,
		Descripcion varchar(100),
     	CONSTRAINT PK_NumAlmacen PRIMARY KEY (NumAlmacen)
  	)
	GO

	USE CIELOAZUL
	GO 
	CREATE TABLE Estantes (
		IdEstante varchar(2) NOT NULL,
		TamCentimetros float NOT NULL,
		IdAlmecen int NOT NULL,
		CONSTRAINT PK_IdEstante PRIMARY KEY (IdEstante),
		CONSTRAINT FK_Almacen_Estante FOREIGN KEY (IdAlmecen) REFERENCES Almacenes(NumAlmacen),
		CONSTRAINT CK_IdEstante CHECK(len(IdEstante) = 2)
	)
	GO

	USE CIELOAZUL
	GO 
	CREATE TABLE Ingredientes(
		IdIngrediente int  IDENTITY (1,1) NOT NULL,
		NombreIngrediente varchar(30) NOT NULL,
		CantidadIngrediente int NOT NULL,
		IdEstante varchar(2) NOT NULL,
		CONSTRAINT PK_IdIngrediente PRIMARY KEY (IdIngrediente),
		CONSTRAINT FK_IdEstante_Ingredientes FOREIGN KEY (IdEstante) REFERENCES Estantes(IdEstante)
	)
	GO

	USE CIELOAZUL
	GO 
	CREATE TABLE PlatoIngredientes(
	   IdPlatoIngrediente int  IDENTITY (1,1)  NOT NULL,
	   CantidadIngrediente int NOT NULL default 1,
	   IdIngrediente int NOT NULL,
	   IdPlato int NOT NULL,
	   CONSTRAINT PK_Id_PlatoIngrediente PRIMARY KEY (IdPlatoIngrediente),
	   CONSTRAINT FK_Ingrediente_PlatoIngrediente FOREIGN KEY (IdIngrediente) REFERENCES Ingredientes(IdIngrediente),
	   CONSTRAINT FK_Plato_PlatoIngrediente FOREIGN KEY (IdPlato) REFERENCES Platos(IdPlato)
	)
	GO

	USE CIELOAZUL
	GO
	CREATE TABLE ConocePlato(
		IdConocePlato int IDENTITY (1,1) NOT NULL, 
		IdPlato int NOT NULL,
		IdCocinero int NOT NULL
		CONSTRAINT PK_IdConocePlato PRIMARY KEY (IdConocePlato),
		CONSTRAINT FK_IdPlato FOREIGN KEY (IdPlato) REFERENCES Platos(IdPlato),
		CONSTRAINT FK_IdCocinero FOREIGN KEY (IdCocinero) REFERENCES Cocineros(IdCocinero)
	)

	USE CIELOAZUL
	GO
	CREATE TABLE PreparaPlato(
        IdPreparaPlato int IDENTITY (1,1) NOT NULL,
        IdConocePlato int NOT NULL,
        IdPlato int NOT NULL,
        CONSTRAINT PK_IdPreparaPlato PRIMARY KEY (IdPreparaPlato),
        CONSTRAINT FK_IdConocePlato FOREIGN KEY (IdConocePlato) REFERENCES ConocePlato(IdConocePlato),
        CONSTRAINT FK_IdPreparaPlato_Plato FOREIGN KEY (IdPlato) REFERENCES Platos(IdPlato)
    )
	GO




