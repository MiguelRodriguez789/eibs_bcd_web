package com.datapro.eibs.images.vo;

import java.math.BigDecimal;

import com.datapro.eibs.access.VOSuper;

public class SCNENTSIG extends VOSuper {
	
	private String ENTTYP = "";
	private BigDecimal ENTUID = null;
	private String ENTNAM = "";
	private BigDecimal ENTSEQ = null;
	private String ENTDSC = "";
	private BigDecimal ENTLMY = null;
	private BigDecimal ENTLMM = null;
	private BigDecimal ENTLMD = null;
	private int ENTLEN = 0;
	private byte[] ENTBIN = null;
	
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
	public String getENTNAM() {
		return ENTNAM;
	}
	public void setENTNAM(String entnam) {
		ENTNAM = entnam;
	}
	public BigDecimal getENTSEQ() {
		return ENTSEQ;
	}
	public void setENTSEQ(BigDecimal entseq) {
		ENTSEQ = entseq;
	}
	public String getENTDSC() {
		return ENTDSC;
	}
	public void setENTDSC(String entdsc) {
		ENTDSC = entdsc;
	}
	public BigDecimal getENTLMY() {
		return ENTLMY;
	}
	public void setENTLMY(BigDecimal entlmy) {
		ENTLMY = entlmy;
	}
	public BigDecimal getENTLMM() {
		return ENTLMM;
	}
	public void setENTLMM(BigDecimal entlmm) {
		ENTLMM = entlmm;
	}
	public BigDecimal getENTLMD() {
		return ENTLMD;
	}
	public void setENTLMD(BigDecimal entlmd) {
		ENTLMD = entlmd;
	}
	public int getENTLEN() {
		return ENTLEN;
	}
	public void setENTLEN(int entlen) {
		ENTLEN = entlen;
	}
	public byte[] getENTBIN() {
		return ENTBIN;
	}
	public void setENTBIN(byte[] entbin) {
		ENTBIN = entbin;
	}
	
}
