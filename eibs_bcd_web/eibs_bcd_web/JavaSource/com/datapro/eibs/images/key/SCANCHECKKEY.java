package com.datapro.eibs.images.key;

import com.datapro.eibs.access.KeySuper;

public class SCANCHECKKEY extends KeySuper {

	private String SCANDATE = "";
	private String ACCOUNT = "";
	private String SERIE = "";
	
	public String getACCOUNT() {
		return ACCOUNT;
	}
	public void setACCOUNT(String account) {
		ACCOUNT = account;
	}
	public String getSERIE() {
		return SERIE;
	}
	public void setSERIE(String serie) {
		SERIE = serie;
	}
	public String getSCANDATE() {
		return SCANDATE;
	}
	public void setSCANDATE(String scandate) {
		SCANDATE = scandate;
	}
	
}
