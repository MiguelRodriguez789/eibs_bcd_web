package com.datapro.eibs.reporter.model;

import java.util.List;


public class DBTableDTO {

	private String TABLE_CAT;
	private String TABLE_SCHEM;
	private String TABLE_NAME;
	private String TABLE_TYPE;
	private String REMARKS;
	private String TYPE_NAME;
	private String SELF_REFERENCING_COL_NAME;
	private String REF_GENERATION;

	private List columnList; //<DBColumnDTO>
	
	public String getTABLE_CAT() {
		return TABLE_CAT;
	}
	public void setTABLE_CAT(String tABLE_CAT) {
		TABLE_CAT = tABLE_CAT;
	}
	public String getTABLE_SCHEM() {
		return TABLE_SCHEM;
	}
	public void setTABLE_SCHEM(String tABLE_SCHEM) {
		TABLE_SCHEM = tABLE_SCHEM;
	}
	public String getTABLE_NAME() {
		return TABLE_NAME;
	}
	public void setTABLE_NAME(String tABLE_NAME) {
		TABLE_NAME = tABLE_NAME;
	}
	public String getTABLE_TYPE() {
		return TABLE_TYPE;
	}
	public void setTABLE_TYPE(String tABLE_TYPE) {
		TABLE_TYPE = tABLE_TYPE;
	}
	public String getREMARKS() {
		return REMARKS;
	}
	public void setREMARKS(String rEMARKS) {
		REMARKS = rEMARKS;
	}
	public String getTYPE_NAME() {
		return TYPE_NAME;
	}
	public void setTYPE_NAME(String tYPE_NAME) {
		TYPE_NAME = tYPE_NAME;
	}
	public String getSELF_REFERENCING_COL_NAME() {
		return SELF_REFERENCING_COL_NAME;
	}
	public void setSELF_REFERENCING_COL_NAME(String sELF_REFERENCING_COL_NAME) {
		SELF_REFERENCING_COL_NAME = sELF_REFERENCING_COL_NAME;
	}
	public String getREF_GENERATION() {
		return REF_GENERATION;
	}
	public void setREF_GENERATION(String rEF_GENERATION) {
		REF_GENERATION = rEF_GENERATION;
	}
	public List getColumnList() {
		return columnList;
	}
	public void setColumnList(List columnList) {
		this.columnList = columnList;
	}
	
}
