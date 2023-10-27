package com.datapro.eibs.constants;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.ResourceBundle;

/**
 * @author fhernandez
 */
public class ISOCodes {

	private static final String RESOURCES_FILE_NAME = "ISOCodes";
	public static final String EIBS_CODE_TO_ISO_NUMERIC = "E0";
	public static final String EIBS_CODE_TO_ISO_ALFHA_1 = "E1";
	public static final String EIBS_CODE_TO_ISO_ALFHA_2 = "E2";
	public static final String EIBS_CODE_TO_ISO_ALFHA_3 = "E3";

	public static final HashMap COUNTRY_ISO_CODES = new HashMap();
	public static final HashMap CURRENCY_ISO_CODES = new HashMap();
	
	static {
		ResourceBundle resources = ResourceBundle
				.getBundle(RESOURCES_FILE_NAME);
		Enumeration isoCodes = resources.getKeys();
		while (isoCodes.hasMoreElements()) {
			String key = (String) isoCodes.nextElement();
			String value = resources.getString(key);
			String isoCode = key.substring(key.lastIndexOf('.') + 1, key
					.length());
			if (key.startsWith("3166-1")) {
				// Country Codes
				if (key.indexOf("N1") > 0 || key.indexOf("A2") > 0
						|| key.indexOf("A3") > 0) {
					// We are safe putting all values in a single map
					// because every one is different
					COUNTRY_ISO_CODES.put(isoCode, value);
				} else {
					if (key.indexOf(EIBS_CODE_TO_ISO_ALFHA_3) > 0) {
						COUNTRY_ISO_CODES.put(EIBS_CODE_TO_ISO_ALFHA_3+"."+isoCode, value);
					} else if (key.indexOf(EIBS_CODE_TO_ISO_ALFHA_2) > 0) {
						COUNTRY_ISO_CODES.put(EIBS_CODE_TO_ISO_ALFHA_2+"."+isoCode, value);
					} else if (key.indexOf(EIBS_CODE_TO_ISO_NUMERIC) > 0) {
						COUNTRY_ISO_CODES.put(EIBS_CODE_TO_ISO_NUMERIC+"."+isoCode, value);
					} else {
						COUNTRY_ISO_CODES.put(isoCode, value);
					}
				}
			} else if (key.startsWith("4217")) {
				// We are safe putting all values in a single map
				// because every one is different
				CURRENCY_ISO_CODES.put(isoCode, value);				
			}
		}
	}
	
	/**
	 * @param eibsCode the eibs country code
	 * @param type one of:
	 * <li>EIBS_CODE_TO_ISO_NUMERIC
	 * <li>EIBS_CODE_TO_ISO_ALFHA_2
	 * <li>EIBS_CODE_TO_ISO_ALFHA_3
	 * @return the corresponding ISO Country Code
	 */
	public static String getISOCountryCode(String eibsCode, String type){
		String code = (String)ISOCodes.COUNTRY_ISO_CODES.get(type+"."+eibsCode);
		return code == null ? eibsCode : code;
	}
	
	/**
	 * @param isoCode the ISO country code
	 * @return the IBS country code
	 */
	public static String getIBSCountryCode(String isoCode){
		String code = (String)ISOCodes.COUNTRY_ISO_CODES.get(isoCode.toUpperCase());
		return code == null ? isoCode : code;
	}	
	
	public static String getISOCurrencyCode(String isoCode){
		String code = (String)ISOCodes.CURRENCY_ISO_CODES.get(isoCode);
		return code == null ? isoCode : code;
	}
}
