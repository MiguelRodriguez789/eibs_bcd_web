package datapro.eibs.client;
/**
 * Exonerados
 * Creation date: (10/05/09)
 * @author: Martha Linet Riaño
 * Vendor Master
 * 	// List of Options
 * 	//
 *	// SCREEN =    1	Send List 
 *	// SCREEN =    2    Request new record
 *	// SCREEN =    3    Request old record
 *	// SCREEN =    4	Delete record 
 *	// SCREEN =    5	Submit the record for Update 
 * 	// SCREEN =    15	Submit the record for Customer Information 
 *  // SCREEN =    6    Inquiry
 */
import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class JSESD9010 extends JSEIBSServlet { 
	 
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
			case 15 : // Submit the Record for Customer Information
				procActionRec(user, req, res, session, screen);
				break;
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	// SCREEN = 1 
	// Send List of Vendors Master  
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("ESD9010");
			ESD901001Message msg = (ESD901001Message) mp.getMessageRecord("ESD901001");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD9010");
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
				msg.setE01CUECUN(req.getParameter("SEARCHCDE"));
			} catch (Exception e) {
				msg.setE01CUECUN("0");
			}
			userPO.setCusNum(msg.getE01CUECUN());
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("ESD9010List", list);
			}
			forward("ESD9010_exonerated_client_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	// SCREEN = 2,3,4,5
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
			mp = new MessageProcessor("ESD9010");
			ESD901001Message msg = (ESD901001Message) mp.getMessageRecord("ESD901001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD9010");
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
				case 15 : // Submit the Record for Customer Information
					msg.setH01OPECOD("0015");
					break;	
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
			//	 Get key field
			try {
				msg.setE01CUECUN(req.getParameter("E01CUECUN"));
			} catch (Exception e) {
				msg.setE01CUECUN("0");
			}
			try {
				msg.setE01CUEEXY(req.getParameter("E01CUEEXY"));
			} catch (Exception e) {
				msg.setE01CUEEXY("2011");
			}
			try {
				msg.setE01CUEEXM(req.getParameter("E01CUEEXM"));
			} catch (Exception e) {
				msg.setE01CUEEXM("0");
			}
			try {
				msg.setE01CUEEXD(req.getParameter("E01CUEEXD"));
			} catch (Exception e) {
				msg.setE01CUEEXD("0");
			}
			if (screen == 5) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {				
				}
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
				if (screen == 2 || screen == 3 || screen == 4) {
					forward("ESD9010_exonerated_client_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("ESD9010Record", newmessage);
					forward("ESD9010_exonerated_clients_detail.jsp", req, res);
				}
			} else {
				if (screen == 4 || screen == 5 || screen == 15) {
					redirectToPage("/servlet/datapro.eibs.client.JSESD9010?SCREEN=1&FromRecord=0", res);
				} else {
					ses.setAttribute("ESD9010Record", newmessage);
					forwardOnSuccess("ESD9010_exonerated_clients_detail.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}
}