package com.datapro.eibs.images.vo;

import java.math.BigDecimal;

import com.datapro.eibs.access.VOSuper;

public class ATVCHECKViewImage extends VOSuper {

	private String PRESENTERBANK = "";
	private String SCANDATE = "";
	private String ABANUMBER = "";
	private String ACCOUNT = "";
	private String CHECKNUM = "";
	private BigDecimal CHECKAMOUNT = null;
	private byte[] IMAGEFRONT = null;
	private byte[] IMAGEBACK = null;
	
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
	public byte[] getIMAGEBACK() {
		return IMAGEBACK;
	}
	public void setIMAGEBACK(byte[] imageback) {
		IMAGEBACK = imageback;
	}
	public byte[] getIMAGEFRONT() {
		return IMAGEFRONT;
	}
	public void setIMAGEFRONT(byte[] imagefront) {
		IMAGEFRONT = imagefront;
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
	
}
