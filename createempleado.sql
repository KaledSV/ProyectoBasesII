USE [CasaMatriz]
GO

/****** Object:  StoredProcedure [dbo].[sp_create_empleado]    Script Date: 6/22/2021 9:19:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[sp_create_empleado] 
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


