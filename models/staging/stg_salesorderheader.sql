-- models/stg_sales_salesorderheader.sql

-- Define a staging table for SalesOrderHeader data
-- This table will hold raw data before transformation

/*{{ config(
    materialized='table',
    schema='staging'
) }}
*/

with source_data as (
    select
        salesorderid,
        revisionnumber,
        orderdate,
        duedate,
        shipdate,
        status,
        onlineorderflag,
        purchaseordernumber,
        accountnumber,
        customerid,
        salespersonid,
        territoryid,
        billtoaddressid,
        shiptoaddressid,
        shipmethodid,
        creditcardid,
        creditcardapprovalcode,
        --currencyrateid,
        --subtotal,
        --taxamt,
        --freight,
        totaldue,
        --comment,
        rowguid,
        modifieddate
    from {{ source('adventureworks-dw-413814', 'salesorderheader') }}
)

select *
from source_data
