package com.datapro.eibs.security.key;

import com.datapro.eibs.access.KeySuper;

public class WEBOGKEY extends KeySuper {

	private String OGRUSR = null;
	private String OGRSID = null;
	private String OGRDEN = null;
	
	public String getOGRUSR() {
		return OGRUSR;
	}
	public void setOGRUSR(String ogrusr) {
		OGRUSR = ogrusr;
	}
	public String getOGRSID() {
		return OGRSID;
	}
	public void setOGRSID(String ogrsid) {
		OGRSID = ogrsid;
	}
	public String getOGRDEN() {
		return OGRDEN;
	}
	public void setOGRDEN(String ogrden) {
		OGRDEN = ogrden;
	}
}
