package com.datapro.eibs.security.key;

import com.datapro.eibs.access.KeySuper;

public class WEBMMKEY extends KeySuper {

	private String MMIDEN = null;
	private String MMILIF = null;
	
	public String getMMIDEN() {
		return MMIDEN;
	}
	public void setMMIDEN(String mmiden) {
		MMIDEN = mmiden;
	}
	public String getMMILIF() {
		return MMILIF;
	}
	public void setMMILIF(String mmilif) {
		MMILIF = mmilif;
	}
}
