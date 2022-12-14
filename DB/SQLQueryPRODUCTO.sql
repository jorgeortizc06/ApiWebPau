USE [aplicaciones]
GO
/****** Object:  StoredProcedure [dbo].[spProductoQuery]    Script Date: 11/28/2022 8:35:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROC [dbo].[spProductoQuery]
    @IdProducto INT = NULL,  
    @Descripcion VARCHAR(50) = NULL  
AS  
BEGIN  
  
  
    SELECT pro.IdProducto,  
           pro.Descripcion,  
           pro.IdMarca,  
           pro.Marca,  
           pro.Activo,  
           pro.UsrIng,  
           pro.FecIng  
    FROM dbo.vwProducto pro  
    WHERE (  
              @IdProducto IS NULL  
              OR pro.IdProducto = @IdProducto  
          )  
          AND  
          (  
              @Descripcion IS NULL  
              OR pro.Descripcion LIKE '%' + @Descripcion + '%'  
          );  
  
END;