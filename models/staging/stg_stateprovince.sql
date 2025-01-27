-- models/stg_person_state_province.sql

-- define a staging table for stateprovince data
-- this table will hold raw data before transformation


{{ config(
    materialized='table',
    schema='staging'
) }}  


with source_data as (
    select
        stateprovinceid,
        stateprovincecode,
        countryregioncode,
        isonlystateprovinceflag, -- 	0 = StateProvinceCode exists. 1 = StateProvinceCode unavailable, using CountryRegionCode.
        name as stateprovince_name,
        territoryid,
        rowguid,
        date(modifieddate) as modifieddate
    from {{ source('adventureworks-dw-413814', 'stateprovince') }}
)

select *
from source_data
