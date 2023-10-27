package datapro.eibs.interfaces;
/**
 * Mantenimiento de la tabla de Limites por Canal
 * Creation date: (08/01/17)
 
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

import datapro.eibs.beans.EDD001001Message;
import datapro.eibs.beans.EDD115001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ECA001501Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageContext;
import datapro.eibs.sockets.MessageRecord;
import datapro.eibs.beans.JBObjList;



public class JSECA0015 extends JSEIBSServlet { 
	 
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
			case 5 : // Submit the Record for update
				procActionRec(user, req, res, session, screen);
				break;
			case 6 :
				procReqListAcc(user, req, res, session, screen);
				break;
			case 7 : // Request new Record
			case 8 : // Request old Record
			case 9 : // Delete record	
			case 10 : // Submit the Record for update
				procActionRecAcc(user, req, res, session, screen);
				break;
			case 12 :	
				procReqEnterAccRT(user, req, res, session);
				break;
			case 13 :	
				procReqEnterAccSV(user, req, res, session);
				break;
			case 14 :	
				procActionEnterACC(user, req, res, session);
				break;	
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	// SCREEN = 1
	// Send List of Interfaces  
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null; 
		MessageProcessor mp = null;

		try {
			mp = new MessageProcessor("ECA001501");
			ECA001501Message msg = (ECA001501Message) mp.getMessageRecord("ECA001501");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ECA0015");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0001");
			if (screen == 1) {
				userPO.setPurpose("MAINTENANCE");
			} else {
				userPO.setPurpose("INQUIRY");
			}
			msg.setE01NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			msg.setE01ILBCNL((req.getParameter("SEARCHCDE") == null ? userPO.getHeader2() : req.getParameter("SEARCHCDE")));
			userPO.setHeader2(msg.getE01ILBCNL());
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
		forward("ECA0015_interfaces_limits_by_channels_list.jsp", req, res);
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
			mp = new MessageProcessor("ECA001501");
			ECA001501Message msg = (ECA001501Message) mp.getMessageRecord("ECA001501");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ECA0015");
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
				msg.setE01ILBBNK(req.getParameter("E01ILBBNK"));
				msg.setE01ILBCCY(req.getParameter("E01ILBCCY"));
				msg.setE01ILBCNL(req.getParameter("E01ILBCNL"));
				msg.setE01ILBVND(req.getParameter("E01ILBVND"));
				msg.setE01ILBTRN(req.getParameter("E01ILBTRN"));
				msg.setE01ILBACC(req.getParameter("E01ILBACC"));

			}
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 2 || screen == 3 || screen == 4) {
					forward("ECA0015_interfaces_limits_by_channels_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("ECA0015_interfaces_limits_by_channels.jsp", req, res);
				}

			} else {
				ses.setAttribute("msgRcd", newmessage);
				if (screen == 5 || screen == 4) {     // Update or Delete
					res.sendRedirect(srctx + "/servlet/datapro.eibs.interfaces.JSECA0015?SCREEN=1&SEARCHCDE=" + userPO.getHeader2());	
				} else {
					forward("ECA0015_interfaces_limits_by_channels.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	protected void procReqListAcc(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			UserPos userPO = null; 
			MessageProcessor mp = null;

			try {
				mp = new MessageProcessor("ECA001501");
				ECA001501Message msg = (ECA001501Message) mp.getMessageRecord("ECA001501");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				// Send Initial data
				
				msg.setH01USERID(user.getH01USR());
				msg.setH01PROGRM("ECA0015");
				msg.setH01TIMSYS(getTimeStamp());
				msg.setH01OPECOD("0006");
				msg.setE01ILBACC(userPO.getAccNum());
				msg.setE01ILBBNK(userPO.getBank());

				userPO.setPurpose("MAINTENANCE");
				if(req.getParameter("MOD")!= null && !req.getParameter("MOD").equals("")){
					userPO.setPurpose("INQUIRY");
				}
				
				msg.setE01NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
				userPO.setHeader2(msg.getE01ILBCNL());
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
			forward("ECA0015_interfaces_limits_by_channels_acc_list.jsp", req, res);
			} finally {
				if (mp != null)
					mp.close();
			}
		}
	
	// SCREEN = 7,8,9
	// Get or Process the Record  
	//
	protected void procActionRecAcc(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send data
		try {
			mp = new MessageProcessor("ECA001501");
			ECA001501Message msg = (ECA001501Message) mp.getMessageRecord("ECA001501");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ECA0015");
			msg.setH01TIMSYS(getTimeStamp());
			switch (screen) {
				case 7 : // Request new Record
					msg.setH01OPECOD("0007");
					userPO.setPurpose("NEW");
					break;
				case 8 : // Request old Record
					msg.setH01OPECOD("0008");
					break;
				case 9 : // Delete Record
					msg.setH01OPECOD("0009");
					break;
				case 10 : // Submit the Record for update
					msg.setH01OPECOD("0010");
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
				msg.setE01ILBBNK(req.getParameter("E01ILBBNK"));
				msg.setE01ILBCCY(req.getParameter("E01ILBCCY"));
				msg.setE01ILBCNL(req.getParameter("E01ILBCNL"));
				msg.setE01ILBVND(req.getParameter("E01ILBVND"));
				msg.setE01ILBTRN(req.getParameter("E01ILBTRN"));
				msg.setE01ILBACC(req.getParameter("E01ILBACC"));

			}
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 7 || screen == 8 || screen == 9) {
					forward("ECA0015_interfaces_limits_by_channels_acc_list.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("ECA0015_interfaces_limits_by_channels_acc.jsp", req, res);
				}

			} else {
				ses.setAttribute("msgRcd", newmessage);
				if (screen == 10 || screen == 9) {     // Update or Delete
					res.sendRedirect(srctx + "/servlet/datapro.eibs.interfaces.JSECA0015?SCREEN=6&SEARCHCDE=" + userPO.getHeader2());	
				} else {
					forward("ECA0015_interfaces_limits_by_channels_acc.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}
	
	protected void procReqEnterAccRT(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
				ELEERRMessage msgError = null;
				UserPos userPO = null;

				try {

					msgError = new datapro.eibs.beans.ELEERRMessage();
					userPO = new datapro.eibs.beans.UserPos();
					userPO.setOption("RT");
					userPO.setPurpose("MAINTENANCE");
					session.setAttribute("error", msgError);
					session.setAttribute("userPO", userPO);

				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				try {
					forward("ECA0015_enter_acc.jsp", req, res);
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}

	}
	
	protected void procReqEnterAccSV(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
				ELEERRMessage msgError = null;
				UserPos userPO = null;

				try {

					msgError = new datapro.eibs.beans.ELEERRMessage();
					userPO = new datapro.eibs.beans.UserPos();
					userPO.setOption("SV");
					userPO.setPurpose("MAINTENANCE");
					session.setAttribute("error", msgError);
					session.setAttribute("userPO", userPO);

				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				try {
					forward("ECA0015_enter_acc.jsp", req, res);
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}

	}
	
	protected void procActionEnterACC(
			ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

			MessageRecord newmessage = null;
			ECA001501Message msgEnter = null;
			ELEERRMessage msgError = null;
			UserPos userPO = null;
			MessageProcessor mp = null;

			try {
				msgError = new datapro.eibs.beans.ELEERRMessage();
			} catch (Exception ex) {
				flexLog("Error: " + ex);
			}

			userPO = (datapro.eibs.beans.UserPos) session.getAttribute("userPO");
			
			if(req.getParameter("E01ACMACC")!= null){
				userPO.setAccNum(req.getParameter("E01ACMACC"));
			}
			
			// Send Initial data
			// Send Initial data
			try {
				mp = getMessageProcessor("ECA001501", req);
				msgEnter = (ECA001501Message) mp.getMessageRecord("ECA001501");
				msgEnter.setH01USERID(user.getH01USR());
				msgEnter.setH01PROGRM("ECA001501");
				msgEnter.setH01TIMSYS(getTimeStamp());
				
				if (userPO.getOption().equals("RT"))
					msgEnter.setH01SCRCOD("01");
				else
					msgEnter.setH01SCRCOD("04");
				
				msgEnter.setH01OPECOD("0015");
				try {
					msgEnter.setE01ILBACC(userPO.getAccNum());
				} catch (Exception e) {
					msgEnter.setE01ILBACC("0");
				}
				msgEnter.send();
				msgEnter.destroy();
				flexLog("ECA001501 Message Sent");
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				throw new RuntimeException("Socket Communication Error");
			}

			try{
				// Receive Error Message
				msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			
				if (mp.hasError(msgError)) {
					session.setAttribute("error", msgError);
					session.setAttribute("userPO", userPO);
					forward("ECA0015_enter_acc.jsp", req, res);
				} else{
					newmessage = mp.receiveMessageRecord();
					flexLog("Message " + newmessage.getFormatName() + " received.");
					msgEnter = new ECA001501Message();
					msgEnter = (ECA001501Message) newmessage;
					userPO.setPurpose("MAINTENANCE");
					userPO.setCusNum(msgEnter.getE01ILBCUN());
					userPO.setCusName(msgEnter.getD01ILBCUN());
					userPO.setBank(msgEnter.getE01ILBBNK());
					userPO.setCurrency(msgEnter.getE01ILBCCY());
					userPO.setType(msgEnter.getE01ILBTYP());
					procReqListAcc(user, req, res, session, 6);
				}
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				throw new RuntimeException("Socket Communication Error");
			}

		}
	
	
}