-- models/stg_business_entity_address.sql

-- define a staging table for businessentityaddress data
-- this table will hold raw data before transformation

{{ config(
    materialized='table',
    schema='staging'
) }}

with source_data as (
    select
        businessentityid
        ,addressid
        ,addresstypeid
        ,rowguid
        ,date(modifieddate) as modifieddate
    from {{ source('adventureworks-dw-413814', 'businessentityaddress') }}
)

select *
from source_data
