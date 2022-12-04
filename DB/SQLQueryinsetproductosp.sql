USE [aplicaciones]
GO
/****** Object:  StoredProcedure [dbo].[spProductoDelete]    Script Date: 11/17/2022 8:00:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[spProductoInsert]
	@Descripcion VARCHAR(250),
	@IdMarca INT,
	@Activo BIT
AS
BEGIN

	DECLARE @IdProducto INT;

	SELECT @IdProducto = ISNULL(MAX(IdProducto), 0) + 1
	FROM dbo.tbProducto;

	INSERT INTO dbo.tbProducto
	(
		IdProducto,
		Descripcion,
		IdMarca,
		Activo,
		UsrIng,
		FecIng
	)
	VALUES
	(
		@IdProducto, --IdProducto - int
		@Descripcion, --Descripcion - varchar (50)
		@IdMarca,     --IdMarca - int
		@Activo,      --Activo - bit
		'admin',      --UsrIng - varchar (50)
		GETDATE()     --FeIng - datetime
	)

END;