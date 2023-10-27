package com.datapro.eibs.teller.key;

import com.datapro.eibs.access.KeySuper;

public class ATTRNTYPEBYTELLUSERSKEY extends KeySuper {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2892785774723710843L;
	
	private String TELLUSERID = null;
	private String TRNTYPECODE = null;

	public String getTELLUSERID() {
		return TELLUSERID;
	}

	public void setTELLUSERID(String telluserid) {
		TELLUSERID = telluserid;
	}

	public String getTRNTYPECODE() {
		return TRNTYPECODE;
	}

	public void setTRNTYPECODE(String trntypecode) {
		TRNTYPECODE = trntypecode;
	}
	
}
