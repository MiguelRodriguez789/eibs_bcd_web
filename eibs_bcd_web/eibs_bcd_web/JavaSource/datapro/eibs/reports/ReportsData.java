package datapro.eibs.reports;

import com.datapro.generic.tool.Util;


/**
 * Insert the type's description here.
 * Creation date: (10/24/2001 11:32:05 AM)
 * @author: fhernandez
 */
public class ReportsData {
	
	private String IBSDSC = "";
	private String EDPRPN = "";
	private String EDPPTH = "";
	private String EDPFLG = "";
	
	private String EDPDTY = "";
	private String EDPDTM = "";
	private String EDPDTD = "";
	
	public String getIBSDSC() {
		return IBSDSC;
	}
	public void setIBSDSC(String edpdsc) {
		IBSDSC = edpdsc;
	}
	public String getEDPRPN() {
		return EDPRPN;
	}
	public void setEDPRPN(String edprpn) {
		EDPRPN = edprpn;
	}
	public String getEDPPTH() {
		return EDPPTH;
	}
	public void setEDPPTH(String edppth) {
		EDPPTH = edppth;
	}
	public String getEDPFLG() {
		return EDPFLG;
	}
	public void setEDPFLG(String edpflg) {
		EDPFLG = edpflg;
	}
	public String getEDPDTY() {
		return EDPDTY;
	}
	public void setEDPDTY(String edpdty) {
		EDPDTY = edpdty;
	}
	public String getEDPDTM() {
		return EDPDTM;
	}
	public void setEDPDTM(String edpdtm) {
		EDPDTM = edpdtm;
	}
	public String getEDPDTD() {
		return EDPDTD;
	}
	public void setEDPDTD(String edpdtd) {
		EDPDTD = edpdtd;
	}
	public String getEDPEXT() {
		int extIndex = getEDPPTH().lastIndexOf(".");
		if (extIndex > -1) {
			String ext = getEDPPTH().substring(extIndex+1, getEDPPTH().length());
			return ext;
		} else {
			return "";
		}
	}
	public String getEDPBRN() {
		String[] paths = Util.split(getEDPPTH(), "_");
		if (paths.length == 3 && isBranch(paths[1])) {
			return paths[1];
		} else {
			return "";
		}
	}
	
	private boolean isBranch(String test){
		boolean rst = true;
		try{
			Integer.parseInt(test);
		}catch (NumberFormatException e){
			rst = false;
		}		
		return rst;
	}

}