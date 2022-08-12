USE Staging
GO

IF EXISTS ( SELECT * FROM Staging.INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'TblsHREMESA' )
BEGIN
	DROP TABLE Staging.dbo.TblsHREMESA
END

CREATE TABLE Staging.dbo.TblsHREMESA (	
	IDREMESA int not null,
	FECHA_REMESA DATETIME not null,
	IDUnidadNegocio int not null , 
	DescUnidadNegocio varchar(50) null,
	IDEstadoRemesa int not null,
	DescEstadoRemesa varchar(50) null,
	ValorMercancia float not null,
	KilosReales float not null,
	NroUnidades int not null
)