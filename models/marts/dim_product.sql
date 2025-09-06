{{ config(
    materialized='table',
    schema='marts'
) }}

SELECT
    {{ dbt_utils.generate_surrogate_key(['p.product_id']) }} AS product_key,
    p.product_id,
    p.product_name AS product_name,
    p.productnumber AS product_number,
    p.makeflag AS make_flag,
    p.finishedgoodsflag AS finished_goods_flag,
    p.color,
    p.safetystocklevel AS safety_stock_level,
    p.reorderpoint AS reorder_point,
    p.standardcost AS standard_cost,
    p.listprice AS list_price,
    p.sellstartdate AS sell_start_date,
    p.sellenddate AS sell_end_date,
    p.discontinueddate AS discontinued_date,
    p.rowguid AS row_guid,
    p.modifieddate AS modified_date,
    p.product_subcategory_id,
    ps.product_subcategory_name,
    ps.product_category_id,
    pc.product_category_name
FROM {{ ref('stg_product') }} p
LEFT JOIN {{ ref('stg_productsubcategory') }} ps
    ON p.product_subcategory_id = ps.product_subcategory_id
LEFT JOIN {{ ref('stg_productcategory') }} pc
    ON ps.product_category_id = pc.product_category_id