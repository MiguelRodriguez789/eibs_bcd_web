package datapro.eibs.ofac;
/** 
 * Maintenance of List Ofac 
 * Creation date: (06/14/2013)
 * @author: Americo Alzamora
 *                        
 * 	// List of Options
 * 	//
 *	// SCREEN =    1	Send List codigo de rechazo             
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

public class JSEDEN007 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		switch (screen) {
			// Requests List 
			case 1 :
				procReqList(user, req, res, session);
				break;
			case 2 : // Request new Record
			case 3 : // Request old Record
			case 4 : // Delete record	
			case 5 : // Submit the Record for update
				procActionRec(user, req, res, session, screen);
				break;
			case 6 : //Request New Record
				procReqNew(user, req, res, session,screen);
				break;
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	// SCREEN = 1  
	// Send List codigo de rechazo
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		try { 
			mp = new MessageProcessor("EDEN007");
			EDEN00701Message msg = (EDEN00701Message) mp.getMessageRecord("EDEN00701");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDEN007");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0001");
			
			try {
				msg.setE01NUMREC(req.getParameter("FromRecord"));
			} catch (Exception e) {
				msg.setE01NUMREC("0"); 
			}
			try {
				msg.setE01DTCCDE(req.getParameter("SEARCHWOR"));
			} catch (Exception e) { 
				msg.setE01DTCCDE("");
			}
			try {
				userPO.setHeader1(msg.getE01DTCCDE());
			} catch (Exception e) { }
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list = (JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("EDEN007List", list);
			}
			forwardOnSuccess("EDEN007_codigo_rechazo_list.jsp", req, res);
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
		userPO.setPurpose("MAINTENANCE");

		// Send data
		try {
			mp = new MessageProcessor("EDEN007");
			EDEN00701Message msg = (EDEN00701Message) mp.getMessageRecord("EDEN00701");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDEN007");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			switch (screen) {
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
			//	Get key fields
			try {
				msg.setE01DTCCDE(req.getParameter("ROW"));
			} catch (Exception e) {
				msg.setE01DTCCDE(req.getParameter("E01DTCCDE"));
			}
			try {
				msg.setE01DTCDSC(req.getParameter("E01DTCDSC"));
			} catch (Exception e) {
				msg.setE01DTCDSC("");
			}
			try {
				userPO.setHeader1(req.getParameter("ROW"));
			} catch (Exception e) { }
			
			msg.setE01DTC(" ");
			msg.setH01FLGWK1(""); 
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				forward("EDEN007_codigo_rechazo_list.jsp", req, res);
			} else {
				redirectToPage("/servlet/datapro.eibs.ofac.JSEDEN007?SCREEN=1&FromRecord=0?SEARCHWOR=" + userPO.getHeader1() , res);
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	protected void procReqNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

				forwardOnSuccess("EDEN007_codigo_rechazo_new.jsp", req, res);
		}
	
}