package com.datapro.eibs.security.key;

import com.datapro.eibs.access.KeySuper;

/**
 * @author erodriguez
 */
public class WEBMOKEY extends KeySuper {

	private String MOIDEN = null;
	private String MOILIF = null;
	
	public String getMOIDEN() {
		return MOIDEN;
	}
	public void setMOIDEN(String moiden) {
		MOIDEN = moiden;
	}
	public String getMOILIF() {
		return MOILIF;
	}
	public void setMOILIF(String moilif) {
		MOILIF = moilif;
	}
	
}
