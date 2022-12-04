CREATE OR ALTER PROC [dbo].[spMarcaDelete] @IdMarca INT
  

AS  
BEGIN  
  
  
   DELETE  dbo.tbMarca
   WHERE IdMarca=@IdMarca;

END;