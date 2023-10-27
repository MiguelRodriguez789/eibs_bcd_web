package com.datapro.eibs.security.vo;

import java.math.BigDecimal;
import java.sql.Timestamp;

import com.datapro.eibs.access.VOSuper;

public class WEBMM extends VOSuper implements Comparable {

	private String MMIDEN = BLANK;
	private String MMILIF = BLANK;
	private String MMENDS = BLANK;
	private BigDecimal MMHELP = ZERO;
	private BigDecimal MMMENU = ZERO;
	private BigDecimal MMTLMM = ZERO;
	private BigDecimal MMTLMD = ZERO;
	private BigDecimal MMTLMY = ZERO;
	private Timestamp MMTLMT = null;
	private String MMTLMU = BLANK;
	
	public String getMMIDEN() {
		return MMIDEN;
	}
	public void setMMIDEN(String mmiden) {
		MMIDEN = mmiden;
	}
	public String getMMILIF() {
		return MMILIF;
	}
	public void setMMILIF(String mmilif) {
		MMILIF = mmilif;
	}
	public String getMMENDS() {
		return MMENDS;
	}
	public void setMMENDS(String mmends) {
		MMENDS = mmends;
	}
	public BigDecimal getMMHELP() {
		return MMHELP;
	}
	public void setMMHELP(BigDecimal mmhelp) {
		MMHELP = mmhelp;
	}
	public BigDecimal getMMMENU() {
		return MMMENU;
	}
	public void setMMMENU(BigDecimal mmmenu) {
		MMMENU = mmmenu;
	}
	public BigDecimal getMMTLMM() {
		return MMTLMM;
	}
	public void setMMTLMM(BigDecimal mmtlmm) {
		MMTLMM = mmtlmm;
	}
	public BigDecimal getMMTLMD() {
		return MMTLMD;
	}
	public void setMMTLMD(BigDecimal mmtlmd) {
		MMTLMD = mmtlmd;
	}
	public BigDecimal getMMTLMY() {
		return MMTLMY;
	}
	public void setMMTLMY(BigDecimal mmtlmy) {
		MMTLMY = mmtlmy;
	}
	public Timestamp getMMTLMT() {
		return MMTLMT;
	}
	public void setMMTLMT(Timestamp mmtlmt) {
		MMTLMT = mmtlmt;
	}
	public String getMMTLMU() {
		return MMTLMU;
	}
	public void setMMTLMU(String mmtlmu) {
		MMTLMU = mmtlmu;
	}
	@Override
	public int compareTo(Object o) {
		return this.getMMENDS().compareTo(((WEBMM)o).getMMENDS());
	}
	
	
}
