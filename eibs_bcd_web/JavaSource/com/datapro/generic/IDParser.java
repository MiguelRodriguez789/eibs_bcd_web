package com.datapro.generic;

import java.math.BigDecimal;
import java.util.StringTokenizer;

import com.datapro.generic.tool.Util;


public class IDParser {
	
	public static final String ID_TOKEN = "-";
	
	public static final String COUNTRY_VENEZUELA 	= "03";
	public static final String COUNTRY_PANAMA 		= "07";
	public static final String COUNTRY_HONDURAS 	= "11";
	public static final String COUNTRY_DOMINICANA 	= "21";
	
	public static String[] split(String str, String token) {
		StringBuffer fixed = new StringBuffer();
		fixed.append(' ');
		for (int j = 0; j < str.length(); j++) {
			if (str.length() >= j + 2 * token.length()
				&& str.substring(j, j + token.length()).equals(token)
				&& str.substring(
					j + token.length(),
					j + 2 * token.length()).equals(
					token)) {
				fixed.append(token);
				fixed.append(' ');
				j = j + (token.length() - 1);
			} else {
				fixed.append(str.charAt(j));
			}
		}
		fixed.append(' ');
		StringTokenizer st = new StringTokenizer(fixed.toString(), token);
		int i = 0;
		String[] ret = new String[st.countTokens()];
		for (; st.hasMoreElements();) {
			String element = (String) st.nextElement();
			ret[i++] = element.trim();
		}
		return ret;
	}
	
	public static String substring(String string, int from, int to) {
		if (string.length() > to) {
			return string.substring(from, to).toUpperCase();
		} else if (string.length() > from) {
			return string.substring(from, string.length()).toUpperCase();
		} else {
			return "";
		}
	}
	
	private static boolean hasToken(String identification){
		return identification.indexOf(ID_TOKEN) != -1;
	}
	
	/**
	 * @param string
	 */
	public static String[] getIdMatrix(String identification) {
		String matrix[] = null;
		matrix = split(identification, ID_TOKEN);
		if (matrix != null
			&& matrix.length != 0 
			&& matrix[matrix.length - 1] != null) {
			String last = matrix[matrix.length - 1].trim();
			int spacePos = last.indexOf(' ');
			if (spacePos > 0) {
				matrix[matrix.length - 1] = last.substring(0, spacePos);
			}
		}
		return matrix;
	}
	
	public static String[] getIdMatrix(String identification, String country, String legalType) {
		String matrix[] = getIdMatrix(identification);
		if (matrix == null 
			|| !IDParser.validateId(matrix, country, legalType)) {
			//If matrix is not set then the identification does not have a token

			if (country.equals(COUNTRY_PANAMA)){ // Panama
				if (legalType.equals("2")){
					// Personal Customer
					//			09-PI-00001-001277 70
					// 	Provincia Lt Folio Asient DV
					if (!hasToken(identification)) {
						matrix = new String[4];
						matrix[0] = substring(identification, 0, 2);
						if (identification.length() > 13) {
							matrix[1] = substring(identification, 2, 4);
							matrix[2] = substring(identification, 4, 9);
							matrix[3] = substring(identification, 9, 15);
						} else {
							matrix[1] = substring(identification, 2, 2);//Is not saved in DB
							matrix[2] = substring(identification, 2, 7);
							matrix[3] = substring(identification, 7, 13);
						}
					} else {
						if (matrix != null 
							&& matrix[0] != null 
							&& !matrix[0].trim().equals("")){
							if (Character.isLetter(matrix[0].charAt(0))) {
								String nmatrix[] = new String[4];
								nmatrix[0] = " ";
								nmatrix[1] = matrix[0];
								nmatrix[2] = matrix[1];
								nmatrix[3] = matrix[2];
								matrix = nmatrix;
							}
						}
					}
				} else if (legalType.equals("1")
					|| legalType.equals("3")){
					// Corporate Customer
					//		0055496-0012-00304533 50
					//	Tomo-Rollo  Folio  Asiento DV
					if (!hasToken(identification)) {
						matrix = new String[3];					
						matrix[0] = substring(identification, 0, 7);
						matrix[1] = substring(identification, 7, legalType.equals("1") ? 10 : 11);
						matrix[2] = substring(identification, legalType.equals("1") ? 10 : 11, 19);						
					}
				}	
			} else if (country.equals(COUNTRY_VENEZUELA)){ // Venezuela
				//			V-12345678901234 70
				// 		Tipo  Number 		 DV
				if (!hasToken(identification)) {
					matrix = new String[2];
					matrix[0] = substring(identification, 0, 1);
					matrix[1] = substring(identification, 1, 15);					
				}
			} else if (country.equals(COUNTRY_DOMINICANA)){ // Dominicana
				if (legalType.equals("2")){
					// Personal Customer
					//	001-1234567-1
					if (!hasToken(identification)) {
						matrix = new String[2];
						matrix[0] = substring(identification, 0, 3);
						matrix[1] = substring(identification, 3, 10);						
					}
				} else if (legalType.equals("1")
					|| legalType.equals("3")){
					// Corporate Customer
					//	1-12-12345-1
					if (!hasToken(identification)) {
						matrix = new String[3];
						matrix[0] = substring(identification, 0, 1);
						matrix[1] = substring(identification, 1, 3);
						matrix[2] = substring(identification, 3, 8);						
					}
				}
			}
		}
		for (int i = 0; i < matrix.length; i++) {
			matrix[i] = formatId(matrix, i, country, legalType);
		}
		return matrix;
	}
	
	public static boolean validateId(String[] matrix, String country, String legalType) {
		boolean valid = true;
		if (matrix != null && matrix.length != 0
			&& matrix[matrix.length - 1] != null) {
			for (int offset = 0; offset < matrix.length; offset++) {
				if (COUNTRY_VENEZUELA.equals(country)) {
					if (offset == 1) {
						valid = Util.parseBigDec(matrix[offset]).compareTo(BigDecimal.ZERO) > 0;
					} else {
						if ("1".equals(legalType)) {
							valid = "G".equals(matrix[offset])
								|| "J".equals(matrix[offset]);						
						} else {
							valid = "V".equals(matrix[offset])
								|| "E".equals(matrix[offset])
								|| "P".equals(matrix[offset]);
						}
					}
				} else if (COUNTRY_PANAMA.equals(country)) {
					if ("1".equals(legalType)) {// Corporativo
						if (matrix.length > 2) {
							valid = Util.parseBigDec(matrix[0]).compareTo(BigDecimal.ZERO) > 0
										|| Util.parseBigDec(matrix[1]).compareTo(BigDecimal.ZERO) > 0
										|| Util.parseBigDec(matrix[2]).compareTo(BigDecimal.ZERO) > 0;
						} else if (matrix.length > 1) {
							valid = Util.parseBigDec(matrix[0]).compareTo(BigDecimal.ZERO) > 0
										|| Util.parseBigDec(matrix[1]).compareTo(BigDecimal.ZERO) > 0;
						} else {
							valid = Util.parseBigDec(matrix[0]).compareTo(BigDecimal.ZERO) > 0;
						}
					} else {
						if (matrix.length < 4) {
							valid = false;
						}
						if (offset == 2) {
							valid = Util.parseBigDec(matrix[offset]).compareTo(BigDecimal.ZERO) > 0;
							if (!valid && matrix.length > 3) {
								valid = Util.parseBigDec(matrix[offset+1]).compareTo(BigDecimal.ZERO) > 0;
							}
						}
					}

				} else {
					valid = !"".equals(matrix[offset]);
				}
				
				if (!valid) {
					break;
				}
			}
			return valid;
		}
		return false;
	}
	
	public static String formatId(String[] matrix, int offset, String country, String legalType) {
		if (matrix != null
			&& matrix.length != 0 
			&& matrix[matrix.length - 1] != null) {
			if (COUNTRY_VENEZUELA.equals(country)){
				if (offset == 1) {
					return Util.addLeftChar('0', 9, ""+ Util.parseBigDec(matrix[offset]));
				} else {
					return matrix[offset];
				}
			} else if (COUNTRY_PANAMA.equals(country)){
				if ("1".equals(legalType)){//Corporativo
					if (offset==0){
						return Util.addLeftChar('0', 7, matrix[offset]);
					} else if (offset==1){
						return Util.addLeftChar('0', 4, matrix[offset]);
					} else if (offset==2){ 
						return Util.addLeftChar('0', 8, matrix[offset]);
					}
				} else if ("4".equals(legalType)){//NT
					if (offset==1){
						return matrix[offset] = "NT";
					} else if (offset==2){
						return Util.addLeftChar('0', 4, matrix[offset]);
					} else if (offset==3){
						return Util.addLeftChar('0', 5, matrix[offset]);
					} else {
						return matrix[offset];
					}
				} else {
					if (offset==1){
						if (matrix[offset].length() == 0) {
							return " ";	
						} else {
							return Util.addRightChar(' ', 2, matrix[offset]);
						}
					} else if (offset==2){
						return Util.addLeftChar('0', 5, matrix[offset]);
					} else if (offset==3){
						return Util.addLeftChar('0', 6, matrix[offset]);
					} else {
						return matrix[offset];
					}
				}
			}
			return matrix[offset];
		}
		return "";
	}
	
	public static String formatId(String id){
		return id.replaceAll(ID_TOKEN, "");
	}
	
	public static String getIdentification(String[] matrix, String token) {
		StringBuffer identification = new StringBuffer();
		if (matrix != null) {
			for (int i = 0; i < matrix.length; i++) {
				if (matrix[i] != null) {
					if (i>0) 
						identification.append(token);
					if (!"".equals(token)) {
						identification.append(matrix[i].trim());
					} else {
						identification.append(!matrix[i].equals("") ? matrix[i] : " ");
					}
				}
			}			
		}
		return identification.toString();
	}
	
	public static String getIdentification(String[] matrix) {
		return getIdentification(matrix, "");
	}
	
	public static String getIdentification(String id, String countryId, String customerType) {
		return getIdentification(getIdMatrix(id, countryId, customerType));
	}
	
	public static String parseId(String id, String countryId, String customerType){
		String[] matrix = Util.split(id, ID_TOKEN);
		if (COUNTRY_PANAMA.equals(countryId) && matrix.length > 2) {
			id = ("1".equals(customerType) || "C".equals(customerType)) ?
					parsePanamaRUC(id) :  parsePanamaId(id);
		} else {
			StringBuffer identification = new StringBuffer();
			for (int i = 0; i < matrix.length; i++) {
				if (matrix[i] != null) {
					identification.append(formatId(matrix, i, countryId, customerType));
				}
			}
			id = identification.toString();
		}
		return id;
	}
	
	public static String parsePanamaId(String id){
		String[] matrix = Util.split(id, ID_TOKEN);
		StringBuffer identification = new StringBuffer();
		for (int i = 0; i < matrix.length; i++) {
			if (matrix[i] != null) {
				if (i>0) 
					identification.append(ID_TOKEN);
				identification.append(formatId(matrix, i, COUNTRY_PANAMA, "2"));
			}
		}
		return identification.toString();
	}
	
	public static String parsePanamaRUC(String id){
		String[] matrix = Util.split(id, ID_TOKEN);
		StringBuffer identification = new StringBuffer();
		for (int i = 0; i < matrix.length; i++) {
			if (matrix[i] != null) {
				if (i>0){
					if (i != (matrix.length-1)) 
						identification.append(ID_TOKEN);
				}
				identification.append(formatId(matrix, i, COUNTRY_PANAMA, "1"));
			}
		}
		return identification.toString();
	}
	
}