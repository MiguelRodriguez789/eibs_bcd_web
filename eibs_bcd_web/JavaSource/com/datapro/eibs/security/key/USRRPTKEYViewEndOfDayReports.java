package com.datapro.eibs.security.key;


/**
 * @author fhernandez
 *
 */
public class USRRPTKEYViewEndOfDayReports extends USRRPTKEYViewReports {
	
	private static final long serialVersionUID = 5028812244680774995L;
	
	/**
	 * The EDPFLG attribute.
	*/
	private java.lang.String EDPFLG = null;

	/**
	 * Gets the EDPFLG value.
	*/
	public java.lang.String getEDPFLG() {
		return EDPFLG == null ? EDPFLG : EDPFLG.trim().toUpperCase();
	}

	/**
	 * Sets the EDPFLG value.
	*/
	public void setEDPFLG(java.lang.String EDPFLG) {
		this.EDPFLG = EDPFLG;
	}	
	
	/**
	 * The EDPDTY attribute.
	*/
	private java.math.BigDecimal EDPDTY = null;

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
	private java.math.BigDecimal EDPDTM = null;

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
	private java.math.BigDecimal EDPDTD = null;

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
}