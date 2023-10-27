package com.datapro.eibs.parameters.vo;

import com.datapro.eibs.access.VOSuper;

public class WEBURL extends VOSuper {

	private String ID  = BLANK;
	private String URL = BLANK;
	
	public java.lang.String getID() {
		return ID.trim();
	}
	public void setID(java.lang.String iD) {
		ID = iD;
	}
	public java.lang.String getURL() {
		return URL.trim();
	}
	public void setURL(java.lang.String uRL) {
		URL = uRL;
	}
}