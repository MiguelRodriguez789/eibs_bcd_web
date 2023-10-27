package com.datapro.eibs.reporter.forms;

import java.util.List;

import com.datapro.eibs.reporter.model.ModuleDTO;

public class LRGA20002 {

	private ModuleDTO module; 
	private String idMod;
	private List moduleFieldList; // <ModuleFieldDTO>
	private int moduleFieldListSize;
	private String message;
	
	public LRGA20002() {
		idMod = "";
	}
	
	public ModuleDTO getModule() {
		return module;
	}

	public void setModule(ModuleDTO module) {
		this.module = module;
	}

	public String getIdMod() {
		return idMod;
	}

	public void setIdMod(String idMod) {
		this.idMod = idMod;
	}

	public void setModuleFieldList(List moduleFieldList) {
		this.moduleFieldList = moduleFieldList;
	}

	public List getModuleFieldList() {
		return moduleFieldList;
	}

	public int getModuleFieldListSize() {
		if (moduleFieldList != null)
			return moduleFieldList.size();
		else
			return 0;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
}
