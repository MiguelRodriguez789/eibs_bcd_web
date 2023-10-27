package datapro.eibs.ofac;
/** 
 * Maintenance of Palabras Reservadas 
 * Creation date: (02/14/12)
 * @author: Carlos Castillo
 *                        
 * 	// List of Options
 * 	//
 *	// SCREEN =    1	Send List of Reserved Words               
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

public class JSEDEN005 extends JSEIBSServlet { 
	 
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
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	// SCREEN = 1 
	// Send List of Reserved Words
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		try { 
			mp = new MessageProcessor("EDEN005");
			EDEN00501Message msg = (EDEN00501Message) mp.getMessageRecord("EDEN00501");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDEN005");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0001");
			
			try {
				msg.setE01NUMREC(req.getParameter("FromRecord"));
			} catch (Exception e) {
				msg.setE01NUMREC("0"); 
			}
			try {
				msg.setE01RSVWRD(req.getParameter("SEARCHWOR"));
			} catch (Exception e) { 
				msg.setE01RSVWRD("");
			}
			try {
				userPO.setHeader1(msg.getE01RSVWRD());
			} catch (Exception e) { }
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list = (JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("EDEN005List", list);
			}
			forwardOnSuccess("EDEN005_reserved_words_list.jsp", req, res);
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
			mp = new MessageProcessor("EDEN005");
			EDEN00501Message msg = (EDEN00501Message) mp.getMessageRecord("EDEN00501");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDEN005");
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
				msg.setE01RSVWRD(req.getParameter("E01RSVWRD"));
			} catch (Exception e) {
				msg.setE01RSVWRD("");
			}
			try {
				userPO.setHeader1(req.getParameter("E01RSVWRD"));
			} catch (Exception e) { }
			
			msg.setE01ACT(" ");
			msg.setH01FLGWK1(""); 
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				forward("EDEN005_reserved_words_list.jsp", req, res);
			} else {
				redirectToPage("/servlet/datapro.eibs.ofac.JSEDEN005?SCREEN=1&FromRecord=0?SEARCHWOR=" + userPO.getHeader1() , res);
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

}