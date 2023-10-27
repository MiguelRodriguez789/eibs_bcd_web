package com.datapro.eibs.teller.vo;

import java.math.BigDecimal;

import com.datapro.eibs.access.VOSuper;

import datapro.eibs.master.Util;

public class ATTELLUSERS extends VOSuper {

	private static final long serialVersionUID = -4226209853023446618L;
	//Field type CHAR(10)
	private String TELLUSERID = BLANK;
	//Field type VARCHAR
	private String USERNAME = BLANK;
	//Field type SMALLINT
	private BigDecimal USERMOD = ZERO;
	//Field type CHAR(8)	
	private String USERCLASS = BLANK;
	//Field type SMALLINT
	private BigDecimal USERNIVEL = ZERO;
	//Field type CHAR(10)
	private String USERDATE = BLANK;
	//Field type SMALLINT
	private BigDecimal USERFLAGI = ZERO;
	//Field type SMALLINT
	private BigDecimal USERLOGON = ZERO;
	//Field type INTEGER
	private BigDecimal TRNSEQ = ZERO;
	//Field type CHAR(8)
	private String LASTTRNCODE = BLANK;
	//Field type SMALLINT
	private BigDecimal FLAGOTOPAY = ZERO;
	//Field type VARCHAR
	private String USERWSNAME = BLANK;
	//Field type CHAR(4)
	private String CODEBANK = BLANK;
	//Field type CHAR(6)
	private String CODEBRANCH = BLANK;
	//Field type SMALLINT
	private BigDecimal NUMCHGPASS = ZERO;
	//Field type CHAR(8)
	private String DATECHGPASS = BLANK;
	//Field type SMALLINT
	private BigDecimal WHENPASSEXPIRE = ZERO;
	//Field type VARCHAR
	private String USEREMAIL = BLANK;
	//Field type VARCHAR
	private String USERIPADDR = BLANK;
	//Field type INTEGER
	private BigDecimal ACCESSEXPIRE = ZERO;
	//Field type INTEGER
	private BigDecimal INACTIVEDAYS = ZERO;
	//Field type VARCHAR
	private String LASTLOGON = BLANK;
	//Field type CHAR(4)
	private String CODESHIFT = BLANK;
	//Field type SMALLINT
	private BigDecimal FLAGCASHFLOW = ZERO;
	//Field type SMALLINT
	private BigDecimal TAQEXTERNA = ZERO;
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
	public String getUSERCLASS() {
		return USERCLASS;
	}
	public void setUSERCLASS(String userclass) {
		USERCLASS = userclass;
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
	public BigDecimal getUSERFLAGI() {
		return USERFLAGI;
	}
	public void setUSERFLAGI(BigDecimal userflagi) {
		USERFLAGI = userflagi;
	}
	public BigDecimal getUSERLOGON() {
		return USERLOGON;
	}
	public void setUSERLOGON(BigDecimal userlogon) {
		USERLOGON = userlogon;
	}
	public BigDecimal getTRNSEQ() {
		return TRNSEQ;
	}
	public void setTRNSEQ(BigDecimal trnseq) {
		TRNSEQ = trnseq;
	}
	public String getLASTTRNCODE() {
		return LASTTRNCODE;
	}
	public void setLASTTRNCODE(String lasttrncode) {
		LASTTRNCODE = lasttrncode;
	}
	public BigDecimal getFLAGOTOPAY() {
		return FLAGOTOPAY;
	}
	public void setFLAGOTOPAY(BigDecimal flagotopay) {
		FLAGOTOPAY = flagotopay;
	}
	public String getUSERWSNAME() {
		return USERWSNAME;
	}
	public void setUSERWSNAME(String userwsname) {
		USERWSNAME = userwsname;
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
	public BigDecimal getNUMCHGPASS() {
		return NUMCHGPASS;
	}
	public void setNUMCHGPASS(BigDecimal numchgpass) {
		NUMCHGPASS = numchgpass;
	}
	public String getDATECHGPASS() {
		return DATECHGPASS;
	}
	public void setDATECHGPASS(String datechgpass) {
		DATECHGPASS = datechgpass;
	}
	public BigDecimal getWHENPASSEXPIRE() {
		return WHENPASSEXPIRE;
	}
	public void setWHENPASSEXPIRE(BigDecimal whenpassexpire) {
		WHENPASSEXPIRE = whenpassexpire;
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
	public BigDecimal getACCESSEXPIRE() {
		return ACCESSEXPIRE;
	}
	public void setACCESSEXPIRE(BigDecimal accessexpire) {
		ACCESSEXPIRE = accessexpire;
	}
	public BigDecimal getINACTIVEDAYS() {
		return INACTIVEDAYS;
	}
	public void setINACTIVEDAYS(BigDecimal inactivedays) {
		INACTIVEDAYS = inactivedays;
	}
	public String getLASTLOGON() {
		return LASTLOGON;
	}
	public void setLASTLOGON(String lastlogon) {
		LASTLOGON = lastlogon;
	}
	public String getCODESHIFT() {
		return CODESHIFT;
	}
	public void setCODESHIFT(String codeshift) {
		CODESHIFT = codeshift;
	}
	public BigDecimal getFLAGCASHFLOW() {
		return FLAGCASHFLOW;
	}
	public void setFLAGCASHFLOW(BigDecimal flagcashflow) {
		FLAGCASHFLOW = flagcashflow;
	}
	public BigDecimal getTAQEXTERNA() {
		return TAQEXTERNA;
	}
	public void setTAQEXTERNA(BigDecimal taqexterna) {
		TAQEXTERNA = taqexterna;
	}
	public BigDecimal getREFPREFIX() {
		return REFPREFIX;
	}
	public void setREFPREFIX(BigDecimal refprefix) {
		REFPREFIX = refprefix;
	}

}