package com.datapro.eibs.security.vo;

/**
 * @author erodriguez
 */
import java.math.BigDecimal;
import java.sql.Timestamp;

import com.datapro.eibs.access.VOSuper;

public class WEBMUS extends VOSuper {

	private String OUSUSR = BLANK;
	private String OUSSID = BLANK;
	private String OUSDEN = BLANK;
	private String OUSSEQ = BLANK;
	private String OUSLIF = BLANK;
	private BigDecimal OUSLMM = ZERO;
	private BigDecimal OUSLMD = ZERO;
	private BigDecimal OUSLMY = ZERO;
	private Timestamp OUSLMT = null;
	private String OUSLMU = BLANK;
	
	public String getOUSUSR() {
		return OUSUSR;
	}
	public void setOUSUSR(String oususr) {
		OUSUSR = oususr;
	}
	public String getOUSSID() {
		return OUSSID;
	}
	public void setOUSSID(String oussid) {
		OUSSID = oussid;
	}
	public String getOUSDEN() {
		return OUSDEN;
	}
	public void setOUSDEN(String ousden) {
		OUSDEN = ousden;
	}
	public String getOUSSEQ() {
		return OUSSEQ;
	}
	public void setOUSSEQ(String ousseq) {
		OUSSEQ = ousseq;
	}
	public String getOUSLIF() {
		return OUSLIF;
	}
	public void setOUSLIF(String ouslif) {
		OUSLIF = ouslif;
	}
	public BigDecimal getOUSLMM() {
		return OUSLMM;
	}
	public void setOUSLMM(BigDecimal ouslmm) {
		OUSLMM = ouslmm;
	}
	public BigDecimal getOUSLMD() {
		return OUSLMD;
	}
	public void setOUSLMD(BigDecimal ouslmd) {
		OUSLMD = ouslmd;
	}
	public BigDecimal getOUSLMY() {
		return OUSLMY;
	}
	public void setOUSLMY(BigDecimal ouslmy) {
		OUSLMY = ouslmy;
	}
	public Timestamp getOUSLMT() {
		return OUSLMT;
	}
	public void setOUSLMT(Timestamp ouslmt) {
		OUSLMT = ouslmt;
	}
	public String getOUSLMU() {
		return OUSLMU;
	}
	public void setOUSLMU(String ouslmu) {
		OUSLMU = ouslmu;
	}
	
}
