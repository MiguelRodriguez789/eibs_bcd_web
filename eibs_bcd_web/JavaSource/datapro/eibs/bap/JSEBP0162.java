package datapro.eibs.bap;
/**
 * Maintenance of Source Document Payment Plan 
 * Creation date: (04/14/11)
 * @author: Martha L. Riaño
 * 
 *  // Source Document - Payment Plan
 * 	// List of Options
 * 	//
 *	// SCREEN =    1	Send List of Details lines for a Source Document 
 */
import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class JSEBP0162 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		
		UserPos userPO = null;
		userPO = getUserPos(req);

		switch (screen) {
			 
			case 1 : // Requests List
				procReqList(user, req, res, session, screen);
				break;
			default :
				redirectToPage(SuperServlet.devPage, res);
				break;
				}
	}

	// SCREEN = 1 
	// Send List of Payments  
	//
	private synchronized void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("EBP0162");
			EBP016201Message msg = (EBP016201Message) mp.getMessageRecord("EBP016201");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EBP0162");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0001");
				
			try {
				msg.setE01NUMREC(req.getParameter("FromRecord"));
			} catch (Exception e) {
				msg.setE01NUMREC("0"); 
			}
			try {
				msg.setE01BPPNUM(req.getParameter("DOCUMENTO"));
			} catch (Exception e) {
				msg.setE01BPPNUM("0");
			}		
			userPO.setIdentifier(msg.getE01BPPNUM());
			
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list = (JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("EBP0162List", list);
			}
			forward("EBP0162_payment_inquiry_list.jsp", req, res);
			
		} finally {
			if (mp != null)
				mp.close();
		}
	}

}