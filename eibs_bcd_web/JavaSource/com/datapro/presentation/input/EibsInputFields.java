package com.datapro.presentation.input;

import javax.servlet.jsp.JspException;


/**
 * @author fhernandez
 *
 */

public class EibsInputFields extends EibsInput {

	private static final long serialVersionUID = 7791740213182990973L;
	private boolean required;
	private String eibsType;
	private String modified;
	private String modvalue;
	/**
	 * 
	 */
	public EibsInputFields() {
		super();
	}

	public EibsInputFields(String eibsType) {
		super();
		setEibsType(eibsType);
	}	
	/**
	 * @return Returns the mandatory.
	 */
	public boolean isRequired() {
		return required;
	}
	/**
	 * @param mandatory The mandatory to set.
	 */
	public void setRequired(boolean required) {
		this.required = required;
	}
	public String getEibsType() {
		return eibsType;
	}
	
	public void setEibsType(String eibsType) {
		this.eibsType = eibsType;
		
		if (eibsType.equals(EIBS_FIELD_TYPE_TEXT)){
			setType(INPUT_TYPE_TEXT);
			
		} else if (eibsType.equals(EIBS_FIELD_TYPE_INTEGER)){
			setType(INPUT_TYPE_INTEGER);
			prepareStyle(STYLEID_TXTRIGHT);
			
		} else if  (eibsType.equals(EIBS_FIELD_TYPE_DECIMAL)){
			setType(INPUT_TYPE_DECIMAL);
			prepareStyle(STYLEID_TXTRIGHT);
			
		} else if  (eibsType.equals(EIBS_FIELD_TYPE_SIGN_DECIMAL)){
			setType(INPUT_TYPE_SIGN_DECIMAL);
			prepareStyle(STYLEID_TXTRIGHT);
			
		} else if (eibsType.equals(EIBS_FIELD_TYPE_BANK)){
			setType(INPUT_TYPE_TEXT);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_BANK_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_BANK_LENGTH);
			
		} else if (eibsType.equals(EIBS_FIELD_TYPE_BRANCH)){
			setType(INPUT_TYPE_INTEGER);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_BRANCH_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_BRANCH_LENGTH); 
			prepareStyle(STYLEID_TXTRIGHT);
			
		} else if (eibsType.equals(EIBS_FIELD_TYPE_DATE)){
			setType(INPUT_TYPE_TEXT);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_DATE_SIZE);
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_DATE_LENGTH);
			prepareStyle(STYLEID_TXTRIGHT);
			
		} else if (eibsType.equals(EIBS_FIELD_TYPE_YEAR)){
			setType(INPUT_TYPE_INTEGER);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_YEAR_SIZE);
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_YEAR_LENGTH);
			prepareStyle(STYLEID_TXTRIGHT);
			
		} else if (eibsType.equals(EIBS_FIELD_TYPE_MONTH)){
			setType(INPUT_TYPE_INTEGER);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_MONTH_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_MONTH_LENGTH);
			prepareStyle(STYLEID_TXTRIGHT);
			
		} else if (eibsType.equals(EIBS_FIELD_TYPE_DAY)){
			setType(INPUT_TYPE_INTEGER);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_DAY_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_DAY_LENGTH); 
			prepareStyle(STYLEID_TXTRIGHT);
			
		} else if (eibsType.equals(EIBS_FIELD_TYPE_CUSTOMER)){
			setType(INPUT_TYPE_INTEGER);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_CUSTOMER_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_CUSTOMER_LENGTH); 
			prepareStyle(STYLEID_TXTRIGHT);
			
		} else if (eibsType.equals(EIBS_FIELD_TYPE_GBL_CUSTOMER)){
			setType(INPUT_TYPE_INTEGER);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_GBL_CUSTOMER_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_GBL_CUSTOMER_LENGTH); 
			prepareStyle(STYLEID_TXTRIGHT);

		} else if (eibsType.equals(EIBS_FIELD_TYPE_ACCOUNT)){
			setType(INPUT_TYPE_INTEGER);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_ACCOUNT_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_ACCOUNT_LENGTH); 
			prepareStyle(STYLEID_TXTRIGHT);
			
		} else if (eibsType.equals(EIBS_FIELD_TYPE_GLEDGER)){
			setType(INPUT_TYPE_INTEGER);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_GLEDGER_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_GLEDGER_LENGTH); 
			prepareStyle(STYLEID_TXTRIGHT);
			
		} else if (eibsType.equals(EIBS_FIELD_TYPE_CURRENCY)){
			setType(INPUT_TYPE_TEXT);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_CURRENCY_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_CURRENCY_LENGTH); 
			
		} else if (eibsType.equals(EIBS_FIELD_TYPE_BATCH)){
			setType(INPUT_TYPE_INTEGER);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_BATCH_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_BATCH_LENGTH); 
			prepareStyle(STYLEID_TXTRIGHT);
			
		} else if (eibsType.equals(EIBS_FIELD_TYPE_CNOFC)){
			setType(INPUT_TYPE_TEXT);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_CNOFC_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_CNOFC_LENGTH); 
			
		} else if (eibsType.equals(EIBS_FIELD_TYPE_DESCRIPTION)){
			setType(INPUT_TYPE_TEXT);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_DESCRIPTION_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_DESCRIPTION_LENGTH);
			
		} else if (eibsType.equals(EIBS_FIELD_TYPE_CHAR_30)){
			setType(INPUT_TYPE_TEXT);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_CHAR_30_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_CHAR_30_LENGTH);

		} else if (eibsType.equals(EIBS_FIELD_TYPE_CHAR_40)){
			setType(INPUT_TYPE_TEXT);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_CHAR_40_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_CHAR_40_LENGTH); 

		} else if (eibsType.equals(EIBS_FIELD_TYPE_ACD)){
			setType(INPUT_TYPE_TEXT);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_ACD_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_ACD_LENGTH); 

		} else if (eibsType.equals(EIBS_FIELD_TYPE_BROKER)){
			setType(INPUT_TYPE_TEXT);
			setSize(""+ EibsInputConstants.EIBS_INPUT_FIELD_BROKER_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_BROKER_LENGTH); 
			prepareStyle(STYLEID_TXTRIGHT);

		} else if (eibsType.equals(EIBS_FIELD_TYPE_CODE)){
			setType(INPUT_TYPE_TEXT);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_CODE_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_CODE_LENGTH); 

		} else if (eibsType.equals(EIBS_FIELD_TYPE_CHAR)){
			setType(INPUT_TYPE_TEXT);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_CHAR_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_CHAR_LENGTH); 

		} else if (eibsType.equals(EIBS_FIELD_TYPE_COMMISSION)){
			setType(INPUT_TYPE_TEXT);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_COMMISSION_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_COMMISSION_LENGTH); 

		} else if (eibsType.equals(EIBS_FIELD_TYPE_CARD_NUMBER)){
			setType(INPUT_TYPE_TEXT);
			setSize(""+ EibsInputConstants.EIBS_INPUT_FIELD_CARD_NUMBER_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_CARD_NUMBER_LENGTH); 

		} else if (eibsType.equals(EIBS_FIELD_TYPE_DOCUMENT_CODE)){
			setType(INPUT_TYPE_TEXT);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_DOCUMENT_CODE_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_DOCUMENT_CODE_LENGTH); 

		} else if (eibsType.equals(EIBS_FIELD_TYPE_EMAIL)){
			setType(INPUT_TYPE_TEXT);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_EMAIL_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_EMAIL_LENGTH); 

		} else if (eibsType.equals(EIBS_FIELD_TYPE_FLAG)){
			setType(INPUT_TYPE_TEXT);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_FLAG_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_FLAG_LENGTH); 

		} else if (eibsType.equals(EIBS_FIELD_TYPE_NAME_FULL)){
			setType(INPUT_TYPE_TEXT);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_NAME_FULL_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_NAME_FULL_LENGTH); 
			prepareStyle(STYLEID_TXTBASE);

		} else if (eibsType.equals(EIBS_FIELD_TYPE_IDENTIFICATION)){
			setType(INPUT_TYPE_TEXT);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_IDENTIFICATION_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_IDENTIFICATION_LENGTH); 

		} else if (eibsType.equals(EIBS_FIELD_TYPE_LOCAL_FIXED)){
			setType(INPUT_TYPE_TEXT);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_LOCAL_FIXED_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_LOCAL_FIXED_LENGTH); 
			
		} else if (eibsType.equals(EIBS_FIELD_TYPE_CLASS_FIXED)){
			setType(INPUT_TYPE_INTEGER);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_CLASS_FIXED_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_CLASS_FIXED_LENGTH); 			

		} else if (eibsType.equals(EIBS_FIELD_TYPE_NARRATIVE)){
			setType(INPUT_TYPE_TEXT);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_NARRATIVE_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_NARRATIVE_LENGTH); 

		} else if (eibsType.equals(EIBS_FIELD_TYPE_NAME)){
			setType(INPUT_TYPE_TEXT);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_NAME_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_NAME_LENGTH); 

		} else if (eibsType.equals(EIBS_FIELD_TYPE_OFFICER)){
			setType(INPUT_TYPE_TEXT);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_OFFICER_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_OFFICER_LENGTH); 

		} else if (eibsType.equals(EIBS_FIELD_TYPE_PO_BOX)){
			setType(INPUT_TYPE_TEXT);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_PO_BOX_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_PO_BOX_LENGTH); 

		} else if (eibsType.equals(EIBS_FIELD_TYPE_PRODUCT)){
			setType(INPUT_TYPE_TEXT);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_PRODUCT_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_PRODUCT_LENGTH); 

		} else if (eibsType.equals(EIBS_FIELD_TYPE_REFERENCE)){
			setType(INPUT_TYPE_TEXT);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_REFERENCE_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_REFERENCE_LENGTH); 

		} else if (eibsType.equals(EIBS_FIELD_TYPE_NAME_SHORT)){
			setType(INPUT_TYPE_TEXT);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_NAME_SHORT_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_NAME_SHORT_LENGTH); 

		} else if (eibsType.equals(EIBS_FIELD_TYPE_SWIFT_ID)){
			setType(INPUT_TYPE_TEXT);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_SWIFT_ID_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_SWIFT_ID_LENGTH); 

		} else if (eibsType.equals(EIBS_FIELD_TYPE_TABLE)){
			setType(INPUT_TYPE_TEXT);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_TABLE_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_TABLE_LENGTH); 

		} else if (eibsType.equals(EIBS_FIELD_TYPE_TELLER)){
			setType(INPUT_TYPE_TEXT);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_TELLER_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_TELLER_LENGTH); 

		} else if (eibsType.equals(EIBS_FIELD_TYPE_THIRD_PARTY)){
			setType(INPUT_TYPE_TEXT);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_THIRD_PARTY_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_THIRD_PARTY_LENGTH); 

		} else if (eibsType.equals(EIBS_FIELD_TYPE_USER)){
			setType(INPUT_TYPE_TEXT);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_USER_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_USER_LENGTH); 

		} else if (eibsType.equals(EIBS_FIELD_TYPE_WEB)){
			setType(INPUT_TYPE_TEXT);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_WEB_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_WEB_LENGTH); 

		} else if (eibsType.equals(EIBS_FIELD_TYPE_ZIPCODE)){
			setType(INPUT_TYPE_TEXT);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_ZIPCODE_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_ZIPCODE_LENGTH); 
		
		} else if (eibsType.equals(EIBS_FIELD_TYPE_AMOUNT)){
			setType(INPUT_TYPE_CURRENCY);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_AMOUNT_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_AMOUNT_LENGTH); 
			setDecimals(EIBS_FIELD_AMOUNT_LENGTH_PART_DECIMAL);
			prepareStyle(STYLEID_TXTRIGHT);

		} else if (eibsType.equals(EIBS_FIELD_TYPE_AMOUNT_BALANCE)){
			setType(INPUT_TYPE_DECIMAL);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_AMOUNT_BALANCE_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_AMOUNT_BALANCE_LENGTH); 
			setDecimals(EibsInputConstants.EIBS_FIELD_AMOUNT_BALANCE_LENGTH_PART_DECIMAL);
			prepareStyle(STYLEID_TXTRIGHT);

		} else if (eibsType.equals(EIBS_FIELD_TYPE_AMOUNT_EXT)){
			setType(INPUT_TYPE_CURRENCY);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_AMOUNT_EXT_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_AMOUNT_EXT_LENGTH); 
			setDecimals(EIBS_FIELD_AMOUNT_EXT_LENGTH_PART_DECIMAL);
			prepareStyle(STYLEID_TXTRIGHT);

		} else if (eibsType.equals(EIBS_FIELD_TYPE_AVERAGE)){
			setType(INPUT_TYPE_CURRENCY);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_AVERAGE_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_AVERAGE_LENGTH); 
			setDecimals(EIBS_FIELD_AVERAGE_LENGTH_PART_DECIMAL);
			prepareStyle(STYLEID_TXTRIGHT);

		} else if (eibsType.equals(EIBS_FIELD_TYPE_AVERAGE_EXT)){
			setType(INPUT_TYPE_DECIMAL);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_AVERAGE_EXT_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_AVERAGE_EXT_LENGTH); 
			setDecimals(EIBS_FIELD_AVERAGE_EXT_LENGTH_PART_DECIMAL);
			prepareStyle(STYLEID_TXTRIGHT);

		} else if (eibsType.equals(EIBS_FIELD_TYPE_RATE)){
			setType(INPUT_TYPE_SIGN_DECIMAL);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_RATE_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_RATE_LENGTH); 
			setDecimals(EibsInputConstants.EIBS_FIELD_RATE_LENGTH_PART_DECIMAL);
			prepareStyle(STYLEID_TXTRIGHT);

		} else if (eibsType.equals(EIBS_FIELD_TYPE_EXCHANGE_RATE)){
			setType(INPUT_TYPE_DECIMAL);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_EXCHANGE_RATE_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_EXCHANGE_RATE_LENGTH); 
			setDecimals(EibsInputConstants.EIBS_FIELD_EXCHANGE_RATE_LENGTH_PART_DECIMAL);
			prepareStyle(STYLEID_TXTRIGHT);

		} else if (eibsType.equals(EIBS_FIELD_TYPE_INTEREST)){
			setType(INPUT_TYPE_SIGN_DECIMAL);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_INTEREST_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_INTEREST_LENGTH); 
			setDecimals(EibsInputConstants.EIBS_FIELD_INTEREST_LENGTH_PART_DECIMAL);
			prepareStyle(STYLEID_TXTRIGHT);
			
		} else if (eibsType.equals(EIBS_FIELD_TYPE_AMOUNT_FEE)){
			setType(INPUT_TYPE_DECIMAL);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_AMOUNT_FEE_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_AMOUNT_FEE_LENGTH); 
			setDecimals(EibsInputConstants.EIBS_FIELD_AMOUNT_FEE_LENGTH_PART_DECIMAL);
			prepareStyle(STYLEID_TXTRIGHT);

		} else if (eibsType.equals(EIBS_FIELD_TYPE_INVESTMENT)){
			setType(INPUT_TYPE_SIGN_DECIMAL);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_INVESTMENT_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_INVESTMENT_LENGTH); 
			setDecimals(EibsInputConstants.EIBS_FIELD_INVESTMENT_LENGTH_PART_DECIMAL);
			prepareStyle(STYLEID_TXTRIGHT);

		} else if (eibsType.equals(EIBS_FIELD_TYPE_PERCENTAGE)){
			setType(INPUT_TYPE_DECIMAL);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_PERCENTAGE_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_PERCENTAGE_LENGTH); 
			setDecimals(EibsInputConstants.EIBS_FIELD_PERCENTAGE_LENGTH_PART_DECIMAL);
			prepareStyle(STYLEID_TXTRIGHT);

		} else if (eibsType.equals(EIBS_FIELD_TYPE_AMOUNT_REVAL)){
			setType(INPUT_TYPE_SIGN_DECIMAL);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_AMOUNT_REVAL_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_AMOUNT_REVAL_LENGTH); 
			setDecimals(EibsInputConstants.EIBS_FIELD_AMOUNT_REVAL_LENGTH_PART_DECIMAL);
			prepareStyle(STYLEID_TXTRIGHT);
			
		} else if (eibsType.equals(EIBS_FIELD_TYPE_BUDGET)){
			setType(INPUT_TYPE_INTEGER);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_BUDGET_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_BUDGET_LENGTH); 
			prepareStyle(STYLEID_TXTRIGHT);
			
		} else if (eibsType.equals(EIBS_FIELD_TYPE_COST_CENTER)){
			setType(INPUT_TYPE_INTEGER);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_COST_CENTER_SIZE);
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_COST_CENTER_LENGTH); 
			prepareStyle(STYLEID_TXTRIGHT);
			
		} else if (eibsType.equals(EIBS_FIELD_TYPE_CLASS_FIXED)){
			setType(INPUT_TYPE_INTEGER);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_CLASS_FIXED_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_CLASS_FIXED_LENGTH);
			prepareStyle(STYLEID_TXTRIGHT);
			
		} else if (eibsType.equals(EIBS_FIELD_TYPE_CHECK_NUMBER)){
			setType(INPUT_TYPE_INTEGER);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_CHECK_NUMBER_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_CHECK_NUMBER_LENGTH); 
			prepareStyle(STYLEID_TXTRIGHT);
			
		} else if (eibsType.equals(EIBS_FIELD_TYPE_ACCOUNT_CLASS)){
			setType(INPUT_TYPE_INTEGER);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_ACCOUNT_CLASS_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_ACCOUNT_CLASS_LENGTH); 
			prepareStyle(STYLEID_TXTRIGHT);
			
		} else if (eibsType.equals(EIBS_FIELD_TYPE_TRANS_DESC_ID)){
			setType(INPUT_TYPE_TEXT);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_TRANS_DESC_ID_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_TRANS_DESC_ID_LENGTH); 

		} else if (eibsType.equals(EIBS_FIELD_TYPE_CREDIT_LINE)){
			setType(INPUT_TYPE_INTEGER);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_CREDIT_LINE_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_CREDIT_LINE_LENGTH); 
			prepareStyle(STYLEID_TXTRIGHT);

		} else if (eibsType.equals(EIBS_FIELD_TYPE_GBL_CREDIT_LINE)){
			setType(INPUT_TYPE_INTEGER);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_GBL_CREDIT_LINE_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_GBL_CREDIT_LINE_LENGTH); 
			prepareStyle(STYLEID_TXTRIGHT);

		} else if (eibsType.equals(EIBS_FIELD_TYPE_MAIL_ADDRESS_NUMBER)){
			setType(INPUT_TYPE_INTEGER);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_MAIL_ADDRESS_NUMBER_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_MAIL_ADDRESS_NUMBER_LENGTH); 
			prepareStyle(STYLEID_TXTRIGHT);

		} else if (eibsType.equals(EIBS_FIELD_TYPE_PHONE)){
			setType(INPUT_TYPE_INTEGER);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_PHONE_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_PHONE_LENGTH); 
			prepareStyle(STYLEID_TXTRIGHT);

		} else if (eibsType.equals(EIBS_FIELD_TYPE_PAYTHRU)){
			setType(INPUT_TYPE_INTEGER);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_PAYTHRU_SACCOUNT_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_PAYTHRU_SACCOUNT_LENGTH); 
			prepareStyle(STYLEID_TXTRIGHT);

		} else if (eibsType.equals(EIBS_FIELD_TYPE_BATCH_SEQ)){
			setType(INPUT_TYPE_INTEGER);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_BATCH_SEQ_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_BATCH_SEQ_LENGTH); 
			prepareStyle(STYLEID_TXTRIGHT);
			
		} else if (eibsType.equals(EIBS_FIELD_TYPE_SEQUENCE)){
			setType(INPUT_TYPE_INTEGER);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_SEQUENCE_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_SEQUENCE_LENGTH); 
			prepareStyle(STYLEID_TXTRIGHT);
			
		} else if (eibsType.equals(EIBS_FIELD_TYPE_TELLER_TRANS_CODE)){
			setType(INPUT_TYPE_INTEGER);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_TELLER_TRANS_CODE_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_TELLER_TRANS_CODE_LENGTH); 
			prepareStyle(STYLEID_TXTRIGHT);

		} else if (eibsType.equals(EIBS_FIELD_TYPE_UNIQUE_ID)){
			setType(INPUT_TYPE_INTEGER);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_UNIQUE_ID_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_UNIQUE_ID_LENGTH); 
			prepareStyle(STYLEID_TXTRIGHT);
			
		} else if (eibsType.equals(EIBS_FIELD_TYPE_INTERNAL_CODE)){
			setType(INPUT_TYPE_TEXT);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_INTERNAL_CODE_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_INTERNAL_CODE_LENGTH); 
		} else if (eibsType.equals(EIBS_FIELD_TYPE_TRANSACTION_COUNTER)){
			setType(INPUT_TYPE_INTEGER);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_TRANSACTION_COUNTER_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_TRANSACTION_COUNTER_LENGTH); 
			prepareStyle(STYLEID_TXTRIGHT);
		} else if (eibsType.equals(EIBS_FIELD_TYPE_TERM)){
			setType(INPUT_TYPE_INTEGER);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_TERM_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_TERM_LENGTH); 
			prepareStyle(STYLEID_TXTRIGHT);
		} else if (eibsType.equals(EIBS_FIELD_TYPE_DAYS)){
			setType(INPUT_TYPE_INTEGER);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_DAYS_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_DAYS_LENGTH); 
			prepareStyle(STYLEID_TXTRIGHT);
		} else if (eibsType.equals(EIBS_FIELD_TYPE_QUANTITY)){
			setType(INPUT_TYPE_INTEGER);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_QUANTITY_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_QUANTITY_LENGTH); 
			prepareStyle(STYLEID_TXTRIGHT);
		} else if (eibsType.equals(EIBS_FIELD_TYPE_PLASTIC)){
			setType(INPUT_TYPE_TEXT);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_CODE_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_INPUT_FIELD_CODE_LENGTH); 
		} else if (eibsType.equals(EIBS_FIELD_TYPE_ENTITY)){
			setType(INPUT_TYPE_TEXT);
			setSize(""+EibsInputConstants.EIBS_INPUT_FIELD_ENTITY_SIZE); 
			setMaxlength(""+EibsInputConstants.EIBS_FIELD_ENTITY_LENGTH); 
		}				
	}
	
	protected void prepareStyle(String style){
		if (getStyleClass() == null || getStyleClass().equals("")) setStyleClass(style);
	}	
	
	protected String prepareStyles() throws JspException {
		String modifiedValue = "";
		if (modified != null){
			modifiedValue = getModifiedValue(modified);			
			if ("Y".equals(modifiedValue.trim())){
				setStyleClass(STYLEID_TXTCHANGED);
			}
		}		
		return super.prepareStyles();
	}

	public String getModified() {
		return modified;
	}

	public void setModified(String modified) {
		this.modified = modified;		
	}
	
	public String getModifiedValue(String flgname) throws JspException {
		modvalue = lookupProperty(getName(), flgname);
		return modvalue;
	}	
	
	public void setModifiedValue(String modvalue) {
		this.modvalue = modvalue;
	}

	public String getInputText(String eibsType, String options) {
		
		setEibsType(eibsType);
		return super.getInputText(options);
	}
	
	public String getInputText(
			String eibsType,
			String fldName,
			String fldValue,
			String options) {

		//setName(fldName);
		setProperty(fldName);
		setValue(fldValue);
		return getInputText(eibsType, options);
	}
	
	public String getInputText(
			String eibsType,
			String fldName,
			String fldValue) {
		
		return getInputText(eibsType, fldName, fldValue, "");
	}
	
	public String getHelpLink(
			String contextPath,
			String skin,
			String function,
			String id) {
		
		StringBuffer sb = new StringBuffer();
		if (function != null) {
			if (id != null)
				sb.append(
					"<a id=\""
						+ id
						+ "\" href=\"javascript:"
						+ function
						+ "\">");
			else
				sb.append(
					"<a id=\"linkHelp\" href=\"javascript:" + function + "\">");
			
			sb.append(
				"<img src=\""
					+ contextPath
					+ "/images/1b.gif\" " + (getAlt() != null ? " title=\""+ getAlt().trim() + "\"" : "") 
					+ "align=\"bottom\" border=\"0\"/>");
			
			//sb.append( "</a>" );
		}
		return sb.toString();
	}
    
	public String getMandatoryIcon(
			String contextPath, 
			String skin) {

		String str =
			"<img src=\""
				+ contextPath
				+ "/images/Check.gif"
				+ "\" align=\"bottom\" border=\"0\"/>";
		return str;
	}
	
	public void release() {
		super.release();
		required = false;
		eibsType = null;
		modified = null;
		modvalue = null;
	}	
	
}