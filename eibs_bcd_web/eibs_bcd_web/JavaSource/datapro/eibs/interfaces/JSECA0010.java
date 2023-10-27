package datapro.eibs.interfaces;
/**
 * Maintenance of Fields By Vendor
 * Creation date: (10/07/14)
 * @author: Carlos Castillo
 * 
 * 	// List of Options
 * 	//
 *	// SCREEN =    1,11	Send List 
 *	// SCREEN =    2.12 Request new record
 *	// SCREEN =    3,13 Request old record
 *	// SCREEN =    4,14	Delete record 
 *	// SCREEN =    5,15	Submit the record for Update 
 */
import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class JSECA0010 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		switch (screen) {
			// Requests List 
			case 1 :
			case 6 :
				procReqList(user, req, res, session, screen);
				break;
			case 2 : // Request new Record
			case 3 : // Request old Record
			case 4 : // Delete record	
			case 5 : // Submit the Record for update
				procActionRec(user, req, res, session, screen);
				break;
			case 11 :
			case 16 :
				procReqErrList(user, req, res, session, screen);
				break;
			case 12 : // Request new Record
			case 13 : // Request old Record
			case 14 : // Delete record	
			case 15 : // Submit the Record for update
				procActionErrRec(user, req, res, session, screen);
				break;	
			case 21 :
			case 26 :
				procReqListX(user, req, res, session, screen);
				break;
			case 22 : // Request new Record
			case 23 : // Request old Record
			case 24 : // Delete record	
			case 25 : // Submit the Record for update
				procActionRecX(user, req, res, session, screen);
				break;
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}
	
	// SCREEN = 1 , 6
	// Send List Errors Codes  
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("ECA0010");
			ECA001001Message msg = (ECA001001Message) mp.getMessageRecord("ECA001001");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ECA0010");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0001");
			
			userPO.setPurpose(screen  == 1 ? "MAINTENANCE" : "INQUIRY");
			msg.setE01NUMREC(req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord"));
			msg.setE01ITRVND(req.getParameter("SEARCHCDE") == null ? " " : req.getParameter("SEARCHCDE"));
			msg.setE01ITRNOE(req.getParameter("SEARCHCOD") == null ? " " : req.getParameter("SEARCHCOD"));
			userPO.setSource(msg.getE01ITRVND());
			userPO.setIdentifier(msg.getE01ITRNOE());

			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("msgList", list);
			}
			forward("ECA0010_vendor_transactions_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	// SCREEN = 2,3,4,5
	// Get or Process the Record  
	//
	protected void procActionRec(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send data
		try {
			mp = new MessageProcessor("ECA0010");
			ECA001001Message msg = (ECA001001Message) mp.getMessageRecord("ECA001001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ECA0010");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			switch (screen) {
				case 2 : // Request new Record
					msg.setH01OPECOD("0002");
					userPO.setPurpose("NEW");
					break;
				case 3 : // Request old Record
					msg.setH01OPECOD("0003");
					break;
				case 4 : // Delete Record
					msg.setH01OPECOD("0004");
					break;
				case 5 : // Submit the Record for update
					msg.setH01OPECOD("0005");
					break;
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
			// Get key field
			msg.setE01ITRVND(req.getParameter("E01ITRVND") == null ? " " : req.getParameter("E01ITRVND"));
			msg.setE01ITRNOE(req.getParameter("E01ITRNOE") == null ? " " : req.getParameter("E01ITRNOE"));
			userPO.setSource(msg.getE01ITRVND());
			userPO.setIdentifier(msg.getE01ITRNOE());
			if (screen == 5) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {				
				}
			}
			
			msg.setH01FLGWK1(""); 
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 2 || screen == 3 || screen == 4) {
					forward("ECA0010_vendor_transactions_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("ECA0010_vendor_transactions_detail.jsp", req, res);
				}

			} else {
				if (screen == 4 || screen == 5) {
					String parm = "?SCREEN=1&FromRecord=0&SEARCHCDE=" + userPO.getSource() + "&SEARCHCOD=" + userPO.getIdentifier();
					redirectToPage("/servlet/datapro.eibs.interfaces.JSECA0010" + parm, res);
				} else {
					ses.setAttribute("msgRcd", newmessage);
					forward("ECA0010_vendor_transactions_detail.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	// SCREEN = 11 , 16
	// Send List   
	//
	protected void procReqErrList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("ECA0010");
			ECA001002Message msg = (ECA001002Message) mp.getMessageRecord("ECA001002");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			// Send Initial data
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("ECA0010");
			msg.setH02TIMSYS(getTimeStamp());
			msg.setH02SCRCOD("01");
			msg.setH02OPECOD("0011");
			
			userPO.setPurpose(screen  == 11 ? "MAINTENANCE" : "INQUIRY");
			msg.setE02NUMREC(req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord"));
			msg.setE02TREVND(req.getParameter("E01ITRVND") == null ? " " : req.getParameter("E01ITRVND"));
			msg.setE02TRENOE(req.getParameter("E01ITRNOE") == null ? " " : req.getParameter("E01ITRNOE"));
			userPO.setSource(msg.getE02TREVND());
			userPO.setIdentifier(msg.getE02TRENOE());
			
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E02INDOPE","E02NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("msgList", list);
			}
			forward("ECA0010_vendor_transactions_err_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}	


	// SCREEN = 12,13,14, 15
	// Get or Process the Record  
	//
	protected void procActionErrRec(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send data
		try {
			mp = new MessageProcessor("ECA0010");
			ECA001002Message msg = (ECA001002Message) mp.getMessageRecord("ECA001002");
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("ECA0010");
			msg.setH02TIMSYS(getTimeStamp());
			msg.setH02SCRCOD("01");
			switch (screen) {
				case 12 : // Request new Record
					msg.setH02OPECOD("0012");
					userPO.setPurpose("NEW");
					break;
				case 13 : // Request old Record
					msg.setH02OPECOD("0013");
					break;
				case 14 : // Delete Record
					msg.setH02OPECOD("0014");
					break;
				case 15 : // Submit the Record for update
					msg.setH02OPECOD("0015");
					break;
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
			// Get key field
			msg.setE02TREVND(req.getParameter("E02TREVND") == null ? " " : req.getParameter("E02TREVND"));
			msg.setE02TRENOE(req.getParameter("E02TRENOE") == null ? " " : req.getParameter("E02TRENOE"));
			msg.setE02TREIBS(req.getParameter("E02TREIBS") == null ? " " : req.getParameter("E02TREIBS"));
			msg.setE02TREEIN(req.getParameter("E02TREEIN") == null ? " " : req.getParameter("E02TREEIN"));
			userPO.setSource(msg.getE02TREVND());
			userPO.setIdentifier(msg.getE02TRENOE());
			userPO.setHeader1(msg.getE02TREIBS());
			if (screen == 15) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {				
				}
				msg.setE02TREAT1(req.getParameter("E02TREAT1") == null ? " " : "DDA");
				msg.setE02TREAT2(req.getParameter("E02TREAT2") == null ? " " : "SAV");
				msg.setE02TREAT3(req.getParameter("E02TREAT3") == null ? " " : "LNS");
				msg.setE02TREAT4(req.getParameter("E02TREAT4") == null ? " " : "CCR");
				msg.setE02TREAT5(req.getParameter("E02TREAT5") == null ? " " : "GLN");
				
			}
			
			msg.setH02FLGWK1(""); 
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 12 || screen == 13 || screen == 14) {
					forward("ECA0010_vendor_transactions_err_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("ECA0010_vendor_transactions_err_detail.jsp", req, res);
				}

			} else {
				if (screen == 14 || screen == 15) {
					String parm = "?SCREEN=11&FromRecord=0&E01ITRVND=" + userPO.getSource() + "&E01ITRNOE=" + userPO.getIdentifier();
					redirectToPage("/servlet/datapro.eibs.interfaces.JSECA0010" + parm, res);
				} else {
					ses.setAttribute("msgRcd", newmessage);
					forward("ECA0010_vendor_transactions_err_detail.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	// SCREEN = 21 , 26
	// Send List   
	//
	protected void procReqListX(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("ECA0010");
			ECA001003Message msg = (ECA001003Message) mp.getMessageRecord("ECA001003");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			// Send Initial data
			msg.setH03USERID(user.getH01USR());
			msg.setH03PROGRM("ECA0010");
			msg.setH03TIMSYS(getTimeStamp());
			msg.setH03SCRCOD("01");
			msg.setH03OPECOD("0021");
			
			userPO.setPurpose(screen  == 21 ? "MAINTENANCE" : "INQUIRY");

			try {
				msg.setE03EXCVND(req.getParameter("E01ITRVND"));
			} catch (Exception e) {
				msg.setE03EXCVND(userPO.getHeader2());
			}
			try {
				msg.setE03EXCNOE(req.getParameter("E01ITRNOE"));
			} catch (Exception e) {
				msg.setE03EXCNOE(userPO.getHeader3());
			}

			
			msg.setE03NUMREC(req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord"));
			msg.setE03EXCATY(req.getParameter("SEARCHCDE") == null ? " " : req.getParameter("SEARCHCDE"));
			msg.setE03EXCTBL(req.getParameter("SEARCHCOD") == null ? " " : req.getParameter("SEARCHCOD"));
			userPO.setSource(msg.getE03EXCATY());
			userPO.setIdentifier(msg.getE03EXCTBL());
			userPO.setHeader2(msg.getE03EXCVND());
			userPO.setHeader3(msg.getE03EXCNOE());

			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E03INDOPE","E03NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("msgList", list);
			}
			forward("ECA0010_vendor_transactions_exc_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	// SCREEN = 22,23,24,25
	// Get or Process the Record  
	//
	protected void procActionRecX(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send data
		try {
			mp = new MessageProcessor("ECA0010");
			ECA001003Message msg = (ECA001003Message) mp.getMessageRecord("ECA001003");
			msg.setH03USERID(user.getH01USR());
			msg.setH03PROGRM("ECA0010");
			msg.setH03TIMSYS(getTimeStamp());
			msg.setH03SCRCOD("01");
			switch (screen) {
				case 22 : // Request new Record
					msg.setH03OPECOD("0022");
					userPO.setPurpose("NEW");
					break;
				case 23 : // Request old Record
					msg.setH03OPECOD("0023");
					break;
				case 24 : // Delete Record
					msg.setH03OPECOD("0024");
					break;
				case 25 : // Submit the Record for update
					msg.setH03OPECOD("0025");
					break;
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
			// Get key field
			msg.setE03EXCBNK(req.getParameter("E03EXCBNK") == null ? " " : req.getParameter("E03EXCBNK"));
			msg.setE03EXCVND(req.getParameter("E03EXCVND") == null ? " " : req.getParameter("E03EXCVND"));
			msg.setE03EXCNOE(req.getParameter("E03EXCNOE") == null ? " " : req.getParameter("E03EXCNOE"));
			msg.setE03EXCATY(req.getParameter("E03EXCATY") == null ? " " : req.getParameter("E03EXCATY"));
			msg.setE03EXCTBL(req.getParameter("E03EXCTBL") == null ? " " : req.getParameter("E03EXCTBL"));
			userPO.setSource(msg.getE03EXCVND());
			userPO.setIdentifier(msg.getE03EXCNOE());
			if (screen == 25) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {				
				}
			}
			
			msg.setH03FLGWK1(""); 
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 22 || screen == 23 || screen == 24) {
					forward("ECA0010_vendor_transactions_exc_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("ECA0010_vendor_transactions_exc_detail.jsp", req, res);
				}

			} else {
				if (screen == 24 || screen == 25) {
					//String parm = "?SCREEN=21&FromRecord=0&SEARCHCDE=" + userPO.getSource() + "&SEARCHCOD=" + userPO.getIdentifier();
					redirectToPage("/servlet/datapro.eibs.interfaces.JSECA0010?SCREEN=21", res);
				} else {
					ses.setAttribute("msgRcd", newmessage);
					forward("ECA0010_vendor_transactions_exc_detail.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}
	

}