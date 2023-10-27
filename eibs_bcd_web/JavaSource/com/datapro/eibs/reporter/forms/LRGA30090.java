package com.datapro.eibs.reporter.forms;

import java.util.List;

public class LRGA30090 {

	private List UserList; // <LRGUserDTO>
	private String message;
	private String textSearch;
	private String usersWithReportsOnly;
	
	public LRGA30090() {
		message = "";
		textSearch = "";
		usersWithReportsOnly = "1";
	}

	public List getUserList() {
		return UserList;
	}

	public void setUserList(List userList) {
		UserList = userList;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getTextSearch() {
		return textSearch;
	}

	public void setTextSearch(String textSearch) {
		this.textSearch = textSearch;
	}

	public String getUsersWithReportsOnly() {
		return usersWithReportsOnly;
	}

	public void setUsersWithReportsOnly(String usersWithReportsOnly) {
		this.usersWithReportsOnly = usersWithReportsOnly;
	}
	
}
