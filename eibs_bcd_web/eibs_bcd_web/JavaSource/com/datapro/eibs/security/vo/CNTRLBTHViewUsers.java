package com.datapro.eibs.security.vo;

import com.datapro.eibs.access.VOSuper;

/**
 * @author fhernandez
 *
 */
public class CNTRLBTHViewUsers extends VOSuper {

	/**
	 * The USRUID attribute.
	*/
	private java.lang.String BTHGRP = BLANK;
	
	private java.lang.String BTHUSR = BLANK;

	public java.lang.String getBTHGRP() {
		return BTHGRP.trim().toUpperCase();
	}

	public void setBTHGRP(java.lang.String bthgrp) {
		BTHGRP = bthgrp;
	}

	public java.lang.String getBTHUSR() {
		return BTHUSR.trim().toUpperCase();
	}

	public void setBTHUSR(java.lang.String bthusr) {
		BTHUSR = bthusr;
	}



}