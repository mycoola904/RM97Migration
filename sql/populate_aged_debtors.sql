	/* 
		Script to populate Aged Debtors data
		edited by: 	Me
		date:		2024-10-21

		edited for Gauthier to remove the unapplied credits
	*/
	IF EXISTS(SELECT * FROM sys.tables WHERE SCHEMA_NAME(schema_id) LIKE 'dbo' AND name like 'ARAge')  
	DROP TABLE [dbo].ARAge; 


	create table ARAge (
	ID int identity(1,1),
	C_ID int,
	InvoiceDate Date,
	DueDate Date,
	Amount numeric(18,5),
	Age varchar(20)
	);

	--arage c_id, InvoiceDate, DueDate, CurDue Amount, 'CurDue' [Age]


	insert into ARAge (c_id, InvoiceDate, DueDate, Amount,  [Age])
	select c_id, cast(getdate() as date) InvoiceDate, cast(getdate() as date) DueDate
	, isnull(C_UN_BILL, 0) + isnull(C_CUR_DUE, 0) + isnull(C_FIN_CHG, 0)   Amount, 'CurDue' Age
	from ConversionData.dbo.cust c 
	where C_CUR_BAL <> 0 and isnull(C_UN_BILL, 0) + isnull(C_CUR_DUE, 0) + isnull(C_FIN_CHG, 0)  <> 0


	insert into ARAge (c_id, InvoiceDate, DueDate, Amount,  [Age])
	select c_id, cast(getdate()-15 as date) InvoiceDate, cast(getdate()-15 as date) DueDate
	, isnull(C_15D, 0) Amount, '15day' Age
	from ConversionData.dbo.cust c 
	where C_CUR_BAL <> 0 and isnull(C_15D, 0) <> 0

	insert into ARAge (c_id, InvoiceDate, DueDate, Amount,  [Age])
	select c_id, cast(getdate()-30 as date) InvoiceDate, cast(getdate()-30 as date) DueDate
	, isnull(C_30D, 0) Amount, '30day' Age
	from ConversionData.dbo.cust c 
	where C_CUR_BAL <> 0 and isnull(C_30D, 0) <> 0

	insert into ARAge (c_id, InvoiceDate, DueDate, Amount,  [Age])
	select c_id, cast(getdate()-45 as date) InvoiceDate, cast(getdate()-45 as date) DueDate
	, isnull(C_45D, 0) Amount, '45day' Age
	from ConversionData.dbo.cust c 
	where C_CUR_BAL <> 0 and isnull(C_45D, 0) <> 0

	insert into ARAge (c_id, InvoiceDate, DueDate, Amount,  [Age])
	select c_id, cast(getdate()-60 as date) InvoiceDate, cast(getdate()-60 as date) DueDate
	, isnull(C_60D, 0) Amount, '60day' Age
	from ConversionData.dbo.cust c 
	where C_CUR_BAL <> 0 and isnull(C_60D, 0) <> 0

	insert into ARAge (c_id, InvoiceDate, DueDate, Amount,  [Age])
	select c_id, cast(getdate()-90 as date) InvoiceDate, cast(getdate()-90 as date) DueDate
	, isnull(C_90D, 0) Amount, '90day' Age
	from ConversionData.dbo.cust c 
	where C_CUR_BAL <> 0 and isnull(C_90D, 0) <> 0

	insert into ARAge (c_id, InvoiceDate, DueDate, Amount,  [Age])
	select c_id, cast(getdate()-120 as date) InvoiceDate, cast(getdate()-120 as date) DueDate
	, isnull(C_120D, 0) Amount, '120day' Age
	from ConversionData.dbo.cust c 
	where C_CUR_BAL <> 0 and isnull(C_120D, 0) <> 0


	insert into ARAge (c_id, InvoiceDate, DueDate, Amount,  [Age])
	select c_id, cast(getdate()-150 as date) InvoiceDate, cast(getdate()-150 as date) DueDate
	, isnull(C_150D, 0) Amount, '150day' Age
	from ConversionData.dbo.cust c 
	where C_CUR_BAL <> 0 and isnull(C_150D, 0) <> 0


	IF EXISTS(SELECT * FROM sys.tables WHERE SCHEMA_NAME(schema_id) LIKE 'dbo' AND name like 'ARBalances')  
	DROP TABLE [dbo].ARBalances; 

	

	SELECT 
	row_number() over(order by a.c_id) id,
	b.ARAccountCode
	, CASE
	WHEN ar.Amount > 0 THEN 'I'
	ELSE 'C' END AS 'DocumentType'
	, 'DOC' + cast(ar.id+1000 as varchar) DocumentNumber

	--CASE
	--		WHEN LEN((0 + row_number() Over (order by a.C_ID))) = 1 THEN 'DOC' +CONVERT (varchar, a.B_BILL_CO) + '00000'+ CONVERT(varchar, (0 + row_number() Over (order by a.C_ID)))
	--		WHEN LEN((0 + row_number() Over (order by a.C_ID))) = 2 THEN 'DOC' +CONVERT (varchar, a.B_BILL_CO) + '0000'+ CONVERT(varchar, (0 + row_number() Over (order by a.C_ID)))
	--		WHEN LEN((0 + row_number() Over (order by a.C_ID))) = 3 THEN 'DOC' +CONVERT (varchar, a.B_BILL_CO) + '000'+ CONVERT(varchar, (0 + row_number() Over (order by a.C_ID)))
	--		WHEN LEN((0 + row_number() Over (order by a.C_ID))) = 4 THEN 'DOC' +CONVERT (varchar, a.B_BILL_CO) + '00'+ CONVERT(varchar, (0 + row_number() Over (order by a.C_ID)))
	--		WHEN LEN((0 + row_number() Over (order by a.C_ID))) = 5 THEN 'DOC' +CONVERT (varchar, a.B_BILL_CO) + '0'+ CONVERT(varchar, (0 + row_number() Over (order by a.C_ID)))
	--		ELSE 'DOC' +CONVERT (varchar, a.B_BILL_CO) + CONVERT(varchar, (0 + row_number() Over (order by a.C_ID)))  END AS 'DocumentNumber'
	-- ======================================================================================
	, ar.InvoiceDate 'DocumentDate'
	, ar.duedate 'DueDate'
	, round(ar.Amount, 2) 'NettDocumentValue'
	, b.CompanyOutlet
	----------------------------
	,a.[C_ID]
	,a.[C_ID_ALPHA]
	,[C_CUR_BAL]
	,[C_UN_BILL]
	,[C_CUR_DUE]
	,[C_30D]
	,[C_60D]
	,[C_90D]
	,[C_FIN_CHG]
	,[B_B_CYCLE]
	,[C_15D]
	,[C_45D]
	,[C_120D]
	,[C_150D]
	,[C_LST_PAY]
	,[C_LST_DATE]
	,[C_PRV_BAL]
	into ARBalances
	--select a.*
	FROM ConversionData.dbo.[CUST] a
	LEFT JOIN (select * from CustomerLocations where cast(c_id as varchar) = uniqref) b on a.C_Id = b.C_Id
	inner join ARAge ar on ar.C_ID = a.C_ID
	--WHERE [C_UN_BILL]+[C_CUR_DUE]+[C_30D]+[C_60D]+[C_90D] <> 0 
	ORDER BY a.C_ID;




	insert into AgedDebtorsData ( LinkID, ARAccountCode, DocumentType, DocumentNumber, DocumentDate, DueDate, NetDocumentValue, VATCode, VATRateApplied, VATAmount, GrossDocumentValue, Notes, OutstandingAmount, CompanyOutlet, 
                         Department, ReasonCode, Currency, CustomerIDs, CustomerSiteIDs, SiteNames, InvoiceLocationIDs, PaymentTypeIDs, PaymentPointIDs, ReasonIDs, AlternativeSearchReference, DMAccount, Account_id, Child_id )
	select 
	ar.id,
	ar.[ARAccountCode] 
	, [DocumentType] 
	, [DocumentNumber] 
	, [DocumentDate] 
	, [DueDate] 
	, abs([NettDocumentValue]) NetDocumentValue
	, '' [VATCode] 
	, '' [VATRateApplied] 
	, '' [VATAmount] 
	, abs([NettDocumentValue]) [GrossDocumentValue] 
	, 'Converted AR aging from DesertMicro' [Notes] 
	, abs([NettDocumentValue]) [OutstandingAmount] 
	, ar.[CompanyOutlet] 
	, '' [Department] 
	, '' [ReasonCode] 
	, '' [Currency] 
	, '' [CustomerIDs] 
	, '' [CustomerSiteIDs] 
	, '' [SiteNames] 
	, '' [InvoiceLocationIDs] 
	, '' [PaymentTypeIDs] 
	, '' [PaymentPointIDs] 
	, '' [ReasonIDs] 
	, '' [AlternativeSearchReference]
	, ar.C_ID_ALPHA [DMAccount]
	, c.Account_id
	, c.Child_id
	from ARBalances ar
	inner join CustomerLocations c on c.UniqRef = cast(ar.C_ID as varchar)

	--select CompanyOutlet
	--from CustomerLocations

    
	--select sum(C_CUR_BAL)
	--from ConversionData.dbo.CUST

	--select sum(amount)
	--from ARAge

	----SELECT CU.C_ID, CU.C_ID_ALPHA, C_CUR_BAL
	----FROM ConversionData.dbo.CUST CU
	----LEFT JOIN 
	----(
	----SELECT C_ID, SUM(AMOUNT) TOTAL
	----FROM ARAge
	----GROUP BY C_ID 
	----) AR ON AR.C_ID = CU.C_ID
	----WHERE AR.C_ID IS NULL AND CU.C_CUR_BAL <> 0

	
	----SELECT CU.C_ID, CU.C_ID_ALPHA, C_CUR_BAL, AR.TOTAL
	----FROM ConversionData.dbo.CUST CU
	----INNER JOIN 
	----(
	----SELECT C_ID, SUM(AMOUNT) TOTAL
	----FROM ARAge
	----GROUP BY C_ID 
	----) AR ON AR.C_ID = CU.C_ID 
	----WHERE ROUND(AR.TOTAL - CU.C_CUR_BAL, 2)<>0

	--select sum(NettDocumentValue)
	--from ARBalances

	----SELECT C_ID, SUM(NettDocumentValue)
	----FROM ARBalances
	----GROUP BY C_ID

	----SELECT CU.C_ID, CU.C_ID_ALPHA, C_CUR_BAL, AR.TOTAL
	----FROM ConversionData.dbo.CUST CU
	----INNER JOIN 
	----(
	----SELECT C_ID, SUM(NettDocumentValue) TOTAL
	----FROM ARBalances
	----GROUP BY C_ID
	----) AR ON AR.C_ID = CU.C_ID 
	----WHERE ROUND(AR.TOTAL - CU.C_CUR_BAL, 2)<>0

	----SELECT CU.C_ID, CU.C_ID_ALPHA, C_CUR_BAL
	----FROM ConversionData.dbo.CUST CU
	----LEFT JOIN 
	----(
	----SELECT C_ID, SUM(NettDocumentValue) TOTAL
	----FROM ARBalances
	----GROUP BY C_ID
	----) AR ON AR.C_ID = CU.C_ID 
	----WHERE AR.C_ID IS NULL AND CU.C_CUR_BAL <> 0

	--select  sum(
	--case 
	--when ad.DocumentType = 'C' then -NetDocumentValue
	--else NetDocumentValue end) Amount
	--from AgedDebtorsData ad



	--select ad.DMAccount, sum(
	--case 
	--when ad.DocumentType = 'C' then -NetDocumentValue
	--else NetDocumentValue end) Amount
	--from AgedDebtorsData ad
	--group by ad.DMAccount

	--select t1.*
	--from
	--(
	--	select ad.C_ID_ALPHA DMAccount, sum(NettDocumentValue) Amount
	--	from ARBalances ad
	--	group by C_ID_ALPHA
	--) t1

	--select t2.*
	--from
	--(
	--	select ad.DMAccount, sum(
	--	case 
	--	when ad.DocumentType = 'C' then -NetDocumentValue
	--	else NetDocumentValue end) Amount
	--	from AgedDebtorsData ad
	--	group by ad.DMAccount
	--) t2


	--select t1.*, t2.Amount
	--from
	--(
	--	select ad.C_ID_ALPHA DMAccount, sum(NettDocumentValue) Amount
	--	from ARBalances ad
	--	group by C_ID_ALPHA
	--) t1
	--inner join
	--(
	--	select ad.DMAccount, sum(
	--	case 
	--	when ad.DocumentType = 'C' then -NetDocumentValue
	--	else NetDocumentValue end) Amount
	--	from AgedDebtorsData ad
	--	group by ad.DMAccount
	--) t2 on t2.DMAccount = t1.DMAccount 
	--where round(t2.Amount - t1.Amount, 2) <> 0