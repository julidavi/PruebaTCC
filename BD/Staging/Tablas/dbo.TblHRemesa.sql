USE TCCPrueba
GO

IF EXISTS ( SELECT * FROM TCCPrueba.INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'TblHREMESA' )
BEGIN
	DROP TABLE TCCPRUEBA.dbo.TblHREMESA
END

CREATE TABLE TCCPRUEBA.dbo.TblHREMESA (	
	IDDRemesa int primary key identity (1,1),
	IDREMESA int null,
	FechaRemesa DATETIME null,
	IDUnidadNegocio int null , 
	DescUnidadNegocio varchar(50) null,
	IDEstadoRemesa int null,
	DescEstadoRemesa varchar(50) null,
	ValorMercancia float null,
	KilosReales float null,
	NroUnidades int null,
	FechaInsercion datetime default GetDate()
) CREATE UNIQUE INDEX IDX_TblHREMESA ON TCCPRUEBA.dbo.TblHREMESA (IDDRemesa DESC)

IF EXISTS(SELECT * FROM TCCPRUEBA.sys.indexes WHERE name = 'IDX_TblHREMESA_IDUnidadNegocio' AND object_id = OBJECT_ID('dbo.TblHREMESA'))
    BEGIN
        DROP INDEX IDX_TblHREMESA_IDUnidadNegocio ON TCCPRUEBA.dbo.TblHREMESA
    END

CREATE NONCLUSTERED INDEX IDX_TblHREMESA_IDUnidadNegocio ON TCCPRUEBA.dbo.TblHREMESA (IDUnidadNegocio)