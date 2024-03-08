with
    source_sales_person as (
        select
            cast(businessentityid as int) as id_sales_person
            , cast(territoryid as int) as id_territory
            , cast(salesquota as int) as sales_quota
            , cast(bonus as int) as bonus
            , cast(commissionpct as int) as commission_pct
            , cast(salesytd as float64) as sales_ytd
            , cast(saleslastyear as int) as sales_last_year
            , cast(rowguid as string) as txt_row_guid	
            , cast(left(cast(modifieddate as string), 10) as date) as dt_modified
        from {{ source('adventureworks-dw-413814', 'salesperson' ) }}
    )

select *
from source_sales_person