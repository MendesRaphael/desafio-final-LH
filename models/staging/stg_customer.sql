-- models/stg_sales_customer.sql

-- Define a staging table for Customer data
-- This table will hold raw data before transformation

/*{{ config(
    materialized='table',
    schema='staging'
) }}
*/

with source_data as (
    select
        customerid,
        personid,
        storeid,
        territoryid,
        rowguid,
        modifieddate
    from {{ source('adventureworks-dw-413814', 'customer') }}
)

select *
from source_data
