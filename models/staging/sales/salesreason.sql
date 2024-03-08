-- models/stg_sales_salesreason.sql

-- Define a staging table for SalesReason data
-- This table will hold raw data before transformation

/*{{ config(
    materialized='table',
    schema='staging'
) }}
*/

with source_data as (
    select
        salesreasonid,
        name,
        reasontype,
        modifieddate
    from {{ source('adventureworks-dw-413814', 'salesreason') }}
)

select *
from source_data