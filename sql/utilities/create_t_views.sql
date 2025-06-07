
/****** Object:  View [dbo].[T_CustomerServiceAgreementPrices]    Script Date: 5/26/2024 3:11:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE view [dbo].[T_CustomerServiceAgreementPrices] as
    select 
        sap.id,
        --sap.CompanyOutlet,
        AgreeNbr,
        VAT,
        cast(sap.StartDate as date) StartDate,
        '' EndDate,
        'Price|' + ContainerType ContainerType,
        PrimaryService,
        Action,
        PricingBasis,
        'Price|' + Material Material,
        'Price|' + MaterialClass MaterialClass,
        UnitOfMeasure,
        Price,
        RentalPeriod,
        MinValue,
        MinTon,
        Allowance,
        QuantityFrom,
        QuantityTill,
        PriceParentId,
        IsEstimate,
        TaxTemplateCollection,
        ARAccountCode,
        DefaultAction,
        PriceType,
        case 
		when FreqInWeeks <> '' then FreqInWeeks + ' per week' 
		else FreqInWeeks end FreqInWeeks,
        case 
		when FreqInWeeks <> '' then FreqInWeeks + ' per week' 
		else FreqInWeeks end ServiceFrequency,
        '' InactivityDaysAllowance,
        '' PriceOffset,
        '' AgreedSoldWeights,
        sap.DMAccount,
		sap.ServiceCode,
		sap.ServiceDescription
    from CustomerServiceAgreementPrices sap
GO

/****** Object:  View [dbo].[T_SiteOrderHeader]    Script Date: 5/26/2024 3:11:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE view [dbo].[T_SiteOrderHeader] as
	select 
		soh.id SiteOrderUniqueRef,
		co.Company CompanyOutlet,
		soh.ARAccountCode,
		UniqueRefNbr,
		soh.AgreeNbr,
		OrderCombinationGroup,
		soh.ContainerType,
		MaterialType,
		soh.StartDate,
		EndDateIfClosed,
		RouteOrSched,
		IsCustomerOwnedBin,
		InvoiceMethod,
		Haulier,
		DisposalPoint,
		soh.PrimaryService,
		soh.VAT,
		CustomerOrderNumber,
		LastInvoiceDate,
		DriverNotes,
		Notes2,
		Contact,
		InvoiceCycle,
		PaymentType,
		ServicePointCode,
		sap.FreqInWeeks ServiceFrequency,
		'' RentalStartDate,
		'' AgreeNbrIsOutletAgreement,
		'' OrderedBy,
		'' Origin,
		soh.DMAccount,
		soh.ServiceCode,
		soh.ServiceDescription
	-- select *
	FROM SiteOrderHeader soh
	inner join T_CustomerServiceAgreementPrices sap on sap.id = soh.ServiceID
	inner join Company co on co.id = soh.CompanyOutlet_id
GO

/****** Object:  View [dbo].[T_AgedDebtorsData]    Script Date: 5/26/2024 3:11:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




create view [dbo].[T_AgedDebtorsData] as
	select		
		ARAccountCode,
		DocumentType,
		DocumentNumber,
		DocumentDate,
		DueDate,
		ad.NetDocumentValue NettDocumentValue,
		VATCode,
		VATRateApplied,
		VATAmount,
		GrossDocumentValue,
		Notes,
		OutstandingAmount,
		CompanyOutlet,
		Department,
		ReasonCode,
		Currency,
		CustomerIDs,
		CustomerSiteIDs,
		SiteNames,
		InvoiceLocationIDs,
		PaymentTypeIDs,
		PaymentPointIDs,
		ReasonIDs,
		AlternativeSearchReference,
		ad.DMAccount		
	from AgedDebtorsData ad
GO

/****** Object:  View [dbo].[T_CallLog]    Script Date: 5/26/2024 3:11:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE view [dbo].[T_CallLog] as
	select 
		ARAccountCode,
		CustomerSite,
		cast(CallDate as date) CallDate,
		'' CallNo,
		CallType,
		Notes,
		SysUser,
		CompanyOutlet,
		isnull(cast(CallDateTime as varchar), '') CallDateTime
	-- select *
	from CallLog
GO

/****** Object:  View [dbo].[T_ContactLocations]    Script Date: 5/26/2024 3:11:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



create view [dbo].[T_ContactLocations] as
    SELECT 
        clo.ARAccountCode,
        SiteUniqueId,
        ContactUniqueId_id ContactUniqueId,
        '' SiteCode,
        '' IsPrimary,
        cl.DMAccount
        -- select count(1)
    FROM ContactLocations clo
    INNER JOIN CustomerLocations cl ON cl.UniqRef = clo.SiteUniqueId
GO

/****** Object:  View [dbo].[T_Contacts]    Script Date: 5/26/2024 3:11:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



create view [dbo].[T_Contacts] as
    select 
            ARAccountCode,
            c.id ContactUniqueId,
            Salutation,
            Forename,
            Surname,
            JobTitle,
            TelNbr,
            TelExtNbr,
            MobileNbr,
            FaxNbr,
            EmailAddress,
            Notes,
            ct.Type ContactType1,
            ContactType2,
            ContactType3,
            TelNo,
            FaxNo,
            '' IsPrimary,
            '' ReceiveServiceUpdatesByEmail,
            '' ReceiveServiceUpdatesByText,
            '' ReceiveMarketingUpdatesViaEmail,
            '' ReceiveMarketingUpdatesViaText,
            '' IsEmailBasedUsername,
            '' ContactRegistrationStatus,
            '' ActivationCode,
            '' PinCode,
            '' AccessGroup,
            '' Password
            ,CASE 
                WHEN ch.id IS NULL THEN a.C_ID_ALPHA
                ELSE ch.C_ID_ALPHA END [DMAccount]
            -- select count(1)
    from Contacts c
    LEFT JOIN Child ch ON ch.id = c.Child_id
    LEFT JOIN Account a ON a.id = c.Account_id
    inner join ContactType ct on ct.id = c.ContactType_id
GO



/****** Object:  View [dbo].[T_CustomerLocations]    Script Date: 5/26/2024 3:11:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



create view [dbo].[T_CustomerLocations] as
        select  ARAccountCode,
            UniqRef,
            SiteName,
            HouseNbr,
            Address1,
            Address2,
            Town,
            County,
            Country,
            Postcode,
            CompanyOutlet,
            TelNbr,
            FaxNbr,
            MobileNbr,
            EmailAddress,
            SICCode,
            Zone,
            AccessContact,
            DocumentDeliveryType,
            LocalAuthority,
            SiteType,
            LocationDescription,
            Latitude,
            Longitude,
            CustomerSiteState,
            '' SiteSuspendStartDate,
            SalesRepresentative,
            '' RegionCode,
            AltSearchReference,
            FederalId,
            CSR,
            CustomerOrderNo,
            AnalysisCode,
            InvoicingAddressSiteID,
            PaymentType,
            PaymentTerm,
            RebatePaymentType,
            RebatePaymentTerm,
            PaymentHandlingCode,
            PayableCycle,
            '' SiteNotes,
            '' ServiceLocation,
            State,
            '' Gnr,
            '' Bnr,
            '' Fnr,
            '' Snr,
            '' commune,
            case when Taxable = 1 then 0 else 1 end IsTaxExempt,
            '' TaxExemptID,
            TaxArea TaxJurisdiction,
            '' ExcludeFromSurcharge,
            '' ExcludeFromFranchiseFee,
            InvoicingAddressSiteID InvoiceAddressUniqRef,
            case when SiteType = 'HQ' then '1' else '0' end HQLocation,
            '' Addr8,
            '' Addr9,
            case when SiteType = 'HQ' then '1' else '0' end IsNonServiceSiteFlag,
            OperationalArea,
            '' CoCNumber,
            DMAccount
        from CustomerLocations
GO

/****** Object:  View [dbo].[T_Customers]    Script Date: 5/26/2024 3:11:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE view [dbo].[T_Customers] as
        select  cu.ar_account_code ARAccountCode,
                cu.company Company,
                cu.customer_name CustomerName,
                cu.currency Currency,
                isnull(cu.invoice_cycle, '')+'|'+isnull(cu.customer_category, '') InvoiceCycle,
                cu.invoice_frequency_term InvoiceFrequencyTerm,
                cu.payment_term PaymentTerm,
                cu.payment_type PaymentType,
                '5000' CreditLimit,
                cu.customer_state CustomerState,
                '' SuspendStartDate,
                cu.invoice_document_delivery_type InvoiceDocumentDeliveryType,
                cu.ar_ap_documents_option ARAPDocumentsOption,
                cu.credit_controller CreditController,
                isnull(cu.invoice_cycle, '')+'|'+isnull(cu.customer_category, '') CustomerCategory,
                cu.sic_code SICCode,
                cu.combine_ar_ap_for_credit_checks CombineARAPForCreditChecks,
                cu.combine_charges_rebates CombineChargesRebates,
                cu.is_internal IsInternal,
                cu.rct_customer RCTCustomer,
                cu.show_lft_on_invoice ShowLFTOnInvoice,
                cu.tickets_required_with_invoice TicketsRequiredWithInvoice,
                cu.proof_of_service_required ProofOfServiceRequired,
                cu.collate_invoices CollateInvoices,
                cu.settlement_percentage SettlementPercentage,
                cu.roll_up_invoice_by_service RollUpInvoiceByService,
                cu.roll_up_invoice_by_site RollUpInvoiceBySite,
                cu.customer_invoice_number_required CustomerInvoiceNumberRequired,
                cu.is_order_number_required IsOrderNumberRequired,
                cu.summary_invoice SummaryInvoice,
                cu.rebate_billing_option RebateBillingOption,
                cu.rebate_invoice_cycle RebateInvoiceCycle,
                cu.rebate_invoice_frequency_term RebateInvoiceFrequencyTerm,
                cu.invoices_sent_electronically InvoicesSentElectronically,
                cu.one_inv_per_po OneInvPerPO,
                cu.one_inv_per_dept OneInvPerDept,
                cu.one_inv_per_job OneInvPerJob,
                cu.contract_status ContractStatus,
                cu.exclude_from_statement_run ExcludeFromStatementRun,
                isnull(cu.invoice_cycle, '')+'|'+isnull(cu.customer_category, '') CustomerType,
                isnull(cu.invoice_cycle, '')+'|'+isnull(cu.customer_category, '') CustomerTemplate,
                isnull(cu.customer_category, '') BusinessType,
                cu.customer_group CustomerGroup,
                cu.federal_id FederalId,
                cu.customer_notes CustomerNotes,
                '' BusinessTypeOption,
                cu.marketing_source MarketingSource,
                cast(cu.start_date as date) StartDate,
                '' ApprovedDate,
                cu.alt_search_reference AlternativeSearchReference,
                cu.business_sector BusinessSector,
                cu.ap_account_code APAccountCode,
                cu.sales_rep SalesRep,
                cu.CSR,
                cu.payment_handling_code PaymentHandlingCode,
                cu.rebate_payment_type RebatePaymentType,
                cu.rebate_payment_terms RebatePaymentTerms,
                '' SalesTerritory,
                '' Department,
                cu.master_ar_account_code MasterARAccountCode,
                '' ReceiveServiceUpdatesByEmail,
                '' ReceiveServiceUpdatesByText,
                '' ReceiveMarketingUpdatesByEmail,
                '' ReceiveMarketingUpdatesByText,
                cl.TaxArea TaxArea,
                case when cl.Taxable = 1 then 0 else 1 end IsTaxExempt,
                '' ExcludeFromLatePaymentFee,
                '' FinanceChargeDaysAfter,
                '' FinanceChargePercentage,
                '' CoCNumber,
                '' VATRegistrationNumber,
                '' AmiceNumber,
                '' ApplyPaymentServiceFee,
                '' BillToCustomer
				, cu.dm_account
            from Customers cu
			left join CustomerLocations cl on cl.DMAccount = cu.dm_account and cast(cu.c_id as varchar) = cl.UniqRef
GO

/****** Object:  View [dbo].[T_CustomerServiceAgreementHeader]    Script Date: 5/26/2024 3:11:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



create view [dbo].[T_CustomerServiceAgreementHeader] as
	select
		CompanyOutlet,
		ARAccountCode,
		UniqRef,
		AgreeNbr,
		ContainerType,
		MaterialClass,
		PrimaryService,
		ScheduledRouted,
		cast(StartDate as date) StartDate,
		Description,
		VAT,
		RequiresPeriodicDoC,
		ProofOfServiceRequired,
		OrderNumberRequired,
		InvoiceCycle,
		DriverNotes,
		OrderNotes,
		CustomerSuppliesReleaseNumbers,
		InvoiceOnShipDate,
		TransportSupplier,
		CollateInvoices,
		LastInvoiceDate,
		InvoiceFrequencyTerm,
		'' Notes,
		'' ParentServiceAgreementNumber,
		'' Department,
		'' IsForAllSites,
		'' EndDate,
		DMAccount
	from CustomerServiceAgreementHeader sah
GO

/****** Object:  View [dbo].[T_MasterCustomers]    Script Date: 5/26/2024 3:11:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[T_MasterCustomers] AS
		select	Name,
			ARAccount	MasterARAccountCode,
			''	MasterAPAccountCode,
			Currency,
			Notes
		from MasterAccount
GO

/****** Object:  View [dbo].[T_Routing]    Script Date: 5/26/2024 3:11:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




create view [dbo].[T_Routing] as
	select
		co.Company CompanyOutlet,
		RouteNo,
		RouteDescription,
		WhichDay,
		Notes,
		VehicleType,
		PickUpInterval,
		Haulier,
		RouteManagementType,
		'' DefaultTipMaterial,
		cast(NextPlannedDate as date) NextPlannedDate,
		'' DestinationLocation,
		'' DaysBeforeExpiry,
		'' Vehicle
	-- select count(1)
	from Routing r
	inner join Company co on co.id = r.Company_id
GO

/****** Object:  View [dbo].[T_SiteOrderAssignments]    Script Date: 5/26/2024 3:11:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





create view [dbo].[T_SiteOrderAssignments] as
    select	
        SiteOrderUniqueRef,
        Action,
        DayOfWeek,
        RouteTemplate,
        Position,
        PickUpInterval,
        soa.ContainerType,
        cast(soa.StartDate as date) StartDate,
        RoutedOrScheduled,
        MinLiftQuantity,
        RequiresQuantity,
        NextDueDate,
        Notes,
        SJVehicle,
        SJDriver,
        soh.AgreeNbr,
        soh.Frequency ServiceFrequency,
        co.Company CompanyOutlet,
        '' OldRouteAssignmentId,
        '' MaxLiftQuantity,
        soa.DMAccount
    from SiteOrderAssignments soa
    inner join SiteOrderHeader soh on soh.id = soa.SiteOrderUniqueRef
    inner join Company co on co.id = soh.CompanyOutlet_id
GO



/****** Object:  View [dbo].[T_SiteOrderRental]    Script Date: 5/26/2024 3:11:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE view [dbo].[T_SiteOrderRental] as
	select 	
		SiteOrderUniqueRef,
		sor.AgreeNbr,
		sor.ContainerType,
		RentalFrequency,
		RentalRate,
		RentalStartDate,
		RentalEndDate,
		RentalQuantity,
		Action,
		BinsOnSiteBasedOnQuantityNow,
		RentalType,
		StartOnStartOfCycle,
		EndOnEndOfCycle,
		RentalApplication,
		RentalQuantityAttribute,
		soh.Frequency ServiceFrequency,
		sor.DMAccount,
		sor.ServiceCode,
		sor.ServiceDescription
	from SiteOrderRental sor
	inner join SiteOrderHeader soh on soh.id = sor.SiteOrderUniqueRef
GO


