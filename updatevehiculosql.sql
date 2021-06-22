USE [CasaMatriz]
GO

/****** Object:  StoredProcedure [dbo].[sp_update_vehiculo]    Script Date: 6/22/2021 11:23:12 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[sp_update_vehiculo] 
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


