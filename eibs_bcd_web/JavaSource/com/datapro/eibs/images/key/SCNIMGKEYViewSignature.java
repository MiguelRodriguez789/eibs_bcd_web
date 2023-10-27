package com.datapro.eibs.images.key;

import java.math.BigDecimal;

import com.datapro.eibs.access.KeySuper;

public class SCNIMGKEYViewSignature extends KeySuper {
	
	private String TBLTYP = null;
	private BigDecimal TBLNUM = null;
	private String TBLTBN = "";
	private BigDecimal TBLSSQ = null;
	
	public BigDecimal getTBLNUM() {
		return TBLNUM;
	}
	public void setTBLNUM(BigDecimal tblnum) {
		TBLNUM = tblnum;
	}
	public BigDecimal getTBLSSQ() {
		return TBLSSQ;
	}
	public void setTBLSEQ(BigDecimal tblseq) {
		TBLSSQ = tblseq;
	}
	public String getTBLTBN() {
		return TBLTBN;
	}
	public void setTBLTBN(String tbltbn) {
		TBLTBN = tbltbn;
	}
	public String getTBLTYP() {
		return TBLTYP;
	}
	public void setTBLTYP(String tBLTYP) {
		TBLTYP = tBLTYP;
	}
	

}
