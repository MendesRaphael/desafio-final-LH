with
    source_countryregion as (
        select
            cast(countryregioncode as string) as cd_country_region
            , cast(name as string) as country_name
            , cast(left(cast(modifieddate as string), 10) as date) as dt_modified
        from {{source('adventureworks-dw-413814', 'countryregion' )}}
    )
    select *
    from source_countryregion