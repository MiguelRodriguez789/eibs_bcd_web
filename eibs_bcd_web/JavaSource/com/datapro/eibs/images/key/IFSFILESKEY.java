package com.datapro.eibs.images.key;

import java.math.BigDecimal;

import com.datapro.eibs.access.KeySuper;

public class IFSFILESKEY extends KeySuper {

	private String FNAME = "";
	private String FUSERID = "";
	private String FREFER = "";
	private BigDecimal FSEQ = null;
	
	public String getFNAME() {
		return FNAME;
	}
	public void setFNAME(String fname) {
		FNAME = fname;
	}
	public String getFUSERID() {
		return FUSERID;
	}
	public void setFUSERID(String fuserid) {
		FUSERID = fuserid;
	}
	public String getFREFER() {
		return FREFER;
	}
	public void setFREFER(String frefer) {
		FREFER = frefer;
	}
	/**
	 * @return
	 */
	public BigDecimal getFSEQ() {
		return FSEQ;
	}

	/**
	 * @param decimal
	 */
	public void setFSEQ(BigDecimal decimal) {
		FSEQ = decimal;
	}

}
