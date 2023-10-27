package com.datapro.eibs.teller.key;

import com.datapro.eibs.access.KeySuper;

import datapro.eibs.master.Util;

public class ATSHIFTSKEY extends KeySuper {

	private static final long serialVersionUID = -5887726623609770248L;

	private String CODESHIFT = null;
	
	private String CODEBANK = null;
	
	private String CODEBRANCH = null;

	public String getCODESHIFT() {
		return CODESHIFT;
	}

	public void setCODESHIFT(String codeshift) {
		CODESHIFT = codeshift;
	}

	public String getCODEBANK() {
		return CODEBANK != null ? Util.addLeftChar('0', 4, CODEBANK.trim()) : null;
	}

	public void setCODEBANK(String codebank) {
		CODEBANK = codebank;
	}

	public String getCODEBRANCH() {
		return CODEBRANCH != null ? Util.addLeftChar('0', 4, CODEBRANCH.trim()) : null;
	}

	public void setCODEBRANCH(String codebranch) {
		CODEBRANCH = codebranch;
	}
	
	

	
}