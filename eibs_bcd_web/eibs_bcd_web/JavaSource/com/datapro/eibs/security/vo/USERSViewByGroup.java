package com.datapro.eibs.security.vo;

import com.datapro.eibs.access.VOSuper;

public class USERSViewByGroup extends VOSuper {
	
	private String USESTA = BLANK;
	private String USEUID = BLANK;
	private String USEMNM = BLANK;
	private String USEOPT = BLANK;
	private String USECLS = BLANK;
	
	public String getUSESTA() {
		return USESTA;
	}
	public void setUSESTA(String usesta) {
		USESTA = usesta;
	}
	public String getUSEUID() {
		return USEUID;
	}
	public void setUSEUID(String useuid) {
		USEUID = useuid;
	}
	public String getUSEMNM() {
		return USEMNM;
	}
	public void setUSEMNM(String usemnm) {
		USEMNM = usemnm;
	}
	public String getUSEOPT() {
		return USEOPT;
	}
	public void setUSEOPT(String useopt) {
		USEOPT = useopt;
	}
	public String getUSECLS() {
		return USECLS;
	}
	public void setUSECLS(String usecls) {
		USECLS = usecls;
	}
	
}
