package com.datapro.eibs.images.key;

import java.math.BigDecimal;

import com.datapro.eibs.access.KeySuper;

public class SCNENTSIGKEY extends KeySuper {

	private String ENTTYP = "";
	private BigDecimal ENTUID = null;
	private BigDecimal ENTSEQ = null;
	
	public String getENTTYP() {
		return ENTTYP;
	}
	public void setENTTYP(String enttyp) {
		ENTTYP = enttyp;
	}
	public BigDecimal getENTUID() {
		return ENTUID;
	}
	public void setENTUID(BigDecimal entuid) {
		ENTUID = entuid;
	}
	public BigDecimal getENTSEQ() {
		return ENTSEQ;
	}
	public void setENTSEQ(BigDecimal entseq) {
		ENTSEQ = entseq;
	}
	
	
	
}
