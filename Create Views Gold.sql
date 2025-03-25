-------------------------
-- CREATE VIEW CALENDAR
--------------------------
CREATE VIEW gold.productsubcategory
AS
SELECT 
    *
    FROM
    OPENROWSET
    (
        BULK 'https://azurestoragedatalakerp.blob.core.windows.net/silver/AdventureWorks_Product_Subcategories/',
        FORMAT = 'PARQUET'
    ) as query1

CREATE VIEW gold.products
AS
SELECT 
    *
    FROM
    OPENROWSET
    (
        BULK 'https://azurestoragedatalakerp.blob.core.windows.net/silver/AdventureWorks_Products/',
        FORMAT = 'PARQUET'
    ) as query2


CREATE VIEW gold.Territories
AS
SELECT 
    *
    FROM
    OPENROWSET
    (
        BULK 'https://azurestoragedatalakerp.blob.core.windows.net/silver/AdventureWorks_Territories/',
        FORMAT = 'PARQUET'
    ) as query5
