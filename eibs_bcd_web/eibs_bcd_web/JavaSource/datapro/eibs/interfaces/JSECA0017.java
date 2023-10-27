package datapro.eibs.interfaces;
/**
 * Mantenimiento Corresponsales
 * Creation date: (10/25/17)
*/
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ECA001701Message;
import datapro.eibs.beans.ECA001702Message;
import datapro.eibs.beans.ECA001703Message;
import datapro.eibs.beans.ECA001704Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;
import datapro.eibs.beans.JBObjList;


public class JSECA0017 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		switch (screen) {
			// Requests List 
			case 1 :
				procReqList_H(user, req, res, session, screen);
				break;
			case 2 : // Request new Record
			case 3 : // Request old Record
			case 4 : // Delete record	
			case 5 : // Submit the Record for update
				procActionRec_H(user, req, res, session, screen);
				break;
				// Requests List 
			case 6 :
				procReqList_D(user, req, res, session, screen);
				break;
			case 7 : // Request new Record
			case 8 : // Request old Record
			case 9 : // Delete record	
			case 10 : // Submit the Record for update
				procActionRec_D(user, req, res, session, screen);
				break;
			case 11 :
				procReqList_IH(user, req, res, session, screen);
				break;
			case 12 : // Submit the Record for update
				procActionRec_IH(user, req, res, session, screen);
				break;
			case 13 :
				procReqList_ID(user, req, res, session, screen);
				break;
			case 14 : // Submit the Record for update
				procActionRec_ID(user, req, res, session, screen);
				break;
			case 15 :
				procReqList_S(user, req, res, session, screen);
				break;
			case 16 :
			case 17 : // Submit the Record for update
				procActionRec_SA(user, req, res, session, screen);
				break;
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	// SCREEN = 1
	// Send List of Cash Management  
	//
	protected void procReqList_H(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null; 
		MessageProcessor mp = null;

		try {
			mp = new MessageProcessor("ECA0017");
			ECA001701Message msg = (ECA001701Message) mp.getMessageRecord("ECA001701");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ECA0017");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0001");
			if (screen == 1) {
				userPO.setPurpose("MAINTENANCE");
			} else {
				userPO.setPurpose("INQUIRY");
			}
			msg.setE01NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			msg.setE01CORCUN((req.getParameter("SEARCHCDE") == null ? userPO.getHeader2() : req.getParameter("SEARCHCDE")));
			userPO.setHeader2(msg.getE01CORCUN());
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
		forward("ECA0017_corresponsales_header_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	// SCREEN = 2,3,5
	// Get or Process the Record  
	//
	protected void procActionRec_H(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send data
		try {
			mp = new MessageProcessor("ECA001701");
			ECA001701Message msg = (ECA001701Message) mp.getMessageRecord("ECA001701");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ECA0017");
			msg.setH01TIMSYS(getTimeStamp());
			userPO.setHeader2(" ");
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
				msg.setE01CORBNK(req.getParameter("E01CORBNK"));
				msg.setE01CORCUN(req.getParameter("E01CORCUN"));
				userPO.setCusNum(req.getParameter("E01CORCUN"));
				userPO.setCusName(req.getParameter("D01CORCUN"));
				

			}
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 2 || screen == 3 || screen == 4) {
					forward("ECA0017_corresponsales_header_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("ECA0017_corresponsales_header.jsp", req, res);
				}

			} else {
				ses.setAttribute("msgRcd", newmessage);
				if (screen == 5 || screen == 4) {     // Update or Delete
					res.sendRedirect(srctx + "/servlet/datapro.eibs.interfaces.JSECA0017?SCREEN=1&SEARCHCDE=" + userPO.getHeader2());	
				} else {
					forward("ECA0017_corresponsales_header.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	// SCREEN = 6
	// Send List  
	//
	protected void procReqList_D(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null; 
		MessageProcessor mp = null;

		try {
			mp = new MessageProcessor("ECA001702");
			ECA001702Message msg = (ECA001702Message) mp.getMessageRecord("ECA001702");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("ECA0017");
			msg.setH02TIMSYS(getTimeStamp());
			msg.setH02OPECOD("0001");
			if (screen == 6) {
				userPO.setPurpose("MAINTENANCE");
			} else {
				userPO.setPurpose("INQUIRY");
			}
			msg.setE02CODCUN(userPO.getCusNum());
			msg.setE02NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			msg.setE02CODOFC((req.getParameter("SEARCHCDE") == null ? userPO.getHeader2() : req.getParameter("SEARCHCDE")));
			userPO.setHeader2(msg.getE02CODOFC());
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
		forward("ECA0017_corresponsales_detail_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	// SCREEN = 7,8,10
	// Get or Process the Record  
	//
	protected void procActionRec_D(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send data
		try {
			mp = new MessageProcessor("ECA001702");
			ECA001702Message msg = (ECA001702Message) mp.getMessageRecord("ECA001702");
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("ECA0017");
			msg.setH02TIMSYS(getTimeStamp());
			msg.setE02CODCUN(userPO.getCusNum());
			userPO.setHeader2(" ");

			switch (screen) {
				case 7 : // Request new Record
					msg.setH02OPECOD("0002");
					userPO.setPurpose("NEW");
					break;
				case 8 : // Request old Record
					msg.setH02OPECOD("0003");
					break;
				case 9 : // Delete Record
					msg.setH02OPECOD("0004");
					break;
				case 10 : // Submit the Record for update
					msg.setH02OPECOD("0005");
					break;	
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
			
			if (screen == 10) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {				
				}
			}
			
			if (screen != 10){
				msg.setE02CODBNK(req.getParameter("E02CODBNK"));
				msg.setE02CODCUN(req.getParameter("E02CODCUN"));
				msg.setE02CODOFC(req.getParameter("E02CODOFC"));
			}
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 7 || screen == 8 || screen == 9) {
					forward("ECA0017_corresponsales_detail_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("ECA0017_corresponsales_detail.jsp", req, res);
				}

			} else {
				ses.setAttribute("msgRcd", newmessage);
				if (screen == 10 || screen == 9) {     // Update or Delete
					res.sendRedirect(srctx + "/servlet/datapro.eibs.interfaces.JSECA0017?SCREEN=6&SEARCHCDE=" + userPO.getHeader2());	
				} else {
					forward("ECA0017_corresponsales_detail.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}
	
	// SCREEN = 11
	// Send List of Cash Management  
	//
	protected void procReqList_IH(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null; 
		MessageProcessor mp = null;

		try {
			mp = new MessageProcessor("ECA0017");
			ECA001703Message msg = (ECA001703Message) mp.getMessageRecord("ECA001703");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("INQUIRY");
			// Send Initial data
			msg.setH03USERID(user.getH01USR());
			msg.setH03PROGRM("ECA0017");
			msg.setH03TIMSYS(getTimeStamp());
			msg.setH03OPECOD("0001");
			msg.setE03NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			msg.setE03CORCUN((req.getParameter("SEARCHCDE") == null ? userPO.getHeader2() : req.getParameter("SEARCHCDE")));
			userPO.setHeader2(msg.getE03CORCUN());
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E03INDOPE","E03NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("msgList", list);
			}
		forward("ECA0017_corresponsales_inq_header_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	// SCREEN = 12	// Get or Process the Record  
	//
	protected void procActionRec_IH(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send data
		try {
			mp = new MessageProcessor("ECA001703");
			ECA001703Message msg = (ECA001703Message) mp.getMessageRecord("ECA001703");
			msg.setH03USERID(user.getH01USR());
			msg.setH03PROGRM("ECA0017");
			msg.setH03TIMSYS(getTimeStamp());
			userPO.setHeader2(" ");
			msg.setH03OPECOD("0002");
			userPO.setPurpose("INQUIRY");
			msg.setE03CORBNK(req.getParameter("E03CORBNK"));
			msg.setE03CORCUN(req.getParameter("E03CORCUN"));
			userPO.setCusNum(req.getParameter("E03CORCUN"));
			userPO.setCusName(req.getParameter("D03CORCUN"));
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				forward("ECA0017_corresponsales_inq_header_list.jsp", req, res);

			} else {
				ses.setAttribute("msgRcd", newmessage);
				forward("ECA0017_corresponsales_inq_header.jsp", req, res);
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	// SCREEN = 13
	// Get or Process the Record  
	
	protected void procReqList_ID(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			UserPos userPO = null; 
			MessageProcessor mp = null;

			try {
				mp = new MessageProcessor("ECA001703");
				ECA001703Message msg = (ECA001703Message) mp.getMessageRecord("ECA001703");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				userPO.setPurpose("INQUIRY");
				// Send Initial data
				msg.setH03USERID(user.getH01USR());
				msg.setH03PROGRM("ECA0017");
				msg.setH03TIMSYS(getTimeStamp());
				msg.setH03OPECOD("0003");
				userPO.setCusNum(req.getParameter("E03CORCUN"));
				msg.setE03CORCUN(userPO.getCusNum());
				msg.setE03CODOFC((req.getParameter("SEARCHCDE") == null ? userPO.getHeader2() : req.getParameter("SEARCHCDE")));
				userPO.setHeader2(msg.getE03CODOFC());
				// Send Message	
				mp.sendMessage(msg);
				ses.setAttribute("userPO", userPO);
				// Receive List
				JBObjList list =
					(JBObjList) mp.receiveMessageRecordList("E03INDOPE","E03NUMREC");
				if (mp.hasError(list)) {
					ses.setAttribute("error", mp.getError(list));
				} else {
					ses.setAttribute("msgList", list);
				}
				
			forward("ECA0017_corresponsales_inq_detail_list.jsp", req, res);
			} finally {
				if (mp != null)
					mp.close();
			}
		}
	// SCREEN = 14
	// Get or Process the Record  
	//
	protected void procActionRec_ID(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send data
		try {
			mp = new MessageProcessor("ECA001703");
			ECA001703Message msg = (ECA001703Message) mp.getMessageRecord("ECA001703");
			msg.setH03USERID(user.getH01USR());
			msg.setH03PROGRM("ECA0017");
			msg.setH03TIMSYS(getTimeStamp());
			msg.setE03CORCUN(userPO.getCusNum());
			msg.setH03OPECOD("0004");
			userPO.setPurpose("INQUIRY");
			msg.setE03CORBNK(req.getParameter("E03CORBNK"));
			msg.setE03CORCUN(req.getParameter("E03CORCUN"));
			msg.setE03CODOFC(req.getParameter("E03CODOFC"));
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				forward("ECA0017_corresponsales_inq_detail_list.jsp", req, res);
			} else {
				ses.setAttribute("msgRcd", newmessage);
					forward("ECA0017_corresponsales_inq_detail.jsp", req, res);
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}
	
	// SCREEN = 15
	// Send List of Cash Management  
	//
	protected void procReqList_S(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null; 
		MessageProcessor mp = null;

		try {
			mp = new MessageProcessor("ECA0017");
			ECA001704Message msg = (ECA001704Message) mp.getMessageRecord("ECA001704");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH04USERID(user.getH01USR());
			msg.setH04PROGRM("ECA0017");
			msg.setH04TIMSYS(getTimeStamp());
			msg.setH04OPECOD("0001");
			msg.setE04NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			msg.setE04CORCUN((req.getParameter("SEARCHCDE") == null ? userPO.getHeader2() : req.getParameter("SEARCHCDE")));
			userPO.setHeader2(msg.getE04CORCUN());
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E04INDOPE","E04NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("msgList", list);
			}
		forward("ECA0017_corresponsales_header_act_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}
	

	// SCREEN = 7,8,10
	// Get or Process the Record  
	//
	protected void procActionRec_SA(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send data
		try {
			mp = new MessageProcessor("ECA001704");
			ECA001704Message msg = (ECA001704Message) mp.getMessageRecord("ECA001704");
			msg.setH04USERID(user.getH01USR());
			msg.setH04PROGRM("ECA0017");
			msg.setH04TIMSYS(getTimeStamp());
			msg.setE04CORCUN(userPO.getCusNum());
			userPO.setHeader2(" ");

			switch (screen) {
				case 16 : // Request new Record
					msg.setH04OPECOD("0003");
					userPO.setPurpose("UPD");
					break;
				case 17 : // Submit the Record for update
					msg.setH04OPECOD("0005");
					break;	
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
			
			if (screen == 17) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {				
				}
			}
			
			if (screen != 17){
				msg.setE04CORBNK(req.getParameter("E04CORBNK"));
				msg.setE04CORCUN(req.getParameter("E04CORCUN"));
			//	msg.setE04CODLN1(req.getParameter("E04CODLN1"));
			//	msg.setE04CODLN2(req.getParameter("E04CODLN2"));
			}
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 16) {
					forward("ECA0017_corresponsales_header_act_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("ECA0017_corresponsales_saldo.jsp", req, res);
				}

			} else {
				ses.setAttribute("msgRcd", newmessage);
				if (screen == 17) {     // Update or Delete
					res.sendRedirect(srctx + "/servlet/datapro.eibs.interfaces.JSECA0017?SCREEN=15&SEARCHCDE=" + userPO.getHeader2());	
				} else {
					forward("ECA0017_corresponsales_saldo.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}
	
}