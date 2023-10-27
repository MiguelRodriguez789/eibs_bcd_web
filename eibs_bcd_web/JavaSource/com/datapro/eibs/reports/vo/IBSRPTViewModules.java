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
public class IBSRPTViewModules extends VOSuper implements Comparable {

	private String IBSMOD = BLANK;
	
	private String IBSDSC = BLANK;

	public String getIBSMOD() {
		return IBSMOD.trim().toUpperCase();
	}
	public void setIBSMOD(String ibsmod) {
		IBSMOD = ibsmod;
	}
 
	public String getIBSDSC() {
		return IBSDSC.trim();
	}
	public void setIBSDSC(String ibsdsc) {
		IBSDSC = ibsdsc;
	}
	public int compareTo(Object o) {
		return this.getIBSDSC().compareTo(((IBSRPTViewModules) o).getIBSDSC());
	}
}
