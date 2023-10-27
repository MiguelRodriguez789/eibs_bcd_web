package com.datapro.eibs.images.vo;

import java.math.BigDecimal;

import com.datapro.eibs.access.VOSuper;

public class IFSFILES extends VOSuper {
	
	private String FNAME = "";
	private String FUSERID = "";
	private String FREFER = "";
	private BigDecimal FSEQ = null;
	private BigDecimal FYEAR = null;
	private BigDecimal FMONTH = null;
	private BigDecimal FDAY = null;
	private String FEXT = "";
	private String FTYPE = "";
	private char[] TXTFILE = null;
	private byte[] BINFILE = null;
	
	public byte[] getBINFILE() {
		return BINFILE;
	}
	public void setBINFILE(byte[] binfile) {
		BINFILE = binfile;
	}
	public BigDecimal getFDAY() {
		return FDAY;
	}
	public void setFDAY(BigDecimal fday) {
		FDAY = fday;
	}
	public BigDecimal getFMONTH() {
		return FMONTH;
	}
	public void setFMONTH(BigDecimal fmonth) {
		FMONTH = fmonth;
	}
	public String getFNAME() {
		return FNAME;
	}
	public void setFNAME(String fname) {
		FNAME = fname;
	}
	public String getFREFER() {
		return FREFER;
	}
	public void setFREFER(String frefer) {
		FREFER = frefer;
	}
	public String getFTYPE() {
		return FTYPE;
	}
	public void setFTYPE(String ftype) {
		FTYPE = ftype;
	}
	public String getFUSERID() {
		return FUSERID;
	}
	public void setFUSERID(String fuserid) {
		FUSERID = fuserid;
	}
	public BigDecimal getFYEAR() {
		return FYEAR;
	}
	public void setFYEAR(BigDecimal fyear) {
		FYEAR = fyear;
	}
	public char[] getTXTFILE() {
		return TXTFILE;
	}
	public void setTXTFILE(char[] txtfile) {
		TXTFILE = txtfile;
	}
	public String getFEXT() {
		return FEXT;
	}
	public void setFEXT(String fext) {
		FEXT = fext;
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
