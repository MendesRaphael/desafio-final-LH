-- models/stg_sales_store.sql

-- Define a staging table for Store data
-- This table will hold raw data before transformation

/*{{ config(
    materialized='table',
    schema='staging'
) }}
*/

with source_data as (
    select
        businessentityid,
        name,
        salespersonid,
        demographics,
        rowguid,
        modifieddate
    from {{ source('adventureworks-dw-413814', 'store') }}
)

select *
from source_data
