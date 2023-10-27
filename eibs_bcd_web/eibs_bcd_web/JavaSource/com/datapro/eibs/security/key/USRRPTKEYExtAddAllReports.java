package com.datapro.eibs.security.key;

import com.datapro.access.Key;

/**
 * @author fhernandez
 *
 */
public class USRRPTKEYExtAddAllReports extends Key {

	private static final long serialVersionUID = 4012066314106137342L;
	
	/**
	 * The USRUID attribute.
	*/
	private java.lang.String USRUID = null;

	/**
	 * Gets the USRUID value.
	*/
	public java.lang.String getUSRUID() {
		return USRUID;
	}

	/**
	 * Sets the USRUID value.
	*/
	public void setUSRUID(java.lang.String USRUID) {
		this.USRUID = USRUID;
	}
	
	private String IBSLIF;
	
	public void setIBSLIF(String ibslif) {
		IBSLIF = ibslif;
	}

	public java.lang.String getIBSLIF() {
		return IBSLIF == null ? IBSLIF : IBSLIF.trim().toUpperCase();
	}
	
}