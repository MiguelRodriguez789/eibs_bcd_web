package datapro.eibs.ach;
/**
 * Maintenance of ACH Transactions  
 * Creation date: (07/22/08)
 * @author: Carlos Castillo
 * 
 *	// ACH Transactions
 *	// List of Options
 *	//
 *	// SCREEN =    1	Send List of ACH Transactions
 *	// SCREEN =    2    Request new record 
 *	// SCREEN =    5	Submit the list for Update
 */ 
import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class JSEACH130 extends JSEIBSServlet { 
	 
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
	// Send List of ACH Transactions 
	//
	private synchronized void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("EACH130");
			EACH13001Message msg = (EACH13001Message) mp.getMessageRecord("EACH13001"); 
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EACH130");
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
				ses.setAttribute("EACH130List", list);
			}
			forwardOnSuccess("EACH130_ach_transactions_list.jsp", req, res);
			
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
		EACH13001Message msg = null;
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
			mp = new MessageProcessor("EACH130");
			msg = (EACH13001Message) mp.getMessageRecord("EACH13001");
			
			for (int row = 0; row < totRows ; row++) {
				msg.setH01USERID(user.getH01USR());
				msg.setH01PROGRM("EACH130");
				msg.setH01TIMSYS(getTimeStamp());  
				msg.setH01SCRCOD("01");
				msg.setH01OPECOD("0005");
						
				msg.setE01ACTCDE(req.getParameter("E01ACTCDE_" + row));
				msg.setE01ACTDSC(req.getParameter("E01ACTDSC_" + row));
				try {
					msg.setE01ACTDC(req.getParameter("E01ACTDC_" + row));
				} catch (Exception e) {
					msg.setE01ACTDC("D");
				}
				try {
					msg.setE01ACTDYS(req.getParameter("E01ACTDYS_" + row));
				} catch (Exception e) {
					msg.setE01ACTDYS("0");
				}
				try {
					msg.setE01ACTTYP(req.getParameter("E01ACTTYP_" + row));
				} catch (Exception e) {
					msg.setE01ACTTYP("T");
				}
				msg.setE01ACTITC(req.getParameter("E01ACTITC_" + row));
				msg.setE01ACTRET(req.getParameter("E01ACTRET_" + row));
				if (req.getParameter("E01ACTAMT_" + row)== null) {
					msg.setE01ACTAMT("N");
				} else { msg.setE01ACTAMT("Y"); }
				if (req.getParameter("E01ACTAT1_" + row)== null) {
					msg.setE01ACTAT1("   ");
				} else { msg.setE01ACTAT1("DDA"); }
				if (req.getParameter("E01ACTAT2_" + row)== null) {
					msg.setE01ACTAT2("   ");
				} else { msg.setE01ACTAT2("SAV"); }
				if (req.getParameter("E01ACTAT3_" + row)== null) {
					msg.setE01ACTAT3("   ");
				} else { msg.setE01ACTAT3("LNS"); }
				if (req.getParameter("E01ACTAT4_" + row)== null) {
					msg.setE01ACTAT4("   ");
				} else { msg.setE01ACTAT4("CCR"); }
				if (req.getParameter("E01ACTAT5_" + row)== null) {
					msg.setE01ACTAT5("   ");
				} else { msg.setE01ACTAT5("GLN"); }
				
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
			msg.setH01PROGRM("EACH130");
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
				forward("EACH130_ach_transactions_list.jsp", req, res);
			} else {
				redirectToPage("/servlet/datapro.eibs.ach.JSEACH130?SCREEN=1&FromRecord=0", res);
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

}