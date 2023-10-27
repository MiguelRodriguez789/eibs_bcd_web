package com.datapro.eibs.reporter.forms;

import com.datapro.eibs.reporter.model.ReportDTO;

public class LRGA30003 {

	private ReportDTO report;
	private String idRep;

	public LRGA30003() {
		idRep = "";
	}
	
	public ReportDTO getReport() {
		return report;
	}

	public void setReport(ReportDTO report) {
		this.report = report;
	}

	public String getIdRep() {
		return idRep;
	}

	public void setIdRep(String idRep) {
		this.idRep = idRep;
	}

}
