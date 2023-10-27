package datapro.eibs.mntor;
/**
 * Maintenance of Files & Fields for Monitor
 * Creation date: (04/29/14)
 * @author: Carlos Castillo
 * 
 * 	// List of Options
 * 	//
 *	// SCREEN =    1	Send List 
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

public class JSEMN0010 extends JSEIBSServlet { 
	 
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
			case 10:	
				procActionRec(user, req, res, session, screen);
				break;
				
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	// SCREEN = 1 
	// Send List   
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("EMN0010");
			EMN001001Message msg = (EMN001001Message) mp.getMessageRecord("EMN001001");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EMN0010");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
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
				msg.setE01LOGFIL(req.getParameter("SEARCHCDE"));
			} catch (Exception e) {
				msg.setE01LOGFIL("");
			}
			try {
				msg.setE01LOGFLD(req.getParameter("SEARCHFLD"));
			} catch (Exception e) {
				msg.setE01LOGFLD("");
			}
			userPO.setSource(msg.getE01LOGFIL());
			userPO.setHeader1(msg.getE01LOGFLD());
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("EMN0010List", list);
			}
			forward("EMN0010_monitor_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	// SCREEN = 2,3,5,10
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
			mp = new MessageProcessor("EMN0010");
			EMN001001Message msg = (EMN001001Message) mp.getMessageRecord("EMN001001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EMN0010");
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
				case 10: // Generate Fields             
					msg.setH01OPECOD("0010");
					break;	
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
			// Get key field
			try {
				msg.setE01LOGFIL(req.getParameter("E01LOGFIL"));
			} catch (Exception e) {
				msg.setE01LOGFIL("");
			}
			try {
				msg.setE01LOGFLD(req.getParameter("E01LOGFLD"));
			} catch (Exception e) {
				msg.setE01LOGFLD("");
			}
			userPO.setSource(msg.getE01LOGFIL());
			userPO.setHeader1(msg.getE01LOGFLD());
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
				if (screen == 2 || screen == 3 || screen == 4  || screen == 10) {
					forward("EMN0010_monitor_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("EMN0010Record", newmessage);
					forward("EMN0010_monitor_detail.jsp", req, res);
				}

			} else {
				if (screen == 4 || screen == 5 || screen == 10) {
					redirectToPage("/servlet/datapro.eibs.mntor.JSEMN0010?SCREEN=1&FromRecord=0&SEARCHCDE=" + userPO.getSource() + "&SEARCHFLD=" + userPO.getHeader1(), res);
				} else {
					ses.setAttribute("EMN0010Record", newmessage);
					forward("EMN0010_monitor_detail.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}
	
}