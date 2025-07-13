{{ config(
    materialized='table',
    schema='marts'
) }}

SELECT
    {{ dbt_utils.surrogate_key(['customer_id']) }} AS customer_key, -- Using dbt_utils for surrogate key
    customer_id,
    person_id,
    store_id,
    territory_id,
    account_number,
    CASE
        WHEN store_id IS NOT NULL THEN TRUE
        ELSE FALSE
    END AS is_store_customer,
    modified_date
FROM {{ ref('stg_customer') }}