drop table if exists ServiceCodeDetail


select row_number() over(order by sh.servicecode) id, sh.*, sd.size, sd.unit, sd.action, sd.frequency,
CASE 
WHEN ISNULL(SD.size, '')='' THEN  SH.ServiceCode
ELSE SH.ServiceCode + '|' + sd.size end ServiceMap
, sd.container
into ServiceCodeDetail
from ServicesHeader sh
inner join ServiceDetail sd on sd.name = sh.ServiceCode