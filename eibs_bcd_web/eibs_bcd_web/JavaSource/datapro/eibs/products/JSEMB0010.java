package datapro.eibs.products;
/**
 * Maintenance of Embargos           
 * Creation date: (02/01/18)
 * @author: Carlos Castillo
 * 
 * 	// List of Options
 * 	//
 *	// SCREEN =    1,11	Send List 
 *	// SCREEN =    2.12 Request new record
 *	// SCREEN =    3,13 Request old record
 *	// SCREEN =    4,14	Delete record 
 *	// SCREEN =    5,15	Submit the record for Update 
 */
import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class JSEMB0010 extends JSEIBSServlet { 
	 
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
			case 11 :
			case 16 :
			case 21 :	
				procReqDetList(user, req, res, session, screen);
				break;
			case 12 : // Request new Record
			case 13 : // Request old Record
			case 14 : // Delete record	
			case 15 : // Submit the Record for update
			case 25 : // Approval	
				procActionDetRec(user, req, res, session, screen);
				break;	
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}
	
	// SCREEN = 1 , 6
	// Send List Embargos      
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("EMB0010");
			EMB001001Message msg = (EMB001001Message) mp.getMessageRecord("EMB001001");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			// Send Initial data 
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EMB0010");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0001");
			
			userPO.setPurpose(screen  == 1 ? "MAINTENANCE" : "INQUIRY");
			msg.setE01NUMREC(req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord"));
			msg.setE01EMBCUN(req.getParameter("SEARCHCDE") == null ? " " : req.getParameter("SEARCHCDE"));
			msg.setE01EMBNUM(req.getParameter("SEARCHCOD") == null ? " " : req.getParameter("SEARCHCOD"));
			userPO.setSource(msg.getE01EMBCUN());
			userPO.setIdentifier(msg.getE01EMBNUM());

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
			forward("EMB0010_embargos_list.jsp", req, res);
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
			mp = new MessageProcessor("EMB0010");
			EMB001001Message msg = (EMB001001Message) mp.getMessageRecord("EMB001001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EMB0010");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			userPO.setPurpose("MAINTENANCE");
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
			msg.setE01EMBCUN(req.getParameter("E01EMBCUN") == null ? " " : req.getParameter("E01EMBCUN"));
			msg.setE01EMBNUM(req.getParameter("E01EMBNUM") == null ? " " : req.getParameter("E01EMBNUM"));
			userPO.setSource(msg.getE01EMBCUN());
			userPO.setIdentifier(msg.getE01EMBNUM());
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
				if (screen == 2 || screen == 3 || screen == 4) {
					forward("EMB0010_embargos_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("EMB0010_embargos_detail.jsp", req, res);
				}

			} else {
				if (screen == 4 || screen == 5) {
					String parm = "?SCREEN=1&FromRecord=0&SEARCHCDE=" + userPO.getSource() + "&SEARCHCOD=" + userPO.getIdentifier();
					redirectToPage("/servlet/datapro.eibs.products.JSEMB0010" + parm, res);
				} else {
					ses.setAttribute("msgRcd", newmessage);
					forward("EMB0010_embargos_detail.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	// SCREEN = 11 , 16 , 21
	// Send List   
	//
	protected void procReqDetList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("EMB0010");
			EMB001002Message msg = (EMB001002Message) mp.getMessageRecord("EMB001002");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			// Send Initial data
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("EMB0010");
			msg.setH02TIMSYS(getTimeStamp());
			msg.setH02SCRCOD("01");
			
			msg.setH02OPECOD(screen  == 11 ? "0011" : (screen == 21 ? "0021" :"0016"));
			userPO.setPurpose(screen  == 11 ? "MAINTENANCE" : (screen == 21 ? "APPROVAL" :"INQUIRY"));
			msg.setE02NUMREC(req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord"));
			msg.setE02EMDCUN(req.getParameter("E01EMBCUN") == null ? userPO.getSource() : req.getParameter("E01EMBCUN"));
			msg.setE02EMDNUM(req.getParameter("E01EMBNUM") == null ? userPO.getIdentifier() : req.getParameter("E01EMBNUM"));
			userPO.setSource(msg.getE02EMDCUN());
			userPO.setIdentifier(msg.getE02EMDNUM());
			userPO.setHeader20(req.getParameter("D01LIM") == null ? userPO.getHeader20() : req.getParameter("D01LIM"));
			
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
			forward("EMB0010_embargos_accounts_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}	


	// SCREEN = 12,13,14, 15, 25
	// Get or Process the Record  
	//
	protected void procActionDetRec(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send data
		try {
			mp = new MessageProcessor("EMB0010");
			EMB001002Message msg = (EMB001002Message) mp.getMessageRecord("EMB001002");
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("EMB0010");
			msg.setH02TIMSYS(getTimeStamp());
			msg.setH02SCRCOD("01");
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
				case 25 : // Submit the Record for Approval
					msg.setH02OPECOD("0025");
					break;					
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
			// Get key field
			msg.setE02EMDCUN(req.getParameter("E02EMDCUN") == null ? " " : req.getParameter("E02EMDCUN"));
			msg.setE02EMDNUM(req.getParameter("E02EMDNUM") == null ? " " : req.getParameter("E02EMDNUM"));
			msg.setE02EMDACC(req.getParameter("E02EMDACC") == null ? " " : req.getParameter("E02EMDACC"));
			userPO.setSource(msg.getE02EMDCUN());
			userPO.setIdentifier(msg.getE02EMDNUM());
			userPO.setHeader1(msg.getE02EMDACC());
			if (screen == 15) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {				
				}
			}
			
			msg.setH02FLGWK1(""); 
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 12 || screen == 13 || screen == 14 || screen == 25) {
					forward("EMB0010_embargos_accounts_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("EMB0010_embargos_accounts_detail.jsp", req, res);
				}

			} else {
				if (screen == 14 || screen == 15 || screen == 25) {
					String sc = "11";
					if (screen == 25) sc = "21";
					msg.setE02EMDCUN(req.getParameter("E02EMDCUN") == null ? " " : req.getParameter("E02EMDCUN"));
					String parm = "?SCREEN=" + sc + "&FromRecord=0&E01EMBCUN=" + userPO.getSource() + "&E01EMBNUM=" + userPO.getIdentifier();
					redirectToPage("/servlet/datapro.eibs.products.JSEMB0010" + parm, res);
				} else {
					ses.setAttribute("msgRcd", newmessage);
					forward("EMB0010_embargos_accounts_detail.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}


}