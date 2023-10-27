package datapro.eibs.timedeposits; 

 
import java.beans.Beans;
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import datapro.eibs.beans.EDD001001Message;
import datapro.eibs.beans.EDD009002Message;
import datapro.eibs.beans.EDL013201Message;
import datapro.eibs.beans.EDL209001Message;
import datapro.eibs.beans.EDL209002Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD400001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;
import datapro.eibs.beans.JBObjList;


public class JSEDL2090 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		switch (screen) {
			// Requests List 
			case 1 :
				procReqEnter(user, req, res, session);
				break;
			case 2 :	
				procReqInq(user, req, res, session, screen);
				break;
			case 4 : // Update record	
				procReqUpdate(user, req, res, session);
				break;
			case 5 :	
				procReqInqApproval(user, req, res, session, screen);
				break;	
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	
	protected void procReqEnter(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

			ELEERRMessage msgError = null;
			UserPos userPO = null;
			userPO = new UserPos();
			try {
				msgError = new ELEERRMessage();
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
				forward("EDL2090_cd_enter_renova.jsp", req, res);
			} catch (Exception ex) {
				flexLog("Exception calling page " + ex);
			}
	
		}

	
	// Get or Process the Record  
		//
		protected void procReqInq(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("EDL209001");
				EDL209001Message msg = (EDL209001Message) mp.getMessageRecord("EDL209001");
				msg.setH01USERID(user.getH01USR());
				msg.setH01PROGRM("EDL2090");
				msg.setH01TIMSYS(getTimeStamp());
				msg.setH01OPECOD("0003");
				userPO.setHeader10("");
				
				msg.setE01DEAACC(req.getParameter("E01DEAACC").toString());
				userPO.setAccNum(req.getParameter("E01DEAACC").toString());
				// Send Message 
				mp.sendMessage(msg);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
					forward("EDL2090_cd_enter_renova.jsp", req, res);
				} else {
						// Receive Data
					
					JBObjList listFra = procActFR(user, req, res, ses);
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("entity", newmessage);
					ses.setAttribute("EDL209002List", listFra);
					forward("EDL2090_cd_renova.jsp", req, res);
				}
				
			} finally {
				if (mp != null) 
					mp.close();
			}
		}


	protected void procReqUpdate(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

			MessageRecord newmessage = null;
			EDL209001Message msgEnter = null;
			UserPos userPO = null;
			MessageProcessor mp = null;
			ELEERRMessage msgError = null;
			boolean fracc = false;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			// Send Initial data
			try {
				mp = getMessageProcessor("EDL209001", req);
				msgEnter = (EDL209001Message) ses.getAttribute("entity");
				msgEnter.setH01USERID(user.getH01USR());
				msgEnter.setH01PROGRM("EDL2090");
				msgEnter.setH01TIMSYS(getTimeStamp());
				msgEnter.setH01SCRCOD("01");
				msgEnter.setH01OPECOD("0002");
				
				msgEnter.setE01FLGFRC((req.getParameter("E01FLGFRC") == null || !req.getParameter("E01FLGFRC").equals("Y")) ? "N" : "Y");
				
				boolean first = true;
				boolean error = false;
				if (msgEnter.getE01FLGFRC().equals("Y")){
					fracc = true;
					for(int i=1; i<10; i++){
						
						msgEnter = (EDL209001Message) ses.getAttribute("entity");
						msgEnter.setH01USERID(user.getH01USR());
						msgEnter.setH01PROGRM("EDL2090");
						msgEnter.setH01TIMSYS(getTimeStamp());
						msgEnter.setH01SCRCOD("01");
						msgEnter.setH01OPECOD("0002");
						
						msgEnter.setE01FLGFRC((req.getParameter("E01FLGFRC") == null ? "N" : "Y"));
						msgEnter.setE01NEWCUN((req.getParameter("E01NEWCU"+i) == null ? "0" : req.getParameter("E01NEWCU"+i)));
						msgEnter.setE01NEWOAM((req.getParameter("AMOUNT"+i) == null ? "0" : req.getParameter("AMOUNT"+i)));
						if(!msgEnter.getE01NEWOAM().equals("0") && !msgEnter.getE01NEWOAM().equals("0") && !msgEnter.getE01NEWOAM().equals("0.00")){
							msgEnter.setH01FLGWK1(first ? "Y":"");
							first = false;
							setMessageRecord(req, msgEnter);
							mp.sendMessage(msgEnter);
							flexLog("EDL209001 Message Sent "+i);
							// Receive Message
							msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
							newmessage = mp.receiveMessageRecord();
							if (mp.hasError(msgError)) {
								ses.setAttribute("entity", newmessage);
								ses.setAttribute("error", msgError);
								ses.setAttribute("userPO", userPO);
								error = true;
								break;
							}
							
						}
					
					}
					if(error){
						forward("EDL2090_cd_renova.jsp", req, res);
					}else{
						JBObjList listFra = procActFR(user, req, res, ses);
						ses.setAttribute("entity", newmessage);
						ses.setAttribute("EDL209002List", listFra);
						ses.setAttribute("error", msgError);
						ses.setAttribute("userPO", userPO);
						forward("EDL2090_cd_renova_confirm.jsp", req, res);
					}
				}
				else{
					setMessageRecord(req, msgEnter);
					mp.sendMessage(msgEnter);
					flexLog("EDL209001 Message Sent");
				}	
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				throw new RuntimeException("Socket Communication Error");
			}
			
			if(!fracc){
			// Receive Message
			msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(msgError)) {
				ses.setAttribute("entity", newmessage);
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
				forward("EDL2090_cd_renova.jsp", req, res);
			}
			else{
				JBObjList listFra = procActFR(user, req, res, ses);
				ses.setAttribute("entity", newmessage);
				ses.setAttribute("EDL209002List", listFra);
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
				forward("EDL2090_cd_renova_confirm.jsp", req, res);
//				res.sendRedirect(srctx + "/servlet/datapro.eibs.timedeposits.JSEDL2090?SCREEN=1");
			
			}	
			}

		}

	
	protected JBObjList procActFR(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

			UserPos userPO = null;
			MessageProcessor mp = null;
			JBObjList list = null;
			try {
				mp = new MessageProcessor("EDL2090");
				EDL209002Message msg = (EDL209002Message) mp.getMessageRecord("EDL209002");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				// Send Initial data
				msg.setH02USERID(user.getH01USR());
				msg.setH02PROGRM("EDL2090");
				msg.setH02TIMSYS(getTimeStamp());
				msg.setH02SCRCOD("01");
				msg.setH02OPECOD("0006");
				try {
					msg.setE02DEAACC(req.getParameter("E01DEAACC"));
				} catch (Exception e) {
					msg.setE02DEAACC(userPO.getAccNum());
				}
				
				userPO.setPurpose("INQUIRY");
				
				userPO.setType("RE");
				userPO.setIdentifier(msg.getE02DEAACC());
				// Send Message	
				mp.sendMessage(msg);
				ses.setAttribute("userPO", userPO);
				// Receive answer
				list = (JBObjList) mp.receiveMessageRecordList("E02INDOPE","E02NUMREC");
				if (mp.hasError(list)) {
						ses.setAttribute("error", mp.getError(list));
						forwardOnSuccess("EDL2090_cd_enter_renova.jsp", req, res);
				}
			} finally {
				if (mp != null)
					mp.close();
			}
			return list;
		}

	// Get or Process the Record  
			//
			protected void procReqInqApproval(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
				HttpSession ses, int screen)
				throws ServletException, IOException {

				MessageProcessor mp = null;
				MessageRecord newmessage = null;
				UserPos userPO = null;

				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				// Send data
				try {
					mp = new MessageProcessor("EDL209001");
					EDL209001Message msg = (EDL209001Message) mp.getMessageRecord("EDL209001");
					msg.setH01USERID(user.getH01USR());
					msg.setH01PROGRM("EDL2090");
					msg.setH01TIMSYS(getTimeStamp());
					msg.setH01OPECOD("0003");
					userPO.setHeader10("");
					
					msg.setE01DEAACC(req.getParameter("E01DEAACC").toString());
					userPO.setAccNum(req.getParameter("E01DEAACC").toString());
					// Send Message 
					mp.sendMessage(msg);

					// Receive Error Message or Data Message (Optional)
					ses.setAttribute("userPO", userPO);
					newmessage = mp.receiveMessageRecord();
					if (mp.hasError(newmessage)) {
						ses.setAttribute("error", newmessage);
						forward("EDL0140_approval_list.jsp", req, res);
					} else {
							// Receive Data
						JBObjList listFra = procActFR(user, req, res, ses);
						newmessage = mp.receiveMessageRecord();
						ses.setAttribute("entity", newmessage);
						ses.setAttribute("EDL209002List", listFra);
						forward("EDL2090_cd_renova_ap.jsp", req, res);
					}
					
				} finally {
					if (mp != null) 
						mp.close();
				}
			}

	
	protected void showERROR(ELEERRMessage m) {
		if (logType != NONE) {

			flexLog("ERROR received.");

			flexLog("ERROR number:" + m.getERRNUM());
			flexLog("ERR001 = " + m.getERNU01() + " desc: " + m.getERDS01());
			flexLog("ERR002 = " + m.getERNU02() + " desc: " + m.getERDS02());
			flexLog("ERR003 = " + m.getERNU03() + " desc: " + m.getERDS03());
			flexLog("ERR004 = " + m.getERNU04() + " desc: " + m.getERDS04());
			flexLog("ERR005 = " + m.getERNU05() + " desc: " + m.getERDS05());
			flexLog("ERR006 = " + m.getERNU06() + " desc: " + m.getERDS06());
			flexLog("ERR007 = " + m.getERNU07() + " desc: " + m.getERDS07());
			flexLog("ERR008 = " + m.getERNU08() + " desc: " + m.getERDS08());
			flexLog("ERR009 = " + m.getERNU09() + " desc: " + m.getERDS09());
			flexLog("ERR010 = " + m.getERNU10() + " desc: " + m.getERDS10());

		}
	}
	

	
	}
	
	