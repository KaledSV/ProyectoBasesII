USE [CasaMatriz]
GO

/****** Object:  StoredProcedure [dbo].[sp_update_amonestacion]    Script Date: 6/22/2021 10:06:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[sp_update_amonestacion] 
    @ID INT,
    @IDEmpleado INT,
    @Fecha as DATE = null,
    @Monto as Money = null
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Amonestacion]
	SET    [IDEmpleado] = @IDEmpleado, [Fecha] = ISNULL(@Fecha,(SELECT Fecha FROM Amonestacion WHERE ID = @ID)), [Monto] = ISNULL(@Monto,(SELECT Monto FROM Amonestacion WHERE ID = @ID))
	WHERE  [ID] = @ID
	
	
	SELECT [ID], [IDEmpleado], [Fecha], [Monto] 
	FROM   [dbo].[Amonestacion]
	WHERE  [ID] = @ID	
	

	COMMIT
GO


