with
    source_state_province as (
        select
            cast(stateprovinceid as int) as id_state_province
            , cast(territoryid as int) as id_territory
            , cast(name as string) as ds_state
            , cast(isonlystateprovinceflag as boolean) as flg_is_only_state_province
            , cast(stateprovincecode as string) as cd_state_province
            , cast(countryregioncode as string) as cd_country_region
            , cast(left(cast(modifieddate as string), 10) as date) as dt_modified
            , cast(rowguid as string) as txt_row_guid
        from {{source('adventureworks-dw-413814', 'stateprovince' )}}
    )
select *
from source_state_province