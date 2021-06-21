USE [CasaMatriz]
GO

/****** Object:  StoredProcedure [dbo].[sp_update_producto]    Script Date: 6/21/2021 3:27:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROC [dbo].[sp_update_producto] 
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


