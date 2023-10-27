package com.datapro.eibs.teller.vo;

import com.datapro.eibs.access.VOSuper;

public class ATTRNTYPEBYTELLUSERS extends VOSuper {

	/**
	 * 
	 */
	private static final long serialVersionUID = -341643569270348723L;

	private String TELLUSERID = BLANK;
	private String TRNTYPECODE = BLANK;
	
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
