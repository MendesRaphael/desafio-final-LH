with
    source_sales_reason as (
        select
            cast(salesreasonid as int) as id_sales_reason
            , cast(name as string) as reason_name
            , cast(reasontype as string) as reason_type
            , cast(left(cast(modifieddate as string), 10) as date) as dt_modified
        from {{source('adventureworks-dw-413814', 'salesreason' )}}
    )
select *
from source_sales_reason