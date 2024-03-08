with
    source_sales_order_header_sales_reason as (
        select
            cast(salesorderid as int) as id_sales_order
            , cast(salesreasonid as int) as id_sales_reason
            , cast(left(cast(modifieddate as string), 10) as date) as dt_modified
        from {{source('adventureworks-dw-413814', 'salesorderheadersalesreason' )}}
    )
select *
from source_sales_order_header_sales_reason