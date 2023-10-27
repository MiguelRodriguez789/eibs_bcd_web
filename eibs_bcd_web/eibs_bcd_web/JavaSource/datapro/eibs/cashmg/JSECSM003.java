package datapro.eibs.cashmg;
/**
 * Mantenimiento Convenios de Motor de pagos
 * Creation date: (10/25/17)
*/
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ECSM00301Message;
import datapro.eibs.beans.ECSM00302Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;
import datapro.eibs.beans.JBObjList;


public class JSECSM003 extends JSEIBSServlet { 
	 
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
			case 8 : // Request old Record
			case 10 : // Submit the Record for update
				procActionRec_C(user, req, res, session, screen);
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
			mp = new MessageProcessor("ECSM00301");
			ECSM00301Message msg = (ECSM00301Message) mp.getMessageRecord("ECSM00301");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ECSM003");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0001");
			if (screen == 1) {
				userPO.setPurpose("MAINTENANCE");
			} else {
				userPO.setPurpose("INQUIRY");
			}
			msg.setE01NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			msg.setE01MEGTIP((req.getParameter("SEARCHCDE") == null ? userPO.getHeader2() : req.getParameter("SEARCHCDE")));
			userPO.setHeader2(msg.getE01MEGTIP());
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
		forward("ECSM003_message_cash_management_list.jsp", req, res);
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
			mp = new MessageProcessor("ECSM00301");
			ECSM00301Message msg = (ECSM00301Message) mp.getMessageRecord("ECSM00301");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ECSM003");
			msg.setH01TIMSYS(getTimeStamp());
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
			
			if (screen == 5) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {				
				}
			}
			
			if (screen != 5){
				msg.setE01MEGBNK(req.getParameter("E01MEGBNK"));
				msg.setE01MEGTIP(req.getParameter("E01MEGTIP"));
				msg.setE01MEGEVT(req.getParameter("E01MEGEVT"));
				msg.setE01MEGRES(req.getParameter("E01MEGRES"));
				userPO.setBank(req.getParameter("E01MEGBNK"));

			}
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 2 || screen == 3 || screen == 4) {
					forward("ECSM003_message_cash_management_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("ECSM003_message_cash_management.jsp", req, res);
				}

			} else {
				ses.setAttribute("msgRcd", newmessage);
				if (screen == 5 || screen == 4) {     // Update or Delete
					res.sendRedirect(srctx + "/servlet/datapro.eibs.cashmg.JSECSM003?SCREEN=1&SEARCHCDE=" + userPO.getHeader2());	
				} else {
					forward("ECSM003_message_cash_management.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	// SCREEN = 2,3,5
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
			mp = new MessageProcessor("ECSM00302");
			ECSM00302Message msg = (ECSM00302Message) mp.getMessageRecord("ECSM00302");
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("ECSM003");
			msg.setH02TIMSYS(getTimeStamp());
			switch (screen) {
				case 8 : // Request old Record
					msg.setH02OPECOD("0003");
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

			}
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 8) {
					forward("ECSM003_params_cash_management.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("ECSM003_params_cash_management.jsp", req, res);
				}

			} else {
				ses.setAttribute("msgRcd", newmessage);
				if (screen == 10) {     // Update or Delete
					res.sendRedirect(srctx + "/servlet/datapro.eibs.cashmg.JSECSM003?SCREEN=8&SEARCHCDE=" + userPO.getHeader2());	
				} else {
					forward("ECSM003_params_cash_management.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}
	
	
}