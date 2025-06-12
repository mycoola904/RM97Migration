---  Check locations against source customers
select count(1) SourceCount
from ConversionData.dbo.cust 

select count(1) ConvertedCount
from CustomerLocations cl

-- Customer Exceptions
drop table if exists CustomerExceptions 

select cu.c_id_alpha, cu.C_NAME, cu.B_NAME
into CustomerExceptions
from ConversionData.dbo.cust cu
left join CustomerLocations cl on cl.C_ID = cu.c_id 
where cl.C_ID is null

select *
from CustomerExceptions