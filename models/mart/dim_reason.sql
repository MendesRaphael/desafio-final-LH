with 
    stg_sales_reason as (
        select 
            id_sales_reason
            , reason_name
            , reason_type
            , dt_modified
        from {{ ref('stg_sap__sales_reason') }}
    )

select *
from stg_sales_reason