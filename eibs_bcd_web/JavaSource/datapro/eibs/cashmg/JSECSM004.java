package datapro.eibs.cashmg;
/**
 * Consulta archivos procesados Motor de pagos
 * Creation date: (10/25/17)
 
 * 
 * 	// List of Options
 * 	//
 *	// SCREEN =    1	Send List of Clients User Type
 *	// SCREEN =    2    Request new record
 *	// SCREEN =    3    Request old record
 *	// SCREEN =    4	Delete record 
 *	// SCREEN =    5	Submit the record for Update 
*/
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import datapro.eibs.beans.ECSM00202Message;
import datapro.eibs.beans.ECSM00402Message;
import datapro.eibs.beans.EDD0734DSMessage;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ECSM00401Message;
import datapro.eibs.beans.ECSM00402Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;
import datapro.eibs.beans.JBObjList;


public class JSECSM004 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		switch (screen) {
			case 1 : // Params 
				procActionIni(user, req, res, session, screen);
				break;
			case 2 : // Requests List 
				procActionList_H(user, req, res, session, screen);
				break;
			case 3 : // Requests List 
				procActionRec_H(user, req, res, session, screen);
				break;
			case 4 : // Requests List 
				procActionList_D(user, req, res, session, screen);
				break;
			case 5 : // Requests List 
				procActionRec_D(user, req, res, session, screen);
				break;
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}


	protected void procActionIni(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ECSM00401");
				ECSM00401Message msg = (ECSM00401Message) mp.getMessageRecord("ECSM00401");
				msg.setH01USERID(user.getH01USR());
				msg.setH01PROGRM("ECSM00401");
				msg.setH01TIMSYS(getTimeStamp());
				msg.setH01OPECOD("0001");
				
				// Send Message 
				mp.sendMessage(msg);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				forward("ECSM004_files_params_cash_management.jsp", req, res);

			} finally {
				if (mp != null) 
					mp.close();
			}
		}
	
	
	// SCREEN = 2
	// Send List of Cash Management  
	//
	protected void procActionList_H(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null; 
		MessageProcessor mp = null;

		try {
			mp = new MessageProcessor("ECSM00401");
			ECSM00401Message msg = (ECSM00401Message) mp.getMessageRecord("ECSM00401");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ECSM004");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0002");
			userPO.setPurpose("INQUIRY");
			msg.setE01NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));

			try {
				msg.setE01ILHAGR(req.getParameter("E01ILHAGR").trim());
				userPO.setAccNum(req.getParameter("E01ILHAGR").trim());
			} catch (Exception e) {
				msg.setE01ILHAGR(userPO.getAccNum());
			}
			
			try {
				msg.setE01ILHTIP(req.getParameter("E01ILHTIP").trim());
				userPO.setType(req.getParameter("E01ILHTIP").trim());
			} catch (Exception e) {
				msg.setE01ILHTIP(userPO.getType());
			}

			msg.setE01ILHNUM((req.getParameter("SEARCHCDE") == null ? "0" : req.getParameter("SEARCHCDE")));
			userPO.setHeader2(msg.getE01ILHNUM());

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
		forward("ECSM004_files_cash_management_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	protected void procActionRec_H(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("ECSM00401");
				ECSM00401Message msg = (ECSM00401Message) mp.getMessageRecord("ECSM00401");
				msg.setH01USERID(user.getH01USR());
				msg.setH01PROGRM("ECSM004");
				msg.setH01TIMSYS(getTimeStamp());
				msg.setH01OPECOD("0003");
				userPO.setPurpose("INQUIRY");
				userPO.setHeader2(" ");
				
				try {
					msg.setE01ILHAGR(req.getParameter("E01ILHAGR").trim());
					userPO.setAccNum(req.getParameter("E01ILHAGR").trim());
				} catch (Exception e) {
					msg.setE01ILHAGR(userPO.getAccNum());
				}
				
				try {
					msg.setE01ILHTIP(req.getParameter("E01ILHTIP").trim());
					userPO.setType(req.getParameter("E01ILHTIP").trim());
				} catch (Exception e) {
					msg.setE01ILHTIP(userPO.getType());
				}

				try {
					msg.setE01ILHNUM(req.getParameter("E01ILHNUM"));
				} catch (Exception e) {
					msg.setE01ILHNUM("0");				
				}

				// Send Message 
				mp.sendMessage(msg);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
					if (screen == 3) {
						forward("ECSM004_files_cash_management_list.jsp", req, res);
					} else {
						// Receive Data
						newmessage = mp.receiveMessageRecord();
						ses.setAttribute("msgRcd", newmessage);
						forward("ECSM004_files_cash_management.jsp", req, res);
					}

				} else {
					ses.setAttribute("msgRcd", newmessage);
					forward("ECSM004_files_cash_management.jsp", req, res);
				}

			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	
	protected void procActionList_D(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			UserPos userPO = null; 
			MessageProcessor mp = null;

			try {
				mp = new MessageProcessor("ECSM00402");
				ECSM00402Message msg = (ECSM00402Message) mp.getMessageRecord("ECSM00402");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				userPO.setPurpose("MAINTENANCE");
				// Send Initial data
				msg.setH02USERID(user.getH01USR());
				msg.setH02PROGRM("ECSM004");
				msg.setH02TIMSYS(getTimeStamp());
				msg.setH02OPECOD("0001");
				
				userPO.setPurpose("INQUIRY");
				userPO.setAccNum(req.getParameter("E01ILHAGR") == null ? userPO.getAccNum() : req.getParameter("E01ILHAGR"));
				userPO.setHeader3(req.getParameter("E01ILHTIP") == null ? userPO.getHeader3() : req.getParameter("E01ILHTIP"));
				userPO.setHeader4(req.getParameter("E01ILHNUM") == null ? userPO.getHeader4() : req.getParameter("E01ILHNUM"));

				msg.setE02ILDAGR(userPO.getAccNum());
				msg.setE02ILDTIP(userPO.getHeader3());
				msg.setE02ILDNUM(userPO.getHeader4());
				msg.setE02NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
				msg.setE02ILDSEQ((req.getParameter("SEARCHCDE") == null ? userPO.getHeader2() : req.getParameter("SEARCHCDE")));
				userPO.setHeader2(msg.getE02ILDSEQ());

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
			forward("ECSM004_files_detail_cash_management_list.jsp", req, res);
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
				mp = new MessageProcessor("ECSM00402");
				ECSM00402Message msg = (ECSM00402Message) mp.getMessageRecord("ECSM00402");
				msg.setH02USERID(user.getH01USR());
				msg.setH02PROGRM("ECSM004");
				msg.setH02TIMSYS(getTimeStamp());
				msg.setH02OPECOD("0003");
				userPO.setPurpose("INQUIRY");
				userPO.setHeader2(" ");
				
				msg.setE02ILDNUM(req.getParameter("E02ILDNUM"));
				msg.setE02ILDSEQ(req.getParameter("E02ILDSEQ"));

				// Send Message 
				mp.sendMessage(msg);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
					if (screen == 5) {
						forward("ECSM004_files_detail_cash_management_list.jsp", req, res);
					} else {
						// Receive Data
						newmessage = mp.receiveMessageRecord();
						ses.setAttribute("msgRcd", newmessage);
						forward("ECSM004_files_detail_cash_management.jsp", req, res);
					}

				} else {
					ses.setAttribute("msgRcd", newmessage);
					forward("ECSM004_files_detail_cash_management.jsp", req, res);
				}

			} finally {
				if (mp != null) 
					mp.close();
			}
		}

	
	
	
}