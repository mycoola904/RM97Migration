
-- This table is to filter out fees and surcharges
drop table if exists AutoxStopWorking

select soh.autoid, rx.STOPID, rx.ROUTEID, soh.DMAccount, action, soh.ServiceCode, soh.ServiceDescription
into AutoxStopWorking
-- select distinct sap.action
from ConversionData.dbo.RXRF rx
inner join ConversionData.dbo.cust cu on cu.c_id = rx.C_ID
inner join (
			select distinct C_ID
			from SiteOrderHeader soh
			inner join (
						select c_id, C_ID_ALPHA 
						from CustomerLocations cl
						where cl.UniqRef = cast(cl.C_ID as varchar)
						) cl on cl.C_ID_ALPHA = soh.DMAccount
			) Cust on cust.C_ID = rx.C_ID
inner join SiteOrderHeader soh on soh.DMAccount = cu.C_ID_ALPHA
inner join CustomerServiceAgreementPrices sap on sap.AgreeNbr = soh.AgreeNbr
where action  in ('Service', 'Rent')
-- where cust.C_ID is null  -- for a left join testing


--select autoid, DMAccount
--from AutoxStopWorking
--group by autoid, DMAccount
--having count(autoid)>1


-- Temp Assignments
drop table if exists TempAssignments 

select 
	row_number() over(order by soh.id) SOAssignmentId,
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
	when isnull(rx.Frequency,'') = 'E' then '1W' 
	when isnull(rx.Frequency,'') in ('A','B') then 'EOW' 
	else isnull(rx.frequency,'') end PickUpInterval,
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
	into TempAssignments
	-- 	 select count(1)
	from SiteOrderHeader soh
	inner join CustomerServiceAgreementPrices sap on sap.id = soh.ServiceID
	inner join (
		select autoid, stopid, ROUTEID
		from AutoxStopWorking
		) t on t.AutoID = sap.AutoID
	inner join ConversionData.dbo.RXRF rx on rx.STOPID = t.STOPID
	inner join ConversionData.dbo.RTES rt on rt.ROUTEID = t.ROUTEID


insert into SiteOrderAssignments(SiteOrderUniqueRef, Action, DayOfWeek, RouteTemplate, Position, PickUpInterval, ContainerType, StartDate, RoutedOrScheduled, MinLiftQuantity, RequiresQuantity, NextDueDate, Notes, SJVehicle, SJDriver, DMAccount, STOPID)
	select SiteOrderUniqueRef, Action, DayOfWeek, RouteTemplate,
	case 
	when Position = 'E' then 0
	else Position end Position, PickUpInterval, ContainerType, StartDate, RoutedOrScheduled, MinLiftQuantity, RequiresQuantity, NextDueDate, Notes, SJVehicle, SJDriver, DMAccount, STOPID
	from TempAssignments