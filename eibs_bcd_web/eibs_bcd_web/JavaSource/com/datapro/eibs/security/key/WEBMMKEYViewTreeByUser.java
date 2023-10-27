package com.datapro.eibs.security.key;

import com.datapro.eibs.access.KeySuper;

/**
 * @author erodriguez
 */
public class WEBMMKEYViewTreeByUser extends KeySuper {

	private String BTHUSR = null;
	private String CMMSID = null;

	public String getBTHUSR() {
		return BTHUSR;
	}

	public void setBTHUSR(String bthusr) {
		BTHUSR = bthusr;
	}

	public String getCMMSID() {
		return CMMSID;
	}

	public void setCMMSID(String cmmsid) {
		CMMSID = cmmsid;
	}
}
