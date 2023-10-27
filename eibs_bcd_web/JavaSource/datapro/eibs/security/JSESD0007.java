package datapro.eibs.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.security.UserRegistryPasswordEntry;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD000701Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.sockets.CharacterField;;
/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSESD0007 extends JSEIBSServlet {

	protected static final int R_ENTER_USER		= 1;
	protected static final int A_ENTER_USER		= 2;
	protected static final int A_MAINT_USER		= 3;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			//Request
			case R_ENTER_USER :
				 procReqEnterUser(user, req, res, session);							
				 break;
			case A_ENTER_USER :
				procActionEnterUser(user, req, res, session);
				break;
			case A_MAINT_USER :
			case 4:	
				procActionMaintenance(user, req, res, session, screen);
				break;
			case 7:	
			case 22: // Group Information	
				procActionInq(user, req, res, session, screen);
				break;
			case 6:  // Send list for Approval / Rejected 
			    procReqList(user, req, res, session, screen);
				break;  
			case 20: // Approval 
			case 21: // Rejected
			case 24:  // Delete record
				procActionRec(user, req, res, session, screen);
				break;  		
				// END Entering
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procActionMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {

		
		UserPos userPO = getUserPos(req);
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0007", req);
			ESD000701Message msgUsr = (ESD000701Message) mp.getMessageRecord("ESD000701");
			msgUsr.setH01USERID(user.getH01USR());
			msgUsr.setH01PROGRM("ESD0007");
			msgUsr.setH01TIMSYS(getTimeStamp());

			switch (screen) {
			case 4 : // 
				msgUsr.setH01OPECOD("0004");
		        userPO.setPurpose("INACTIVE");
			    break;
		    case 3 : // 
				msgUsr.setH01OPECOD("0005");
				userPO.setPurpose("MAINTENANCE");
			    break;    
			default :
				forward(devPage, req, res);
				break;
			}
			
			setMessageRecord(req, msgUsr);
			try {
				((CharacterField) msgUsr.getField("E01BTHEML")).setStringUD(req.getParameter("E01BTHEML"));
			} catch (Exception e) {
			}
			try {
				((CharacterField) msgUsr.getField("E01NETUSR")).setStringUD(req.getParameter("E01NETUSR"));
			} catch (Exception e) {
			}
			mp.sendMessage(msgUsr);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgUsr = (ESD000701Message) mp.receiveMessageRecord("ESD000701");
			UserRegistryPasswordEntry userEntry = (UserRegistryPasswordEntry) session.getAttribute("userRegistry");
			
			flexLog("Putting java beans into the session");
			session.setAttribute("user", msgUsr);
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			
			if (mp.hasError(msgError)) {
				forward("ESD0007_user_access_basic.jsp", req, res);
			} else {
				if (userEntry != null) {
					if (userEntry.hasRole(1)) {
						//has teller role
						res.sendRedirect(srctx + "/servlet/datapro.eibs.security.JSUsersTeller?SCREEN=2&TELLUSERID=" + userEntry.getName());
					} else if (userEntry.hasRole(2)) {
						//has reporter role
						res.sendRedirect(srctx + "/servlet/datapro.eibs.security.JSUsersReporter?SCREEN=2&USERID=" + userEntry.getName());
					} else {
						forward("ESD0007_user_access_confirm.jsp",	req, res);
					}
				} else {
					forward("ESD0007_user_access_confirm.jsp",	req, res);
				}
			}
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionEnterUser(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0007", req);
			ESD000701Message msgUsr = (ESD000701Message) mp.getMessageRecord("ESD000701");
			msgUsr.setH01USERID(user.getH01USR());
			msgUsr.setH01PROGRM("ESD0007");
			msgUsr.setH01TIMSYS(getTimeStamp());
			msgUsr.setH01SCRCOD("01");
			msgUsr.setH01OPECOD(req.getParameter("E01OPETYP") == null ? "0002" : req.getParameter("E01OPETYP"));
			msgUsr.setE01BTHKEY(req.getParameter("E01BTHKEY") == null ? "" : req.getParameter("E01BTHKEY"));
			
			userPO.setPurpose(msgUsr.getH01OPECOD().equals("0001") ? "NEW" : "MAINTENANCE");
			
			mp.sendMessage(msgUsr);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgUsr = (ESD000701Message) mp.receiveMessageRecord("ESD000701");
			UserRegistryPasswordEntry userEntry = (UserRegistryPasswordEntry) session.getAttribute("userRegistry");
			
			if (mp.hasError(msgError)) {
				pageName = (userEntry != null) ? "ESD0007_user_access_basic.jsp" : "ESD0007_user_access_enter.jsp";
			} else {
				pageName = "ESD0007_user_access_basic.jsp";
			}
			
			flexLog("Putting java beans into the session");
			session.setAttribute("user", msgUsr);
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}
//	 SCREEN = 7
	// Inquiry Source Document 
	//
	protected void 	procActionInq(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0007", req);
			ESD000701Message msgUsr = (ESD000701Message) mp.getMessageRecord("ESD000701");
			msgUsr.setH01USERID(user.getH01USR());
			msgUsr.setH01PROGRM("ESD0007");
			msgUsr.setH01TIMSYS(getTimeStamp());
			msgUsr.setH01SCRCOD("01");
			
			switch (screen) {
			case 7 : // 
				msgUsr.setH01OPECOD("0006");
		        userPO.setPurpose("INQUIRY");
			    break;
		    case 22 : // 
		    	msgUsr.setH01OPECOD("0022");
		        userPO.setPurpose("NEW");
		    	msgUsr.setE01BTHNME(req.getParameter("E01BTHNME") == null ? "" : req.getParameter("E01BTHNME"));
		    	msgUsr.setE01BTHIDN(req.getParameter("E01BTHIDN") == null ? "" : req.getParameter("E01BTHIDN"));
		    	msgUsr.setE01BTHEML(req.getParameter("E01BTHEML") == null ? "" : req.getParameter("E01BTHEML"));
		    	msgUsr.setE01BTHPHN(req.getParameter("E01BTHPHN") == null ? "" : req.getParameter("E01BTHPHN"));
		    	msgUsr.setE01BTHPXT(req.getParameter("E01BTHPXT") == null ? "" : req.getParameter("E01BTHPXT"));
		    	msgUsr.setE01BTHDIB(req.getParameter("E01BTHDIB") == null ? "" : req.getParameter("E01BTHDIB"));
			    break;    
			default :
				forward(devPage, req, res);
				break;
			}
			
			msgUsr.setE01BTHKEY(req.getParameter("E01BTHKEY") == null ? "" : req.getParameter("E01BTHKEY"));
			msgUsr.setE01BTHGRP(req.getParameter("E01BTHGRP") == null ? "" : req.getParameter("E01BTHGRP"));
			
			mp.sendMessage(msgUsr);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgUsr = (ESD000701Message) mp.receiveMessageRecord("ESD000701");
			
			if (mp.hasError(msgError)) {
				pageName =  "ESD0007_user_access_basic.jsp";
			} else {
				pageName = "ESD0007_user_access_basic.jsp";
			}
			
			flexLog("Putting java beans into the session");
			session.setAttribute("user", msgUsr);
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			
			forward(pageName, req, res);
	
	
		} finally {
			if (mp != null) mp.close();
		}
	}

	// SCREEN = 6
	// Send list for Approval / Rejected 

	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			UserPos userPO = null;
			String PageToCall = "MISC_no_result.jsp";
			
			MessageProcessor mp = null;
			try {
				mp = new MessageProcessor("ESD0007");
				ESD000701Message msg = (ESD000701Message) mp.getMessageRecord("ESD000701");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				// Send Initial data
				msg.setH01USERID(user.getH01USR());
				msg.setH01PROGRM("ESD0007");
				msg.setH01TIMSYS(getTimeStamp());
				msg.setH01SCRCOD("01");
				
				switch (screen) {
			    case 6: // List approval
			        msg.setH01OPECOD("0015");
					userPO.setPurpose("APPROVAL");
					break;
			    default :
					forward(devPage, req, res);
					break;
				}
				//msg.setE01NUMREC(req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord"));
				msg.setE01BTHKEY(req.getParameter("SEARCHCDE") == null ? "" : req.getParameter("SEARCHCDE"));
				
				userPO.setHeader1(msg.getE01BTHKEY());
				// Send Message	
				flexLog("Putting java beans into the session");
				mp.sendMessage(msg);
				ses.setAttribute("userPO", userPO);
				
				// Receive List
				ELEERRMessage msgError = new ELEERRMessage();
				JBObjList list = (JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
				if (mp.hasError(list)) {
					msgError = (ELEERRMessage) mp.getError(list);
					PageToCall = "ESD0007_user_list.jsp";
				} else {
					ses.setAttribute("ESD0007List", list);
					PageToCall = "ESD0007_user_list.jsp";
				}	
					ses.setAttribute("error", msgError);
					ses.setAttribute("userPO", userPO);
					
					forward(PageToCall, req, res);
					
			} finally {
				if (mp != null)
					mp.close();
			}
		}

//	 SCREEN = 15, 4
	// Get or Process Record  
	//
	protected void procActionRec(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0007", req);
			ESD000701Message msgUsr = (ESD000701Message) mp.getMessageRecord("ESD000701");
			msgUsr.setH01USERID(user.getH01USR());
			msgUsr.setH01PROGRM("ESD0007");
			msgUsr.setH01TIMSYS(getTimeStamp());

			switch (screen) {
			case 20 : // 
				msgUsr.setH01OPECOD("0020");
		        userPO.setPurpose("APPROVAL");
			    break;
			case 21 : // 
				msgUsr.setH01OPECOD("0021");
		        userPO.setPurpose("REJECTED");
			    break;
			case 24 : // Delete Record
				msgUsr.setH01OPECOD("0024");
		        userPO.setPurpose("DELETE");
				break;
			default :
				forward(devPage, req, res);
				break;
			}
			
			msgUsr.setE01BTHKEY(req.getParameter("E01BTHKEY") == null ? "" : req.getParameter("E01BTHKEY"));
			//msgUsr.setE01ACT(req.getParameter("E01ACT") == null ? "R" : req.getParameter("E01ACT"));
			
			setMessageRecord(req, msgUsr);
			
			mp.sendMessage(msgUsr);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgUsr = (ESD000701Message) mp.receiveMessageRecord("ESD000701");
			
			flexLog("Putting java beans into the session");
			session.setAttribute("user", msgUsr);
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			
			if (mp.hasError(msgError)) {
				forward("ESD0007_user_list.jsp", req, res);
			} else {
				res.sendRedirect(srctx + "/servlet/datapro.eibs.security.JSESD0007?SCREEN=6&FromRecord=0");
			}
			
		} finally {
			if (mp != null) mp.close();
		}
	}
	
	private void procReqEnterUser(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		session.setAttribute("error", new ELEERRMessage());
		
		forward("ESD0007_user_access_enter.jsp", req, res);
	}

}
