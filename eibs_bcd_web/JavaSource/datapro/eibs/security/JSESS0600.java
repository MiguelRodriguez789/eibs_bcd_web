package datapro.eibs.security;
/**
 * Security - Reports for Users & Groups  
 * Creation date: (10/21/13)
 * @author: Martha Riaño
 *  
 * 	// List of Options
 * 	//
 *	// SCREEN =    1	Send List of Reports 
 *	// SCREEN =    2    Update Reports for User or Group 
 */	

import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class JSESS0600 extends JSEIBSServlet { 
	 
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
	// Send List of Reports & Users/Groups  
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("ESS0600");
			//
			// Products List
			//
			ESS060001Message msg = (ESS060001Message) mp.getMessageRecord("ESS060001");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESS0600");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0001");
			msg.setE01NUMREC("0"); 
			try {
				msg.setR01RPTUID(req.getParameter("R01RPTUID"));
			} catch (Exception e) {
				msg.setR01RPTUID(" ");
			}
			try {
				msg.setR01RPTTYP(req.getParameter("R01RPTTYP"));
			} catch (Exception e) {
				msg.setR01RPTTYP(" ");
			}
			userPO.setHeader1(msg.getR01RPTUID());
			try {
				userPO.setHeader2(req.getParameter("USRDSC"));
			} catch (Exception e) {
				userPO.setHeader2(" ");
			}
			if (userPO.getHeader2() == null) {
				userPO.setHeader2(" ");
			}
			userPO.setHeader3(msg.getR01RPTTYP());
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC", 9999);
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("optList", list);
			}
			//
			// Users & Groups List
			//
			mp = null;
			mp = new MessageProcessor("ESS0600");
			ESS060002Message msgC = (ESS060002Message) mp.getMessageRecord("ESS060002");
			// Send Initial data
			msgC.setH02USERID(user.getH01USR());
			msgC.setH02PROGRM("ESS0600");
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

			forward("ESS0600_user_reports.jsp", req, res);
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
		ESS060001Message msg = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		userPO.setPurpose("MAINTENANCE");
		int totRows = Integer.parseInt(req.getParameter("TOTROWS"));
		
		// Send data
		try { 
			mp = new MessageProcessor("ESS0600");
			msg = (ESS060001Message) mp.getMessageRecord("ESS060001");
			
			for (int row = 0; row < totRows ; row++) {
				msg.setH01USERID(user.getH01USR());
				msg.setH01PROGRM("ESS0600");
				msg.setH01TIMSYS(getTimeStamp());  
				msg.setH01SCRCOD("01");
				msg.setH01OPECOD("0002");
						
				msg.setR01RPTUID(req.getParameter("R01RPTUID"));
				// msg.setE01MODRPT(req.getParameter("E01MODRPT"));

				msg.setE01RPTLEV(req.getParameter("E01RPTLEV_" + row));
				if (req.getParameter("E01IBSRPN_" + row)== null) {
					msg.setE01IBSRPN("error");
				} else {
					msg.setE01IBSRPN(req.getParameter("E01IBSRPN_" + row));
				}
				
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
			msg.setH01PROGRM("ESS0600");
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
				forward("ESS0600_user_reports.jsp", req, res);
			} else {
				redirectToPage("/servlet/datapro.eibs.security.JSESS0600?SCREEN=1&FromRecord=0", res);
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	
}