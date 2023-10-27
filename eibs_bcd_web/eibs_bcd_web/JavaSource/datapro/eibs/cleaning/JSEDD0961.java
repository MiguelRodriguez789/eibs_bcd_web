package datapro.eibs.cleaning;
/**
 * Mantenimiento Canje Manual
 * Creation date: (10/25/17)
*/
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EDD096101Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;
import datapro.eibs.beans.JBObjList;


public class JSEDD0961 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		switch (screen) {
			// Requests List 
			case 1 :
				procReqList(user, req, res, session, screen);
				break;
			case 2 : // Request new Record
			case 3 : // Request old Record
			case 4 : // Delete record	
			case 5 : // Submit the Record for update
				procActionRec(user, req, res, session, screen);
				break;
			case 7 : // Request old Record
			case 8 : // Delete record	
			case 9 : // Submit the Record for update
				procActionRec_CE(user, req, res, session, screen);
				break;
			case 10 : // Request old Record
			case 11 : // Delete record	
			case 12 : // Submit the Record for update
				procActionRec_DR(user, req, res, session, screen);
				break;
			case 13 : // Request old Record
			case 14 : // Delete record	
			case 15 : // Submit the Record for update
				procActionRec_CR(user, req, res, session, screen);
				break;
			case 16 : // Request old Record
			case 17 : // Delete record	
			case 18 : // Submit the Record for update
				procActionRec_DE(user, req, res, session, screen);
				break;
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	// SCREEN = 1
	// Send List of Check  
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null; 
		MessageProcessor mp = null;

		try {
			mp = new MessageProcessor("EDD096101");
			EDD096101Message msg = (EDD096101Message) mp.getMessageRecord("EDD096101");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDD0961");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0001");
			if (screen == 1) {
				userPO.setPurpose("MAINTENANCE");
			} else {
				userPO.setPurpose("INQUIRY");
			}
			msg.setE01NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			msg.setE01CANCCA((req.getParameter("SEARCHCDE") == null ? userPO.getHeader2() : req.getParameter("SEARCHCDE")));
			userPO.setHeader2(msg.getE01CANCCA());
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
		forward("EDD0961_cleaning_check_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	// SCREEN = 2,3,5
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
			mp = new MessageProcessor("EDD096101");
			EDD096101Message msg = (EDD096101Message) mp.getMessageRecord("EDD096101");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDD0961");
			msg.setH01TIMSYS(getTimeStamp());
			switch (screen) {
				case 2 : // Request new Record
					msg.setH01OPECOD("0002");
					userPO.setPurpose("NEW");
					break;
				case 3 : // Request old Record
					msg.setH01OPECOD("0003");
					userPO.setPurpose("MAINTENANCE");
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
			
			if (screen == 5) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {				
				}
			}
			
			if (screen != 5){
				msg.setE01CANBNK(req.getParameter("E01CANBNK"));
				msg.setE01CANCCY(req.getParameter("E01CANCCY"));
				msg.setE01CANCCA(req.getParameter("E01CANCCA"));
				msg.setE01CANCOM(req.getParameter("E01CANCOM"));
				msg.setE01CANCKN(req.getParameter("E01CANCKN"));
				msg.setE01CANACK(req.getParameter("E01CANACK"));
				msg.setE01CANAMT(req.getParameter("E01CANAMT"));
				userPO.setBank(req.getParameter("E01CANBNK"));
			}
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 2 || screen == 3 || screen == 4) {
					forward("EDD0961_cleaning_check.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("EDD0961_cleaning_check.jsp", req, res);
				}

			} else {
				ses.setAttribute("msgRcd", newmessage);
				if (screen == 5 || screen == 4) {     // Update or Delete
					res.sendRedirect(srctx + "/servlet/datapro.eibs.cleaning.JSEDD0961?SCREEN=1&SEARCHCDE=" + userPO.getHeader2());	
				} else {
					forward("EDD0961_cleaning_check.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	// SCREEN = 7 // CE

	protected void procActionRec_CE(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("EDD096101");
				EDD096101Message msg = (EDD096101Message) mp.getMessageRecord("EDD096101");
				msg.setH01USERID(user.getH01USR());
				msg.setH01PROGRM("EDD0961");
				msg.setH01TIMSYS(getTimeStamp());
				switch (screen) {
					case 7 : // Request new Record
						msg.setH01OPECOD("0007");
						userPO.setPurpose("MAINTENANCE");
						break;
					case 8 : // Delete Record
						msg.setH01OPECOD("0008");
						break;
					case 9 : // Submit the Record for update
						msg.setH01OPECOD("0009");
						break;	
					default :
						forward(SuperServlet.devPage, req, res);
						break;
				}
				
				if (screen == 9) {
					// Get all fields in page
					try {
						super.setMessageRecord(req, msg);
					} catch (Exception e) {				
					}
				}
				
				if (screen != 9){
					msg.setE01CANBNK(req.getParameter("E01CANBNK"));
					msg.setE01CANCCY(req.getParameter("E01CANCCY"));
					msg.setE01CANCCA(req.getParameter("E01CANCCA"));
					msg.setE01CANCOM(req.getParameter("E01CANCOM"));
					msg.setE01CANCKN(req.getParameter("E01CANCKN"));
					msg.setE01CANACK(req.getParameter("E01CANACK"));
					msg.setE01CANAMT(req.getParameter("E01CANAMT"));
					userPO.setBank(req.getParameter("E01CANBNK"));
				}
				// Send Message 
				mp.sendMessage(msg);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
					if (screen == 7) {
						forward("EDD0961_cleaning_check_list.jsp", req, res);
					} else {
						// Receive Data
						newmessage = mp.receiveMessageRecord();
						ses.setAttribute("msgRcd", newmessage);
						forward("EDD0961_cleaning_ce.jsp", req, res);
					}

				} else {
					ses.setAttribute("msgRcd", newmessage);
					if (screen == 8 || screen == 9) {     // Update or Delete
						res.sendRedirect(srctx + "/servlet/datapro.eibs.cleaning.JSEDD0961?SCREEN=1&SEARCHCDE=" + userPO.getHeader2());	
					} else {
						forward("EDD0961_cleaning_ce.jsp", req, res);
					}
				}

			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	// SCREEN = 10 // DR

	protected void procActionRec_DR(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("EDD096101");
				EDD096101Message msg = (EDD096101Message) mp.getMessageRecord("EDD096101");
				msg.setH01USERID(user.getH01USR());
				msg.setH01PROGRM("EDD0961");
				msg.setH01TIMSYS(getTimeStamp());
				switch (screen) {
					case 10 : // Request new Record
						msg.setH01OPECOD("0010");
						userPO.setPurpose("MAINTENANCE");
						break;
					case 11 : // Delete Record
						msg.setH01OPECOD("0011");
						break;
					case 12 : // Submit the Record for update
						msg.setH01OPECOD("0012");
						break;	
					default :
						forward(SuperServlet.devPage, req, res);
						break;
				}
				
				if (screen == 12) {
					// Get all fields in page
					try {
						super.setMessageRecord(req, msg);
					} catch (Exception e) {				
					}
				}
				
				if (screen != 12){
					msg.setE01CANBNK(req.getParameter("E01CANBNK"));
					msg.setE01CANCCY(req.getParameter("E01CANCCY"));
					msg.setE01CANCCA(req.getParameter("E01CANCCA"));
					msg.setE01CANCOM(req.getParameter("E01CANCOM"));
					msg.setE01CANCKN(req.getParameter("E01CANCKN"));
					msg.setE01CANACK(req.getParameter("E01CANACK"));
					msg.setE01CANAMT(req.getParameter("E01CANAMT"));
					userPO.setBank(req.getParameter("E01CANBNK"));
				}
				// Send Message 
				mp.sendMessage(msg);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
					if (screen == 10) {
						forward("EDD0961_cleaning_check_list.jsp", req, res);
					} else {
						// Receive Data
						newmessage = mp.receiveMessageRecord();
						ses.setAttribute("msgRcd", newmessage);
						forward("EDD0961_cleaning_dr.jsp", req, res);
					}

				} else {
					ses.setAttribute("msgRcd", newmessage);
					if (screen == 11 || screen == 12) {     // Update or Delete
						res.sendRedirect(srctx + "/servlet/datapro.eibs.cleaning.JSEDD0961?SCREEN=1&SEARCHCDE=" + userPO.getHeader2());	
					} else {
						forward("EDD0961_cleaning_dr.jsp", req, res);
					}
				}
				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	// SCREEN = 13 // CR

	protected void procActionRec_CR(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("EDD096101");
				EDD096101Message msg = (EDD096101Message) mp.getMessageRecord("EDD096101");
				msg.setH01USERID(user.getH01USR());
				msg.setH01PROGRM("EDD0961");
				msg.setH01TIMSYS(getTimeStamp());
				switch (screen) {
					case 13 : // Request new Record
						msg.setH01OPECOD("0013");
						userPO.setPurpose("MAINTENANCE");
						break;
					case 14 : // Delete Record
						msg.setH01OPECOD("0014");
						break;
					case 15 : // Submit the Record for update
						msg.setH01OPECOD("0015");
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
					msg.setE01CANBNK(req.getParameter("E01CANBNK"));
					msg.setE01CANCCY(req.getParameter("E01CANCCY"));
					msg.setE01CANCCA(req.getParameter("E01CANCCA"));
					msg.setE01CANCOM(req.getParameter("E01CANCOM"));
					msg.setE01CANCKN(req.getParameter("E01CANCKN"));
					msg.setE01CANACK(req.getParameter("E01CANACK"));
					msg.setE01CANAMT(req.getParameter("E01CANAMT"));
					userPO.setBank(req.getParameter("E01CANBNK"));
				}
				// Send Message 
				mp.sendMessage(msg);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
					if (screen == 13) {
						forward("EDD0961_cleaning_check_list.jsp", req, res);
					} else {
						// Receive Data
						newmessage = mp.receiveMessageRecord();
						ses.setAttribute("msgRcd", newmessage);
						forward("EDD0961_cleaning_cr.jsp", req, res);
					}

				} else {
					ses.setAttribute("msgRcd", newmessage);
					if (screen == 14 || screen == 15) {     // Update or Delete
						res.sendRedirect(srctx + "/servlet/datapro.eibs.cleaning.JSEDD0961?SCREEN=1&SEARCHCDE=" + userPO.getHeader2());	
					} else {
						forward("EDD0961_cleaning_cr.jsp", req, res);
					}
				}

			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	// SCREEN = 16 // de

	protected void procActionRec_DE(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("EDD096101");
				EDD096101Message msg = (EDD096101Message) mp.getMessageRecord("EDD096101");
				msg.setH01USERID(user.getH01USR());
				msg.setH01PROGRM("EDD0961");
				msg.setH01TIMSYS(getTimeStamp());
				switch (screen) {
					case 16 : // Request new Record
						msg.setH01OPECOD("0016");
						userPO.setPurpose("MAINTENANCE");
						break;
					case 17 : // Delete Record
						msg.setH01OPECOD("0017");
						break;
					case 18 : // Submit the Record for update
						msg.setH01OPECOD("0018");
						break;	
					default :
						forward(SuperServlet.devPage, req, res);
						break;
				}
				
				if (screen == 18) {
					// Get all fields in page
					try {
						super.setMessageRecord(req, msg);
					} catch (Exception e) {				
					}
				}
				
				if (screen != 18){
					msg.setE01CANBNK(req.getParameter("E01CANBNK"));
					msg.setE01CANCCY(req.getParameter("E01CANCCY"));
					msg.setE01CANCCA(req.getParameter("E01CANCCA"));
					msg.setE01CANCOM(req.getParameter("E01CANCOM"));
					msg.setE01CANCKN(req.getParameter("E01CANCKN"));
					msg.setE01CANACK(req.getParameter("E01CANACK"));
					msg.setE01CANAMT(req.getParameter("E01CANAMT"));
					userPO.setBank(req.getParameter("E01CANBNK"));
				}
				// Send Message 
				mp.sendMessage(msg);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
					if (screen == 16) {
						forward("EDD0961_cleaning_check_list.jsp", req, res);
					} else {
						// Receive Data
						newmessage = mp.receiveMessageRecord();
						ses.setAttribute("msgRcd", newmessage);
						forward("EDD0961_cleaning_de.jsp", req, res);
					}

				} else {
					ses.setAttribute("msgRcd", newmessage);
					if (screen == 17 || screen == 18) {     // Update or Delete
						res.sendRedirect(srctx + "/servlet/datapro.eibs.cleaning.JSEDD0961?SCREEN=1&SEARCHCDE=" + userPO.getHeader2());	
					} else {
						forward("EDD0961_cleaning_de.jsp", req, res);
					}
				}
			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	
}