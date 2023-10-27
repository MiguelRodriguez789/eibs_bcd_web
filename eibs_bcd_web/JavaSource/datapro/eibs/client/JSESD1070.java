package datapro.eibs.client;
/**
 * Parametrizacion Nivel de Riesgo
 * Creation date: (09/13/21)
 
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
import datapro.eibs.beans.ECSM00101Message;
import datapro.eibs.beans.ESD107001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;
import datapro.eibs.beans.JBObjList;


public class JSESD1070 extends JSEIBSServlet { 
	 
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
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	// SCREEN = 1
	// Send List of Cash Management  
	//
		protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession session, int screen)
		throws ServletException, IOException {

		UserPos userPO = null; 
		MessageProcessor mp = null;

		try {
			mp = new MessageProcessor("ESD107001");
			ESD107001Message msg = (ESD107001Message) mp.getMessageRecord("ESD107001");
			userPO = (datapro.eibs.beans.UserPos) session.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD1070");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0001");
			if (screen == 1) {
				userPO.setPurpose("MAINTENANCE");
			} else {
				userPO.setPurpose("INQUIRY");
			}
			msg.setE01NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			msg.setE01PHAS((req.getParameter("SEARCHCDE") == null ? userPO.getHeader2() : req.getParameter("SEARCHCDE")));
			userPO.setHeader2(msg.getE01PHAS());
			// Send Message	
			mp.sendMessage(msg);
			session.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
			} else {
				session.setAttribute("msgList", list);
			}
		forward("ESD1070_client_param_riesgo_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	// SCREEN = 2,3,5
	// Get or Process the Record  
	//
	protected void procActionRec(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession session, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) session.getAttribute("userPO");
		
		// Send data
		try {
			mp = new MessageProcessor("ESD107001");
			ESD107001Message msg = (ESD107001Message) mp.getMessageRecord("ESD107001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD1070");
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
				msg.setE01TLG(req.getParameter("E01TLG"));
				msg.setE01PHAS(req.getParameter("E01PHAS"));
			}
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			session.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				session.setAttribute("error", newmessage);
				if (screen == 2 || screen == 3 || screen == 4) {
					forward("ESD1070_client_param_riesgo_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					session.setAttribute("msgRcd", newmessage);
					forward("ESD1070_client_param_riesgo.jsp", req, res);
				}

			} else {
				session.setAttribute("msgRcd", newmessage);
				if (screen == 5 || screen == 4) {     // Update or Delete
					res.sendRedirect(srctx + "/servlet/datapro.eibs.client.JSESD1070?SCREEN=1&SEARCHCDE=" + userPO.getHeader2());	
				} else {
					forward("ESD1070_client_param_riesgo.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}
	
}