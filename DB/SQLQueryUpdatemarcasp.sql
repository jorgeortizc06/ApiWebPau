
CREATE OR ALTER PROC [dbo].[spMarcaUpdate]
    @IdMarca INT = NULL,  
    @Descripcion VARCHAR(250) = NULL,
	@Activo BIT
AS  
BEGIN  
  
  
	UPDATE [dbo].[tbMarca]
	   SET [Descripcion] = @Descripcion
		  ,[Activo] = @Activo
		  ,[UsrIng] = 'ADMIN'
		  ,[FecIng] = GETDATE()
	 WHERE IdMarca = @IdMarca;

END;

