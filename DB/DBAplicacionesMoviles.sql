CREATE TABLE [dbo].[tbMarca](
	[IdMarca] [int] NOT NULL,
	[Descripcion] [varchar](250) NOT NULL,
	[Activo] [bit] NOT NULL,
	[UsrIng] [varchar](50) NOT NULL,
	[FecIng] [datetime] NOT NULL,
 CONSTRAINT [PK_tbMarca] PRIMARY KEY CLUSTERED 
(
	[IdMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY];



CREATE TABLE [dbo].[tbProducto](
	[IdProducto] [int] NOT NULL,
	[Descripcion] [varchar](250) NOT NULL,
	[IdMarca] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
	[UsrIng] [varchar](50) NOT NULL,
	[FecIng] [datetime] NOT NULL,
 CONSTRAINT [PK_tbProducto] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY];


ALTER TABLE [dbo].[tbProducto]  WITH CHECK ADD  CONSTRAINT [FK_tbProducto_tbMarca] FOREIGN KEY([IdMarca])
REFERENCES [dbo].[tbMarca] ([IdMarca]);


ALTER TABLE [dbo].[tbProducto] CHECK CONSTRAINT [FK_tbProducto_tbMarca];



CREATE OR ALTER VIEW vwProducto
AS
SELECT pro.IdProducto,  
       pro.Descripcion ,  
       pro.IdMarca,  
    mar.Descripcion Marca,  
       pro.Activo,  
       pro.UsrIng,  
       pro.FecIng  
FROM dbo.tbProducto pro  
    INNER JOIN dbo.tbMarca mar  
        ON mar.IdMarca = pro.IdMarca;



CREATE  OR ALTER  PROC spProductoQuery
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


CREATE  OR ALTER  PROC spMarcaQuery
@IdMarca INT = NULL,  
   @Descripcion VARCHAR(50) = NULL 
AS  
BEGIN  
  
  SELECT mar.IdMarca
		,mar.Descripcion
		,mar.Activo
		,mar.UsrIng
		,mar.FecIng
  FROM tbMarca mar
  WHERE (  
              @IdMarca IS NULL  
              OR mar.IdMarca = @IdMarca  
          )  
          AND  
          (  
              @Descripcion IS NULL  
              OR mar.Descripcion LIKE '%' + @Descripcion + '%'  
          ); 

END;



INSERT INTO [dbo].[tbMarca]
           ([IdMarca]
           ,[Descripcion]
           ,[Activo]
           ,[UsrIng]
           ,[FecIng])
     VALUES
           
		   (1,'coca cola','1','admin',getdate()),
		   (2,'dasani','1','admin',getdate()),
		    (3,'zhumir','1','admin',getdate()),
			(4,'papel','1','admin',getdate());



INSERT INTO [dbo].[tbProducto]
([IdProducto]
,[Descripcion]
,[IdMarca]
,[Activo]
,[UsrIng]
,[FecIng])
VALUES
(1,'coca cola 500ml',1,'1','admin',getdate()),
(2,'dasani 500ml',2,'1','admin',getdate()),
(3,'zhumir 200ml',3,'1','admin',getdate()),
(4,'papel scot 200ml',4,'1','admin',getdate());