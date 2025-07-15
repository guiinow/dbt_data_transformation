{{ config(
    materialized='table',
    schema='marts'
) }}

SELECT
    {{ dbt_utils.generate_surrogate_key (['product_id']) }} AS product_key,
    product_id,
    name AS product_name,
    productnumber AS product_number,
    makeflag AS make_flag,
    finishedgoodsflag AS finished_goods_flag,
    color,
    safetystocklevel AS safety_stock_level,
    reorderpoint AS reorder_point,
    standardcost AS standard_cost,
    listprice AS list_price,
    sellstartdate AS sell_start_date,
    sellenddate AS sell_end_date,
    discontinueddate AS discontinued_date,
    rowguid AS row_guid,
    modifieddate AS modified_date
FROM {{ ref('stg_product') }}