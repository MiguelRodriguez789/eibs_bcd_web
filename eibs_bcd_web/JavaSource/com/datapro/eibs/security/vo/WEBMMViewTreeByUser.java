package com.datapro.eibs.security.vo;

import com.datapro.eibs.access.VOSuper;

/**
 * @author erodriguez
 */
public class WEBMMViewTreeByUser extends VOSuper {

	private String BTHUSR = BLANK;
	private String CMMSID = BLANK;
	private String CMIDEN = BLANK;
	private String CMILIF = BLANK;
	private String CMENDS = BLANK;
	private String CMIMFL = BLANK;
	private String CMISTS = BLANK;
	private String CMIRWS = BLANK;
	
	public String getBTHUSR() {
		return BTHUSR;
	}
	public void setBTHUSR(String bthusr) {
		BTHUSR = bthusr;
	}
	public String getCMIDEN() {
		return CMIDEN;
	}
	public void setCMIDEN(String cmiden) {
		CMIDEN = cmiden;
	}
	public String getCMILIF() {
		return CMILIF;
	}
	public void setCMILIF(String cmilif) {
		CMILIF = cmilif;
	}
	public String getCMENDS() {
		return CMENDS;
	}
	public void setCMENDS(String cmends) {
		CMENDS = cmends;
	}
	public String getCMIMFL() {
		return CMIMFL;
	}
	public void setCMIMFL(String cmimfl) {
		CMIMFL = cmimfl;
	}
	public String getCMISTS() {
		return CMISTS;
	}
	public void setCMISTS(String cmists) {
		CMISTS = cmists;
	}
	public String getCMIRWS() {
		return CMIRWS;
	}
	public void setCMIRWS(String cmirws) {
		CMIRWS = cmirws;
	}
	public String getCMMSID() {
		return CMMSID;
	}
	public void setCMMSID(String cmmsid) {
		CMMSID = cmmsid;
	}
	
}
