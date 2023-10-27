package com.datapro.eibs.reporter.forms;

import java.util.List;

public class LRG000101 {
	private String userID;
	private List moduleList; // <ModuleDTO>
	private List missingModuleList; // <ModuleDTO>
	private int[] arrSelectedFields;
	private String masterUser;
	private String message;

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public List getModuleList() {
		return moduleList;
	}

	public void setModuleList(List moduleList) {
		this.moduleList = moduleList;
	}

	public List getMissingModuleList() {
		return missingModuleList;
	}

	public void setMissingModuleList(List missingModuleList) {
		this.missingModuleList = missingModuleList;
	}

	public int[] getArrSelectedFields() {
		return arrSelectedFields;
	}

	public void setArrSelectedFields(int[] arrSelectedFields) {
		this.arrSelectedFields = arrSelectedFields;
	}

	public String getMasterUser() {
		return masterUser;
	}

	public void setMasterUser(String masterUser) {
		this.masterUser = masterUser;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
