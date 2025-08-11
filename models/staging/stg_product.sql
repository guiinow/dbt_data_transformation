{{ config(
    materialized='view',
    schema='staging'
) }}

SELECT
    productid AS product_id,
    name,
    productnumber,
    makeflag,
    finishedgoodsflag,
    color,
    safetystocklevel,
    reorderpoint,
    standardcost,
    listprice,
    sellstartdate,
    sellenddate,
    discontinueddate,
    rowguid,
    modifieddate
FROM {{ source('adventureworks_raw', 'raw_database_product') }}

-- boa pratica usar CTE, tipagem de dados pra todas as colunas 
-- revisar boas praticas da indicium (style guide)