{{ config(
    materialized='table',
    schema='marts'
) }}

SELECT
    {{ dbt_utils.surrogate_key(['sales_order_detail_id']) }} AS sales_order_detail_key,
    isl.sales_order_id,
    isl.sales_order_detail_id,
    dc.customer_key,
    dp.product_key,
    isl.order_date,
    isl.order_quantity,
    isl.unit_price,
    isl.unit_price_discount,
    isl.line_total AS gross_amount,
    isl.discounted_line_total AS net_amount
FROM {{ ref('int_sales_order_lines') }} isl
JOIN {{ ref('dim_customer') }} dc
    ON isl.customer_id = dc.customer_id
JOIN {{ ref('dim_product') }} dp
    ON isl.product_id = dp.product_id