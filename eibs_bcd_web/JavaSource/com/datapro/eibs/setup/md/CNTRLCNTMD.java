/*
 * Created on Jul 13, 2010
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.datapro.eibs.setup.md;

import com.datapro.eibs.access.MDSuper;

/**
 * @author fhernandez
 */
public class CNTRLCNTMD extends MDSuper {

	public String getOrderBy(){
		return " CNTBNK "; 
	}
	
	public Integer getCNTBNK() {
		return new Integer(2);
	}
}
