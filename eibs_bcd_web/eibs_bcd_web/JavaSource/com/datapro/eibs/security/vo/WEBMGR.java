package com.datapro.eibs.security.vo;

import java.math.BigDecimal;
import java.sql.Timestamp;

import com.datapro.eibs.access.VOSuper;

public class WEBMGR extends VOSuper {

	private String OGRUSR = BLANK;
	private String OGRSID = BLANK;
	private String OGRDEN = BLANK;
	private String OGRSEQ = BLANK;
	private String OGRLIF = BLANK;
	private BigDecimal OGRLMM = ZERO;
	private BigDecimal OGRLMD = ZERO;
	private BigDecimal OGRLMY = ZERO;
	private Timestamp OGRLMT = null;
	private String OGRLMU = BLANK;
	
	public String getOGRUSR() {
		return OGRUSR;
	}
	public void setOGRUSR(String ogrusr) {
		OGRUSR = ogrusr;
	}
	public String getOGRSID() {
		return OGRSID;
	}
	public void setOGRSID(String ogrsid) {
		OGRSID = ogrsid;
	}
	public String getOGRDEN() {
		return OGRDEN;
	}
	public void setOGRDEN(String ogrden) {
		OGRDEN = ogrden;
	}
	public String getOGRSEQ() {
		return OGRSEQ;
	}
	public void setOGRSEQ(String ogrseq) {
		OGRSEQ = ogrseq;
	}
	public String getOGRLIF() {
		return OGRLIF;
	}
	public void setOGRLIF(String ogrlif) {
		OGRLIF = ogrlif;
	}
	public BigDecimal getOGRLMM() {
		return OGRLMM;
	}
	public void setOGRLMM(BigDecimal ogrlmm) {
		OGRLMM = ogrlmm;
	}
	public BigDecimal getOGRLMD() {
		return OGRLMD;
	}
	public void setOGRLMD(BigDecimal ogrlmd) {
		OGRLMD = ogrlmd;
	}
	public BigDecimal getOGRLMY() {
		return OGRLMY;
	}
	public void setOGRLMY(BigDecimal ogrlmy) {
		OGRLMY = ogrlmy;
	}
	public Timestamp getOGRLMT() {
		return OGRLMT;
	}
	public void setOGRLMT(Timestamp ogrlmt) {
		OGRLMT = ogrlmt;
	}
	public String getOGRLMU() {
		return OGRLMU;
	}
	public void setOGRLMU(String ogrlmu) {
		OGRLMU = ogrlmu;
	}
}
