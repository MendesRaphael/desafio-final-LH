-- models/stg_sales_salesterritory.sql

-- Define a staging table for SalesTerritory data
-- This table will hold raw data before transformation

/*{{ config(
    materialized='table',
    schema='staging'
) }}
*/

with source_data as (
    select
        territoryid,
        name,
        countryregioncode,
        'group' as geographycgroup,
        salesytd,
        saleslastyear,
        costytd,
        costlastyear,
        rowguid,
        modifieddate
    from {{ source('adventureworks-dw-413814', 'salesterritory') }}
)

select *
from source_data
