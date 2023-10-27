package datapro.eibs.products;

/**
 * Insert the type's description here.
 * Creation date: (8/31/2000 11:28:15 AM)
 * @author: Orestes Garcia
 */
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.UserPos;
import datapro.eibs.master.Util;

public class JSELD0620Redirect {
	private int option;
	private int appCode;
	HttpSession session = null;
	private String account;
	private String number;
	private String path;
	/**
	 * JOActionRedirect constructor comment.
	 */
	public JSELD0620Redirect(
		int opt,
		int app,
		String acc,
		String lp,
		HttpSession ses) {
		super();
		option = opt;
		appCode = app;
		account = acc;
		number = "0";
		session = ses;
		path = lp;
	}
	/**
	 * JOActionRedirect constructor comment.
	 */
	public JSELD0620Redirect(int app, String acc, String lp, HttpSession ses) {
		super();
		option = 1; // Account Inquiry by default
		appCode = app;
		account = acc;
		number = "0";
		session = ses;
		path = lp;
	}
	/**
	 * JOActionRedirect constructor comment.
	 */
	public JSELD0620Redirect(
		String num,
		int opt,
		int app,
		String acc,
		String lp,
		HttpSession ses) {
		super();
		option = opt;
		appCode = app;
		account = acc;
		number = num;
		session = ses;
		path = lp;
	}
	/**
	 * JOActionRedirect constructor comment.
	 */
	public JSELD0620Redirect(
		String num,
		int app,
		String acc,
		String lp,
		HttpSession ses) {
		super();
		option = 1; // Account Inquiry by default
		appCode = app;
		account = acc;
		number = num;
		session = ses;
		path = lp;
	}

    
	/**
	 * Insert the method's description here.
	 * Creation date: (8/31/2000 11:39:40 AM)
	 * @return java.lang.String
	 */
	public String action() {

		String ret = "";
		UserPos userPO = (UserPos) session.getAttribute("userPO");

		if (number == null) {
			number = "00";
		}


  						try {
 									userPO.setOption("RT");
									userPO.setPurpose("APPROVAL_INQ");
									session.setAttribute("userPO", userPO);
									if( appCode == 400) 
									ret =
										"/servlet/datapro.eibs.products.JSELD0600?SCREEN=400&E01HABACC=" + account + "&E01HABTYP=" + number;
									if( appCode == 500) 
									ret =
										"/servlet/datapro.eibs.products.JSELD0620?SCREEN=500&E01HABACC=" + account + "&E01HABTYP=" + number;
 						} catch (Exception ex) {
							System.out.println("Error: " + ex);
						}
   		return ret;
	}
	/**
	 * Insert the method's description here.
	 * Creation date: (8/31/2000 12:25:41 PM)
	 * @return int
	 */
	public String getNumber() {
		return number;
	}
	/**
	 * Insert the method's description here.
	 * Creation date: (8/31/2000 12:25:41 PM)
	 * @return int
	 */
	public int getOption() {
		return option;
	}
	/**
	 * Insert the method's description here.
	 * Creation date: (8/31/2000 12:25:41 PM)
	 * @param newOption int
	 */
	public void setNumber(String newNumber) {
		number = newNumber;
	}
	/**
	 * Insert the method's description here.
	 * Creation date: (8/31/2000 12:25:41 PM)
	 * @param newOption int
	 */
	public void setOption(int newOption) {
		option = newOption;
	}
}