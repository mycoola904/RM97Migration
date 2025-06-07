/* update frequencies */

update ad 
set ad.frequency= cast(f.freq as varchar) + ' per week'
-- select ad.DMAccount, frequency, f.freq
from AutoDetails ad
inner join (
select x.AUTOID, count(distinct x.STOPID) freq
from ConversionData.dbo.XAUS x
inner join ConversionData.dbo.rxrf rx on rx.STOPID = x.STOPID
where dbo.fn_IsSingleDayRoute(rx.ROUTEID) = 1 and rx.FREQUENCY in ('E','1W')
group by x.AUTOID
) f on f.AUTOID = ad.AUTOID
where ad.frequency = ''



select *
from AutoDetails
where frequency = ''

/* preliminary routing */

select aa.autoid, rx.stopid, rx.ROUTEID
from ActiveAuto aa
inner join ConversionData.dbo.XAUS x on x.AUTOID = aa.AUTOID
inner join ConversionData.dbo.RXRF rx on rx.STOPID = x.STOPID


drop table if exists TempAssignments 

	select 
	 soh.id SiteOrderUniqueRef,
	 'Service' Action,
	 case 
	when isnull(rt.mon,0) = 1 then 1
	when isnull(rt.tue,0) = 1 then 2
	when isnull(rt.wed,0) = 1 then 3
	when isnull(rt.thu,0) = 1 then 4
	when isnull(rt.fri,0) = 1 then 5
	when isnull(rt.sat,0) = 1 then 6
	when isnull(rt.sun,0) = 1 then 7
	end [DayOfWeek],
	 isnull(rt.ROUTENUM,'') RouteTemplate,
	 rx.Stop Position,
	 case 
	 when isnull(rx.Frequency,'') = 'E' then '1W' else isnull(rx.frequency,'') end PickUpInterval,
	 soh.ContainerType ContainerType,
	 isnull(rx.NEXT_DATE,'') StartDate,
	 'Routed' RoutedOrScheduled,
	 '' MinLiftQuantity,
	 '' RequiresQuantity,
	 '' NextDueDate,
	 rx.COMMENT Notes,
	 '' SJVehicle,
	 '' SJDriver,
	 --'' AgreeNbr,
	 soh.DMAccount
	 ,rx.STOPID
	 --into TempAssignments
	 -- 	 select count(1)
	 from SiteOrderHeader soh
	 inner join CustomerServiceAgreementPrices sap on sap.id = soh.ServiceID
	 inner join (
		 select aa.autoid, rx.stopid, rx.ROUTEID
			from ActiveAuto aa
			inner join ConversionData.dbo.XAUS x on x.AUTOID = aa.AUTOID
			inner join ConversionData.dbo.RXRF rx on rx.STOPID = x.STOPID
		 ) t on t.AutoID = sap.AutoID
	 inner join ConversionData.dbo.RXRF rx on rx.STOPID = t.STOPID
	 inner join ConversionData.dbo.RTES rt on rt.ROUTEID = t.ROUTEID
	 where dbo.fn_IsSingleDayRoute(rt.ROUTEID) <> 1

	 select * from tempassignments
	 /* on-call containers */

	 select *
	 from SiteOrderAssignments

	 /* container template */
select row_number() over(order by cd.cand_id) ContRefId
,cd.CONNUMBER ContainerSerialNo
,cv.ContainerType
, '' TagReference
, cd.COMMENT Notes
,cv.company CompanyOutlet
,  cast(cd.PLACED as date) DateOfDelivery
, soh.id SiteOrderUniqueRef
, '' Commercial
, '1' BinOnSiteNumber
, sap.AgreeNbr
, soh.DMAccount
--Into TempContainers
from ConversionData.dbo.CANG cg
inner join ConversionData.dbo.cand cd on cd.CONGRPUID = cg.CONGRPUID
inner join ConversionData.dbo.CCAN cc on cc.CONGRPUID = cg.CONGRPUID
inner join ConversionData.dbo.XAUS x on x.STOPID = cc.STOPID
inner join CustomerServiceAgreementPrices sap on sap.AutoID = x.AUTOID
inner join Container_View cv on cv.CONTID = cg.CONTID
--inner join AutoDetails ad on ad.SIZE = cv.Size and ad.c_id = cg.C_ID
--inner join Pricing p on p.autoid = ad.AUTOID
--inner join AgreeNumber an on an.GroupKey = p.GroupKey
inner join SiteOrderHeader soh on soh.autoid = sap.AutoID
group by 
cd.CAND_ID
,cd.CONNUMBER 
,cv.ContainerType
, cd.COMMENT 
,cv.company 
,  cast(cd.PLACED as date) 
, soh.id 
, sap.AgreeNbr
, soh.DMAccount