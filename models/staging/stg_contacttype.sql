-- models/stg_contact_type.sql

-- define a staging table for contacttype data
-- this table will hold raw data before transformation

{{ config(
    materialized='table',
    schema='staging'
) }}

with source_data as (
    select
        contacttypeid,
        name as contact_type_name,
        --modifieddate
    from {{ source('adventureworks-dw-413814', 'contacttype') }}
)

select *
from source_data
