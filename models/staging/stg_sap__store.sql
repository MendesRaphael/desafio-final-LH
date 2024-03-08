with
    source_store as (
        select
            cast(businessentityid as int) as id_store
            , cast(name as string) as ds_store
            , cast(left(cast(modifieddate as string), 10) as date) as dt_modified
        from {{ source('adventureworks-dw-413814', 'store' ) }}
    )

select *
from source_store