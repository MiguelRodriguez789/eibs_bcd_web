package com.datapro.eibs.reporter.forms;

import com.datapro.eibs.reporter.model.ModuleDTO;
import com.datapro.eibs.reporter.model.ModuleFieldDTO;

public class LRGA20003 {

	private ModuleDTO module;
	private ModuleFieldDTO moduleField;
	private String idMod;
	private String idModFld;

	public ModuleFieldDTO getModuleField() {
		return moduleField;
	}

	public void setModuleField(ModuleFieldDTO moduleField) {
		this.moduleField = moduleField;
	}

	public String getIdMod() {
		return idMod;
	}

	public void setIdMod(String idMod) {
		this.idMod = idMod;
	}

	public String getIdModFld() {
		return idModFld;
	}

	public void setIdModFld(String idModFld) {
		this.idModFld = idModFld;
	}

	public ModuleDTO getModule() {
		return module;
	}

	public void setModule(ModuleDTO module) {
		this.module = module;
	}

}
