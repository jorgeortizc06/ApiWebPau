USE [aplicaciones]
GO
/****** Object:  StoredProcedure [dbo].[spProductoDelete]    Script Date: 11/17/2022 8:00:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[spProductoDelete] @IdProducto INT
  

AS  
BEGIN  
  
  
   DELETE  dbo.tbProducto
   WHERE IdProducto=@IdProducto

END;