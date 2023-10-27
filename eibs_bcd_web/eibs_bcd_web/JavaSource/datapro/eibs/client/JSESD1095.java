package datapro.eibs.client;
/**
 * Maintenance of Financial Templates and Financial Historic Info
 * Creation date: (08/21/17)
 * @author: Carlos Castillo
 * 
 * 	// List of Options
 * 	//
 *	// SCREEN =    1,11	    Send List 
 *	// SCREEN =    2        Request new record
 *	// SCREEN =    3,,12,13 Request old record
 *	// SCREEN =    4        Delete record 
 *	// SCREEN =    5,15     Submit the record for Update 
 */
import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class JSESD1095 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		switch (screen) {
			// Options for Templates Info 
			case 1 : // Header For Maintenance
			case 6 : // Header For Inquiry
			case 8 : // Detail List For Maintenance	
			case 9 : // Detail List For Inquiry	
				procReqList(user, req, res, session, screen);
				break;
			case 2 : // Request new Template
			case 3 : // Request old Record
			case 4 : // Delete record	
			case 5 : // Submit the Record for update
				procActionRec(user, req, res, session, screen);
				break;
			// Options for Financial Statement per Customer	
			case 11 : //  History List by Customer Inquiry
				procReqFinList(user, req, res, session, screen);
				break;
			case 12 : // Request last Customer Info for Maintenance
			case 13 : // Request Info for Inquiry	
				procActionFinRec(user, req, res, session, screen);
				break;
			case 15 : // Submit the Info update
			case 25 : // Submit for Calculate	
				procActionFinUpd(user, req, res, session, screen);
				break;
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	// SCREEN = 1 , 6, 8, 9
	// Send List Formats header  
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		String pageL = "";
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("ESD1095");
			ESD109501Message msg = (ESD109501Message) mp.getMessageRecord("ESD109501");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD1095");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD(screen  == 1 || screen == 6 ? "0001" : "0008");
			userPO.setPurpose(screen  == 1 || screen == 8 ? "MAINTENANCE" : "INQUIRY");
			msg.setE01NUMREC(req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord"));
			if (screen == 1 || screen == 6) {
				msg.setE01IFTRPN(req.getParameter("SEARCHCDE") == null ? " " : req.getParameter("SEARCHCDE"));
			} else {
				msg.setE01IFTRPN(req.getParameter("E01IFTRPN") == null ? userPO.getSeqNum() : req.getParameter("E01IFTRPN"));
			}
			msg.setE01IFTTIN(req.getParameter("TYPE") == null ? "" : req.getParameter("TYPE"));
			userPO.setSeqNum(msg.getE01IFTRPN());
			userPO.setType(msg.getE01IFTTIN());
			pageL = (screen  == 1 || screen == 6 ? "ESD1095_financial_templates_list.jsp" : "ESD1095_financial_templates_detail_list.jsp");
			
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
			forward(pageL, req, res);
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
		String pageL = "";
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send data
		try {
			mp = new MessageProcessor("ESD1095");
			ESD109501Message msg = (ESD109501Message) mp.getMessageRecord("ESD109501");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD1095");
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
			msg.setE01IFTRPN(req.getParameter("E01IFTRPN") == null ? " " : req.getParameter("E01IFTRPN"));
			msg.setE01IFTLIN(req.getParameter("E01IFTLIN") == null ? " " : req.getParameter("E01IFTLIN"));
			userPO.setSeqNum(msg.getE01IFTRPN());
			userPO.setIdentifier(msg.getE01IFTLIN());
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
			pageL = (userPO.getIdentifier().equals("0") ? "ESD1095_financial_templates_list.jsp" : "ESD1095_financial_templates_detail_list.jsp");

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 2 || screen == 3 || screen == 4) {
					forward(pageL, req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("ESD1095_financial_template_detail.jsp", req, res);
				}

			} else {
				if (screen == 4 || screen == 5) {
					
					String parm = "";
					parm = (userPO.getIdentifier().equals("0") ? "?SCREEN=1&FromRecord=0&SEARCHCDE=" + userPO.getSeqNum() + "&TYPE=" + userPO.getType() : 
						    "?SCREEN=8&FromRecord=0&E01IFTRPN=" + userPO.getSeqNum()) + "&TYPE=" + userPO.getType();
					redirectToPage("/servlet/datapro.eibs.client.JSESD1095" + parm, res);
				} else {
					ses.setAttribute("msgRcd", newmessage);
					forward("ESD1095_financial_template_detail.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	// SCREEN = 11
	// Send Financial Statements List By Customer  
	//
	protected void procReqFinList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("ESD1095");
			ESD109502Message msg = (ESD109502Message) mp.getMessageRecord("ESD109502");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			// Send Initial data
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("ESD1095");
			msg.setH02TIMSYS(getTimeStamp());
			msg.setH02SCRCOD("01");
			msg.setH02OPECOD("0011");
			
			userPO.setPurpose("INQUIRY");
			
			msg.setE02NUMREC(req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord"));
			msg.setE02IFICUN(req.getParameter("E02IFICUN") == null ? " " : req.getParameter("E02IFICUN"));
			msg.setE02IFIRPN(req.getParameter("E02IFIRPN") == null ? "0" : req.getParameter("E02IFIRPN"));
			msg.setE02IFIRDT(req.getParameter("E02IFIRDT") == null ? "" : req.getParameter("E02IFIRDT"));
			userPO.setSeqNum(msg.getE02IFIRPN());
			
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
			forward("ESD1095_financial_Statements_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}	


	// SCREEN = 12,13
	// Get Financial Info Per Customer and Template 
	//
	protected void procActionFinRec(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send data
		try {
			mp = new MessageProcessor("ESD1095");
			ESD109502Message msg = (ESD109502Message) mp.getMessageRecord("ESD109502");
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("ESD1095");
			msg.setH02TIMSYS(getTimeStamp());
			msg.setH02SCRCOD("01");
			String page = "ESD1095_financial_info_list.jsp";
			switch (screen) {
				case 12 : // Request Records For Maintenance
					msg.setH02OPECOD("0012");
					userPO.setPurpose("MAINTENANCE");
					break;
				case 13 : // Request old Record
					msg.setH02OPECOD("0013");
					page = "ESD1095_financial_info_inq_list.jsp";
					break;
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
			// Get key field
			msg.setE02IFICUN(req.getParameter("E02IFICUN") == null ? " " : req.getParameter("E02IFICUN"));
			msg.setE02IFIRPN(req.getParameter("E02IFIRPN") == null ? " " : req.getParameter("E02IFIRPN"));
			msg.setE02IFIRDT(req.getParameter("E02IFIRDT") == null ? "0" : req.getParameter("E02IFIRDT"));
			userPO.setSeqNum(msg.getE02IFIRPN());
			
			msg.setH02FLGWK1(""); 
			msg.setE02NUMREC(req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord"));
			// Send Message	
			mp.sendMessage(msg);
			// Receive List
			JBObjList list = (JBObjList) mp.receiveMessageRecordList("E02INDOPE","E02NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("list", list);
			}
			forward(page, req, res);
		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	// SCREEN = 15, 25
		// Process the List (Sending all rows to Socket) 
		//
		protected void procActionFinUpd(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
				HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			ESD109502Message msg = null;
			UserPos userPO = null;
			MessageRecord newmessage = null;
			
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			int totRows = Integer.parseInt(req.getParameter("TOTROWS"));
			
			// Send data
			try { 
				mp = new MessageProcessor("ESD1095");
				msg = (ESD109502Message) mp.getMessageRecord("ESD109502"); 
				for (int row = 1; row < totRows ; row++) {
					msg.setH02USERID(user.getH01USR());
					msg.setH02PROGRM("ESD1095");
					msg.setH02TIMSYS(getTimeStamp());  
					msg.setH02SCRCOD("" + row);
					msg.setH02OPECOD("0015");
					if (screen == 25) {
						msg.setH02OPECOD("0025");
					}
					msg.setE02IFICUN(req.getParameter("E02IFICUN"));
					msg.setE02IFIRPN(req.getParameter("E02IFIRPN"));
					msg.setE02IFIRDT(req.getParameter("E02IFIRDT"));
					msg.setE02IFITIN(req.getParameter("E02IFITIN"));
					msg.setE02IFIDOC(req.getParameter("E02IFIDOC"));
					msg.setE02IFIIFY(req.getParameter("E02IFIIFY"));
					msg.setE02IFIIFM(req.getParameter("E02IFIIFM"));
					msg.setE02IFTZER(req.getParameter("E02IFTZER_" + row));
					msg.setE02IFTLIT(req.getParameter("E02IFTLIT_" + row));
					msg.setE02IFTNEG(req.getParameter("E02IFTNEG_" + row));
					msg.setE02IFILIN(req.getParameter("E02IFILIN_" + row));
					msg.setE02IFILID(req.getParameter("E02IFILID_" + row));
					msg.setE02IFIAMT(req.getParameter("E02IFIAMT_" + row));
					
					msg.setH02FLGWK1("");
					// Send Message
					mp.sendMessage(msg);
				} // EndFor
				msg.setH02USERID(user.getH01USR());
				msg.setH02PROGRM("ESD1090");
				msg.setH02TIMSYS(getTimeStamp());  
				msg.setH02SCRCOD("");
				msg.setH02OPECOD("0015");
				if (screen == 25) {
					msg.setH02OPECOD("0025");
				}
				msg.setH02FLGWK1("S");  // End of List
				mp.sendMessage(msg);
				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				
				String parm = "";
				parm = "?SCREEN=12&FromRecord=0&E02IFICUN=" + req.getParameter("E02IFICUN") + "&E02IFIRPN=" + req.getParameter("E02IFIRPN");
				redirectToPage("/servlet/datapro.eibs.client.JSESD1095" + parm, res);
			} finally {
				if (mp != null) 
					mp.close();
			}
		}
	
}