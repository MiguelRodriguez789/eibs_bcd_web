/*
 * Created on Jul 13, 2010
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.datapro.eibs.security.key;

import com.datapro.eibs.access.KeySuper;

/**
 * @author fhernandez
 */
public class WEBCOKEY extends KeySuper {

	private String CMOSID;
	private String CMODEN;
	private String CMOSEQ;
	private String CMOLIF;
	
	/**
	 * @return
	 */
	public String getCMODEN() {
		return CMODEN;
	}

	/**
	 * @return
	 */
	public String getCMOLIF() {
		return CMOLIF;
	}

	/**
	 * @return
	 */
	public String getCMOSEQ() {
		return CMOSEQ;
	}

	/**
	 * @return
	 */
	public String getCMOSID() {
		return CMOSID;
	}

	/**
	 * @param string
	 */
	public void setCMODEN(String string) {
		CMODEN = string;
	}

	/**
	 * @param string
	 */
	public void setCMOLIF(String string) {
		CMOLIF = string;
	}

	/**
	 * @param string
	 */
	public void setCMOSEQ(String string) {
		CMOSEQ = string;
	}

	/**
	 * @param string
	 */
	public void setCMOSID(String string) {
		CMOSID = string;
	}

}
