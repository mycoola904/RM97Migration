select *
from Child ch
inner join CustomerLocations cl on cl.c_id = ch.C_ID

select cl.*
from CustomerLocations cl
left join (select * from child where MigrationStatus = 'Active') ch on ch.C_ID = cl.C_ID 
where ch.c_id is  null

select *
from
(select * from child where MigrationStatus = 'Active') ch
left join CustomerLocations cl on cl.c_id = ch.C_ID
where cl.c_id is null



select *
from
(select * from account where MigrationStatus = 'Active') a
left join CustomerLocations cl on cl.c_id = a.C_ID
where cl.c_id is null

select count(1)
from CustomerLocations 

select sum(num)
from
(
select count(1) num
from Account
where MigrationStatus = 'Active'
union
select count(1) num
from Child
where MigrationStatus = 'Active'
) t

select count(1)
from
(
select C_ID
from Account
where MigrationStatus = 'Active'
union
select C_ID
from Child
where MigrationStatus = 'Active'
) t
left join CustomerLocations cl on cl.C_ID = t.C_ID
where cl.C_ID is null