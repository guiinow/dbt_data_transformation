{{ config(
    materialized='view',
    schema='staging'
) }}

SELECT
    ProductCategoryID AS product_category_id,
    Name AS product_category_name
FROM {{ source('adventureworks_raw', 'raw_database_productcategory') }}
