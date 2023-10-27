package com.datapro.presentation.helps;

import org.apache.commons.lang.StringUtils;

import com.datapro.eibs.constants.HelpTypes;
import com.datapro.presentation.input.EibsInputFields;

/**
 * @author fhernandez
 *
 */

public class EibsInputHelp extends EibsInputFields {

	private static final long serialVersionUID = 3720555656648700295L;
	private int help = -1;

	/**
	 * 
	 */
	public EibsInputHelp() {
		super();
	}
	/**
	 * 
	 */
	public EibsInputHelp(int help) {
		super();
		this.help = help;
	}
    
	public int getHelp() {
		return help;
	}
	
	public void setHelp(int help) {
		this.help = help;
	}
	
	public void setEibsType(String eibsType) {
		super.setEibsType(eibsType);
		super.prepareStyle(STYLEID_TXTRIGHT);

		if (help == -1 ) {
			if (eibsType.equals(EIBS_FIELD_TYPE_BANK)){
				setHelp(HelpTypes.BANK_CODE);
				
			} else if (eibsType.equals(EIBS_FIELD_TYPE_BRANCH)){
				setHelp(HelpTypes.BRANCH_NUMBER); 
				
			} else if (eibsType.equals(EIBS_FIELD_TYPE_CUSTOMER)){
				setHelp(HelpTypes.CUSTOMER_NUMBER);

			} else if (eibsType.equals(EIBS_FIELD_TYPE_GBL_CUSTOMER)){
				setHelp(HelpTypes.GBL_CUSTOMER_NUMBER);

				
			} else if (eibsType.equals(EIBS_FIELD_TYPE_ACCOUNT)){
				setHelp(HelpTypes.ACCOUNT_NUMBER);
				
			} else if (eibsType.equals(EIBS_FIELD_TYPE_GLEDGER)){
				setHelp(HelpTypes.GENERAL_LEDGER_NUMBER);
				
			} else if (eibsType.equals(EIBS_FIELD_TYPE_CURRENCY)){
				setHelp(HelpTypes.CURRENCY_CODE);
				
			} else if (eibsType.equals(EIBS_FIELD_TYPE_CNOFC)){
				setHelp(HelpTypes.CNOF_CODES);
				
			} else if (eibsType.equals(EIBS_FIELD_TYPE_ACD)){
				setHelp(HelpTypes.APPLICATION_CODE_PRODUCTS);
				
			} else if (eibsType.equals(EIBS_FIELD_TYPE_BROKER)){
				setHelp(HelpTypes.BROKER_CODE);
				
			} else if (eibsType.equals(EIBS_FIELD_TYPE_COMMISSION)){
				setHelp(HelpTypes.COMMISSIONS_CODE);
				
			} else if (eibsType.equals(EIBS_FIELD_TYPE_CARD_NUMBER)){
				//setHelp(HelpTypes.);

			} else if (eibsType.equals(EIBS_FIELD_TYPE_DOCUMENT_CODE)){
				setHelp(HelpTypes.DOCUMENTS_TABLE);

			} else if (eibsType.equals(EIBS_FIELD_TYPE_NAME_FULL)){
				setHelp(HelpTypes.CUSTOMER_NUMBER_AND_NAME);

			} else if (eibsType.equals(EIBS_FIELD_TYPE_IDENTIFICATION)){
				setHelp(HelpTypes.CUSTOMER_IDENTIFICATION);

			} else if (eibsType.equals(EIBS_FIELD_TYPE_NAME)){
				setHelp(HelpTypes.CUSTOMER_NUMBER_AND_NAME);

			} else if (eibsType.equals(EIBS_FIELD_TYPE_OFFICER)){
				setHelp(HelpTypes.OFFICER_SEARCH);

			} else if (eibsType.equals(EIBS_FIELD_TYPE_PRODUCT)){
				setHelp(HelpTypes.PRODUCT_CODE);

			} else if (eibsType.equals(EIBS_FIELD_TYPE_REFERENCE)){
				//setHelp(HelpTypes.REFERENCE);

			} else if (eibsType.equals(EIBS_FIELD_TYPE_NAME_SHORT)){
				setHelp(HelpTypes.CUSTOMER_NUMBER_AND_NAME);

			} else if (eibsType.equals(EIBS_FIELD_TYPE_SWIFT_ID)){
				setHelp(HelpTypes.SWIFT_ID);

			} else if (eibsType.equals(EIBS_FIELD_TYPE_TABLE)){
				setHelp(HelpTypes.CNOFT_TABLES);

			} else if (eibsType.equals(EIBS_FIELD_TYPE_TELLER)){
				//setHelp(HelpTypes.);

			} else if (eibsType.equals(EIBS_FIELD_TYPE_THIRD_PARTY)){
				//setHelp(HelpTypes.);

			} else if (eibsType.equals(EIBS_FIELD_TYPE_USER)){
				setHelp(HelpTypes.USER);	
				
			} else if (eibsType.equals(EIBS_FIELD_TYPE_COST_CENTER)){
				setHelp(HelpTypes.COST_CENTER_CODE); 
				
			} /*else if (eibsType.equals(EIBS_FIELD_TYPE_AP_COST_CENTER_ALLOCATION)){
				setHelp(HelpTypes.AP_COST_CENTER_ALLOCATION_CODE); 
				
			}*/ else if (eibsType.equals(EIBS_FIELD_TYPE_CHECK_NUMBER)){
				//setHelp(HelpTypes.);
				
			} else if (eibsType.equals(EIBS_FIELD_TYPE_ACCOUNT_CLASS)){
				//setHelp(HelpTypes.);
				
			} else if (eibsType.equals(EIBS_FIELD_TYPE_TRANS_DESC_ID)){
				//setHelp(HelpTypes.);

			} else if (eibsType.equals(EIBS_FIELD_TYPE_CREDIT_LINE)){
				setHelp(HelpTypes.CREDIT_LINE_NUMBER);

			} else if (eibsType.equals(EIBS_FIELD_TYPE_GBL_CREDIT_LINE)){
				setHelp(HelpTypes.GBL_CREDIT_LINE_NUMBER);				
				
			} else if (eibsType.equals(EIBS_FIELD_TYPE_MAIL_ADDRESS_NUMBER)){
				setHelp(HelpTypes.MAILING_ADDRESS);
				
			} else if (eibsType.equals(EIBS_FIELD_TYPE_TELLER_TRANS_CODE)){
				setHelp(HelpTypes.TRANSACTION_CODES); 
				
			} else if (eibsType.equals(EIBS_FIELD_TYPE_SEQUENCE)){
				
			} else if (eibsType.equals(EIBS_FIELD_TYPE_LOCAL_FIXED)) {
				setHelp(HelpTypes.FIXED_ASSETS_LOCATION);
				
			} else if (eibsType.equals(EIBS_FIELD_TYPE_CLASS_FIXED)) {
				setHelp(HelpTypes.FIXED_ASSETS_CLASS);
				
			} else if (eibsType.equals(EIBS_FIELD_TYPE_PLASTIC)) {
				setHelp(HelpTypes.PLASTIC_TYPE);
				
			} else if (eibsType.equals(EIBS_FIELD_TYPE_ENTITY)){
				setHelp(HelpTypes.ENTITY);				
			}				
		}
	}
    public String getHelpLink(
			String contextPath,
			String skin,
			String fn_param_one,
			String fn_param_two,
			String fn_param_three,
			String fn_param_four,
			String fn_param_five,
			String fn_param_six,
			String fn_param_seven) {
    	
    	return getHelpLink(
				contextPath, 
				skin, 
				getFunction(
						fn_param_one, 
						fn_param_two, 
						fn_param_three, 
						fn_param_four, 
						fn_param_five, 
						fn_param_six, 
						fn_param_seven),
				null);
    }
	
	public String getFunction(
			String fn_param_one,
			String fn_param_two,
			String fn_param_three,
			String fn_param_four,
			String fn_param_five,
			String fn_param_six,
			String fn_param_seven) {
		
		String strFunction = null;
		try {
			switch (help) {
				//eIBS Current
				case HelpTypes.CUSTOMER_NUMBER :
				case HelpTypes.CUSTOMER_NUMBER_AND_NAME :
					//Customer Number
					if (fn_param_one == null) {
						fn_param_one = "";
					}
					//Customer Name
					if (fn_param_two == null) {
						fn_param_two = "";
					}
					//Customer ID
					if (fn_param_three == null) {
						fn_param_three = "";
					}
					/*if (fn_param_four == null) {
						fn_param_four = "";
					}*/
					strFunction =
						"GetCustomerDescId('"
							+ fn_param_one
							+ "','"
							+ fn_param_two
							+ "','"
							+ fn_param_three
							//+ "','"
							//+ fn_param_four
							+ "')";
					break;
				case HelpTypes.CUSTOMER_IDENTIFICATION :
					if (fn_param_one == null) {
						fn_param_one = "";
					}		
					strFunction =
							"GetCustomerDescId('"
								+ ""
								+ "','"
								+ ""
								+ "','"
								+ fn_param_one
								+ "')";					
					
					break;
					
				case HelpTypes.GBL_CUSTOMER_NUMBER :
					//Customer Number
					if (fn_param_one == null) {
						fn_param_one = "";
					}
					//Customer Name
					if (fn_param_two == null) {
						fn_param_two = "";
					}
					//Customer ID
					if (fn_param_three == null) {
						fn_param_three = "";
					}
					/*if (fn_param_four == null) {
						fn_param_four = "";
					}*/
					strFunction =
						"GetGblCustDescId('"
							+ fn_param_one
							+ "','"
							+ fn_param_two
							+ "','"
							+ fn_param_three
							//+ "','"
							//+ fn_param_four
							+ "')";
					break;
				case HelpTypes.ACCOUNT_NUMBER :
					if (fn_param_one != null) {
						if (fn_param_two == null || fn_param_two.equals("")) {
							fn_param_two = "''";
						}
						if (fn_param_three == null) {
							fn_param_three = "";
						} else if(fn_param_three.indexOf("document.") == -1){
							fn_param_three = "'" + fn_param_three + "'";
						}
						if (fn_param_four == null) {
							fn_param_four = "";
						}
						if(fn_param_five != null){
							fn_param_five = StringUtils.isNumeric(fn_param_five) ? "'" + fn_param_five + "'" : fn_param_five;
						}
						if(fn_param_six == null){
							fn_param_six = "undefined";
						}
						
						if(fn_param_five != null){
							strFunction =
									"GetAccByClient('"
										+ fn_param_one
										+ "',"
										+ fn_param_two
										+ ","
										+ fn_param_three
										+ ",'"
										+ fn_param_four
										+ "',"
										+ fn_param_five
										+ ","
										+ fn_param_six
										+ " )";
							
						} else {
							strFunction =
								"GetAccount('"
									+ fn_param_one
									+ "',"
									+ fn_param_two
									+ ","
									+ fn_param_three
									+ ",'"
									+ fn_param_four
									+ "' )";
						}
					}
					break;
					
				case HelpTypes.ACCOUNT_NUMBER_BY_PRODUCT_TYPE :
					if (fn_param_one != null) {
						if (fn_param_two == null || fn_param_two.equals("")) {
							fn_param_two = "''";
						}
						if (fn_param_three == null) {
							fn_param_three = "";
						} else if(fn_param_three.indexOf("document.") == -1){
							fn_param_three = "'" + fn_param_three + "'";
						}
						strFunction =
							"GetAccountByProductType('"
								+ fn_param_one
								+ "',"
								+ fn_param_two
								+ ","
								+ fn_param_three
								+ " )";
					}
					break;
					
				case HelpTypes.USER:
					if (fn_param_one != null) {
						strFunction = "GetUser('" + fn_param_one + "')";
					}
					break;
					
				case HelpTypes.ACCOUNT_BY_CUSTOMER_NUMBER :
					if (fn_param_one != null) {
						if (fn_param_two == null || fn_param_two.equals("") ) {
							fn_param_two = "''";
						} else if(fn_param_two.indexOf("document.") == -1){
							fn_param_two = "'" + fn_param_two + "'";
						}
						if (fn_param_three == null) {
							fn_param_three = "";
						}
						if (fn_param_four == null) {
							fn_param_four = "";
						}
						if (fn_param_five == null) {
							fn_param_five = "''";
						} else if(fn_param_five.indexOf("document.") == -1){
							fn_param_five = "'" + fn_param_five + "'";
						}
						strFunction =
							"GetAccountByCustomer('"
								+ fn_param_one
								+ "',"
								+ fn_param_two
								+ ",'"
								+ fn_param_three
								+ "','"
								+ fn_param_four
								+ "',"
								+ fn_param_five
								+ " )";
					}
					break;
				case HelpTypes.CURRENCY_CODE :
					if (fn_param_one != null) {
						if (fn_param_two == null) {
							fn_param_two = "''";
						} else if(fn_param_two.indexOf("document.") == -1){
							fn_param_two = "'" + fn_param_two + "'";
						}
						
						strFunction = "GetCurrency('" 
							+ fn_param_one
							+ "',"
							+ fn_param_two
							+ ")";
					}
					break;
				case HelpTypes.COMMISSIONS_CODE :
					if (fn_param_one != null) {
						if (fn_param_two == null) {
							fn_param_two = "";
						}
						
						strFunction = "GetCommDef('" 
							+ fn_param_one
							+ "','"
							+ fn_param_two
							+ "')";
					}
					break;					
				case HelpTypes.BRANCH_NUMBER :
					if (fn_param_one != null) {
						if (fn_param_two == null || fn_param_two.equals("")) {
							fn_param_two = "''";
						}
						strFunction =
							"GetBranch('"
								+ fn_param_one
								+ "',"
								+ fn_param_two
								+ ",'"
								+ fn_param_three
								+ "')";
					}
					break;
				case HelpTypes.BANK_CODE :
					if (fn_param_one != null) {
						strFunction =
							"GetBank('"
								+ fn_param_one
								+ "','"
								+ fn_param_two
								+ "' )";
					}
					break;
				case HelpTypes.PRODUCT_CODE :
					if (fn_param_one != null) {
						fn_param_two = fn_param_two == null?"''":fn_param_two;
						fn_param_three = fn_param_three == null?"''":fn_param_three;
						fn_param_four = fn_param_four == null?"''":fn_param_four;
						fn_param_five = fn_param_five == null?"''":fn_param_five;
						strFunction =
							"GetProduct('"
								+ fn_param_one
								+ "',"
								+ fn_param_two
								+ ","
								+ fn_param_three
								+ ",'"
								+ fn_param_four
								+ "',"
								+ fn_param_five
								+ " )";
					}
					break;
				case HelpTypes.APPLICATION_CODE :
					if (fn_param_one != null) {
						if (fn_param_two == null || fn_param_two.equals("")) {
							fn_param_two = "''";
						}
						if (fn_param_three == null || fn_param_three.equals("")) {
							fn_param_three = "";
						}
						strFunction =
							"GetAppCode('"
								+ fn_param_one
								+ "',"
								+ fn_param_two
								+ ",'"
								+ fn_param_three
								+ "' )";
					}
					break;

				case HelpTypes.APPLICATION_CODE_PRODUCTS :
					if (fn_param_one != null) {
						if (fn_param_two == null || fn_param_two.equals("")) {
							fn_param_two = "''";
						}
						strFunction =
							"GetAppCodeProducts('"
								+ fn_param_one
								+ "','"
								+ fn_param_two
								+ "' )";
					}
					break;
					
				case HelpTypes.APPLICATION_CODE_BY_CLASS :
					if (fn_param_one != null) {
						if (fn_param_two == null || fn_param_two.equals("")) {
							fn_param_two = "";
						}
						strFunction =
							"GetAppCodeByClass('"
								+ fn_param_one
								+ "','"								
								+ fn_param_two
								+ "','"
								+ fn_param_three
								+ "' )";
					}
					break;

				case HelpTypes.COST_CENTER_CODE :
					if (fn_param_one != null) {
						strFunction =
							"GetCostCenter('"
							+ fn_param_one
							+ "',"								
							+ fn_param_two
							+ ",'"
							+ fn_param_three
							+ "' )";
					}
					break;
				case HelpTypes.AP_COST_CENTER_ALLOCATION_CODE :
					if (fn_param_one != null) {
						strFunction =
							"GetAPCostCenterAllocation('"
							+ fn_param_one
							+ "',"								
							+ fn_param_two
							+ ",'"
							+ fn_param_three
							+ "' )";
					}
					break;
				case HelpTypes.FLOATING_RATE_TABLES :
					if (fn_param_two != null && fn_param_three != null && fn_param_four != null && fn_param_five != null && fn_param_six != null ) {
						strFunction = "GetFloating('" + fn_param_one + "','" + fn_param_two + "','" + fn_param_three + "','" + fn_param_four + "','" + fn_param_five + "','" + fn_param_six + "' )";
					}else if (fn_param_one != null) {
						strFunction = "GetFloating('" + fn_param_one + "')";
					}
					break;
				case HelpTypes.RATE_TABLES :
					if (fn_param_two == null) {
						fn_param_two = "";
					} 
					if (fn_param_one != null) {
						strFunction = "GetRateTable('" + fn_param_one + "','"
							+ fn_param_two + "' )";
					}
					break;
				case HelpTypes.MAILING_ADDRESS :
					if (fn_param_one != null) {
						strFunction =
							"GetMailing('"
								+ fn_param_one
								+ "',"
								+ fn_param_two
								+ " )";
					}
					break;
				case HelpTypes.CHARGES_TABLES :
					if (fn_param_one != null) {
						strFunction =
							"GetRetCod('"
								+ fn_param_one
								+ "','"
								+ fn_param_two
								+ "',"
								+ fn_param_three
								+ " )";
					}
					break;

				case HelpTypes.CHECKBOOK_TYPES :
					if (fn_param_one != null) {
						strFunction =
							"GetTypCHK('"
								+ fn_param_one
								+ "',"
								+ fn_param_two
								+ ","
								+ fn_param_three
								+ ","
								+ fn_param_four
								+ " )";
					}
					break;
				case HelpTypes.SUB_ACCOUNTS :
					if (fn_param_one != null) {
						strFunction =
							"GetSubAcc('"
								+ fn_param_one
								+ "',"
								+ fn_param_two
								+ " )";
					}
					break;
				case HelpTypes.OVERNIGHT_TABLES :
					if (fn_param_one != null) {
						strFunction =
							"GetOvernTables('"
								+ fn_param_one
								+ "',"
								+ fn_param_two
								+ " )";
					}
					break;

				case HelpTypes.TARIFF_LC_TABLES :
					if (fn_param_one != null) {
						
						if ( fn_param_two == null || fn_param_two.equals("")) {
							fn_param_two = "''" ;
						}
						
						strFunction =
							"GetTariffLC('"
								+ fn_param_one
								+ "',"
								+ fn_param_two
								+ " )";
					}
					break;
				case HelpTypes.TARIFF_DDA_TABLES :
					if (fn_param_one != null) {
						
						if ( fn_param_two == null || fn_param_two.equals("")) {
							fn_param_two = "" ;
						}
						if ( fn_param_three == null || fn_param_three.equals("")) {
							fn_param_three = "" ;
						}
						
						strFunction =
							"GetRetCod('"
								+ fn_param_one
								+ "','"
								+ fn_param_two
								+ "','"
								+ fn_param_three
								+ "')";
					}
					break;
				case HelpTypes.OFFICIAL_CHECKS_NUMBER :
					if (fn_param_one != null) {
						strFunction = "GetCheck('" + fn_param_one + "')";
					}
					break;
				case HelpTypes.FED_ID :
					if (fn_param_one != null) {
						strFunction =
							"GetFedId('"
								+ fn_param_one
								+ "','"
								+ fn_param_two
								+ "' )";
					}
					break;
				case HelpTypes.SWIFT_ID :
					if (fn_param_one != null) {
						strFunction = "GetSwiftId('" + fn_param_one + "')";
					}
					break;

					//eIBS Future Release
				case HelpTypes.PROPOSAL_TYPES :
					if (fn_param_one != null) {
						strFunction =
							"GetProposalTypes("
								+ fn_param_one
								+ ","
								+ fn_param_two
								+ " )";
					}
					break;
				case HelpTypes.ROUTE_CODE :
					if (fn_param_one != null) {
						strFunction =
							"GetRoutes("
								+ fn_param_one
								+ ","
								+ fn_param_two
								+ " )";
					}
					break;
				case HelpTypes.SECURITY_USER_GROUPS :
					if (fn_param_one != null) {
						strFunction =
							"GetGroups('"
								+ fn_param_one
								+ "','"
								+ fn_param_two
								+ "' )";
					}
					break;
				case HelpTypes.PROPOSAL_TYPE_ROUTES :
					if (fn_param_one != null) {
						strFunction =
							"GetRoutes('"
								+ fn_param_one
								+ "','"
								+ fn_param_two
								+ "')";
					}
					break;
				case HelpTypes.PROPOSAL_NEW_TYPES :
					if (fn_param_one != null) {
						strFunction =
							"GetProposalTypes('"
								+ fn_param_one
								+ "','"
								+ fn_param_two
								+ "')";
					}
					break;
				case HelpTypes.EMPLOYMENT_ENTITIES :
					if (fn_param_one != null) {
						strFunction =
							"GetEntities('"
								+ fn_param_one
								+ "','"
								+ fn_param_two
								+ "')";
					}
					break;
				case HelpTypes.USER_CLASSES :
					if (fn_param_one != null) {
						strFunction =
							"GetClasses('"
								+ fn_param_one
								+ "','"
								+ fn_param_two
								+ "','"
								+ fn_param_three
								+ "')";
					}
					break;
				case HelpTypes.SWIFT_DATE :
					if (fn_param_one != null) {
						strFunction =
							"helpDate('S','" + fn_param_one + "','','')";
					}
					break;
				case HelpTypes.FED_DATE :
					if (fn_param_one != null) {
						strFunction =
							"helpDate('F','" + fn_param_one + "','','')";
					}
					break;
				case HelpTypes.STD_DATE :
					if (fn_param_one != null) {
						strFunction =
							"helpDate('D','"
								+ fn_param_one
								+ "','"
								+ fn_param_two
								+ "','"
								+ fn_param_three
								+ "')";
					}
					break;
				case HelpTypes.COMMISSIONS_TABLE :
					if (fn_param_one != null) {
						if (fn_param_two == null || fn_param_two.equals("") ) {
							fn_param_two = "''";
						} else if(fn_param_two.indexOf("document.") == -1){
							fn_param_two = "'" + fn_param_two + "'";
						}
						if (fn_param_three == null || fn_param_three.equals("") ) {
							fn_param_three = "''";
						} else if(fn_param_three.indexOf("document.") == -1){
							fn_param_three = "'" + fn_param_three + "'";
						}
						if (fn_param_four == null || fn_param_four.equals("") ) {
							fn_param_four = "''";
						} else if(fn_param_four.indexOf("document.") == -1){
							fn_param_four = "'" + fn_param_four + "'";
						}
						strFunction =
							"GetCommissionsTable('"
								+ fn_param_one
								+ "',"
								+ fn_param_two
								+ ","
								+ fn_param_three
								+ ","
								+ fn_param_four
								+ ")";
					}
					break;
				case HelpTypes.CONCEPT :
					if (fn_param_one != null) {
						if (fn_param_three == null) {
							fn_param_three = "''";
						}
						if (fn_param_two == null) {
							fn_param_two = "";
						}
						if (fn_param_four == null) {
							fn_param_four = "";
						}
						
						strFunction =
							"GetConcept('"
								+ fn_param_two
								+ "','"
								+ "',"
								+ fn_param_three
								+ ",'"
								+ fn_param_one
								+ "','"
								+ fn_param_four
								+ "')";
					}
					break;

				case HelpTypes.RETAIL_ACCOUNTS_BY_CUSTOMER :
					if (fn_param_one != null) {
						strFunction =
							"GetRetailAccountsByCostumer('"
								+ fn_param_one
								+ "',"
								+ fn_param_two
								+ ")";
					}
					break;
				case HelpTypes.GENERAL_LEDGER_NUMBER_PR :
					if (fn_param_one != null) {
						strFunction = "GetLedgerPR('" + fn_param_one + "' )";
					}
					break;
				case HelpTypes.GENERAL_LEDGER_NUMBER :
					if (fn_param_one != null) {
						
						fn_param_two = (fn_param_two == null) ? "''"
								: (fn_param_two.indexOf("document.") > -1) ? fn_param_two
										: "'" + fn_param_two + "'";	
						fn_param_three = (fn_param_three == null) ? "''"
								: (fn_param_three.indexOf("document.") > -1) ? fn_param_three
										: "'" + fn_param_three + "'";	
						fn_param_four = (fn_param_four == null) ? "''"
								: (fn_param_four.indexOf("document.") > -1) ? fn_param_four
										: "'" + fn_param_four + "'";						
						fn_param_five = (fn_param_five == null) ? "''"
							: (fn_param_five.indexOf("document.") > -1) ? fn_param_five
									: "'" + fn_param_five + "'";
						fn_param_six = 
							(fn_param_six == null)?"''":"'"+fn_param_six+"'";
						
						strFunction =
							"GetLedger('"
								+ fn_param_one
								+ "',"
								+ fn_param_two
								+ ","
								+ fn_param_three
								+ ","
								+ fn_param_four
								+ ","
								+ fn_param_five
								+ ","
								+ fn_param_six
								+ ")" ;
					}
					break;
				case HelpTypes.CUSTOMER_ADDRESS :
					if (fn_param_one != null) {
						strFunction =
							"GetCustomerAddress('"
								+ fn_param_one
								+ "','"
								+ fn_param_two
								+ "','"
								+ fn_param_three
								+ "','"
								+ fn_param_four
								+ "')";
					}
					break;
				case HelpTypes.RETAIL_ACCOUNTS_OR_SWIFT_CODE :
					if (fn_param_one != null) {
						strFunction =
							"GetRetailAccountOrSwiftCode('"
								+ fn_param_one
								+ "',"
								+ fn_param_two
								+ ","
								+ fn_param_three
								+ ")";
					}
					break;
				case HelpTypes.TRANSACTION_CODES :
					if (fn_param_one != null) {
						strFunction =
							"GetTransactionCodes('" + fn_param_one + "')";
					}
					break;
				case HelpTypes.CUSTOMER_SEARCH_NUMBER :
					if (fn_param_one != null) {
						strFunction =
							"GetCustomerNumber('" + fn_param_one + "')";
					}
					break;
				case HelpTypes.CUSTOMER_SEARCH_NUMBER_AND_NAME :
					if (fn_param_one != null) {
						strFunction =
							"GetCustomerNumberDesc('"
								+ fn_param_one
								+ "','"
								+ fn_param_two
								+ "')";
					}
					break;
				case HelpTypes.RETAIL_ACCOUNT_NUMBER :
					if (fn_param_one != null) {
						if (fn_param_two == null) {
							fn_param_two = "";
						}
						strFunction =
							"GetRetailAccountNumber('"
								+ fn_param_one
								+ "','"
								+ fn_param_two
								+ "')";
					}
					break;

				case HelpTypes.TEMPLATES_BY_CUSTOMER :
					if (fn_param_one != null) {
						strFunction =
							"GetTemplatesByCustomer('"
								+ fn_param_one
								+ "',"
								+ fn_param_two
								+ ")";
					}
					break;
				case HelpTypes.ACCOUNT_GENERAL :
					if (fn_param_one != null) {
						strFunction =
							"GetAccountGeneral('"
								+ fn_param_one
								+ "','"
								+ fn_param_two
								+ "' )";
					}
					break;

				case HelpTypes.CREDIT_LINE_NUMBER :
					if (fn_param_one != null) {
						strFunction =
							"GetCreditLine('"
								+ fn_param_one
								+ "',"
								+ fn_param_two
								+ " )";
					}
					break;

				case HelpTypes.GBL_CREDIT_LINE_NUMBER :
					if (fn_param_one != null) {
						strFunction =
							"GetCreditLineGBL('"
								+ fn_param_one
								+ "',"
								+ fn_param_two
								+ " )";
					}
					break;					
					
				case HelpTypes.CNOF_CODES :
					if (fn_param_one != null) {
						strFunction = "GetCNOFCodes('" + fn_param_one + "')";
					}
					break;

				case HelpTypes.PREVISION_TABLES :
					if (fn_param_one != null) {
						strFunction =
							"GetPrevisionTables('" + fn_param_one + "')";
					}
					break;

				case HelpTypes.CNOFT_TABLES :
					if (fn_param_one != null) {
						if (fn_param_two == null) {
							fn_param_two = "";
						}						
						strFunction = "GetCNOFTables('" 
								+ fn_param_one
								+ "','"
								+ fn_param_two
								+ "')";
					}
					break;

				case HelpTypes.ENTITY_SEARCH :
					if (fn_param_one != null) {
						strFunction =
							"GetEntity('"
								+ fn_param_one
								+ "','"
								+ fn_param_two
								+ "')";
					}
					break;

				case HelpTypes.OFFICER_SEARCH :
					if (fn_param_one != null) {
						strFunction = "GetOfficer('" + fn_param_one + "','" + fn_param_two + "')";
						//strFunction = "GetOfficerCodes('" + fn_param_one + "','" + fn_param_two + "')";
					}
					break;

				case HelpTypes.TIME_DEPOSITS_REASON_STOP_PAYMENT :
					if (fn_param_one != null && fn_param_two != null && fn_param_three != null && fn_param_four != null) {
						strFunction =
							"GetCodeDescCNOFC('"
								+ fn_param_one
								+ "','"
								+ fn_param_two
								+ "','"
								+ fn_param_three
								+ "','"
								+ fn_param_four								
								+ "')";
					}
					break;
				case HelpTypes.PROFILE_TABLE :
					if (fn_param_one != null) {
						strFunction = "GetProfileTable('" + fn_param_one + "')";
					}
					break;
				case HelpTypes.NOTIFICATION_DESC :
					if (fn_param_one != null) {
						strFunction =
							"GetNotification('"
								+ fn_param_one
								+ "',"
								+ fn_param_two
								+ ","
								+ fn_param_three
								+ ")";
					}
					break;
				case HelpTypes.DOCUMENTS_TABLE :
					if (fn_param_one != null) {
						strFunction =
							"GetDocumentTable('" + fn_param_one + "')";
					}
					break;

				case HelpTypes.CAUSAL_TABLE :
					if (fn_param_one != null) {
						strFunction = "GetCausalTable('" + fn_param_one + "')";
					}
					break;

				case HelpTypes.CNOF_CODE_APPCODE_ACMST :
					if (fn_param_one != null) {
						strFunction = "GetCNOFCodeApp('" + fn_param_one + "')";
					}
					break;

				case HelpTypes.CNOF_CODE_APPCODE_LOANS :
					if (fn_param_one != null) {
						strFunction = "GetCNOFCodeLoans('" + fn_param_one + "')";
					}
					break;	
					
				case HelpTypes.CNOF_CODE_APPCODE_ALL :
					if (fn_param_one != null) {
						if (fn_param_two == null) {
							fn_param_two = "";
						}
						strFunction = "GetCNOFByApplicationCode('" + fn_param_one + "', "+ fn_param_two +")";
					}
					
					
					break;	
					
					
				case HelpTypes.EIBSFORMS_TEMPLATES :
					if (fn_param_one != null) {
						strFunction =
							"GetEibsFormsTemplate('" + fn_param_one + "')";
					}
					break;
					
				case HelpTypes.LOAN_STRUCTURE_TABLES :
					if (fn_param_one != null) {
						strFunction =
							"GetLoanTable('"
								+ fn_param_one
								+ "',"
								+ fn_param_two
								+ " )";
					}
					break;
					
				case HelpTypes.TREASURY_DEALS_AFTER_BACKOFFICE :
					if (fn_param_one != null) {
						strFunction =
							"GetFeRef('" + fn_param_one + "')";
					}
					break;
					
				case HelpTypes.TREASURY_DEALS_BACKOFFICE_PENDING :
					if (fn_param_one != null) {
						strFunction =
							"GetDlslpRef('"
							+ fn_param_one
							+ "','"
							+ fn_param_two
							+ "','"
							+ fn_param_three + "')";
					}
					break;
					
				case HelpTypes.TREASURY_USER_ID :
					if (fn_param_one != null) {
						strFunction =
							"GetUserT('" + fn_param_one + "')";
					}
					break;
					
				case HelpTypes.BROKER_CODE :
					if (fn_param_one != null) {
						if (fn_param_two == null) {
							fn_param_two = "";
						}
						fn_param_three = (fn_param_three == null) ? "''"
								: (fn_param_three.indexOf("document.") > -1) ? fn_param_three
										: "'" + fn_param_three + "'";	
						if (fn_param_four == null) {
							fn_param_four = "''";
						}
						strFunction =
							"GetBroker('" 
							+ fn_param_one
							+ "','"
							+ fn_param_two
							+ "',"
							+ fn_param_three
							+ ")";
					}
					break;
					
				case HelpTypes.TREASURY_PRODUCT_CODE :
					if (fn_param_one != null) {
						strFunction =
							"GetTreasuryProdType('" 
							+ fn_param_one
							+ "','"
							+ fn_param_two
							+ "')";
					}
					break;
					
				case HelpTypes.COLLATERAL_ACCOUNT_NUMBER :
					if (fn_param_one != null) {
						if (fn_param_two == null) {
							fn_param_two = "";
						}
						if (fn_param_three == null ) {
							fn_param_three = "";
						}
						if (fn_param_four == null) {
							fn_param_four = "";
						}

						strFunction =
							"GetCollateralAcc('" 
							+ fn_param_one
							+ "','"
							+ fn_param_two
							+ "','"
							+ fn_param_three
							+ "','"
							+ fn_param_four
							+ "')";
					}
					break;
					
				case HelpTypes.TREASURY_CLASSIFICATION :
					if (fn_param_one != null) {
						strFunction =
							"GetClassFex('" 
							+ fn_param_one
							+ "',"
							+ fn_param_two
							+ ","
							+ fn_param_three
							+ ","
							+ fn_param_four
							+ ")";
					}
					break;
				case HelpTypes.INVESTMENT_INSTRUMENTS :
					if (fn_param_one != null) {
						
						if (fn_param_two == null) {
							fn_param_two = "''";
						}
						if (fn_param_three == null ) {
							fn_param_three = "";
						}
						if (fn_param_four == null) {
							fn_param_four = "''";
						}
						if (fn_param_five == null) {
							fn_param_five = "";
						}
						
						strFunction =
							"GetInstrumentList('" 
							+ fn_param_one
							+ "','"
							+ fn_param_two
							+ "','"
							+ fn_param_three
							+ "',"
							+ fn_param_four	
							+ ",'"
							+ fn_param_five
							+ "')";
					}
					break;

				case HelpTypes.INVESTMENT_PORTFOLIOS :
					if (fn_param_one != null) {
						strFunction =
							"GetCustomerPortfolio('" 
							+ fn_param_one
							+ "',"
							+ fn_param_two
							+ ",'"
							+ fn_param_three
							+ "')";
					}

					break;
					
				case HelpTypes.INVESTMENT_PORTFOLIO_CASH_ACCOUNTS :
					if (fn_param_one != null) {
						strFunction =
							"GetPortfolioCashAccounts('" 
							+ fn_param_one
							+ "','"
							+ fn_param_two
							+ "','"
							+ fn_param_three
							+ "',"
							+ fn_param_four
							+ ",'"
							+ fn_param_five
							+ "')";
					}

					break;
					
					
				case HelpTypes.INVESTMENTS_ACTIVE_TRADES :
					if (fn_param_one != null) {
						strFunction =
							"GetInvestmentActiveTrades('" 
							+ fn_param_one
							+ "',"
							+ fn_param_two
							+ ","
							+ fn_param_three
							+ ","
							+ fn_param_four
							+ ","
							+ fn_param_five
							+ ")";
					}

					break;
				
				case HelpTypes.ACCOUNT_BY_CLASS :
					if (fn_param_one != null) {
						strFunction =
							"GetAccountByClass('" 
							+ fn_param_one
							+ "',"
							+ fn_param_two
							+ ")";
							
					}

					break;	
					
				case HelpTypes.ACCOUNT_LIST_BY_CLASSES :
					if (fn_param_one != null) {
						strFunction =
							"GetAccountListByClasses('" 
							+ fn_param_one
							+ "',"
							+ fn_param_two
							+ ","
							+ fn_param_three
							+ ")";
							
							
					}

					break;

				case HelpTypes.BUDGET_NUMBER :
					if (fn_param_one != null && fn_param_two!= null && fn_param_three!=null) {
						strFunction =
							"GetBudgetReference('" 
							+ fn_param_one
							+ "',"
							+ fn_param_two
							+ ","
							+ fn_param_three
							+ ")";
					}

					break;

				
				case HelpTypes.ENTITY_AND_ADDRESS :
					
					if (fn_param_one != null && fn_param_two != null  && fn_param_two != null) {
						
						if (fn_param_three == null) {
							fn_param_three = "";
						}
						if (fn_param_four == null ) {
							fn_param_four = "";
						}
						if (fn_param_five == null) {
							fn_param_five = "";
						}
						if (fn_param_six == null) {
							fn_param_six = "";
						}
						if (fn_param_seven == null) {
							fn_param_seven = "";
						}
						
						String[] paramThree = fn_param_three.split("-");
						String address1 = paramThree[0];												
						String address2 = paramThree.length > 1 ? paramThree[1] : "";
						String address3 = paramThree.length > 2 ? paramThree[2] : "";
						
						String[] paramFour = fn_param_four.split("-");
						String country = paramFour[0];												
						String description = paramFour.length > 1 ? paramFour[1] : "";
						
						String[] paramFive = fn_param_five.split("-");
						String state = paramFive[0];												
						String city = paramFive.length > 1 ? paramFive[1] : "";
						String  zipcode = paramFive.length > 2 ? paramFive[2] : "";
						
						strFunction =
							"GetEntityAndAddress('" 
							+ fn_param_one
							+ "','"
							+ fn_param_two
							+ "','"
							+ address1
							+ "','"
							+ address2
							+ "','"
							+ address3
							+ "','"
							+ country
							+ "','"
							+ description
							+ "','"
							+ state
							+ "','"
							+ city
							+ "','"
							+ zipcode
							+ "')";
					}

					break;
				
				case HelpTypes.FIXED_ASSETS_LOCATION :
					if (fn_param_one != null) {
						strFunction =
							"GetLocations('" 
							+ fn_param_one
							+ "')";
					}

					break;
					
				case HelpTypes.FIXED_ASSETS_CLASS :
					if (fn_param_one != null) {
						strFunction =
							"GetAct('" 
							+ fn_param_one
							+ "')";
					}

					break;
					
				case HelpTypes.LOAN_TABLES :
					if (fn_param_two == null) {
						fn_param_two = "";
					}
					if (fn_param_one != null) {
						strFunction =
							"GetLoanTable('" 
							+ fn_param_one
							+ "','"
							+ fn_param_two
							+ "')";
					}

					break;
					
				case HelpTypes.PLASTIC_TYPE :
					if (fn_param_one != null) {
						strFunction =
							"GetPlasticType('" 
							+ fn_param_one
							+ "')";
					}

					break;
					
				case HelpTypes.FIXED_ASSETS_VENDORS :
					if (fn_param_one != null) {
						strFunction =
							"GetVendor('" 
							+ fn_param_one
							+ "','"
							+ fn_param_two
							+ "')";
					}

					break;
					
				case HelpTypes.ENTITY :
					//Contact List Field
					if (fn_param_one == null) {
						fn_param_one = "";
					}
					//Customer Name
					if (fn_param_two == null) {
						fn_param_two = "";
					}
					//Customer ID
					if (fn_param_three == null) {
						fn_param_three = "";
					}
					//Customer number
					if (fn_param_four == null) {
						fn_param_four = "";
					}	
					//Entity Type
					if (fn_param_five == null) {
						fn_param_five = "";
					}
					//Search Type "C/A" "Customer/Account"
					if (fn_param_six == null) {
						fn_param_six = "";
					}
					strFunction =
						"GetEntityRelations('"
							+ fn_param_one
							+ "','"
							+ fn_param_two
							+ "','"
							+ fn_param_three
							+ "',"
							+ fn_param_four
							+ ",'"
							+ fn_param_five
							+ "','"
							+ fn_param_six
							+ "')";
					break;					

				case HelpTypes.CONVENANT_REQUEST :
					if (fn_param_one == null) {
						fn_param_one = "";
					}
					fn_param_two = (fn_param_two == null) ? "''"
							: (fn_param_two.indexOf("document.") > -1) ? fn_param_two
									: "'" + fn_param_two + "'";	
					strFunction =
						"GetCodeCovenantRequest('"
							+ fn_param_one
							+ "',"
							+ fn_param_two
							+ ")";
					break;

				case HelpTypes.CONVENANT_FORM :
					if (fn_param_one == null) {
						fn_param_one = "";
					}
					strFunction =
						"GetCodeCovenantForm('"
							+ fn_param_one
							+ "')";
					break;					
	
				case HelpTypes.COLLECT_DEAL_REQUEST :
					if (fn_param_one == null) {
						fn_param_one = "";
					}
					fn_param_two = (fn_param_two == null) ? "''"
							: (fn_param_two.indexOf("document.") > -1) ? fn_param_two
									: "'" + fn_param_two + "'";	
					strFunction =
						"GetCodeCollectDealRequest('"
							+ fn_param_one
							+ "',"
							+ fn_param_two
							+ ")";
					break;						
					
				default :
					strFunction = "void(0)";
					break;

					
	
			}

		} catch (Exception ex) {
		}
		return (strFunction);
	}
	
	public void release() {
		super.release();
		help = -1;
	}	
}