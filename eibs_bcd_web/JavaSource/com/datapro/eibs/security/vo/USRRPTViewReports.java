package com.datapro.eibs.security.vo;

import com.datapro.eibs.access.VOSuper;

/**
 * @author fhernandez
 *
 */
public class USRRPTViewReports extends VOSuper {

	private static final long serialVersionUID = 5872300626173611876L;
	/**
	 * The IBSRPN attribute.
	*/
	private java.lang.String IBSRPN = BLANK;

	/**
	 * Gets the IBSRPN value.
	*/
	public java.lang.String getIBSRPN() {
		return IBSRPN.trim();
	}

	/**
	 * Sets the IBSRPN value.
	*/
	public void setIBSRPN(java.lang.String IBSRPN) {
		this.IBSRPN = IBSRPN;
	}

	/**
	 * The IBSDSC attribute.
	*/
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
	
	/**
	 * The IBSMOD attribute.
	*/
	private java.lang.String IBSMOD = BLANK;

	/**
	 * Gets the IBSMOD value.
	*/
	public java.lang.String getIBSMOD() {
		return IBSMOD.trim().toUpperCase();
	}

	/**
	 * Sets the IBSMOD value.
	*/
	public void setIBSMOD(java.lang.String IBSMOD) {
		this.IBSMOD = IBSMOD;
	}

	/**
	 * The IBSPER attribute.
	*/
	private java.lang.String IBSPER = BLANK;

	/**
	 * Gets the IBSPER value.
	*/
	public java.lang.String getIBSPER() {
		return IBSPER.trim().toUpperCase();
	}

	/**
	 * Sets the IBSPER value.
	*/
	public void setIBSPER(java.lang.String IBSPER) {
		this.IBSPER = IBSPER;
	}
	
	/**
	 * The IBSPRM attribute.
	*/
	private java.lang.String IBSPRM = BLANK;

	/**
	 * Gets the IBSPRM value.
	*/
	public java.lang.String getIBSPRM() {
		return IBSPRM.trim().toUpperCase();
	}

	/**
	 * Sets the IBSPRM value.
	*/
	public void setIBSPRM(java.lang.String IBSPRM) {
		this.IBSPRM = IBSPRM;
	}

}