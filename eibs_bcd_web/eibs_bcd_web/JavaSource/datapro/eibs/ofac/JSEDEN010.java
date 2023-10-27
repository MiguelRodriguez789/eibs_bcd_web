package datapro.eibs.ofac; 
/**
 * Denial List - Parameters Maintenance 
 * Creation date: (02/05/12)
 * @author: Carlos Castillo
 * 
 * 	// List of Options
 * 	//
 *	// SCREEN =   1    Send Data for Search Parameter Update
 *  // SCREEN =   2    Update Search Paramaters
 */
import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class JSEDEN010 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		switch (screen) {
			// Requests List 
			case 1 : // Send screen for search Parameters
				procReqSrhPrm(user, req, res, session); 
				break;
			case 2 : // Send screen for search Parameters
				procActionSrhPrm(user, req, res, session); 
				break;

			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}


	// SCREEN = 1  
	// Get & Send Screen for Search Parameters  
	//
	protected void procReqSrhPrm(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = new datapro.eibs.beans.UserPos();
		userPO.setPurpose("MAINTENANCE");

		// Send data
		try {
			mp = new MessageProcessor("EDEN010");
			EDEN01001Message msg = (EDEN01001Message) mp.getMessageRecord("EDEN01001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDEN010");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0002");
			msg.setH01FLGWK1(""); 
			// Send Message 
			mp.sendMessage(msg);

			// Receive Data Message 
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
			}
			newmessage = mp.receiveMessageRecord();
			ses.setAttribute("msgSrc", newmessage);
			forward("EDEN010_search_parameters.jsp", req, res);

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	// SCREEN = 2 
	// Send Search Parameters for Upadte 
	//
	protected void procActionSrhPrm(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		userPO.setPurpose("MAINTENANCE");

		// Send data
		try {
			mp = new MessageProcessor("EDEN010");
			EDEN01001Message msg = (EDEN01001Message) mp.getMessageRecord("EDEN01001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDEN010");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0005");
			// Get all fields in page
			try {
				super.setMessageRecord(req, msg);
			} catch (Exception e) {				
			}
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				newmessage = mp.receiveMessageRecord();
				ses.setAttribute("msgSrc", newmessage);
				forward("EDEN010_search_parameters.jsp", req, res);
			} else {
				newmessage = mp.receiveMessageRecord();
				ses.setAttribute("msgSrc", newmessage);
				forwardOnSuccess("EDEN010_search_parameters_confirm.jsp", req, res);
				}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	
}