package com.datapro.eibs.security.vo;

import com.datapro.eibs.access.VOSuper;

/**
 * @author erodriguez
 */
public class WEBCOViewTreeByUser extends VOSuper {

	private String BTHUSR = BLANK;
	private String CMOSID = BLANK;
	private String CMODEN = BLANK;
	private String CMOLIF = BLANK;
	private String CMONDS = BLANK;
	private String CMOSTS = BLANK;
	private String CMORWS = BLANK;
	
	public String getCMOSID() {
		return CMOSID;
	}
	public void setCMOSID(String cmosid) {
		CMOSID = cmosid;
	}
	public String getCMODEN() {
		return CMODEN;
	}
	public void setCMODEN(String cmoden) {
		CMODEN = cmoden;
	}
	public String getCMOLIF() {
		return CMOLIF;
	}
	public void setCMOLIF(String cmolif) {
		CMOLIF = cmolif;
	}
	public String getCMONDS() {
		return CMONDS;
	}
	public void setCMONDS(String cmonds) {
		CMONDS = cmonds;
	}
	public String getCMOSTS() {
		return CMOSTS;
	}
	public void setCMOSTS(String cmosts) {
		CMOSTS = cmosts;
	}
	public String getCMORWS() {
		return CMORWS;
	}
	public void setCMORWS(String cmorws) {
		CMORWS = cmorws;
	}
	public String getBTHUSR() {
		return BTHUSR;
	}
	public void setBTHUSR(String bthusr) {
		BTHUSR = bthusr;
	}
	
}
