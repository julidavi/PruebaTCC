USE Staging
GO

IF EXISTS ( SELECT * FROM sys.views where name = 'vwRemesa' )
DROP VIEW vwRemesa;
GO


CREATE VIEW dbo.vwRemesa  AS
SELECT *
FROM TCCPRUEBA.dbo.REMESA

