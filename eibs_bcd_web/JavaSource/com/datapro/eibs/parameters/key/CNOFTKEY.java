/*
 * Created on Jul 13, 2014
 *
 */
package com.datapro.eibs.parameters.key;

import com.datapro.eibs.access.KeySuper;

/**
 * @author fhernandez
 */
public class CNOFTKEY extends KeySuper {

	private String CNOTCN;
	private String CNOLAN;

	public String getCNOTCN() {
		return CNOTCN;
	}

	public void setCNOTCN(String cNOTCN) {
		CNOTCN = cNOTCN;
	}

	public String getCNOLAN() {
		return CNOLAN;
	}

	public void setCNOLAN(String cNOLAN) {
		CNOLAN = cNOLAN == null ? cNOLAN : cNOLAN.trim().toUpperCase();
	}	
	
}
