/*
 * Created on Jan 20, 2009
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.datapro.eibs.images.key;

import com.datapro.eibs.access.KeySuper;


/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class ATVCHECKKEY extends KeySuper {

	private String SCANDATE = "";
	private String DOCTYPECODE = "";
	private String SEQUENCEITEM = "";
	
	public String getDOCTYPECODE() {
		return DOCTYPECODE;
	}
	
	public void setDOCTYPECODE(String doctypecode) {
		DOCTYPECODE = doctypecode;
	}
	
	public String getSCANDATE() {
		return SCANDATE;
	}
	
	public void setSCANDATE(String scandate) {
		SCANDATE = scandate;
	}

	public String getSEQUENCEITEM() {
		return SEQUENCEITEM;
	}

	public void setSEQUENCEITEM(String sequenceitem) {
		SEQUENCEITEM = sequenceitem;
	}

}
