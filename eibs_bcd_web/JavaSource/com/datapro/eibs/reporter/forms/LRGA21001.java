package com.datapro.eibs.reporter.forms;

import java.util.List;

public class LRGA21001 {

	private List tables; // <DBTableDTO>
	private String textSearch;

	public LRGA21001() {
		textSearch = "";
	}
	
	public List getTables() {
		return tables;
	}

	public void setTables(List tables) {
		this.tables = tables;
	}

	public String getTextSearch() {
		return textSearch;
	}

	public void setTextSearch(String textSearch) {
		this.textSearch = textSearch;
	}

}
