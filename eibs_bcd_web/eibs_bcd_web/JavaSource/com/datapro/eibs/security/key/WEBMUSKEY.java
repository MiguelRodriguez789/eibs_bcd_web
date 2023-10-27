package com.datapro.eibs.security.key;

import com.datapro.eibs.access.KeySuper;

public class WEBMUSKEY extends KeySuper {

	private String OUSUSR = null;
	private String OUSSID = null;
	private String OUSDEN = null;
	
	public String getOUSUSR() {
		return OUSUSR;
	}
	public void setOUSUSR(String oususr) {
		OUSUSR = oususr;
	}
	public String getOUSSID() {
		return OUSSID;
	}
	public void setOUSSID(String oussid) {
		OUSSID = oussid;
	}
	public String getOUSDEN() {
		return OUSDEN;
	}
	public void setOUSDEN(String ousden) {
		OUSDEN = ousden;
	}
	
}
