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
public class ATVCHECK2KEY extends KeySuper {

	private String SCANDATE = null;
	private String CODEBANK = null;
	private String CODEBRANCH = null;
	private String USERIDPOD = null;
	private String SEQUENCEITEM = null;
	
	public String getSCANDATE() {
		return SCANDATE;
	}
	
	public void setSCANDATE(String scandate) {
		SCANDATE = scandate;
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

	public String getUSERIDPOD() {
		return USERIDPOD;
	}

	public void setUSERIDPOD(String useridpod) {
		USERIDPOD = useridpod;
	}

	public String getSEQUENCEITEM() {
		return SEQUENCEITEM;
	}

	public void setSEQUENCEITEM(String sequenceitem) {
		SEQUENCEITEM = sequenceitem;
	}

}
