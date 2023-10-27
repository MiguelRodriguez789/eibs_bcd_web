/*
 * Created on Jan 20, 2009
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.datapro.eibs.images.key;

import com.datapro.eibs.access.KeySuper;



/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class SCANCHECKKEYView extends KeySuper {
	
	private String ACCOUNT = "";
	private String SERIE = "";
	
	public String getACCOUNT() {
		return ACCOUNT;
	}
	public void setACCOUNT(String account) {
		ACCOUNT = account;
	}
	public String getSERIE() {
		return SERIE;
	}
	public void setSERIE(String serie) {
		SERIE = serie;
	}
	 
}
