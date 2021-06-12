CREATE TABLE Ferreteria (
	  [ID]					INT NOT NULL,
	  [Localizacion]		Geography NOT NULL,
	  [Foto]		   	  	IMAGE NOT NULL,
	  [Telefono]			varchar(20) NOT NULL,
	  PRIMARY KEY CLUSTERED ([ID] ASC)
);

CREATE TABLE Empleado (
	  [ID]					INT NOT NULL,
	  [IDFerreteria]		INT NOT NULL,
	  [Nombre]				Varchar(50) NOT NULL,
	  [Apellido]			Varchar(50) NOT NULL,
	  [Foto]		   	  	IMAGE NOT NULL,
	  [FechaIngreso]		Date NOT NULL,
	  [Activo]				Bit NOT NULL,
	  PRIMARY KEY CLUSTERED ([ID] ASC),
	  FOREIGN KEY ([IDFerreteria]) REFERENCES [dbo].[Ferreteria] ([ID])
);

CREATE TABLE Amonestacion (
	  [ID]					INT NOT NULL,
	  [IDEmpleado]			INT NOT NULL,
	  [Fecha]				Date NOT NULL,
	  [Monto]				Money NOT NULL,
	  PRIMARY KEY CLUSTERED ([ID] ASC),
	  FOREIGN KEY ([IDEmpleado]) REFERENCES [dbo].[Empleado] ([ID])
);

CREATE TABLE MarcaVehiculo (
	  [ID]					INT NOT NULL,
	  [Nombre]				varchar(20) NOT NULL,
	  PRIMARY KEY CLUSTERED ([ID] ASC)
);

CREATE TABLE Modelo (
	  [ID]					INT NOT NULL,
	  [Año]					Date NOT NULL,
	  [Descripcion]			varchar(50) NOT NULL,
	  [LitrosXKilometro]	Money NOT NULL,
	  [IDMarcaVehiculo]		INT NOT NULL,
	  PRIMARY KEY CLUSTERED ([ID] ASC),
	  FOREIGN KEY ([IDMarcaVehiculo]) REFERENCES [dbo].[MarcaVehiculo] ([ID])
);

CREATE TABLE Vehiculo (
	  [ID]					INT NOT NULL,
	  [Placa]				varchar(50) NOT NULL,
	  [IDModelo]			INT NOT NULL,
	  PRIMARY KEY CLUSTERED ([ID] ASC),
	  FOREIGN KEY ([IDModelo]) REFERENCES [dbo].[Modelo] ([ID])
);

CREATE TABLE EmpleadoXVehiculo (
	  [ID]					INT NOT NULL,
	  [IDEmpleado]			INT NOT NULL,
	  [IDVehiculo]			INT	NOT NULL,
	  [Fecha]				Date NOT NULL,
	  PRIMARY KEY CLUSTERED ([ID] ASC),
	  FOREIGN KEY ([IDEmpleado]) REFERENCES [dbo].[Empleado] ([ID]),
	  FOREIGN KEY ([IDVehiculo]) REFERENCES [dbo].[Vehiculo] ([ID])
);

CREATE TABLE Marca (
	  [ID]					INT NOT NULL,
	  [Nombre]				varchar(20) NOT NULL,
	  PRIMARY KEY CLUSTERED ([ID] ASC)
);

CREATE TABLE Provedor (
	  [ID]					INT NOT NULL,
	  [Nombre]				varchar(20) NOT NULL,
	  PRIMARY KEY CLUSTERED ([ID] ASC)
);

CREATE TABLE Producto (
	  [ID]					INT NOT NULL,
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
	  [ID]					INT NOT NULL,
	  [IDProducto]			INT NOT NULL,
	  [Cantidad]			INT NOT NULL,
	  PRIMARY KEY CLUSTERED ([ID] ASC),
	  FOREIGN KEY ([IDProducto]) REFERENCES [dbo].[Producto] ([ID])
);