{{
  config
    (
      tags=["customer_order"],
      materialized = 'incremental',
      incremental_strategy = 'insert_overwrite',
      partition_by = {'field': 'first_order', 'data_type': 'DATETIME'}

          )
          }}

          with orders as (

              -- select * from {{ ref('lov_orders') }}
               select * from {{ db_source('lov_orders') }}
          ),
          final as (

             select
                     user_id,
                     cast(min(order_date) as DATETIME) as first_order,
                     max(order_date) as most_recent_order,
                     count(orders) as number_of_orders
             from orders

             group by 1

             )
             select * from final