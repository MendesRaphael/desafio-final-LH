-- models/stg_sales_salesorderheadersalesreason.sql

-- Define a staging table for SalesOrderHeaderSalesReason data
-- This table will hold raw data before transformation

/*{{ config(
    materialized='table',
    schema='staging'
) }}
*/

with source_data as (
    select
        salesorderid,
        salesreasonid,
        modifieddate
    from {{ source('adventureworks-dw-413814', 'salesorderheadersalesreason') }}
)

select *
from source_data
