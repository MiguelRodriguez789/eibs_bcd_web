package datapro.eibs.ach;
/**
 * Maintenance of ACH Entry Classes  
 * Creation date: (07/21/08)
 * @author: Carlos Castillo
 * 
 *	// ACH Entry Classes
 *	// List of Options
 *	//
 *	// SCREEN =    1	Send List of ACH Entry Classes
 *	// SCREEN =    2    Request new record 
 *	// SCREEN =    5	Submit the list for Update
 */ 
import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class JSEACH120 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
	
			switch (screen) {
			// Requests List 
			case 1 :
			case 2 :    // With new Row
				procReqList(user, req, res, session, screen);
				break;	
			//  Submit the list for update
			case 5 :
				procActionList(user, req, res, session);
				break;
			default :
				redirectToPage(SuperServlet.devPage, res);
				break;
				}
	}
	
	// SCREEN = 1 or 2
	// Send List of ACH Entry Classes  
	//
	private synchronized void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("EACH120");
			EACH12001Message msg = (EACH12001Message) mp.getMessageRecord("EACH12001"); 
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EACH120");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			switch (screen) {
				case 2 : // Request new Record
					msg.setH01OPECOD("0001");
					break;
				default : 
					msg.setH01OPECOD("0002");
					break;
			}	
			try {
				msg.setE01NUMREC(req.getParameter("FromRecord"));
			} catch (Exception e) {
				msg.setE01NUMREC("0");
			}
			// Send Message	
			mp.sendMessage(msg);
			// Receive List
			JBObjList list = (JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("EACH120List", list);
			}
			forward("EACH120_ach_classes_list.jsp", req, res);
			
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	// SCREEN = 5
	// Process the List (Sending all rows to Socket) 
	//
	protected void procActionList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession ses)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		EACH12001Message msg = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		userPO.setPurpose("MAINTENANCE");
		String nextrows = "0";
		String currrows = "0"; 
		int totRows = Integer.parseInt(req.getParameter("TOTROWS"));
		try{
			nextrows = req.getParameter("NEXTROWS");
		} catch (Exception e) {}
		try{
			currrows = req.getParameter("CURRROWS");
		} catch (Exception e) {}
		
		// Send data
		try { 
			mp = new MessageProcessor("EACH120");
			msg = (EACH12001Message) mp.getMessageRecord("EACH12001");
			
			for (int row = 0; row < totRows ; row++) {
				msg.setH01USERID(user.getH01USR());
				msg.setH01PROGRM("EACH120");
				msg.setH01TIMSYS(getTimeStamp());  
				msg.setH01SCRCOD("01");
				msg.setH01OPECOD("0005");
						
				msg.setE01ACECDE(req.getParameter("E01ACECDE_" + row));
				msg.setE01ACEDSC(req.getParameter("E01ACEDSC_" + row));
				if (req.getParameter("E01ACERAP_" + row)== null) {
					msg.setE01ACERAP("N");
				} else {
					msg.setE01ACERAP("Y");   
				}
				if (req.getParameter("E01ACERAT_" + row)== null) {
					msg.setE01ACERAT("N");
				} else {
					msg.setE01ACERAT("Y");   
				}
				try {
					msg.setE01ACEADR(req.getParameter("E01ACEADR_" + row));
				} catch (Exception e) {
					msg.setE01ACEADR("O");
				}
				msg.setE01ACEADL(req.getParameter("E01ACEADL_" + row));
				msg.setE01ACEAMT(req.getParameter("E01ACEAMT_" + row));
				msg.setE01ACEDFI(req.getParameter("E01ACEDFI_" + row));
				
				if (req.getParameter("E01ACT_" + row)== null) {
					msg.setE01ACT(" ");
				} else {
					msg.setE01ACT("D");   // Delete Record
				}	
				msg.setH01FLGWK1("");
				// Send Message
				mp.sendMessage(msg);
			} // EndFor
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EACH120");
			msg.setH01TIMSYS(getTimeStamp());  
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0005");
			msg.setH01FLGWK1("S");  // End of List
			mp.sendMessage(msg);
			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				forward("EACH120_ach_classes_list.jsp", req, res);
			} else {
				redirectToPage("/servlet/datapro.eibs.ach.JSEACH120?SCREEN=1&FromRecord=0", res);
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

}