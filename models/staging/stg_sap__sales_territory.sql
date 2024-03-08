with
    source_sales_territory as (
        select
            cast(territoryid as int) as id_territory
            , cast(name as string) as ds_territory
            , cast(countryregioncode as string) as cd_country_region
            , cast('group' as string) as group_territory
            , cast(salesytd as string) as sale_sytd
            , cast(saleslastyear as int) as sales_last_year
            , cast(costytd as int) as cost_ytd
            , cast(costlastyear as int) as cost_last_year
            , cast(rowguid as string) as txt_row_guid
            , cast(left(cast(modifieddate as string), 10) as date) as dt_modified
        from {{ source('adventureworks-dw-413814', 'salesterritory' ) }}
            
    )
select *
from source_sales_territory