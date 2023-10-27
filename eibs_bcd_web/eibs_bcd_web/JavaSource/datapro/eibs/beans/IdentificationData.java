package datapro.eibs.beans;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.datapro.eibs.constants.ISOCodes;
import com.datapro.eibs.facade.FAParameters;
import com.datapro.eibs.parameters.vo.CNOFC;
import com.datapro.generic.IDParser;


/**
 * This type was created in VisualAge.
 */
public class IdentificationData {
	
	private static final String ID_TOKEN = IDParser.ID_TOKEN;
	private static Map cnofCodes;

	//Define variables request
	private String identification;
	private String type = "";
	private String country = "";  
	private String countryDescription = "";
	private String checkDigit = "";
	private String legalType = "";
	private String matrix[];

	static {
		cnofCodes = new HashMap();
		try {
			FAParameters service = new FAParameters();
			List list = service.getCNOFCodes("34");
			Iterator it = list.listIterator();
			while (it.hasNext()) {
				CNOFC code = (CNOFC) it.next();
				cnofCodes.put(code.getCNORCD(), code);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 
	 */
	public IdentificationData(String identification, String country, String legalType) {
		super();
		setCountry(country);
		setLegalType(legalType);
		setIdentification(identification);
	}

	/**
	 * 
	 */
	public IdentificationData(String identification, String country) {
		super();
		setCountry(country);
		setIdentification(identification);
	}	
	
	public IdentificationData() {
		super();
	}
	
	private void parse(){
		setMatrix(IDParser.getIdMatrix(identification, 
			ISOCodes.getIBSCountryCode(getCountry()), getLegalType()));
	}
	
	private boolean validate(){
		return matrix != null && IDParser.validateId(matrix, 
			ISOCodes.getIBSCountryCode(getCountry()), getLegalType());
	}

	/**
	 * @param string
	 */
	public void setCheckDigit(String string) {
		checkDigit = string;
	}
		
	/**
	 * @return
	 */
	public String getCheckDigit() {
		return checkDigit;
	}
		
	/**
	 * @return
	 */
	public String getCheckDigit(int size) {
		String identification = getIdentification(); 
		if (identification.length() > size) {
			return identification.substring(identification.length() - size);
		}
		return "";
	}

	/**
	 * @return
	 */
	public String getType() {
		return type;
	}

	/**
	 * @param type
	 */
	public void setType(String type) {
		this.type = type;
	}

	/**
	 * @return
	 */
	public String getCountry() {
		return country.toUpperCase();
	}

	/**
	 * @return
	 */
	public String getCountryDescription() {
		return countryDescription;
	}
	/**
	 * @param string
	 */
	public void setCountry(String string) {
		country = string != null ? string.trim() : "";
	}

	/**
	 * @param string
	 */
	public void setCountryDescription(String string) {
		countryDescription = string;
	}
	
	/**
	 * @param string
	 */
	public void setIdentification(String string) {
		if (string != null) {
			identification = string.trim();
			parse();
		}
	}

	public String getIdentification(int offset) {
		String identification = "";
		if (matrix != null 
			&& matrix.length > offset 
			&& matrix[offset] != null) {
			identification = matrix[offset];
		}
		return identification;
	}
	
	public String getIdentification(int offset, int len) {
		String identification = "";
		if (!getIdentification(offset).equals("")){
			identification = getIdentification(offset);
		} else if (!getIdentification().equals("")){
			identification = getIdentification();
		}
		return identification.length() > len ? "" : identification;
	}
	
	public String getIdentification(String token) {
		return IDParser.getIdentification(matrix, token);
	}
	
	/**
	 * @return
	 */
	public String getIdentification() {
		return IDParser.getIdentification(matrix, "");
	}
	
	public String getTokenizedId() {
		return getIdentification(ID_TOKEN);
	}
	
	/**
	 * @return
	 */
	public String getLegalType() {
		return legalType;
	}

	/**
	 * @param string
	 */
	public void setLegalType(String type) {
		legalType =
			type.startsWith("C") || type.endsWith("C") ? "1" :  
				type.startsWith("P") || type.endsWith("P") ? "2" : 
					type.startsWith("O") || type.endsWith("O") ? "3" : 
						type.equals("1") || type.equals("2") || type.equals("3") ? type : "4";
		if (country != null
			&& identification != null 
			&& !validate()) {
			parse();
		}
	}
	
	public boolean isLegalType(String type) {
		String tempType = 
			type.startsWith("P") || type.endsWith("P") ? "2" : 
				type.startsWith("C") || type.endsWith("C") ? "1" : 
					type.startsWith("O") || type.endsWith("O") ? "3" : 
						type.startsWith("B") || type.endsWith("B") ? "4" : type;
		return legalType.equals(tempType);
	}

	/**
	 * @param sets the identification split matrix depending of the legal type
	 */
	public void setMatrix(String[] matrix) {
		this.matrix = matrix;
		if (matrix != null
			&& matrix.length != 0 
			&& matrix[matrix.length - 1] != null) {
			String last = matrix[matrix.length - 1].trim();
			int spacePos = last.indexOf(' ');
			if (spacePos > 0) {
				matrix[matrix.length - 1] = last.substring(0, spacePos);
				setCheckDigit(last.substring(spacePos + 1, last.length()));
			}
		}
	}

}