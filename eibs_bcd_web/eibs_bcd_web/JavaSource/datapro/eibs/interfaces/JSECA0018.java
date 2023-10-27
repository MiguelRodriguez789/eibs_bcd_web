package datapro.eibs.interfaces;
/**
 * Mantenimiento Corresponsales
 * Creation date: (10/25/17)
*/
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ECA001801Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;
import datapro.eibs.beans.JBObjList;


public class JSECA0018 extends JSEIBSServlet { 
	 
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
			case 7 : // Inquiry
				procActionRec(user, req, res, session, screen);
				break;
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	// SCREEN = 1
	// Send List of Cash Management  
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null; 
		MessageProcessor mp = null;

		try {
			mp = new MessageProcessor("ECA0018");
			ECA001801Message msg = (ECA001801Message) mp.getMessageRecord("ECA001801");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ECA0018");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0001");
			if (screen == 1) {
				userPO.setPurpose("MAINTENANCE");
			} else {
				userPO.setPurpose("INQUIRY");
			}
			msg.setE01NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			msg.setE01AUTCUN((req.getParameter("SEARCHCDE") == null ? userPO.getHeader2() : req.getParameter("SEARCHCDE")));
			userPO.setHeader2(msg.getE01AUTCUN());
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
		forward("ECA0018_autorizaciones_list.jsp", req, res);
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
			mp = new MessageProcessor("ECA001801");
			ECA001801Message msg = (ECA001801Message) mp.getMessageRecord("ECA001801");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ECA0018");
			msg.setH01TIMSYS(getTimeStamp());
			switch (screen) {
				case 2 : // Request new Record
					msg.setH01OPECOD("0002");
					userPO.setPurpose("NEW");
					break;
				case 3 : // Request old Record
					msg.setH01OPECOD("0003");
					userPO.setPurpose("MAINTENANCE");
					break;
				case 4 : // Delete Record
					msg.setH01OPECOD("0004");
					break;
				case 5 : // Submit the Record for update
					msg.setH01OPECOD("0005");
					break;	
				case 7 : // Request old Record
					msg.setH01OPECOD("0003");
					userPO.setPurpose("INQUIRY");
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
				msg.setE01AUTBNK(req.getParameter("E01AUTBNK"));
				msg.setE01AUTCUN(req.getParameter("E01AUTCUN"));
				msg.setE01AUTACO(req.getParameter("E01AUTACO"));
				msg.setE01AUTACD(req.getParameter("E01AUTACD"));

				userPO.setCusNum(req.getParameter("E01AUTCUN"));
				userPO.setCusName(req.getParameter("D01AUTCUN"));
				

			}
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 2 || screen == 3 || screen == 4 || screen == 7) {
					forward("ECA0018_autorizaciones_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("ECA0018_autorizaciones.jsp", req, res);
				}

			} else {
				ses.setAttribute("msgRcd", newmessage);
				if (screen == 5 || screen == 4) {     // Update or Delete
					res.sendRedirect(srctx + "/servlet/datapro.eibs.interfaces.JSECA0018?SCREEN=1&SEARCHCDE=" + userPO.getHeader2());	
				} else {
					forward("ECA0018_autorizaciones.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

}