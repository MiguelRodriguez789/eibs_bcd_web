package com.datapro.eibs.security.key;


/**
 * @author fhernandez
 *
 */
public class USRRPTKEYViewEODPDF extends USRRPTKEYViewGeneratedOnDates {
	
	private static final long serialVersionUID = -5994801961396329523L;
	
	/**
	 * The EDPRPN attribute.
	*/
	private java.lang.String EDPRPN = null;

	/**
	 * Gets the EDPRPN value.
	*/
	public java.lang.String getEDPRPN() {
		return EDPRPN == null ? null : EDPRPN.trim().toUpperCase();
	}

	/**
	 * Sets the EDPRPN value.
	*/
	public void setEDPRPN(java.lang.String EDPRPN) {
		this.EDPRPN = EDPRPN;
	}
	
	
}