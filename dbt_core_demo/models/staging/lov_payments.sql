with source as (
 {#-
 Normally we would select from the table here, but we are using seeds to load
 our data in this project
 #}
  select * from {{ source('dbt_bq_example','raw_customers') }}
  ),

  renamed as (
      select
           *
           from source
           )
        select * from renamed