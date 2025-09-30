{{config(materialized='table')}}



with cte_customers as (

   select * from {{ref('ref1')}}
),

cte_orders as (
    select 
        user_id as cust_id,
        count(*) as cx,
        min(order_date) as first_purchase,
        max(order_date) as recent_purchase
    from raw.jaffle_shop.orders
    group by user_id
),

built as (
    select 
        customers.cust_id,
        customers.first_name,
        orders.first_purchase,
        orders.recent_purchase,
        orders.cx
    from cte_customers as customers
    left join cte_orders as orders
        on customers.cust_id = orders.cust_id
)

select * from built