package com.datapro.eibs.images.key;

import java.math.BigDecimal;

import com.datapro.eibs.access.KeySuper;

public class SCNSIGRULHIKEY extends KeySuper {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7209922031938371966L;

	private BigDecimal ACCUID = null;
	private String SIGRULE = null;
	private String CCYCODE = null;
	
	public BigDecimal getACCUID() {
		return ACCUID;
	}
	public void setACCUID(BigDecimal accuid) {
		ACCUID = accuid;
	}
	public String getSIGRULE() {
		return SIGRULE;
	}
	public void setSIGRULE(String sigrule) {
		SIGRULE = sigrule;
	}
	public String getCCYCODE() {
		return CCYCODE;
	}
	public void setCCYCODE(String ccycode) {
		CCYCODE = ccycode;
	}
}

