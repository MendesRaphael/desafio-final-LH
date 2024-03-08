-- models/stg_sales_currencyrate.sql

-- Define a staging table for CurrencyRate data
-- This table will hold raw data before transformation

/*{{ config(
    materialized='table',
    schema='staging'
) }}
*/

with source_data as (
    select
        currencyrateid,
        currencyratedate,
        fromcurrencycode,
        tocurrencycode,
        averagerate,
        endofdayrate,
        modifieddate
    from {{ source('adventureworks-dw-413814', 'currencyrate') }}
)

select *
from source_data
