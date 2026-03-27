with cte_customers as (
    select 
        id as cust_id,
        first_name,
        last_name 
    from raw.jaffle_shop.customers
)
select *
from cte_customers