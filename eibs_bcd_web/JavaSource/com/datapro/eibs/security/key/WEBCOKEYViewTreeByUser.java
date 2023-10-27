package com.datapro.eibs.security.key;

import com.datapro.eibs.access.KeySuper;

/**
 * @author erodriguez
 */
public class WEBCOKEYViewTreeByUser extends KeySuper {

	private String BTHUSR = null;
	private String CMOSID = null;

	public String getCMOSID() {
		return CMOSID;
	}

	public void setCMOSID(String cmosid) {
		CMOSID = cmosid;
	}

	public String getBTHUSR() {
		return BTHUSR;
	}

	public void setBTHUSR(String bthusr) {
		BTHUSR = bthusr;
	}
}
