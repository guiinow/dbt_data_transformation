{{ config(
    materialized='table',
    schema='marts'
) }}

SELECT
    sod.sales_order_detail_id AS sales_order_detail_key, 
    sod.sales_order_id,
    sod.sales_order_detail_id,
    dc.customer_key,
    dp.product_key,
    dp.product_name,
    soh.order_date,
    sod.order_quantity,
    sod.unit_price,
    sod.unit_price_discount,
    sod.order_quantity * sod.unit_price AS gross_amount,
    sod.line_total AS net_amount,
    dc.territory_name,
    dc.country_region_code
FROM {{ ref('stg_salesorderdetail') }} sod
JOIN {{ ref('stg_salesorderheader') }} soh
  ON sod.sales_order_id = soh.sales_order_id 
JOIN {{ ref('dim_customer') }} dc
    ON soh.customer_id = dc.customer_id 
JOIN {{ ref('dim_product') }} dp
    ON sod.product_id = dp.product_id
-- importante ter um .yml pra cada modelo, diferentemente da staging; usar CTE e tipagem