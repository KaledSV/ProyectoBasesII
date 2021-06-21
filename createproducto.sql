USE [CasaMatriz]
GO

/****** Object:  StoredProcedure [dbo].[sp_create_producto]    Script Date: 6/21/2021 3:26:52 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[sp_create_producto] 
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
	DECLARE @ID INT;
	SET @ID = (SELECT MAX([ID]) + 1 FROM [dbo].[Producto]);
	INSERT INTO [dbo].[Producto] ([ID], [IDMarca], [IDProvedor], [Nombre], [Descripcion], [Fotografias], [Codigo], [Precio])
	SELECT @ID, @IDMarca, @IDProvedor, @Nombre, @Descripcion, @Fotografias, @Codigo, @Precio
	
	
	SELECT [ID], [IDMarca], [IDProvedor], [Nombre], [Descripcion], [Fotografias], [Codigo], [Precio] 
	FROM   [dbo].[Producto] 
	WHERE  [ID] = @ID 
	
               
	COMMIT

GO


