package com.datapro.eibs.images.md;

import com.datapro.eibs.access.MDSuper;

public class ATVCHECKMDViewCamara extends MDSuper {

	static {
		MetaDataRef = new ATVCHECKMDViewCamara();
	}

	public Integer getSCANDATE() {
		return new Integer(8);
	}
	
	/* (non-Javadoc)
	 * @see com.datapro.access.MetaData#getOrderBy()
	 */
	public String getOrderBy() {
		// TODO Auto-generated method stub
		return null;
	}

}
