USE [CasaMatriz]
GO

/****** Object:  StoredProcedure [dbo].[sp_update_empleado]    Script Date: 6/22/2021 9:20:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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


