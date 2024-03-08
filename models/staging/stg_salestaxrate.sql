-- models/stg_sales_salestaxrate.sql

-- Define a staging table for SalesTaxRate data
-- This table will hold raw data before transformation

/*{{ config(
    materialized='table',
    schema='staging'
) }}
*/

with source_data as (
    select
        salestaxrateid,
        stateprovinceid,
        taxtype,
        taxrate,
        name,
        rowguid,
        modifieddate
    from {{ source('adventureworks-dw-413814', 'salestaxrate') }}
)

select *
from source_data
