USE [CasaMatriz]
GO

/****** Object:  StoredProcedure [dbo].[sp_update_empleado]    Script Date: 6/22/2021 9:20:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[sp_update_empleado] 
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
		   [IDTipoEmpleado] = @IDTipoEmpleado
	WHERE  [ID] = @ID
	

	SELECT [ID], [IDFerreteria], [Nombre], [Apellido], [Foto], [FechaIngreso], [Activo]
	FROM   [dbo].[Empleado] 
	WHERE  [ID] = @ID
		


	COMMIT
GO


