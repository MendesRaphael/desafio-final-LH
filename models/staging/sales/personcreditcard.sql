-- models/stg_sales_personcreditcard.sql

-- Define a staging table for PersonCreditCard data
-- This table will hold raw data before transformation

/*{{ config(
    materialized='table',
    schema='staging'
) }}
*/

with source_data as (
    select
        businessentityid,
        creditcardid,
        modifieddate
    from {{ source('adventureworks-dw-413814', 'personcreditcard') }}
)

select *
from source_data
