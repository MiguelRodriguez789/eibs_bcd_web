package com.datapro.eibs.reporter.forms;

import java.util.List;

public class LRGA30002 {

	private List reportList; // <ReportDTO>
	private String textSearch;

	
	
	public LRGA30002() {
		textSearch = "";
	}

	public List getReportList() {
		return reportList;
	}

	public void setReportList(List reportList) {
		this.reportList = reportList;
	}

	public String getTextSearch() {
		return textSearch;
	}

	public void setTextSearch(String textSearch) {
		this.textSearch = textSearch;
	}

}
