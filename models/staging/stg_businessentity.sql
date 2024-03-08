-- models/stg_business_entity.sql

-- define a staging table for businessentity data
-- this table will hold raw data before transformation


{{ config(
    materialized='table',
    schema='staging'
) }}  


with source_data as (
    select
        businessentityid
        ,rowguid
        ,date(modifieddate) as modifieddate
    from {{ source('adventureworks-dw-413814', 'businessentity') }}
)

select *
from source_data
