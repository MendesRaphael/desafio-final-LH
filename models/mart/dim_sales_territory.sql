with
    stg_sales_territory as (
        select 
            id_territory
            , ds_territory
            , cd_country_region
            , group_territory
            , sale_sytd
            , sales_last_year
            , cost_ytd
            , cost_last_year
            , txt_row_guid
            ,  dt_modified
        from {{ ref('stg_sap__sales_territory') }}
    )
       , transformed as (
        select
            stg_sales_territory. id_territory
            , stg_sales_territory.ds_territory
            , stg_sales_territory.cd_country_region
            , stg_sales_territory.group_territory
            , stg_sales_territory.sale_sytd
            , stg_sales_territory.cost_ytd
            , stg_sales_territory.cost_last_year
            , stg_sales_territory.txt_row_guid
            , stg_sales_territory.dt_modified
        from stg_sales_territory
            
    )
select *
from transformed