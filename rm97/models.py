from django.db import models

class Company(models.Model):
    Company = models.CharField(max_length=50, null=False, blank=False)
    Description = models.CharField(max_length=50, null=False, blank=False)
    CompanyID = models.IntegerField(null=False, blank=False)

    class Meta:
        db_table = 'Company'

    def __str__(self):
        return self.Company
    
class ServiceCategory(models.Model):
    ServiceCategory = models.CharField(max_length=50, null=False, blank=False)
    Description = models.CharField(max_length=50, null=False, blank=False)
    ServiceCategoryID = models.IntegerField(null=False, blank=False)

    class Meta:
        db_table = 'ServiceCategory'

    def __str__(self):
        return self.Description
    
class UnitOfMeasure(models.Model):
    UnitOfMeasure = models.CharField(max_length=50, null=False, blank=False)
    Description = models.CharField(max_length=50, null=False, blank=False)
    UnitOfMeasureID = models.IntegerField(null=False, blank=False)

    class Meta:
        db_table = 'UnitOfMeasure'

    def __str__(self):
        return self.Description
    
class ContainerUOM(models.Model):
    ContainerUOM = models.CharField(max_length=50, null=False, blank=False)
    Description = models.CharField(max_length=50, null=False, blank=False)
    ContainerUOMID = models.IntegerField(null=False, blank=False)

    class Meta:
        db_table = 'ContainerUOM'

    def __str__(self):
        return self.Description


class BillingGroup(models.Model):
    BillingGroup = models.CharField(max_length=50, null=False, blank=False)
    Description = models.CharField(max_length=50, null=False, blank=False)
    BillingGroupID = models.IntegerField(null=False, blank=False)

    class Meta:
        db_table = 'BillingGroup'

    def __str__(self):
        return self.Description

# C_FIN_CHG
class FinanceCharge(models.Model):
    Description = models.CharField(max_length=50, null=False, blank=False)
    FinanceChargeID = models.IntegerField(null=False, blank=False)

    class Meta:
        db_table = 'FinanceCharge'

    def __str__(self):
        return self.Description
    
# C_DELNQLVL
class DelinquencyLevel(models.Model):
    Description = models.CharField(max_length=50, null=False, blank=False)
    DelinquencyLevelID = models.IntegerField(null=False, blank=False)

    class Meta:
        db_table = 'DelinquencyLevel'

    def __str__(self):
        return self.Description
    
# B_B_CYCLE
class BillingCycle(models.Model):
    Description = models.CharField(max_length=50, null=False, blank=False)
    BillingCycleID = models.IntegerField(null=False, blank=False)
    Cycle = models.CharField(max_length=50, null=False, blank=False, default='')

    class Meta:
        db_table = 'BillingCycle'

    def __str__(self):
        return self.Description


class BillArea(models.Model):
    Description = models.CharField(max_length=50, null=False, blank=False)
    BillAreaID = models.IntegerField(null=False, blank=False)

    class Meta:
        db_table = 'BillArea'

    def __str__(self):
        return self.Description
    
# B_STMT_TYP
class StatementType(models.Model):
    Description = models.CharField(max_length=50, null=False, blank=False)
    StatementTypeID = models.IntegerField(null=False, blank=False)

    class Meta:
        db_table = 'StatementType'

    def __str__(self):
        return self.Description

class Status(models.Model):
    Status = models.CharField(max_length=50, null=False, blank=False)
    Description = models.CharField(max_length=50, null=False, blank=False)
    StatusID = models.IntegerField(null=False, blank=False)
    SysValue = models.CharField(max_length=50, null=False, blank=False)

    class Meta:
        db_table = 'Status'

    def __str__(self):
        return self.Description
    
# B_TAXAREA
class TaxArea(models.Model):
    Description = models.CharField(max_length=50, null=False, blank=False)
    TaxAreaID = models.IntegerField(null=False, blank=False)

    class Meta:
        db_table = 'TaxArea'

    def __str__(self):
        return self.Description
    
# RouteType
class RouteType(models.Model):
    Description = models.CharField(max_length=50, null=False, blank=False)
    RouteTypeID = models.IntegerField(null=False, blank=False)

    class Meta:
        db_table = 'RouteType'

    def __str__(self):
        return self.Description
    

class Containers(models.Model):
    Company = models.ForeignKey(Company, on_delete=models.CASCADE)
    ContainerID = models.IntegerField(null=False, blank=False)
    Size = models.CharField(max_length=10, null=False, blank=False)
    UnitOfMeasure = models.ForeignKey(ContainerUOM, on_delete=models.CASCADE)
    Type = models.CharField(max_length=50, null=False, blank=False)
    ContainerType = models.CharField(max_length=50, null=False, blank=False)


    class Meta:
        db_table = 'Containers'

    def __str__(self):
        return self.Description
    

# Customer Representative
class CustomerRep(models.Model):
    Name = models.CharField(max_length=50, null=False, blank=False)
    Phone = models.CharField(max_length=18, null=False, blank=False, default='')
    Email = models.CharField(max_length=50, null=False, blank=False, default='')
    CommisionPlan = models.IntegerField(null=False, blank=False, default=0)
    CustomerRepID = models.IntegerField(null=False, blank=False)

    class Meta:
        db_table = 'CustomerRep'

    def __str__(self):
        return self.Description
    
# BillScreenInfo
class BillScreenInfo(models.Model):
    UdefName = models.CharField(max_length=50, null=False, blank=False)
    Description = models.CharField(max_length=50, null=False, blank=False)
    BillScreenInfoID = models.IntegerField(null=False, blank=False)

    class Meta:
        db_table = 'BillScreenInfo'

    def __str__(self):
        return self.Description

# Terms
class Terms(models.Model):
    Description = models.CharField(max_length=50, null=False, blank=False)
    TermsID = models.IntegerField(null=False, blank=False)

    class Meta:
        db_table = 'Terms'

    def __str__(self):
        return self.Description
    
# Surcharge Area
class SurchargeArea(models.Model):
    Description = models.CharField(max_length=50, null=False, blank=False)
    SurchargeAreaID = models.IntegerField(null=False, blank=False)

    class Meta:
        db_table = 'SurchargeArea'

    def __str__(self):
        return self.Description
    
class ContactType(models.Model):
    Type = models.CharField(max_length=50, null=False, blank=False)
    
    class Meta:
        db_table = 'ContactType'

    def __str__(self):
        return self.Type

    class Meta:
        db_table = 'ContactType'

    def __str__(self):
        return self.Description

    
class BillingInfo(models.Model):
    B_NAME = models.CharField(max_length=50, null=True)
    B_NAME2 = models.CharField(max_length=50, null=True)
    B_ADDR1 = models.CharField(max_length=130, null=True)
    B_ADDR2 = models.CharField(max_length=130, null=True)
    B_CITY = models.CharField(max_length=120, null=True)
    B_STATE = models.CharField(max_length=12, null=True)
    B_ZIP = models.CharField(max_length=10, null=True)
    B_PHO = models.CharField(max_length=18, null=True)
    B_PCONT = models.CharField(max_length=50, null=True)
    B_FAX = models.CharField(max_length=13, null=True)
    B_FCONT = models.CharField(max_length=50, null=True)
    B_EMAIL = models.CharField(max_length=50, null=True)
    BillKey = models.CharField(max_length=4000, null=True, blank=True)
    C_ID = models.IntegerField(null=False, blank=False)
    UniqueReference = models.CharField(max_length=50, null=True, blank=True)

    class Meta:
        db_table = 'BillingInfo'

    @property
    def Name1(self):
        return self.B_NAME 
    
    @property
    def Name2(self):
        return self.B_NAME2
    
    @property
    def City(self):
        return self.B_CITY  
    
    @property
    def State(self):
        return self.B_STATE
    
    @property
    def Zip(self):
        return self.B_ZIP
    
    @property
    def Street(self):
        return self.b_addr1
    
    @property
    def Address(self):
        return self.Street+', '+ self.City + ', ' + self.State + ', ' + self.Zip 
    
    def __str__(self):
        return self.B_NAME
    
class LocationInfo(models.Model):
    C_NAME = models.CharField(max_length=50, null=True)
    C_NAME2 = models.CharField(max_length=50, null=True)
    C_ADDRNUM1 = models.CharField(max_length=90, null=True)
    C_ADDR1 = models.CharField(max_length=30, null=True)
    C_ADDR2 = models.CharField(max_length=30, null=True)
    C_CITY = models.CharField(max_length=20, null=True)
    C_STATE = models.CharField(max_length=50, null=True)
    C_ZIP = models.CharField(max_length=10, null=True)
    C_PHO = models.CharField(max_length=18, null=True)
    C_PCONT = models.CharField(max_length=50, null=True)
    C_FAX = models.CharField(max_length=18, null=True)
    C_FCONT = models.CharField(max_length=50, null=True)
    C_BILL_TO = models.CharField(max_length=1, null=True)
    C_SALESREP = models.IntegerField(null=True)
    C_EMAIL = models.CharField(max_length=50, null=True)
    C_ID = models.IntegerField(null=False, blank=False)
    LocKey = models.CharField(max_length=4000, null=True, blank=True)

    class Meta:
        db_table = 'LocationInfo'
    
    @property
    def Name1(self):
        return self.C_NAME
    
    @property
    def Name2(self):
        return self.C_NAME2
    
    @property
    def Street(self):
        return self.C_ADDRNUM1+' '+ self.C_ADDR1
    
    @property
    def City(self):
        return self.C_CITY
    
    @property
    def State(self):
        return self.C_STATE
    
    @property
    def Zip(self):
        return self.C_ZIP
    
    @property
    def Address(self):
        return self.Street+', '+ self.City + ', ' + self.State + ', ' + self.Zip 
    
    

    def __str__(self):
        return self.C_NAME

    

class MasterAccount(models.Model):
    c_id = models.IntegerField(null=False, blank=False)
    Parent_ID = models.CharField(max_length=54, null=True, blank=True)
    Name = models.CharField(max_length=50, null=True, blank=True)
    ARAccount = models.CharField(max_length=32, null=False, blank=False)
    Currency = models.CharField(max_length=50, null=False, blank=False , default='USD')
    Notes = models.CharField(max_length=4000, null=True, blank=True)
    DMAccount = models.CharField(max_length=50, null=False, blank=False)
    ChildCount = models.IntegerField(null=True, blank=True)
    Status = models.ForeignKey(Status, on_delete=models.SET_NULL, null=True, blank=True)
    Project = models.CharField(max_length=50, null=False, blank=False, default='Accurate')

    class Meta:
        db_table = 'MasterAccount'

    def __str__(self):
        return self.Name
    





class Account(models.Model):
    C_ID = models.IntegerField(null=False)
    C_ID_ALPHA = models.CharField(max_length=19, null=True)
    C_CSTAT = models.IntegerField(null=True)
    C_COMMENTS = models.TextField(null=True, blank=True)
    C_FIN_CHG = models.DecimalField(max_digits=18, decimal_places=5, null=True)
    C_DELNQLVL = models.IntegerField(null=True)
    BillingCycle = models.ForeignKey(BillingCycle, on_delete=models.SET_NULL, null=True, blank=True)
    B_TAXABLE = models.BooleanField(null=True)
    B_ACCTTYPE = models.CharField(max_length=15, null=True)
    FinanceCharge = models.ForeignKey(FinanceCharge, on_delete=models.SET_NULL, null=True, blank=True)    
    DelinquencyLevel = models.ForeignKey(DelinquencyLevel, on_delete=models.SET_NULL, null=True, blank=True)
    StatementType = models.ForeignKey(StatementType, on_delete=models.SET_NULL, null=True, blank=True)
    BillingGroup = models.ForeignKey(BillingGroup, on_delete=models.SET_NULL, null=True, blank=True)
    Company = models.ForeignKey(Company, on_delete=models.SET_NULL, null=True, blank=True)
    B_PO_NUM = models.CharField(max_length=25, null=True)
    BillArea = models.ForeignKey(BillArea, on_delete=models.SET_NULL, null=True, blank=True)
    TaxArea = models.ForeignKey(TaxArea, on_delete=models.SET_NULL, null=True, blank=True)
    B_PAGE = models.IntegerField(null=True)
    B_PAYBYCC = models.BooleanField(null=True)
    B_CONTRACT_NUM = models.CharField(max_length=30, null=True)
    B_CONTRACT_DATE = models.DateTimeField(null=True)
    C_15D = models.DecimalField(max_digits=18, decimal_places=5, null=True)
    C_45D = models.DecimalField(max_digits=18, decimal_places=5, null=True)
    REFERRAL = models.CharField(max_length=80, null=True)
    SREP1 = models.ForeignKey(CustomerRep, on_delete=models.SET_NULL, null=True, blank=True, related_name='SREP1')
    SREP2 = models.ForeignKey(CustomerRep, on_delete=models.SET_NULL, null=True, blank=True, related_name='SREP2')
    CREP1 = models.ForeignKey(CustomerRep, on_delete=models.SET_NULL, null=True, blank=True, related_name='CREP1')
    CREP2 = models.ForeignKey(CustomerRep, on_delete=models.SET_NULL, null=True, blank=True, related_name='CREP2')
    B_NAME_2ND = models.CharField(max_length=50, null=True)
    B_NAME_2ND2 = models.CharField(max_length=50, null=True)
    B_ADDR1_2ND = models.CharField(max_length=50, null=True)
    B_ADDR1_2ND2 = models.CharField(max_length=50, null=True)
    B_CITY_2ND = models.CharField(max_length=50, null=True)
    B_STATE_2ND = models.CharField(max_length=20, null=True)
    B_ZIP_2ND = models.CharField(max_length=20, null=True)
    C_DEPOSIT = models.DecimalField(max_digits=18, decimal_places=5, null=True)
    CREP1_NOTES = models.CharField(max_length=80, null=True)
    CREP2_NOTES = models.CharField(max_length=80, null=True)
    SREP1_NOTES = models.CharField(max_length=80, null=True)
    SREP2_NOTES = models.CharField(max_length=80, null=True)
    C_TYPE2 = models.BooleanField(null=True)
    C_TYPE3 = models.BooleanField(null=True)
    B_MTD = models.FloatField(null=True)
    B_YTD = models.FloatField(null=True)
    B_LMTD = models.FloatField(null=True)
    B_LYTD = models.FloatField(null=True)
    B_TERMS = models.IntegerField(null=True)
    REFERRAL2 = models.IntegerField(null=True)
    KFACTOR = models.DecimalField(max_digits=10, decimal_places=3, null=True)
    GAL_DEGREE_DAY = models.FloatField(null=True)
    LCK_GAL_DEGREE_DAY = models.BooleanField(null=True)
    GAL_DAY = models.FloatField(null=True)
    LCK_GAL_DAY = models.BooleanField(null=True)
    BillingInfo1 = models.ForeignKey(BillScreenInfo, on_delete=models.SET_NULL, null=True, blank=True, related_name='BillingInfo1')
    BillingInfo2 = models.ForeignKey(BillScreenInfo, on_delete=models.SET_NULL, null=True, blank=True, related_name='BillingInfo2')
    BillingInfo3 = models.ForeignKey(BillScreenInfo, on_delete=models.SET_NULL, null=True, blank=True, related_name='BillingInfo3')
    BillingInfo4 = models.ForeignKey(BillScreenInfo, on_delete=models.SET_NULL, null=True, blank=True, related_name='BillingInfo4')
    T_ID = models.IntegerField(null=True)
    OUTPUT = models.IntegerField(null=True)
    C_120D = models.DecimalField(max_digits=18, decimal_places=5, null=True)
    C_150D = models.DecimalField(max_digits=18, decimal_places=5, null=True)
    B_SURCHARGE = models.IntegerField(null=True)
    SITEFILE = models.CharField(max_length=255, null=True)
    QUOTE_SHEET = models.CharField(max_length=255, null=True)
    C_TYPE4 = models.CharField(max_length=1, null=True)
    C_TYPE5 = models.CharField(max_length=1, null=True)
    C_TYPE6 = models.CharField(max_length=1, null=True)
    C_TYPE7 = models.CharField(max_length=1, null=True)
    C_TYPE8 = models.CharField(max_length=1, null=True)
    C_TYPE9 = models.CharField(max_length=1, null=True)
    C_LOCS2 = models.CharField(max_length=1, null=True)
    C_NLOCS2 = models.IntegerField(null=True)
    C_SUFFIX2 = models.IntegerField(null=True)
    ISCHILD2 = models.BooleanField(null=True)
    C_LOCS3 = models.CharField(max_length=1, null=True)
    C_NLOCS3 = models.IntegerField(null=True)
    C_SUFFIX3 = models.IntegerField(null=True)
    ISCHILD3 = models.BooleanField(null=True)
    TOTAL_TONS = models.DecimalField(max_digits=18, decimal_places=5, null=True)
    GUARANTEED_PRICE = models.BooleanField(null=True)
    C_CURRENCY = models.CharField(max_length=5, null=True)
    REGION = models.CharField(max_length=50, null=True)
    DISTRICT = models.CharField(max_length=50, null=True)
    PROFILE_AREA = models.CharField(max_length=50, null=True)
    CLIENT_ID = models.CharField(max_length=50, null=True)
    BUSINESS_UNIT = models.CharField(max_length=50, null=True)
    LOCATION_TYPE = models.CharField(max_length=50, null=True)
    RANK_CLASS = models.CharField(max_length=50, null=True)
    DIVISION = models.CharField(max_length=50, null=True)
    CLIENT_SHARED_PERCENTAGE = models.IntegerField(null=True)
    SURCHARGE_BENCHMARK = models.DecimalField(max_digits=18, decimal_places=5, null=True)
    LOCATION_ID = models.CharField(max_length=50, null=True)
    NATIONAL_ACCT = models.BooleanField(null=True)
    V_STORENO = models.CharField(max_length=30, null=True)
    PARENT_C_ID = models.IntegerField(null=True)
    AUTHORIZEDPAYEE = models.CharField(max_length=50, null=True)
    REBATEPAY = models.IntegerField(null=True)
    LastUpdated = models.DateTimeField(null=True)
    B_QB_PATH = models.CharField(max_length=255, null=True)
    ContactViaPhone = models.IntegerField(null=True)
    Tax_Exempt_ID = models.CharField(max_length=50, null=True)
    Flex_Date = models.DateTimeField(null=True)
    AutoEmailCustomerReceipt = models.BooleanField(null=True)
    Relationship = models.CharField(max_length=10)
    Parent_id_alpha = models.CharField(max_length=54, null=True, blank=True)
    status = models.ForeignKey(Status, on_delete=models.SET_NULL, null=True, blank=True)
    MasterAccount = models.ForeignKey(MasterAccount, on_delete=models.SET_NULL, null=True, blank=True, related_name='AccountMasterAccount')
    BillingInfo = models.ForeignKey(BillingInfo, on_delete=models.SET_NULL, null=True, blank=True, related_name='AccountBilling')
    LocationInfo = models.ForeignKey(LocationInfo, on_delete=models.SET_NULL, null=True, blank=True, related_name='AccountLocation')
    Terms = models.ForeignKey(Terms, on_delete=models.SET_NULL, null=True, blank=True)
    C_QUOTE = models.CharField(max_length=50, null=True)
    MigrationStatus = models.CharField(max_length=50, null=True, default='InActive')
    Sites = models.IntegerField(null=True, default=0)

    @property
    def ARAccount(self):
        # return the CharField of 'DM'+C_ID
        return 'DM'+str(self.C_ID)
   
    

    class Meta:
        db_table = 'Account'

    def __str__(self):
        return self.C_ID_ALPHA
    
class Child(models.Model):
    C_ID = models.IntegerField(null=False)
    C_ID_ALPHA = models.CharField(max_length=19, null=True)
    C_CSTAT = models.IntegerField(null=True)
    C_COMMENTS = models.TextField(null=True, blank=True)
    C_FIN_CHG = models.DecimalField(max_digits=18, decimal_places=5, null=True)
    C_DELNQLVL = models.IntegerField(null=True)
    BillingCycle = models.ForeignKey(BillingCycle, on_delete=models.SET_NULL, null=True, blank=True, related_name='ChildBillingCycle')
    B_TAXABLE = models.BooleanField(null=True)
    B_ACCTTYPE = models.CharField(max_length=15, null=True)
    FinanceCharge = models.ForeignKey(FinanceCharge, on_delete=models.SET_NULL, null=True, blank=True, related_name='ChildFinanceCharge')   
    DelinquencyLevel = models.ForeignKey(DelinquencyLevel, on_delete=models.SET_NULL, null=True, blank=True, related_name='ChildDelinquencyLevel')
    StatementType = models.ForeignKey(StatementType, on_delete=models.SET_NULL, null=True, blank=True, related_name='ChildStatementType')
    BillingGroup = models.ForeignKey(BillingGroup, on_delete=models.SET_NULL, null=True, blank=True, related_name='ChildBillingGroup')
    Company = models.ForeignKey(Company, on_delete=models.SET_NULL, null=True, blank=True, related_name='ChildCompany')
    B_PO_NUM = models.CharField(max_length=25, null=True)
    BillArea = models.ForeignKey(BillArea, on_delete=models.SET_NULL, null=True, blank=True, related_name='ChildBillArea')
    TaxArea = models.ForeignKey(TaxArea, on_delete=models.SET_NULL, null=True, blank=True, related_name='ChildTaxArea')
    B_PAGE = models.IntegerField(null=True)
    B_PAYBYCC = models.BooleanField(null=True)
    B_CONTRACT_NUM = models.CharField(max_length=30, null=True)
    B_CONTRACT_DATE = models.DateTimeField(null=True)
    C_15D = models.DecimalField(max_digits=18, decimal_places=5, null=True)
    C_45D = models.DecimalField(max_digits=18, decimal_places=5, null=True)
    REFERRAL = models.CharField(max_length=80, null=True)
    SREP1 = models.ForeignKey(CustomerRep, on_delete=models.SET_NULL, null=True, blank=True, related_name='childSREP1')
    SREP2 = models.ForeignKey(CustomerRep, on_delete=models.SET_NULL, null=True, blank=True, related_name='childSREP2')
    CREP1 = models.ForeignKey(CustomerRep, on_delete=models.SET_NULL, null=True, blank=True, related_name='childCREP1')
    CREP2 = models.ForeignKey(CustomerRep, on_delete=models.SET_NULL, null=True, blank=True, related_name='childCREP2')
    B_NAME_2ND = models.CharField(max_length=50, null=True)
    B_NAME_2ND2 = models.CharField(max_length=50, null=True)
    B_ADDR1_2ND = models.CharField(max_length=50, null=True)
    B_ADDR1_2ND2 = models.CharField(max_length=50, null=True)
    B_CITY_2ND = models.CharField(max_length=50, null=True)
    B_STATE_2ND = models.CharField(max_length=20, null=True)
    B_ZIP_2ND = models.CharField(max_length=20, null=True)
    C_DEPOSIT = models.DecimalField(max_digits=18, decimal_places=5, null=True)
    CREP1_NOTES = models.CharField(max_length=80, null=True)
    CREP2_NOTES = models.CharField(max_length=80, null=True)
    SREP1_NOTES = models.CharField(max_length=80, null=True)
    SREP2_NOTES = models.CharField(max_length=80, null=True)
    C_TYPE2 = models.BooleanField(null=True)
    C_TYPE3 = models.BooleanField(null=True)
    B_MTD = models.FloatField(null=True)
    B_YTD = models.FloatField(null=True)
    B_LMTD = models.FloatField(null=True)
    B_LYTD = models.FloatField(null=True)
    B_TERMS = models.IntegerField(null=True)
    REFERRAL2 = models.IntegerField(null=True)
    KFACTOR = models.DecimalField(max_digits=10, decimal_places=3, null=True)
    GAL_DEGREE_DAY = models.FloatField(null=True)
    LCK_GAL_DEGREE_DAY = models.BooleanField(null=True)
    GAL_DAY = models.FloatField(null=True)
    LCK_GAL_DAY = models.BooleanField(null=True)
    BillingInfo1 = models.ForeignKey(BillScreenInfo, on_delete=models.SET_NULL, null=True, blank=True, related_name='childBillingInfo1')
    BillingInfo2 = models.ForeignKey(BillScreenInfo, on_delete=models.SET_NULL, null=True, blank=True, related_name='childBillingInfo2')
    BillingInfo3 = models.ForeignKey(BillScreenInfo, on_delete=models.SET_NULL, null=True, blank=True, related_name='childBillingInfo3')
    BillingInfo4 = models.ForeignKey(BillScreenInfo, on_delete=models.SET_NULL, null=True, blank=True, related_name='childBillingInfo4')
    T_ID = models.IntegerField(null=True)
    OUTPUT = models.IntegerField(null=True)
    C_120D = models.DecimalField(max_digits=18, decimal_places=5, null=True)
    C_150D = models.DecimalField(max_digits=18, decimal_places=5, null=True)
    B_SURCHARGE = models.IntegerField(null=True)
    SITEFILE = models.CharField(max_length=255, null=True)
    QUOTE_SHEET = models.CharField(max_length=255, null=True)
    C_TYPE4 = models.CharField(max_length=1, null=True)
    C_TYPE5 = models.CharField(max_length=1, null=True)
    C_TYPE6 = models.CharField(max_length=1, null=True)
    C_TYPE7 = models.CharField(max_length=1, null=True)
    C_TYPE8 = models.CharField(max_length=1, null=True)
    C_TYPE9 = models.CharField(max_length=1, null=True)
    C_LOCS2 = models.CharField(max_length=1, null=True)
    C_NLOCS2 = models.IntegerField(null=True)
    C_SUFFIX2 = models.IntegerField(null=True)
    ISCHILD2 = models.BooleanField(null=True)
    C_LOCS3 = models.CharField(max_length=1, null=True)
    C_NLOCS3 = models.IntegerField(null=True)
    C_SUFFIX3 = models.IntegerField(null=True)
    ISCHILD3 = models.BooleanField(null=True)
    TOTAL_TONS = models.DecimalField(max_digits=18, decimal_places=5, null=True)
    GUARANTEED_PRICE = models.BooleanField(null=True)
    C_CURRENCY = models.CharField(max_length=5, null=True)
    REGION = models.CharField(max_length=50, null=True)
    DISTRICT = models.CharField(max_length=50, null=True)
    PROFILE_AREA = models.CharField(max_length=50, null=True)
    CLIENT_ID = models.CharField(max_length=50, null=True)
    BUSINESS_UNIT = models.CharField(max_length=50, null=True)
    LOCATION_TYPE = models.CharField(max_length=50, null=True)
    RANK_CLASS = models.CharField(max_length=50, null=True)
    DIVISION = models.CharField(max_length=50, null=True)
    CLIENT_SHARED_PERCENTAGE = models.IntegerField(null=True)
    SURCHARGE_BENCHMARK = models.DecimalField(max_digits=18, decimal_places=5, null=True)
    LOCATION_ID = models.CharField(max_length=50, null=True)
    NATIONAL_ACCT = models.BooleanField(null=True)
    V_STORENO = models.CharField(max_length=30, null=True)
    PARENT_C_ID = models.IntegerField(null=True)
    AUTHORIZEDPAYEE = models.CharField(max_length=50, null=True)
    REBATEPAY = models.IntegerField(null=True)
    LastUpdated = models.DateTimeField(null=True)
    B_QB_PATH = models.CharField(max_length=255, null=True)
    ContactViaPhone = models.IntegerField(null=True)
    Tax_Exempt_ID = models.CharField(max_length=50, null=True)
    Flex_Date = models.DateTimeField(null=True)
    AutoEmailCustomerReceipt = models.BooleanField(null=True)
    Relationship = models.CharField(max_length=10)
    Parent_id_alpha = models.CharField(max_length=54, null=True, blank=True)
    status = models.ForeignKey(Status, on_delete=models.SET_NULL, null=True, blank=True, related_name='childStatus')
    MasterAccount = models.ForeignKey(MasterAccount, on_delete=models.SET_NULL, null=True, blank=True, related_name='ChildMasterAccount')
    Parent = models.ForeignKey(Account, on_delete=models.SET_NULL, null=True, blank=True, related_name='Children')
    BillingInfo = models.ForeignKey(BillingInfo, on_delete=models.SET_NULL, null=True, blank=True, related_name='ChildBilling')
    LocationInfo = models.ForeignKey(LocationInfo, on_delete=models.SET_NULL, null=True, blank=True, related_name='ChildLocation')
    Terms = models.ForeignKey(Terms, on_delete=models.SET_NULL, null=True, blank=True, related_name='ChildTerms')
    C_QUOTE = models.CharField(max_length=50, null=True)
    MigrationStatus = models.CharField(max_length=50, null=True, default='InActive')
    
    # Write a property to return the ARAccount of 'DM' + C_ID
    @property
    def ARAccount(self):
        return 'DM' + str(self.C_ID)


    class Meta:
        db_table = 'Child'

    def __str__(self):
        return self.C_ID_ALPHA
      
    

class Customer(models.Model):
    Parent = models.ForeignKey(Account, on_delete=models.SET_NULL, null=True, blank=True, related_name='ChildCustomer')
    c_id = models.IntegerField(null=True)
    c_id_alpha = models.CharField(max_length=255, null=True)
    ar_account_code = models.CharField(max_length=255, null=True)
    company = models.CharField(max_length=255, null=True)
    customer_name = models.CharField(max_length=255, null=True)
    currency = models.CharField(max_length=255, null=True)
    invoice_cycle = models.CharField(max_length=255, null=True)
    invoice_frequency_term = models.CharField(max_length=255, null=True)
    payment_term = models.CharField(max_length=255, null=True)
    payment_type = models.CharField(max_length=255, null=True)
    credit_limit = models.CharField(max_length=255, null=True)
    customer_state = models.CharField(max_length=255, null=True)
    invoice_document_delivery_type = models.CharField(max_length=255, null=True)
    ar_ap_documents_option = models.CharField(max_length=255, null=True)
    credit_controller = models.CharField(max_length=255, null=True)
    customer_category = models.CharField(max_length=255, null=True)
    sic_code = models.CharField(max_length=255, null=True)
    combine_ar_ap_for_credit_checks = models.CharField(max_length=255, null=True)
    combine_charges_rebates = models.CharField(max_length=255, null=True)
    is_internal = models.CharField(max_length=255, null=True)
    rct_customer = models.CharField(max_length=255, null=True)
    show_lft_on_invoice = models.CharField(max_length=255, null=True)
    tickets_required_with_invoice = models.CharField(max_length=255, null=True)
    proof_of_service_required = models.CharField(max_length=255, null=True)
    collate_invoices = models.CharField(max_length=255, null=True)
    settlement_percentage = models.CharField(max_length=255, null=True)
    roll_up_invoice_by_service = models.CharField(max_length=255, null=True)
    roll_up_invoice_by_site = models.CharField(max_length=255, null=True)
    customer_invoice_number_required = models.CharField(max_length=255, null=True)
    is_order_number_required = models.CharField(max_length=255, null=True)
    summary_invoice = models.CharField(max_length=255, null=True)
    rebate_billing_option = models.CharField(max_length=255, null=True)
    rebate_invoice_cycle = models.CharField(max_length=255, null=True)
    rebate_invoice_frequency_term = models.CharField(max_length=255, null=True)
    invoices_sent_electronically = models.CharField(max_length=255, null=True)
    one_inv_per_po = models.CharField(max_length=255, null=True)
    one_inv_per_dept = models.CharField(max_length=255, null=True)
    one_inv_per_job = models.CharField(max_length=255, null=True)
    contract_status = models.CharField(max_length=255, null=True)
    exclude_from_statement_run = models.CharField(max_length=255, null=True)
    customer_type = models.CharField(max_length=255, null=True)
    customer_notes = models.CharField(max_length=500, null=True)
    customer_template = models.CharField(max_length=255, null=True)
    customer_group = models.CharField(max_length=255, null=True)
    federal_id = models.CharField(max_length=255, null=True)
    marketing_source = models.CharField(max_length=255, null=True)
    start_date = models.DateField(null=True)
    alt_search_reference = models.CharField(max_length=255, null=True)
    business_sector = models.CharField(max_length=255, null=True)
    ap_account_code = models.CharField(max_length=255, null=True)
    sales_rep = models.CharField(max_length=255, null=True)
    csr = models.CharField(max_length=255, null=True)
    payment_handling_code = models.CharField(max_length=255, null=True)
    rebate_payment_type = models.CharField(max_length=255, null=True)
    rebate_payment_terms = models.CharField(max_length=255, null=True)
    sales_territory = models.CharField(max_length=255, null=True)
    master_ar_account_code = models.CharField(max_length=255, null=True)
    dm_account = models.CharField(max_length=100, null=True)
    Child = models.ForeignKey(Child, on_delete=models.SET_NULL, null=True, blank=True, related_name='ChildCustomer')
    Account = models.ForeignKey(Account, on_delete=models.SET_NULL, null=True, blank=True, related_name='AccountCustomer')

    class Meta:
        db_table = 'Customers'


class CustomerLocations(models.Model):
    C_ID = models.IntegerField(null=True)
    C_ID_ALPHA = models.CharField(max_length=255, null=True)
    B_CONTACT = models.CharField(max_length=255, null=True)
    C_CONTACT = models.CharField(max_length=255, null=True)
    ARAccountCode = models.CharField(max_length=255, null=True)
    UniqRef = models.CharField(max_length=200 ,null=True)
    SiteName = models.CharField(max_length=255, null=True)
    HouseNbr = models.CharField(max_length=255, null=True)
    Address1 = models.CharField(max_length=255, null=True)
    Address2 = models.CharField(max_length=255, null=True)
    Town = models.CharField(max_length=255, null=True)
    County = models.CharField(max_length=255, null=True)
    State = models.CharField(max_length=255, null=True)
    Country = models.CharField(max_length=255, null=True)
    Postcode = models.CharField(max_length=255, null=True)
    CompanyOutlet = models.CharField(max_length=255, null=True)
    TelNbr = models.CharField(max_length=255, null=True)
    FaxNbr = models.CharField(max_length=255, null=True)
    MobileNbr = models.CharField(max_length=255, null=True)
    EmailAddress = models.CharField(max_length=255, null=True)
    SICCode = models.CharField(max_length=255, null=True)
    Zone = models.CharField(max_length=255, null=True)
    AccessContact = models.CharField(max_length=255, null=True)
    DocumentDeliveryType = models.CharField(max_length=255, null=True)
    LocalAuthority = models.CharField(max_length=255, null=True)
    SiteType = models.CharField(max_length=255, null=True)
    LocationDescription = models.CharField(max_length=255, null=True)
    Latitude = models.CharField(max_length=255, null=True)
    Longitude = models.CharField(max_length=255, null=True)
    CustomerSiteState = models.CharField(max_length=255, null=True)
    SalesRepresentative = models.CharField(max_length=255, null=True)
    AltSearchReference = models.CharField(max_length=255, null=True)
    FederalID = models.CharField(max_length=255, null=True)
    CSR = models.CharField(max_length=255, null=True)
    CustomerOrderNo = models.CharField(max_length=255, null=True)
    AnalysisCode = models.CharField(max_length=255, null=True)
    InvoicingAddressSiteID = models.CharField(max_length=255, null=True)
    PaymentType = models.CharField(max_length=255, null=True)
    PaymentTerm = models.CharField(max_length=255, null=True)
    RebatePaymentType = models.CharField(max_length=255, null=True)
    RebatePaymentTerm = models.CharField(max_length=255, null=True)
    PaymentHandlingCode = models.CharField(max_length=255, null=True)
    PayableCycle = models.CharField(max_length=255, null=True)
    MasterChild = models.IntegerField(null=True)
    DifferentBilling = models.IntegerField(null=True)
    MasterParent = models.IntegerField(null=True)
    Taxable = models.IntegerField(null=True)
    TaxArea = models.CharField(max_length=100, null=True)
    HQLocation = models.IntegerField(null=True)
    OperationalArea = models.CharField(max_length=100, null=True)
    DMAccount = models.CharField(max_length=100, null=True)
    Account = models.ForeignKey(Account, on_delete=models.SET_NULL, null=True, blank=True, related_name='AccountCustomerLocation')
    Child = models.ForeignKey(Child, on_delete=models.SET_NULL, null=True, blank=True, related_name='ChildCustomerLocation')
    Billingname2 = models.CharField(max_length=255, null=True)
    BillingAddress2 = models.CharField(max_length=255, null=True)
    Locationname2 = models.CharField(max_length=255, null=True)
    LocationAddress2 = models.CharField(max_length=255, null=True)


    
    class Meta:
        db_table = "CustomerLocations"

    
class Contacts(models.Model):
    ARAccountCode = models.CharField(max_length=255, null=True)
    Salutation = models.CharField(max_length=255, null=True)
    Forename = models.CharField(max_length=255, null=True)
    Surname = models.CharField(max_length=255, null=True)
    JobTitle = models.CharField(max_length=255, null=True)
    TelNbr = models.CharField(max_length=255, null=True)
    TelExtNbr = models.CharField(max_length=255, null=True)
    MobileNbr = models.CharField(max_length=255, null=True)
    FaxNbr = models.CharField(max_length=255, null=True)
    EmailAddress = models.CharField(max_length=255, null=True)
    Notes = models.CharField(max_length=255, null=True)
    ContactType = models.ForeignKey(ContactType, on_delete=models.SET_NULL, null=True, blank=True, related_name='ContactType')
    ContactType2 = models.CharField(max_length=255, null=True)
    ContactType3 = models.CharField(max_length=255, null=True)
    TelNo = models.CharField(max_length=255, null=True)
    FaxNo = models.CharField(max_length=255, null=True)
    Account = models.ForeignKey(Account, on_delete=models.SET_NULL, null=True, blank=True, related_name='AccountContact')
    Child = models.ForeignKey(Child, on_delete=models.SET_NULL, null=True, blank=True, related_name='ChildContact')
    Billingname2 = models.CharField(max_length=255, null=True)

    class Meta:
        db_table = "Contacts"
    
    @property
    def ContactUniqueId(self):
        return {self.id}


    def __str__(self):
        return f'{self.Forename} {self.Surname}'


class ContactLocations(models.Model):
    ARAccountCode = models.CharField(max_length=255, null=True)
    SiteUniqueId = models.CharField(max_length=255, null=True)
    ContactUniqueId = models.ForeignKey(Contacts, on_delete=models.SET_NULL, null=True, blank=True, related_name='ContactUniqueId')
    Account = models.ForeignKey(Account, on_delete=models.SET_NULL, null=True, blank=True, related_name='AccountContactLocation')
    Child = models.ForeignKey(Child, on_delete=models.SET_NULL, null=True, blank=True, related_name='ChildContactLocation')
    
    class Meta:
        db_table = 'ContactLocations'
    

class Routing(models.Model):
    RouteID = models.IntegerField(null=True, default=0)
    RouteType = models.ForeignKey(RouteType, on_delete=models.SET_NULL, null=True, blank=True, related_name='RouteType')
    Company = models.ForeignKey(Company, on_delete=models.SET_NULL, null=True, blank=True, related_name='CompanyRouting')
    RouteNo = models.CharField(max_length=255)
    RouteDescription = models.CharField(max_length=255)
    WhichDay = models.CharField(max_length=255)
    Notes = models.CharField(max_length=255)
    VehicleType = models.CharField(max_length=255)
    PickUpInterval = models.CharField(max_length=255)
    Haulier = models.CharField(max_length=255)
    RouteManagementType = models.CharField(max_length=255)
    NextPlannedDate = models.DateField()
    SingleDayRoute = models.BooleanField(null=False, default=False)
    NoOfStops = models.IntegerField(null=True, default=0)

    class Meta:
        db_table = 'Routing'
    
    def __str__(self):
        return f'{self.RouteNo} {self.RouteDescription} {self.WhichDay}'


class Route(models.Model):
    RouteID = models.IntegerField(null=True, default=0)
    RouteType = models.ForeignKey(RouteType, on_delete=models.SET_NULL, null=True, blank=True, related_name='RouteTypeRoute')
    Company = models.ForeignKey(Company, on_delete=models.SET_NULL, null=True, blank=True, related_name='CompanyRoute')
    RouteNo = models.CharField(max_length=255)
    RouteDescription = models.CharField(max_length=255)
    Notes = models.CharField(max_length=255)
    VehicleType = models.CharField(max_length=255)
    SingleDayRoute = models.BooleanField(null=False, default=False)
    Mon = models.BooleanField(null=False, default=False)
    Tue = models.BooleanField(null=False, default=False)
    Wed = models.BooleanField(null=False, default=False)
    Thu = models.BooleanField(null=False, default=False)
    Fri = models.BooleanField(null=False, default=False)
    Sat = models.BooleanField(null=False, default=False)
    Sun = models.BooleanField(null=False, default=False)

    class Meta:
        db_table = 'Route'

    def __str__(self):
        return f'{self.RouteNo} {self.RouteDescription}'
    

class RouteStops(models.Model):
    C_ID = models.IntegerField(null=True, default=0)
    StopID = models.IntegerField(null=False, default=0)
    Route = models.ForeignKey(Route, on_delete=models.SET_NULL, null=True, blank=True, related_name='Stops')
    Account = models.ForeignKey(Account, on_delete=models.SET_NULL, null=True, blank=True, related_name='AccountRouteStop')
    Child = models.ForeignKey(Child, on_delete=models.SET_NULL, null=True, blank=True, related_name='ChildRouteStop')
    Stop = models.IntegerField(null=False, default=0)
    Comments = models.TextField(null=True)
    StopFrequency = models.CharField(max_length=255)
    NextDate = models.DateField(null=True, blank=True)
    rxFreq = models.CharField(max_length=255, null=True, blank=True)

    class Meta:
        db_table = 'RouteStops'

    @property
    def Street(self):
        if self.Account is not None:
            return self.Account.LocationInfo.Street
        else:
            return self.Child.LocationInfo.Street
   
    def __str__(self):
        return f'{self.Route} {self.Account} {self.Child} {self.Stop}'


# ContainerRoute
class ContainerRoute(models.Model):
    Company = models.ForeignKey(Company, on_delete=models.CASCADE)
    ContainerRouteID = models.IntegerField(null=False, blank=False)
    Container = models.ForeignKey(Containers, on_delete=models.CASCADE)
    SerialNumber = models.CharField(max_length=50, null=False, blank=False)
    PlacedDate = models.DateField(null=True, blank=True)
    Latitude = models.FloatField(null=True, blank=True)
    Longitude = models.FloatField(null=True, blank=True)
    Notes = models.TextField(null=True, blank=True)
    C_ID = models.IntegerField(null=True, blank=True)
    
    
    class Meta:
        db_table = 'ContainerRoute'

    def __str__(self):  
        return f'{self.ContainerRouteID} {self.Container} {self.SerialNumber}'
    


class Communications(models.Model):
    ARAccountCode = models.CharField(max_length=255, null=True)
    CommunicationNo = models.CharField(max_length=255, null=True)
    Type = models.CharField(max_length=255, null=True)
    Classification = models.CharField(max_length=255, null=True)
    Method = models.CharField(max_length=255, null=True)
    Status = models.CharField(max_length=255, null=True)
    Owner = models.CharField(max_length=255, null=True)
    Date = models.DateField(null=True)
    ReviewDate = models.CharField(max_length=255, null=True)
    ContactUniqueId = models.CharField(max_length=255, null=True)
    Notes = models.TextField(null=True)
    DMAccount = models.CharField(max_length=255, null=True)
    Account = models.ForeignKey(Account, on_delete=models.SET_NULL, null=True, blank=True, related_name='AccountCommunication')
    Child = models.ForeignKey(Child, on_delete=models.SET_NULL, null=True, blank=True, related_name='ChildCommunication')

    class Meta:
        db_table = 'Communications'

    def __str__(self):
        return f'{self.Type} ({self.CommunicationNo})'
    

class AgedDebtorsData(models.Model):
    ARAccountCode = models.CharField(max_length=10, null=True)
    DocumentType = models.CharField(max_length=1, null=True)
    DocumentNumber = models.CharField(max_length=100, null=True)
    DocumentDate = models.DateField(null=True)
    DueDate = models.DateField(null=True)
    NetDocumentValue = models.DecimalField(max_digits=18, decimal_places=2, null=True)
    VATCode = models.CharField(max_length=10, null=True)
    VATRateApplied = models.CharField(max_length=10, null=True)
    VATAmount = models.CharField(max_length=10, null=True)
    GrossDocumentValue = models.DecimalField(max_digits=18, decimal_places=2, null=True)
    Notes = models.TextField(null=True)
    OutstandingAmount = models.DecimalField(max_digits=18, decimal_places=2, null=True)
    CompanyOutlet = models.CharField(max_length=60, null=True)
    Department = models.CharField(max_length=60, null=True)
    ReasonCode = models.CharField(max_length=60, null=True)
    Currency = models.CharField(max_length=60, null=True)
    CustomerIDs = models.CharField(max_length=60, null=True)
    CustomerSiteIDs = models.CharField(max_length=10, null=True)
    SiteNames = models.CharField(max_length=60, null=True)
    InvoiceLocationIDs = models.CharField(max_length=10, null=True)
    PaymentTypeIDs = models.CharField(max_length=10, null=True)
    PaymentPointIDs = models.CharField(max_length=10, null=True)
    ReasonIDs = models.CharField(max_length=10, null=True)
    AlternativeSearchReference = models.CharField(max_length=10, null=True)
    DMAccount = models.CharField(max_length=100, null=True)
    LinkID = models.IntegerField(null=True)
    Account = models.ForeignKey(Account, on_delete=models.SET_NULL, null=True, blank=True, related_name='AccountAgedDebtorsData')
    Child = models.ForeignKey(Child, on_delete=models.SET_NULL, null=True, blank=True, related_name='ChildAgedDebtorsData')


    class Meta:
        db_table = 'AgedDebtorsData'



    def __str__(self):
        return f'{self.DocumentNumber} {self.DocumentDate} {self.DueDate} {self.NettDocumentValue} {self.VATAmount} {self.GrossDocumentValue} {self.OutstandingAmount} {self.DMAccount}'
   

class ServiceMapping(models.Model):
    ExampleAccount = models.CharField(max_length=255, null=True)
    NumOfOccurences = models.IntegerField(null=True)
    ServiceCode = models.CharField(max_length=255, null=True)
    ServiceDescription = models.CharField(max_length=255, null=True)
    Size = models.CharField(max_length=255, null=True)
    ContainerType = models.CharField(max_length=255, null=True)
    BillingCycle = models.CharField(max_length=255, null=True)
    Cycle = models.CharField(max_length=255, null=True)
    ServiceCategory = models.CharField(max_length=255, null=True)
    Frequency = models.CharField(max_length=255, null=True)
    PrimaryService = models.CharField(max_length=255, null=True)

    class Meta:
        db_table = 'ServiceMapping'

    def __str__(self):
        return f'{self.ServiceCode} {self.ServiceDescription} {self.ContainerType} {self.BillingCycle} {self.Cycle} {self.ServiceCategory} {self.Frequency} {self.PrimaryService}'
    

class CustomerServiceAgreementPrices(models.Model):
    AgreeNbr = models.CharField(max_length=32, null=True)
    VAT = models.CharField(max_length=30)
    StartDate = models.DateTimeField(null=True)
    ContainerType = models.CharField(max_length=255, null=True)
    PrimaryService = models.CharField(max_length=255, null=True)
    Action = models.CharField(max_length=255, null=True)
    PricingBasis = models.CharField(max_length=20)
    Material = models.CharField(max_length=30)
    MaterialClass = models.CharField(max_length=30)
    UnitOfMeasure = models.CharField(max_length=30)
    Multiply = models.DecimalField(max_digits=18, decimal_places=5, null=True)
    Price = models.DecimalField(max_digits=32, decimal_places=19, null=True)
    RentalPeriod = models.CharField(max_length=255, null=True)
    MinValue = models.IntegerField(null=True)
    MinTon = models.IntegerField(null=True)
    Allowance = models.DecimalField(max_digits=18, decimal_places=5, null=True)
    QuantityFrom = models.IntegerField(null=True)
    QuantityTill = models.IntegerField(null=True)
    PriceParentId = models.IntegerField(null=True)
    IsEstimate = models.IntegerField(null=True)
    TaxTemplateCollection = models.CharField(max_length=30)
    ARAccountCode = models.CharField(max_length=255, null=True)
    DefaultAction = models.IntegerField(null=True)
    PriceType = models.CharField(max_length=30)
    FreqInWeeks = models.CharField(max_length=255, null=True)
    c_id = models.IntegerField()
    CompanyOutlet = models.CharField(max_length=255, null=True)
    OutletAgreement = models.CharField(max_length=30)
    DMAccount = models.CharField(max_length=255, null=True)
    PRORATE = models.CharField(max_length=50, null=True)
    MasterARAccountCode = models.CharField(max_length=255, null=True)
    Items = models.IntegerField(null=True)
    Customer = models.ForeignKey(Customer, on_delete=models.SET_NULL, null=True, blank=True, related_name='CustomerServiceAgreementPrices')
    AutoID = models.IntegerField(null=True)
    size = models.CharField(max_length=255, null=True)
    ServiceCode = models.CharField(max_length=255, null=True)
    ServiceDescription = models.CharField(max_length=255, null=True)

    class Meta: 
        db_table = 'CustomerServiceAgreementPrices'

    def __str__(self):
        return f'{self.AgreeNbr} {self.VAT} {self.StartDate} {self.ContainerType} {self.PrimaryService} {self.Action} {self.PricingBasis} {self.Material} {self.MaterialClass} {self.UnitOfMeasure} {self.Multiply} {self.Price} {self.RentalPeriod} {self.MinValue} {self.MinTon} {self.Allowance} {self.QuantityFrom} {self.QuantityTill} {self.PriceParentId} {self.IsEstimate} {self.TaxTemplateCollection} {self.ARAccountCode} {self.DefaultAction} {self.PriceType} {self.FreqInWeeks} {self.c_id} {self.CompanyOutlet} {self.OutletAgreement} {self.DMAccount} {self.PRORATE} {self.MasterARAccountCode}'
    

class CustomerServiceAgreementHeader(models.Model):
    CompanyOutlet = models.CharField(max_length=255, null=True)
    ARAccountCode = models.CharField(max_length=255, null=True)
    UniqRef = models.CharField(max_length=30, null=True)
    AgreeNbr = models.CharField(max_length=32, null=True)
    ContainerType = models.CharField(max_length=30)
    MaterialClass = models.CharField(max_length=30)
    PrimaryService = models.CharField(max_length=255, null=True)
    ScheduledRouted = models.CharField(max_length=30)
    startdate = models.DateTimeField(null=True)
    Description = models.CharField(max_length=255, null=True)
    VAT = models.CharField(max_length=30)
    RequiresPeriodicDoC = models.CharField(max_length=30)
    ProofOfServiceRequired = models.CharField(max_length=30)
    OrderNumberRequired = models.CharField(max_length=30)
    InvoiceCycle = models.CharField(max_length=30)
    DriverNotes = models.CharField(max_length=30)
    OrderNotes = models.CharField(max_length=30)
    CustomerSuppliesReleaseNumbers = models.CharField(max_length=30)
    InvoiceOnShipDate = models.CharField(max_length=30)
    TransportSupplier = models.CharField(max_length=30)
    CollateInvoices = models.CharField(max_length=30)
    LastInvoiceDate = models.CharField(max_length=30)
    InvoiceFrequencyTerm = models.CharField(max_length=30)
    OutletAgreement = models.CharField(max_length=30)
    MasterARAccountCode = models.CharField(max_length=255, null=True)
    DMAccount = models.CharField(max_length=255, null=True)
    Customer = models.ForeignKey(Customer, on_delete=models.SET_NULL, null=True, blank=True, related_name='CustomerServiceAgreementHeader')


    class Meta:
        db_table = 'CustomerServiceAgreementHeader'

    def __str__(self):
        return f'{self.CompanyOutlet} {self.ARAccountCode} {self.UniqRef} {self.ContainerType} {self.MaterialClass} {self.PrimaryService} {self.ScheduledRouted} {self.startdate} {self.Description} {self.VAT} {self.RequiresPeriodicDoC} {self.ProofOfServiceRequired} {self.OrderNumberRequired} {self.InvoiceCycle} {self.DriverNotes} {self.OrderNotes} {self.CustomerSuppliesReleaseNumbers} {self.InvoiceOnShipDate} {self.TransportSupplier} {self.CollateInvoices} {self.LastInvoiceDate} {self.InvoiceFrequencyTerm} {self.OutletAgreement} {self.MasterARAccountCode} {self.DMAccount} {self.Customer_id}'


class SiteOrderHeader(models.Model):
    CompanyOutlet = models.ForeignKey(Company, on_delete=models.SET_NULL, null=True, blank=True, related_name='CompanySiteOrderHeader')
    ARAccountCode = models.CharField(max_length=10)
    UniqueRefNbr = models.CharField(max_length=50)
    AgreeNbr = models.CharField(max_length=20)
    OrderCombinationGroup = models.CharField(max_length=60)
    ContainerType = models.CharField(max_length=60)
    MaterialType = models.CharField(max_length=100)
    StartDate = models.DateField()
    EndDateIfClosed = models.CharField(max_length=20)
    RouteOrSched = models.CharField(max_length=10)
    IsCustomerOwnedBin = models.CharField(max_length=30)
    InvoiceMethod = models.CharField(max_length=30)
    Haulier = models.CharField(max_length=60)
    DisposalPoint = models.CharField(max_length=60)
    PrimaryService = models.CharField(max_length=50)
    VAT = models.CharField(max_length=60)
    CustomerOrderNumber = models.CharField(max_length=30)
    LastInvoiceDate = models.CharField(max_length=20)
    DriverNotes = models.TextField()
    Notes2 = models.TextField()
    Contact = models.CharField(max_length=30)
    InvoiceCycle = models.CharField(max_length=30)
    PaymentType = models.CharField(max_length=30)
    ServicePointCode = models.CharField(max_length=20)
    Frequency = models.CharField(max_length=40, null=True)
    DMAccount = models.CharField(max_length=30)
    autoid = models.IntegerField()
    CAND_ID = models.IntegerField(null=True)
    ServiceID = models.IntegerField()
    ServiceCode = models.CharField(max_length=255, null=True)
    ServiceDescription = models.CharField(max_length=255, null=True)
    
    class Meta:
        db_table = 'SiteOrderHeader'

class SiteOrderRental(models.Model):
    SiteOrderUniqueRef = models.CharField(max_length=32, null=True)
    AgreeNbr = models.CharField(max_length=32, null=True)
    ContainerType = models.CharField(max_length=255, null=True)
    RentalFrequency = models.CharField(max_length=255, null=True)
    RentalRate = models.DecimalField(max_digits=32, decimal_places=19, null=True)
    RentalStartDate = models.DateField(null=True)
    RentalEndDate = models.CharField(max_length=1)
    RentalQuantity = models.IntegerField(null=True)
    Action = models.CharField(max_length=255, null=True)
    BinsOnSiteBasedOnQuantityNow = models.CharField(max_length=1)
    RentalType = models.CharField(max_length=1)
    StartOnStartOfCycle = models.CharField(max_length=1)
    EndOnEndOfCycle = models.CharField(max_length=1)
    RentalApplication = models.CharField(max_length=1)
    RentalQuantityAttribute = models.CharField(max_length=1)
    PriceNotes = models.CharField(max_length=32, null=True)
    DMAccount = models.CharField(max_length=255, null=True)
    Customer = models.ForeignKey(Customer, on_delete=models.SET_NULL, null=True, blank=True, related_name='CustomerSiteOrderRental')
    ServiceCode = models.CharField(max_length=255, null=True)
    ServiceDescription = models.CharField(max_length=255, null=True)


    class Meta:
        db_table = 'SiteOrderRental'

    def __str__(self):
        return f'{self.SiteOrderUniqueRef} {self.AgreeNbr} {self.ContainerType} {self.RentalFrequency} {self.RentalRate} {self.RentalStartDate} {self.RentalEndDate} {self.RentalQuantity} {self.Action} {self.BinsOnSiteBasedOnQuantityNow} {self.RentalType} {self.StartOnStartOfCycle} {self.EndOnEndOfCycle} {self.RentalApplication} {self.RentalQuantityAttribute} {self.PriceNotes} {self.DMAccount}'
    

class SiteOrderAssignments(models.Model):
    SOAssignmentId = models.IntegerField(null=True)
    SiteOrderUniqueRef = models.CharField(max_length=50)
    Action = models.CharField(max_length=7)
    DayOfWeek = models.IntegerField(null=True)
    RouteTemplate = models.CharField(max_length=255)
    Position = models.IntegerField()
    PickUpInterval = models.CharField(max_length=255)
    ContainerType = models.CharField(max_length=60)
    StartDate = models.DateField()
    RoutedOrScheduled = models.CharField(max_length=40)
    MinLiftQuantity = models.CharField(max_length=1)
    RequiresQuantity = models.CharField(max_length=1)
    NextDueDate = models.CharField(max_length=1)
    Notes = models.TextField(null=True)
    SJVehicle = models.CharField(max_length=1)
    SJDriver = models.CharField(max_length=1)
    DMAccount = models.CharField(max_length=30)
    StopID = models.IntegerField(null=True)

    class Meta:
        db_table = 'SiteOrderAssignments'

    def __str__(self):
        return f'{self.SiteOrderUniqueRef} {self.Action} {self.DayOfWeek} {self.RouteTemplate} {self.Position} {self.PickUpInterval} {self.ContainerType} {self.StartDate} {self.RoutedOrScheduled} {self.MinLiftQuantity} {self.RequiresQuantity} {self.NextDueDate} {self.Notes} {self.SJVehicle} {self.SJDriver} {self.DMAccount}'
    

class CallLog(models.Model):
    c_id = models.IntegerField(null=True)
    ARAccountCode = models.CharField(max_length=10, null=True)
    UniqueRef = models.CharField(max_length=30, null=True) # CustomerLocations UniqRef
    CustomerSite = models.CharField(max_length=255, null=True) # CustomerLocations SiteName
    CallDate = models.DateField(null=True)
    CallType = models.CharField(max_length=30, null=True) # Service Query, Missed Collection, General Inquiry
    Notes = models.TextField(null=False)
    SysUser = models.CharField(max_length=20, null=True)
    CompanyOutlet = models.CharField(max_length=255, null=True) # CustomerLocations CompanyOutlet
    CallDateTime = models.DateTimeField(null=True)

    class Meta:
        db_table = 'CallLog'

    def __str__(self):
        return f'{self.c_id} {self.ARAccountCode} {self.CustomerSite} {self.CallDate} {self.CallType} {self.Notes} {self.SysUser} {self.CompanyOutlet} {self.CallDateTime}'
    


