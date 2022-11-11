CREATE TABLE tbProveedor (
    IdProveedor int IDENTITY(1,1) PRIMARY KEY,
    Identificacion varchar(15) NOT NULL,
    RazonSocial varchar(20),
    NombreComercial varchar(200)
);

INSERT INTO [dbo].[tbProveedor]
           ([Identificacion]
           ,[RazonSocial]
           ,[NombreComercial])
     VALUES
           ('0164726374821'
           ,'RazonSocial1'
           ,'NombreComercial1'),
		   ('0164726374822'
           ,'RazonSocial2'
           ,'NombreComercial2'),
		   ('0164726374823'
           ,'RazonSocial3'
           ,'NombreComercial3');



USE [Examen2]
GO


CREATE  OR ALTER  PROC spProveedorQuery
	@IdProveedor INT = NULL
AS  
BEGIN  
  
  SELECT pro.IdProveedor,
		pro.Identificacion,
		pro.RazonSocial,
		pro.NombreComercial
  FROM tbProveedor pro
  WHERE  
    @IdProveedor IS NULL  
    OR pro.IdProveedor = @IdProveedor  
            

END;

GO