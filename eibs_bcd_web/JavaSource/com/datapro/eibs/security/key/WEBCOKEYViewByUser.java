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
public class WEBCOKEYViewByUser extends KeySuper {

	private String BTHUSR;
	private String CMOCDE;

	/**
	 * @return
	 */
	public String getBTHUSR() {
		return BTHUSR;
	}

	/**
	 * @param string
	 */
	public void setBTHUSR(String string) {
		BTHUSR = string;
	}

	/**
	 * @return
	 */
	public String getCMOCDE() {
		return CMOCDE;
	}

	/**
	 * @param string
	 */
	public void setCMOCDE(String string) {
		CMOCDE = string;
	}

}
