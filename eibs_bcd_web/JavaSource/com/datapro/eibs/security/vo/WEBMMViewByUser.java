/*
 * Created on Jul 13, 2010
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.datapro.eibs.security.vo;

import com.datapro.eibs.access.VOSuper;

/**
 * @author erodriguez
 */
public class WEBMMViewByUser extends VOSuper {

	private String ESSUSR = BLANK;
	private String ESSTYP = BLANK;
	private String ESSSID = BLANK;
	private String ESSIDE = BLANK;
	private String ESSDSC = BLANK;
	private String ESSIMG = BLANK;
	private String ESSTAD = BLANK;
	private String ESSTPO = BLANK;
	
	public String getESSUSR() {
		return ESSUSR;
	}
	public void setESSUSR(String essusr) {
		ESSUSR = essusr;
	}
	public String getESSTYP() {
		return ESSTYP.trim();
	}
	public void setESSTYP(String esstyp) {
		ESSTYP = esstyp;
	}
	public String getESSSID() {
		return ESSSID.trim();
	}
	public void setESSSID(String esssid) {
		ESSSID = esssid;
	}
	public String getESSIDE() {
		return ESSIDE.trim();
	}
	public void setESSIDE(String esside) {
		ESSIDE = esside;
	}
	public String getESSDSC() {
		return ESSDSC.trim();
	}
	public void setESSDSC(String essdsc) {
		ESSDSC = essdsc;
	}
	public String getESSIMG() {
		return ESSIMG.trim();
	}
	public void setESSIMG(String essimg) {
		ESSIMG = essimg;
	}
	public String getESSTAD() {
		return ESSTAD.trim();
	}
	public void setESSTAD(String esstad) {
		ESSTAD = esstad;
	}
	public String getESSTPO() {
		return ESSTPO.trim();
	}
	public void setESSTPO(String esstpo) {
		ESSTPO = esstpo;
	}
	
}
