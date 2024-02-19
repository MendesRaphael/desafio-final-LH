-- models/stg_country_region.sql

-- define a staging table for countryregion data
-- this table will hold raw data before transformation

{{ config(
    materialized='table',
    schema='staging'
) }}

with source_data as (
    select
        countryregioncode,
        name,
        modifieddate
    from {{ source('adventureworks-dw-413814', 'countryregion') }}
)

select *
from source_data
