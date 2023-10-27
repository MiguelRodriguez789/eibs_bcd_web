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
public class SCNDOCTBLMD extends MDSuper {

	static {
		MetaDataRef = new SCNDOCTBLMD();
	}

	public Integer getTBLTYP() {
		return new Integer(2);
	}
	
	public Integer getTBLTBN() {
		return new Integer(2);
	}
	
	public Integer getTBLDTY() {
		return new Integer(2);
	}
	
	public Integer getTBLLMU() {
		return new Integer(10);
	}
	
	
	/* (non-Javadoc)
	 * @see com.datapro.access.MetaData#getOrderBy()
	 */
	public String getOrderBy() {
		// TODO Auto-generated method stub
		return null;
	}

}
