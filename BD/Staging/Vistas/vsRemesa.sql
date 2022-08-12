USE Staging
GO

IF EXISTS ( SELECT * FROM sys.views where name = 'vwRemesa' )
DROP VIEW dbo.vwRemesa;
GO


CREATE VIEW dbo.vwRemesa  AS

SELECT [IDREMESA]
      ,[FECHA_REMESA]
      ,[IDUnidadNegocio]
      ,[DescUnidadNegocio]
      ,[IDEstadoRemesa]
      ,[DescEstadoRemesa]
      ,[ValorMercancia]
      ,[KilosReales]
      ,[NroUnidades]
  FROM [TCCPrueba].[dbo].[REMESA]


