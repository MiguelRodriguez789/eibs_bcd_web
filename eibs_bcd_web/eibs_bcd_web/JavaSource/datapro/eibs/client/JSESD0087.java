package datapro.eibs.client; 
/**
 * Maintenance of Clients User Type 
 * Creation date: (09/12/11)
 * @author: Carlos Castillo
 * 
 * 	// List of Options
 * 	//
 *	// SCREEN =    1	Send List of Clients User Type
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

public class JSESD0087 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		switch (screen) {
			// Requests List 
			case 1 :
			case 6 :	
				procReqList(user, req, res, session, screen);
				break;
			case 2 : // Request new Record
			case 3 : // Request old Record
			case 4 : // Delete record	
			case 5 : // Submit the Record for update
			case 10: // Send Record to Customers Work filw	
				procActionRec(user, req, res, session, screen);
				break;
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	// SCREEN = 1, 6 
	// Send List of Clients User Type  
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		String searchType = "";
		try {
			mp = new MessageProcessor("ESD0087");
			ESD008701Message msg = (ESD008701Message) mp.getMessageRecord("ESD008701");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD0087");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0001");
			if (screen == 1) {
				userPO.setPurpose("MAINTENANCE");
			} else {
				userPO.setPurpose("INQUIRY");
			}
			try {
				msg.setE01NUMREC(req.getParameter("FromRecord"));
			} catch (Exception e) {
				msg.setE01NUMREC("0"); 
			}
			try {
				searchType = req.getParameter("SEARCHTYPE");
			} catch (Exception e) { }
			if (searchType == null) {
				searchType = "C";
			}
			if (searchType.equals("C")) {
				try {
					msg.setE01CUN(req.getParameter("SEARCHCDE"));
				} catch (Exception e) { 
					msg.setE01CUN("");
				}
			} else if (searchType.equals("S")) {
				try {
					msg.setE01SHN(req.getParameter("SEARCHCDE"));
				} catch (Exception e) {	
					msg.setE01SHN("");
				}
			} else if(searchType.equals("I")) {
				try {
					msg.setE01IDN(req.getParameter("SEARCHCDE"));
				} catch (Exception e) {
					msg.setE01IDN("");
				}
			}
			msg.setH01FLGWK1(searchType);
			userPO.setType(msg.getH01FLGWK1());
			try {
				userPO.setHeader11(req.getParameter("SEARCHCDE"));
			} catch (Exception e) { }
			try {
				userPO.setHeader20(req.getParameter("PASCODE"));
			} catch (Exception e) {
			}
			if (userPO.getHeader20() == null) {
				userPO.setHeader20("N");
			}
			userPO.setCusNum(msg.getE01CUN());
			userPO.setCusName(msg.getE01SHN());
			userPO.setIdentifier(msg.getE01IDN());
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("ESD0087List", list);
			}
			forward("ESD0087_client_users_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	// SCREEN = 2,3,5, 10
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
			mp = new MessageProcessor("ESD0087");
			ESD008701Message msg = (ESD008701Message) mp.getMessageRecord("ESD008701");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD0087");
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
				case 10: // Submit the Record to move to Customers Work file
					msg.setH01OPECOD("0010");
					break;	
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
			// Get key field
			try {
				msg.setE01CUN(req.getParameter("E01CUN"));
			} catch (Exception e) {
				msg.setE01CUN("0");
			}
			if (screen == 5) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {				
				}
			}
			
			msg.setH01FLGWK1(""); 
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 2 || screen == 3 || screen == 4) {
					forward("ESD0087_client_users_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("ESD0087Record", newmessage);
					forward("ESD0087_client_user.jsp", req, res);
				}

			} else {
				ses.setAttribute("ESD0087Record", newmessage);
				if (screen == 4 || screen == 5 || screen == 10) {
					forwardOnSuccess("ESD0087_client_user_confirm.jsp", req, res);
					//res.sendRedirect(super.srctx + "/servlet/datapro.eibs.client.JSESD0087?SCREEN=1&FromRecord=0");
				} else {
					forwardOnSuccess("ESD0087_client_user.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

}