package com.datapro.eibs.security.vo;

import com.datapro.eibs.access.VOSuper;

/**
 * @author fhernandez
 *
 */
public class USRRPTViewModulesByPeriod extends VOSuper {

	private static final long serialVersionUID = 6824901831928571579L;
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
	
}