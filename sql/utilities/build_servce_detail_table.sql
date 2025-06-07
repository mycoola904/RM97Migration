	select ROW_NUMBER() over(order by co.SVC_CODE_ALPHA) id, max(C_ID_ALPHA) DMAccount, count(cu.C_ID) '# Used', co.SVC_CODE_ALPHA ServiceCode, co.DESCRIPT ServiceDescription
	, sc.data ServiceCategory, co.LINKSTAT, '' Size, '' Unit, '' Action, '' Frequency, '' ServiceMap 
	, '' Container, '' Type, um.DATA UnitOfMeasure
	--select distinct cu.c_id_alpha--, st.description, st.status
	-- select count(1)
	from  ConversionData.dbo.AUTO a 
	inner join ConversionData.dbo.CODE co on co.SVC_CODE = a.SVC_CODE
	inner join ConversionData.dbo.cust cu on cu.c_id = a.C_ID
	--inner join (select distinct c_id, CustomerSiteState from CustomerLocations) cl on cl.C_ID = cu.C_ID
	--where cl.C_ID is null 
	inner join ModMigration.dbo.Status st on st.StatusID = cu.C_CSTAT
	left join ModMigration.dbo.BillingCycle bc on bc.BillingCycleID = a.BILLCYCLE
	inner join ConversionData.dbo.udef sc on sc.UNIQUE_ID = co.CATEGORY
	inner join ConversionData.dbo.udef um on um.UNIQUE_ID = co.UNITMEASUR
	where  (a.STOPDATE is null or cast(a.STOPDATE as date) > cast(getdate() as date) )
	and st.Description = 'ActiveAuto'
	AND A.PRORATE <> 'Y'  
	group by co.SVC_CODE_ALPHA , co.DESCRIPT 
	, sc.data , co.LINKSTAT,  um.DATA 
	order by co.SVC_CODE_ALPHA