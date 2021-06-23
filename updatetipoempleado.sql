USE [CasaMatriz]
GO

/****** Object:  StoredProcedure [dbo].[sp_update_tipoempleado]    Script Date: 6/22/2021 9:38:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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


