package com.datapro.eibs.images.md;

import com.datapro.eibs.access.MDSuper;

public class SCANCHECKMD extends MDSuper {

	static {
		MetaDataRef = new SCANCHECKMD();
	}
	
	public Integer getBANK() {
		return new Integer(4);
	}
	
	public Integer getUSERID() {
		return new Integer(10);
	}
	
	public Integer getSEQ() {
		return new Integer(6);
	}
	
	public Integer getSCANDATE() {
		return new Integer(8);
	}
	
	public Integer getABA() {
		return new Integer(12);
	}
	
	public Integer getACCOUNT() {
		return new Integer(20);
	}
	
	public Integer getSERIE() {
		return new Integer(16);
	}
	
}
