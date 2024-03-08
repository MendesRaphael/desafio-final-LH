with
    stg_address as (
        select *
        from {{ ref('stg_sap__address') }}
    )

    , stg_state_province as (
        select *
        from {{ ref('stg_sap__state_province') }}
    )

    , stg_country_region as (
        select *
        from {{ ref('stg_sap__country_region') }}
    )

    , joined_tables as (
        select 
            stg_address.id_address
            , stg_address.city
            , stg_address.address_line_1
            , stg_address.address_line_2
            , stg_address.postal_code
            , stg_address.spatial_location
            , stg_address.dt_modified
            , stg_state_province.id_state_province
            , stg_state_province.id_territory
            , stg_state_province.ds_state
            , stg_state_province.flg_is_only_state_province
            , stg_state_province.cd_state_province
            , stg_state_province.cd_country_region
            , stg_state_province.txt_row_guid
            , stg_country_region.country_name
        from stg_state_province
        left join stg_country_region 
            on stg_state_province.cd_country_region = stg_country_region.cd_country_region
        left join stg_address
            on stg_state_province.id_state_province = stg_address.id_state_province
    )
    
select *
from joined_tables