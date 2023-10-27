package com.datapro.eibs.teller.key;

import com.datapro.eibs.access.KeySuper;

public class ATTELLUSERSKEYExtBasic extends KeySuper {

	private static final long serialVersionUID = -7064686009450150629L;
	
	private String TELLUSERID = null;

	public String getTELLUSERID() {
		return TELLUSERID;
	}

	public void setTELLUSERID(String telluserid) {
		TELLUSERID = telluserid;
	}
	
}