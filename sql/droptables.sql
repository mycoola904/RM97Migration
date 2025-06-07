USE [ModMigration]

ALTER TABLE [dbo].[Account] DROP CONSTRAINT [Account_Terms_id_c0e79d50_fk_Terms_id]

ALTER TABLE [dbo].[Account] DROP CONSTRAINT [Account_TaxArea_id_fac09083_fk_TaxArea_id]

ALTER TABLE [dbo].[Account] DROP CONSTRAINT [Account_status_id_79a7f451_fk_Status_id]

ALTER TABLE [dbo].[Account] DROP CONSTRAINT [Account_StatementType_id_d6f12c40_fk_StatementType_id]

ALTER TABLE [dbo].[Account] DROP CONSTRAINT [Account_SREP2_id_bf3d8011_fk_CustomerRep_id]

ALTER TABLE [dbo].[Account] DROP CONSTRAINT [Account_SREP1_id_d94c51ba_fk_CustomerRep_id]

ALTER TABLE [dbo].[Account] DROP CONSTRAINT [Account_MasterAccount_id_07116aaf_fk_MasterAccount_id]

ALTER TABLE [dbo].[Account] DROP CONSTRAINT [Account_LocationInfo_id_17bcfbb7_fk_LocationInfo_id]

ALTER TABLE [dbo].[Account] DROP CONSTRAINT [Account_FinanceCharge_id_e97a119f_fk_FinanceCharge_id]

ALTER TABLE [dbo].[Account] DROP CONSTRAINT [Account_DelinquencyLevel_id_4e33f7aa_fk_DelinquencyLevel_id]

ALTER TABLE [dbo].[Account] DROP CONSTRAINT [Account_CREP2_id_790fb9e7_fk_CustomerRep_id]

ALTER TABLE [dbo].[Account] DROP CONSTRAINT [Account_CREP1_id_536628e1_fk_CustomerRep_id]

ALTER TABLE [dbo].[Account] DROP CONSTRAINT [Account_Company_id_70b50e46_fk_Company_id]

ALTER TABLE [dbo].[Account] DROP CONSTRAINT [Account_BillingInfo4_id_567f7c33_fk_BillScreenInfo_id]

ALTER TABLE [dbo].[Account] DROP CONSTRAINT [Account_BillingInfo3_id_7c1709fc_fk_BillScreenInfo_id]

ALTER TABLE [dbo].[Account] DROP CONSTRAINT [Account_BillingInfo2_id_975fb6d8_fk_BillScreenInfo_id]

ALTER TABLE [dbo].[Account] DROP CONSTRAINT [Account_BillingInfo1_id_08671fda_fk_BillScreenInfo_id]

ALTER TABLE [dbo].[Account] DROP CONSTRAINT [Account_BillingInfo_id_4d03730a_fk_BillingInfo_id]

ALTER TABLE [dbo].[Account] DROP CONSTRAINT [Account_BillingGroup_id_2655ae6d_fk_BillingGroup_id]

ALTER TABLE [dbo].[Account] DROP CONSTRAINT [Account_BillingCycle_id_b3867e62_fk_BillingCycle_id]

ALTER TABLE [dbo].[Account] DROP CONSTRAINT [Account_BillArea_id_80c070c7_fk_BillArea_id]

ALTER TABLE [dbo].[Child] DROP CONSTRAINT [Child_Terms_id_71b3df88_fk_Terms_id]

ALTER TABLE [dbo].[Child] DROP CONSTRAINT [Child_TaxArea_id_50b06479_fk_TaxArea_id]

ALTER TABLE [dbo].[Child] DROP CONSTRAINT [Child_status_id_e25982dd_fk_Status_id]

ALTER TABLE [dbo].[Child] DROP CONSTRAINT [Child_StatementType_id_de46208b_fk_StatementType_id]

ALTER TABLE [dbo].[Child] DROP CONSTRAINT [Child_SREP2_id_5e285cd0_fk_CustomerRep_id]

ALTER TABLE [dbo].[Child] DROP CONSTRAINT [Child_SREP1_id_82b0f003_fk_CustomerRep_id]

ALTER TABLE [dbo].[Child] DROP CONSTRAINT [Child_Parent_id_b95b4084_fk_Account_id]

ALTER TABLE [dbo].[Child] DROP CONSTRAINT [Child_MasterAccount_id_584335ff_fk_MasterAccount_id]

ALTER TABLE [dbo].[Child] DROP CONSTRAINT [Child_LocationInfo_id_52ae2d62_fk_LocationInfo_id]

ALTER TABLE [dbo].[Child] DROP CONSTRAINT [Child_FinanceCharge_id_a5d9f94a_fk_FinanceCharge_id]

ALTER TABLE [dbo].[Child] DROP CONSTRAINT [Child_DelinquencyLevel_id_b3a8111b_fk_DelinquencyLevel_id]

ALTER TABLE [dbo].[Child] DROP CONSTRAINT [Child_CREP2_id_dfc24ce4_fk_CustomerRep_id]

ALTER TABLE [dbo].[Child] DROP CONSTRAINT [Child_CREP1_id_2b0cc0b2_fk_CustomerRep_id]

ALTER TABLE [dbo].[Child] DROP CONSTRAINT [Child_Company_id_7d5b3bf4_fk_Company_id]

ALTER TABLE [dbo].[Child] DROP CONSTRAINT [Child_BillingInfo4_id_b844a5a4_fk_BillScreenInfo_id]

ALTER TABLE [dbo].[Child] DROP CONSTRAINT [Child_BillingInfo3_id_981333f8_fk_BillScreenInfo_id]

ALTER TABLE [dbo].[Child] DROP CONSTRAINT [Child_BillingInfo2_id_360072a8_fk_BillScreenInfo_id]

ALTER TABLE [dbo].[Child] DROP CONSTRAINT [Child_BillingInfo1_id_6d63cbfc_fk_BillScreenInfo_id]

ALTER TABLE [dbo].[Child] DROP CONSTRAINT [Child_BillingInfo_id_f84d593d_fk_BillingInfo_id]

ALTER TABLE [dbo].[Child] DROP CONSTRAINT [Child_BillingGroup_id_9b4e1b0e_fk_BillingGroup_id]

ALTER TABLE [dbo].[Child] DROP CONSTRAINT [Child_BillingCycle_id_39f095ed_fk_BillingCycle_id]

ALTER TABLE [dbo].[Child] DROP CONSTRAINT [Child_BillArea_id_09236d75_fk_BillArea_id]

ALTER TABLE [dbo].[Customers] DROP CONSTRAINT [Customers_Parent_id_29d78457_fk_Account_id]

ALTER TABLE [dbo].[Customers] DROP CONSTRAINT [Customers_Child_id_fa277ef8_fk_Child_id]

ALTER TABLE [dbo].[Customers] DROP CONSTRAINT [Customers_Account_id_4f814522_fk_Account_id]

ALTER TABLE [dbo].[Route] DROP CONSTRAINT [Route_RouteType_id_ee790134_fk_RouteType_id]

ALTER TABLE [dbo].[Route] DROP CONSTRAINT [Route_Company_id_e6564ab6_fk_Company_id]

ALTER TABLE [dbo].[SiteOrderRental] DROP CONSTRAINT [SiteOrderRental_Customer_id_117cbc01_fk_Customers_id]

ALTER TABLE [dbo].[SiteOrderHeader] DROP CONSTRAINT [SiteOrderHeader_CompanyOutlet_id_90259a82_fk_Company_id]

ALTER TABLE [dbo].[Routing] DROP CONSTRAINT [Routing_RouteType_id_59d2e0e6_fk_RouteType_id]

ALTER TABLE [dbo].[Routing] DROP CONSTRAINT [Routing_Company_id_9121913e_fk_Company_id]

ALTER TABLE [dbo].[RouteStops] DROP CONSTRAINT [RouteStops_Route_id_b87aa4ce_fk_Route_id]

ALTER TABLE [dbo].[RouteStops] DROP CONSTRAINT [RouteStops_Child_id_07d65652_fk_Child_id]

ALTER TABLE [dbo].[RouteStops] DROP CONSTRAINT [RouteStops_Account_id_b3f3ef4f_fk_Account_id]

ALTER TABLE [dbo].[MasterAccount] DROP CONSTRAINT [MasterAccount_Status_id_f33c853d_fk_Status_id]

ALTER TABLE [dbo].[CustomerServiceAgreementPrices] DROP CONSTRAINT [CustomerServiceAgreementPrices_Customer_id_5e84d988_fk_Customers_id]

ALTER TABLE [dbo].[CustomerServiceAgreementHeader] DROP CONSTRAINT [CustomerServiceAgreementHeader_Customer_id_f6618fed_fk_Customers_id]

ALTER TABLE [dbo].[CustomerLocations] DROP CONSTRAINT [CustomerLocations_Child_id_c33df04f_fk_Child_id]

ALTER TABLE [dbo].[CustomerLocations] DROP CONSTRAINT [CustomerLocations_Account_id_f5987f4f_fk_Account_id]

ALTER TABLE [dbo].[Containers] DROP CONSTRAINT [Containers_UnitOfMeasure_id_7ec1673c_fk_ContainerUOM_id]

ALTER TABLE [dbo].[Containers] DROP CONSTRAINT [Containers_Company_id_0a51106b_fk_Company_id]

ALTER TABLE [dbo].[ContainerRoute] DROP CONSTRAINT [ContainerRoute_Container_id_174e7365_fk_Containers_id]

ALTER TABLE [dbo].[ContainerRoute] DROP CONSTRAINT [ContainerRoute_Company_id_4ab61dcb_fk_Company_id]

ALTER TABLE [dbo].[Contacts] DROP CONSTRAINT [Contacts_ContactType_id_594d9e14_fk_ContactType_id]

ALTER TABLE [dbo].[Contacts] DROP CONSTRAINT [Contacts_Child_id_45641d81_fk_Child_id]

ALTER TABLE [dbo].[Contacts] DROP CONSTRAINT [Contacts_Account_id_0176a3ff_fk_Account_id]

ALTER TABLE [dbo].[ContactLocations] DROP CONSTRAINT [ContactLocations_ContactUniqueId_id_4467ed72_fk_Contacts_id]

ALTER TABLE [dbo].[ContactLocations] DROP CONSTRAINT [ContactLocations_Child_id_4f44c26a_fk_Child_id]

ALTER TABLE [dbo].[ContactLocations] DROP CONSTRAINT [ContactLocations_Account_id_c144b5fd_fk_Account_id]

ALTER TABLE [dbo].[Communications] DROP CONSTRAINT [Communications_Child_id_e9acc64b_fk_Child_id]

ALTER TABLE [dbo].[Communications] DROP CONSTRAINT [Communications_Account_id_c75ef796_fk_Account_id]

ALTER TABLE [dbo].[AgedDebtorsData] DROP CONSTRAINT [AgedDebtorsData_Child_id_dcd3b96e_fk_Child_id]

ALTER TABLE [dbo].[AgedDebtorsData] DROP CONSTRAINT [AgedDebtorsData_Account_id_e2e0153e_fk_Account_id]

/****** Object:  Table [dbo].[Account]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Account]') AND type in (N'U'))
DROP TABLE [dbo].[Account]

/****** Object:  Table [dbo].[BillArea]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BillArea]') AND type in (N'U'))
DROP TABLE [dbo].[BillArea]

/****** Object:  Table [dbo].[BillingCycle]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BillingCycle]') AND type in (N'U'))
DROP TABLE [dbo].[BillingCycle]

/****** Object:  Table [dbo].[BillingGroup]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BillingGroup]') AND type in (N'U'))
DROP TABLE [dbo].[BillingGroup]

/****** Object:  Table [dbo].[BillingInfo]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BillingInfo]') AND type in (N'U'))
DROP TABLE [dbo].[BillingInfo]

/****** Object:  Table [dbo].[BillScreenInfo]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BillScreenInfo]') AND type in (N'U'))
DROP TABLE [dbo].[BillScreenInfo]

/****** Object:  Table [dbo].[CallLog]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CallLog]') AND type in (N'U'))
DROP TABLE [dbo].[CallLog]

/****** Object:  Table [dbo].[Child]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Child]') AND type in (N'U'))
DROP TABLE [dbo].[Child]

/****** Object:  Table [dbo].[Company]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Company]') AND type in (N'U'))
DROP TABLE [dbo].[Company]

/****** Object:  Table [dbo].[ContactType]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ContactType]') AND type in (N'U'))
DROP TABLE [dbo].[ContactType]

/****** Object:  Table [dbo].[ContainerUOM]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ContainerUOM]') AND type in (N'U'))
DROP TABLE [dbo].[ContainerUOM]

/****** Object:  Table [dbo].[Customers]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customers]') AND type in (N'U'))
DROP TABLE [dbo].[Customers]

/****** Object:  Table [dbo].[CustomerRep]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerRep]') AND type in (N'U'))
DROP TABLE [dbo].[CustomerRep]

/****** Object:  Table [dbo].[DelinquencyLevel]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DelinquencyLevel]') AND type in (N'U'))
DROP TABLE [dbo].[DelinquencyLevel]

/****** Object:  Table [dbo].[FinanceCharge]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FinanceCharge]') AND type in (N'U'))
DROP TABLE [dbo].[FinanceCharge]

/****** Object:  Table [dbo].[LocationInfo]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LocationInfo]') AND type in (N'U'))
DROP TABLE [dbo].[LocationInfo]

/****** Object:  Table [dbo].[Route]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Route]') AND type in (N'U'))
DROP TABLE [dbo].[Route]

/****** Object:  Table [dbo].[RouteType]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RouteType]') AND type in (N'U'))
DROP TABLE [dbo].[RouteType]

/****** Object:  Table [dbo].[ServiceCategory]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServiceCategory]') AND type in (N'U'))
DROP TABLE [dbo].[ServiceCategory]

/****** Object:  Table [dbo].[ServiceMapping]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ServiceMapping]') AND type in (N'U'))
DROP TABLE [dbo].[ServiceMapping]

/****** Object:  Table [dbo].[SiteOrderAssignments]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SiteOrderAssignments]') AND type in (N'U'))
DROP TABLE [dbo].[SiteOrderAssignments]

/****** Object:  Table [dbo].[StatementType]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StatementType]') AND type in (N'U'))
DROP TABLE [dbo].[StatementType]

/****** Object:  Table [dbo].[Status]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Status]') AND type in (N'U'))
DROP TABLE [dbo].[Status]

/****** Object:  Table [dbo].[SurchargeArea]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SurchargeArea]') AND type in (N'U'))
DROP TABLE [dbo].[SurchargeArea]

/****** Object:  Table [dbo].[TaxArea]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TaxArea]') AND type in (N'U'))
DROP TABLE [dbo].[TaxArea]

/****** Object:  Table [dbo].[Terms]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Terms]') AND type in (N'U'))
DROP TABLE [dbo].[Terms]

/****** Object:  Table [dbo].[UnitOfMeasure]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UnitOfMeasure]') AND type in (N'U'))
DROP TABLE [dbo].[UnitOfMeasure]

/****** Object:  Table [dbo].[SiteOrderRental]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SiteOrderRental]') AND type in (N'U'))
DROP TABLE [dbo].[SiteOrderRental]

/****** Object:  Table [dbo].[SiteOrderHeader]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SiteOrderHeader]') AND type in (N'U'))
DROP TABLE [dbo].[SiteOrderHeader]

/****** Object:  Table [dbo].[Routing]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Routing]') AND type in (N'U'))
DROP TABLE [dbo].[Routing]

/****** Object:  Table [dbo].[RouteStops]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RouteStops]') AND type in (N'U'))
DROP TABLE [dbo].[RouteStops]

/****** Object:  Table [dbo].[MasterAccount]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MasterAccount]') AND type in (N'U'))
DROP TABLE [dbo].[MasterAccount]

/****** Object:  Table [dbo].[CustomerServiceAgreementPrices]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerServiceAgreementPrices]') AND type in (N'U'))
DROP TABLE [dbo].[CustomerServiceAgreementPrices]

/****** Object:  Table [dbo].[CustomerServiceAgreementHeader]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerServiceAgreementHeader]') AND type in (N'U'))
DROP TABLE [dbo].[CustomerServiceAgreementHeader]

/****** Object:  Table [dbo].[CustomerLocations]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerLocations]') AND type in (N'U'))
DROP TABLE [dbo].[CustomerLocations]

/****** Object:  Table [dbo].[Containers]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Containers]') AND type in (N'U'))
DROP TABLE [dbo].[Containers]

/****** Object:  Table [dbo].[ContainerRoute]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ContainerRoute]') AND type in (N'U'))
DROP TABLE [dbo].[ContainerRoute]

/****** Object:  Table [dbo].[Contacts]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Contacts]') AND type in (N'U'))
DROP TABLE [dbo].[Contacts]

/****** Object:  Table [dbo].[ContactLocations]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ContactLocations]') AND type in (N'U'))
DROP TABLE [dbo].[ContactLocations]

/****** Object:  Table [dbo].[Communications]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Communications]') AND type in (N'U'))
DROP TABLE [dbo].[Communications]

/****** Object:  Table [dbo].[AgedDebtorsData]    Script Date: 5/22/2024 7:35:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AgedDebtorsData]') AND type in (N'U'))
DROP TABLE [dbo].[AgedDebtorsData]


