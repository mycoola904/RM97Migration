select *
from MasterAccount

select *
from Customers cu
where ar_account_code like '%-%-%'

-- children as customers
select count(1)
from Customers cu
inner join Child ch on ch.c_id = cu.c_id
inner join MasterAccount ma on ma.ARAccount = cu.master_ar_account_code

select *
from MasterAccount

select cu.master_ar_account_code, count(1) children
from Customers cu
inner join Child ch on ch.c_id = cu.c_id
inner join MasterAccount ma on ma.ARAccount = cu.master_ar_account_code
group by cu.master_ar_account_code

-- Parent Customers and Single Accounts
select a.MigrationStatus
from account a

select count(1)
from customers 

select sum(num)
-- select *
from
(
select count(1) num
from customers cu
inner join (select c_id from Account where MigrationStatus = 'active') a on a.C_ID = cu.c_id
union
select count(1) num
from customers cu
inner join (select c_id from child where MigrationStatus = 'active') a on a.C_ID = cu.c_id
) t