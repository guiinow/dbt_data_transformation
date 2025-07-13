-- This test checks if there are any orders with an order_date in the future.
SELECT
    sales_order_id,
    order_date
FROM {{ ref('fact_sales') }}
WHERE order_date > CURRENT_DATE()