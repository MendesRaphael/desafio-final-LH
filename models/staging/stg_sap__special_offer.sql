with
    source_special_offer as (
        select
            cast(specialofferid as int) as id_special_offer
            , cast(discountpct as numeric) as vl_discount_percentage
            , cast(type as string) as ds_discount_type
            , cast(category as string) as ds_discount_category
            , cast(minqty as int) as vl_min_qty_for_discount
            , cast(maxqty as int) as vl_max_qty_for_discount
            , cast(left(cast(startdate as string), 10) as date) as dt_discount_start
            , cast(left(cast(enddate as string), 10) as date) as dt_discount_end
        from {{ source('adventureworks-dw-413814', 'specialoffer') }}
    )

select *
from source_special_offer