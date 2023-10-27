package com.datapro.eibs.teller.vo;

import com.datapro.eibs.access.VOSuper;

public class ATPARAMETERS extends VOSuper {

	private static final long serialVersionUID = -6130838529803508224L;
	
	private String ATCODEPARAM = BLANK;
	private String ATCODEITEMPARAM = BLANK;
	private String ATVALPARAM1 = BLANK;
	private String ATVALPARAM2 = BLANK;
	
	public String getATCODEPARAM() {
		return ATCODEPARAM;
	}
	public void setATCODEPARAM(String atcodeparam) {
		ATCODEPARAM = atcodeparam;
	}
	public String getATCODEITEMPARAM() {
		return ATCODEITEMPARAM;
	}
	public void setATCODEITEMPARAM(String atcodeitemparam) {
		ATCODEITEMPARAM = atcodeitemparam;
	}
	public String getATVALPARAM1() {
		return ATVALPARAM1;
	}
	public void setATVALPARAM1(String atvalparam1) {
		ATVALPARAM1 = atvalparam1;
	}
	public String getATVALPARAM2() {
		return ATVALPARAM2;
	}
	public void setATVALPARAM2(String atvalparam2) {
		ATVALPARAM2 = atvalparam2;
	}
	
}