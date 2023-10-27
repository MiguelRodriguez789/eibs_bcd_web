package com.datapro.eibs.teller.vo;

import java.math.BigDecimal;

import com.datapro.eibs.access.VOSuper;

public class ATTELLUSERSViewLastBranchSeq extends VOSuper {

	private static final long serialVersionUID = 5925602116667630423L;
	
	private BigDecimal REFPREFIX  = ZERO;

	public BigDecimal getREFPREFIX() {
		return REFPREFIX;
	}

	public void setREFPREFIX(BigDecimal refprefix) {
		REFPREFIX = refprefix;
	}
	
}