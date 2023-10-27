package datapro.eibs.cleaning;
/**
 * Mantenimiento 
 * Creation date: (10/25/17)
*/
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EDD096201Message;
import datapro.eibs.beans.EDD096202Message;
import datapro.eibs.beans.EDD096203Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;
import datapro.eibs.beans.JBObjList;


public class JSEDD0962 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		switch (screen) {
			// Requests List 
			case 1 :
				procReqList(user, req, res, session, screen);
				break;
			case 2 : // Request new Record
			case 3 : // Request old Record
			case 4 : // Delete record	
			case 5: // Submit the Record for update
				procActionRec(user, req, res, session, screen);
				break;
			case 6 : //Assign
			case 7 : //Deny 
				procReqList_A(user, req, res, session, screen);
				break;
			case 9 : // Delete record	
			case 10: // Submit the Record for update
				procActionRec_A(user, req, res, session, screen);
				break;
			case 11: // Display Cover
			case 12: // Submit the Record for update (Cover)
				procActionRec_P(user, req, res, session, screen);
				break;
			case 13: // Display Devol
			case 14: // Submit the Record for update (Devol)
				procActionRec_D(user, req, res, session, screen);
				break;
			case 15: // Display Translate
			case 16: // Submit the Record for update (Translate)
				procActionRec_T(user, req, res, session, screen);
				break;
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	// SCREEN = 1
	// Send List of CE  
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null; 
		MessageProcessor mp = null;

		try {
			mp = new MessageProcessor("EDD096201");
			EDD096201Message msg = (EDD096201Message) mp.getMessageRecord("EDD096201");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDD0962");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0001");
			if (screen == 1) {
				userPO.setPurpose("MAINTENANCE");
			} else {
				userPO.setPurpose("INQUIRY");
			}
			msg.setE01NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			msg.setE01CACCCA((req.getParameter("SEARCHCDE") == null ? userPO.getHeader2() : req.getParameter("SEARCHCDE")));
			userPO.setHeader2(msg.getE01CACCCA());
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
		forward("EDD0962_cleaning_cover_list.jsp", req, res);
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
			mp = new MessageProcessor("EDD096201");
			EDD096201Message msg = (EDD096201Message) mp.getMessageRecord("EDD096201");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDD0962");
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
				msg.setE01CACBNK(req.getParameter("E01CACBNK"));
				msg.setE01CACNCU(req.getParameter("E01CACNCU"));
				userPO.setBank(req.getParameter("E01CACBNK"));
				userPO.setAccNum(req.getParameter("E01CACNCU"));

			}
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 2 || screen == 3 || screen == 4) {
					forward("EDD0962_cleaning_cover.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("EDD0962_cleaning_cover.jsp", req, res);
				}

			} else {
				ses.setAttribute("msgRcd", newmessage);
				if (screen == 5 || screen == 4) {     // Update or Delete
					res.sendRedirect(srctx + "/servlet/datapro.eibs.cleaning.JSEDD0962?SCREEN=1&SEARCHCDE=" + userPO.getHeader2());	
				} else {
					forward("EDD0962_cleaning_cover.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}
	
	// SCREEN = 1
	// Send List of   
	//
	protected void procReqList_A(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null; 
		MessageProcessor mp = null;

		try {
			mp = new MessageProcessor("EDD096202");
			EDD096202Message msg = (EDD096202Message) mp.getMessageRecord("EDD096202");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("EDD0962");
			msg.setH02TIMSYS(getTimeStamp());
			if ((screen == 6) ||  (screen == 7)){
				userPO.setPurpose("MAINTENANCE");
			} else {
				userPO.setPurpose("INQUIRY");
			}
			if (screen == 6) {
				msg.setH02OPECOD("0001");
				userPO.setOption("ASSIGN");
			}
			if (screen == 7) {
				msg.setH02OPECOD("0002");
				userPO.setOption("DENY");
			}

			
			msg.setE02CACNCU(req.getParameter("E01CACNCU"));
			msg.setE02CACBNK(userPO.getBank());
			msg.setE02NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			msg.setE02CANCOM((req.getParameter("SEARCHCDE") == null ? userPO.getHeader2() : req.getParameter("SEARCHCDE")));
			userPO.setHeader2(msg.getE02CANCOM());

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
		forward("EDD0962_cleaning_cover_chk_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}


	// SCREEN = 2,3,5
	// Get or Process the Record  
	//
	protected void procActionRec_A(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send data
		try {
			mp = new MessageProcessor("EDD096202");
			EDD096202Message msg = (EDD096202Message) mp.getMessageRecord("EDD096202");
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("EDD0962");
			msg.setH02TIMSYS(getTimeStamp());
			switch (screen) {
				case 9 : // Delete Record
					msg.setH02OPECOD("0004");
					userPO.setOption("DENY");
					break;
				case 10 : // Submit the Record for update
					msg.setH02OPECOD("0005");
					userPO.setOption("ASSIGN");
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
			
			msg.setE02CACBNK(req.getParameter("E02CACBNK"));
			msg.setE02CACNCU(req.getParameter("E02CACNCU"));
			msg.setE02CANCOM(req.getParameter("E02CANCOM"));
			msg.setE02CANCKN(req.getParameter("E02CANCKN"));
			msg.setE02CANACK(req.getParameter("E02CANACK"));

			
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				forward("EDD0962_cleaning_cover_chk_list.jsp", req, res);
			} else {
				ses.setAttribute("msgRcd", newmessage);
				if (screen == 10) {     // Update or Delete
					procReqList_A(user, req, res, ses, 6);	
					}
				if (screen == 9) {     // Update or Delete
					procReqList_A(user, req, res, ses, 7);	
					}
				
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	protected void procActionRec_P(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("EDD096203");
				EDD096203Message msg = (EDD096203Message) mp.getMessageRecord("EDD096203");
				msg.setH03USERID(user.getH01USR());
				msg.setH03PROGRM("EDD0962");
				msg.setH03TIMSYS(getTimeStamp());
				switch (screen) {
					case 11 : // Delete Record
						msg.setH03OPECOD("0001");
						break;
					case 12 : // Submit the Record for update
						msg.setH03OPECOD("0002");
						break;	
					default :
						forward(SuperServlet.devPage, req, res);
						break;
				}
				
				if (screen == 12) {
					// Get all fields in page
					try {
						super.setMessageRecord(req, msg);
					} catch (Exception e) {				
					}
				}
				

				
				// Send Message 
				mp.sendMessage(msg);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
					if (screen == 11) {
						forward("EDD0962_cleaning_cover_post.jsp", req, res);
					} else {
						// Receive Data
						newmessage = mp.receiveMessageRecord();
						ses.setAttribute("msgRcd", newmessage);
						forward("EDD0962_cleaning_cover_post.jsp", req, res);
					}

				} else {
					ses.setAttribute("msgRcd", newmessage);
					if (screen == 12) {     // Update or Delete
						forward("EDD0962_cleaning_cover_end_post.jsp", req, res);
					} else {
						forward("EDD0962_cleaning_cover_post.jsp", req, res);
					}
				}

			} finally {
				if (mp != null) 
					mp.close();
			}
		}
	
	protected void procActionRec_D(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("EDD096203");
				EDD096203Message msg = (EDD096203Message) mp.getMessageRecord("EDD096203");
				msg.setH03USERID(user.getH01USR());
				msg.setH03PROGRM("EDD0962");
				msg.setH03TIMSYS(getTimeStamp());
				switch (screen) {
					case 13 : // Delete Record
						msg.setH03OPECOD("0003");
						break;
					case 14 : // Submit the Record for update
						msg.setH03OPECOD("0004");
						break;	
					default :
						forward(SuperServlet.devPage, req, res);
						break;
				}
				
				if (screen == 14) {
					// Get all fields in page
					try {
						super.setMessageRecord(req, msg);
					} catch (Exception e) {				
					}
				}
				

				
				// Send Message 
				mp.sendMessage(msg);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
					if (screen == 13) {
						forward("EDD0962_cleaning_cover_post_canje.jsp", req, res);
					} else {
						// Receive Data
						newmessage = mp.receiveMessageRecord();
						ses.setAttribute("msgRcd", newmessage);
						forward("EDD0962_cleaning_cover_post_canje.jsp", req, res);
					}

				} else {
					ses.setAttribute("msgRcd", newmessage);
					if (screen == 14) {     // Update or Delete
						forward("EDD0962_cleaning_cover_end_post.jsp", req, res);
					} else {
						forward("EDD0962_cleaning_cover_post_canje.jsp", req, res);
					}
				}

			} finally {
				if (mp != null) 
					mp.close();
			}
		}
	
	protected void procActionRec_T(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("EDD096203");
				EDD096203Message msg = (EDD096203Message) mp.getMessageRecord("EDD096203");
				msg.setH03USERID(user.getH01USR());
				msg.setH03PROGRM("EDD0962");
				msg.setH03TIMSYS(getTimeStamp());
				switch (screen) {
					case 15 : // Delete Record
						msg.setH03OPECOD("0005");
						break;
					case 16 : // Submit the Record for update
						msg.setH03OPECOD("0006");
						break;	
					default :
						forward(SuperServlet.devPage, req, res);
						break;
				}
				
				if (screen == 16) {
					// Get all fields in page
					try {
						super.setMessageRecord(req, msg);
					} catch (Exception e) {				
					}
				}
				

				
				// Send Message 
				mp.sendMessage(msg);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
					if (screen == 15) {
						forward("EDD0962_cleaning_cover_post_trans.jsp", req, res);
					} else {
						// Receive Data
						newmessage = mp.receiveMessageRecord();
						ses.setAttribute("msgRcd", newmessage);
						forward("EDD0962_cleaning_cover_post_trans.jsp", req, res);
					}

				} else {
					ses.setAttribute("msgRcd", newmessage);
					if (screen == 16) {     // Update or Delete
						forward("EDD0962_cleaning_cover_end_post.jsp", req, res);
					} else {
						forward("EDD0962_cleaning_cover_post_trans.jsp", req, res);
					}
				}

			} finally {
				if (mp != null) 
					mp.close();
			}
		}
	
	
}