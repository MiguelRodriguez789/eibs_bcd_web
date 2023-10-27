package datapro.eibs.taxes;
/**
 * Maintenance of CNTRLTAX Table
 * Creation date: (2/16/12)
 * @author: Martha Linet Riaño
 * Control tax and witholding information
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

public class JSETX9040 extends JSEIBSServlet { 
	 
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
	// Send List of Taxes  
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("ETX9040");
			ETX904001Message msg = (ETX904001Message) mp.getMessageRecord("ETX904001");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ETX9040");
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
						
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("ETX9040List", list);
			}
			forward("ETX9040_tax_table_list.jsp", req, res);
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
			mp = new MessageProcessor("ETX9040");
			ETX904001Message msg = (ETX904001Message) mp.getMessageRecord("ETX904001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ETX9040");
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
				msg.setE01TAXBNK(req.getParameter("E01TAXBNK"));
			} catch (Exception e) {
				msg.setE01TAXBNK("01");
			}
			try {	
				msg.setE01TAXCOD(req.getParameter("E01TAXCOD"));
			} catch (Exception e) {
				msg.setE01TAXCOD("000");
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
				
				if (screen == 2 || screen == 3) {
					forward("ETX9040_tax_table_list.jsp", req, res);
				} else {
					//
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("ETX9040Record", newmessage);
					forward("ETX9040_tax_table_detail.jsp", req, res);
				}
			} else {
				if (screen == 4 || screen == 5 ) {
					redirectToPage("/servlet/datapro.eibs.taxes.JSETX9040?SCREEN=1&FromRecord=0", res);
				} else {
					ses.setAttribute("ETX9040Record", newmessage);
					forwardOnSuccess("ETX9040_tax_table_detail.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}
}