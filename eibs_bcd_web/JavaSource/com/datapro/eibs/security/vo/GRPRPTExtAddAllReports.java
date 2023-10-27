package com.datapro.eibs.security.vo;

import com.datapro.eibs.access.VOSuper;

/**
 * @author fhernandez
 *
 */
public class GRPRPTExtAddAllReports extends VOSuper {

	private static final long serialVersionUID = -634977622504310593L;
	/**
	 * The USRUID attribute.
	*/
	private java.lang.String USRUID = BLANK;

	public java.lang.String getUSRUID() {
		return USRUID.trim().toUpperCase();
	}

	public void setUSRUID(java.lang.String usruid) {
		if (usruid != null) {
			USRUID = usruid;
		}
	}
	
	/**
	 * The IBSLIF attribute.
	*/
	private java.lang.String IBSLIF = BLANK;

	/**
	 * Gets the IBSLIF value.
	*/
	public java.lang.String getIBSLIF() {
		return IBSLIF.trim().toUpperCase();
	}

	/**
	 * Sets the IBSLIF value.
	*/
	public void setIBSLIF(java.lang.String IBSLIF) {
		this.IBSLIF = IBSLIF;
	}

}