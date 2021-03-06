CREATE TABLE Administradores(
	  [ID]					INT NOT NULL IDENTITY(1,1),
	  [usuario]				varchar(30) NOT NULL,
	  [pass]				varchar(30) NOT NULL,
	  PRIMARY KEY CLUSTERED ([ID] ASC)
);

CREATE TABLE Ferreteria (
	  [ID]					INT NOT NULL IDENTITY(1,1),
	  [Localizacion]		Geography NOT NULL,
	  [Foto]		   	  	IMAGE NOT NULL,
	  [Telefono]			varchar(20) NOT NULL,
	  PRIMARY KEY CLUSTERED ([ID] ASC)
);

CREATE TABLE TipoEmpleado(
	  [ID]					INT NOT NULL IDENTITY(1,1),
	  [nombre]				varchar(30) NOT NULL,
	  [descripcion]			varchar(30) NOT NULL,
	  PRIMARY KEY CLUSTERED ([ID] ASC)
);

CREATE TABLE Empleado (
	  [ID]					INT NOT NULL IDENTITY(1,1),
	  [IDFerreteria]		INT NOT NULL,
	  [Nombre]				Varchar(50) NOT NULL,
	  [Apellido]			Varchar(50) NOT NULL,
	  [Foto]		   	  	IMAGE NOT NULL,
	  [FechaIngreso]		Date NOT NULL,
	  [Activo]				Bit NOT NULL,
	  [NumVacaciones]		INT NOT NULL,
	  [IDTipoEmpleado]		INT NOT NULL,
	  PRIMARY KEY CLUSTERED ([ID] ASC),
	  FOREIGN KEY ([IDFerreteria]) REFERENCES [dbo].[Ferreteria] ([ID]),
	  FOREIGN KEY ([IDTipoEmpleado]) REFERENCES [dbo].[TipoEmpleado] ([ID])
);

CREATE TABLE VacacionesXEmpleado (
	  [ID]					INT NOT NULL IDENTITY(1,1),
	  [IDEmpleado]			INT NOT NULL,
	  [FechaInicio]			Date NOT NULL,
	  [FechaFinal]			Date,
	  PRIMARY KEY CLUSTERED ([ID] ASC),
	  FOREIGN KEY ([IDEmpleado]) REFERENCES [dbo].[Empleado] ([ID])
);

CREATE TABLE Amonestacion (
	  [ID]					INT NOT NULL IDENTITY(1,1),
	  [IDEmpleado]			INT NOT NULL,
	  [Fecha]				Date NOT NULL,
	  [Monto]				Money NOT NULL,
	  PRIMARY KEY CLUSTERED ([ID] ASC),
	  FOREIGN KEY ([IDEmpleado]) REFERENCES [dbo].[Empleado] ([ID])
);

CREATE TABLE MarcaVehiculo (
	  [ID]					INT NOT NULL IDENTITY(1,1),
	  [Nombre]				varchar(20) NOT NULL,
	  PRIMARY KEY CLUSTERED ([ID] ASC)
);

CREATE TABLE Modelo (
	  [ID]					INT NOT NULL IDENTITY(1,1),
	  [Anio]					Date NOT NULL,
	  [Descripcion]			varchar(50) NOT NULL,
	  [LitrosXKilometro]	Money NOT NULL,
	  [IDMarcaVehiculo]		INT NOT NULL,
	  PRIMARY KEY CLUSTERED ([ID] ASC),
	  FOREIGN KEY ([IDMarcaVehiculo]) REFERENCES [dbo].[MarcaVehiculo] ([ID])
);

CREATE TABLE Vehiculo (
	  [ID]					INT NOT NULL IDENTITY(1,1),
	  [Placa]				varchar(50) NOT NULL,
	  [IDModelo]			INT NOT NULL,
	  PRIMARY KEY CLUSTERED ([ID] ASC),
	  FOREIGN KEY ([IDModelo]) REFERENCES [dbo].[Modelo] ([ID])
);

CREATE TABLE EmpleadoXVehiculo (
	  [ID]					INT NOT NULL IDENTITY(1,1),
	  [IDEmpleado]			INT NOT NULL,
	  [IDVehiculo]			INT	NOT NULL,
	  [Fecha]				Date NOT NULL,
	  PRIMARY KEY CLUSTERED ([ID] ASC),
	  FOREIGN KEY ([IDEmpleado]) REFERENCES [dbo].[Empleado] ([ID]),
	  FOREIGN KEY ([IDVehiculo]) REFERENCES [dbo].[Vehiculo] ([ID])
);

CREATE TABLE Marca (
	  [ID]					INT NOT NULL IDENTITY(1,1),
	  [Nombre]				varchar(20) NOT NULL,
	  PRIMARY KEY CLUSTERED ([ID] ASC)
);

CREATE TABLE Provedor (
	  [ID]					INT NOT NULL IDENTITY(1,1),
	  [Nombre]				varchar(20) NOT NULL,
	  PRIMARY KEY CLUSTERED ([ID] ASC)
);

CREATE TABLE Producto (
	  [ID]					INT NOT NULL IDENTITY(1,1),
	  [IDMarca]				INT NOT NULL,
	  [IDProvedor]			INT NOT NULL,
	  [Nombre]				Varchar(50) NOT NULL,
	  [Descripcion]			Varchar(100) NOT NULL,
	  [Fotografias]		   	NVarchar(max) NOT NULL,
	  [Codigo]				INT NOT NULL,
	  [Precio]				Money NOT NULL,
	  PRIMARY KEY CLUSTERED ([ID] ASC),
	  FOREIGN KEY ([IDMarca]) REFERENCES [dbo].[Marca] ([ID]),
	  FOREIGN KEY ([IDProvedor]) REFERENCES [dbo].[Provedor] ([ID])
);

CREATE TABLE Inventario (
	  [ID]					INT NOT NULL IDENTITY(1,1),
	  [IDProducto]			INT NOT NULL,
	  [Cantidad]			INT NOT NULL,
	  PRIMARY KEY CLUSTERED ([ID] ASC),
	  FOREIGN KEY ([IDProducto]) REFERENCES [dbo].[Producto] ([ID])
);