package datapro.eibs.beans;


public class DWHUSERSExtBasic {
	
	private String USERID;
	private String USERNAME;
	private String DWHROLE;
	private String CODEBANK;

	public String getCODEBANK() {
		return CODEBANK;
	}
	public void setCODEBANK(String codebank) {
		CODEBANK = codebank;
	}
	public String getDWHROLE() {
		return DWHROLE;
	}
	public void setDWHROLE(String dwhrole) {
		DWHROLE = dwhrole;
	}

	public String getUSERID() {
		return USERID;
	}
	public void setUSERID(String userid) {
		USERID = userid;
	}
	public String getUSERNAME() {
		return USERNAME;
	}
	public void setUSERNAME(String username) {
		USERNAME = username;
	}
	

}