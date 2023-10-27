package com.datapro.eibs.teller.key;

import com.datapro.eibs.access.KeySuper;

public class ATTELLUSERSKEY extends KeySuper {

	private static final long serialVersionUID = 3957102336480935661L;
	
	//Field type CHAR(10)
	private String TELLUSERID = null;

	public String getTELLUSERID() {
		return TELLUSERID;
	}

	public void setTELLUSERID(String telluserid) {
		TELLUSERID = telluserid;
	}
	
}