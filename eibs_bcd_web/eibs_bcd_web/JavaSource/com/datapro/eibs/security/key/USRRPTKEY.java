package com.datapro.eibs.security.key;

import com.datapro.access.Key;

/**
 * @author fhernandez
 *
 */
public class USRRPTKEY extends Key {

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
	
	private java.lang.String USRRPN = null;

	public java.lang.String getUSRRPN() {
		return USRRPN;
	}

	public void setUSRRPN(java.lang.String usrrpn) {
		USRRPN = usrrpn;
	}
	
}