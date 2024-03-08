-- models/stg_person_person.sql

-- define a staging table for person data
-- this table will hold raw data before transformation


{{ config(
    materialized='table',
    schema='staging'
) }}  


with source_data as (
    select
        businessentityid,
        persontype,
        concat(
            coalesce(title, ''), 
            coalesce(firstname, ''),
            coalesce(middlename, ''),
            coalesce(lastname, ''),
            coalesce(suffix, '')
        ) as person_name,
        --namestyle,
        --title,
        --firstname,
        --middlename,
        --lastname,
        --suffix,
        emailpromotion,
        --additionalcontactinfo,
        --demographics,
        rowguid,
        date(modifieddate) as modifieddate
    from {{ source('adventureworks-dw-413814', 'person') }}
)

select *
from source_data
