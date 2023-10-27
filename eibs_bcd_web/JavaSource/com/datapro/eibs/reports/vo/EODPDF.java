package com.datapro.eibs.reports.vo;

import com.datapro.eibs.access.VOSuper;

/**
 * @author fhernandez
 *
 */
public class EODPDF extends VOSuper {
	
	/**
	 * The EDPBNK attribute.
	*/
	private java.lang.String EDPBNK = BLANK;

	/**
	 * Gets the EDPBNK value.
	*/
	public java.lang.String getEDPBNK() {
		return EDPBNK.toUpperCase().trim();
	}

	/**
	 * Sets the EDPBNK value.
	*/
	public void setEDPBNK(java.lang.String EDPBNK) {
		this.EDPBNK = EDPBNK;
	}
	
	/**
	 * The EDPBRN attribute.
	*/
	private java.math.BigDecimal EDPBRN = ZERO;

	/**
	 * Gets the EDPBRN value.
	*/
	public java.math.BigDecimal getEDPBRN() {
		return EDPBRN;
	}

	/**
	 * Sets the EDPBRN value.
	*/
	public void setEDPBRN(java.math.BigDecimal EDPBRN) {
		this.EDPBRN = EDPBRN;
	}
	
	/**
	 * The EDPRPN attribute.
	*/
	private java.lang.String EDPRPN = BLANK;

	/**
	 * Gets the EDPRPN value.
	*/
	public java.lang.String getEDPRPN() {
		return EDPRPN.toUpperCase().trim();
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
	 * The EDPLMU attribute.
	*/
	private java.lang.String EDPLMU = BLANK;

	/**
	 * Gets the EDPLMU value.
	*/
	public java.lang.String getEDPLMU() {
		return EDPLMU.toUpperCase().trim();
	}

	/**
	 * Sets the EDPLMU value.
	*/
	public void setEDPLMU(java.lang.String EDPLMU) {
		this.EDPLMU = EDPLMU;
	}
	/**
	 * The EDPLMD attribute.
	*/
	private java.math.BigDecimal EDPLMD = ZERO;

	/**
	 * Gets the EDPLMD value.
	*/
	public java.math.BigDecimal getEDPLMD() {
		return EDPLMD;
	}

	/**
	 * Sets the EDPLMD value.
	*/
	public void setEDPLMD(java.math.BigDecimal EDPLMD) {
		this.EDPLMD = EDPLMD;
	}
	/**
	 * The EDPLMM attribute.
	*/
	private java.math.BigDecimal EDPLMM = ZERO;

	/**
	 * Gets the EDPLMM value.
	*/
	public java.math.BigDecimal getEDPLMM() {
		return EDPLMM;
	}

	/**
	 * Sets the EDPLMM value.
	*/
	public void setEDPLMM(java.math.BigDecimal EDPLMM) {
		this.EDPLMM = EDPLMM;
	}
	/**
	 * The EDPLMY attribute.
	*/
	private java.math.BigDecimal EDPLMY = ZERO;

	/**
	 * Gets the EDPLMY value.
	*/
	public java.math.BigDecimal getEDPLMY() {
		return EDPLMY;
	}

	/**
	 * Sets the EDPLMY value.
	*/
	public void setEDPLMY(java.math.BigDecimal EDPLMY) {
		this.EDPLMY = EDPLMY;
	}
	
	private java.lang.String EDPFLG = BLANK;

	public java.lang.String getEDPFLG() {
		return EDPFLG;
	}

	public void setEDPFLG(java.lang.String edpflg) {
		EDPFLG = edpflg;
	}
	
	private java.lang.String EDPFL1 = BLANK;

	public java.lang.String getEDPFL1() {
		return EDPFL1;
	}

	public void setEDPFL1(java.lang.String edpfl1) {
		EDPFL1 = edpfl1;
	}
	
}