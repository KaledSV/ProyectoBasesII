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
    @Localizacion geography,
	@Foto image,
    @Telefono varchar(20)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Ferreteria] ([Localizacion], [Foto], [Telefono])
	SELECT @Localizacion, @Foto, @Telefono
	               
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
	SET    [Localizacion] = isNull(@Localizacion, [Localizacion]), [Foto] = isNull(@Foto, [Foto]), [Telefono] = isNull(@Telefono, [Telefono])
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
	@IDFerreteria int,
    @Nombre varchar(50),
	@Apellido varchar(50),
	@Foto image,
    @FechaIngreso Date,
	@Activo Bit,
	@NumVacaciones int,
	@IDTipoEmpleado int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Empleado] ([IDFerreteria], [Nombre], [Apellido], [Foto], [FechaIngreso], [Activo], [NumVacaciones], [IDTipoEmpleado])
	SELECT @IDFerreteria, @Nombre, @Apellido, @Foto, @FechaIngreso, @Activo, @NumVacaciones, @IDTipoEmpleado
	
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_update_empleado]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_update_empleado] 
END 
GO
CREATE PROC [dbo].[sp_update_empleado] 
    @ID int,
	@IDFerreteria as int = null,
    @Nombre as varchar(50) = null,
	@Apellido as varchar(50) = null,
	@Foto as image = null,
    @FechaIngreso as Date = null,
	@Activo Bit,
	@NumVacaciones as int = null,
	@IDTipoEmpleado int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Empleado]
	SET    [IDFerreteria] = ISNULL(@IDFerreteria,(SELECT IDFerreteria FROM Empleado WHERE ID = @ID)), 
		   [Nombre] = ISNULL(@Nombre,(SELECT Nombre FROM Empleado WHERE ID = @ID)), 
		   [Apellido] = ISNULL(@Apellido,(SELECT Apellido FROM Empleado WHERE ID = @ID)), 
		   [Foto] = ISNULL(@Foto,(SELECT Foto FROM Empleado WHERE ID = @ID)), 
		   [FechaIngreso] = ISNULL(@FechaIngreso,(SELECT FechaIngreso FROM Empleado WHERE ID = @ID)), 
		   [Activo] = @Activo,
		   [NumVacaciones] = ISNULL(@NumVacaciones,(SELECT NumVacaciones FROM Empleado WHERE ID = @ID)), 
		   [IDTipoEmpleado] = ISNULL(@IDTipoEmpleado, (SELECT IDTipoEmpleado FROM Empleado WHERE ID = @ID))
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
    @IDEmpleado INT,
    @Fecha DATE,
    @Monto Money
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Amonestacion] ([IDEmpleado], [Fecha], [Monto] )
	SELECT @IDEmpleado, @Fecha, @Monto
	
               
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
    @Nombre varchar(20)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[MarcaVehiculo] ([Nombre])
	SELECT @Nombre
	
               
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
    @Anio Date,
    @Descripcion varchar(50),
	@LitrosXKilometro Money,
    @IDMarcaVehiculo INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Modelo] ([Anio], [Descripcion], [LitrosXKilometro], [IDMarcaVehiculo] )
	SELECT @Anio, @Descripcion, @LitrosXKilometro, @IDMarcaVehiculo
	
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_update_modelo]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_update_modelo] 
END 
GO
CREATE PROC [dbo].[sp_update_modelo] 
    @ID INT,
    @Anio as Date = null,
    @Descripcion as varchar(50) = null,
	@LitrosXKilometro as Money = null,
    @IDMarcaVehiculo INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Modelo]
	SET    [Anio] = ISNULL(@Anio,(SELECT Anio FROM Modelo WHERE ID = @ID)), [Descripcion] = ISNULL(@Descripcion,(SELECT Descripcion FROM Modelo WHERE ID = @ID)), [LitrosXKilometro] = ISNULL(@LitrosXKilometro,(SELECT LitrosXKilometro FROM Modelo WHERE ID = @ID)), [IDMarcaVehiculo] = @IDMarcaVehiculo
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
    @Placa varchar(50),
	@IDModelo INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Vehiculo] ([Placa], [IDModelo])
	SELECT @Placa, @IDModelo
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_update_vehiculo]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_update_vehiculo] 
END 
GO
CREATE PROC [dbo].[sp_update_vehiculo] 
    @ID INT,
    @Placa as varchar(50) = null,
	@IDModelo INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Vehiculo]
	SET    [Placa] = ISNULL(@Placa,(SELECT Placa FROM Vehiculo WHERE ID = @ID)), [IDModelo] = @IDModelo
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
    @IDEmpleado INT,
	@IDVehiculo INT,
	@Fecha Date
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[EmpleadoXVehiculo] ([IDEmpleado], [IDVehiculo], [Fecha])
	SELECT @IDEmpleado, @IDVehiculo, @Fecha
	
 
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
    @Nombre varchar(20)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Marca] ( [Nombre])
	SELECT @Nombre
	
               
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
    @Nombre varchar(20)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Provedor] ([Nombre])
	SELECT @Nombre
	
               
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
	
	INSERT INTO [dbo].[Producto] ([IDMarca], [IDProvedor], [Nombre], [Descripcion], [Fotografias], [Codigo], [Precio])
	SELECT @IDMarca, @IDProvedor, @Nombre, @Descripcion, @Fotografias, @Codigo, @Precio
	
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_update_producto]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_update_producto] 
END 
GO
CREATE PROC [dbo].[sp_update_producto] 
    @ID INT,
    @IDMarca AS INT = -1,
    @IDProvedor	AS INT = -1,
    @Nombre AS varchar(50) = '',
    @Descripcion AS varchar(100) = '',
    @Fotografias AS NVarchar(max) = '',
    @Codigo AS INT = -1,
    @Precio AS Money = -1
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	IF (@IDMarca = -1)
		SET @IDMarca = (SELECT IDMarca FROM Producto WHERE ID = @ID);
	IF (@IDProvedor = -1)
		SET @IDProvedor= (SELECT IDProvedor FROM Producto WHERE ID = @ID);
	IF (@Nombre = '')
		SET @Nombre= (SELECT Nombre FROM Producto WHERE ID = @ID);
	IF (@Descripcion= '')
		SET @Descripcion = (SELECT Descripcion FROM Producto WHERE ID = @ID);
	IF (@Fotografias = '')
		SET @Fotografias = (SELECT Fotografias FROM Producto WHERE ID = @ID);
	IF (@Codigo = -1)
		SET @Codigo= (SELECT Codigo FROM Producto WHERE ID = @ID);
	IF (@Precio = -1)
		SET @Precio= (SELECT Precio FROM Producto WHERE ID = @ID);

	UPDATE Producto
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
    @IDProducto INT,
	@Cantidad INT
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Inventario] ([IDProducto], [Cantidad])
	SELECT @IDProducto, @Cantidad
	  
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
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

USE [CasaMatriz];
GO

IF OBJECT_ID('[dbo].[sp_create_tipoempleado] IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_create_tipoempleado] 
END 
GO
CREATE PROC [dbo].[sp_create_tipoempleado] 
    @nombre varchar(30),
	@descripcion varchar(30)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	INSERT INTO [dbo].[TipoEmpleado] ([nombre],[descripcion])
	SELECT @nombre, @descripcion
		


	COMMIT
GO

IF OBJECT_ID('[dbo].[sp_update_tipoempleado] IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_update_tipoempleado] 
END 
GO
CREATE PROC [dbo].[sp_update_tipoempleado] 
	@ID int,
    @nombre as varchar(30) = null,
	@descripcion as varchar(30) = null
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[TipoEmpleado]
	SET    [nombre] = ISNULL(@nombre,(SELECT nombre FROM TipoEmpleado WHERE ID = @ID)), 
		   [descripcion] = ISNULL(@descripcion,(SELECT descripcion FROM TipoEmpleado WHERE ID = @ID))
	WHERE  [ID] = @ID
	
		


	COMMIT
GO