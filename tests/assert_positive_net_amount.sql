-- This test checks if all net_amount values in fact_sales are positive.
SELECT
    sales_order_detail_key,
    net_amount
FROM {{ ref('fact_sales') }}
WHERE net_amount <= 0