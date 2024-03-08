-- models/stg_sales_currency.sql

-- Define a staging table for Address data
-- this table will hold raw data before transformation

/*{{ config(
    materialized='table',
    schema='staging'
) }}
*/

with source_data as (
    select
        currencycode,
        name,
        modifieddate
    from {{ source('adventureworks-dw-413814', 'currency') }}
)

select *
from source_data
