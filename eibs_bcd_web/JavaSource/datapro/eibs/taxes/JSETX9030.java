package datapro.eibs.taxes;
/**
 * Maintenance of ICA Table
 * Creation date: (1/25/12)
 * @author: Martha Linet Riaño
 * ICA Table 
 * 	// List of Options
 * 	//
 *	// SCREEN =    1	Send List 
 *	// SCREEN =    2    Request new record
 *	// SCREEN =    3    Request old record
 *	// SCREEN =    4	Delete record 
 *	// SCREEN =    5	Submit the record for Update 
 *  // SCREEN =    6    Inquiry
 */
import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class JSETX9030 extends JSEIBSServlet { 
	 
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
		String searchType = "";
		try {
			mp = new MessageProcessor("ETX9030");
			ETX903001Message msg = (ETX903001Message) mp.getMessageRecord("ETX903001");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ETX9030");
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
					msg.setE01TXICST(req.getParameter("SEARCHCST"));
				} catch (Exception e) {
					msg.setE01TXICST("");
				}
				
			} else if (searchType.equals("S")) {
				try {
					msg.setE01TXICTY(req.getParameter("SEARCHCTY"));
				} catch (Exception e) {
					msg.setE01TXICTY("");
				}
			
			} else if(searchType.equals("I")) {
				try {
					msg.setE01TXICOD(req.getParameter("SEARCHCOD"));
				} catch (Exception e) {
					msg.setE01TXICOD("");
				}
			}
			
			userPO.setHeader1(msg.getE01TXICST());
			userPO.setHeader2(msg.getE01TXICTY());
			userPO.setHeader3(msg.getE01TXICOD());
			msg.setH01FLGWK1(searchType);
			userPO.setType(msg.getH01FLGWK1());
			
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("ETX9030List", list);
			}
			forward("ETX9030_ica_table_list.jsp", req, res);
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
			mp = new MessageProcessor("ETX9030");
			ETX903001Message msg = (ETX903001Message) mp.getMessageRecord("ETX903001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ETX9030");
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
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
			//	 Get key field
			try {	
				msg.setE01TXICST(req.getParameter("E01TXICST"));
			} catch (Exception e) {
				msg.setE01TXICST("");
			}
			try {	
				msg.setE01TXICTY(req.getParameter("E01TXICTY"));
			} catch (Exception e) {
				msg.setE01TXICTY("");
			}
			try {	
				msg.setE01TXICOD(req.getParameter("E01TXICOD"));
			} catch (Exception e) {
				msg.setE01TXICOD("");
			}

			if (screen == 5) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {				
				}
			}
			 /* msg.setE01ACT(" ");*/
			msg.setH01FLGWK1(""); 
			
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 2 || screen == 3 || screen == 4) {
					forward("ETX9030_ica_table_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("ETX9030Record", newmessage);
					forward("ETX9030_ica_table_detail.jsp", req, res);
				}
			} else {
				if (screen == 4 || screen == 5 ) {
					redirectToPage("/servlet/datapro.eibs.taxes.JSETX9030?SCREEN=1&FromRecord=0", res);
				} else {
					ses.setAttribute("ETX9030Record", newmessage);
					forwardOnSuccess("ETX9030_ica_table_detail.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}
}