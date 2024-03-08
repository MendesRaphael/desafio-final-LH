-- models/stg_sales_specialoffer.sql

-- Define a staging table for SpecialOffer data
-- This table will hold raw data before transformation

/*{{ config(
    materialized='table',
    schema='staging'
) }}
*/

with source_data as (
    select
        specialofferid,
        description as offer_campaign_name,
        discountpct,
        type,
        category,
        startdate,
        enddate,
        minqty,
        maxqty,
        rowguid,
        modifieddate
    from {{ source('adventureworks-dw-413814', 'specialoffer') }}
)

select *
from source_data
