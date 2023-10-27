package com.datapro.eibs.security.vo;

import java.math.BigDecimal;
import java.sql.Timestamp;

import com.datapro.eibs.access.VOSuper;

/**
 * @author erodriguez
 */
public class WEBMO extends VOSuper implements Comparable {
	
	private String MOIDEN = BLANK;
	private String MOILIF = BLANK;
	private String MOENDS = BLANK;
	private BigDecimal MOHELP = ZERO;
	private BigDecimal MOMENU = ZERO;
	private String MOCODE = BLANK;
	private BigDecimal MOTLMM = ZERO;
	private BigDecimal MOTLMD = ZERO;
	private BigDecimal MOTLMY = ZERO;
	private Timestamp MOTLMT = null;
	private String MOTLMU = BLANK;
	
	public String getMOIDEN() {
		return MOIDEN;
	}
	public void setMOIDEN(String moiden) {
		MOIDEN = moiden;
	}
	public String getMOILIF() {
		return MOILIF;
	}
	public void setMOILIF(String moilif) {
		MOILIF = moilif;
	}
	public String getMOENDS() {
		return MOENDS;
	}
	public void setMOENDS(String moends) {
		MOENDS = moends;
	}
	public BigDecimal getMOHELP() {
		return MOHELP;
	}
	public void setMOHELP(BigDecimal mohelp) {
		MOHELP = mohelp;
	}
	public BigDecimal getMOMENU() {
		return MOMENU;
	}
	public void setMOMENU(BigDecimal momenu) {
		MOMENU = momenu;
	}
	public String getMOCODE() {
		return MOCODE;
	}
	public void setMOCODE(String mocode) {
		MOCODE = mocode;
	}
	public BigDecimal getMOTLMM() {
		return MOTLMM;
	}
	public void setMOTLMM(BigDecimal motlmm) {
		MOTLMM = motlmm;
	}
	public BigDecimal getMOTLMD() {
		return MOTLMD;
	}
	public void setMOTLMD(BigDecimal motlmd) {
		MOTLMD = motlmd;
	}
	public BigDecimal getMOTLMY() {
		return MOTLMY;
	}
	public void setMOTLMY(BigDecimal motlmy) {
		MOTLMY = motlmy;
	}
	public Timestamp getMOTLMT() {
		return MOTLMT;
	}
	public void setMOTLMT(Timestamp motlmt) {
		MOTLMT = motlmt;
	}
	public String getMOTLMU() {
		return MOTLMU;
	}
	public void setMOTLMU(String motlmu) {
		MOTLMU = motlmu;
	}
	@Override
	public int compareTo(Object o) {
		return this.getMOENDS().compareTo(((WEBMO)o).getMOENDS());
	}
	
}
