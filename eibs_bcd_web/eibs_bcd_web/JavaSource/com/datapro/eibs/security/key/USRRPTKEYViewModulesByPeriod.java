package com.datapro.eibs.security.key;

import com.datapro.access.Key;

/**
 * @author fhernandez
 *
 */
public class USRRPTKEYViewModulesByPeriod extends Key {

	private static final long serialVersionUID = 7063493611891241841L;
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
	
	/**
	 * The IBSPER attribute.
	*/
	private java.lang.String IBSPER = null;

	/**
	 * Gets the IBSPER value.
	*/
	public java.lang.String getIBSPER() {
		return IBSPER == null ? IBSPER : IBSPER.trim().toUpperCase();
	}

	/**
	 * Sets the IBSPER value.
	*/
	public void setIBSPER(java.lang.String IBSPER) {
		this.IBSPER = IBSPER;
	}
}