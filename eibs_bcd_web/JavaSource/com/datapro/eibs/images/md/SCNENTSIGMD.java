package com.datapro.eibs.images.md;

import com.datapro.eibs.access.MDSuper;

public class SCNENTSIGMD extends MDSuper {

	static {
		MetaDataRef = new SCNENTSIGMD();
	}

	public Integer getENTTYP() {
		return new Integer(2);
	}
	
	public Integer getENTLMU() {
		return new Integer(10);
	}
	
}
