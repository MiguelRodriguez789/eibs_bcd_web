/*
 * Created on Jul 13, 2010
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.datapro.eibs.reports.vo;

import com.datapro.eibs.access.VOSuper;

/**
 * @author fhernandez
 */
public class IBSRPTExtByModule extends VOSuper {

	 private String IBSRPN = BLANK;
	 private String IBSLIF = BLANK;
	 private String IBSDSC = BLANK;
	 private String IBSMOD = BLANK;
	 private String IBSPER = BLANK;
	 private String IBSPRG = BLANK;
	 private String IBSPRM = BLANK;
	public String getIBSRPN() {
		return IBSRPN.trim().toUpperCase();
	}
	public void setIBSRPN(String ibsrpn) {
		IBSRPN = ibsrpn;
	}
	public String getIBSLIF() {
		return IBSLIF;
	}
	public void setIBSLIF(String ibslif) {
		IBSLIF = ibslif;
	}
	public String getIBSDSC() {
		return IBSDSC.trim();
	}
	public void setIBSDSC(String ibsdsc) {
		IBSDSC = ibsdsc;
	}
	public String getIBSMOD() {
		return IBSMOD.trim().toUpperCase();
	}
	public void setIBSMOD(String ibsmod) {
		IBSMOD = ibsmod;
	}
	public String getIBSPER() {
		return IBSPER;
	}
	public void setIBSPER(String ibsper) {
		IBSPER = ibsper;
	}
	public String getIBSPRG() {
		return IBSPRG;
	}
	public void setIBSPRG(String ibsprg) {
		IBSPRG = ibsprg;
	}
	public String getIBSPRM() {
		return IBSPRM;
	}
	public void setIBSPRM(String ibsprm) {
		IBSPRM = ibsprm;
	}


}
