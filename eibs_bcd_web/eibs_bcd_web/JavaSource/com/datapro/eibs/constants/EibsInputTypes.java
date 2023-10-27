package com.datapro.eibs.constants;

/**
 * @author fhernandez
 *
 */
public interface EibsInputTypes {
	
	//Current eIBS Release
	public static final int CUSTOMER_NUMBER = 1;
	public static final int CUSTOMER_NUMBER_AND_NAME = 2;
	public static final int ACCOUNT_NUMBER = 3;
	public static final int ACCOUNT_NUMBER_AND_NAME = 4;
	public static final int GENERAL_LEDGER_NUMBER = 5;
	public static final int CURRENCY_CODE = 6;
	public static final int BRANCH_NUMBER = 7;
	public static final int CREDIT_LINE_NUMBER = 8;
	public static final int PRODUCT_CODE = 9;
	public static final int COST_CENTER_CODE = 12;
	public static final int PREVISION_TABLES = 13;
	public static final int FLOATING_RATE_TABLES = 14;
	public static final int MAILING_ADDRESS = 15;
	public static final int CONCEPT = 16;
	public static final int RATE_TABLES = 17;
	public static final int CHARGES_TABLES = 18;
	public static final int CHECKBOOK_TYPES = 19;
	public static final int SUB_ACCOUNTS = 20;
	public static final int OVERNIGHT_TABLES = 21;
	public static final int LOAN_TABLES = 22;
	public static final int TARIFF_LC_TABLES = 23;
	public static final int TARIFF_DDA_TABLES = 24;
	public static final int OFFICIAL_CHECKS_NUMBER = 25;
	public static final int FED_ID = 26;
	public static final int SWIFT_ID = 27;
	public static final int SWIFT_DATE = 28;
	public static final int FED_DATE = 29;
	public static final int STD_DATE = 30;
	public static final int BANK_CODE = 31;
	public static final int NOTIFICATION_DESC = 33;
	public static final int EIBSFORMS_TEMPLATES = 34;
	public static final int APPLICATION_CODE = 35;
	public static final int APPLICATION_CODE_PRODUCTS = 36;
	public static final int APPLICATION_CODE_BY_CLASS = 37;
	public static final int SUBJECTIVE_QUALIFICATION = 38;
	public static final int BUDGET_NUMBER = 39;
	public static final int ACCOUNT_BY_CUSTOMER_NUMBER = 40;
	public static final int ACCOUNT_GL_OR_DDA = 41;
	public static final int USER = 42;
	public static final int ACCOUNT_NUMBER_BY_PRODUCT_TYPE = 43;
	public static final int FIXED_ASSETS_LOCATION = 44;
	public static final int FIXED_ASSETS_CLASS = 45;
	public static final int PLASTIC_TYPE = 46;
	public static final int FIXED_ASSETS_VENDORS = 47;
	public static final int INTERNAL_CODES = 48;
	public static final int ENTITY = 49;
	public static final int CONVENANT_REQUEST = 50;
	public static final int CONVENANT_FORM = 51;
	public static final int COLLECT_DEAL_REQUEST = 52;//convenios de recaudos
	public static final int CUSTOMER_IDENTIFICATION = 53;

	
	//Not in current eIBS Release
	public static final int GBL_CUSTOMER_NUMBER = 77;
	public static final int GBL_CREDIT_LINE_NUMBER = 78;
	public static final int PROPOSAL_TYPES = 100;
	public static final int ROUTE_CODE = 101;
	public static final int COMMISSIONS_CODE = 102;
	public static final int COMMISSIONS_VALUE = 103;
	public static final int COMMISSIONS_TABLE = 104;
	public static final int DOCUMENTS_TABLE = 105;
	public static final int SECURITY_USER_GROUPS = 106;
	public static final int PROPOSAL_TYPE_ROUTES = 107;
	public static final int PROPOSAL_NEW_TYPES = 108;
	public static final int EMPLOYMENT_ENTITIES = 109;
	public static final int USER_CLASSES = 110;
	public static final int RETAIL_ACCOUNTS_BY_CUSTOMER = 111;
	public static final int GENERAL_LEDGER_NUMBER_PR = 112;
	public static final int GENERAL_LEDGER_NUMBER_SPEC = 212;
	public static final int CUSTOMER_ADDRESS = 113;
	public static final int RETAIL_ACCOUNTS_OR_SWIFT_CODE = 114;
	public static final int TRANSACTION_CODES = 115;
	public static final int CUSTOMER_SEARCH_NUMBER = 116;
	public static final int CUSTOMER_SEARCH_NUMBER_AND_NAME = 117;
	public static final int RETAIL_ACCOUNT_NUMBER = 118;
	public static final int TEMPLATES_BY_CUSTOMER = 119;
	public static final int ACCOUNT_GENERAL = 120;
	public static final int CNOF_CODES = 121;
	public static final int CNOFT_TABLES = 122;
	public static final int ENTITY_SEARCH = 123;
	public static final int OFFICER_SEARCH = 124;
	public static final int PROFILE_TABLE = 125;
	public static final int CAUSAL_TABLE = 126;
	public static final int LOAN_STRUCTURE_TABLES = 127;
	public static final int TREASURY_DEALS_AFTER_BACKOFFICE = 128;
	public static final int TREASURY_USER_ID = 129;
	public static final int TREASURY_PRODUCT_CODE = 130;
	public static final int TREASURY_BROKER_ID = 131;
	public static final int BROKER_CODE = 131;
	public static final int COLLATERAL_ACCOUNT_NUMBER = 132;
	public static final int AVAILABLE_COLLATERALS = 133;
	public static final int TREASURY_CLASSIFICATION = 134;
	public static final int INVESTMENT_INSTRUMENTS = 135;
	public static final int INVESTMENT_PORTFOLIOS = 136;
	public static final int TREASURY_DEALS_BACKOFFICE_PENDING = 137;
	public static final int ACCOUNT_BY_CLASS = 138;
	public static final int ACCOUNT_LIST_BY_CLASSES = 139;
	public static final int INVESTMENT_PORTFOLIO_CASH_ACCOUNTS = 140;
	public static final int INVESTMENTS_ACTIVE_TRADES = 141;
	// CNOF Codes Helps
	public static final int CNOF_CODE				= 200; // not needed
	public static final int CNOF_CODE_APPCODE		= 201;
	public static final int CNOF_CODE_APPCODE_ACMST = 202;
	public static final int CNOF_CODE_APPCODE_LOANS = 203;
	public static final int CNOF_CODE_APPCODE_ALL	= 204;
	public static final int CNOF_CODE_FILTERED		= 210;



	//CodeDescCNOFC helps
	public static final int TIME_DEPOSITS_REASON_STOP_PAYMENT = 408;
	
	public static final int ENTITY_AND_ADDRESS = 500;
	
	// AP/PO Cost Center Distribution
	public static final int AP_COST_CENTER_ALLOCATION_CODE = 600;
	
}
