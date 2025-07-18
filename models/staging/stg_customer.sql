{{ config(
    materialized='view',
    schema='staging' 
) }}

SELECT
    CustomerID AS customer_id,
    PersonID AS person_id,
    StoreID AS store_id,
    TerritoryID AS territory_id,
    AccountNumber AS account_number,
    rowguid AS row_guid,
    ModifiedDate AS modified_date
FROM {{ source('adventureworks_raw', 'raw_database_customer') }} 
WHERE CustomerID IS NOT NULL 