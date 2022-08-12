USE Staging 
GO

IF EXISTS ( SELECT  * FROM  sys.objects WHERE   object_id = OBJECT_ID(N'uspGenerarDatosRemesa') )
	DROP PROCEDURE dbo.uspGenerarDatosRemesa 
GO

CREATE PROCEDURE dbo.uspGenerarDatosRemesa
AS
BEGIN
SET NOCOUNT ON

 --Se insertan datos en la area de Staging
 
 TRUNCATE TABLE Staging.dbo.TblsHREMESA 

 INSERT INTO Staging.dbo.TblsHREMESA
 (
	IDREMESA ,
	FechaRemesa ,
	IDUnidadNegocio ,
	DescUnidadNegocio ,
	IDEstadoRemesa ,
	DescEstadoRemesa ,
	ValorMercancia ,
	KilosReales ,
	NroUnidades 
 )
 SELECT [IDREMESA]
       ,[FECHA_REMESA]
       ,[IDUnidadNegocio]
       ,[DescUnidadNegocio]
       ,[IDEstadoRemesa]
       ,[DescEstadoRemesa]
       ,[ValorMercancia]
       ,[KilosReales]
       ,[NroUnidades]
  FROM Staging.dbo.vwRemesa

   TRUNCATE TABLE TCCPRUEBA.dbo.TblHREMESA 

   INSERT INTO TCCPRUEBA.dbo.TblHREMESA 
 (
	IDREMESA ,
	FechaRemesa ,
	IDUnidadNegocio ,
	DescUnidadNegocio ,
	IDEstadoRemesa ,
	DescEstadoRemesa ,
	ValorMercancia ,
	KilosReales ,
	NroUnidades 
 )
 SELECT IDREMESA ,
		FechaRemesa ,
		IDUnidadNegocio ,
		DescUnidadNegocio ,
		IDEstadoRemesa ,
		DescEstadoRemesa ,
		ValorMercancia ,
		KilosReales ,
		NroUnidades 
  FROM Staging.dbo.TblsHREMESA

  /*
	UPDATE TCCPRUEBA.dbo.TblHREMESA 
	SET
	TblHREMESA.IDREMESA = TblsHREMESA.IDREMESA,
	TblHREMESA.FECHA_REMESA = TblsHREMESA.FechaRemesa,
	TblHREMESA.IDUnidadNegocio = TblsHREMESA.IDUnidadNegocio, 
	TblHREMESA.DescUnidadNegocio =TblsHREMESA.DescUnidadNegocio ,
	TblHREMESA.IDEstadoRemesa = TblsHREMESA.IDEstadoRemesa ,
	TblHREMESA.DescEstadoRemesa = TblsHREMESA.DescEstadoRemesa ,
	TblHREMESA.ValorMercancia = TblsHREMESA.ValorMercancia ,
	TblHREMESA.KilosReales = TblsHREMESA.KilosReales ,
	TblHREMESA.NroUnidades = TblsHREMESA.NroUnidades
	FROM Staging.dbo.TblsHREMESA TblsHREMESA
	WHERE ---------------------
	*/




END
