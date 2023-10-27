/*
 * Created on Jul 13, 2014
 *
 */
package com.datapro.eibs.parameters.key;

import com.datapro.eibs.access.KeySuper;

/**
 * @author fhernandez
 */
public class CNOFCKEY extends KeySuper {

	private String CNOCFL;
	private String CNORCD;
	
	public String getCNOCFL() {
		return CNOCFL;
	}
	public void setCNOCFL(String cNOCFL) {
		CNOCFL = cNOCFL;
	}
	public String getCNORCD() {
		return CNORCD;
	}
	public void setCNORCD(String cNORCD) {
		CNORCD = cNORCD;
	}

	
}
