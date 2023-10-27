package datapro.eibs.reports;



/**
 * Insert the type's description here.
 * Creation date: (10/24/2001 11:32:05 AM)
 * @author: fhernandez
 */
public class ReportsHeader {
	
	private boolean history;
	private boolean reprocess;
	private String EDPFLG = null;
	private String EDPRPN = null;
	private String IBSDSC = null;
	private String IBSMOD = null;
	private String IBSPER = null;
	
	private String FROMDTY = "";
	private String FROMDTM = "";
	private String FROMDTD = "";
	
	private String TODTY = "";
	private String TODTM = "";
	private String TODTD = "";
	
	public boolean isHistory() {
		return history;
	}
	public void setHistory(boolean isHistory) {
		this.history = isHistory;
	}
	public boolean isReprocess() {
		return reprocess;
	}
	public void setReprocess(boolean isReprocess) {
		this.reprocess = isReprocess;
	}
	public String getEDPFLG() {
		return EDPFLG;
	}
	public void setEDPFLG(String edpflg) {
		EDPFLG = edpflg == null || edpflg.equals("") ? null : edpflg;
	}
	public String getEDPRPN() {
		return EDPRPN;
	}
	public void setEDPRPN(String edprpn) {
		EDPRPN = edprpn;
	}
	public String getIBSDSC() {
		return IBSDSC;
	}
	public void setIBSDSC(String ibsdsc) {
		IBSDSC = ibsdsc;
	}
	public String getIBSMOD() {
		return IBSMOD;
	}
	public void setIBSMOD(String ibsmod) {
		IBSMOD = ibsmod;
	}
	public String getIBSPER() {
		return IBSPER;
	}
	public void setIBSPER(String ibsper) {
		IBSPER = ibsper;
	}
	public String getFROMDTY() {
		return FROMDTY;
	}
	public void setFROMDTY(String fromdty) {
		FROMDTY = fromdty;
	}
	public String getFROMDTM() {
		return FROMDTM;
	}
	public void setFROMDTM(String fromdtm) {
		FROMDTM = fromdtm;
	}
	public String getFROMDTD() {
		return FROMDTD;
	}
	public void setFROMDTD(String fromdtd) {
		FROMDTD = fromdtd;
	}
	public String getTODTY() {
		return TODTY;
	}
	public void setTODTY(String todty) {
		TODTY = todty;
	}
	public String getTODTM() {
		return TODTM;
	}
	public void setTODTM(String todtm) {
		TODTM = todtm;
	}
	public String getTODTD() {
		return TODTD;
	}
	public void setTODTD(String todtd) {
		TODTD = todtd;
	}
	

}