package com.datapro.eibs.images.vo;

import java.math.BigDecimal;


public class SCNIMGViewSignature extends SCNIMGView {
	
	private String TBLTYP = BLANK;
	protected BigDecimal TBLNUM = ZERO;	   
	private BigDecimal TBLSEQ = ZERO;
	private String TBLTBN = BLANK;
	
	public String getTBLTYP() {
		return TBLTYP.trim();
	}
	public void setTBLTYP(String tBLTYP) {
		TBLTYP = tBLTYP;
	}
	public BigDecimal getTBLSEQ() {
		return TBLSEQ;
	}
	public void setTBLSEQ(BigDecimal tBLSEQ) {
		TBLSEQ = tBLSEQ;
	}

	public java.math.BigDecimal getTBLNUM() {
		return TBLNUM;
	}

	public void setTBLNUM(java.math.BigDecimal decimal) {
		TBLNUM = decimal;
	}
	public String getTBLTBN() {
		return TBLTBN.trim();
	}
	public void setTBLTBN(String tBLTBN) {
		TBLTBN = tBLTBN;
	}
	
}
