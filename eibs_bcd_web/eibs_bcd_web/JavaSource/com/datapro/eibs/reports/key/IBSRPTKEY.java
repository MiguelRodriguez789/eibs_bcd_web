/*
 * Created on Jul 13, 2010
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.datapro.eibs.reports.key;

import com.datapro.eibs.access.KeySuper;

/**
 * @author fhernandez
 */
public class IBSRPTKEY extends KeySuper {

	private String IBSRPN;
	private String IBSLIF;

	public String getIBSRPN() {
		return IBSRPN;
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
	
	
}
