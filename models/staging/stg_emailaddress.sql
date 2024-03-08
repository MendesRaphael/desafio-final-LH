with source_data as (
    select
        *
    from {{ source('adventureworks-dw-413814', 'emailaddress') }}
)

select *
from source_data
