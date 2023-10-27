package datapro.eibs.client;
/**
 * Verify Biometric for Customer Accounts 
 * Creation date: (01/01/19)
 * @author: Yahir Colmenares
 * 
 *	// List of Options
 *	//
 *	// SCREEN =    1	Send Account Search
 *	// SCREEN =    2    Send List of Accounts 
 *	//
 */ 
import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class JSEDD8002 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen)
		throws ServletException, IOException {
	
		switch (screen) {
			// Request Account Search 
			case 1 :
				procAccShr(user, req, res, session, screen);
				break;	
			// Send Account List	
			case 2 :   
				procReqList(user, req, res, session, screen);
				break;
			case 5 :   
				procActRec(user, req, res, session, screen);
				//sendConfirmation(user, req, res, session);
				break;
			case 6 :   
				sendRedirect(user, req, res, session);
				break;	
			default :
				redirectToPage(SuperServlet.devPage, res);
				break;
		}
	}
	
	// SCREEN = 1
	// Send List of Account 
	//
	protected void procAccShr(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses, int screen) 
		throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		ses.setAttribute("error", new ELEERRMessage());
		ses.setAttribute("userPO", userPO);
		forward("EDD8002_biometric_account_enter.jsp", req, res);
		
	}	
	
	// SCREEN = 2
	// Send List of Account
	//
	private synchronized void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		try {
			mp = new MessageProcessor("EDD8002");
			EDD800201Message msg = (EDD800201Message) mp.getMessageRecord("EDD800201"); 
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDD8002");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0002");
			msg.setE01CABCUN((req.getParameter("E01CABCUN") == null ? "0" : req.getParameter("E01CABCUN")));
			msg.setE01NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			userPO.setCusNum(msg.getE01CABCUN());
			// Send Message	
			mp.sendMessage(msg);
			// Receive List
			JBObjList list = (JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				//ses.setAttribute("error", mp.getError(list));
				ses.setAttribute("msgList", null);
			} else {
				ses.setAttribute("msgList", list);
			}
			userPO.setThereIsMsg(false);
			ses.setAttribute("userPO", userPO);
			
			forward("EDD8002_biometric_account_list.jsp", req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
		
	}

	// SCREEN = 5
	// Send Confirmation 
	//
	protected void procActRec(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;
		String page = "";
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send data
		try {
			mp = new MessageProcessor("EDD8002");
			EDD800201Message msg = (EDD800201Message) mp.getMessageRecord("EDD800201");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDD8002");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			switch (screen) {
				case 5 : // Submit the Record for update
					msg.setH01OPECOD("0005");
					break;
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
			// Get key field
			msg.setE01CABCUN(req.getParameter("E01CABCUN") == null ? "0" : req.getParameter("E01CABCUN"));
			msg.setE01CABSTS(req.getParameter("E01CABSTS") == null ? "0" : req.getParameter("E01CABSTS"));
			//msg.setE01IFTLIN(req.getParameter("E01IFTLIN") == null ? " " : req.getParameter("E01IFTLIN"));
			//userPO.setSeqNum(msg.getE01IFTRPN());
			//userPO.setIdentifier(msg.getE01IFTLIN());
			if (screen == 5) {
				// Get all fields in page
				try {
					//super.setMessageRecord(req, msg);
				} catch (Exception e) {				
				}
			}
			
			msg.setH01FLGWK1(""); 
			// Send Message 
			mp.sendMessage(msg);
			page = "EDD8002_biometric_confirm.jsp";

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				forward(page, req, res);
			} else {
				forward(page, req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}
	}

	// SCREEN = 6
	// Return to Original Caller 
	//
	private synchronized void sendRedirect(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		userPO.setRedirect("/servlet/datapro.eibs.client.JSEDD8002?SCREEN=1");
		userPO.setThereIsMsg(true);
		ses.removeAttribute("searchParameters");
		ses.setAttribute("userPO", userPO);
		flexLog("Redirect: " + userPO.getRedirect());
		redirect(userPO.getRedirect(), res);				
	}
	
}