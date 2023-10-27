package com.datapro.eibs.reporter.forms;

import com.datapro.eibs.reporter.model.DTOBeanMaster;

import datapro.eibs.beans.ELEERRMessage;

public class LRGA30001 extends DTOBeanMaster {

	private String fromUser;
	private String toUser;
	private int reassigned;

	public String getFromUser() {
		return fromUser;
	}

	public void setFromUser(String fromUser) {
		this.fromUser = fromUser;
	}

	public String getToUser() {
		return toUser;
	}

	public void setToUser(String toUser) {
		this.toUser = toUser;
	}

	public int getReassigned() {
		return reassigned;
	}

	public void setReassigned(int reassigned) {
		this.reassigned = reassigned;
	}

	public ELEERRMessage validate() {
		error = new ELEERRMessage();
		error.setERRNUM("0");
		if (fromUser.trim().length() == 0)
			addError("301", "fromUser",
					"El campo De usuario necesita un valor válido");
		if (toUser.trim().length() == 0)
			addError("302", "toUser",
					"El campo A usuario necesita un valor válido");
		return error;
	}

}
