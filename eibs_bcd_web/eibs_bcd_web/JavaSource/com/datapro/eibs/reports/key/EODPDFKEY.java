/*
 * Created on Jul 13, 2010
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.datapro.eibs.reports.key;

import java.math.BigDecimal;

import com.datapro.eibs.access.KeySuper;

/**
 * @author fhernandez
 */
public class EODPDFKEY extends KeySuper {

	private String EDPRPN;
	private BigDecimal EDPDTY;
	private BigDecimal EDPDTM;
	private BigDecimal EDPDTD;
	
	public String getEDPRPN() {
		return EDPRPN;
	}
	public void setEDPRPN(String edprpn) {
		EDPRPN = edprpn;
	}
	public BigDecimal getEDPDTY() {
		return EDPDTY;
	}
	public void setEDPDTY(BigDecimal edpdty) {
		EDPDTY = edpdty;
	}
	public BigDecimal getEDPDTM() {
		return EDPDTM;
	}
	public void setEDPDTM(BigDecimal edpdtm) {
		EDPDTM = edpdtm;
	}
	public BigDecimal getEDPDTD() {
		return EDPDTD;
	}
	public void setEDPDTD(BigDecimal edpdtd) {
		EDPDTD = edpdtd;
	}

	
}
