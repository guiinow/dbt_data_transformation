{{ config(
    materialized='table',
    schema='marts'
) }}

SELECT
    {{ dbt_utils.generate_surrogate_key(['c.customer_id']) }} AS customer_key, 
    c.customer_id,
    c.person_id,
    c.store_id,
    c.territory_id,
    c.account_number,
    CASE
        WHEN c.store_id IS NOT NULL THEN TRUE
        ELSE FALSE
    END AS is_store_customer,
    c.modified_date,
    t.territory_name,
    t.country_region_code
FROM {{ ref('stg_customer') }} c
LEFT JOIN {{ ref('stg_territory') }} t
    ON c.territory_id = t.territory_id