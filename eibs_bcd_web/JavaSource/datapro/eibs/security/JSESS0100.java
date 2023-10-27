package datapro.eibs.security;
/**
 * Security - Menu Options for Users & Groups  
 * Creation date: (11/25/11)
 * @author: Carlos Castillo
 *  
 * 	// List of Options
 * 	//
 *	// SCREEN =    1	Send List of Menu Options & Users 
 *	// SCREEN =    2    Update Options for User or Group 
 */	

import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class JSESS0100 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		switch (screen) {
			// Requests List 
			case 1  :
				procReqList(user, req, res, session, screen);
				break;
			case 2  : // Update User Options
				procActionDS(user, req, res, session);
				break;
			default :
				forward(SuperServlet.devPage, req, res);
				break;  
		}
	}

	// SCREEN = 1 
	// Send List of Menu Options & Users/Groups  
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("ESS0100");
			//
			// Products List
			//
			ESS010001Message msg = (ESS010001Message) mp.getMessageRecord("ESS010001");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESS0100");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0001");
			msg.setE01NUMREC("0"); 
			try {
				msg.setR01WEBUID(req.getParameter("R01WEBUID"));
			} catch (Exception e) {
				msg.setR01WEBUID(" ");
			}
			try {
				msg.setR01WEBTYP(req.getParameter("R01WEBUID"));
			} catch (Exception e) {
				msg.setR01WEBTYP(" ");
			}
			userPO.setHeader1(msg.getR01WEBUID());
			try {
				userPO.setHeader2(req.getParameter("USRDSC"));
			} catch (Exception e) {
				userPO.setHeader2(" ");
			}
			if (userPO.getHeader2() == null) {
				userPO.setHeader2(" ");
			}
			userPO.setHeader3(msg.getR01WEBTYP());
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("optList", list);
			}
			//
			// Users & Groups List
			//
			mp = null;
			mp = new MessageProcessor("ESS0100");
			ESS010002Message msgC = (ESS010002Message) mp.getMessageRecord("ESS010002");
			// Send Initial data
			msgC.setH02USERID(user.getH01USR());
			msgC.setH02PROGRM("ESS0100");
			msgC.setH02TIMSYS(getTimeStamp());
			msgC.setH02SCRCOD("01");
			msgC.setH02OPECOD("0001");
			try {
				msgC.setE02NUMREC(req.getParameter("FromRecord"));
			} catch (Exception e) {
				msgC.setE02NUMREC("0"); 
			}
			// Send Message	
			mp.sendMessage(msgC);
			// Receive List
			JBObjList listC =
				(JBObjList) mp.receiveMessageRecordList("E02INDOPE","E02NUMREC");
			if (mp.hasError(listC)) {
				ses.setAttribute("error", mp.getError(listC));
			} else {
				ses.setAttribute("userList", listC);
			}

			forward("ESS0100_user_menu.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}


	// SCREEN = 2
	// Update User/Group Options  (Sending all rows to Socket) 
	//
	protected void procActionDS(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession ses)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		ESS010001Message msg = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		userPO.setPurpose("MAINTENANCE");
		int totRows = Integer.parseInt(req.getParameter("TOTROWS"));
		
		// Send data
		try { 
			mp = new MessageProcessor("ESS0100");
			msg = (ESS010001Message) mp.getMessageRecord("ESS010001");
			
			for (int row = 0; row < totRows ; row++) {
				msg.setH01USERID(user.getH01USR());
				msg.setH01PROGRM("ESS0100");
				msg.setH01TIMSYS(getTimeStamp());  
				msg.setH01SCRCOD("01");
				msg.setH01OPECOD("0002");
						
				msg.setR01WEBUID(req.getParameter("R01WEBUID"));
				msg.setE01WEBLEV(req.getParameter("E01WEBLEV_" + row));
				msg.setE01WEBDEN(req.getParameter("E01WEBDEN_" + row));
				msg.setE01WEBOPT(req.getParameter("E01WEBOPT_" + row));
				if (req.getParameter("E01ACT_" + row)== null) {
					msg.setE01ACT("0");
				} else {
					msg.setE01ACT("1");   
				}
				msg.setH01FLGWK1("");
				// Send Message
				mp.sendMessage(msg);
			} // EndFor
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESS0100");
			msg.setH01TIMSYS(getTimeStamp());  
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0002");
			msg.setH01FLGWK1("S");  // End of List
			mp.sendMessage(msg);
			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				forward("ESS0100_user_menu.jsp", req, res);
			} else {
				redirectToPage("/servlet/datapro.eibs.security.JSESS0100?SCREEN=1&FromRecord=0", res);
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	
}