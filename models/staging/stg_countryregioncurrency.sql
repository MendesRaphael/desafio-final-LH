-- models/stg_sales_countryregioncurrency.sql

-- define a staging table for countryregioncurrency data
-- this table will hold raw data before transformation

/*
{{ config(
    materialized='table',
    schema='staging'
) }}
*/
with source_data as (
    select
        countryregioncode,
        currencycode,
        --modifieddate
    from {{ source('adventureworks-dw-413814', 'countryregioncurrency') }}
)

select *
from source_data
