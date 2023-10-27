package com.datapro.eibs.security.key;

import com.datapro.access.Key;

/**
 * @author fhernandez
 *
 */
public class USRRPTKEYViewReports extends Key {

	private static final long serialVersionUID = 2121104190561432768L;
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
	 * The IBSLIF attribute.
	*/
	private java.lang.String IBSLIF = null;

	/**
	 * Gets the IBSLIF value.
	*/
	public java.lang.String getIBSLIF() {
		return IBSLIF == null ? IBSLIF : IBSLIF.trim().toUpperCase();
	}

	/**
	 * Sets the IBSLIF value.
	*/
	public void setIBSLIF(java.lang.String IBSLIF) {
		this.IBSLIF = IBSLIF;
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
	
	/**
	 * The IBSMOD attribute.
	*/
	private java.lang.String IBSMOD = null;

	/**
	 * Gets the IBSMOD value.
	*/
	public java.lang.String getIBSMOD() {
		return IBSMOD == null ? IBSMOD : IBSMOD.trim().toUpperCase();
	}

	/**
	 * Sets the IBSMOD value.
	*/
	public void setIBSMOD(java.lang.String IBSMOD) {
		this.IBSMOD = IBSMOD;
	}
	
}