with
    source_employee as (
        select
            cast(businessentityid as int) as id_sales_person
            , cast(nationalidnumber as string) as id_nacional_number
            , cast(birthdate as date) as birth_date
            , cast(maritalstatus as string) as marital_status
            , cast(gender as string) as gender
            , cast(hiredate as date) as hire_date
            , cast(salariedflag as boolean) as salaried_flag
            , cast(sickleavehours as int) as sick_leave_hours
            , cast(currentflag as int) as current_flag
            , cast(vacationhours as int) as vacation_hours
            , cast(rowguid as string) as txt_row_guid	
            , cast(left(cast(modifieddate as string), 10) as date) as dt_modified
        from {{ source('adventureworks-dw-413814', 'employee' ) }}
    )

select *
from source_employee