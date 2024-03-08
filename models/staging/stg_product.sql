-- models/stg_product.sql

-- define a staging table for product data
-- this table will hold raw data before transformation

{{ config(
    materialized='table',
    schema='staging'
) }}

with source_data as (
    select
        productid,
        name as product_name,
        productnumber,
        makeflag,
        finishedgoodsflag,
        color,
        safetystocklevel,
        reorderpoint,
        standardcost,
        listprice,
        size as product_size,
        sizeunitmeasurecode,
        weightunitmeasurecode,
        weight,
        daystomanufacture,
        case 
            when productline = 'R' then 'Road'
            when productline = 'M' then 'Mountain'
            when productline = 'T' then 'Touring'
            when productline = 'S' then 'Standard'
            else productline
        end as productline,
        case 
            when class = 'H' then 'High'
            when class = 'M' then 'Medium'
            when class = 'L' then 'Low'
            else class
        end as class,
        case 
            when Style = 'W' then 'Womens'
            when Style = 'M' then 'Mens'
            when Style = 'U' then 'Universal'
            else Style
        end as Style,
        productsubcategoryid,
        productmodelid,
        sellstartdate,
        sellenddate,
        discontinueddate,
        rowguid,
        modifieddate
    from {{ source('adventureworks-dw-413814', 'product') }}
)

select *
from source_data
