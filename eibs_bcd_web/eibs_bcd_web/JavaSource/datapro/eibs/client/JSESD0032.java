package datapro.eibs.client;
/**
 * Maintenance of Cities Relationship
 * Creation date: (08/13/17)
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

public class JSESD0032 extends JSEIBSServlet { 
	 
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
	// Send List   
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("ESD0032");
			ESD003201Message msg = (ESD003201Message) mp.getMessageRecord("ESD003201");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD0032");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0001");
			userPO.setPurpose(screen  == 1 ? "MAINTENANCE" : "INQUIRY");
			msg.setE01NUMREC(req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord"));
			msg.setE01CDRCTR(req.getParameter("SEARCHCTR") == null ? " " : req.getParameter("SEARCHCTR"));
			msg.setE01CDRSTE(req.getParameter("SEARCHSTE") == null ? " " : req.getParameter("SEARCHSTE"));
			msg.setE01CDRCTY(req.getParameter("SEARCHCTY") == null ? " " : req.getParameter("SEARCHCTY"));
			msg.setE01CDRCTG(req.getParameter("SEARCHCTG") == null ? " " : req.getParameter("SEARCHCTG"));
			userPO.setHeader1(msg.getE01CDRCTR());
			userPO.setHeader2(msg.getE01CDRSTE());
			userPO.setHeader3(msg.getE01CDRCTY());
			userPO.setHeader4(msg.getE01CDRCTG());

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
			forward("ESD0032_city_categories_list.jsp", req, res);
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
			mp = new MessageProcessor("ESD0032");
			ESD003201Message msg = (ESD003201Message) mp.getMessageRecord("ESD003201");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD0032");
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
			msg.setE01CDRCTR(req.getParameter("E01CDRCTR") == null ? " " : req.getParameter("E01CDRCTR"));
			msg.setE01CDRSTE(req.getParameter("E01CDRSTE") == null ? " " : req.getParameter("E01CDRSTE"));
			msg.setE01CDRCTY(req.getParameter("E01CDRCTY") == null ? " " : req.getParameter("E01CDRCTY"));
			msg.setE01CDRCTG(req.getParameter("E01CDRCTG") == null ? " " : req.getParameter("E01CDRCTG"));
			msg.setE01CDRSCT(req.getParameter("E01CDRSCT") == null ? " " : req.getParameter("E01CDRSCT"));
			userPO.setHeader1(msg.getE01CDRCTR());
			userPO.setHeader2(msg.getE01CDRSTE());
			userPO.setHeader3(msg.getE01CDRCTY());
			userPO.setHeader4(msg.getE01CDRCTG());
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
				if (screen == 2 || screen == 3 || screen == 4 ) {
					forward("ESD0032_city_categories_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("ESD0032_city_categories_detail.jsp", req, res);
				}

			} else {
				if (screen == 4 || screen == 5 ) {
					String parm = "?SCREEN=1&FromRecord=0&SEARCHCTR=" + userPO.getHeader1() + "&SEARCHSTE=" + userPO.getHeader2() + "&SEARCHCTY=" + userPO.getHeader3() + "&SEARCHCTG=" + userPO.getHeader4();
					redirectToPage("/servlet/datapro.eibs.client.JSESD0032" + parm, res);
				} else {
					ses.setAttribute("msgRcd", newmessage);
					forward("ESD0032_city_categories_detail.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}
	
}