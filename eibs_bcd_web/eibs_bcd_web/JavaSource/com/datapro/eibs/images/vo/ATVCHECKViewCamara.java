package com.datapro.eibs.images.vo;

import java.math.BigDecimal;

import com.datapro.eibs.access.VOSuper;

public class ATVCHECKViewCamara extends VOSuper {

	private String TRNSEQ = "";
	private String CODEBANK = "";
	private String USERIDPOD = "";
	private String SEQUENCEITEM = "";
	private String CODEBRANCH = "";
	private String SCANDATE = "";
	private String ABANUMBER = "";
	private String ACCOUNT = "";
	private String CHECKNUM = "";
	private BigDecimal CHECKAMOUNT = null;
	private byte[] IMAGEFRONT = null;
	private byte[] IMAGEBACK = null;
	
	public String getTRNSEQ() {
		return TRNSEQ;
	}
	public void setTRNSEQ(String trnseq) {
		TRNSEQ = trnseq;
	}
	public String getSCANDATE() {
		return SCANDATE;
	}
	public void setSCANDATE(String scandate) {
		SCANDATE = scandate;
	}
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
	public String getCHECKNUM() {
		return CHECKNUM;
	}
	public void setCHECKNUM(String checknum) {
		CHECKNUM = checknum;
	}
	public BigDecimal getCHECKAMOUNT() {
		return CHECKAMOUNT;
	}
	public void setCHECKAMOUNT(BigDecimal checkamount) {
		CHECKAMOUNT = checkamount;
	}
	public byte[] getIMAGEFRONT() {
		return IMAGEFRONT;
	}
	public void setIMAGEFRONT(byte[] imagefront) {
		IMAGEFRONT = imagefront;
	}
	public byte[] getIMAGEBACK() {
		return IMAGEBACK;
	}
	public void setIMAGEBACK(byte[] imageback) {
		IMAGEBACK = imageback;
	}
	public String getCODEBRANCH() {
		return CODEBRANCH;
	}
	public void setCODEBRANCH(String codebranch) {
		CODEBRANCH = codebranch;
	}
	public String getCODEBANK() {
		return CODEBANK;
	}
	public void setCODEBANK(String codebank) {
		CODEBANK = codebank;
	}
	public String getUSERIDPOD() {
		return USERIDPOD;
	}
	public void setUSERIDPOD(String useridpod) {
		USERIDPOD = useridpod;
	}
	public String getSEQUENCEITEM() {
		return SEQUENCEITEM;
	}
	public void setSEQUENCEITEM(String sequenceitem) {
		SEQUENCEITEM = sequenceitem;
	}
	
}
