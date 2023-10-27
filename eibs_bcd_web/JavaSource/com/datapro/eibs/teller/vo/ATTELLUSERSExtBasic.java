package com.datapro.eibs.teller.vo;

import java.math.BigDecimal;

import com.datapro.eibs.access.VOSuper;

import datapro.eibs.master.Util;

public class ATTELLUSERSExtBasic extends VOSuper {

	private static final long serialVersionUID = -6460904430748818688L;
	
	private String TELLUSERID = BLANK;
	private String USERNAME = BLANK;
	private BigDecimal USERMOD = ZERO;
	private BigDecimal USERNIVEL = ZERO;
	private String USERDATE = BLANK;
	private BigDecimal TRNSEQ = ZERO;
	private String CODEBANK = BLANK;
	private String CODEBRANCH = BLANK;
	private String USEREMAIL = BLANK;
	private String USERIPADDR = BLANK;
	private String CODESHIFT = BLANK;
	private BigDecimal REFPREFIX  = ZERO;
	
	public String getTELLUSERID() {
		return TELLUSERID;
	}
	public void setTELLUSERID(String telluserid) {
		TELLUSERID = telluserid;
	}
	public String getUSERNAME() {
		return USERNAME;
	}
	public void setUSERNAME(String username) {
		USERNAME = username;
	}
	public BigDecimal getUSERMOD() {
		return USERMOD;
	}
	public void setUSERMOD(BigDecimal usermod) {
		USERMOD = usermod;
	}
	public BigDecimal getUSERNIVEL() {
		return USERNIVEL;
	}
	public void setUSERNIVEL(BigDecimal usernivel) {
		USERNIVEL = usernivel;
	}
	public String getUSERDATE() {
		return USERDATE;
	}
	public void setUSERDATE(String userdate) {
		USERDATE = userdate;
	}
	public BigDecimal getTRNSEQ() {
		return TRNSEQ;
	}
	public void setTRNSEQ(BigDecimal trnseq) {
		TRNSEQ = trnseq;
	}
	public String getCODEBANK() {
		return Util.addLeftChar('0', 4, CODEBANK.trim());
	}
	public void setCODEBANK(String codebank) {
		CODEBANK = codebank;
	}
	public String getCODEBRANCH() {
		return Util.addLeftChar('0', 4, CODEBRANCH.trim());
	}
	public void setCODEBRANCH(String codebranch) {
		CODEBRANCH = codebranch;
	}
	public String getUSEREMAIL() {
		return USEREMAIL;
	}
	public void setUSEREMAIL(String useremail) {
		USEREMAIL = useremail;
	}
	public String getUSERIPADDR() {
		return USERIPADDR;
	}
	public void setUSERIPADDR(String useripaddr) {
		USERIPADDR = useripaddr;
	}
	public String getCODESHIFT() {
		return CODESHIFT;
	}
	public void setCODESHIFT(String codeshift) {
		CODESHIFT = codeshift;
	}
	public BigDecimal getREFPREFIX() {
		return REFPREFIX;
	}
	public void setREFPREFIX(BigDecimal refprefix) {
		REFPREFIX = refprefix;
	}

}