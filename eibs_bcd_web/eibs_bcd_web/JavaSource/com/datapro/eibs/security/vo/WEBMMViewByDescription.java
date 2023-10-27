package com.datapro.eibs.security.vo;

import com.datapro.eibs.access.VOSuper;

public class WEBMMViewByDescription extends VOSuper {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5238056603214683467L;
	
	private String CMMSID = BLANK;

	public String getCMMSID() {
		return CMMSID;
	}

	public void setCMMSID(String cMMSID) {
		CMMSID = cMMSID;
	}

}
