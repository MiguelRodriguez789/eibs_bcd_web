package com.datapro.eibs.images.vo;

import java.math.BigDecimal;
import java.sql.Timestamp;

import com.datapro.eibs.access.VOSuper;

public class PROCESS extends VOSuper {

	private String PROUID = "";
	private String PRODSC = "";
	private String PRORES = "";
	private BigDecimal PRORDY = null;
	private BigDecimal PRORDM = null;
	private BigDecimal PRORDD = null;
	private String PROSTS = "";
	private String PROUSR = "";
	private Timestamp PROTMS = null;
	
	public String getPRODSC() {
		return PRODSC;
	}
	public void setPRODSC(String prodsc) {
		PRODSC = prodsc;
	}
	public BigDecimal getPRORDD() {
		return PRORDD;
	}
	public void setPRORDD(BigDecimal prordd) {
		PRORDD = prordd;
	}
	public BigDecimal getPRORDM() {
		return PRORDM;
	}
	public void setPRORDM(BigDecimal prordm) {
		PRORDM = prordm;
	}
	public BigDecimal getPRORDY() {
		return PRORDY;
	}
	public void setPRORDY(BigDecimal prordy) {
		PRORDY = prordy;
	}
	public String getPRORES() {
		return PRORES;
	}
	public void setPRORES(String prores) {
		PRORES = prores;
	}
	public String getPROSTS() {
		return PROSTS;
	}
	public void setPROSTS(String prosts) {
		PROSTS = prosts;
	}
	public Timestamp getPROTMS() {
		return PROTMS;
	}
	public void setPROTMS(Timestamp protms) {
		PROTMS = protms;
	}
	public String getPROUID() {
		return PROUID;
	}
	public void setPROUID(String prouid) {
		PROUID = prouid;
	}
	public String getPROUSR() {
		return PROUSR;
	}
	public void setPROUSR(String prousr) {
		PROUSR = prousr;
	}
	
}
