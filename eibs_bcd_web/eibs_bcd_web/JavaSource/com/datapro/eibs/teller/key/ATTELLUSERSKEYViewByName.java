package com.datapro.eibs.teller.key;

import com.datapro.eibs.access.KeySuper;

public class ATTELLUSERSKEYViewByName extends KeySuper {

	private static final long serialVersionUID = 1886066997125362865L;
	
	//Field type CHAR(10)
	private String USERNAME = null;

	public String getUSERNAME() {
		return USERNAME;
	}

	public void setUSERNAME(String telluser) {
		USERNAME = telluser;
	}
	
}