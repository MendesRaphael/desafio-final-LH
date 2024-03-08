-- models/stg_sales_salespersonquotahistory.sql

-- Define a staging table for SalesPersonQuotaHistory data
-- This table will hold raw data before transformation

/*{{ config(
    materialized='table',
    schema='staging'
) }}
*/

with source_data as (
    select
        businessentityid,
        quotadate,
        salesquota,
        rowguid,
        modifieddate
    from {{ source('adventureworks-dw-413814', 'salespersonquotahistory') }}
)

select *
from source_data
