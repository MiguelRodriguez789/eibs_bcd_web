package com.datapro.eibs.reporter.model;

import datapro.eibs.beans.ELEERRMessage;

public class GlbprmDTO extends DTOBeanMaster {

	private int MAXRWS;
	
	public GlbprmDTO() {
		MAXRWS = 0;
	}
	
	public int getMAXRWS() {
		return MAXRWS;
	}

	public void setMAXRWS(int mAXRWS) {
		MAXRWS = mAXRWS;
	}

	public ELEERRMessage validate() {
		error = new ELEERRMessage();
		error.setERRNUM("0");

		if (MAXRWS == 0)
			addError("401", "MAXRWS", "Ingrese un valor mayor que cero.");
	
		return error;
	}
}
