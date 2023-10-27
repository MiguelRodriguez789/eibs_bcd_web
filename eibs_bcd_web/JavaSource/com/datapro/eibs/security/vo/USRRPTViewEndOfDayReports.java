package com.datapro.eibs.security.vo;

import com.datapro.eibs.access.VOSuper;

/**
 * @author fhernandez
 *
 */
public class USRRPTViewEndOfDayReports extends VOSuper {

	private static final long serialVersionUID = 687860769161169951L;
	
	/**
	 * The EDPRPN attribute.
	*/
	private java.lang.String EDPRPN = BLANK;

	/**
	 * Gets the EDPRPN value.
	*/
	public java.lang.String getEDPRPN() {
		return EDPRPN.trim().toUpperCase();
	}

	/**
	 * Sets the EDPRPN value.
	*/
	public void setEDPRPN(java.lang.String EDPRPN) {
		this.EDPRPN = EDPRPN;
	}
	
	/**
	 * The EDPPTH attribute.
	*/
	private java.lang.String EDPPTH = BLANK;

	/**
	 * Gets the EDPPTH value.
	*/
	public java.lang.String getEDPPTH() {
		return EDPPTH.trim();
	}

	/**
	 * Sets the EDPPTH value.
	*/
	public void setEDPPTH(java.lang.String EDPPTH) {
		this.EDPPTH = EDPPTH;
	}

	/**
	 * The EDPDTY attribute.
	*/
	private java.math.BigDecimal EDPDTY = ZERO;

	/**
	 * Gets the EDPDTY value.
	*/
	public java.math.BigDecimal getEDPDTY() {
		return EDPDTY;
	}

	/**
	 * Sets the EDPDTY value.
	*/
	public void setEDPDTY(java.math.BigDecimal EDPDTY) {
		this.EDPDTY = EDPDTY;
	}
	
	/**
	 * The EDPDTM attribute.
	*/
	private java.math.BigDecimal EDPDTM = ZERO;

	/**
	 * Gets the EDPDTM value.
	*/
	public java.math.BigDecimal getEDPDTM() {
		return EDPDTM;
	}

	/**
	 * Sets the EDPDTM value.
	*/
	public void setEDPDTM(java.math.BigDecimal EDPDTM) {
		this.EDPDTM = EDPDTM;
	}
	
	/**
	 * The EDPDTD attribute.
	*/
	private java.math.BigDecimal EDPDTD = ZERO;

	/**
	 * Gets the EDPDTD value.
	*/
	public java.math.BigDecimal getEDPDTD() {
		return EDPDTD;
	}

	/**
	 * Sets the EDPDTD value.
	*/
	public void setEDPDTD(java.math.BigDecimal EDPDTD) {
		this.EDPDTD = EDPDTD;
	}
	
	private java.lang.String EDPFLG = BLANK;

	/**
	 * Gets the EDPFLG value.
	*/
	public java.lang.String getEDPFLG() {
		return EDPFLG.trim().toUpperCase();
	}

	/**
	 * Sets the EDPFLG value.
	*/
	public void setEDPFLG(java.lang.String EDPFLG) {
		this.EDPFLG = EDPFLG;
	}
	
	private java.lang.String IBSDSC = BLANK;

	/**
	 * Gets the IBSDSC value.
	*/
	public java.lang.String getIBSDSC() {
		return IBSDSC.trim();
	}

	/**
	 * Sets the IBSDSC value.
	*/
	public void setIBSDSC(java.lang.String IBSDSC) {
		this.IBSDSC = IBSDSC;
	}
	
}