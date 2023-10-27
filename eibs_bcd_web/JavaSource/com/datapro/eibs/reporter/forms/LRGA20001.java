package com.datapro.eibs.reporter.forms;

import java.util.List;

public class LRGA20001 {

	private List moduleList; // <ModuleDTO>
	private String message;
	private String textSearch;
	private String searchBy;

	
	
	public LRGA20001() {
		message = "";
		textSearch = "";
		searchBy = "";
	}

	public List getModuleList() {
		return moduleList;
	}

	public void setModuleList(List moduleList) {
		this.moduleList = moduleList;
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

	public String getSearchBy() {
		return searchBy;
	}

	public void setSearchBy(String searchBy) {
		this.searchBy = searchBy;
	}

}
