package datapro.eibs.ofac; 
/**
 * Maintenance of Actions Master 
 * Creation date: (03/16/15)
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

public class JSEDEN030 extends JSEIBSServlet { 
	 
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

	// SCREEN = 1, 6 
	// Send List   
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		String searchType = "";
		try {
			mp = new MessageProcessor("EDEN030");
			EDEN03001Message msg = (EDEN03001Message) mp.getMessageRecord("EDEN03001");
			userPO = new datapro.eibs.beans.UserPos();
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDEN030");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0001");
			if (screen == 1) {
				userPO.setPurpose("MAINTENANCE");
			} else {
				userPO.setPurpose("INQUIRY");
			}
			msg.setE01NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			searchType = ((req.getParameter("SEARCHTYPE") == null ? "S" : req.getParameter("SEARCHTYPE")));
			if (searchType.equals("S")) {
				msg.setE01SRC((req.getParameter("SEARCHSRC") == null ? "" : req.getParameter("SEARCHSRC")));
			}
			msg.setH01FLGWK1(searchType);
			userPO.setType(msg.getH01FLGWK1());
			userPO.setHeader1(msg.getE01SRC());
			
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("msgList", list);
			}
			forward("EDEN030_actions_master_list.jsp", req, res);
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
			mp = new MessageProcessor("EDEN030");
			EDEN03001Message msg = (EDEN03001Message) mp.getMessageRecord("EDEN03001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDEN030");
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
			// Get key field
			msg.setE01SRC((req.getParameter("E01SRC") == null ? "" : req.getParameter("E01SRC")));
			msg.setE01TYP((req.getParameter("E01TYP") == null ? "" : req.getParameter("E01TYP")));
			// Get all fields in page
			if (screen == 5) {
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
					forward("EDEN030_actions_master_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("EDEN030Record", newmessage);
					forward("EDEN030_actions_master.jsp", req, res);
				}

			} else {
				ses.setAttribute("EDEN030Record", newmessage);
				if (screen == 4 || screen == 5 || screen == 10) {
					redirectToPage("/servlet/datapro.eibs.ofac.JSEDEN030?SCREEN=1&FromRecord=0", res);
				} else {
					forward("EDEN030_actions_master.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

}