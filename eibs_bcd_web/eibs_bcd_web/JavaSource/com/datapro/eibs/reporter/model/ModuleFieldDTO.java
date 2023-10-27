package com.datapro.eibs.reporter.model;

import datapro.eibs.beans.ELEERRMessage;

public class ModuleFieldDTO extends DTOBeanMaster {

	private int ID_MFL;
	private int ID_MOD;
	private String FLDDSC;
	private String DATTYP;
	private int DATLNG;
	private String ALSTNG;
	private String AWHERE;
	private String AGRPBY;
	private String AGRFUN;
	private String FLDLBL;
	private String MNDTRY;
	private String ACTIVE;
	private String CREUSR;
	
	public ModuleFieldDTO(int mod) {
		ID_MFL = -1;
		ID_MOD = mod;
		FLDDSC = "";
		DATTYP = "";
		DATLNG = 0;
		ALSTNG = "0";
		AWHERE = "0";
		AGRPBY = "0";
		AGRFUN = "0";
		FLDLBL = "";
		MNDTRY = "0";
		ACTIVE = "0";
	}
	
	public ModuleFieldDTO() {
	}
	
	public int getID_MFL() {
		return ID_MFL;
	}
	public void setID_MFL(int id_mfl) {
		ID_MFL = id_mfl;
	}
	public int getID_MOD() {
		return ID_MOD;
	}
	public void setID_MOD(int id_mod) {
		ID_MOD = id_mod;
	}
	public String getFLDDSC() {
		return FLDDSC;
	}
	public void setFLDDSC(String flddsc) {
		FLDDSC = flddsc;
	}
	public String getDATTYP() {
		return DATTYP;
	}
	public void setDATTYP(String dattyp) {
		DATTYP = dattyp;
	}
	public int getDATLNG() {
		return DATLNG;
	}
	public void setDATLNG(int datlng) {
		DATLNG = datlng;
	}
	public String getALSTNG() {
		return ALSTNG;
	}
	public void setALSTNG(String alstng) {
		ALSTNG = alstng;
	}
	public String getAWHERE() {
		return AWHERE;
	}
	public void setAWHERE(String awhere) {
		AWHERE = awhere;
	}
	public String getAGRPBY() {
		return AGRPBY;
	}
	public void setAGRPBY(String agrpby) {
		AGRPBY = agrpby;
	}
	public String getAGRFUN() {
		return AGRFUN;
	}
	public void setAGRFUN(String agrfun) {
		AGRFUN = agrfun;
	}
	public String getFLDLBL() {
		return FLDLBL;
	}
	public void setFLDLBL(String fldlbl) {
		FLDLBL = fldlbl;
	}
	public String getMNDTRY() {
		return MNDTRY;
	}
	public void setMNDTRY(String mndtry) {
		MNDTRY = mndtry;
	}
	public String getACTIVE() {
		return ACTIVE;
	}
	public void setACTIVE(String active) {
		ACTIVE = active;
	}
	public String getCREUSR() {
		return CREUSR;
	}

	public void setCREUSR(String cREUSR) {
		CREUSR = cREUSR;
	}
	
	public ELEERRMessage validate() {
		error = new ELEERRMessage();
		error.setERRNUM("0");
		
		if (FLDDSC.trim().length() == 0)
			addError("120", "FLDDSC", "El campo 'Descripción' debe contener un valor válido.");
		if (FLDLBL.trim().length() == 0)
			addError("121", "FLDLBL", "El campo 'Etiqueta' debe contener un valor válido.");
		if (DATTYP.trim().length() == 0)
			addError("122", "DATTYP", "El campo 'Formato de Dato' debe contener un valor válido.");
		
		return error;
	}
}
