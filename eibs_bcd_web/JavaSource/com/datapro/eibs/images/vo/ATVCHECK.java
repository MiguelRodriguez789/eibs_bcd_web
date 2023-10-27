package com.datapro.eibs.images.vo;

import java.math.BigDecimal;

import com.datapro.eibs.access.VOSuper;

public class ATVCHECK extends VOSuper {

	protected String SCANDATE = "";
	protected String CODEBANK = "";
	protected String CODEBRANCH = "";
	protected String USERIDPOD = "";
	protected String SEQUENCEITEM = "";
	protected String DOCTYPECODE = "";
	protected String SEQUENCHK = "";
	protected String ABANUMBER = "";
	protected String ACCOUNT = "";
	protected String CHECKNUM = "";
	protected BigDecimal CHECKAMOUNT = null;
	protected String SCANTIME = "";
	protected String USERID = "";
	protected String CCYCODE = "";
	protected String PRESENTERBANK = "";
	protected String MARKINGDIGIT = "";
	protected String STATUS = "";
	protected String CHECKTYPE = "";
	protected BigDecimal CRAMT = null;
	protected BigDecimal DBAMT = null;
	protected String CAMARA = "";
	
	public String getABANUMBER() {
		return ABANUMBER;
	}
	public void setABANUMBER(String abanumber) {
		ABANUMBER = abanumber;
	}
	public String getACCOUNT() {
		return ACCOUNT;
	}
	public void setACCOUNT(String account) {
		ACCOUNT = account;
	}
	public String getCAMARA() {
		return CAMARA;
	}
	public void setCAMARA(String camara) {
		CAMARA = camara;
	}
	public String getCCYCODE() {
		return CCYCODE;
	}
	public void setCCYCODE(String ccycode) {
		CCYCODE = ccycode;
	}
	public BigDecimal getCHECKAMOUNT() {
		return CHECKAMOUNT;
	}
	public void setCHECKAMOUNT(BigDecimal checkamount) {
		CHECKAMOUNT = checkamount;
	}
	public String getCHECKNUM() {
		return CHECKNUM;
	}
	public void setCHECKNUM(String checknum) {
		CHECKNUM = checknum;
	}
	public String getCHECKTYPE() {
		return CHECKTYPE;
	}
	public void setCHECKTYPE(String checktype) {
		CHECKTYPE = checktype;
	}
	public String getCODEBANK() {
		return CODEBANK;
	}
	public void setCODEBANK(String codebank) {
		CODEBANK = codebank;
	}
	public String getCODEBRANCH() {
		return CODEBRANCH;
	}
	public void setCODEBRANCH(String codebranch) {
		CODEBRANCH = codebranch;
	}
	public BigDecimal getCRAMT() {
		return CRAMT;
	}
	public void setCRAMT(BigDecimal cramt) {
		CRAMT = cramt;
	}
	public BigDecimal getDBAMT() {
		return DBAMT;
	}
	public void setDBAMT(BigDecimal dbamt) {
		DBAMT = dbamt;
	}
	public String getDOCTYPECODE() {
		return DOCTYPECODE;
	}
	public void setDOCTYPECODE(String doctypecode) {
		DOCTYPECODE = doctypecode;
	}
	public String getMARKINGDIGIT() {
		return MARKINGDIGIT;
	}
	public void setMARKINGDIGIT(String markingdigit) {
		MARKINGDIGIT = markingdigit;
	}
	public String getPRESENTERBANK() {
		return PRESENTERBANK;
	}
	public void setPRESENTERBANK(String presenterbank) {
		PRESENTERBANK = presenterbank;
	}
	public String getSCANDATE() {
		return SCANDATE;
	}
	public void setSCANDATE(String scandate) {
		SCANDATE = scandate;
	}
	public String getSCANTIME() {
		return SCANTIME;
	}
	public void setSCANTIME(String scantime) {
		SCANTIME = scantime;
	}
	public String getSEQUENCEITEM() {
		return SEQUENCEITEM;
	}
	public void setSEQUENCEITEM(String sequenceitem) {
		SEQUENCEITEM = sequenceitem;
	}
	public String getSEQUENCHK() {
		return SEQUENCHK;
	}
	public void setSEQUENCHK(String sequenchk) {
		SEQUENCHK = sequenchk;
	}
	public String getSTATUS() {
		return STATUS;
	}
	public void setSTATUS(String status) {
		STATUS = status;
	}
	public String getUSERID() {
		return USERID;
	}
	public void setUSERID(String userid) {
		USERID = userid;
	}
	public String getUSERIDPOD() {
		return USERIDPOD;
	}
	public void setUSERIDPOD(String useridpod) {
		USERIDPOD = useridpod;
	}
	
}
