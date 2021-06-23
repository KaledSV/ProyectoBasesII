USE [CasaMatriz]
GO

/****** Object:  StoredProcedure [dbo].[venta]    Script Date: 6/22/2021 8:14:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[venta]
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


