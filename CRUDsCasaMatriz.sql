--CasaMatriz CRUDs-----------------------------------------------------------------------

USE [CasaMatriz];
GO

IF OBJECT_ID('[dbo].[sp_read_ferreteria]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_read_ferreteria] 
END 
GO
CREATE PROC [dbo].[sp_read_ferreteria] 
    @ID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID], [Localizacion], [Foto], [Telefono] 
	FROM   [dbo].[Ferreteria] 
	WHERE  [ID] = @ID

	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_create_ferreteria]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_create_ferreteria] 
END 
GO
CREATE PROC [dbo].[sp_create_ferreteria] 
    @ID int,
    @Localizacion geography,
	@Foto image,
    @Telefono varchar(20)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Ferreteria] ([ID], [Localizacion], [Foto], [Telefono])
	SELECT @ID, @Localizacion, @Foto, @Telefono
	
	
	SELECT [ID], [Localizacion], [Foto], [Telefono]
	FROM   [dbo].[Ferreteria]
	WHERE  [ID] = @ID
	
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_update_ferreteria]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_update_ferreteria] 
END 
GO
CREATE PROC [dbo].[sp_update_ferreteria] 
    @ID int,
    @Localizacion geography,
	@Foto image,
    @Telefono varchar(20)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Ferreteria]
	SET    [Localizacion] = @Localizacion, [Foto] = @Foto, [Telefono] = @Telefono
	WHERE  [ID] = @ID
	

	SELECT [ID], [Localizacion], [Foto], [Telefono]
	FROM   [dbo].[Ferreteria]
	WHERE  [ID] = @ID	


	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_delete_ferreteria]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_delete_ferreteria] 
END 
GO
CREATE PROC [dbo].[sp_delete_ferreteria] 
    @ID INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Ferreteria]
	WHERE  [ID] = @ID

	COMMIT
GO
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

USE [CasaMatriz];
GO

IF OBJECT_ID('[dbo].[sp_read_empleado]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_read_empleado] 
END 
GO
CREATE PROC [dbo].[sp_read_empleado] 
    @ID int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID], [IDFerreteria], [Nombre], [Apellido], [Foto], [FechaIngreso], [Activo]
	FROM   [dbo].[Empleado] 
	WHERE  ([ID] = @ID OR @ID IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_create_empleado]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_create_empleado] 
END 
GO
CREATE PROC [dbo].[sp_create_empleado] 
    @ID int,
	@IDFerreteria int,
    @Nombre varchar(50),
	@Apellido varchar(50),
	@Foto image,
    @FechaIngreso Date,
	@Activo Bit
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Empleado] ([ID], [IDFerreteria], [Nombre], [Apellido], [Foto], [FechaIngreso], [Activo])
	SELECT @ID, @IDFerreteria, @Nombre, @Apellido, @Foto, @FechaIngreso, @Activo
	
	
	SELECT [ID], [IDFerreteria], [Nombre], [Apellido], [Foto], [FechaIngreso], [Activo]
	FROM   [dbo].[Empleado] 
	WHERE  [ID] = @ID
	
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_update_empleado]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_update_empleado] 
END 
GO
CREATE PROC [dbo].[sp_update_empleado] 
    @ID int,
	@IDFerreteria int,
    @Nombre varchar(50),
	@Apellido varchar(50),
	@Foto image,
    @FechaIngreso Date,
	@Activo Bit
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Empleado]
	SET    [IDFerreteria] = @IDFerreteria, [Nombre] = @Nombre, [Apellido] = @Apellido, [Foto] = @Foto, [FechaIngreso] = @FechaIngreso, [Activo] = @Activo
	WHERE  [ID] = @ID
	

	SELECT [ID], [IDFerreteria], [Nombre], [Apellido], [Foto], [FechaIngreso], [Activo]
	FROM   [dbo].[Empleado] 
	WHERE  [ID] = @ID
		


	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_delete_empleado]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_delete_empleado] 
END 
GO
CREATE PROC [dbo].[sp_delete_empleado] 
    @ID INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Empleado]
	WHERE  [ID] = @ID

	COMMIT
GO
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

USE [CasaMatriz];
GO

IF OBJECT_ID('[dbo].[sp_read_amonestacion]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_read_amonestacion] 
END 
GO
CREATE PROC [dbo].[sp_read_amonestacion] 
    @ID INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID], [IDEmpleado], [Fecha], [Monto] 
	FROM   [dbo].[Amonestacion]
	WHERE  [ID] = @ID

	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_create_amonestacion]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_create_amonestacion] 
END 
GO
CREATE PROC [dbo].[sp_create_amonestacion] 
    @ID INT,
    @IDEmpleado INT,
    @Fecha DATE,
    @Monto Money
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Amonestacion] ([ID], [IDEmpleado], [Fecha], [Monto] )
	SELECT @ID, @IDEmpleado, @Fecha, @Monto
	
	
	SELECT [ID], [IDEmpleado], [Fecha], [Monto] 
	FROM   [dbo].[Amonestacion]
	WHERE  [ID] = @ID
	
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_update_amonestacion]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_update_amonestacion] 
END 
GO
CREATE PROC [dbo].[sp_update_amonestacion] 
    @ID INT,
    @IDEmpleado INT,
    @Fecha DATE,
    @Monto Money
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Amonestacion]
	SET    [IDEmpleado] = @IDEmpleado, [Fecha] = @Fecha, [Monto] = @Monto
	WHERE  [ID] = @ID
	
	
	SELECT [ID], [IDEmpleado], [Fecha], [Monto] 
	FROM   [dbo].[Amonestacion]
	WHERE  [ID] = @ID	
	

	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_delete_amonestacion]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_delete_amonestacion] 
END 
GO
CREATE PROC [dbo].[sp_delete_amonestacion] 
    @ID INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Amonestacion]
	WHERE  [ID] = @ID

	COMMIT
GO

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

USE [CasaMatriz];
GO

IF OBJECT_ID('[dbo].[sp_read_marcaVehiculo]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_read_marcaVehiculo] 
END 
GO
CREATE PROC [dbo].[sp_read_marcaVehiculo] 
    @ID INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID], [Nombre] 
	FROM   [dbo].[MarcaVehiculo]
	WHERE  [ID] = @ID

	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_create_marcaVehiculo]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_create_marcaVehiculo] 
END 
GO
CREATE PROC [dbo].[sp_create_marcaVehiculo] 
    @ID INT,
    @Nombre varchar(20)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[MarcaVehiculo] ([ID], [Nombre])
	SELECT @ID, @Nombre
	
	SELECT [ID], [Nombre] 
	FROM   [dbo].[MarcaVehiculo]
	WHERE  [ID] = @ID
	
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_update_marcaVehiculo]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_update_marcaVehiculo] 
END 
GO
CREATE PROC [dbo].[sp_update_marcaVehiculo] 
    @ID INT,
    @Nombre varchar(20)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[MarcaVehiculo]
	SET    [Nombre] = @Nombre
	WHERE  [ID] = @ID
	
	
    SELECT [ID], [Nombre] 
	FROM   [dbo].[MarcaVehiculo]
	WHERE  [ID] = @ID
	

	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_delete_marcaVehiculo]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_delete_marcaVehiculo] 
END 
GO
CREATE PROC [dbo].[sp_delete_marcaVehiculo] 
    @ID INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[MarcaVehiculo]
	WHERE  [ID] = @ID

	COMMIT
GO

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

USE [CasaMatriz];
GO

IF OBJECT_ID('[dbo].[sp_read_modelo]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_read_modelo] 
END 
GO
CREATE PROC [dbo].[sp_read_modelo] 
    @ID INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID], [Anio], [Descripcion], [LitrosXKilometro], [IDMarcaVehiculo] 
	FROM   [dbo].[Modelo]
	WHERE  [ID] = @ID

	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_create_modelo]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_create_modelo] 
END 
GO
CREATE PROC [dbo].[sp_create_modelo] 
    @ID INT,
    @Anio Date,
    @Descripcion varchar(50),
	@LitrosXKilometro Money,
    @IDMarcaVehiculo INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Modelo] ([ID], [Anio], [Descripcion], [LitrosXKilometro], [IDMarcaVehiculo] )
	SELECT @ID, @Anio, @Descripcion, @LitrosXKilometro, @IDMarcaVehiculo
	
	
	SELECT [ID], [Anio], [Descripcion], [LitrosXKilometro], [IDMarcaVehiculo] 
	FROM   [dbo].[Modelo]
	WHERE  [ID] = @ID
	
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_update_modelo]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_update_modelo] 
END 
GO
CREATE PROC [dbo].[sp_update_modelo] 
    @ID INT,
    @Anio Date,
    @Descripcion varchar(50),
	@LitrosXKilometro Money,
    @IDMarcaVehiculo INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Modelo]
	SET    [Anio] = @Anio, [Descripcion] = @Descripcion, [LitrosXKilometro] = @LitrosXKilometro, [IDMarcaVehiculo] = @IDMarcaVehiculo
	WHERE  [ID] = @ID
	
	
	SELECT [ID], [Anio], [Descripcion], [LitrosXKilometro], [IDMarcaVehiculo] 
	FROM   [dbo].[Modelo]
	WHERE  [ID] = @ID	
	

	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_delete_modelo]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_delete_modelo] 
END 
GO
CREATE PROC [dbo].[sp_delete_modelo] 
    @ID INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Modelo]
	WHERE  [ID] = @ID

	COMMIT
GO

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

USE [CasaMatriz];
GO

IF OBJECT_ID('[dbo].[sp_read_vehiculo]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_read_vehiculo] 
END 
GO
CREATE PROC [dbo].[sp_read_vehiculo] 
    @ID INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID], [Placa], [IDModelo]
	FROM   [dbo].[Vehiculo]
	WHERE  [ID] = @ID

	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_create_vehiculo]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_create_vehiculo] 
END 
GO
CREATE PROC [dbo].[sp_create_vehiculo] 
    @ID INT,
    @Placa varchar(50),
	@IDModelo INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Vehiculo] ([ID], [Placa], [IDModelo])
	SELECT @ID, @Placa, @IDModelo
	
	SELECT [ID], [Placa], [IDModelo]
	FROM   [dbo].[Vehiculo]
	WHERE  [ID] = @ID
	
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_update_vehiculo]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_update_vehiculo] 
END 
GO
CREATE PROC [dbo].[sp_update_vehiculo] 
    @ID INT,
    @Placa varchar(50),
	@IDModelo INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Vehiculo]
	SET    [Placa] = @Placa, [IDModelo] = @IDModelo
	WHERE  [ID] = @ID
	
	
    SELECT [ID], [Placa], [IDModelo]
	FROM   [dbo].[Vehiculo]
	WHERE  [ID] = @ID
	

	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_delete_vehiculo]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_delete_vehiculo] 
END 
GO
CREATE PROC [dbo].[sp_delete_vehiculo] 
    @ID INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Vehiculo]
	WHERE  [ID] = @ID

	COMMIT
GO

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

USE [CasaMatriz];
GO

IF OBJECT_ID('[dbo].[sp_read_empleadoXvehiculo]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_read_empleadoXvehiculo] 
END 
GO
CREATE PROC [dbo].[sp_read_empleadoXvehiculo] 
    @ID INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID], [IDEmpleado], [IDVehiculo], [Fecha]
	FROM   [dbo].[EmpleadoXVehiculo]
	WHERE  [ID] = @ID

	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_create_empleadoXvehiculo]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_create_empleadoXvehiculo] 
END 
GO
CREATE PROC [dbo].[sp_create_empleadoXvehiculo] 
    @ID INT,
    @IDEmpleado INT,
	@IDVehiculo INT,
	@Fecha Date
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[EmpleadoXVehiculo] ([ID], [IDEmpleado], [IDVehiculo], [Fecha])
	SELECT @ID, @IDEmpleado, @IDVehiculo, @Fecha
	
	SELECT [ID], [IDEmpleado], [IDVehiculo], [Fecha]
	FROM   [dbo].[EmpleadoXVehiculo]
	WHERE  [ID] = @ID
 
	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_update_empleadoXvehiculo]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_update_empleadoXvehiculo] 
END 
GO
CREATE PROC [dbo].[sp_update_empleadoXvehiculo] 
    @ID INT,
    @IDEmpleado INT,
	@IDVehiculo INT,
	@Fecha Date
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[EmpleadoXVehiculo]
	SET    [IDEmpleado] = @IDEmpleado, [IDVehiculo] = @IDVehiculo, [Fecha] = @Fecha
	WHERE  [ID] = @ID
	
	
    SELECT [ID], [IDEmpleado], [IDVehiculo], [Fecha]
	FROM   [dbo].[EmpleadoXVehiculo]
	WHERE  [ID] = @ID

	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_delete_empleadoXvehiculo]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_delete_empleadoXvehiculo] 
END 
GO
CREATE PROC [dbo].[sp_delete_empleadoXvehiculo] 
    @ID INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[EmpleadoXVehiculo]
	WHERE  [ID] = @ID

	COMMIT
GO

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

USE [CasaMatriz];
GO

IF OBJECT_ID('[dbo].[sp_read_marca]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_read_marca] 
END 
GO
CREATE PROC [dbo].[sp_read_marca] 
    @ID INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID], [Nombre] 
	FROM   [dbo].[Marca]
	WHERE  [ID] = @ID

	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_create_marca]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_create_marca] 
END 
GO
CREATE PROC [dbo].[sp_create_marca] 
    @ID INT,
    @Nombre varchar(20)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Marca] ([ID], [Nombre])
	SELECT @ID, @Nombre
	
	SELECT [ID], [Nombre] 
	FROM   [dbo].[Marca]
	WHERE  [ID] = @ID
	
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_update_marca]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_update_marca] 
END 
GO
CREATE PROC [dbo].[sp_update_marca] 
    @ID INT,
    @Nombre varchar(20)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Marca]
	SET    [Nombre] = @Nombre
	WHERE  [ID] = @ID
	
	
    SELECT [ID], [Nombre] 
	FROM   [dbo].[Marca]
	WHERE  [ID] = @ID
	

	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_delete_marca]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_delete_marca] 
END 
GO
CREATE PROC [dbo].[sp_delete_marca] 
    @ID INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Marca]
	WHERE  [ID] = @ID

	COMMIT
GO

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

USE [CasaMatriz];
GO

IF OBJECT_ID('[dbo].[sp_read_provedor]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_read_provedor] 
END 
GO
CREATE PROC [dbo].[sp_read_provedor] 
    @ID INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID], [Nombre] 
	FROM   [dbo].[Provedor]
	WHERE  [ID] = @ID

	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_create_provedor]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_create_provedor] 
END 
GO
CREATE PROC [dbo].[sp_create_provedor] 
    @ID INT,
    @Nombre varchar(20)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Provedor] ([ID], [Nombre])
	SELECT @ID, @Nombre
	
	SELECT [ID], [Nombre] 
	FROM   [dbo].[Provedor]
	WHERE  [ID] = @ID
	
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_update_provedor]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_update_provedor] 
END 
GO
CREATE PROC [dbo].[sp_update_provedor] 
    @ID INT,
    @Nombre varchar(20)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Provedor]
	SET    [Nombre] = @Nombre
	WHERE  [ID] = @ID
	
	
    SELECT [ID], [Nombre] 
	FROM   [dbo].[Provedor]
	WHERE  [ID] = @ID
	

	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_delete_provedor]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_delete_provedor] 
END 
GO
CREATE PROC [dbo].[sp_delete_provedor] 
    @ID INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Provedor]
	WHERE  [ID] = @ID

	COMMIT
GO

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

USE [CasaMatriz];
GO

IF OBJECT_ID('[dbo].[sp_read_producto]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_read_producto] 
END 
GO
CREATE PROC [dbo].[sp_read_producto] 
    @ID INT 
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID], [IDMarca], [IDProvedor], [Nombre], [Descripcion], [Fotografias], [Codigo], [Precio] 
	FROM   [dbo].[Producto] 
	WHERE  [ID] = @ID 

	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_create_producto]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_create_producto] 
END 
GO
CREATE PROC [dbo].[sp_create_producto] 
    @ID INT,
    @IDMarca INT,
    @IDProvedor	INT,
    @Nombre varchar(50),
    @Descripcion varchar(100),
    @Fotografias NVarchar(max),
    @Codigo INT,
    @Precio Money
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Producto] ([ID], [IDMarca], [IDProvedor], [Nombre], [Descripcion], [Fotografias], [Codigo], [Precio])
	SELECT @ID, @IDMarca, @IDProvedor, @Nombre, @Descripcion, @Fotografias, @Codigo, @Precio
	
	
	SELECT [ID], [IDMarca], [IDProvedor], [Nombre], [Descripcion], [Fotografias], [Codigo], [Precio] 
	FROM   [dbo].[Producto] 
	WHERE  [ID] = @ID 
	
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_update_producto]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_update_producto] 
END 
GO
CREATE PROC [dbo].[sp_update_producto] 
    @ID INT,
    @IDMarca INT,
    @IDProvedor	INT,
    @Nombre varchar(50),
    @Descripcion varchar(100),
    @Fotografias NVarchar(max),
    @Codigo INT,
    @Precio Money
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Product]
	SET    [IDMarca] = @IDMarca, [IDProvedor] = @IDProvedor, [Nombre] = @Nombre, [Descripcion] = @Descripcion, [Fotografias] = @Fotografias, [Codigo] = @Codigo, [Precio] = @Precio
	WHERE  [ID] = @ID
	
	
	SELECT [ID], [IDMarca], [IDProvedor], [Nombre], [Descripcion], [Fotografias], [Codigo], [Precio] 
	FROM   [dbo].[Producto] 
	WHERE  [ID] = @ID
	

	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_delete_producto]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_delete_producto] 
END 
GO
CREATE PROC [dbo].[sp_delete_producto] 
    @ID INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Producto]
	WHERE  [ID] = @ID

	COMMIT
GO

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

USE [CasaMatriz];
GO

IF OBJECT_ID('[dbo].[sp_read_inventario]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_read_inventario] 
END 
GO
CREATE PROC [dbo].[sp_read_inventario] 
    @ID INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ID], [IDProducto], [Cantidad]
	FROM   [dbo].[Inventario]
	WHERE  [ID] = @ID

	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_create_inventario]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_create_inventario] 
END 
GO
CREATE PROC [dbo].[sp_create_inventario] 
    @ID INT,
    @IDProducto INT,
	@Cantidad INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Inventario] ([ID], [IDProducto], [Cantidad])
	SELECT @ID, @IDProducto, @Cantidad
	
	SELECT [ID], [IDProducto], [Cantidad]
	FROM   [dbo].[Inventario]
	WHERE  [ID] = @ID
	
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_update_inventario]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_update_inventario] 
END 
GO
CREATE PROC [dbo].[sp_update_inventario] 
    @ID INT,
    @IDProducto INT,
	@Cantidad INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Inventario]
	SET    [IDProducto] = @IDProducto, Cantidad = @Cantidad
	WHERE  [ID] = @ID
	
	
    SELECT [ID], [IDProducto], [Cantidad]
	FROM   [dbo].[Inventario]
	WHERE  [ID] = @ID
	

	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_delete_inventario]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_delete_inventario] 
END 
GO
CREATE PROC [dbo].[sp_delete_inventario] 
    @ID INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Inventario]
	WHERE  [ID] = @ID

	COMMIT
GO