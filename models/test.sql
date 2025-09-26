select *
from 
{{source('named','bike')}}
limit 10;