package com.datapro.eibs.images.vo;

import java.math.BigDecimal;

import com.datapro.eibs.access.VOSuper;

public class SCANCHECK extends VOSuper {

	protected String BANK = "";
	protected String USERID = "";
	protected String SEQ = "";
	protected String SCANDATE = "";
	protected String ABA = "";
	protected String ACCOUNT = "";
	protected String SERIE = "";
	protected BigDecimal AMOUNT = null;
	protected byte[] IMAGE = null;
	protected byte[] BACKIMG = null;
	protected String CHECKDATE = "";
	
	public String getBANK() {
		return BANK;
	}
	public void setBANK(String bank) {
		BANK = bank;
	}
	public String getUSERID() {
		return USERID;
	}
	public void setUSERID(String userid) {
		USERID = userid;
	}
	public String getSEQ() {
		return SEQ;
	}
	public void setSEQ(String seq) {
		SEQ = seq;
	}
	public String getSCANDATE() {
		return SCANDATE;
	}
	public void setSCANDATE(String scandate) {
		SCANDATE = scandate;
	}
	public String getABA() {
		return ABA;
	}
	public void setABA(String aba) {
		ABA = aba;
	}
	public String getACCOUNT() {
		return ACCOUNT;
	}
	public void setACCOUNT(String account) {
		ACCOUNT = account;
	}
	public String getSERIE() {
		return SERIE;
	}
	public void setSERIE(String serie) {
		SERIE = serie;
	}
	public BigDecimal getAMOUNT() {
		return AMOUNT;
	}
	public void setAMOUNT(BigDecimal amount) {
		AMOUNT = amount;
	}
	public byte[] getIMAGE() {
		return IMAGE;
	}
	public void setIMAGE(byte[] image) {
		IMAGE = image;
	}
	public byte[] getBACKIMG() {
		return BACKIMG;
	}
	public void setBACKIMG(byte[] backimg) {
		BACKIMG = backimg;
	}
	public String getCHECKDATE() {
		return CHECKDATE;
	}
	public void setCHECKDATE(String checkdate) {
		CHECKDATE = checkdate;
	}
	
}
