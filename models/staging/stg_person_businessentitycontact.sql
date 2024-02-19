-- models/stg_business_entity_contact.sql

-- define a staging table for businessentitycontact data
-- this table will hold raw data before transformation

{{ config(
    materialized='table',
    schema='staging'
) }}

with source_data as (
    select
        businessentityid,
        personid,
        contacttypeid,
        rowguid,
        modifieddate
    from {{ source('adventureworks-dw-413814', 'businessentitycontact') }}
)

select *
from source_data
