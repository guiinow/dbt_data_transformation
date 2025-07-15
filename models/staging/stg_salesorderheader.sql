{{ config(
    materialized='view',
    schema='staging'
) }}

SELECT
    SalesOrderID AS sales_order_id,
    CustomerID AS customer_id,
    OrderDate AS order_date,
    SubTotal AS sub_total,
    TaxAmt AS tax_amount,
    Freight AS freight,
    TotalDue AS total_due,
    ModifiedDate AS modified_date
FROM {{ source('adventureworks_raw', 'raw_database_salesorderheader') }}