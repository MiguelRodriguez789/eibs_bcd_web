package datapro.eibs.params;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.sockets.*;
import datapro.eibs.beans.EDL016002Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD052501Message;
import datapro.eibs.beans.ESD052502Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.Util;

public class JSESD0525 extends JSEIBSServlet {

	protected static final int R_LIST = 100;
	protected static final int A_LIST = 101;
	protected static final int R_NEW = 200;
	protected static final int R_MAINT = 201;
	protected static final int R_DELETE = 202;	
	protected static final int R_INQUIRY = 203;
	protected static final int R_CANCEL = 204;
	protected static final int R_DELETE_A = 205;
	protected static final int R_GENERIC_INFO = 500;
	protected static final int A_MAINT = 600;
	protected static final int R_COMISION_FROM_LOANS = 1000;
	protected static final int R_COMISION_FROM_LOANS_CONSULTA = 1050;
	protected static final int R_COMISION_FROM_LOANS_APPROVAL = 1200;
	
	protected static final int R_COMISION_FROM_PRODUCT = 2000;
	protected static final int A_COMISION_FROM_PRODUCT = 2100;

	protected static final int R_PASSWORD = 10;	
	protected static final int R_APPROVAL = 20;
	protected static final int A_APPROVAL = 30;	
	
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {
		
		switch (screen) {
			case R_LIST:
				procReqList(user, req, res, session);
				break;
			case A_LIST:
				procActList(user, req, res, session);
				break;
			case R_NEW:
				procReqNew(user, req, res, session);
				break;
			case R_MAINT:
				procReqMaint(user, req, res, session);
				break;
			case R_COMISION_FROM_LOANS:
				procReqMaintInqLoans(user, req, res, session);
				break;	
			case R_COMISION_FROM_LOANS_CONSULTA:
				procReqConsultaLoans(user, req, res, session);
				break;	
			case R_COMISION_FROM_LOANS_APPROVAL:
				procReqConsultaApproval(user, req, res, session);
				break;					
			case R_INQUIRY:
				procReqInquiry(user, req, res, session);
				break;
			case R_CANCEL:
				procReqCancel(user, req, res, session);
				break;
			case R_GENERIC_INFO:				
			case A_MAINT:
				procActMaintenance(user, req, res, session);
				break;
			case R_DELETE:
				procReqDelete(user, req, res, session);
				break;
			case R_DELETE_A:
				procReqDeleteApproval(user, req, res, session);
				break;

			//
				
			case R_PASSWORD :
				procReqPassword(req, res, session);
				break;
			case R_APPROVAL :
				procReqApproval(user, req, res, session);
				break;
			case A_APPROVAL:
				procActionApproval(user, req, res, session);
				break;
			case A_COMISION_FROM_PRODUCT :
				redirectTOProd(user, req, res, session);
				break;				
			
			default:
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}
	
	private void redirectTOProd(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,  HttpSession session) 
			throws ServletException, IOException {
		forward("ESD0700_products_loans.jsp", req, res);
		
	}	
	
	
	private void procReqConsultaApproval(ESS0030DSMessage user,HttpServletRequest req, HttpServletResponse res, HttpSession session) 
			throws ServletException, IOException {
			UserPos userPO = getUserPos(req);
			MessageProcessor mp = null;
			
			try {
				String readOnly = "true";
				userPO.setSource("POPUP");
				userPO.setHeader20("INQUIRY");

				mp = getMessageProcessor("ESD0525", req);
		
				ESD052501Message msg = (ESD052501Message) mp.getMessageRecord("ESD052501");
				msg.setH01USERID(user.getH01USR());
				msg.setH01PROGRM("ESD0525");
				msg.setH01TIMSYS(getTimeStamp());
				msg.setH01SCRCOD("01");
				msg.setH01OPECOD("0002");
				msg.setE01DLFBNK(Util.getReqParameter("BANK", req));
				msg.setE01DLFTYP(Util.getReqParameter("TYPE", req));
				msg.setE01DLFCUN(Util.getReqParameter("CUN", req));
				msg.setE01DLFACD(Util.getReqParameter("APCD", req));
				msg.setE01DLFTBL(Util.getReqParameter("TBL", req));				

				mp.sendMessage(msg);	
				
				ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
				ESD052501Message msgRecieved = (ESD052501Message) mp.receiveMessageRecord("ESD052501");
				
				if (mp.hasError(msgError)) {
					session.setAttribute("error", msgError);
					forward("error_viewer.jsp", req, res);
				} else {
					session.setAttribute("datarec", msgRecieved);
					session.setAttribute("error", msgError);
					forward("ESD0525_tarifas_maintenance.jsp?readOnly="+readOnly, req, res);
				}
		
			} finally {
				if (mp != null) mp.close();
			}		

			}	
	

	private void procReqConsultaLoans(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		String readOnly = "true";
		Boolean hasNoError = true;
		
		//Sending Info To get Loan Information
		try {
			userPO = getLoanInformatiopn(user, req, res, session, userPO);
			
			mp = getMessageProcessor("ESD0525", req);
			
			ESD052501Message msg = (ESD052501Message) mp.getMessageRecord("ESD052501");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD0525");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0004");
			msg.setE01DLFBNK(userPO.getBank());
			msg.setE01DLFTYP(userPO.getType());
			msg.setE01DLFCUN(userPO.getCusNum());
			msg.setE01DLFACD(userPO.getApplicationCode());
			msg.setE01DLFTBL(userPO.getHeader7()); //Table of Comission en Header 7

			mp.sendMessage(msg);	
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			ESD052501Message msgRecieved = (ESD052501Message) mp.receiveMessageRecord("ESD052501");
			
			if (mp.hasError(msgError)) {
				if(msgError.getERNU01().equals("0942") && msgError.getERRNUM().equals("1")){//Error: Table does Not Exist
					mp.close();
					mp = null;
					mp = getMessageProcessor("ESD0525", req);//Search by Product in lieu
					msg.setH01OPECOD("0004");
					msg.setE01DLFCUN(""); //Setting CUN to "" to search by Products
					mp.sendMessage(msg);
					
					msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
					msgRecieved = (ESD052501Message) mp.receiveMessageRecord("ESD052501");
				}	
			} 

			session.setAttribute("userPO", userPO);
			session.setAttribute("datarec", msgRecieved);
			forward("ESD0525_tarifas_maintenance.jsp?readOnly="+readOnly, req, res);
			
		} finally {
			mp.close();
		}
	}
	
	private UserPos getLoanInformatiopn (ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, UserPos userPO) 
			throws ServletException, IOException {
			MessageProcessor mp = null;
			EDL016002Message msgTemp = null;			
			
					//Sending Info To get Loan Information
			try {
				mp = getMessageProcessor("EDL0160", req);
				
				EDL016002Message msg = (EDL016002Message) mp.getMessageRecord("EDL016002");
				msg.setH02USERID(user.getH01USR());
				msg.setH02PROGRM("EDL0160");
				msg.setH02TIMSYS(getTimeStamp());
				msg.setH02SCRCOD("01");
				msg.setH02OPECOD("0004");
			 	msg.setE02DEAACC(userPO.getAccNum());
			 	msg.setE02DEAACD("10");
				mp.sendMessage(msg);	
				
				MessageRecord newmessage = mp.receiveMessageRecord();
				
				if (newmessage instanceof ELEERRMessage ) {
					ELEERRMessage msgError = (ELEERRMessage) newmessage;
					msgTemp = new EDL016002Message();
				} else if (newmessage instanceof EDL016002Message ) {			
					 msgTemp = (EDL016002Message) newmessage;
				}
				
			} finally {
				mp.close();
				userPO.setHeader7(msgTemp.getE02DEAOFT());
			}
			return userPO;
	}	
	
	
/*	Determines if It's a Maint. Or Consultation procedure by request parameter "readOnly"
 * 	Ask AS400 For the Data specific to Client. 
 *  If no data specific to Client. Error Occurs.
 *  After Error:
 *  If Maint. We go ahead and create a new table and associate it with client with h01opecod = '0001'
 *  If Readonly. We ask the AS400 for generic Table with H01OPECOD = '0004' 													
 *  Response goes to PopUp. 
*
*/
	
	private void procReqMaintInqLoans(ESS0030DSMessage user,HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		
		try {
			String readOnly = Util.getReqParameter("readOnly", req);
			userPO.setHeader20(readOnly.equals("true") ? "MAINTENANCE" : "INQUIRY");
			userPO.setSource("POPUP");

			mp = getMessageProcessor("ESD0525", req);
	
			ESD052501Message msg = (ESD052501Message) mp.getMessageRecord("ESD052501");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD0525");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0002");
			msg.setE01DLFBNK(Util.getReqParameter("BANK", req));
			msg.setE01DLFTYP(Util.getReqParameter("TYPE", req));
			msg.setE01DLFCUN(Util.getReqParameter("CUN", req));
			msg.setE01DLFACD(Util.getReqParameter("APCD", req));
			msg.setE01DLFTBL(Util.getReqParameter("TBL", req));				

			mp.sendMessage(msg);	
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			ESD052501Message msgRecieved = (ESD052501Message) mp.receiveMessageRecord("ESD052501");
			
			if (mp.hasError(msgError)) {
				if(msgError.getERNU01().equals("0942") && msgError.getERRNUM().equals("1")){
					mp.close();																
					mp = null;																
					mp = getMessageProcessor("ESD0525", req);								
					msg.setH01OPECOD( readOnly.equals("true") ? "0004" : "0001");    		
					mp.sendMessage(msg);
					
					msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
					msgRecieved = (ESD052501Message) mp.receiveMessageRecord("ESD052501");
					session.setAttribute("userPO", userPO);	
				}
				
				if (mp.hasError(msgError)) {//Close Top Window if Another Error Occurs
					session.setAttribute("datarec", msgRecieved);
					session.setAttribute("error", msgError);
					printClose(res.getWriter());
				}else{
					session.setAttribute("datarec", msgRecieved);
					session.setAttribute("error", msgError);
					forward("ESD0525_tarifas_maintenance.jsp?readOnly="+readOnly, req, res);
				}
			} else {
				session.setAttribute("datarec", msgRecieved);
				session.setAttribute("error", msgError);
				forward("ESD0525_tarifas_maintenance.jsp?readOnly="+readOnly, req, res);
			}
	
		} finally {
			if (mp != null) mp.close();
		}		

		}

	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		UserPos userPO = getUserPos(ses);
		userPO.setApplicationCode(req.getParameter("appCode") == null ? "" : req.getParameter("appCode").trim());
		ses.removeAttribute("header");
		try {
			ses.setAttribute("userPO", userPO);
			forward("ESD0525_tarifas_enter_search.jsp", req, res);
		} catch (IOException e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}
		
	}
	
	protected void procActList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		UserPos userPO = getUserPos(ses);
		
		try {
			mp = getMessageProcessor("ESD0525", req);

			ESD052501Message msg = (ESD052501Message) mp.getMessageRecord("ESD052501");
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0015");
			msg.setH01TIMSYS(getTimeStamp());
			
			if (ses.getAttribute("header") != null ) {
				ESD052502Message header = (ESD052502Message) ses.getAttribute("header");
				msg.setE01DLFBNK(header.getE02DLFBNK().trim());
				msg.setE01DLFTYP(header.getE02DLFTYP().trim());
				msg.setE01DLFCUN(header.getE02DLFCUN().trim());
				msg.setE01DLFACD(header.getE02DLFACD().trim());
			} else {
				msg.setE01DLFBNK(Util.getReqParameter("E01DLSBNK", req));
				msg.setE01DLFTYP(Util.getReqParameter("E01DLSATY", req)) ; 
				msg.setE01DLFCUN(Util.getReqParameter("E01DLSCUN", req)) ; 
				msg.setE01DLFACD(Util.getReqParameter("E01DLSACD", req)) ;
			}
			
			mp.sendMessage(msg);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
 
			if (mp.hasError(msgError)) {
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
				forward("ESD0525_tarifas_enter_search.jsp", req, res);
			} else {
				ESD052502Message header = (ESD052502Message) mp.receiveMessageRecord("ESD052502");
				JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
				ses.setAttribute("userpPO", userPO);
				ses.setAttribute("header", header);
				ses.setAttribute("ESD052501List", list);
				forward("ESD0525_tarifas_list.jsp", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		
		try {
			userPO.setHeader20("NEW");
			
			mp = getMessageProcessor("ESD0525", req);
			ESD052501Message msg = (ESD052501Message) mp.getMessageRecord("ESD052501");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD0525");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0001");
			
			ESD052502Message header = (ESD052502Message) session.getAttribute("header");

			msg.setE01DLFBNK(header.getE02DLFBNK().trim());
			msg.setE01DLFTYP(header.getE02DLFTYP().trim());
			msg.setE01DLFCUN(header.getE02DLFCUN().trim());
			msg.setE01DLFACD(header.getE02DLFACD().trim());
			msg.setE01DLFTBL(req.getParameter("E01DLSTBL").trim());

			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (ESD052501Message) mp.receiveMessageRecord("ESD052501");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("ESD0525_tarifas_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msg);
				session.setAttribute("error", msgError);
				forward("ESD0525_tarifas_maintenance.jsp", req, res);
			}
	
		} finally {
			if (mp != null) mp.close();
		}
		
	}

	private void procReqMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		ESD052501Message listMessage = null;
		
		try {
			userPO.setHeader20("MAINTENANCE");

			mp = getMessageProcessor("ESD0525", req);
	
			if (req.getParameter("key") != null) {
				JBObjList list = (JBObjList)session.getAttribute("ESD052501List");
				int index = Integer.parseInt(req.getParameter("key").trim());
				listMessage = (ESD052501Message)list.get(index);
			}

			ESD052501Message msg = (ESD052501Message) mp.getMessageRecord("ESD052501");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD0525");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0002");
			
			if(req.getParameter("key") != null){
				msg.setE01DLFBNK(listMessage.getE01DLFBNK().trim());
				msg.setE01DLFTYP(listMessage.getE01DLFTYP().trim());
				msg.setE01DLFCUN(listMessage.getE01DLFCUN().trim());
				msg.setE01DLFACD(listMessage.getE01DLFACD().trim());
				msg.setE01DLFTBL(listMessage.getE01DLFTBL().trim());
			}else{
				msg.setE01DLFBNK(Util.getReqParameter("BANK", req));
				msg.setE01DLFTYP(Util.getReqParameter("TYPE", req));
				msg.setE01DLFCUN(Util.getReqParameter("CUN", req));
				msg.setE01DLFACD(Util.getReqParameter("APCD", req));
				msg.setE01DLFTBL(Util.getReqParameter("TBL", req));				
			}
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (ESD052501Message) mp.receiveMessageRecord("ESD052501");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("ESD0525_tarifas_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msg);
				session.setAttribute("error", msgError);
				forward("ESD0525_tarifas_maintenance.jsp", req, res);
			}
	
		} finally {
			if (mp != null) mp.close();
		}

	}

	private void procReqInquiry(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		ESD052501Message listMessage = null;
		
		try {
			mp = getMessageProcessor("ESD0525", req);
		
			if (req.getParameter("key") != null) {
				JBObjList list = (JBObjList)session.getAttribute("ESD052501List");
				int index = Integer.parseInt(req.getParameter("key").trim());
				listMessage = (ESD052501Message)list.get(index);
			}

			ESD052501Message msg = (ESD052501Message) mp.getMessageRecord("ESD052501");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD0525");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0002");
			
			msg.setE01DLFBNK(listMessage.getE01DLFBNK().trim());
			msg.setE01DLFTYP(listMessage.getE01DLFTYP().trim());
			msg.setE01DLFCUN(listMessage.getE01DLFCUN().trim());
			msg.setE01DLFACD(listMessage.getE01DLFACD().trim());
			msg.setE01DLFTBL(listMessage.getE01DLFTBL().trim());
			

			if (userPO.getHeader20().equals("APPROVAL")) { 
				userPO.setApplicationCode(listMessage.getE01DLFACD());
			}
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (ESD052501Message) mp.receiveMessageRecord("ESD052501");
		
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("ESD0525_tarifas_list_approval.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msg);
				session.setAttribute("error", msgError);
				forward("ESD0525_tarifas_maintenance.jsp?readOnly=true", req, res);
			}
		
		} finally {
			if (mp != null) mp.close();
		}
		
	}

	private void procReqCancel(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		procActList(user, req, res, session);
		
	}

	protected void procActMaintenance(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0525", req);
			ESD052501Message msg = (ESD052501Message) mp.getMessageRecord("ESD052501");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD0525");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0005");
			
			setMessageRecord(req, msg);

			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (ESD052501Message) mp.receiveMessageRecord("ESD052501");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				if(!req.getParameter("SCREEN").equals("500"))session.setAttribute("error", msgError); //Screen 500 indicates the Method is Called to Show Generic Information from AS400.
				session.setAttribute("datarec",	msg);
				forward("ESD0525_tarifas_maintenance.jsp", req, res);
			} else {
				if(userPO.getSource().equals("POPUP")){
					//Triger Change Event in DOM within CloseWindow.jsp for Following Element Names
					JBObjList triggerVars = new JBObjList();
					triggerVars.add("E01DEAOFT");
					req.setAttribute("triggerVars", triggerVars);
					forward("CloseWindow.jsp", req, res);
				}else{
					session.setAttribute("userPO", userPO);
					session.setAttribute("datarec",	msg);
					if(!req.getParameter("SCREEN").equals("500")){
						procActList(user, req, res, session);
					}else{
						forward("ESD0525_tarifas_maintenance.jsp", req, res);
					}
				}

			}
		} finally {
			if (mp != null) mp.close();
		}
	}

	protected void procReqDelete(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0525", req);
			
			JBObjList list = (JBObjList)session.getAttribute("ESD052501List");
			int index = Integer.parseInt(req.getParameter("key").trim());
			ESD052501Message listMessage = (ESD052501Message)list.get(index);
			
			ESD052501Message msg = (ESD052501Message) mp.getMessageRecord("ESD052501");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD0525");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0009");
			
			msg.setE01DLFBNK(listMessage.getE01DLFBNK().trim());
			msg.setE01DLFTYP(listMessage.getE01DLFTYP().trim());
			msg.setE01DLFCUN(listMessage.getE01DLFCUN().trim());
			msg.setE01DLFACD(listMessage.getE01DLFACD().trim());
			msg.setE01DLFTBL(listMessage.getE01DLFTBL().trim());			

			mp.sendMessage(msg);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (!mp.hasError(msgError)) {
				procActList(user, req, res, session);
			} else {
				session.setAttribute("error", msgError);
				forward("ESD0525_tarifas_list.jsp", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}
	}


	protected void procReqDeleteApproval(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0525", req);
			
			JBObjList list = (JBObjList)session.getAttribute("ESD052501List");
			int index = Integer.parseInt(req.getParameter("key").trim());
			ESD052501Message listMessage = (ESD052501Message)list.get(index);
			
			ESD052501Message msg = (ESD052501Message) mp.getMessageRecord("ESD052501");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD0525");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0009");
			
			msg.setE01DLFBNK(listMessage.getE01DLFBNK().trim());
			msg.setE01DLFTYP(listMessage.getE01DLFTYP().trim());
			msg.setE01DLFCUN(listMessage.getE01DLFCUN().trim());
			msg.setE01DLFACD(listMessage.getE01DLFACD().trim());
			msg.setE01DLFTBL(listMessage.getE01DLFTBL().trim());	
			
			mp.sendMessage(msg);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
				
			if(!mp.hasError(msgError)){
				procReqApproval(user, req, res, session);				
			}else{
				session.setAttribute("error", msgError);
				forward("EUT0110_eibs_menu_list.jsp", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}
	}
	

	private void procReqPassword(HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos userPO = getUserPos(req);
	
		userPO.setRedirect("/servlet/datapro.eibs.params.JSESD0525?SCREEN="
							+ R_APPROVAL);
		session.setAttribute("userPO", userPO);
		
		res.sendRedirect(srctx + "/servlet/datapro.eibs.menu.JSESS0030?SCREEN=7");
	}
	
	
	
	protected void procReqApproval(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		UserPos userPO = getUserPos(ses);
		
		try {
			mp = getMessageProcessor("ESD0525", req);

			ESD052501Message msg = (ESD052501Message) mp.getMessageRecord("ESD052501");
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0025");
			msg.setH01TIMSYS(getTimeStamp());

			userPO.setHeader20("APPROVAL");			
/*			if (ses.getAttribute("header") != null ) {
				ESD052501Message header = (ESD052501Message) ses.getAttribute("header");
				msg.setE01DLSBNK(header.getE01DLSBNK().trim());
				msg.setE01DLSATY(header.getE01DLSATY().trim());
				msg.setE01DLSCUN(header.getE01DLSCUN().trim());
				msg.setE01DLSACD(header.getE01DLSACD().trim());
			} else {
				msg.setE01DLSBNK(req.getParameter("E01DLSBNK").trim());
				msg.setE01DLSATY(req.getParameter("E01DLSATY").trim());
				msg.setE01DLSCUN(req.getParameter("E01DLSCUN").trim());
				msg.setE01DLSACD(req.getParameter("E01DLSACD").trim());
			}
*/			
			mp.sendMessage(msg);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
 
			if (mp.hasError(msgError)) {
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
				forward("ESD0525_tarifas_enter_search.jsp", req, res);
			} else {
				ses.setAttribute("userpPO", userPO);
				ses.setAttribute("header", msg);
				ses.setAttribute("ESD052501List", list);
				forwardOnSuccess("ESD0525_tarifas_list_approval.jsp", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}
	}

	
	private void procActionApproval(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0525", req);
			
			JBObjList list = (JBObjList)session.getAttribute("ESD052501List");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			ESD052501Message listMessage = (ESD052501Message)list.get(index);
			
			
			ESD052501Message msgList = (ESD052501Message) mp.getMessageRecord("ESD052501");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD052501");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0010");
			msgList.setH01FLGWK1(req.getParameter("action").trim());
			
			msgList.setE01DLFBNK(listMessage.getE01DLFBNK().trim());
			msgList.setE01DLFTYP(listMessage.getE01DLFTYP().trim());
			msgList.setE01DLFCUN(listMessage.getE01DLFCUN().trim());
			msgList.setE01DLFACD(listMessage.getE01DLFACD().trim());
			msgList.setE01DLFTBL(listMessage.getE01DLFTBL().trim());				
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (ESD052501Message) mp.receiveMessageRecord("ESD052501");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("ESD0525_tarifas_list_approval.jsp", req, res);
			} else {
				
				procReqApproval(user, req, res, session);				
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	
}
