{{ config(
    materialized='view',
    schema='staging'
) }}

SELECT
    SalesOrderDetailID AS sales_order_detail_id,
    SalesOrderID AS sales_order_id,
    ProductID AS product_id,
    OrderQty AS order_quantity,
    UnitPrice AS unit_price,
    UnitPriceDiscount AS unit_price_discount,
    LineTotal AS line_total,
    ModifiedDate AS modified_date
FROM {{ source('adventureworks_raw', 'raw_database_salesorderdetail') }}