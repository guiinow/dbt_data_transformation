{{ config(
    materialized='view',
    schema='staging'
) }}

SELECT
    TerritoryID AS territory_id,
    Name AS territory_name,
    CountryRegionCode AS country_region_code,
    SalesYTD AS sales_ytd,
    SalesLastYear AS sales_last_year
FROM {{ source('adventureworks_raw', 'raw_database_salesterritory') }}