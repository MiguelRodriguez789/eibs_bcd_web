package com.datapro.eibs.security.key;

import java.math.BigDecimal;

import com.datapro.eibs.access.KeySuper;

public class HOLYDKEYView extends KeySuper {

	private String HOLCTR = "";
	private BigDecimal HOLDAY = null;
	private BigDecimal HOLDAM = null;
	private BigDecimal HOLDAD = null;
	
	public String getHOLCTR() {
		return HOLCTR;
	}
	public void setHOLCTR(String holctr) {
		HOLCTR = holctr;
	}
	public BigDecimal getHOLDAY() {
		return HOLDAY;
	}
	public void setHOLDAY(BigDecimal holday) {
		HOLDAY = holday;
	}
	public BigDecimal getHOLDAM() {
		return HOLDAM;
	}
	public void setHOLDAM(BigDecimal holdam) {
		HOLDAM = holdam;
	}
	public BigDecimal getHOLDAD() {
		return HOLDAD;
	}
	public void setHOLDAD(BigDecimal holdad) {
		HOLDAD = holdad;
	}
	
	
}
