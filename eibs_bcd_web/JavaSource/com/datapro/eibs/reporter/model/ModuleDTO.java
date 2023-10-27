package com.datapro.eibs.reporter.model;

import java.util.List;

import datapro.eibs.beans.ELEERRMessage;

public class ModuleDTO extends DTOBeanMaster {

	private int ID_MOD;
	private String MODCOD;
	private String MODDSC;
	private String ENTSTR;
	private String RELSTR;
	private String PUBMOD;
	private String ACTIVE;
	private List modFldList;
	private String CREUSR;

	public ModuleDTO() {
		ID_MOD = -1;
		MODCOD = "";
		MODDSC = "";
		ENTSTR = "";
		RELSTR = "";
		PUBMOD = "";
		ACTIVE = "";
		CREUSR = "";
	}
	
	public int getID_MOD() {
		return ID_MOD;
	}

	public void setID_MOD(int id_mod) {
		ID_MOD = id_mod;
	}

	public String getMODCOD() {
		return MODCOD;
	}

	public void setMODCOD(String modcod) {
		MODCOD = modcod;
	}

	public String getMODDSC() {
		return MODDSC;
	}

	public void setMODDSC(String moddsc) {
		MODDSC = moddsc;
	}

	public String getENTSTR() {
		return ENTSTR;
	}

	public void setENTSTR(String entstr) {
		ENTSTR = entstr;
	}

	public String getRELSTR() {
		return RELSTR;
	}

	public void setRELSTR(String relstr) {
		RELSTR = relstr;
	}

	public String getPUBMOD() {
		return PUBMOD;
	}

	public void setPUBMOD(String pubmod) {
		PUBMOD = pubmod;
	}

	public String getACTIVE() {
		return ACTIVE;
	}

	public void setACTIVE(String active) {
		ACTIVE = active;
	}

	public List getModFldList() {
		return modFldList;
	}

	public void setModFldList(List modFldList) {
		this.modFldList = modFldList;
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

		if (MODDSC.trim().length() == 0)
			addError("110", "MODDSC", "El campo 'Descripción' debe contener un dato válido.");
		if (ENTSTR.trim().length() == 0)
			addError("111", "ENTSTR", "El campo 'Tablas del IBS' debe contener un dato válido.");
		/*
		   if (RELSTR.trim().length() == 0)
			addError("112", "RELSTR", "El campo 'Relaciones' debe contener un dato válido.");
		*/
		return error;
	}

}
