/*
 * Created on Jul 13, 2010
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.datapro.eibs.parameters.md;

import com.datapro.eibs.access.MDSuper;

/**
 * @author fhernandez
 */
public class CNOFTMD extends MDSuper {

	public String getOrderBy(){
		return " CNOTCN, CNODCN "; 
	}
}
