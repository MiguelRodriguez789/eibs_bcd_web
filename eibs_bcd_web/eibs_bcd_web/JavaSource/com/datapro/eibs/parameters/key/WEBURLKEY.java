/*
 * Created on Jul 13, 2014
 *
 */
package com.datapro.eibs.parameters.key;

import com.datapro.eibs.access.KeySuper;

public class WEBURLKEY extends KeySuper {

	private String ID;
	private String URL;
	
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getURL() {
		return URL;
	}
	public void setURL(String uRL) {
		URL = uRL;
	}
}
