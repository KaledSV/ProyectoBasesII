USE [CasaMatriz]
GO

/****** Object:  StoredProcedure [dbo].[ventaProducto]    Script Date: 6/22/2021 8:28:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[ventaProducto]
	@fereteria INT,
	@IdVenta INT,
	@IdProducto INT,
	@Cantidad INT

AS
BEGIN
SET NOCOUNT ON
	BEGIN TRY
		IF @fereteria = 1
			BEGIN
				EXEC ('Call agregarVentaProducto(?, ?, ?)', @IdVenta, @IdProducto, @Cantidad) AT FGAM
			END
		IF @fereteria = 2
			BEGIN
				EXEC ('Call agregarVentaProducto(?, ?, ?)', @IdVenta, @IdProducto, @Cantidad) AT FNORTE
			END
		IF @fereteria = 3
			BEGIN
				EXEC ('Call agregarVentaProducto(?, ?, ?)', @IdVenta, @IdProducto, @Cantidad) AT FSUR
			END
	END TRY

	BEGIN CATCH
		SELECT -1
	END CATCH
SET NOCOUNT OFF
END
GO


