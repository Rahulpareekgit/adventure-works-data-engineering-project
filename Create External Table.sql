-- CREATE MASTER KEY ENCRYPTION BY PASSWORD ='password@123'
CREATE DATABASE SCOPED CREDENTIAL cred_rp
WITH 
    IDENTITY = 'Managed Identity'


CREATE EXTERNAL DATA SOURCE source_silver
WITH
(
    LOCATION = 'https://azurestoragedatalakerp.blob.core.windows.net/silver',
    CREDENTIAL = cred_rp
)

CREATE EXTERNAL DATA SOURCE source_gold
WITH
(
    LOCATION = 'https://azurestoragedatalakerp.blob.core.windows.net/gold',
    CREDENTIAL = cred_rp
)

CREATE EXTERNAL FILE FORMAT format_parquet
WITH
(
        FORMAT_TYPE = PARQUET,
        DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'   
)


-- create external tables extsales
CREATE EXTERNAL TABLE gold.extsales
WITH
(
    LOCATION = 'extsales',
    DATA_SOURCE = source_gold,
    file_format = format_parquet
)
AS
SELECT * From gold.sales

SELECT * from gold.extsales
