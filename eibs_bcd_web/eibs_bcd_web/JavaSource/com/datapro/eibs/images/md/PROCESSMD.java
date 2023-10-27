/*
 * Created on Jan 20, 2009
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.datapro.eibs.images.md;

import com.datapro.eibs.access.MDSuper;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class PROCESSMD extends MDSuper {

	static {
		MetaDataRef = new PROCESSMD();
	}

	public Integer getPROUID() {
		return new Integer(20);
	}
	
	/* (non-Javadoc)
	 * @see com.datapro.access.MetaData#getOrderBy()
	 */
	public String getOrderBy() {
		// TODO Auto-generated method stub
		return null;
	}

}
