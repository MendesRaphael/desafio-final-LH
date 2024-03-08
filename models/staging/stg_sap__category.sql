with
    source_product_category as (
        select
        cast(productcategoryid as int) as id_product_category
            , cast(name as string) as name_category
            , cast(rowguid as string) as txt_row_guid
            , cast(left(cast(modifieddate as string), 10) as date) as dt_modified
        from {{ source('adventureworks-dw-413814', 'productcategory' ) }}
            
    )
select *
from source_product_category