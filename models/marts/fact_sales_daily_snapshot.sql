{{ config(
    materialized='table',
    schema='marts'
) }}

SELECT
    order_date AS snapshot_date,
    SUM(net_amount) AS total_sales_amount,
    COUNT(DISTINCT sales_order_id) AS total_orders
FROM {{ ref('fact_sales') }}
GROUP BY order_date