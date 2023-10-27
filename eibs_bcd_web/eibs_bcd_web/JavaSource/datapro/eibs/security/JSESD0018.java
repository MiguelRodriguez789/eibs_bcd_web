package datapro.eibs.security; 
/**
 * Maintenance of Cumad Records
 * Creation date: (09/15/11)
 * @author: Carlos Castillo
 * 
 * 	// List of Options
 * 	//
 *	// SCREEN =    1	Send List of Cumad Records
 *	// SCREEN =    2    Request new record
 *	// SCREEN =    3    Request old record
 *	// SCREEN =    4	Delete record 
 *	// SCREEN =    5	Submit the record for Update 
 */
import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class JSESD0018 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		switch (screen) {
			// Requests List 
			case 1 :
			case 8 :
				procReqList(user, req, res, session, screen);
				break;
			case 6 :
			case 7 :
			case 14: // Approval / Rejected / Suspended	
				procReqUsrList(user, req, res, session, screen);
				break;	
			case 2 : // Request new Record
			case 3 : // Request old Record
			case 4 : // Delete record	
			case 5 : // Submit the Record for update
			case 15: // Approval / Rejected / Suspended
				procActionRec(user, req, res, session, screen);
				break;
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	// SCREEN = 1 
	// Send List of CntrlDBa for User Records  
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		String searchType = "";
		try {
			mp = new MessageProcessor("ESD0018");
			ESD001801Message msg = (ESD001801Message) mp.getMessageRecord("ESD001801");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD0018");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0001");
			if (screen == 1) {
				userPO.setPurpose("MAINTENANCE");
			} else if (screen == 8) {
				msg.setH01OPECOD("0008");
				userPO.setPurpose("APPROVAL");
			} else {
				userPO.setPurpose("INQUIRY");
			}
			try {
				msg.setE01NUMREC(req.getParameter("FromRecord"));
			} catch (Exception e) {
				msg.setE01NUMREC("0"); 
			}
			
			
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("ESD0018List", list);
			}
			forward("ESD0018_users_access_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	// SCREEN = 7, 6 , 14
	// Send List of Cntrlbth Records  
	//
	protected void procReqUsrList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		String searchType = "";
		try {
			mp = new MessageProcessor("ESD0018");
			ESD001801Message msg = (ESD001801Message) mp.getMessageRecord("ESD001801");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD0018");
			msg.setH01TIMSYS(getTimeStamp());
			if (screen == 7) {
				userPO.setPurpose("MAINTENANCE");
				msg.setH01OPECOD("0007");
			} else {
				userPO.setPurpose("INQUIRY");
				msg.setH01OPECOD("0014");
			}
			try {
				msg.setE01NUMREC(req.getParameter("FromRecord"));
			} catch (Exception e) {
				msg.setE01NUMREC("0"); 
			}
			try {
				userPO.setHeader11(req.getParameter("SEARCHCDE"));
			} catch (Exception e) { 
			}
			
			try {
				msg.setE01USR(req.getParameter("E01USR"));
			} catch (Exception e) { 
				msg.setE01USR("");
			}
			try {
				msg.setD01USR(req.getParameter("D01USR"));
			} catch (Exception e) { 
				msg.setD01USR("");
			}

			userPO.setHeader2(msg.getE01USR());
			userPO.setHeader3(msg.getD01USR());
			
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("ESD0018List", list);
			}
			forward("ESD0018_users_bank_branch_access_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	
	// SCREEN = 2,3,5,15
	// Get or Process the Record  
	//
	protected void procActionRec(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;
		String dtlPage = "";
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send data
		try {
			mp = new MessageProcessor("ESD0018");
			ESD001801Message msg = (ESD001801Message) mp.getMessageRecord("ESD001801");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD0018");
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
				case 15 : // 
			        msg.setH01OPECOD("0015");
			        userPO.setPurpose("APPROVAL");
				    break;
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
			// Get key field
			try {
				msg.setE01USR(userPO.getHeader2());
			} catch (Exception e) {
				msg.setE01USR("");
			}
			try {
				msg.setE01BNK(req.getParameter("E01BNK"));
			} catch (Exception e) {
				msg.setE01BNK("0");
			}
			try {
				msg.setE01BRN(req.getParameter("E01BRN"));
			} catch (Exception e) {
				msg.setE01BRN("0");
			}
			try {
				msg.setD01USR(userPO.getHeader3());
			} catch (Exception e) {
				msg.setD01USR("");
			}
			try {
				msg.setE01ACT(req.getParameter("E01ACT"));
			} catch (Exception e) {
				msg.setE01ACT("W");
			}
			if (screen == 5) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {				
				}
			}
			//
			dtlPage = "ESD0018_users_bank_branch_access.jsp";
			
			msg.setH01FLGWK1(""); 
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 2 || screen == 3 || screen == 4 || screen == 15) {
					forward("ESD0018_users_bank_branch_access_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("ESD0018Record", newmessage);
					forward(dtlPage, req, res);
				}

			} else {
				ses.setAttribute("ESD0018Record", newmessage);
				if (screen == 4 || screen == 5 ) {
					res.sendRedirect(super.srctx + "/servlet/datapro.eibs.security.JSESD0018?SCREEN=7" +
						"&E01USR=" + userPO.getHeader2().trim() +
						"&D01USR=" + userPO.getHeader3().trim() +
						"&FromRecord=0");
				} else {
					    if (screen == 15) {
					    	res.sendRedirect(super.srctx + "/servlet/datapro.eibs.security.JSESD0018?SCREEN=14" +
									"&E01USR=" + userPO.getHeader2().trim() +
									"&D01USR=" + userPO.getHeader3().trim() +
									"&FromRecord=0");
					    }
					    else{	
							forwardOnSuccess(dtlPage, req, res);
					    }
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

}