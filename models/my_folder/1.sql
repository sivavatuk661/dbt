select 
    CUSTOMER_ID,
    sum(ORDER_AMOUNT) as revenue
from raw.public.transactions
group by CUSTOMER_ID