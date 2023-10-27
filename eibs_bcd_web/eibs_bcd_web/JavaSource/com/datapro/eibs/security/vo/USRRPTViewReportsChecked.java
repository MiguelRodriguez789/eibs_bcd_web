package com.datapro.eibs.security.vo;

import com.datapro.eibs.reports.vo.IBSRPTViewModules;

/**
 * @author fhernandez
 *
 */
public class USRRPTViewReportsChecked extends IBSRPTViewModules {

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
	
	private java.lang.String CHECKED = null;

	public java.lang.String getCHECKED() {
		return CHECKED;
	}

	public void setCHECKED(java.lang.String checked) {
		CHECKED = checked;
	}

	private java.lang.String DISABLED = null;

	public java.lang.String getDISABLED() {
		return DISABLED;
	}

	public void setDISABLED(java.lang.String disabled) {
		DISABLED = disabled;
	}

}