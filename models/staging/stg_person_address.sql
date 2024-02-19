-- models/stg_person_address.sql

-- Define a staging table for Address data
-- this table will hold raw data before transformation

/*
{{ config(
    materialized='table',
    schema='staging'
) }}  
*/

with source_data as (
    select
        addressid,
        stateprovinceid,
        city,
        addressline2,
        modifieddate,
        rowguid,
        postalcode,
        spatiallocation,
        addressline1
    from {{ source('adventureworks-dw-413814', 'address') }}
)

select *
from source_data