package com.datapro.eibs.reporter.forms;

import java.util.Arrays;
import java.util.List;

public class LRGA21002 {

	private String strTables;
	private List tableList; // <DBTableDTO>

	public LRGA21002() {
		strTables = "";
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

	public List getTableList() {
		return tableList;
	}

	public void setTableList(List tableList) {
		this.tableList = tableList;
	}
	
}
