package com.datapro.eibs.reporter.model;

public class DBColumnDTO {

	private String TABLE_NAME;
	private String COLUMN_NAME;
	private int DATA_TYPE;
	private String TYPE_NAME;
	private int COLUMN_SIZE;
	private String REMARKS;
	
	public String getTABLE_NAME() {
		return TABLE_NAME;
	}
	public void setTABLE_NAME(String tABLE_NAME) {
		TABLE_NAME = tABLE_NAME;
	}
	public String getCOLUMN_NAME() {
		return COLUMN_NAME;
	}
	public void setCOLUMN_NAME(String cOLUMN_NAME) {
		COLUMN_NAME = cOLUMN_NAME;
	}
	public int getDATA_TYPE() {
		return DATA_TYPE;
	}
	public void setDATA_TYPE(int dATA_TYPE) {
		DATA_TYPE = dATA_TYPE;
	}
	public String getTYPE_NAME() {
		return TYPE_NAME;
	}
	public void setTYPE_NAME(String tYPE_NAME) {
		TYPE_NAME = tYPE_NAME;
	}
	public int getCOLUMN_SIZE() {
		return COLUMN_SIZE;
	}
	public void setCOLUMN_SIZE(int cOLUMN_SIZE) {
		COLUMN_SIZE = cOLUMN_SIZE;
	}
	public String getREMARKS() {
		return REMARKS;
	}
	public void setREMARKS(String rEMARKS) {
		REMARKS = rEMARKS;
	}
	
	
}
