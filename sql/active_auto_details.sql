	drop table if exists ActiveAuto 
	
	select cu.C_ID_ALPHA DMAccount, co.SVC_CODE_ALPHA ServiceCode, co.DESCRIPT ServiceDescription, bc.Description BillingCycle
	, sc.data ServiceCategory, um.DATA UnitOfMeasure
	, a.*
	into ActiveAuto
	--select distinct cu.c_id_alpha--, st.description, st.status
	-- select count(1)
	from  ConversionData.dbo.AUTO a 
	inner join ConversionData.dbo.CODE co on co.SVC_CODE = a.SVC_CODE
	inner join ConversionData.dbo.cust cu on cu.c_id = a.C_ID
	--inner join (select distinct c_id, CustomerSiteState from CustomerLocations) cl on cl.C_ID = cu.C_ID
	--where cl.C_ID is null 
	inner join Status st on st.StatusID = cu.C_CSTAT
	left join BillingCycle bc on bc.BillingCycleID = a.BILLCYCLE
	inner join ConversionData.dbo.udef sc on sc.UNIQUE_ID = co.CATEGORY
	inner join ConversionData.dbo.udef um on um.UNIQUE_ID = co.UNITMEASUR
	where  (a.STOPDATE is null or cast(a.STOPDATE as date) > cast(getdate() as date) )
	and st.Description = 'ActiveAuto'
	AND A.PRORATE <> 'Y'  


	drop table if exists ServicesHeader

	select max(dmaccount) DMAccount, count(AUTOID) [# Used], ServiceCode,  ServiceDescription, ServiceCategory, UnitOfMeasure
	into ServicesHeader
	from ActiveAuto
	group by ServiceCode,  ServiceDescription, ServiceCategory, UnitOfMeasure