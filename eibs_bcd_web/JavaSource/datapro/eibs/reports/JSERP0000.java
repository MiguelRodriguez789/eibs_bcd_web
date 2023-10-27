package datapro.eibs.reports; 
/**
 * Master Reports Maintenance
 * Creation date: (08/10/16)
 * @author: C. Castillo
 * 
 * 	// List of Options
 * 	//
 *	// SCREEN =    1,6   Send List of Reports
 *	// SCREEN =    2     Request new record
 *	// SCREEN =    3     Request old record
 *	// SCREEN =    4	 Delete record 
 *	// SCREEN =    5	 Submit the record for Update 
 *  // SCREEN =    11,16 Send List of Parameters by Report
 *  // SCREEN =    12	 Send Report Parameters List  
	// SCREEN =    13    Request new Report Parameter
 *  // SCREEN =    14    Delete Report Parameter
	// SCREEN =    15	 Submit Report Parameter for Update
 *  // SCREEN =    21,26 Send List of Parameters
 *  // SCREEN =    22	 Request new Parameter 
	// SCREEN =    23    Request old Parameter
 *  // SCREEN =    24    Delete Parameter
	// SCREEN =    25	 Submit Parameter for Update
 *  // SCREEN =    31,36 Send List of Modules   
 *  // SCREEN =    32	 Request new Module    
	// SCREEN =    33    Request old Module   
 *  // SCREEN =    34    Delete Module   
	// SCREEN =    35	 Submit Module for Update
 */
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ERP000001Message;
import datapro.eibs.beans.ERP000002Message;
import datapro.eibs.beans.ERP000003Message;
import datapro.eibs.beans.ERP000004Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.CharacterField;
import datapro.eibs.sockets.MessageRecord;
import datapro.eibs.beans.JBObjList;


public class JSERP0000 extends JSEIBSServlet { 
	 
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
				// Report Parameters List 
			case 11 :
			case 16 :	
				procReqListPrm(user, req, res, session, screen);
				break;
			//	Submit the Report Parameter for update
			case 12	:
			case 13 :
			case 14 :	
			case 15 :
				procActionListPrm(user, req, res, session, screen);
				break;	
				// Parameters List 
			case 21 :
			case 26 :	
				procReqListPms(user, req, res, session, screen);
				break;
			//	Submit the Parameter for update
			case 22	:
			case 23 :
			case 24 :	
			case 25 :
				procActionListPms(user, req, res, session, screen);
				break;	
				// Modules List 
			case 31 :
			case 36 :	
				procReqListMod(user, req, res, session, screen);
				break;
			//	Submit the Module for update
			case 32	:
			case 33 :
			case 34 :	
			case 35 :
				procActionListMod(user, req, res, session, screen);
				break;	
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	// SCREEN = 1, 6 
	// Send List of Reports  
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;

		try {
			mp = new MessageProcessor("ERP0000");
			ERP000001Message msg = (ERP000001Message) mp.getMessageRecord("ERP000001");
			UserPos userPO = getUserPos(req);
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ERP0000");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0001");
			if (screen == 1) {
				userPO.setPurpose("MAINTENANCE");
			} else {
				userPO.setPurpose("INQUIRY"); 
			}
			msg.setE01NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			msg.setE01IBSRPN((req.getParameter("SEARCHCDE") == null ? userPO.getHeader2() : req.getParameter("SEARCHCDE")));
			userPO.setHeader2(msg.getE01IBSRPN());
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
			forward("ERP0000_reports_list.jsp", req, res);
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
			mp = new MessageProcessor("ERP0000");
			ERP000001Message msg = (ERP000001Message) mp.getMessageRecord("ERP000001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ERP0000");
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
				msg.setE01IBSRPN(req.getParameter("E01IBSRPN"));
				msg.setE01IBSLIF(req.getParameter("E01IBSLIF"));
			}
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 2 || screen == 3 || screen == 4) {
					forward("ERP0000_reports_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("ERP0000_report_detail.jsp", req, res);
				}

			} else {
				ses.setAttribute("msgRcd", newmessage);
				if (screen == 5 || screen == 4) {     // Update or Delete
					res.sendRedirect(srctx + "/servlet/datapro.eibs.reports.JSERP0000?SCREEN=1&SEARCHCDE=" + userPO.getHeader2());	
				} else {
					forward("ERP0000_report_detail.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	// SCREEN = 11, 16 
	// Send List of Report Parameters  
	//
	protected void procReqListPrm(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null; 
		MessageProcessor mp = null;

		try {
			mp = new MessageProcessor("ERP0000");
			ERP000002Message msg = (ERP000002Message) mp.getMessageRecord("ERP000002");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("ERP0000");
			msg.setH02TIMSYS(getTimeStamp());
			msg.setH02OPECOD("0011");
			if (screen == 11) {
				userPO.setPurpose("MAINTENANCE");
			} else {
				userPO.setPurpose("INQUIRY");
			}
			msg.setE02NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			msg.setE02RPTRPN((req.getParameter("E01IBSRPN") == null ? userPO.getHeader2() : req.getParameter("E01IBSRPN")));
			msg.setE02RPTLIF((req.getParameter("E01IBSLIF") == null ? userPO.getID() : req.getParameter("E01IBSLIF")));
			userPO.setHeader2(msg.getE02RPTRPN());
			userPO.setID(msg.getE02RPTLIF());
						
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
		forward("ERP0000_report_parameters_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	// SCREEN = 12.13.14,15
	// Get or Process the Record  
	//
	protected void procActionListPrm(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send data
		try {
			mp = new MessageProcessor("ERP0000");
			ERP000002Message msg = (ERP000002Message) mp.getMessageRecord("ERP000002");
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("ERP0000");
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
				try {
					((CharacterField) msg.getField("E02RPTHLP")).setStringUD(req.getParameter("E02RPTHLP"));  // Get without change lower case and special characters
				} catch (Exception e) {
					msg.setE02RPTHLP("");
				}
			}
			
			if (screen != 15){
				msg.setE02RPTRPN(req.getParameter("E02RPTRPN"));
				msg.setE02RPTSEQ(req.getParameter("E02RPTSEQ"));
				msg.setE02RPTCOD(req.getParameter("E02RPTCOD"));
				msg.setE02RPTLIF(userPO.getID());
			}
			userPO.setHeader2(msg.getE02RPTRPN());
			userPO.setIdentifier(msg.getE02RPTSEQ());
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 12 || screen == 13 || screen == 14) {
					forward("ERP0000_report_parameters_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("ERP0000_report_parameter.jsp", req, res);
				}

			} else {
				ses.setAttribute("msgRcd", newmessage);
				if (screen == 15 || screen == 14) {     // Update or Delete
					res.sendRedirect(srctx + "/servlet/datapro.eibs.reports.JSERP0000?SCREEN=11");	
				} else {
					forward("ERP0000_report_parameter.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	// SCREEN = 21, 26 
	// Send List of Parameters  
	//
	protected void procReqListPms(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null; 
		MessageProcessor mp = null;

		try {
			mp = new MessageProcessor("ERP0000");
			ERP000003Message msg = (ERP000003Message) mp.getMessageRecord("ERP000003");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH03USERID(user.getH01USR());
			msg.setH03PROGRM("ERP0000");
			msg.setH03TIMSYS(getTimeStamp());
			msg.setH03OPECOD("0021");
			if (screen == 21) {
				userPO.setPurpose("MAINTENANCE");
			} else {
				userPO.setPurpose("INQUIRY");
			}
			msg.setE03NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			msg.setE03PMSCOD((req.getParameter("SEARCHCD2") == null ? userPO.getHeader3() : req.getParameter("SEARCHCD2")));
			userPO.setHeader3(msg.getE03PMSCOD());
						
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
		forward("ERP0000_parameters_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	// SCREEN = 22.23.24,25
	// Get or Process the Record  
	//
	protected void procActionListPms(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send data
		try {
			mp = new MessageProcessor("ERP0000");
			ERP000003Message msg = (ERP000003Message) mp.getMessageRecord("ERP000003");
			msg.setH03USERID(user.getH01USR());
			msg.setH03PROGRM("ERP0000");
			msg.setH03TIMSYS(getTimeStamp());
			switch (screen) {
				case 22 : // Request new Record
					msg.setH03OPECOD("0022");
					userPO.setPurpose("NEW");
					break;
				case 23 : // Request old Record
					msg.setH03OPECOD("0023");
					break;
				case 24 : // Delete Record
					msg.setH03OPECOD("0024");
					break;
				case 25 : // Submit the Record for update
					msg.setH03OPECOD("0025");
					break;	
				default :
					forward(SuperServlet.devPage, req, res); 
					break;
			}
			
			if (screen == 25) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {				
				}
				try {
					((CharacterField) msg.getField("E03PMSDDS")).setStringUD(req.getParameter("E03PMSDDS"));  // Get without change lower case and special characters
				} catch (Exception e) {
					msg.setE03PMSDDS(""); 
				}	
			}
			
			if (screen != 25){
				msg.setE03PMSCOD(req.getParameter("E03PMSCOD"));
				msg.setE03PMSLIF(req.getParameter("E03PMSLIF"));
			}
			userPO.setHeader3(msg.getE03PMSCOD());
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 22 || screen == 23 || screen == 24) {
					forward("ERP0000_parameters_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("ERP0000_parameter.jsp", req, res);
				}

			} else {
				ses.setAttribute("msgRcd", newmessage);
				if (screen == 25 || screen == 24) {     // Update or Delete
					res.sendRedirect(srctx + "/servlet/datapro.eibs.reports.JSERP0000?SCREEN=21");	
				} else {
					forward("ERP0000_parameter.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}	

	// SCREEN = 31, 36 
	// Send List of Parameters  
	//
	protected void procReqListMod(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null; 
		MessageProcessor mp = null;

		try {
			mp = new MessageProcessor("ERP0000");
			ERP000004Message msg = (ERP000004Message) mp.getMessageRecord("ERP000004");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH04USERID(user.getH01USR());
			msg.setH04PROGRM("ERP0000");
			msg.setH04TIMSYS(getTimeStamp());
			msg.setH04OPECOD("0031");
			if (screen == 31) {
				userPO.setPurpose("MAINTENANCE");
			} else {
				userPO.setPurpose("INQUIRY");
			}
			msg.setE04NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			msg.setE04MODRPT((req.getParameter("SEARCHCD3") == null ? userPO.getHeader4() : req.getParameter("SEARCHCD3")));
			userPO.setHeader4(msg.getE04MODRPT());
						
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
		forward("ERP0000_modules_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	// SCREEN = 32.33.34,35
	// Get or Process the Record  
	//
	protected void procActionListMod(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send data
		try {
			mp = new MessageProcessor("ERP0000");
			ERP000004Message msg = (ERP000004Message) mp.getMessageRecord("ERP000004");
			msg.setH04USERID(user.getH01USR());
			msg.setH04PROGRM("ERP0000");
			msg.setH04TIMSYS(getTimeStamp());
			switch (screen) {
				case 32 : // Request new Record
					msg.setH04OPECOD("0032");
					userPO.setPurpose("NEW");
					break;
				case 33 : // Request old Record
					msg.setH04OPECOD("0033");
					break;
				case 34 : // Delete Record
					msg.setH04OPECOD("0034");
					break;
				case 35 : // Submit the Record for update
					msg.setH04OPECOD("0035");
					break;	
				default :
					forward(SuperServlet.devPage, req, res); 
					break;
			}
			
			if (screen == 35) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {				
				}
				((CharacterField) msg.getField("E04MODDSC")).setStringUD(req.getParameter("E04MODDSC"));  // Get without change lower case and special characters
			}
			
			if (screen != 35){
				msg.setE04MODRPT(req.getParameter("E04MODRPT"));
				msg.setE04MODLIF(req.getParameter("E04MODLIF"));
			}
			userPO.setHeader4(msg.getE04MODRPT());
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 32 || screen == 33 || screen == 34) {
					forward("ERP0000_modules_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("ERP0000_module.jsp", req, res);
				}

			} else {
				ses.setAttribute("msgRcd", newmessage);
				if (screen == 35 || screen == 34) {     // Update or Delete
					res.sendRedirect(srctx + "/servlet/datapro.eibs.reports.JSERP0000?SCREEN=31");	
				} else {
					forward("ERP0000_module.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}	
}