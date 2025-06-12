	select sum(C_CUR_BAL)
	from ConversionData.dbo.CUST

	select sum(amount)
	from ARAge


	select sum(NettDocumentValue)
	from ARBalances 


	select sum(total)
	from
	(
	select ar.c_id, ar.C_ID_ALPHA ,sum(NettDocumentValue) Total
	from ARBalances ar
	inner join (select c_id from ConversionData.dbo.cust) cu on cu.C_ID = ar.C_ID
	group by ar.c_id, ar.C_ID_ALPHA 
	) t

	select aa.c_id, sum(amount)
	from ARAge aa
	inner join (
	select ar.c_id, ar.C_ID_ALPHA ,sum(NettDocumentValue) Total
	from ARBalances ar
	inner join (select c_id from ConversionData.dbo.cust) cu on cu.C_ID = ar.C_ID
	group by ar.c_id, ar.C_ID_ALPHA 
	)t on t.C_ID = aa.C_ID
	group by aa.C_ID

	select t1.*, t.Total, t.C_ID_ALPHA
	from
	(
	select aa.c_id, sum(amount) total
	from ARAge aa
	group by aa.C_ID
	)t1
	inner join (select ar.c_id, ar.C_ID_ALPHA ,sum(NettDocumentValue) Total
	from ARBalances ar
	group by ar.c_id, ar.C_ID_ALPHA 
	)t on t.C_ID = t1.C_ID
	where t1.total <> t.Total

	----SELECT C_ID, SUM(NettDocumentValue)
	----FROM ARBalances
	----GROUP BY C_ID

	select *
	from ConversionData.dbo.cust 
	where c_id = 112

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