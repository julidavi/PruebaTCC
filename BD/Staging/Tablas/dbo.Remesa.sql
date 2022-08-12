USE TCCPrueba
GO

IF EXISTS ( SELECT * FROM TCCPrueba.INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'REMESA' )
BEGIN
	DROP TABLE TCCPRUEBA.dbo.REMESA
END

CREATE TABLE TCCPRUEBA.dbo.REMESA (	
	IDREMESA int null,
	FECHA_REMESA DATETIME null,
	IDUnidadNegocio int null , 
	DescUnidadNegocio varchar(50) null,
	IDEstadoRemesa int null,
	DescEstadoRemesa varchar(50) null,
	ValorMercancia float null,
	KilosReales float null,
	NroUnidades int null
)