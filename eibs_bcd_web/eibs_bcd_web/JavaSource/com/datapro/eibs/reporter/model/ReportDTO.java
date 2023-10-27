package com.datapro.eibs.reporter.model;

import java.sql.Timestamp;

import datapro.eibs.beans.ELEERRMessage;

public class ReportDTO extends DTOBeanMaster {

	private int ID_REP;
	private int ID_MOD;
	private String RPTTYP;
	private String RPTCOD;
	private String RPTDSC;
	private String PUBREP;
	private String CREUSR;
	private Timestamp CREADT;
	private String ACTIVE;

	public int getID_REP() {
		return ID_REP;
	}

	public void setID_REP(int iD_REP) {
		ID_REP = iD_REP;
	}

	public int getID_MOD() {
		return ID_MOD;
	}

	public void setID_MOD(int iD_MOD) {
		ID_MOD = iD_MOD;
	}

	public String getRPTTYP() {
		return RPTTYP;
	}

	public void setRPTTYP(String rPTTYP) {
		RPTTYP = rPTTYP;
	}

	public String getRPTCOD() {
		return RPTCOD;
	}

	public void setRPTCOD(String rPTCOD) {
		RPTCOD = rPTCOD;
	}

	public String getRPTDSC() {
		return RPTDSC;
	}

	public void setRPTDSC(String rPTDSC) {
		RPTDSC = rPTDSC;
	}

	public String getPUBREP() {
		return PUBREP;
	}

	public void setPUBREP(String pUBREP) {
		PUBREP = pUBREP;
	}

	public String getCREUSR() {
		return CREUSR;
	}

	public void setCREUSR(String cREUSR) {
		CREUSR = cREUSR;
	}

	public Timestamp getCREADT() {
		return CREADT;
	}

	public void setCREADT(Timestamp cREADT) {
		CREADT = cREADT;
	}

	public String getACTIVE() {
		return ACTIVE;
	}

	public void setACTIVE(String aCTIVE) {
		ACTIVE = aCTIVE;
	}

	public ELEERRMessage validate() {
		error = new ELEERRMessage();
		error.setERRNUM("0");

		if (RPTDSC.trim().length() == 0)
			addError("310", "RPTDSC", "El campo 'Descripción' debe contener un dato válido.");
	
		return error;
	}

}
