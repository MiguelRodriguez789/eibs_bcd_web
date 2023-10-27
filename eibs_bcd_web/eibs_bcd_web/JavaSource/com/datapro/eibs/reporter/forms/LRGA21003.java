package com.datapro.eibs.reporter.forms;

import java.util.Arrays;
import java.util.List;

public class LRGA21003 {

	private String strTables;
	private String searchTable;
	private List columnList; // <DBColumnDTO>

	public LRGA21003() {
		strTables = "";
		searchTable = "";
	}

	public List getTableNameList() {
		return Arrays.asList(strTables.split("\\s*,\\s*"));
	}
	
	public String getStrTables() {
		return strTables;
	}

	public void setStrTables(String strTables) {
		this.strTables = strTables;
	}

	public String getSearchTable() {
		return searchTable;
	}

	public void setSearchTable(String searchTable) {
		this.searchTable = searchTable;
	}

	public List getColumnList() {
		return columnList;
	}

	public void setColumnList(List columnList) {
		this.columnList = columnList;
	}
	
}
