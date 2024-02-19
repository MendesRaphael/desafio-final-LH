-- models/stg_address_type.sql

-- define a staging table for addresstype data
-- this table will hold raw data before transformation

/*
{{ config(
    materialized='table',
    schema='staging'
) }}  
*/
with source_data as (
    select
        addresstypeid,
        name,
        rowguid,
        modifieddate
    from {{ source('adventureworks-dw-413814', 'addresstype') }}
)

select *
from source_data
