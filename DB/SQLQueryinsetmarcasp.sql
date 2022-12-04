CREATE OR ALTER PROC [dbo].[spMarcaInsert]
	@Descripcion VARCHAR(250),
	@Activo BIT
	
	
AS
BEGIN
	
	DECLARE @IdMarca INT;

	SELECT @IdMarca = ISNULL(MAX(IdMarca), 0) + 1
	FROM dbo.tbMarca;

	INSERT INTO [dbo].[tbMarca]
           ([IdMarca]
		   ,[Descripcion]
           ,[Activo]
           ,[UsrIng]
           ,[FecIng])
     VALUES
           (@IdMarca
		   ,@Descripcion
           ,@Activo
           ,'ADMIN'
           ,GETDATE());

END;