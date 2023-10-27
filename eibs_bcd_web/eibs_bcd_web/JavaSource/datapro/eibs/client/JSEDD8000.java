package datapro.eibs.client;
/**
 * Verify Biometric from Account Holders  
 * Creation date: (06/25/18)
 * @author: Carlos Castillo
 * 
 *	// List of Options
 *	//
 *	// SCREEN =    1	Send Account Search
 *	// SCREEN =    2    Send List of Accounts Holders 
 *	//
 */ 
import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class JSEDD8000 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
	
			switch (screen) {
			// Request Account Search 
			case 1 :
				procAccShr(user, req, res, session, screen);
				break;	
			// Send Account Holder List	
			case 2 :   
				procReqList(user, req, res, session, screen);
				break;
			case 5 :   
				sendConfirmation(user, req, res, session);
				break;
			case 6 :   
				sendRedirect(user, req, res, session);
				break;	

			default :
				redirectToPage(SuperServlet.devPage, res);
				break;
				}
	}
	
	
	protected void procAccShr(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses, int screen) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("RT");
		userPO.setPurpose("BIOMETRIC");
		userPO.setRedirect("/servlet/datapro.eibs.client.JSEDD8000?SCREEN=2");
		userPO.setProdCode("04");
		//Others Parameters
		userPO.setHeader1("E01ACMACC");
		userPO.setHeader2("H01FLGWK2");
		ses.setAttribute("userPO", userPO);
		ses.setAttribute("error", new ELEERRMessage());
		
		forward("GENERIC_account_enter.jsp", req, res);
	}	
	
	// SCREEN = 2
	// Send List of Account Holders  
	//
	private synchronized void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("EDD8000");
			EDD800001Message msg = (EDD800001Message) mp.getMessageRecord("EDD800001"); 
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDD8000");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0002");
			msg.setE01BIOACC((req.getParameter("E01ACMACC") == null ? "0" : req.getParameter("E01ACMACC")));
			msg.setE01NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			userPO.setAccNum(msg.getE01BIOACC());
			// Send Message	
			mp.sendMessage(msg);
			// Receive List
			JBObjList list = (JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("msgList", list);
			}
			userPO.setThereIsMsg(false);
			ses.setAttribute("userPO", userPO);
			forward("EDD8000_biometric_account_holders_list.jsp", req, res);
			
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	// SCREEN = 5
	// Send Confirmation 
	//
	private synchronized void sendConfirmation(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			ses.setAttribute("userPO", userPO);
			forward("EDD8000_biometric_confirm.jsp", req, res);
	
	}
	

	// SCREEN = 6
	// Return to Original Caller 
	//
	private synchronized void sendRedirect(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		if (userPO.getRedirect().equals("") || userPO.getRedirect().equals("/servlet/datapro.eibs.client.JSEDD8000?SCREEN=2")) {
			userPO.setRedirect("/servlet/datapro.eibs.client.JSEDD8000?SCREEN=1");
		}
		userPO.setThereIsMsg(true);
		ses.removeAttribute("searchParameters");
		ses.setAttribute("userPO", userPO);
		flexLog("Redirect: " + userPO.getRedirect());
		redirect(userPO.getRedirect(), res);				
	}
	
}