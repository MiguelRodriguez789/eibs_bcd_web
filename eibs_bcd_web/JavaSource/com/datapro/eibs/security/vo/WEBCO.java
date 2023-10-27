/*
 * Created on Jul 13, 2010
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.datapro.eibs.security.vo;

import java.math.BigDecimal;

import com.datapro.eibs.access.VOSuper;

/**
 * @author fhernandez
 */
public class WEBCO extends VOSuper {

	private String CMOSID = BLANK;
	private String CMODEN = BLANK;
	private String CMOSEQ = BLANK;
	private String CMOLIF = BLANK;
	private BigDecimal CMOINL = ZERO;
	private String CMONDS = BLANK;
	private String CMOMFL = BLANK;
	private String CMOGAD = BLANK;
	private String CMOGPO = BLANK;
	private String CMOCDE = BLANK;
	
	
	/**
	 * @return
	 */
	public String getCMOMFL() {
		return CMOMFL.trim();
	}

	/**
	 * @return
	 */
	public String getCMOCDE() {
		return CMOCDE.trim();
	}

	/**
	 * @return
	 */
	public String getCMODEN() {
		return CMODEN.trim();
	}

	/**
	 * @return
	 */
	public String getCMOGAD() {
		return CMOGAD.trim();
	}

	/**
	 * @return
	 */
	public String getCMOGPO() {
		return CMOGPO.trim();
	}

	/**
	 * @return
	 */
	public BigDecimal getCMOINL() {
		return CMOINL;
	}

	/**
	 * @return
	 */
	public String getCMOLIF() {
		return CMOLIF;
	}

	/**
	 * @return
	 */
	public String getCMONDS() {
		return CMONDS.length() > 35 ? CMONDS.substring(0, 35).trim() 
				: CMONDS.trim();
	}

	/**
	 * @return
	 */
	public String getCMOSEQ() {
		return CMOSEQ.trim();
	}

	/**
	 * @return
	 */
	public String getCMOSID() {
		return CMOSID.trim();
	}

	/**
	 * @param string
	 */
	public void setCMOMFL(String string) {
		CMOMFL = string;
	}

	/**
	 * @param string
	 */
	public void setCMOCDE(String string) {
		CMOCDE = string;
	}

	/**
	 * @param string
	 */
	public void setCMODEN(String string) {
		CMODEN = string;
	}

	/**
	 * @param string
	 */
	public void setCMOGAD(String string) {
		CMOGAD = string;
	}

	/**
	 * @param string
	 */
	public void setCMOGPO(String string) {
		CMOGPO = string;
	}

	/**
	 * @param decimal
	 */
	public void setCMOINL(BigDecimal decimal) {
		CMOINL = decimal;
	}

	/**
	 * @param string
	 */
	public void setCMOLIF(String string) {
		CMOLIF = string;
	}

	/**
	 * @param string
	 */
	public void setCMONDS(String string) {
		CMONDS = string;
	}

	/**
	 * @param string
	 */
	public void setCMOSEQ(String string) {
		CMOSEQ = string;
	}

	/**
	 * @param string
	 */
	public void setCMOSID(String string) {
		CMOSID = string;
	}

}
