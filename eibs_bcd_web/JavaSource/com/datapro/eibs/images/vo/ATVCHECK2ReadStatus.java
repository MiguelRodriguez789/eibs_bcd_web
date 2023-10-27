package com.datapro.eibs.images.vo;

import com.datapro.eibs.access.VOSuper;

public class ATVCHECK2ReadStatus extends VOSuper {
	
	private String SCANDATE = "";
	private String CODEBANK = "";
	private String CODEBRANCH = "";
	private String USERIDPOD = "";
	private String SEQUENCEITEM = "";
	private String CAMARA = "";

	public String getCAMARA() {
		return CAMARA;
	}

	public void setCAMARA(String camara) {
		CAMARA = camara;
	}

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
