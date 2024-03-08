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
        name,
        productnumber,
        makeflag,
        finishedgoodsflag,
        color,
        safetystocklevel,
        reorderpoint,
        standardcost,
        listprice,
        size,
        sizeunitmeasurecode,
        weightunitmeasurecode,
        weight,
        daystomanufacture,
        productline,
        class,
        style,
        productsubcategoryid,
        productmodelid,
        sellstartdate,
        sellenddate,
        discontinueddate,
        rowguid,
        date(modifieddate) as modifieddate
    from {{ source('adventureworks-dw-413814', 'product') }}
)

select *
from source_data