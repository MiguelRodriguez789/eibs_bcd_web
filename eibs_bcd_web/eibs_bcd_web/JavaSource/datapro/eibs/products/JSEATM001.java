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
import datapro.eibs.beans.EATM00101Message;
import datapro.eibs.beans.EATM00102Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;
import datapro.eibs.beans.JBObjList;


public class JSEATM001 extends JSEIBSServlet { 
	 
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
			case 6 :
				procReqListBan(user, req, res, session, screen);
				break;
			case 7 : // Request new Record
			case 8 : // Request old Record
			case 9 : // Delete record	
			case 10 : // Submit the Record for update
				procActionRecBan(user, req, res, session, screen);
				break;

			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	// SCREEN = 1
	// Send List of Cash Management  
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null; 
		MessageProcessor mp = null;

		try {
			mp = new MessageProcessor("EATM00101");
			EATM00101Message msg = (EATM00101Message) mp.getMessageRecord("EATM00101");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EATM001");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0001");
			if (screen == 1) {
				userPO.setPurpose("MAINTENANCE");
			} else {
				userPO.setPurpose("INQUIRY");
			}
			msg.setE01NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			msg.setE01PARTID((req.getParameter("SEARCHCDE") == null ? userPO.getHeader2() : req.getParameter("SEARCHCDE")));
			userPO.setHeader2(msg.getE01PARTID());
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
		forward("EATM001_atm_list.jsp", req, res);
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
			mp = new MessageProcessor("EATM00101");
			EATM00101Message msg = (EATM00101Message) mp.getMessageRecord("EATM00101");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EATM001");
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
				msg.setE01PARBNK(req.getParameter("E01PARBNK"));
				msg.setE01PARTID(req.getParameter("E01PARTID"));

			}
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 2 || screen == 3 || screen == 4) {
					forward("EATM001_atm_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("EATM001_atm_detail.jsp", req, res);
				}

			} else {
				ses.setAttribute("msgRcd", newmessage);
				if (screen == 5 || screen == 4) {     // Update or Delete
					res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSEATM001?SCREEN=1&SEARCHCDE=" + userPO.getHeader2());	
				} else {
					forward("EATM001_atm_detail.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	// SCREEN = 6
	// Send List of Bandeja  
	//
	protected void procReqListBan(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null; 
		MessageProcessor mp = null;

		try {

			mp = new MessageProcessor("EATM001");
			EATM00101Message msgPar = (EATM00101Message) mp.getMessageRecord("EATM00101");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			msgPar.setH01USERID(user.getH01USR());
			msgPar.setH01PROGRM("EATM001");
			msgPar.setH01TIMSYS(getTimeStamp());
			msgPar.setH01OPECOD("0006");
			
			msgPar.setE01PARBNK(req.getParameter("E01PARBNK"));
			msgPar.setE01PARTID(req.getParameter("E01PARTID"));

			mp.sendMessage(msgPar);

			msgPar = (EATM00101Message) mp.receiveMessageRecord();
			ses.setAttribute("msgPar", msgPar);

		} finally {
			if (mp != null)	mp.close();
		}
		
		try {
			mp = new MessageProcessor("EATM00102");
			EATM00102Message msg = (EATM00102Message) mp.getMessageRecord("EATM00102");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("EATM001");
			msg.setH02TIMSYS(getTimeStamp());
			msg.setH02OPECOD("0001");
			if (screen == 6) {
				userPO.setPurpose("MAINTENANCE");
			} else {
				userPO.setPurpose("INQUIRY");
			}
			msg.setE02NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			msg.setE02PBABTY((req.getParameter("SEARCHCDE") == null ? userPO.getHeader3() : req.getParameter("SEARCHCDE")));
			userPO.setHeader3(msg.getE02PBABTY());

			msg.setE02PBABNK(req.getParameter("E01PARBNK"));
			msg.setE02PBATID(req.getParameter("E01PARTID"));
			
			
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
		forward("EATM001_atm_ban_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	// SCREEN = 7,8,10
	// Get or Process the Record  
	//
	protected void procActionRecBan(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send data
		try {
			mp = new MessageProcessor("EATM00102");
			EATM00102Message msg = (EATM00102Message) mp.getMessageRecord("EATM00102");
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("EATM001");
			msg.setH02TIMSYS(getTimeStamp());
			switch (screen) {
				case 7 : // Request new Record
					msg.setH02OPECOD("0002");
					userPO.setPurpose("NEW");
					break;
				case 8 : // Request old Record
					msg.setH02OPECOD("0003");
					userPO.setPurpose("MAINTENANCE");
					break;
				case 9 : // Delete Record
					msg.setH02OPECOD("0004");
					break;
				case 10 : // Submit the Record for update
					msg.setH02OPECOD("0005");
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
				msg.setE02PBABNK(req.getParameter("E02PBABNK"));
				msg.setE02PBATID(req.getParameter("E02PBATID"));
				msg.setE02PBABTY(req.getParameter("E02PBABTY"));
				msg.setE02PBABAN(req.getParameter("E02PBABAN"));

			}
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 7 || screen == 8 || screen == 9) {
					forward("EATM001_atm_ban_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("EATM001_atm_ban_detail.jsp", req, res);
				}

			} else {
				ses.setAttribute("msgRcd", newmessage);
				if (screen == 10 || screen == 9) {     // Update or Delete
					procReqListBan(user, req, res, ses, 6);
				} else {
					forward("EATM001_atm_ban_detail.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}
	
	
}