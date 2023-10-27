/*
 * Created on Mar 27, 2009
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package datapro.eibs.beans;

import java.math.BigDecimal;

/**
 * @author fhernandez
 *
 */
public class JBImageDetail {
	// Record Type
	String RECORDTYPE;
	// Number
	String NUMBER;
	// Reference
	String REFERENCE;
	// Table 
	String TABLE;
	// Sequence 
	BigDecimal SEQUENCE;
	
	public String getRECORDTYPE() {
		return RECORDTYPE;
	}
	public void setRECORDTYPE(String type) {
		RECORDTYPE = type;
	}
	public String getNUMBER() {
		return NUMBER;
	}
	public void setNUMBER(String number) {
		NUMBER = number;
	}
	public String getREFERENCE() {
		return REFERENCE;
	}
	public void setREFERENCE(String reference) {
		REFERENCE = reference;
	}
	public String getTABLE() {
		return TABLE;
	}
	public void setTABLE(String table) {
		TABLE = table;
	}
	public BigDecimal getSEQUENCE() {
		return SEQUENCE;
	}
	public void setSEQUENCE(BigDecimal sequence) {
		SEQUENCE = sequence;
	}


}
