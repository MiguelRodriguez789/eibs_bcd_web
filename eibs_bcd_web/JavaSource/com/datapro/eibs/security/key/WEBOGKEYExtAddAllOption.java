package com.datapro.eibs.security.key;

import com.datapro.access.Key;

/**
 * @author fhernandez
 *
 */
public class WEBOGKEYExtAddAllOption extends Key {

	private static final long serialVersionUID = 4012066314106137342L;
	
	/**
	 * The USRUID attribute.
	*/
	private java.lang.String OGRUSR = null;

	
	public java.lang.String getOGRUSR() {
		return OGRUSR;
	}

	public void setOGRUSR(java.lang.String oGRUSR) {
		OGRUSR = oGRUSR;
	}

	private String OGRLIF;


	public String getOGRLIF() {
		return OGRLIF;
	}

	public void setOGRLIF(String oGRLIF) {
		OGRLIF = oGRLIF;
	}
	
	
}