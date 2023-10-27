/*
 * Created on Jul 13, 2010
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.datapro.eibs.reports.md;

import com.datapro.eibs.access.MDSuper;

/**
 * @author fhernandez
 */
public class IBSRPTMD extends MDSuper {

	private static final long serialVersionUID = 1256355057416093255L;

	public String getOrderBy(){
		return " IBSRPN "; 
	}
}
