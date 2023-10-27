package com.datapro.eibs.security.vo;

import java.math.BigDecimal;

import com.datapro.eibs.access.VOSuper;

public class HOLYDView extends VOSuper {
	
	private String HOLCTR = BLANK;
	private BigDecimal HOLDAY = ZERO;
	private BigDecimal HOLDAM = ZERO;
	private BigDecimal HOLDAD = ZERO;
	
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
	public String getHOLCTR() {
		return HOLCTR;
	}
	public void setHOLCTR(String holctr) {
		HOLCTR = holctr;
	}

}
