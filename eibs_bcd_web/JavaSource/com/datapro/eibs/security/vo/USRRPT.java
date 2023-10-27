package com.datapro.eibs.security.vo;

import com.datapro.eibs.access.VOSuper;

/**
 * @author fhernandez
 *
 */
public class USRRPT extends VOSuper {

	/**
	 * The USRUID attribute.
	*/
	private java.lang.String USRUID = BLANK;
	
	private java.lang.String USRRPN = BLANK;

	public java.lang.String getUSRUID() {
		return USRUID;
	}

	public void setUSRUID(java.lang.String usruid) {
		USRUID = usruid;
	}

	public java.lang.String getUSRRPN() {
		return USRRPN;
	}

	public void setUSRRPN(java.lang.String usrrpn) {
		USRRPN = usrrpn;
	}


}