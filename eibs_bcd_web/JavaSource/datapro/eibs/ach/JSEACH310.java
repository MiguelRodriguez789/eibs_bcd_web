package datapro.eibs.ach;
/**
 * Maintenance of ACH Batch Entry 
 * Creation date: (06/17/08)
 * @author: Carlos Castillo
 * ACH Batches 
 * 	// List of Options
 * 	//
 *	// SCREEN =    1	Send List of ACH Batches 
 *	// SCREEN =    2    Request new record
 *	// SCREEN =    3    Request old record
 *	// SCREEN =    4	Delete record  
 *	// SCREEN =    5	Submit the record for Update
 *  // SCREEN =    10	Send List of ACH Batches for Approval
 *  // SCREEN =    11	Send List of ACH Batches for Inquiry
 *  // SCREEN =    15	Send Batch for Approval 
 */
import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class JSEACH310 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		switch (screen) {
			// Requests List 
			case 1  :
			case 10 :
			case 11 :	
				procReqList(user, req, res, session, screen);
				break;
			case 2  : // Request new Record
			case 3  : // Request old Record
			case 4  : // Delete record	
			case 5  : // Submit the Record for update	
			case 15 : // Submit Batch for Approval
			
				procActionRec(user, req, res, session, screen);
				break;
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	// SCREEN = 1 
	// Send List of ACH Batches  
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("EACH310");
			EACH31001Message msg = (EACH31001Message) mp.getMessageRecord("EACH31001");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EACH310");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0001");
			switch (screen) {
			case 1  : // Pending Batches List 
				msg.setH01OPECOD("0001");
				userPO.setPurpose("MAINTENANCE");
				break;
			case 10 : // Pending Batches for Approval List
				msg.setH01OPECOD("0010");
				userPO.setPurpose("APPROVAL");
				break;
			case 11 : // Batches Inquiry List
				msg.setH01OPECOD("0011");
				userPO.setPurpose("INQUIRY");
				break;	
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
			try {
				msg.setE01NUMREC(req.getParameter("FromRecord"));
			} catch (Exception e) {
				msg.setE01NUMREC("0"); 
			}
			try {
				msg.setE01ACBBTH(req.getParameter("SEARCHCDE"));
			} catch (Exception e) {
				msg.setE01ACBBTH("");
			}
			userPO.setProdCode(msg.getE01ACBBTH());
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("EACH310List", list);
			}
			forward("EACH310_ach_batches_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	// SCREEN = 2,3,5
	// Get or Process the Record  
	//
	protected void procActionRec(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send data
		try {
			mp = new MessageProcessor("EACH310");
			EACH31001Message msg = (EACH31001Message) mp.getMessageRecord("EACH31001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EACH310");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
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
				case 15: // Submit the Batch for Approval
					msg.setH01OPECOD("0015");
					userPO.setPurpose("APPROVAL");
					break;
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
			//	Get key fields
			try {
				msg.setE01ACBBTH(req.getParameter("E01ACBBTH"));
			} catch (Exception e) {
				msg.setE01ACBBTH("");
			}
			
			if (screen == 5) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {	}
			}				
			msg.setE01ACT(" ");
			msg.setH01FLGWK1(""); 
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 2 || screen == 3 || screen == 4 || screen == 15) {
					forward("EACH310_ach_batches_list.jsp", req, res);
				} else {
					//	Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("EACH310Record", newmessage);
					forward("EACH310_ach_batch.jsp", req, res);
				}

			} else {
				if (screen == 4 || screen == 5) {
					redirectToPage("/servlet/datapro.eibs.ach.JSEACH310?SCREEN=1&FromRecord=0", res);
				} else if (screen == 15) {
					redirectToPage("/servlet/datapro.eibs.ach.JSEACH310?SCREEN=10&FromRecord=0", res);
				} else {
					ses.setAttribute("EACH310Record", newmessage);
					forwardOnSuccess("EACH310_ach_batch.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

}