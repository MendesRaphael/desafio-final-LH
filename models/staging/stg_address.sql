-- models/stg_person_address.sql

-- Define a staging table for Address data
-- this table will hold raw data before transformation


{{ config(
    materialized='table',
    schema='staging'
) }}  


with source_data as (
    select 
        *
    from {{ source('adventureworks-dw-413814', 'address') }}
)

select *
from source_data