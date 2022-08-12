import pandas as pd
import pandasql as ps
import pyodbc
import config as bd
from datetime import datetime, timedelta
conn = pyodbc.connect('Driver={SQL Server};'
                      'Server='+bd.Servidor+';'
                      'Database='+bd.Nombre+';'
                      'Trusted_Connection=yes;')
cursor = conn.cursor()

def extraccion(UbicacionArchivo):
    """Obtener todos los elementos y escribirlos en la base de datos TCC

    Args:
        UbicacionArchivo (txt): Ubicacion de archivo a leer
    """
    data = pd.read_csv(UbicacionArchivo, sep='\t')
    df = pd.DataFrame(data)

    #Se Ajusta cierta data para evitar problemas con el proceso
    df['FECHA_REMESA'] = pd.to_datetime(df['FECHA_REMESA'], dayfirst=True)
    df["NUMERO_UNIDADES"].fillna(-1, inplace=True)
    df["KILOS_REALES"].fillna(-1, inplace=True)
    df["VALOR_MERCANCIA"].fillna(-1, inplace=True)
    conn.execute("Truncate table TCCPRUEBA.dbo.REMESA")

    """
    print(df.dtypes) : Se saca los tipos de datos para cada columna para crear la tabla    
    q1 = """"Select distinct UNNE_DESCRIPCION from df""""
    print(ps.sqldf(q1, locals()))  : Se realizan algunas consultas para verificar el mañano/tipo    
    """
    for row in df.itertuples():
        cursor.execute('''
                        INSERT INTO TCCPRUEBA.dbo.REMESA (  IDREMESA ,
                                                            FECHA_REMESA ,
                                                            IDUnidadNegocio , 
                                                            DescUnidadNegocio ,
                                                            IDEstadoRemesa ,
                                                            DescEstadoRemesa ,
                                                            ValorMercancia ,
                                                            KilosReales,
                                                            NroUnidades 
                                                            )
                        VALUES (?,?,?,?,?,?,?,?,?)
                        ''',
                       row.NUMERO_REMESA,
                       row.FECHA_REMESA,
                       row.UNNE_ID_INT,
                       row.UNNE_DESCRIPCION,
                       row.ESON_ID_INT,
                       row.ESON_DESCRIPCION,
                       row.VALOR_MERCANCIA,
                       row.KILOS_REALES,
                       row.NUMERO_UNIDADES
                       )


    conn.execute("EXEC Staging.dbo.uspGenerarDatosRemesa")
    conn.commit()

extraccion('Y:\CSV\sample_dataset.txt')