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
public class ATVCHECKMD extends MDSuper {

	static {
		MetaDataRef = new ATVCHECKMD();
	}

	public Integer getSCANDATE() {
		return new Integer(8);
	}
	
	public Integer getDOCTYPECODE() {
		return new Integer(4);
	}
	
	public Integer getCHECKNUM() {
		return new Integer(16);
	}
	
	/* (non-Javadoc)
	 * @see com.datapro.access.MetaData#getOrderBy()
	 */
	public String getOrderBy() {
		// TODO Auto-generated method stub
		return null;
	}

}
