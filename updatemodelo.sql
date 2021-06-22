USE [CasaMatriz]
GO

/****** Object:  StoredProcedure [dbo].[sp_update_modelo]    Script Date: 6/22/2021 11:30:21 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[sp_update_modelo] 
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


