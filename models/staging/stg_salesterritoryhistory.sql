-- models/stg_sales_salesterritoryhistory.sql

-- Define a staging table for SalesTerritoryHistory data
-- This table will hold raw data before transformation

/*{{ config(
    materialized='table',
    schema='staging'
) }}
*/

with source_data as (
    select
        businessentityid,
        territoryid,
        startdate,
        enddate,
        rowguid,
        modifieddate
    from {{ source('adventureworks-dw-413814', 'salesterritoryhistory') }}
)

select *
from source_data
