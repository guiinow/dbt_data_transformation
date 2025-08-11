{{ config(
    materialized='table',
    schema='marts'
) }}

SELECT
    territory_id AS territory_key,
    territory_id,
    territory_name,
    country_region_code,
    sales_ytd,
    sales_last_year
FROM {{ ref('stg_territory') }}