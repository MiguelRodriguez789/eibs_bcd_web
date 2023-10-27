package com.datapro.eibs.security.vo;

import com.datapro.eibs.access.VOSuper;

public class WEBMOViewByDescription extends VOSuper {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5238056603214683467L;
	
	private String CMOSID = BLANK;

	public String getCMOSID() {
		return CMOSID;
	}

	public void setCMOSID(String cMOSID) {
		CMOSID = cMOSID;
	}


}
