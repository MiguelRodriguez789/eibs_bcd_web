package com.datapro.eibs.security.bean;

//import com.datapro.eibs.security.access.jdbc.bean.CNTRLDBA;
import com.datapro.eibs.security.bean.CNTRLDBA;
/**
 * @author ogarcia
 *
 */
public class CNTRLDBANME extends CNTRLDBA {

	protected String BRNNME = "";
	
	/**
	 * Returns the BRNNME.
	 * @return String
	 */
	public String getBRNNME() {
		return BRNNME;
	}

	/**
	 * Sets the BRNNME.
	 * @param BRNNME The BRNNME to set
	 */
	public void setBRNNME(String BRNNME) {
		this.BRNNME = BRNNME;
	}

}
