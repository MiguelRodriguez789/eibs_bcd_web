package com.datapro.eibs.images.md;

import com.datapro.eibs.access.MDSuper;

public class IFSFILESMD extends MDSuper {

	static {
		MetaDataRef = new IFSFILESMD();
	}

	public Integer getFNAME() {
		return new Integer(10);
	}
	
	public Integer getFUSERID() {
		return new Integer(10);
	}
	
	public Integer getFREFER() {
		return new Integer(6);
	}
	
}
