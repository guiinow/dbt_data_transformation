{% snapshot fact_sales_daily_snapshot %}
    {{
        config(
            target_schema='marts',
            unique_key='sales_order_detail_key',
            strategy='timestamp',
            updated_at='order_date'
        )
    }}

    SELECT
        *
    FROM {{ ref('fact_sales') }}

{% endsnapshot %}