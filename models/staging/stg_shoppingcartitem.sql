-- models/stg_sales_shoppingcartitem.sql

-- Define a staging table for ShoppingCartItem data
-- This table will hold raw data before transformation

/*{{ config(
    materialized='table',
    schema='staging'
) }}
*/

with source_data as (
    select
        shoppingcartitemid,
        shoppingcartid,
        quantity,
        productid,
        datecreated,
        modifieddate
    from {{ source('adventureworks-dw-413814', 'shoppingcartitem') }}
)

select *
from source_data
