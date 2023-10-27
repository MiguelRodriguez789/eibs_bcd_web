package datapro.eibs.treasury;

/**
 * Maintenance of Treasury Parameters 
 * Creation date: (11/02/16)
 * @author: Carlos Castillo
 * Treasury Parameters
 * 	// List of Options
 * 	//
 *	// SCREEN =    1	Send List of Treasury Parameters
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

public class JSETR0005 extends JSEIBSServlet {  
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		session.setAttribute("userPO", userPO);
		
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
	// Send List of Treasury Parameters
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
					throws ServletException, IOException {

		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		MessageProcessor mp = null;

		try {
			mp = new MessageProcessor("ETR0005");
			ETR000501Message msg = (ETR000501Message) mp.getMessageRecord("ETR000501");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ETR0005");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0001");

			msg.setE01NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			msg.setE01TRSBNK((req.getParameter("E01TRSBNK") == null ? "01" : req.getParameter("E01TRSBNK")));
			userPO.setProdCode((req.getParameter("E01TRSBNK") == null ? "01" : req.getParameter("E01TRSBNK")));
			
			// Send Message	
			mp.sendMessage(msg);
			userPO.setPurpose("INQUIRY");
			if (screen == 1) {
				userPO.setPurpose("MAINTENANCE");
			}
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list =
					(JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("beanList", list);
			}
			forward("ETR0005_trs_parameters_list.jsp", req, res);
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
			mp = new MessageProcessor("ETR0005");
			ETR000501Message msg = (ETR000501Message) mp.getMessageRecord("ETR000501");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ETR0005");
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
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
			// Get key field
			msg.setE01TRSBNK((req.getParameter("E01TRSBNK") == null ? "01" : req.getParameter("E01TRSBNK")));
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
					forward("ETR0005_trs_parameters_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("beanRecord", newmessage);
					forward("ETR0005_trs_parameters.jsp", req, res);
				}

			} else {
				if (screen == 4 || screen == 5) {
					redirectToPage("/servlet/datapro.eibs.treasury.JSETR0005?SCREEN=1&FromRecord=0", res);
				} else {
					ses.setAttribute("beanRecord", newmessage);
					forwardOnSuccess("ETR0005_trs_parameters.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

}