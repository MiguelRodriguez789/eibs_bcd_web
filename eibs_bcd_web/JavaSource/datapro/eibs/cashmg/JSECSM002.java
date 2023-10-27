package datapro.eibs.cashmg;
/**
 * Mantenimiento Convenios de Motor de pagos
 * Creation date: (10/25/17)
*/
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ECSM00201Message;
import datapro.eibs.beans.ECSM00202Message;
import datapro.eibs.beans.ECSM00203Message;
import datapro.eibs.beans.ECSM00204Message;
import datapro.eibs.beans.ECSM00205Message;
import datapro.eibs.beans.ECSM00206Message;
import datapro.eibs.beans.ECSM00207Message;
import datapro.eibs.beans.ECSM00208Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;
import datapro.eibs.beans.JBObjList;


public class JSECSM002 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		switch (screen) {
			// Requests List 
			case 1 :
				procReqList_A(user, req, res, session, screen);
				break;
			case 2 : // Request new Record
			case 3 : // Request old Record
			case 4 : // Delete record	
			case 5 : // Submit the Record for update
				procActionRec_A(user, req, res, session, screen);
				break;
				// Requests List 
			case 6 :
				procReqList_R(user, req, res, session, screen);
				break;
			case 7 : // Request new Record
			case 8 : // Request old Record
			case 9 : // Delete record	
			case 10 : // Submit the Record for update
				procActionRec_R(user, req, res, session, screen);
				break;
				// Requests List 
			case 11 :
				procReqList_C(user, req, res, session, screen);
				break;
			case 12 : // Request new Record
			case 13 : // Request old Record
			case 14 : // Delete record	
			case 15 : // Submit the Record for update
				procActionRec_C(user, req, res, session, screen);
				break;
			case 16 :
				procReqList_E(user, req, res, session, screen);
				break;
			case 17 : // Request new Record
			case 18 : // Request old Record
			case 19 : // Delete record	
			case 20 : // Submit the Record for update
				procActionRec_E(user, req, res, session, screen);
				break;
			case 21 :
				procReqList_D(user, req, res, session, screen);
				break;
			case 22 : // Request new Record
			case 23 : // Request old Record
			case 24 : // Delete record	
			case 25 : // Submit the Record for update
				procActionRec_D(user, req, res, session, screen);
				break;
			case 26 :
				procReqList_M(user, req, res, session, screen);
				break;
			case 27 : // Request new Record
			case 28 : // Request old Record
			case 29 : // Delete record	
			case 30 : // Submit the Record for update
				procActionRec_M(user, req, res, session, screen);
				break;
			case 31 :
				procReqList_B(user, req, res, session, screen);
				break;
			case 32 : // Request new Record
			case 33 : // Request old Record
			case 34 : // Delete record	
			case 35 : // Submit the Record for update
				procActionRec_B(user, req, res, session, screen);
				break;
			case 36 :
				procReqList_S(user, req, res, session, screen);
				break;
			case 37 : // Request new Record
			case 38 : // Request old Record
			case 39 : // Delete record	
			case 40 : // Submit the Record for update
				procActionRec_S(user, req, res, session, screen);
				break;

			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	// SCREEN = 1
	// Send List of Cash Management  
	//
	protected void procReqList_A(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null; 
		MessageProcessor mp = null;

		try {
			mp = new MessageProcessor("ECSM00202");
			ECSM00202Message msg = (ECSM00202Message) mp.getMessageRecord("ECSM00202");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("ECSM002");
			msg.setH02TIMSYS(getTimeStamp());
			msg.setH02OPECOD("0001");
			if (screen == 1) {
				userPO.setPurpose("MAINTENANCE");
			} else {
				userPO.setPurpose("INQUIRY");
			}
			msg.setE02NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			msg.setE02AGRNUM((req.getParameter("SEARCHCDE") == null ? userPO.getHeader2() : req.getParameter("SEARCHCDE")));
			userPO.setHeader2(msg.getE02AGRNUM());
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
		forward("ECSM002_agreements_cash_management_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	// SCREEN = 2,3,5
	// Get or Process the Record  
	//
	protected void procActionRec_A(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send data
		try {
			mp = new MessageProcessor("ECSM00202");
			ECSM00202Message msg = (ECSM00202Message) mp.getMessageRecord("ECSM00202");
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("ECSM002");
			msg.setH02TIMSYS(getTimeStamp());
			userPO.setHeader2(" ");
			switch (screen) {
				case 2 : // Request new Record
					msg.setH02OPECOD("0002");
					userPO.setPurpose("NEW");
					break;
				case 3 : // Request old Record
					msg.setH02OPECOD("0003");
					break;
				case 4 : // Delete Record
					msg.setH02OPECOD("0004");
					break;
				case 5 : // Submit the Record for update
					msg.setH02OPECOD("0005");
					break;	
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
			
			if (screen == 5) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {				
				}
			}
			
			if (screen != 5){
				msg.setE02AGRBNK(req.getParameter("E02AGRBNK"));
				msg.setE02AGRNUM(req.getParameter("E02AGRNUM"));
				msg.setE02AGRCUN(req.getParameter("E02AGRCUN"));
				userPO.setAccNum(req.getParameter("E02AGRNUM"));
				userPO.setCusNum(req.getParameter("E02AGRCUN"));
				userPO.setBank(req.getParameter("E02AGRBNK"));

			}
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 2 || screen == 3 || screen == 4) {
					forward("ECSM002_agreements_cash_management_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("ECSM002_agreements_cash_management.jsp", req, res);
				}

			} else {
				ses.setAttribute("msgRcd", newmessage);
				if (screen == 5 || screen == 4) {     // Update or Delete
					res.sendRedirect(srctx + "/servlet/datapro.eibs.cashmg.JSECSM002?SCREEN=1&SEARCHCDE=" + userPO.getHeader2());	
				} else {
					forward("ECSM002_agreements_cash_management.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	// SCREEN = 6
	// Send List of Cash Management  
	//
	protected void procReqList_R(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null; 
		MessageProcessor mp = null;

		try {
			mp = new MessageProcessor("ECSM00203");
			ECSM00203Message msg = (ECSM00203Message) mp.getMessageRecord("ECSM00203");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH03USERID(user.getH01USR());
			msg.setH03PROGRM("ECSM002");
			msg.setH03TIMSYS(getTimeStamp());
			msg.setH03OPECOD("0001");
			if (screen == 6) {
				userPO.setPurpose("MAINTENANCE");
			} else {
				userPO.setPurpose("INQUIRY");
			}
			msg.setE03RECNUM(userPO.getAccNum());
			// msg.setE03NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			msg.setE03RECACC((req.getParameter("SEARCHCDE") == null ? userPO.getHeader2() : req.getParameter("SEARCHCDE")));
			userPO.setHeader2(msg.getE03RECACC());
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
		forward("ECSM002_reciprocity_cash_management_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	// SCREEN = 7,8,10
	// Get or Process the Record  
	//
	protected void procActionRec_R(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send data
		try {
			mp = new MessageProcessor("ECSM00203");
			ECSM00203Message msg = (ECSM00203Message) mp.getMessageRecord("ECSM00203");
			msg.setH03USERID(user.getH01USR());
			msg.setH03PROGRM("ECSM002");
			msg.setH03TIMSYS(getTimeStamp());
			msg.setE03RECNUM(userPO.getAccNum());
			userPO.setHeader2(" ");
			switch (screen) {
				case 7 : // Request new Record
					msg.setH03OPECOD("0002");
					userPO.setPurpose("NEW");
					break;
				case 8 : // Request old Record
					msg.setH03OPECOD("0003");
					break;
				case 9 : // Delete Record
					msg.setH03OPECOD("0004");
					break;
				case 10 : // Submit the Record for update
					msg.setH03OPECOD("0005");
					break;	
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
			
			if (screen == 10) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {				
				}
			}
			
			if (screen != 10){
				msg.setE03RECBNK(req.getParameter("E03RECBNK"));
				msg.setE03RECACC(req.getParameter("E03RECACC"));

			}
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 7 || screen == 8 || screen == 9) {
					forward("ECSM002_reciprocity_cash_management_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("ECSM002_reciprocity_cash_management.jsp", req, res);
				}

			} else {
				ses.setAttribute("msgRcd", newmessage);
				if (screen == 10 || screen == 9) {     // Update or Delete
					res.sendRedirect(srctx + "/servlet/datapro.eibs.cashmg.JSECSM002?SCREEN=6&SEARCHCDE=" + userPO.getHeader2());	
				} else {
					forward("ECSM002_reciprocity_cash_management.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}
	
	// SCREEN = 11
	// Send List of Cash Management  
	//
	protected void procReqList_C(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null; 
		MessageProcessor mp = null;

		try {
			mp = new MessageProcessor("ECSM00204");
			ECSM00204Message msg = (ECSM00204Message) mp.getMessageRecord("ECSM00204");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH04USERID(user.getH01USR());
			msg.setH04PROGRM("ECSM002");
			msg.setH04TIMSYS(getTimeStamp());
			msg.setH04OPECOD("0001");
			if (screen == 11) {
				userPO.setPurpose("MAINTENANCE");
			} else {
				userPO.setPurpose("INQUIRY");
			}
			msg.setE04COLBNK(userPO.getBank());
			msg.setE04COLNUM(userPO.getAccNum());
			msg.setE04NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			msg.setE04COLCNL((req.getParameter("SEARCHCDE") == null ? userPO.getHeader2() : req.getParameter("SEARCHCDE")));
			userPO.setHeader2(msg.getE04COLCNL());
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E04INDOPE","E04NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("msgList", list);
			}
		forward("ECSM002_collection_cash_management_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	// SCREEN = 12,13,14
	// Get or Process the Record  
	//
	protected void procActionRec_C(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send data
		try {
			mp = new MessageProcessor("ECSM00204");
			ECSM00204Message msg = (ECSM00204Message) mp.getMessageRecord("ECSM00204");
			msg.setH04USERID(user.getH01USR());
			msg.setH04PROGRM("ECSM002");
			msg.setH04TIMSYS(getTimeStamp());
			userPO.setHeader2(" ");
			switch (screen) {
				case 12 : // Request new Record
					msg.setH04OPECOD("0002");
					userPO.setPurpose("NEW");
					break;
				case 13 : // Request old Record
					msg.setH04OPECOD("0003");
					break;
				case 14 : // Delete Record
					msg.setH04OPECOD("0004");
					break;
				case 15 : // Submit the Record for update
					msg.setH04OPECOD("0005");
					break;	
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
			
			if (screen == 15) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {				
				}
			}
			
			if (screen != 15){
				msg.setE04COLBNK(req.getParameter("E04COLBNK"));
				msg.setE04COLNUM(userPO.getAccNum());
				msg.setE04COLCNL(req.getParameter("E04COLCNL"));
				userPO.setHeader3(req.getParameter("E04COLCNL"));

			}
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 12 || screen == 13 || screen == 14) {
					forward("ECSM002_collection_cash_management_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("ECSM002_collection_cash_management.jsp", req, res);
				}

			} else {
				ses.setAttribute("msgRcd", newmessage);
				if (screen == 15 || screen == 14) {     // Update or Delete
					res.sendRedirect(srctx + "/servlet/datapro.eibs.cashmg.JSECSM002?SCREEN=11&SEARCHCDE=" + userPO.getHeader2());	
				} else {
					forward("ECSM002_collection_cash_management.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}
	// SCREEN = 16
	// Send List of Cash Management  
	//
	protected void procReqList_E(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null; 
		MessageProcessor mp = null;

		try {
			mp = new MessageProcessor("ECSM00205");
			ECSM00205Message msg = (ECSM00205Message) mp.getMessageRecord("ECSM00205");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH05USERID(user.getH01USR());
			msg.setH05PROGRM("ECSM002");
			msg.setH05TIMSYS(getTimeStamp());
			msg.setH05OPECOD("0001");
			if (screen == 16) {
				userPO.setPurpose("MAINTENANCE");
			} else {
				userPO.setPurpose("INQUIRY");
			}
			msg.setE05CREBNK(userPO.getBank());
			msg.setE05CRENUM(userPO.getAccNum());
			msg.setE05CRECNL(userPO.getHeader3());
			msg.setE05NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			msg.setE05CRETIP((req.getParameter("SEARCHCDE") == null ? userPO.getHeader2() : req.getParameter("SEARCHCDE")));
			userPO.setHeader2(msg.getE05CRETIP());
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E05INDOPE","E05NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("msgList", list);
			}
		forward("ECSM002_ref_bar_cash_management_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	// SCREEN = 12,13,14
	// Get or Process the Record  
	//
	protected void procActionRec_E(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send data
		try {
			mp = new MessageProcessor("ECSM00205");
			ECSM00205Message msg = (ECSM00205Message) mp.getMessageRecord("ECSM00205");
			msg.setH05USERID(user.getH01USR());
			msg.setH05PROGRM("ECSM002");
			msg.setH05TIMSYS(getTimeStamp());
			userPO.setHeader2(" ");
			switch (screen) {
				case 17 : // Request new Record
					msg.setH05OPECOD("0002");
					userPO.setPurpose("NEW");
					break;
				case 18 : // Request old Record
					msg.setH05OPECOD("0003");
					break;
				case 19 : // Delete Record
					msg.setH05OPECOD("0004");
					break;
				case 20 : // Submit the Record for update
					msg.setH05OPECOD("0005");
					break;	
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
			
			if (screen == 20) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {				
				}
			}
			
			if (screen != 20){
				msg.setE05CREBNK(req.getParameter("E05CREBNK"));
				msg.setE05CRENUM(userPO.getAccNum());
				msg.setE05CRECNL(userPO.getHeader3());
				msg.setE05CRETIP(req.getParameter("E05CRETIP"));
				msg.setE05CRESEQ(req.getParameter("E05CRESEQ"));
			}
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 17 || screen == 18 || screen == 19) {
					forward("ECSM002_ref_bar_cash_management_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("ECSM002_ref_bar_cash_management.jsp", req, res);
				}

			} else {
				ses.setAttribute("msgRcd", newmessage);
				if (screen == 20 || screen == 19) {     // Update or Delete
					res.sendRedirect(srctx + "/servlet/datapro.eibs.cashmg.JSECSM002?SCREEN=16&SEARCHCDE=" + userPO.getHeader2());	
				} else {
					forward("ECSM002_ref_bar_cash_management.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}
	// SCREEN = 21
	// Send List of Cash Management  
	//
	protected void procReqList_D(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null; 
		MessageProcessor mp = null;

		try {
			mp = new MessageProcessor("ECSM00201");
			ECSM00201Message msg = (ECSM00201Message) mp.getMessageRecord("ECSM00201");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ECSM002");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0001");
			if (screen == 21) {
				userPO.setPurpose("MAINTENANCE");
			} else {
				userPO.setPurpose("INQUIRY");
			}
			msg.setE01DISBNK(userPO.getBank());
			msg.setE01DISNUM(userPO.getAccNum());
			msg.setE01NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			msg.setE01DISTIP((req.getParameter("SEARCHCDE") == null ? userPO.getHeader2() : req.getParameter("SEARCHCDE")));
			userPO.setHeader2(msg.getE01DISTIP());
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
		forward("ECSM002_distribution_cash_management_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	// SCREEN = 22,23,24
	// Get or Process the Record  
	//
	protected void procActionRec_D(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send data
		try {
			mp = new MessageProcessor("ECSM00201");
			ECSM00201Message msg = (ECSM00201Message) mp.getMessageRecord("ECSM00201");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ECSM002");
			msg.setH01TIMSYS(getTimeStamp());
			userPO.setHeader2(" ");
			switch (screen) {
				case 22 : // Request new Record
					msg.setH01OPECOD("0002");
					userPO.setPurpose("NEW");
					break;
				case 23 : // Request old Record
					msg.setH01OPECOD("0003");
					break;
				case 24 : // Delete Record
					msg.setH01OPECOD("0004");
					break;
				case 25 : // Submit the Record for update
					msg.setH01OPECOD("0005");
					break;	
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
			
			if (screen == 25) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {				
				}
			}
			
			if (screen != 25){
				msg.setE01DISBNK(req.getParameter("E01DISBNK"));
				msg.setE01DISNUM(userPO.getAccNum());
				msg.setE01DISTIP(req.getParameter("E01DISTIP"));
				userPO.setHeader4(req.getParameter("E01DISTIP"));

			}
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 22 || screen == 23 || screen == 24) {
					forward("ECSM002_distribution_cash_management_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("ECSM002_distribution_cash_management.jsp", req, res);
				}

			} else {
				ses.setAttribute("msgRcd", newmessage);
				if (screen == 25 || screen == 24) {     // Update or Delete
					res.sendRedirect(srctx + "/servlet/datapro.eibs.cashmg.JSECSM002?SCREEN=21&SEARCHCDE=" + userPO.getHeader2());	
				} else {
					forward("ECSM002_distribution_cash_management.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	// SCREEN = 6
	// Send List of Cash Management  
	//
	protected void procReqList_M(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null; 
		MessageProcessor mp = null;

		try {
			mp = new MessageProcessor("ECSM00206");
			ECSM00206Message msg = (ECSM00206Message) mp.getMessageRecord("ECSM00206");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH06USERID(user.getH01USR());
			msg.setH06PROGRM("ECSM002");
			msg.setH06TIMSYS(getTimeStamp());
			msg.setH06OPECOD("0001");
			if (screen == 26) {
				userPO.setPurpose("MAINTENANCE");
			} else {
				userPO.setPurpose("INQUIRY");
			}
			msg.setE06MENNUM(userPO.getAccNum());
			msg.setE06MENEML((req.getParameter("SEARCHCDE") == null ? userPO.getHeader2() : req.getParameter("SEARCHCDE")));
			userPO.setHeader2(msg.getE06MENEML());
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E06INDOPE","E06NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("msgList", list);
			}
		forward("ECSM002_email_cash_management_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	// SCREEN = 7,8,10
	// Get or Process the Record  
	//
	protected void procActionRec_M(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send data
		try {
			mp = new MessageProcessor("ECSM00206");
			ECSM00206Message msg = (ECSM00206Message) mp.getMessageRecord("ECSM00206");
			msg.setH06USERID(user.getH01USR());
			msg.setH06PROGRM("ECSM002");
			msg.setH06TIMSYS(getTimeStamp());
			msg.setE06MENNUM(userPO.getAccNum());
			userPO.setHeader2(" ");

			switch (screen) {
				case 27 : // Request new Record
					msg.setH06OPECOD("0002");
					userPO.setPurpose("NEW");
					break;
				case 28 : // Request old Record
					msg.setH06OPECOD("0003");
					break;
				case 29 : // Delete Record
					msg.setH06OPECOD("0004");
					break;
				case 30 : // Submit the Record for update
					msg.setH06OPECOD("0005");
					break;	
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
			
			if (screen == 30) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {				
				}
			}
			
			if (screen != 30){
				msg.setE06MENBNK(req.getParameter("E06MENBNK"));
				msg.setE06MENEML(req.getParameter("E06MENEML"));
			}
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 27 || screen == 28 || screen == 29) {
					forward("ECSM002_email_cash_management_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("ECSM002_email_cash_management.jsp", req, res);
				}

			} else {
				ses.setAttribute("msgRcd", newmessage);
				if (screen == 30 || screen == 29) {     // Update or Delete
					res.sendRedirect(srctx + "/servlet/datapro.eibs.cashmg.JSECSM002?SCREEN=26&SEARCHCDE=" + userPO.getHeader2());	
				} else {
					forward("ECSM002_email_cash_management.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	// SCREEN = 31
	// Send List of Cash Management  
	//
	protected void procReqList_B(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null; 
		MessageProcessor mp = null;

		try {
			mp = new MessageProcessor("ECSM00207");
			ECSM00207Message msg = (ECSM00207Message) mp.getMessageRecord("ECSM00207");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH07USERID(user.getH01USR());
			msg.setH07PROGRM("ECSM002");
			msg.setH07TIMSYS(getTimeStamp());
			msg.setH07OPECOD("0001");
			if (screen == 31) {
				userPO.setPurpose("MAINTENANCE");
			} else {
				userPO.setPurpose("INQUIRY");
			}
			msg.setE07BENBNK(userPO.getBank());
			msg.setE07BENNUM(userPO.getAccNum());
			msg.setE07NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			msg.setE07BENCOM((req.getParameter("SEARCHCDE") == null ? userPO.getHeader2() : req.getParameter("SEARCHCDE")));
			userPO.setHeader2(msg.getE07BENCOM());
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E07INDOPE","E07NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("msgList", list);
			}
		forward("ECSM002_beneficiaries_cash_management_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	// SCREEN = 32,33,35
	// Get or Process the Record  
	//
	protected void procActionRec_B(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send data
		try {
			mp = new MessageProcessor("ECSM00207");
			ECSM00207Message msg = (ECSM00207Message) mp.getMessageRecord("ECSM00207");
			msg.setH07USERID(user.getH01USR());
			msg.setH07PROGRM("ECSM002");
			msg.setH07TIMSYS(getTimeStamp());
			msg.setE07BENBNK(userPO.getBank());
			msg.setE07BENNUM(userPO.getAccNum());
			userPO.setHeader2(" ");
			switch (screen) {
				case 32 : // Request new Record
					msg.setH07OPECOD("0002");
					userPO.setPurpose("NEW");
					break;
				case 33 : // Request old Record
					msg.setH07OPECOD("0003");
					break;
				case 34 : // Delete Record
					msg.setH07OPECOD("0004");
					break;
				case 35 : // Submit the Record for update
					msg.setH07OPECOD("0005");
					break;	
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
			
			if (screen == 35) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {				
				}
			}
			
			if (screen != 35){
				msg.setE07BENBNK(req.getParameter("E07BENBNK"));
				msg.setE07BENNUM(userPO.getAccNum());
				msg.setE07BENTIP(req.getParameter("E07BENTIP"));
				msg.setE07BENCOM(req.getParameter("E07BENCOM"));
				msg.setE07BENRAC(req.getParameter("E07BENRAC"));

			}
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 32 || screen == 33 || screen == 34) {
					forward("ECSM002_beneficiaries_cash_management_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("ECSM002_beneficiaries_cash_management.jsp", req, res);
				}

			} else {
				ses.setAttribute("msgRcd", newmessage);
				if (screen == 35 || screen == 34) {     // Update or Delete
					res.sendRedirect(srctx + "/servlet/datapro.eibs.cashmg.JSECSM002?SCREEN=31&SEARCHCDE=" + userPO.getHeader2());	
				} else {
					forward("ECSM002_beneficiaries_cash_management.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}
	
	// SCREEN = 36
	// Send List of Cash Management  
	//
	protected void procReqList_S(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null; 
		MessageProcessor mp = null;

		try {
			mp = new MessageProcessor("ECSM00208");
			ECSM00208Message msg = (ECSM00208Message) mp.getMessageRecord("ECSM00208");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH08USERID(user.getH01USR());
			msg.setH08PROGRM("ECSM002");
			msg.setH08TIMSYS(getTimeStamp());
			msg.setH08OPECOD("0001");
			if (screen == 36) {
				userPO.setPurpose("MAINTENANCE");
			} else {
				userPO.setPurpose("INQUIRY");
			}
			msg.setE08SCHBNK(userPO.getBank());
			msg.setE08SCHNUM(userPO.getAccNum());
			msg.setE08NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			msg.setE08SCHSEQ((req.getParameter("SEARCHCDE") == null ? userPO.getHeader2() : req.getParameter("SEARCHCDE")));
			userPO.setHeader2(msg.getE08SCHSEQ());
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E08INDOPE","E08NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("msgList", list);
			}
		forward("ECSM002_sch_cash_management_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	// SCREEN = 37,38,40
	// Get or Process the Record  
	//
	protected void procActionRec_S(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send data
		try {
			mp = new MessageProcessor("ECSM00208");
			ECSM00208Message msg = (ECSM00208Message) mp.getMessageRecord("ECSM00208");
			msg.setH08USERID(user.getH01USR());
			msg.setH08PROGRM("ECSM002");
			msg.setH08TIMSYS(getTimeStamp());
			msg.setE08SCHBNK(userPO.getBank());
			msg.setE08SCHNUM(userPO.getAccNum());
			userPO.setHeader2(" ");
			switch (screen) {
				case 37 : // Request new Record
					msg.setH08OPECOD("0002");
					userPO.setPurpose("NEW");
					break;
				case 38 : // Request old Record
					msg.setH08OPECOD("0003");
					break;
				case 39 : // Delete Record
					msg.setH08OPECOD("0004");
					break;
				case 40 : // Submit the Record for update
					msg.setH08OPECOD("0005");
					break;	
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
			
			if (screen == 40) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {				
				}
			}
			
			if (screen != 40){
				msg.setE08SCHBNK(req.getParameter("E08SCHBNK"));
				msg.setE08SCHNUM(userPO.getAccNum());
				msg.setE08SCHSEQ(req.getParameter("E08SCHSEQ"));

			}
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 37 || screen == 38 || screen == 39) {
					forward("ECSM002_sch_cash_management_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("ECSM002_sch_cash_management.jsp", req, res);
				}
			} else {
				ses.setAttribute("msgRcd", newmessage);
				if (screen == 40 || screen == 39) {     // Update or Delete
					res.sendRedirect(srctx + "/servlet/datapro.eibs.cashmg.JSECSM002?SCREEN=36&SEARCHCDE=" + userPO.getHeader2());	
				} else {
					forward("ECSM002_sch_cash_management.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}
	
	
	
	
}