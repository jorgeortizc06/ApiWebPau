USE [aplicaciones]
GO
/****** Object:  StoredProcedure [dbo].[spProductoQuery]    Script Date: 11/17/2022 7:38:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create    PROC [dbo].[spProductoUpdate]
    @IdProducto INT = NULL,  
    @Descripcion VARCHAR(250) = NULL,
	 @IdMarca INT,
	 @Activo Bit

	
AS  
BEGIN  
  
  
   update dbo.tbProducto
   set Descripcion=@Descripcion,
   IdMarca=@IdMarca,
   Activo=@Activo
   where IdProducto=@IdProducto;

END;