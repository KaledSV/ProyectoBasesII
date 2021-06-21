CREATE PROCEDURE dbo.buscarPalabra
	@descripcion VARCHAR(100)
AS
BEGIN
SET NOCOUNT ON
	BEGIN TRY
		SELECT [ID],[IDMarca],[IDProvedor],[Nombre],[Descripcion],[Fotografias],[Codigo],[Precio]
		FROM [dbo].[Producto]
		WHERE ([Nombre] LIKE '%'+ @descripcion +'%')
			OR ([Descripcion] LIKE '%'+ @descripcion +'%')
	END TRY

	BEGIN CATCH
		SELECT -1
	END CATCH
SET NOCOUNT OFF
END
GO