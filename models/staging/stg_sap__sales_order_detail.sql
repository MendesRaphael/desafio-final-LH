with
    source_sales_order_detail as (
        select
            cast(salesorderid as int) as id_sales_order
            , cast(productid as int) as id_product
            , cast(salesorderdetailid as int) as id_sales_order_detail
            , cast(specialofferid as int) as id_special_offer
            , cast(orderqty as int) as order_qty 
            , cast(unitprice as int) as unit_price
            , cast(unitpricediscount as int) as unit_price_discount
            , cast(rowguid as string) as txt_row_guid
            , cast(left(cast(modifieddate as string), 10) as date) as dt_modified
        from {{source('adventureworks-dw-413814', 'salesorderdetail' )}}
    )

select *
from source_sales_order_detail