package com.datapro.eibs.security.key;

import com.datapro.access.Key;

/**
 * @author fhernandez
 *
 */
public class WEBOUKEYExtAddAllOption extends Key {

	private static final long serialVersionUID = 4012066314106137342L;
	
	/**
	 * The USRUID attribute.
	*/
	private java.lang.String OUSUSR = null;

	
	public java.lang.String getOUSUSR() {
		return OUSUSR;
	}

	public void setOUSUSR(java.lang.String oUSUSR) {
		OUSUSR = oUSUSR;
	}

	private String OUSLIF;


	public String getOUSLIF() {
		return OUSLIF;
	}

	public void setOUSLIF(String oUSLIF) {
		OUSLIF = oUSLIF;
	}
	
}