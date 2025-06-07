--  Check Counts

 select sum(1)
 from ConversionData.dbo.CUST 

--select c.* 
--from ConversionData.dbo.CUST c 
--left join Account a  on a.C_ID = c.C_ID
--where a.id is null


   select sum(num)
   from
   (
   select count(1) num, 'accts' typ
   from Account 
   union
   select count(1) num, 'child' typ
   from Child 
   ) t


    select cu.C_ID_ALPHA, cu.*
   from ConversionData.dbo.CUST  cu
   left join
    (
   select C_ID
   from Account 
   union
   select C_ID
   from Child 
   ) t on t.C_ID = cu.C_ID
   where t.C_ID is null

  --select 23001 - 22987

  ---- Seven GrandChildren
  select c_id_alpha 
  from ConversionData.dbo.cust cu
  left join
  (
  select c_id 
  from Account
  union 
  select c_id 
  from child 
  ) t on t.C_ID = cu.C_ID
  where t.C_ID is null
  and C_ID_ALPHA like '%-%-%'


    select c_id_alpha 
  from ConversionData.dbo.cust cu
  left join
  (
  select c_id 
  from Account
  union 
  select c_id 
  from child 
  ) t on t.C_ID = cu.C_ID
  where  C_ID_ALPHA like '%-%-%'