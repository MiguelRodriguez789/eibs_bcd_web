package datapro.eibs.reports;



/**
 * Insert the type's description here.
 * Creation date: (10/24/2001 11:32:05 AM)
 * @author: fhernandez
 */
public class ReportsDetail implements Comparable {
	
	private String IBSRPN = null;
	private String IBSMOD = null;
	private String IBSPER = null;
	private String IBSDSC = "";
	
	public int compareTo(Object o) {
		ReportsDetail bean = (ReportsDetail)o;
		return getIBSDSC().compareToIgnoreCase(bean.getIBSDSC());
	}
	public String getIBSRPN() {
		return IBSRPN;
	}
	public void setIBSRPN(String ibsrpn) {
		IBSRPN = ibsrpn;
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
	

}