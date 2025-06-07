    
	select sum(C_CUR_BAL)
	from ConversionData.dbo.CUST

	select sum(amount)
	from ARAge

	select sum(NettDocumentValue)
	from ARBalances


	--select *
	--from
	--(
	--select c_id, count(1) num
	--from ARAge
	--group by C_ID
	--) t
	--inner join 
	--(	
	--select c_id, count(1) num
	--from ARBalances
	--group by C_ID
	--) t1 on t.C_ID = t1.C_ID and t.num <> t1.num

	--select *
	--from ARBalances
	--where c_id = 31194

	--select *
	--from Customers
	--where c_id_alpha like '11004%'

	select  sum(
	case 
	when ad.DocumentType = 'C' then -NetDocumentValue
	else NetDocumentValue end) Amount
	from AgedDebtorsData ad