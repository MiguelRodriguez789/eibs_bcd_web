package com.datapro.eibs.images.md;

import com.datapro.eibs.access.MDSuper;

public class ATVCHECKMDViewImage extends MDSuper {

	static {
		MetaDataRef = new ATVCHECKMDViewImage();
	}

	public Integer getACCOUNT() {
		return new Integer(18);
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
