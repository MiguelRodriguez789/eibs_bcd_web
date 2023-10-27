package com.datapro.eibs.teller.vo;

import com.datapro.eibs.access.VOSuper;

public class ATSHIFTS extends VOSuper {

	private static final long serialVersionUID = 7693945985471605792L;
	
	private String CODESHIFT = BLANK;
	private String CODEBANK = BLANK;
	private String CODEBRANCH = BLANK;
	private String DESCRIPTION = BLANK;
	private String STATUS = BLANK;
	
	public String getCODESHIFT() {
		return CODESHIFT;
	}
	public void setCODESHIFT(String codeshift) {
		CODESHIFT = codeshift;
	}
	public String getCODEBANK() {
		return CODEBANK;
	}
	public void setCODEBANK(String codebank) {
		CODEBANK = codebank;
	}
	public String getCODEBRANCH() {
		return CODEBRANCH;
	}
	public void setCODEBRANCH(String codebranch) {
		CODEBRANCH = codebranch;
	}
	public String getDESCRIPTION() {
		return DESCRIPTION;
	}
	public void setDESCRIPTION(String description) {
		DESCRIPTION = description;
	}
	public String getSTATUS() {
		return STATUS;
	}
	public void setSTATUS(String status) {
		STATUS = status;
	}
	
}