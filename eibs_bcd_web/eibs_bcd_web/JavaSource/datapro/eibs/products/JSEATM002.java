package datapro.eibs.products;
/**
 * Mantenimiento ATM 
 * Creation date: (10/25/17)
 
 * 
 * 	// List of Options
 * 	//
 *	// SCREEN =    1	Send List of Clients User Type
 *	// SCREEN =    2    Request new record
 *	// SCREEN =    3    Request old record
 *	// SCREEN =    4	Delete record 
 *	// SCREEN =    5	Submit the record for Update 
*/
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EATM00201Message;
import datapro.eibs.beans.EATM00202Message;
import datapro.eibs.beans.EATM00203Message;
import datapro.eibs.beans.EATM00204Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;
import datapro.eibs.beans.JBObjList;


public class JSEATM002 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		switch (screen) {
			case 1 : // Seleccion
				procReqSel(user, req, res, session, screen);
				break;
			case 2 : //validate
				procValRec(user, req, res, session, screen);
				break;
			case 3 : //Requests List ATM
				procReqListAtm(user, req, res, session, screen);
				break;
			case 4 : // Request new Record
			case 5 : // Request old Record
			case 6 : // Delete record	
			case 7 : // Submit the Record for update
				procActionRec(user, req, res, session, screen);
				break;
			case 8 : // Seleccion
				procInqSel(user, req, res, session, screen);
				break;
			case 9 : //validate
				procInqRec(user, req, res, session, screen);
				break;
			case 10 : // Seleccion
				procCloSel(user, req, res, session, screen);
				break;
			case 11 : //validate
			case 12: // Submit the Record for update
				procCloRec(user, req, res, session, screen);
				break;
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	// SCREEN = 1
	// Get or Process the Record  
	//
	protected void procReqSel(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send data
		try {
			mp = new MessageProcessor("EATM00201");
			EATM00201Message msg = (EATM00201Message) mp.getMessageRecord("EATM00201");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EATM002");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0001");
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				newmessage = mp.receiveMessageRecord();
			}

			ses.setAttribute("msgSel", newmessage);
			forward("EATM002_process_sel.jsp", req, res);

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	
	// SCREEN = 2
	// Get or Process the Record  
	//
	protected void procValRec(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send data
		try {
			mp = new MessageProcessor("EATM00201");
			EATM00201Message msg = (EATM00201Message) mp.getMessageRecord("EATM00201");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EATM002");
			msg.setH01TIMSYS(getTimeStamp());
			switch (screen) {
				case 2 : // Request new Record
					msg.setH01OPECOD("0002");
					break;
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
			
			if (screen == 2) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {				
				}
			}
			
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 2) {
					forward("EATM002_process_sel.jsp", req, res);
				}
			} else {
				ses.setAttribute("msgRcd", newmessage);
				if (screen == 2) {     // Update or Delete
					procReqListAtm(user, req, res, ses, 3);
				} else {
					forward("EATM002_process_detail.jsp", req, res);
				}
			}
			
		} finally {
			if (mp != null) 
				mp.close();
		}
	}
	
	
	// SCREEN = 3
	// Send List of ATM  
	//
	protected void procReqListAtm(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null; 
		MessageProcessor mp = null;

		try {

			mp = new MessageProcessor("EATM002");
			EATM00201Message msgSel = (EATM00201Message) mp.getMessageRecord("EATM00201");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			msgSel.setH01USERID(user.getH01USR());
			msgSel.setH01PROGRM("EATM002");
			msgSel.setH01TIMSYS(getTimeStamp());
			msgSel.setH01OPECOD("0003");
			
			msgSel.setE01MOVBNK(req.getParameter("E01MOVBNK"));
			msgSel.setE01MOVCCY(req.getParameter("E01MOVCCY"));
			msgSel.setE01MOVTID(req.getParameter("E01MOVTID"));
			msgSel.setE01MOVTDD(req.getParameter("E01MOVTDD"));
			msgSel.setE01MOVTMM(req.getParameter("E01MOVTMM"));
			msgSel.setE01MOVTYY(req.getParameter("E01MOVTYY"));
			msgSel.setE01MOVTYR(req.getParameter("E01MOVTYR"));
			
			mp.sendMessage(msgSel);

			msgSel = (EATM00201Message) mp.receiveMessageRecord();
			ses.setAttribute("msgSel", msgSel);

		} finally {
			if (mp != null)	mp.close();
		}
		
		
		try {
			mp = new MessageProcessor("EATM00202");
			EATM00202Message msg = (EATM00202Message) mp.getMessageRecord("EATM00202");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("EATM002");
			msg.setH02TIMSYS(getTimeStamp());
			msg.setH02OPECOD("0001");
			if (screen == 3) {
				userPO.setPurpose("MAINTENANCE");
			} else {
				userPO.setPurpose("INQUIRY");
			}
			msg.setE02NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			msg.setE02MOVBAN((req.getParameter("SEARCHCDE") == null ? userPO.getHeader2() : req.getParameter("SEARCHCDE")));
			userPO.setHeader2(msg.getE02MOVBAN());
			
			msg.setE02MOVBNK(req.getParameter("E01MOVBNK"));
			msg.setE02MOVCCY(req.getParameter("E01MOVCCY"));
			msg.setE02MOVTID(req.getParameter("E01MOVTID"));
			msg.setE02MOVTDD(req.getParameter("E01MOVTDD"));
			msg.setE02MOVTMM(req.getParameter("E01MOVTMM"));
			msg.setE02MOVTYY(req.getParameter("E01MOVTYY"));
			msg.setE02MOVTYR(req.getParameter("E01MOVTYR"));
			
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
		forward("EATM002_process_atm_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}


	// SCREEN = 4,5,6,7
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
			mp = new MessageProcessor("EATM00202");
			EATM00202Message msg = (EATM00202Message) mp.getMessageRecord("EATM00202");
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("EATM002");
			msg.setH02TIMSYS(getTimeStamp());
			switch (screen) {
				case 4 : // Request new Record
					msg.setH02OPECOD("0002");
					userPO.setPurpose("NEW");
					break;
				case 5 : // Request old Record
					msg.setH02OPECOD("0003");
					userPO.setPurpose("MAINTENANCE");
					break;
				case 6 : // Delete Record
					msg.setH02OPECOD("0004");
					break;
				case 7 : // Submit the Record for update
					msg.setH02OPECOD("0005");
					break;	
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
			
			if (screen == 7) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {				
				}
			}
			
			if (screen != 7){
				msg.setE02MOVBNK(req.getParameter("E02MOVBNK"));
				msg.setE02MOVCCY(req.getParameter("E02MOVCCY"));
				msg.setE02MOVBTY(req.getParameter("E02MOVBTY"));
				msg.setE02MOVBAN(req.getParameter("E02MOVBAN"));
				msg.setE02MOVDEN(req.getParameter("E02MOVDEN"));
				msg.setE02MOVTID(req.getParameter("E02MOVTID"));
				msg.setE02MOVTYY(req.getParameter("E02MOVTYY"));
				msg.setE02MOVTMM(req.getParameter("E02MOVTMM"));
				msg.setE02MOVTDD(req.getParameter("E02MOVTDD"));
				msg.setE02MOVTYR(req.getParameter("E02MOVTYR"));

			}
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 4 || screen == 5 || screen == 6) {
					forward("EATM002_process_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("EATM002_process_detail.jsp", req, res);
				}

			} else {
				ses.setAttribute("msgRcd", newmessage);
				if (screen == 6 || screen == 7) {     // Update or Delete
					procReqListAtm(user, req, res, ses, 3);
				} else {
					forward("EATM002_process_detail.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	// SCREEN = 8
	//   
	//
	
	
	protected void procInqSel(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("EATM00203");
				EATM00203Message msg = (EATM00203Message) mp.getMessageRecord("EATM00203");
				msg.setH03USERID(user.getH01USR());
				msg.setH03PROGRM("EATM002");
				msg.setH03TIMSYS(getTimeStamp());
				msg.setH03OPECOD("0001");
				// Send Message 
				mp.sendMessage(msg);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
					newmessage = mp.receiveMessageRecord();
				}

				ses.setAttribute("msgSel", newmessage);
				forward("EATM002_inquiry_sel.jsp", req, res);

			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	// SCREEN = 9
	// Get or Process the Record  
	//
	protected void procInqRec(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send data
		try {
			mp = new MessageProcessor("EATM00203");
			EATM00203Message msg = (EATM00203Message) mp.getMessageRecord("EATM00203");
			msg.setH03USERID(user.getH01USR());
			msg.setH03PROGRM("EATM002");
			msg.setH03TIMSYS(getTimeStamp());
			switch (screen) {
				case 9 : // Request new Record
					msg.setH03OPECOD("0002");
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
			
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				forward("EATM002_inquiry_sel.jsp", req, res);
			} else {
				ses.setAttribute("msgRcd", newmessage);
				forward("EATM002_inquiry_detail.jsp", req, res);
			}
			
		} finally {
			if (mp != null) 
				mp.close();
		}
	}
	
	// SCREEN = 10
	//   
	//
	
	
	protected void procCloSel(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("EATM00204");
				EATM00204Message msg = (EATM00204Message) mp.getMessageRecord("EATM00204");
				msg.setH04USERID(user.getH01USR());
				msg.setH04PROGRM("EATM002");
				msg.setH04TIMSYS(getTimeStamp());
				msg.setH04OPECOD("0001");
				// Send Message 
				mp.sendMessage(msg);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
					newmessage = mp.receiveMessageRecord();
				}

				ses.setAttribute("msgSel", newmessage);
				forward("EATM002_closed_sel.jsp", req, res);

			} finally {
				if (mp != null) 
					mp.close();
			}
		}
	// SCREEN = 11
	// Get or Process the Record  
	//
	protected void procCloRec(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send data
		try {
			mp = new MessageProcessor("EATM00204");
			EATM00204Message msg = (EATM00204Message) mp.getMessageRecord("EATM00204");
			msg.setH04USERID(user.getH01USR());
			msg.setH04PROGRM("EATM002");
			msg.setH04TIMSYS(getTimeStamp());
			switch (screen) {
				case 11 : // Request new Record
					msg.setH04OPECOD("0002");
					break;
				case 12 : // Request new Record
					msg.setH04OPECOD("0003");
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
				msg.setE04MOVBNK(req.getParameter("E04MOVBNK"));
				msg.setE04MOVCCY(req.getParameter("E04MOVCCY"));
				msg.setE04MOVTID(req.getParameter("E04MOVTID"));
			}
			
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				forward("EATM002_closed_sel.jsp", req, res);
			} else {
				ses.setAttribute("msgRcd", newmessage);
				if (screen == 12) {     // Update or Delete
					forward("EATM002_closed_sel.jsp", req, res);
				} else {
					forward("EATM002_closed_detail.jsp", req, res);
				}
			}
			
		} finally {
			if (mp != null) 
				mp.close();
		}
	}
	
	
}