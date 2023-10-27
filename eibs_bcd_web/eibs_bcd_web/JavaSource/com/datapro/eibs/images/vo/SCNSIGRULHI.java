package com.datapro.eibs.images.vo;

import java.math.BigDecimal;

import com.datapro.eibs.access.VOSuper;

public class SCNSIGRULHI extends VOSuper {

	/**
	 * 
	 */
	private static final long serialVersionUID = -657395825106982182L;
	
	private BigDecimal ACCUID = null;
	private String SIGRULE = "";
	private String CCYCODE = "";
	private BigDecimal AMOUNT = null;
	private BigDecimal DAYFROM = null;
	private BigDecimal MONTHFROM = null;
	private BigDecimal YEARFROM = null;
	private BigDecimal DAYTO = null;
	private BigDecimal MONTHTO = null;
	private BigDecimal YEARTO = null;
	private String STATUS = "";
	private String BRANCH = "";
	private BigDecimal DOCNUM = null;
	private String MODAPPROVED = "";
	private String TYPEMAINT = "";
	private String RULELMU = null;
	private String RULELMM = null;
	private String RULELMD = null;
	private String RULELMY = null;
	private String RULELMT = null;
	 
	public BigDecimal getACCUID() {
		return ACCUID;
	}
	public void setACCUID(BigDecimal accuid) {
		ACCUID = accuid;
	}
	public String getSIGRULE() {
		return SIGRULE;
	}
	public void setSIGRULE(String sigrule) {
		SIGRULE = sigrule;
	}
	public String getCCYCODE() {
		return CCYCODE;
	}
	public void setCCYCODE(String ccycode) {
		CCYCODE = ccycode;
	}
	public BigDecimal getAMOUNT() {
		return AMOUNT;
	}
	public void setAMOUNT(BigDecimal amount) {
		AMOUNT = amount;
	}
	public BigDecimal getDAYFROM() {
		return DAYFROM;
	}
	public void setDAYFROM(BigDecimal dayfrom) {
		DAYFROM = dayfrom;
	}
	public BigDecimal getMONTHFROM() {
		return MONTHFROM;
	}
	public void setMONTHFROM(BigDecimal monthfrom) {
		MONTHFROM = monthfrom;
	}
	public BigDecimal getYEARFROM() {
		return YEARFROM;
	}
	public void setYEARFROM(BigDecimal yearfrom) {
		YEARFROM = yearfrom;
	}
	public BigDecimal getDAYTO() {
		return DAYTO;
	}
	public void setDAYTO(BigDecimal dayto) {
		DAYTO = dayto;
	}
	public BigDecimal getMONTHTO() {
		return MONTHTO;
	}
	public void setMONTHTO(BigDecimal monthto) {
		MONTHTO = monthto;
	}
	public BigDecimal getYEARTO() {
		return YEARTO;
	}
	public void setYEARTO(BigDecimal yearto) {
		YEARTO = yearto;
	}
	public String getSTATUS() {
		return STATUS;
	}
	public void setSTATUS(String status) {
		STATUS = status;
	}
	public String getBRANCH() {
		return BRANCH;
	}
	public void setBRANCH(String branch) {
		BRANCH = branch;
	}
	public BigDecimal getDOCNUM() {
		return DOCNUM;
	}
	public void setDOCNUM(BigDecimal docnum) {
		DOCNUM = docnum;
	}
	public String getMODAPPROVED() {
		return MODAPPROVED;
	}
	public void setMODAPPROVED(String modapproved) {
		MODAPPROVED = modapproved;
	}
	public String getTYPEMAINT() {
		return TYPEMAINT;
	}
	public void setTYPEMAINT(String typemaint) {
		TYPEMAINT = typemaint;
	}
	public String getRULELMM() {
		return RULELMM;
	}
	public void setRULELMM(String rULELMM) {
		RULELMM = rULELMM;
	}
	public String getRULELMD() {
		return RULELMD;
	}
	public void setRULELMD(String rULELMD) {
		RULELMD = rULELMD;
	}
	public String getRULELMY() {
		return RULELMY;
	}
	public void setRULELMY(String rULELMY) {
		RULELMY = rULELMY;
	}
	public String getRULELMU() {
		return RULELMU;
	}
	public void setRULELMU(String rULELMU) {
		RULELMU = rULELMU;
	}
	public String getRULELMT() {
		return RULELMT;
	}
	public void setRULELMT(String rULELMT) {
		RULELMT = rULELMT;
	}
	
}
