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
FROM {{ source('adventureworks_raw', 'raw_database_customer') }} -- alterar esse customer pro nome correto da tabela de origem no databricks, alterar aqui e no sources.yml
WHERE CustomerID IS NOT NULL -- Example of basic cleaning