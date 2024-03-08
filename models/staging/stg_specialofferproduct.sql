-- models/stg_sales_specialofferproduct.sql

-- Define a staging table for SpecialOfferProduct data
-- This table will hold raw data before transformation

/*{{ config(
    materialized='table',
    schema='staging'
) }}
*/

with source_data as (
    select
        specialofferid,
        productid,
        rowguid,
        modifieddate
    from {{ source('adventureworks-dw-413814', 'specialofferproduct') }}
)

select *
from source_data
