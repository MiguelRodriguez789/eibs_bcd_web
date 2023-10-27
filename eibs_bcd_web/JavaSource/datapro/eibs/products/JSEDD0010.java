package datapro.eibs.products; 

 
import java.beans.Beans;
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import datapro.eibs.beans.EDD001001Message;
import datapro.eibs.beans.EDD009002Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;
import datapro.eibs.beans.JBObjList;


public class JSEDD0010 extends JSEIBSServlet { 
	 
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
				procReqList(user, req, res, session);
				break;
			case 3 : // New Record
				procReqNew(user, req, res, session);
				break;
			case 4 : // Update record	
				procReqUpdate(user, req, res, session);
				break;
			case 5 : // Get record	
			case 7 : // Delete
				procReqInq(user, req, res, session, screen);
				break;
			case 32 : // Inquery
				procReqInqBasic(user, req, res, session);
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
				String type = req.getParameter("Type");
				userPO.setType(type);
				String mode = req.getParameter("Mod");
				userPO.setPurpose(mode);
				msgError = new ELEERRMessage();
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
				forward("EDD0010_sav_acc_group_enter.jsp", req, res);
			} catch (Exception ex) {
				flexLog("Exception calling page " + ex);
			}
	
		}
	// SCREEN = 1, 6 
	// Send List of Interfaces  
	//
	protected void procReqList(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

			MessageRecord newmessage = null;
			EDD001001Message msgEnter = null;
			EDD001001Message msgHeader = null;
			JBObjList msgList = null;
			ELEERRMessage msgError = null;
			UserPos userPO = null;
			MessageProcessor mp = null;

			try {
				msgError =
					(datapro.eibs.beans.ELEERRMessage) Beans.instantiate(
						getClass().getClassLoader(),
						"datapro.eibs.beans.ELEERRMessage");
			} catch (Exception ex) {
				flexLog("Error: " + ex);
			}

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			if(req.getParameter("H01BNK")!= null){
				userPO.setBank(req.getParameter("H01BNK"));
			}
			if(req.getParameter("H01CCY")!= null){
				userPO.setCurrency(req.getParameter("H01CCY"));
			}
			if(req.getParameter("H01CDE")!= null){
				userPO.setProdCode(req.getParameter("H01CDE"));
			}
			// Send Initial data
			try {
				mp = getMessageProcessor("EDD001001", req);
				msgEnter = (EDD001001Message) mp.getMessageRecord("EDD001001");
				msgEnter.setH01USERID(user.getH01USR());
				msgEnter.setH01PROGRM("EDD001001");
				msgEnter.setH01TIMSYS(getTimeStamp());
				msgEnter.setH01SCRCOD("01");
				msgEnter.setH01OPECOD("0015");
				msgEnter.setH01BNK(userPO.getBank());
				msgEnter.setH01CCY(userPO.getCurrency());
				msgEnter.setH01CDE(userPO.getProdCode());
				
				msgEnter.setE01NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
				msgEnter.setE01AHGNUM((req.getParameter("SEARCHCDE") == null ? userPO.getHeader6() : req.getParameter("SEARCHCDE")));
				userPO.setHeader6(msgEnter.getE01AHGNUM());
				msgEnter.send();
				msgEnter.destroy();
				flexLog("EDD001001 Message Sent");
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				throw new RuntimeException("Socket Communication Error");
			}

			// Receive Message
			// Receive Message
			msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
		
			if (mp.hasError(msgError)) {
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
				forward("EDD0010_sav_acc_group_enter.jsp", req, res);
			}
			else{
				// Receive Data Header
				newmessage = mp.receiveMessageRecord();
				msgHeader = new EDD001001Message();
				msgHeader = (EDD001001Message) newmessage;
				userPO.setHeader1(msgHeader.getH01TYP());
				userPO.setHeader2(msgHeader.getH01DSC());
				userPO.setHeader3(msgHeader.getH01TBL());
				userPO.setBranch(msgHeader.getE01AHGBRN());
				userPO.setHeader4(msgHeader.getE01AHGDSB());
				// Receive Data List	
				msgList = (JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
				
				if (mp.hasError(msgList)) {
					ses.setAttribute("error", mp.getError(msgList));
				} 
				
				ses.setAttribute("msgHeader", msgHeader);
				ses.setAttribute("msgList", msgList);
				ses.setAttribute("userPO", userPO);
				forward("EDD0010_sav_acc_group_list.jsp", req, res);
			
			}	

		}


	protected void procReqNew(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

			ELEERRMessage msgError = null;
			UserPos userPO = null;
			EDD001001Message msgBasic = null;
			
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			try {
				msgError = new ELEERRMessage();
				msgBasic = new EDD001001Message();
				
				userPO.setHeader10("N");
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("entity", msgBasic);
				forward("EDD0010_sav_acc_group_det.jsp", req, res);
			} catch (Exception ex) {
				flexLog("Exception calling page " + ex);
			}
		
		}

	protected void procReqUpdate(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

			MessageRecord newmessage = null;
			EDD001001Message msgEnter = null;
			EDD001001Message msgOut = null;
			UserPos userPO = null;
			MessageProcessor mp = null;
			ELEERRMessage msgError = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			// Send Initial data
			try {
				mp = getMessageProcessor("EDD001001", req);
				msgEnter = (EDD001001Message) ses.getAttribute("entity");
				msgOut = (EDD001001Message) ses.getAttribute("entity");
				msgEnter.setH01USERID(user.getH01USR());
				msgEnter.setH01PROGRM("EDD001001");
				msgEnter.setH01TIMSYS(getTimeStamp());
				msgEnter.setH01SCRCOD("01");
				msgEnter.setH01OPECOD("0002");
				if (userPO.getHeader10().equals("N")) //New
				  msgEnter.setH01OPECOD("0001");
				else if(userPO.getHeader10().equals("D")){        
					msgEnter.setH01OPECOD("0004");   //Delete
				}	
				msgEnter.setH01BNK(userPO.getBank());
				msgEnter.setH01CCY(userPO.getCurrency());
				msgEnter.setH01CDE(userPO.getProdCode());
				setMessageRecord(req, msgEnter);
				setMessageRecord(req, msgOut);
				mp.sendMessage(msgEnter);
				flexLog("EDD001001 Message Sent");
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				throw new RuntimeException("Socket Communication Error");
			}

			// Receive Message
			msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(msgError)) {
				//msgEnter = (EDD001001Message) mp.getMessageRecord("EDD001001");
				ses.setAttribute("entity", newmessage);
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
				forward("EDD0010_sav_acc_group_det.jsp", req, res);
			}
			else{
				
				res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSEDD0010?SCREEN=2");
			
			}	

		}

	
	// SCREEN = 2,3,5
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
			mp = new MessageProcessor("EDD001001");
			EDD001001Message msg = (EDD001001Message) mp.getMessageRecord("EDD001001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDD0000");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0003");
			userPO.setHeader10("");
			if(screen == 3){
				userPO.setHeader10("N");
			}else if(screen == 7){        
				userPO.setHeader10("D");    
			}
			msg.setE01AHGNUM(req.getParameter("E01AHGNUM").toString());
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				forward("EDD0010_sav_acc_group_list.jsp", req, res);
			} else {
					// Receive Data
				newmessage = mp.receiveMessageRecord();
				ses.setAttribute("entity", newmessage);
				forward("EDD0010_sav_acc_group_det.jsp", req, res);
			}
			
		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	private void procReqInqBasic(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0090", req);
			EDD009002Message msgRT = (EDD009002Message) mp.getMessageRecord("EDD009002");
		 	msgRT.setH02USERID(user.getH01USR());
		 	msgRT.setH02PROGRM("EDD0090");
		 	msgRT.setH02TIMSYS("");//getTimeStamp()
		 	msgRT.setH02SCRCOD("01");
		 	msgRT.setH02OPECOD("0004");
		 	userPO.setOption("SV");
		 	userPO.setAccNum(req.getParameter("ACC").toString());
		 	System.out.println(req.getParameter("ACC").toString());
		 	if (req.getParameter("ACC").equals(null) || req.getParameter("ACC").equals(""))
		 		msgRT.setE02ACMACC("0");
		 	else
		 		msgRT.setE02ACMACC(req.getParameter("ACC").toString());

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD009002Message) mp.receiveMessageRecord("EDD009002");

			if (mp.hasError(msgError)) {
				pageName = "EDD0000_rt_enter_inquiry.jsp";
			} else {
				pageName = "EDD0010_sav_acc_schedule_inq.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtBasic", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
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