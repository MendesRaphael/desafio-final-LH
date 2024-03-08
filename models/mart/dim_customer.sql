with 
    stg_person as (
        select
            id_person
            , title
            , full_name
        from {{ref('stg_sap__person')}}
    )
    
    , stg_customer as (
        select 
            id_customer
            , id_person
            , id_store
            , id_territory
        from {{ref('stg_sap__customer')}}
    )

    , stg_store as (
        select 
            id_store
            , ds_store
        from {{ref('stg_sap__store')}}
    )
    
    , transformed as (
        select
            stg_customer.id_customer
            , stg_person.id_person
            , stg_customer.id_territory
            , stg_customer.id_store
            , stg_person.full_name
            , stg_store.ds_store
        from stg_customer
        left join stg_store on stg_customer.id_store = stg_store.id_store
        inner join stg_person on stg_customer.id_person = stg_person.id_person
        
    )

    , int_location as (
        select *
        from {{ ref('int__location_joined') }}
    )

    , business_entity_adress as (
        select
            id_address
            , id_business_entity
        from {{ ref('stg_sap__business_entity_address') }}
        where id_address_type = 2 /* Home address code */
    )

    , joined_transformed as (
        select
            transformed.id_customer
            , transformed.id_person
            , transformed.id_territory
            , transformed.full_name
            , transformed.id_store
            , transformed.ds_store
            , int_location.id_address as id_home_address
            , int_location.city
            , int_location.ds_state
            , int_location.country_name
            , int_location.cd_state_province
            , int_location.cd_country_region
        from  transformed 
        left join business_entity_adress as bda on transformed.id_person = bda.id_business_entity
        left join int_location on bda.id_address = int_location.id_address
    )

select *
from joined_transformed