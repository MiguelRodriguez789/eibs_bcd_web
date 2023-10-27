package com.datapro.eibs.reporter.model;

import datapro.eibs.beans.ELEERRMessage;

public class LRGUserDTO extends DTOBeanMaster {

	private String userName;
	private String userCode;
	private int totalReports;
	private String authority;
	
	
	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



	public String getUserCode() {
		return userCode;
	}



	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}



	public int getTotalReports() {
		return totalReports;
	}



	public void setTotalReports(int totalReports) {
		this.totalReports = totalReports;
	}



	public ELEERRMessage validate() {
		return null;
	}



	public String getAuthority() {
		return authority;
	}



	public void setAuthority(String authority) {
		this.authority = authority;
	}

	
}
