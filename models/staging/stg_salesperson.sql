-- models/stg_sales_salesperson.sql

-- Define a staging table for SalesPerson data
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
        salesquota,
        bonus,
        commissionpct,
        salesytd,
        saleslastyear,
        rowguid,
        modifieddate
    from {{ source('adventureworks-dw-413814', 'salesperson') }}
)

select *
from source_data
