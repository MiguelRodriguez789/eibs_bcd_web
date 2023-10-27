package com.datapro.presentation.input;

import com.datapro.constants.EibsFields;
/**
 * @author fhernandez
 *
 */
public interface EibsInputConstants extends EibsFields {
	
	public static final int INPUT_TYPE_TEXT 			= 0;
	public static final int INPUT_TYPE_INTEGER 			= 1;
	public static final int INPUT_TYPE_DECIMAL 			= 2;
	public static final int INPUT_TYPE_SIGN_DECIMAL 	= 3;
	public static final int INPUT_TYPE_CURRENCY         = 4;
	
	public final static int EIBS_INPUT_FIELD_AMOUNT_SEPARATORS_LENGTH 			= (EIBS_FIELD_AMOUNT_LENGTH_PART_INTEGER-1)/3+1;
	public final static int EIBS_INPUT_FIELD_AMOUNT_BALANCE_SEPARATORS_LENGTH 	= (EIBS_FIELD_AMOUNT_BALANCE_LENGTH_PART_INTEGER-1)/3+1;
	public final static int EIBS_INPUT_FIELD_AMOUNT_EXT_SEPARATORS_LENGTH 		= (EIBS_FIELD_AMOUNT_EXT_LENGTH_PART_INTEGER-1)/3+1;
	public final static int EIBS_INPUT_FIELD_AVERAGE_SEPARATORS_LENGTH 			= (EIBS_FIELD_AVERAGE_LENGTH_PART_INTEGER-1)/3+1;
	public final static int EIBS_INPUT_FIELD_AVERAGE_EXT_SEPARATORS_LENGTH 		= (EIBS_FIELD_AVERAGE_EXT_LENGTH_PART_INTEGER-1)/3+1;
	public final static int EIBS_INPUT_FIELD_RATE_SEPARATORS_LENGTH 			= (EIBS_FIELD_RATE_LENGTH_PART_INTEGER-1)/3+1;
	public final static int EIBS_INPUT_FIELD_EXCHANGE_RATE_SEPARATORS_LENGTH	= (EIBS_FIELD_EXCHANGE_RATE_LENGTH_PART_INTEGER-1)/3+1;
	public final static int EIBS_INPUT_FIELD_INTEREST_SEPARATORS_LENGTH 		= (EIBS_FIELD_INTEREST_LENGTH_PART_INTEGER-1)/3+1;
	public final static int EIBS_INPUT_FIELD_AMOUNT_FEE_SEPARATORS_LENGTH 		= (EIBS_FIELD_AMOUNT_FEE_LENGTH_PART_INTEGER-1)/3+1;
	public final static int EIBS_INPUT_FIELD_INVESTMENT_SEPARATORS_LENGTH 		= (EIBS_FIELD_INVESTMENT_LENGTH_PART_INTEGER-1)/3+1;
	public final static int EIBS_INPUT_FIELD_PERCENTAGE_SEPARATORS_LENGTH 		= (EIBS_FIELD_PERCENTAGE_LENGTH_PART_INTEGER-1)/3+1;
	public final static int EIBS_INPUT_FIELD_AMOUNT_REVAL_SEPARATORS_LENGTH 	= (EIBS_FIELD_AMOUNT_REVAL_LENGTH_PART_INTEGER-1)/3+1;

	public final static int EIBS_INPUT_FIELD_BANK_LENGTH 				= EIBS_FIELD_BANK_LENGTH;
	public final static int EIBS_INPUT_FIELD_BRANCH_LENGTH 				= EIBS_FIELD_BRANCH_LENGTH;
	public final static int EIBS_INPUT_FIELD_DATE_LENGTH 				= EIBS_FIELD_DATE_LENGTH + 2;
	public final static int EIBS_INPUT_FIELD_YEAR_LENGTH 				= EIBS_FIELD_YEAR_LENGTH;
	public final static int EIBS_INPUT_FIELD_MONTH_LENGTH 				= EIBS_FIELD_MONTH_LENGTH;
	public final static int EIBS_INPUT_FIELD_DAY_LENGTH 				= EIBS_FIELD_DAY_LENGTH;
	public final static int EIBS_INPUT_FIELD_CUSTOMER_LENGTH 			= EIBS_FIELD_CUSTOMER_LENGTH;
	public final static int EIBS_INPUT_FIELD_GBL_CUSTOMER_LENGTH 		= EIBS_FIELD_GBL_CUSTOMER_LENGTH;
	public final static int EIBS_INPUT_FIELD_ACCOUNT_LENGTH 			= EIBS_FIELD_ACCOUNT_LENGTH;
	public final static int EIBS_INPUT_FIELD_GLEDGER_LENGTH 			= EIBS_FIELD_GLEDGER_LENGTH;
	public final static int EIBS_INPUT_FIELD_CURRENCY_LENGTH			= EIBS_FIELD_CURRENCY_LENGTH;
	public final static int EIBS_INPUT_FIELD_BATCH_LENGTH 				= EIBS_FIELD_BATCH_LENGTH;
	public final static int EIBS_INPUT_FIELD_CNOFC_LENGTH       		= EIBS_FIELD_CNOFC_LENGTH;
	public final static int EIBS_INPUT_FIELD_DESCRIPTION_LENGTH			= EIBS_FIELD_DESCRIPTION_LENGTH;
	public final static int EIBS_INPUT_FIELD_CHAR_30_LENGTH     		= EIBS_FIELD_CHAR_30_LENGTH;
	public final static int EIBS_INPUT_FIELD_CHAR_40_LENGTH     		= EIBS_FIELD_CHAR_40_LENGTH;
	
	public final static int EIBS_INPUT_FIELD_ACD_LENGTH 				= EIBS_FIELD_ACD_LENGTH;
	public final static int EIBS_INPUT_FIELD_BROKER_LENGTH 				= EIBS_FIELD_BROKER_LENGTH;
	public final static int EIBS_INPUT_FIELD_CODE_LENGTH 				= EIBS_FIELD_CODE_LENGTH;
	public final static int EIBS_INPUT_FIELD_CHAR_LENGTH 				= EIBS_FIELD_CHAR_LENGTH;
	public final static int EIBS_INPUT_FIELD_COMMISSION_LENGTH 			= EIBS_FIELD_COMMISSION_LENGTH;
	public final static int EIBS_INPUT_FIELD_CARD_NUMBER_LENGTH 		= EIBS_FIELD_CARD_NUMBER_LENGTH;
	public final static int EIBS_INPUT_FIELD_DOCUMENT_CODE_LENGTH 		= EIBS_FIELD_DOCUMENT_CODE_LENGTH;
	public final static int EIBS_INPUT_FIELD_EMAIL_LENGTH 				= EIBS_FIELD_EMAIL_LENGTH;
	public final static int EIBS_INPUT_FIELD_FLAG_LENGTH 				= EIBS_FIELD_FLAG_LENGTH;
	public final static int EIBS_INPUT_FIELD_NAME_FULL_LENGTH 			= EIBS_FIELD_NAME_FULL_LENGTH;
	public final static int EIBS_INPUT_FIELD_INTERNAL_CODE_LENGTH 		= EIBS_FIELD_INTERNAL_CODE_LENGTH;
	public final static int EIBS_INPUT_FIELD_IDENTIFICATION_LENGTH 		= EIBS_FIELD_IDENTIFICATION_LENGTH;
	public final static int EIBS_INPUT_FIELD_LOCAL_FIXED_LENGTH 		= EIBS_FIELD_LOCAL_FIXED_LENGTH;
	public final static int EIBS_INPUT_FIELD_NARRATIVE_LENGTH 			= EIBS_FIELD_NARRATIVE_LENGTH;
	public final static int EIBS_INPUT_FIELD_NAME_LENGTH 				= EIBS_FIELD_NAME_LENGTH;
	public final static int EIBS_INPUT_FIELD_OFFICER_LENGTH 			= EIBS_FIELD_OFFICER_LENGTH;
	public final static int EIBS_INPUT_FIELD_PO_BOX_LENGTH 				= EIBS_FIELD_PO_BOX_LENGTH;
	public final static int EIBS_INPUT_FIELD_PRODUCT_LENGTH 			= EIBS_FIELD_PRODUCT_LENGTH;
	public final static int EIBS_INPUT_FIELD_REFERENCE_LENGTH 			= EIBS_FIELD_REFERENCE_LENGTH;
	public final static int EIBS_INPUT_FIELD_NAME_SHORT_LENGTH 			= EIBS_FIELD_NAME_SHORT_LENGTH;
	public final static int EIBS_INPUT_FIELD_SWIFT_ID_LENGTH 			= EIBS_FIELD_SWIFT_ID_LENGTH;
	public final static int EIBS_INPUT_FIELD_TABLE_LENGTH 				= EIBS_FIELD_TABLE_LENGTH;
	public final static int EIBS_INPUT_FIELD_TELLER_LENGTH 				= EIBS_FIELD_TELLER_LENGTH;
	public final static int EIBS_INPUT_FIELD_THIRD_PARTY_LENGTH 		= EIBS_FIELD_THIRD_PARTY_LENGTH;
	public final static int EIBS_INPUT_FIELD_USER_LENGTH 				= EIBS_FIELD_USER_LENGTH;
	public final static int EIBS_INPUT_FIELD_WEB_LENGTH 				= EIBS_FIELD_WEB_LENGTH;
	public final static int EIBS_INPUT_FIELD_ZIPCODE_LENGTH 			= EIBS_FIELD_ZIPCODE_LENGTH;
	public final static int EIBS_INPUT_FIELD_BUDGET_LENGTH 				= EIBS_FIELD_BUDGET_LENGTH;
	public final static int EIBS_INPUT_FIELD_COST_CENTER_LENGTH 		= EIBS_FIELD_COST_CENTER_LENGTH;
	public final static int EIBS_INPUT_FIELD_CLASS_FIXED_LENGTH 		= EIBS_FIELD_CLASS_FIXED_LENGTH;
	public final static int EIBS_INPUT_FIELD_CHECK_NUMBER_LENGTH 		= EIBS_FIELD_CHECK_NUMBER_LENGTH;
	public final static int EIBS_INPUT_FIELD_ACCOUNT_CLASS_LENGTH 		= EIBS_FIELD_ACCOUNT_CLASS_LENGTH;
	public final static int EIBS_INPUT_FIELD_TRANS_DESC_ID_LENGTH 		= EIBS_FIELD_TRANS_DESC_ID_LENGTH;
	public final static int EIBS_INPUT_FIELD_CREDIT_LINE_LENGTH 		= EIBS_FIELD_CREDIT_LINE_LENGTH;
	public final static int EIBS_INPUT_FIELD_GBL_CREDIT_LINE_LENGTH 	= EIBS_FIELD_GBL_CREDIT_LINE_LENGTH;
	public final static int EIBS_INPUT_FIELD_MAIL_ADDRESS_NUMBER_LENGTH = EIBS_FIELD_MAIL_ADDRESS_NUMBER_LENGTH;
	public final static int EIBS_INPUT_FIELD_PHONE_LENGTH 				= EIBS_FIELD_PHONE_LENGTH;
	public final static int EIBS_INPUT_FIELD_PAYTHRU_SACCOUNT_LENGTH 	= EIBS_FIELD_PAYTHRU_SACCOUNT_LENGTH;
	public final static int EIBS_INPUT_FIELD_BATCH_SEQ_LENGTH 			= EIBS_FIELD_BATCH_SEQ_LENGTH;
	public final static int EIBS_INPUT_FIELD_SEQUENCE_LENGTH 			= EIBS_FIELD_SEQUENCE_LENGTH;
	public final static int EIBS_INPUT_FIELD_TELLER_TRANS_CODE_LENGTH 	= EIBS_FIELD_TELLER_TRANS_CODE_LENGTH;
	public final static int EIBS_INPUT_FIELD_UNIQUE_ID_LENGTH 			= EIBS_FIELD_UNIQUE_ID_LENGTH;
	public final static int EIBS_INPUT_FIELD_TRANSACTION_COUNTER_LENGTH	= EIBS_FIELD_TRANSACTION_COUNTER_LENGTH;
	public final static int EIBS_INPUT_FIELD_TERM_LENGTH 				= EIBS_FIELD_TERM_LENGTH;
	public final static int EIBS_INPUT_FIELD_DAYS_LENGTH 				= EIBS_FIELD_DAYS_LENGTH;
	public final static int EIBS_INPUT_FIELD_QUANTITY_LENGTH 			= EIBS_FIELD_QUANTITY_LENGTH;
	public final static int EIBS_INPUT_FIELD_ENTITY						= EIBS_FIELD_ENTITY_LENGTH;
	
	public final static int EIBS_INPUT_FIELD_AMOUNT_LENGTH 				= 
		EIBS_FIELD_AMOUNT_LENGTH + EIBS_INPUT_FIELD_AMOUNT_SEPARATORS_LENGTH;
	public final static int EIBS_INPUT_FIELD_AMOUNT_BALANCE_LENGTH 		= 
		EIBS_FIELD_AMOUNT_BALANCE_LENGTH + EIBS_INPUT_FIELD_AMOUNT_BALANCE_SEPARATORS_LENGTH;
	public final static int EIBS_INPUT_FIELD_AMOUNT_EXT_LENGTH 			= 
		EIBS_FIELD_AMOUNT_EXT_LENGTH + EIBS_INPUT_FIELD_AMOUNT_EXT_SEPARATORS_LENGTH;
	public final static int EIBS_INPUT_FIELD_AVERAGE_LENGTH 			= 
		EIBS_FIELD_AVERAGE_LENGTH + EIBS_INPUT_FIELD_AVERAGE_SEPARATORS_LENGTH;
	public final static int EIBS_INPUT_FIELD_AVERAGE_EXT_LENGTH 		= 
		EIBS_FIELD_AVERAGE_EXT_LENGTH + EIBS_INPUT_FIELD_AVERAGE_EXT_SEPARATORS_LENGTH;
	public final static int EIBS_INPUT_FIELD_RATE_LENGTH 				= 
		EIBS_FIELD_RATE_LENGTH + EIBS_INPUT_FIELD_RATE_SEPARATORS_LENGTH;
	public final static int EIBS_INPUT_FIELD_EXCHANGE_RATE_LENGTH		= 
		EIBS_FIELD_EXCHANGE_RATE_LENGTH + EIBS_INPUT_FIELD_EXCHANGE_RATE_SEPARATORS_LENGTH;
	public final static int EIBS_INPUT_FIELD_INTEREST_LENGTH			= 
		EIBS_FIELD_INTEREST_LENGTH + EIBS_INPUT_FIELD_INTEREST_SEPARATORS_LENGTH;
	public final static int EIBS_INPUT_FIELD_AMOUNT_FEE_LENGTH			= 
		EIBS_FIELD_AMOUNT_FEE_LENGTH + EIBS_INPUT_FIELD_AMOUNT_FEE_SEPARATORS_LENGTH;
	public final static int EIBS_INPUT_FIELD_INVESTMENT_LENGTH			= 
		EIBS_FIELD_INVESTMENT_LENGTH + EIBS_INPUT_FIELD_INVESTMENT_SEPARATORS_LENGTH;
	public final static int EIBS_INPUT_FIELD_PERCENTAGE_LENGTH			= 
		EIBS_FIELD_PERCENTAGE_LENGTH + EIBS_INPUT_FIELD_PERCENTAGE_SEPARATORS_LENGTH;
	public final static int EIBS_INPUT_FIELD_AMOUNT_REVAL_LENGTH		= 
		EIBS_FIELD_AMOUNT_REVAL_LENGTH + EIBS_INPUT_FIELD_AMOUNT_REVAL_SEPARATORS_LENGTH;
	
	public final static int EIBS_INPUT_FIELD_BANK_SIZE 					= EIBS_INPUT_FIELD_BANK_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_BRANCH_SIZE 				= EIBS_INPUT_FIELD_BRANCH_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_DATE_SIZE 					= EIBS_INPUT_FIELD_DATE_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_YEAR_SIZE 					= EIBS_INPUT_FIELD_YEAR_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_MONTH_SIZE 				= EIBS_INPUT_FIELD_MONTH_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_DAY_SIZE 					= EIBS_INPUT_FIELD_DAY_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_CUSTOMER_SIZE 				= EIBS_INPUT_FIELD_CUSTOMER_LENGTH + 2;
	public final static int EIBS_INPUT_FIELD_GBL_CUSTOMER_SIZE 			= EIBS_INPUT_FIELD_GBL_CUSTOMER_LENGTH + 2;
	public final static int EIBS_INPUT_FIELD_ACCOUNT_SIZE 				= EIBS_INPUT_FIELD_ACCOUNT_LENGTH + 2;
	public final static int EIBS_INPUT_FIELD_GLEDGER_SIZE 				= EIBS_INPUT_FIELD_GLEDGER_LENGTH + 2;
	public final static int EIBS_INPUT_FIELD_CURRENCY_SIZE				= EIBS_INPUT_FIELD_CURRENCY_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_BATCH_SIZE 				= EIBS_INPUT_FIELD_BATCH_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_CNOFC_SIZE         		= EIBS_INPUT_FIELD_CNOFC_LENGTH+1;
	public final static int EIBS_INPUT_FIELD_DESCRIPTION_SIZE       	= EIBS_INPUT_FIELD_DESCRIPTION_LENGTH + 15;
	public final static int EIBS_INPUT_FIELD_CHAR_30_SIZE       		= EIBS_INPUT_FIELD_CHAR_30_LENGTH + 10;
	public final static int EIBS_INPUT_FIELD_CHAR_40_SIZE       		= EIBS_INPUT_FIELD_CHAR_40_LENGTH + 12;
	
	public final static int EIBS_INPUT_FIELD_ACD_SIZE 					= EIBS_FIELD_ACD_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_BROKER_SIZE 				= EIBS_FIELD_BROKER_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_CODE_SIZE 					= EIBS_FIELD_CODE_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_CHAR_SIZE 					= EIBS_FIELD_CHAR_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_COMMISSION_SIZE 			= EIBS_FIELD_COMMISSION_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_CARD_NUMBER_SIZE 			= EIBS_FIELD_CARD_NUMBER_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_DOCUMENT_CODE_SIZE 		= EIBS_FIELD_DOCUMENT_CODE_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_EMAIL_SIZE 				= EIBS_FIELD_EMAIL_LENGTH + 10;
	public final static int EIBS_INPUT_FIELD_FLAG_SIZE 					= EIBS_FIELD_FLAG_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_NAME_FULL_SIZE 			= EIBS_FIELD_NAME_FULL_LENGTH + 20;
	public final static int EIBS_INPUT_FIELD_INTERNAL_CODE_SIZE 		= EIBS_FIELD_INTERNAL_CODE_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_IDENTIFICATION_SIZE 		= EIBS_FIELD_IDENTIFICATION_LENGTH + 2;
	public final static int EIBS_INPUT_FIELD_LOCAL_FIXED_SIZE 			= EIBS_FIELD_LOCAL_FIXED_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_NARRATIVE_SIZE 			= EIBS_FIELD_NARRATIVE_LENGTH + 2;
	public final static int EIBS_INPUT_FIELD_NAME_SIZE 					= EIBS_FIELD_NAME_LENGTH + 2;
	public final static int EIBS_INPUT_FIELD_OFFICER_SIZE 				= EIBS_FIELD_OFFICER_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_PO_BOX_SIZE 				= EIBS_FIELD_PO_BOX_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_PRODUCT_SIZE 				= EIBS_FIELD_PRODUCT_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_REFERENCE_SIZE 			= EIBS_FIELD_REFERENCE_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_NAME_SHORT_SIZE 			= EIBS_FIELD_NAME_SHORT_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_SWIFT_ID_SIZE 				= EIBS_FIELD_SWIFT_ID_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_TABLE_SIZE 				= EIBS_FIELD_TABLE_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_TELLER_SIZE 				= EIBS_FIELD_TELLER_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_THIRD_PARTY_SIZE 			= EIBS_FIELD_THIRD_PARTY_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_USER_SIZE 					= EIBS_FIELD_USER_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_WEB_SIZE 					= EIBS_FIELD_WEB_LENGTH + 10;
	public final static int EIBS_INPUT_FIELD_ZIPCODE_SIZE 				= EIBS_FIELD_ZIPCODE_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_BUDGET_SIZE 				= EIBS_FIELD_BUDGET_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_COST_CENTER_SIZE 			= EIBS_FIELD_COST_CENTER_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_CLASS_FIXED_SIZE 			= EIBS_FIELD_CLASS_FIXED_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_CHECK_NUMBER_SIZE 			= EIBS_FIELD_CHECK_NUMBER_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_ACCOUNT_CLASS_SIZE 		= EIBS_FIELD_ACCOUNT_CLASS_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_TRANS_DESC_ID_SIZE 		= EIBS_FIELD_TRANS_DESC_ID_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_CREDIT_LINE_SIZE 			= EIBS_FIELD_CREDIT_LINE_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_GBL_CREDIT_LINE_SIZE 		= EIBS_FIELD_GBL_CREDIT_LINE_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_MAIL_ADDRESS_NUMBER_SIZE 	= EIBS_FIELD_MAIL_ADDRESS_NUMBER_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_PHONE_SIZE 				= EIBS_FIELD_PHONE_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_PAYTHRU_SACCOUNT_SIZE 		= EIBS_FIELD_PAYTHRU_SACCOUNT_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_BATCH_SEQ_SIZE 			= EIBS_FIELD_BATCH_SEQ_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_SEQUENCE_SIZE 				= EIBS_FIELD_SEQUENCE_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_TELLER_TRANS_CODE_SIZE 	= EIBS_FIELD_TELLER_TRANS_CODE_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_UNIQUE_ID_SIZE 			= EIBS_FIELD_UNIQUE_ID_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_TRANSACTION_COUNTER_SIZE 	= EIBS_FIELD_TRANSACTION_COUNTER_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_TERM_SIZE 					= EIBS_FIELD_TERM_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_DAYS_SIZE 					= EIBS_FIELD_DAYS_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_QUANTITY_SIZE 				= EIBS_FIELD_QUANTITY_LENGTH + 1;
	public final static int EIBS_INPUT_FIELD_ENTITY_SIZE	 			= EIBS_FIELD_ENTITY_LENGTH + 1;
	
	public final static int EIBS_INPUT_FIELD_AMOUNT_SIZE 				= EIBS_INPUT_FIELD_AMOUNT_LENGTH + 2;
	public final static int EIBS_INPUT_FIELD_AMOUNT_BALANCE_SIZE 		= EIBS_INPUT_FIELD_AMOUNT_BALANCE_LENGTH + 2; 
	public final static int EIBS_INPUT_FIELD_AMOUNT_EXT_SIZE 			= EIBS_INPUT_FIELD_AMOUNT_EXT_LENGTH + 2;
	public final static int EIBS_INPUT_FIELD_AVERAGE_SIZE 				= EIBS_INPUT_FIELD_AVERAGE_LENGTH + 2; 
	public final static int EIBS_INPUT_FIELD_AVERAGE_EXT_SIZE 			= EIBS_INPUT_FIELD_AVERAGE_EXT_LENGTH + 2; 
	public final static int EIBS_INPUT_FIELD_RATE_SIZE 					= EIBS_INPUT_FIELD_RATE_LENGTH + 2;
	public final static int EIBS_INPUT_FIELD_EXCHANGE_RATE_SIZE 		= EIBS_INPUT_FIELD_EXCHANGE_RATE_LENGTH + 2; 
	public final static int EIBS_INPUT_FIELD_INTEREST_SIZE 				= EIBS_INPUT_FIELD_INTEREST_LENGTH + 2;
	public final static int EIBS_INPUT_FIELD_AMOUNT_FEE_SIZE 			= EIBS_INPUT_FIELD_AMOUNT_FEE_LENGTH + 2;
	public final static int EIBS_INPUT_FIELD_INVESTMENT_SIZE 			= EIBS_INPUT_FIELD_INVESTMENT_LENGTH + 2; 
	public final static int EIBS_INPUT_FIELD_PERCENTAGE_SIZE 			= EIBS_INPUT_FIELD_PERCENTAGE_LENGTH + 2; 
	public final static int EIBS_INPUT_FIELD_AMOUNT_REVAL_SIZE 			= EIBS_INPUT_FIELD_AMOUNT_REVAL_LENGTH + 2;


}