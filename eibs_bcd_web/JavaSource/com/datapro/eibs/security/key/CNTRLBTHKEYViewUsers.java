package com.datapro.eibs.security.key;

import com.datapro.access.Key;

/**
 * @author fhernandez
 *
 */
public class CNTRLBTHKEYViewUsers extends Key {

	private java.lang.String BTHGRP = null;
	
	private java.lang.String BTHUSR = null;

	public java.lang.String getBTHGRP() {
		return BTHGRP == null ? BTHGRP : BTHGRP.trim().toUpperCase();
	}

	public void setBTHGRP(java.lang.String bthgrp) {
		BTHGRP = bthgrp;
	}

	public java.lang.String getBTHUSR() {
		return BTHUSR == null ? BTHUSR : BTHUSR.trim().toUpperCase();
	}

	public void setBTHUSR(java.lang.String bthusr) {
		BTHUSR = bthusr;
	}
	
}