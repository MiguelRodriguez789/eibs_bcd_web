package datapro.eibs.interfaces; 
/**
 * Mantenimiento de la tabla de Interfaces/Canales
 * Creation date: (09/02/14)
 * @author: C. Castillo
 * 
 * 	// List of Options
 * 	//
 *	// SCREEN =    1	Send List of Clients User Type
 *	// SCREEN =    2    Request new record
 *	// SCREEN =    3    Request old record
 *	// SCREEN =    4	Delete record 
 *	// SCREEN =    5	Submit the record for Update 
 *  // SCREEN =    12	Send Schedule List  
	// SCREEN =    13   Request the List for new Schedule
	// SCREEN =    15	Submit the Schedule list for Update
 */
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ECA000001Message;
import datapro.eibs.beans.ECA000002Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;
import datapro.eibs.beans.JBObjList;


public class JSECA0000 extends JSEIBSServlet { 
	 
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
				// Schedule List 
			case 11 :
			case 16 :	
				procReqListSch(user, req, res, session, screen);
				break;
			//	Submit the Schedule list for update
			case 12	:
			case 13 :
			case 14 :	
			case 15 :
			case 20 :	
				procActionListSch(user, req, res, session, screen); 
				break;	
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	// SCREEN = 1, 6 
	// Send List of Interfaces  
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null; 
		MessageProcessor mp = null;

		try {
			mp = new MessageProcessor("ECA000001");
			ECA000001Message msg = (ECA000001Message) mp.getMessageRecord("ECA000001");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ECA0000");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0001");
			if (screen == 1) {
				userPO.setPurpose("MAINTENANCE");
			} else {
				userPO.setPurpose("INQUIRY");
			}
			msg.setE01NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			msg.setE01ICANOE((req.getParameter("SEARCHCDE") == null ? userPO.getHeader2() : req.getParameter("SEARCHCDE")));
			userPO.setHeader2(msg.getE01ICANOE());
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
		forward("ECA0000_interfaces_channels_list.jsp", req, res);
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
			mp = new MessageProcessor("ECA000001");
			ECA000001Message msg = (ECA000001Message) mp.getMessageRecord("ECA000001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ECA0000");
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
			
			if (screen == 5) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {				
				}
			}
			
			if (screen != 5){
				msg.setE01ICANOE(req.getParameter("E01ICANOE"));
			}
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 2 || screen == 3 || screen == 4) {
					forward("ECA0000_interfaces_channels_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("ECA0000_interfaces_channels.jsp", req, res);
				}

			} else {
				ses.setAttribute("msgRcd", newmessage);
				if (screen == 5 || screen == 4) {     // Update or Delete
					res.sendRedirect(srctx + "/servlet/datapro.eibs.interfaces.JSECA0000?SCREEN=1&SEARCHCDE=" + userPO.getHeader2());	
				} else {
					forward("ECA0000_interfaces_channels.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	// SCREEN = 11, 16 
	// Send List of Interface Schedule  
	//
	protected void procReqListSch(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null; 
		MessageProcessor mp = null;

		try {
			mp = new MessageProcessor("ECA000002");
			ECA000002Message msg = (ECA000002Message) mp.getMessageRecord("ECA000002");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("ECA0000");
			msg.setH02TIMSYS(getTimeStamp());
			msg.setH02OPECOD("0011");
			if (screen == 11) {
				userPO.setPurpose("MAINTENANCE");
			} else {
				userPO.setPurpose("INQUIRY");
			}
			msg.setE02NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			msg.setE02ISCNOI((req.getParameter("E01ICANOI") == null ? userPO.getIdentifier() : req.getParameter("E01ICANOI")));
			userPO.setIdentifier(msg.getE02ISCNOI());
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E02INDOPE","E02NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("msgList", list);
			}
		forward("ECA0000_interfaces_channels_schedule_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	// SCREEN = 12.13.14,15
	// Get or Process the Record  
	//
	protected void procActionListSch(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send data
		try {
			mp = new MessageProcessor("ECA000002");
			ECA000002Message msg = (ECA000002Message) mp.getMessageRecord("ECA000002");
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("ECA0000");
			msg.setH02TIMSYS(getTimeStamp());
			switch (screen) {
				case 12 : // Request new Record
					msg.setH02OPECOD("0012");
					userPO.setPurpose("NEW");
					break;
				case 13 : // Request old Record
					msg.setH02OPECOD("0013");
					break;
				case 14 : // Delete Record
					msg.setH02OPECOD("0014");
					break;
				case 15 : // Submit the Record for update
					msg.setH02OPECOD("0015");
					break;	
				default :
					forward(SuperServlet.devPage, req, res); 
					break;
			}
			
			if (screen == 15) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {				
				}
			}
			
			if (screen != 15){
				msg.setE02ISCNOI(req.getParameter("E02ISCNOI"));
				msg.setE02ISCPTY(req.getParameter("E02ISCPTY"));
				msg.setE02ISCACC(req.getParameter("E02ISCACC"));
				msg.setE02ISCBRN(req.getParameter("E02ISCBRN"));
				msg.setE02ISCSEQ(req.getParameter("E02ISCSEQ"));
			}
			userPO.setIdentifier(msg.getE02ISCNOI());
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 12 || screen == 13 || screen == 14) {
					forward("ECA0000_interfaces_channels_schedule_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("ECA0000_interfaces_channels_schedule.jsp", req, res);
				}

			} else {
				ses.setAttribute("msgRcd", newmessage);
				if (screen == 15 || screen == 14) {     // Update or Delete
					res.sendRedirect(srctx + "/servlet/datapro.eibs.interfaces.JSECA0000?SCREEN=11");	
				} else {
					forward("ECA0000_interfaces_channels_schedule.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	
}