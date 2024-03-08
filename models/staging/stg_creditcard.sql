-- models/stg_sales_creditcard.sql

/*{{ config(
    materialized='table',
    schema='staging'
) }}
*/

with source_data as (
    select
        creditcardid,
        cardtype,
        cardnumber,
        expmonth,
        expyear,
        modifieddate
    from {{ source('adventureworks-dw-413814', 'creditcard') }}
)

select *
from source_data
