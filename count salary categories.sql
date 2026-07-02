select  'High Salary' as category,sum( income > 50000 )
AS accounts_count
from Accounts
union all 
select 'Low Salary',sum(income < 20000 )
from Accounts 
union all 
select 'Average Salary',sum(income > 20000 and income <= 50000 )
from accounts;