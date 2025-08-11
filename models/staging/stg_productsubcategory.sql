{{ config(
    materialized='view',
    schema='staging'
) }}

SELECT
    ProductSubcategoryID AS product_subcategory_id,
    ProductCategoryID AS product_category_id,
    Name AS product_subcategory_name
FROM {{ source('adventureworks_raw', 'raw_database_productsubcategory') }}