package com.datapro.eibs.security.key;

import com.datapro.access.Key;

/**
 * @author fhernandez
 *
 */
public class USRRPTKEYViewReportsChecked extends Key {

	private static final long serialVersionUID = 8234031144963417422L;
	/**
	 * The USRUID attribute.
	*/
	private java.lang.String USRUID = null;	
	private java.lang.String IBSLIF = null;
	private java.lang.String IBSPER = null;
	private java.lang.String IBSMOD = null;
	private java.lang.String IBSRPN = null;

	/**
	 * Gets the USRUID value.
	*/
	public java.lang.String getUSRUID() {
		return USRUID == null ? USRUID : USRUID.trim().toUpperCase();
	}

	/**
	 * Sets the USRUID value.
	*/
	public void setUSRUID(java.lang.String USRUID) {
		this.USRUID = USRUID;
	}

	public java.lang.String getIBSLIF() {
		return IBSLIF == null ? IBSLIF : IBSLIF.trim().toUpperCase();
	}

	public void setIBSLIF(java.lang.String ibslif) {
		IBSLIF = ibslif;
	}

	public java.lang.String getIBSPER() {
		return IBSPER == null ? IBSPER : IBSPER.trim().toUpperCase();
	}

	public void setIBSPER(java.lang.String ibsper) {
		IBSPER = ibsper;
	}

	public java.lang.String getIBSMOD() {
		return IBSMOD == null ? IBSMOD : IBSMOD.trim().toUpperCase();
	}

	public void setIBSMOD(java.lang.String ibsmod) {
		IBSMOD = ibsmod;
	}

	public java.lang.String getIBSRPN() {
		return IBSRPN == null ? IBSRPN : IBSRPN.trim().toUpperCase();
	}

	public void setIBSRPN(java.lang.String ibsrpn) {
		IBSRPN = ibsrpn;
	}	
	

}