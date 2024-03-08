-- models/stg_sales_salesorderdetail.sql

-- Define a staging table for SalesOrderDetail data
-- This table will hold raw data before transformation

/*{{ config(
    materialized='table',
    schema='staging'
) }}
*/

with source_data as (
    select
        salesorderid,
        salesorderdetailid,
        carriertrackingnumber,
        orderqty,
        productid,
        specialofferid,
        unitprice,
        unitpricediscount,
        rowguid,
        modifieddate
    from {{ source('adventureworks-dw-413814', 'salesorderdetail') }}
)

select *
from source_data
