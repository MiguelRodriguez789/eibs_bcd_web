package com.datapro.eibs.teller.vo;

import com.datapro.eibs.access.VOSuper;

import datapro.eibs.master.Util;

public class ATTELLUSERSViewByName extends VOSuper {

	private static final long serialVersionUID = 5050917193724443811L;
	//Field type CHAR(10)
	private String TELLUSERID = BLANK;
	//Field type VARCHAR
	private String USERNAME = BLANK;
	//Field type CHAR(8)	
	private String USERCLASS = BLANK;
	//Field type CHAR(10)
	private String USERDATE = BLANK;
	//Field type VARCHAR
	private String USERWSNAME = BLANK;
	//Field type CHAR(4)
	private String CODEBANK = BLANK;
	//Field type CHAR(6)
	private String CODEBRANCH = BLANK;

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
	public String getUSERCLASS() {
		return USERCLASS;
	}
	public void setUSERCLASS(String userclass) {
		USERCLASS = userclass;
	}
	public String getUSERDATE() {
		return USERDATE;
	}
	public void setUSERDATE(String userdate) {
		USERDATE = userdate;
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
	
	
}