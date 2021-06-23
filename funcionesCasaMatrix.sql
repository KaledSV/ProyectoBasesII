IF OBJECT_ID('[dbo].[sp_create_inventario]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_create_inventario] 
END 
GO
CREATE PROC [dbo].[sp_create_inventario] 
    @IdProducto int,
	@IdEstante int,
	@Cantidad int,
	@Ferreteria int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	if (select count(*) from producto where id = @IdProducto) = 0
		begin
			return
		end
	BEGIN TRAN
	if (@Ferreteria = 1)
		begin
			EXEC ('Call agregarInventario(?, ?, ?)', @IdProducto, @Cantidad, @IdEstante) AT FGAM
		end
	if (@Ferreteria = 2)
		begin
			EXEC ('Call agregarInventario(?, ?, ?)', @IdProducto, @Cantidad, @IdEstante) AT FNORTE
		end
	if (@Ferreteria = 3)
		begin
			EXEC ('Call agregarInventario(?, ?, ?)', @IdProducto, @Cantidad, @IdEstante) AT FSUR
		end        
	COMMIT
GO

IF OBJECT_ID('[dbo].[sp_update_inventario]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_update_inventario] 
END 
GO
CREATE PROC [dbo].[sp_update_inventario] 
	@ID int,
    @IdProducto int,
	@IdEstante int,
	@Cantidad int,
	@Ferreteria int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	if (@Ferreteria = 1)
		begin
			IF (@Cantidad = -1)
					SET @Cantidad = (SELECT cantidad FROM FGAM...Inventario WHERE id = @ID);
			EXEC ('Call modificarInventario(?, ?, ?, ?)', @ID, @IdProducto, @IdEstante,  @Cantidad) AT FGAM
		end
	if (@Ferreteria = 2)
		begin
			IF (@Cantidad = -1)
					SET @Cantidad = (SELECT cantidad FROM FNorte...Inventario WHERE id = @ID);
			EXEC ('Call modificarInventario(?, ?, ?, ?)', @ID, @IdProducto, @IdEstante,  @Cantidad) AT FNORTE
		end
	if (@Ferreteria = 3)
		begin
			IF (@Cantidad = -1)
					SET @Cantidad = (SELECT cantidad FROM FSur...Inventario WHERE id = @ID);
			EXEC ('Call modificarInventario(?, ?, ?, ?)', @ID, @IdProducto, @IdEstante,  @Cantidad) AT FSUR
		end        
	COMMIT
GO

IF OBJECT_ID('[dbo].[sp_create_departamento]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_create_departamento] 
END 
GO
CREATE PROC [dbo].[sp_create_departamento] 
    @IdFerreteria int,
	@Nombre varchar(45),
	@Ferreteria int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON
	BEGIN TRANSACTION
	if (@Ferreteria = 1)
		begin
			EXEC ('Call `agregarDepartamento`(?, ?)', @Nombre, @IdFerreteria) AT FGAM
		end
	if (@Ferreteria = 2)
		begin
			EXEC ('Call `agregarDepartamento`(?, ?)', @Nombre, @IdFerreteria) AT FNORTE
		end
	if (@Ferreteria = 3)
		begin
			EXEC ('Call `agregarDepartamento`(?, ?)', @Nombre, @IdFerreteria) AT FSUR
		end        
	COMMIT
GO

IF OBJECT_ID('[dbo].[sp_update_departamento]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_update_departamento] 
END 
GO
CREATE PROC [dbo].[sp_update_departamento] 
	@ID int,
    @IdFerreteria int,
	@Nombre varchar(45),
	@Ferreteria int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	if (@Ferreteria = 1)
		begin
			IF (@Nombre = null)
					SET @Nombre = (SELECT nombre FROM FGAM...Departamento WHERE id = @ID);
			EXEC ('Call modificarDepartamento(?, ?, ?)', @ID, @Nombre, @IdFerreteria) AT FGAM
		end
	if (@Ferreteria = 2)
		begin
			IF (@Nombre = null)
					SET @Nombre = (SELECT nombre FROM FNORTE...Departamento WHERE id = @ID);
			EXEC ('Call modificarDepartamento(?, ?, ?)', @ID, @Nombre, @IdFerreteria) AT FNORTE
		end
	if (@Ferreteria = 3)
		begin
			IF (@Nombre = null)
					SET @Nombre = (SELECT nombre FROM FSUR...Departamento WHERE id = @ID);
			EXEC ('Call modificarDepartamento(?, ?, ?)', @ID, @Nombre, @IdFerreteria) AT FSUR
		end        
	COMMIT
GO

IF OBJECT_ID('[dbo].[sp_create_pasillo]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_create_pasillo] 
END 
GO
CREATE PROC [dbo].[sp_create_pasillo] 
    @IdDepartamento int,
	@Ferreteria int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	BEGIN TRAN
	if (@Ferreteria = 1)
		begin
			EXEC ('Call `agregarPasillo`(?)', @IdDepartamento) AT FGAM
		end
	if (@Ferreteria = 2)
		begin
			EXEC ('Call `agregarPasillo`(?)', @IdDepartamento) AT FNORTE
		end
	if (@Ferreteria = 3)
		begin
			EXEC ('Call `agregarPasillo`(?)', @IdDepartamento) AT FSUR
		end        
	COMMIT
GO

IF OBJECT_ID('[dbo].[sp_update_pasillo]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_update_pasillo] 
END 
GO
CREATE PROC [dbo].[sp_update_pasillo] 
	@ID int,
    @IdDepartamento int,
	@Ferreteria int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	if (@Ferreteria = 1)
		begin
			EXEC ('Call modificarPasillo(?, ?)', @ID, @IdDepartamento) AT FGAM
		end
	if (@Ferreteria = 2)
		begin
			EXEC ('Call modificarPasillo(?, ?)', @ID, @IdDepartamento) AT FNORTE
		end
	if (@Ferreteria = 3)
		begin
			EXEC ('Call modificarPasillo(?, ?)', @ID, @IdDepartamento) AT FSUR
		end        
	COMMIT
GO

IF OBJECT_ID('[dbo].[sp_create_estante]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_create_estante] 
END 
GO
CREATE PROC [dbo].[sp_create_estante] 
    @IdPasillo int,
	@Ferreteria int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	BEGIN TRAN
	if (@Ferreteria = 1)
		begin
			EXEC ('Call `agregarEstante`(?)', @IdPasillo) AT FGAM
		end
	if (@Ferreteria = 2)
		begin
			EXEC ('Call `agregarEstante`(?)', @IdPasillo) AT FNORTE
		end
	if (@Ferreteria = 3)
		begin
			EXEC ('Call `agregarEstante`(?)', @IdPasillo) AT FSUR
		end        
	COMMIT
GO

IF OBJECT_ID('[dbo].[sp_update_estante]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_update_estante] 
END 
GO
CREATE PROC [dbo].[sp_update_estante] 
	@ID int,
    @IdPasillo int,
	@Ferreteria int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	if (@Ferreteria = 1)
		begin
			EXEC ('Call modificarEstante(?, ?)', @ID, @IdPasillo) AT FGAM
		end
	if (@Ferreteria = 2)
		begin
			EXEC ('Call modificarEstante(?, ?)', @ID, @IdPasillo) AT FNORTE
		end
	if (@Ferreteria = 3)
		begin
			EXEC ('Call modificarEstante(?, ?)', @ID, @IdPasillo) AT FSUR
		end        
	COMMIT
GO

IF OBJECT_ID('[dbo].[sp_create_cliente]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_create_cliente] 
END 
GO
CREATE PROC [dbo].[sp_create_cliente] 
	@Nombre varchar(45),
	@Apellido varchar(45),
	@Tarjeta varchar(45),
	@Usuario varchar(45),
	@Pass varchar(45),
	@Ferreteria int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	BEGIN TRAN
	if ((select count(*) from FGAM...cliente where usuario = @Usuario) > 0) 
		or ((select count(*) from FNORTE...cliente where usuario = @Usuario) > 0)
		or (select count(*) from FSUR...cliente where usuario = @Usuario) > 0
		begin
			Select 'El usuario ya ha sido tomado'
			commit
			return
		end
	if (@Ferreteria = 1)
		begin
			EXEC ('Call agregarCliente(?, ?, ?, ?, ?)', @Nombre, @Apellido, @Tarjeta, @Usuario, @Pass) AT FGAM
			Select 'El usuario se ha registrado'		
		end
	if (@Ferreteria = 2)
		begin
			EXEC ('Call agregarCliente(?, ?, ?, ?, ?)', @Nombre, @Apellido, @Tarjeta, @Usuario, @Pass) AT FNORTE
			Select 'El usuario se ha registrado'
		end
	if (@Ferreteria = 3)
		begin
			EXEC ('Call agregarCliente(?, ?, ?, ?, ?)', @Nombre, @Apellido, @Tarjeta, @Usuario, @Pass) AT FSUR
			Select 'El usuario se ha registrado'
		end        
	COMMIT
GO

IF OBJECT_ID('[dbo].[sp_update_cliente]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_update_cliente] 
END 
GO
CREATE PROC [dbo].[sp_update_cliente]
	@ID int,
	@Nombre varchar(45),
	@Apellido varchar(45),
	@Tarjeta varchar(45),
	@Usuario varchar(45),
	@Pass varchar(45),
	@Ferreteria int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	BEGIN TRAN
	if @Usuario is not null
		begin
			if ((select count(*) from FGAM...cliente where usuario = @Usuario) > 0) 
				or ((select count(*) from FNORTE...cliente where usuario = @Usuario) > 0)
				or (select count(*) from FSUR...cliente where usuario = @Usuario) > 0
			begin
				Select 'El usuario ya ha sido tomado'
				commit
				return
			end
		end
	if (@Ferreteria = 1)
		begin
			IF (@Nombre = null)
					SET @Nombre = (SELECT nombre FROM FGAM...Cliente WHERE id = @ID);
			IF (@Apellido = null)
					SET @Apellido = (SELECT apellido FROM FGAM...Cliente WHERE id = @ID);
			IF (@Tarjeta = null)
					SET @Tarjeta = (SELECT tarjeta FROM FGAM...Cliente WHERE id = @ID);
			IF (@Usuario = null)
					SET @Usuario = (SELECT usuario FROM FGAM...Cliente WHERE id = @ID);
			IF (@Pass = null)
					SET @Pass = (SELECT pass FROM FGAM...Cliente WHERE id = @ID);
			EXEC ('Call modificarCliente(?, ?, ?, ?, ?, ?)',@ID, @Nombre, @Apellido, @Tarjeta, @Usuario, @Pass) AT FGAM
			Select 'El usuario se ha modificado'		
		end
	if (@Ferreteria = 2)
		begin
			IF (@Nombre = null)
					SET @Nombre = (SELECT nombre FROM FNORTE...Cliente WHERE id = @ID);
			IF (@Apellido = null)
					SET @Apellido = (SELECT apellido FROM FNORTE...Cliente WHERE id = @ID);
			IF (@Tarjeta = null)
					SET @Tarjeta = (SELECT tarjeta FROM FNORTE...Cliente WHERE id = @ID);
			IF (@Usuario = null)
					SET @Usuario = (SELECT usuario FROM FNORTE...Cliente WHERE id = @ID);
			IF (@Pass = null)
					SET @Pass = (SELECT pass FROM FNORTE...Cliente WHERE id = @ID);
			EXEC ('Call modificarCliente(?, ?, ?, ?, ?, ?)',@ID, @Nombre, @Apellido, @Tarjeta, @Usuario, @Pass) AT FNORTE
			Select 'El usuario se ha modificado'	
		end
	if (@Ferreteria = 3)
		begin
			IF (@Nombre = null)
					SET @Nombre = (SELECT nombre FROM FSUR...Cliente WHERE id = @ID);
			IF (@Apellido = null)
					SET @Apellido = (SELECT apellido FROM FSUR...Cliente WHERE id = @ID);
			IF (@Tarjeta = null)
					SET @Tarjeta = (SELECT tarjeta FROM FSUR...Cliente WHERE id = @ID);
			IF (@Usuario = null)
					SET @Usuario = (SELECT usuario FROM FSUR...Cliente WHERE id = @ID);
			IF (@Pass = null)
					SET @Pass = (SELECT pass FROM FSUR...Cliente WHERE id = @ID);
			EXEC ('Call modificarCliente(?, ?, ?, ?, ?, ?)',@ID, @Nombre, @Apellido, @Tarjeta, @Usuario, @Pass) AT FSUR
			Select 'El usuario se ha modificado'	
		end        
	COMMIT
GO

IF OBJECT_ID('[dbo].[sp_create_direccion]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_create_direccion] 
END 
GO
CREATE PROC [dbo].[sp_create_direccion] 
	@IDCliente int,
	@Descripcion varchar(100),
	@Localizacion nvarchar,
	@Ferreteria int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	BEGIN TRAN
	if (@Ferreteria = 1)
		begin
			EXEC ('Call agregarCliente(?, ?, geometry::STGeomFromText(?, 0))', @IDCliente, @Descripcion, @Localizacion) AT FGAM
		end
	if (@Ferreteria = 2)
		begin
			EXEC ('Call agregarCliente(?, ?, geometry::STGeomFromText(?, 0))', @IDCliente, @Descripcion, @Localizacion) AT FNORTE
		end
	if (@Ferreteria = 3)
		begin
			EXEC ('Call agregarCliente(?, ?, geometry::STGeomFromText(?, 0))', @IDCliente, @Descripcion, @Localizacion) AT FSUR
		end        
	COMMIT
GO

IF OBJECT_ID('[dbo].[sp_update_direccion]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_update_direccion] 
END 
GO
CREATE PROC [dbo].[sp_update_direccion] 
	@ID int,
	@IDCliente int,
	@Descripcion varchar(100),
	@Localizacion nvarchar,
	@Ferreteria int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	BEGIN TRAN
	if (@Ferreteria = 1)
		begin
			IF (@Descripcion = null)
					SET @Descripcion = (SELECT descripcion FROM FGAM...Direccion WHERE id = @ID);
			IF (@Localizacion = null)
					SET @Localizacion = (SELECT cast(localizacion as varbinary(max)) FROM FGAM...Direccion WHERE id = @ID);
			EXEC ('Call modificarDireccion(?, ?, ?, geometry::STGeomFromText(?, 0))',@ID, @IDCliente, @Descripcion, @Localizacion) AT FGAM
		end
	if (@Ferreteria = 2)
		begin
			IF (@Descripcion = null)
					SET @Descripcion = (SELECT descripcion FROM FGAM...Direccion WHERE id = @ID);
			IF (@Localizacion = null)
					SET @Localizacion = (SELECT cast(localizacion as varbinary(max)) FROM FGAM...Direccion WHERE id = @ID);
			EXEC ('Call modificarDireccion(?, ?, ?, geometry::STGeomFromText(?, 0))',@ID, @IDCliente, @Descripcion, @Localizacion) AT FNORTE
		end
	if (@Ferreteria = 3)
		begin
			IF (@Descripcion = null)
					SET @Descripcion = (SELECT descripcion FROM FGAM...Direccion WHERE id = @ID);
			IF (@Localizacion = null)
					SET @Localizacion = (SELECT cast(localizacion as varbinary(max)) FROM FGAM...Direccion WHERE id = @ID);
			EXEC ('Call modificarDireccion(?, ?, ?, geometry::STGeomFromText(?, 0))',@ID, @IDCliente, @Descripcion, @Localizacion) AT FSUR
		end        
	COMMIT
GO
















IF OBJECT_ID('[dbo].[buscarUsuario]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[buscarUsuario]
END 
GO
Create PROC [dbo].[buscarUsuario] 
	@User varchar(45),
	@Pass varchar(45)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
BEGIN
	IF (select count(*) from dbo.Administradores where usuario = @User) >= 1
		begin
			IF (select count(*) from dbo.Administradores where usuario = @User and pass=@Pass)>=1
			begin 
				select 'Correcto', (select id from dbo.Administradores where usuario = @User and pass=@Pass), -1, 1;
				return;
			end
			else
			begin
				select 'password incorrecta';
				return;
			end
		end

	IF (select count(*) from FGAM...Cliente where usuario = @User) >= 1
		begin
			IF (select count(*) from FGAM...Cliente where usuario = @User and pass=@Pass)>=1
			begin 
				select 'Correcto', (select id from FGAM...Cliente where usuario = @User and pass=@Pass), 1, 0;
				return;
			end
			else
			begin
				select 'password incorrecta';
				return;
			end
		end
	IF (select count(*) from FNorte...Cliente where usuario = @User) >= 1
		begin
			IF (select count(*) from FNorte...Cliente where usuario = @User and pass=@Pass)>=1
			begin 
				select 'Correcto', (select id from FNorte...Cliente where usuario = @User and pass=@Pass), 2, 0;
				return;
			end
			else
			begin
				select 'password incorrecta';
				return;
			end
		end
	IF (select count(*) from FSur...Cliente where usuario = @User) >= 1
		begin
			IF (select count(*) from FSur...Cliente where usuario = @User and pass=@Pass)>=1
			begin 
				select 'Correcto', (select id from FSur...Cliente where usuario = @User and pass=@Pass), 3, 0;
				return;
			end
			else
			begin
				select 'password incorrecta';
				return;
			end
		end
	select 'Usuario no encontrado'
	return
end
GO

IF OBJECT_ID('[dbo].[buscarPalabra]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[buscarPalabra]
END 
GO
CREATE PROCEDURE [dbo].[buscarPalabra]
	@descripcion VARCHAR(100)
AS
BEGIN
SET NOCOUNT ON
	BEGIN TRY
		SELECT [ID],[IDMarca],[IDProvedor],[Nombre],[Descripcion],[Fotografias],[Codigo],[Precio]
		FROM [dbo].[Producto]
		WHERE ([Nombre] LIKE '%'+ @descripcion +'%')
			OR ([Descripcion] LIKE '%'+ @descripcion +'%')
	END TRY

	BEGIN CATCH
		SELECT -1
	END CATCH
SET NOCOUNT OFF
END
GO

IF OBJECT_ID('[dbo].[filtarProvedor]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[filtarProvedor]
END 
GO
CREATE PROCEDURE [dbo].[filtarProvedor]
	@provedor INT
AS
BEGIN
SET NOCOUNT ON
	BEGIN TRY
		SELECT [ID],[IDMarca],[IDProvedor],[Nombre],[Descripcion],[Fotografias],[Codigo],[Precio]
		FROM [dbo].[Producto]
		WHERE ([IDProvedor] = @provedor)
	END TRY

	BEGIN CATCH
		SELECT -1
	END CATCH
SET NOCOUNT OFF
END
GO

IF OBJECT_ID('[dbo].[filtarMarca]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[filtarMarca]
END 
GO
CREATE PROCEDURE [dbo].[filtarMarca]
	@marca INT
AS
BEGIN
SET NOCOUNT ON
	BEGIN TRY
		SELECT [ID],[IDMarca],[IDProvedor],[Nombre],[Descripcion],[Fotografias],[Codigo],[Precio]
		FROM [dbo].[Producto]
		WHERE ([IDMarca] = @marca)
	END TRY

	BEGIN CATCH
		SELECT -1
	END CATCH
SET NOCOUNT OFF
END
GO

IF OBJECT_ID('[dbo].[venta]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[venta]
END 
GO
CREATE PROCEDURE [dbo].[venta]
	@fereteria INT,
	@IdCliente INT
AS
BEGIN
SET NOCOUNT ON
	BEGIN
		DECLARE @fecha DATE
		SET @fecha = GETDATE()
		IF @fereteria = 1
			BEGIN
				EXEC ('call agregarVenta(?, ?, ?)', @IdCliente, -1, @fecha) AT FGAM
				SELECT id
				FROM OPENQUERY([FGAM],'SELECT LAST_INSERT_ID() as id;');
			END
		IF @fereteria = 2
			BEGIN
				EXEC ('call agregarVenta(?, ?, ?)', @IdCliente, -1, @fecha) AT FNORTE
				SELECT id
				FROM OPENQUERY([FNORTE],'SELECT LAST_INSERT_ID() as id;');
			END
		IF @fereteria = 3
			BEGIN
				EXEC ('call agregarVenta(?, ?, ?)', @IdCliente, -1, @fecha)  AT FSUR
				SELECT id
				FROM OPENQUERY([FSUR],'SELECT LAST_INSERT_ID() as id;');
			END
	END
SET NOCOUNT OFF
END
GO

IF OBJECT_ID('[dbo].[ventaProducto]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[ventaProducto]
END 
GO
CREATE PROCEDURE [dbo].[ventaProducto]
	@fereteria INT,
	@IdVenta INT,
	@IdProducto INT,
	@Cantidad INT

AS
BEGIN
SET NOCOUNT ON
	BEGIN TRY
		IF @fereteria = 1
			BEGIN
				EXEC ('Call agregarVentaProducto(?, ?, ?)', @IdVenta, @IdProducto, @Cantidad) AT FGAM
			END
		IF @fereteria = 2
			BEGIN
				EXEC ('Call agregarVentaProducto(?, ?, ?)', @IdVenta, @IdProducto, @Cantidad) AT FNORTE
			END
		IF @fereteria = 3
			BEGIN
				EXEC ('Call agregarVentaProducto(?, ?, ?)', @IdVenta, @IdProducto, @Cantidad) AT FSUR
			END
	END TRY

	BEGIN CATCH
		SELECT -1
	END CATCH
SET NOCOUNT OFF
END
GO