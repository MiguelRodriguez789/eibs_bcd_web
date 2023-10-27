/*
 * Created on Jul 13, 2010
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.datapro.eibs.reports.vo;

import java.math.BigDecimal;
import java.sql.Timestamp;

import com.datapro.eibs.access.VOSuper;

/**
 * @author fhernandez
 */
public class IBSRPT extends VOSuper {

	 private String IBSRPN = BLANK;
	 private String IBSLIF = BLANK;
	 private String IBSDSC = BLANK;
	 private String IBSMOD = BLANK;
	 private String IBSPER = BLANK;
	 private String IBSPRG = BLANK;
	 private String IBSPRM = BLANK;
	 private BigDecimal IBSLMM = ZERO;
	 private BigDecimal IBSLMD = ZERO;
	 private BigDecimal IBSLMY = ZERO;
	 private Timestamp IBSLMT = null;
	 private String IBSLMU = BLANK;
	public String getIBSRPN() {
		return IBSRPN;
	}
	public void setIBSRPN(String ibsrpn) {
		IBSRPN = ibsrpn;
	}
	public String getIBSLIF() {
		return IBSLIF;
	}
	public void setIBSLIF(String ibslif) {
		IBSLIF = ibslif;
	}
	public String getIBSDSC() {
		return IBSDSC;
	}
	public void setIBSDSC(String ibsdsc) {
		IBSDSC = ibsdsc;
	}
	public String getIBSMOD() {
		return IBSMOD;
	}
	public void setIBSMOD(String ibsmod) {
		IBSMOD = ibsmod;
	}
	public String getIBSPER() {
		return IBSPER;
	}
	public void setIBSPER(String ibsper) {
		IBSPER = ibsper;
	}
	public String getIBSPRG() {
		return IBSPRG;
	}
	public void setIBSPRG(String ibsprg) {
		IBSPRG = ibsprg;
	}
	public String getIBSPRM() {
		return IBSPRM;
	}
	public void setIBSPRM(String ibsprm) {
		IBSPRM = ibsprm;
	}
	public BigDecimal getIBSLMM() {
		return IBSLMM;
	}
	public void setIBSLMM(BigDecimal ibslmm) {
		IBSLMM = ibslmm;
	}
	public BigDecimal getIBSLMD() {
		return IBSLMD;
	}
	public void setIBSLMD(BigDecimal ibslmd) {
		IBSLMD = ibslmd;
	}
	public BigDecimal getIBSLMY() {
		return IBSLMY;
	}
	public void setIBSLMY(BigDecimal ibslmy) {
		IBSLMY = ibslmy;
	}
	public Timestamp getIBSLMT() {
		return IBSLMT;
	}
	public void setIBSLMT(Timestamp ibslmt) {
		IBSLMT = ibslmt;
	}
	public String getIBSLMU() {
		return IBSLMU;
	}
	public void setIBSLMU(String ibslmu) {
		IBSLMU = ibslmu;
	}	 
	 
}
