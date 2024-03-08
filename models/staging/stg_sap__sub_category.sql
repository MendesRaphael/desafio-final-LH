with
    source_sub_category as (
        select
        cast(productsubcategoryid as int) as id_product_sub_category
            , cast(productcategoryid as int) as id_product_category
            , cast(name as string) as ds_sub_category
            , cast(rowguid as string) as txt_row_guid
            , cast(left(cast(modifieddate as string), 10) as date) as dt_modified
        from {{ source('adventureworks-dw-413814', 'productsubcategory' ) }}
            
    )
select *
from source_sub_category