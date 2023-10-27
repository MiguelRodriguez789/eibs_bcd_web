package datapro.eibs.products; 

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EDL055501Message;
import datapro.eibs.beans.EDL055502Message;
import datapro.eibs.beans.EDL055503Message;
import datapro.eibs.beans.EDL055504Message;
import datapro.eibs.beans.EDL055505Message;
import datapro.eibs.beans.EDL055506Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;


public class JSEDL0555 extends JSEIBSServlet {

	protected static final int R_LIST            = 100;
	protected static final int A_LIST            = 101;
	protected static final int A_LIST_COMPLETE   = 102;
	
	protected static final int R_NEW             = 201;
	protected static final int R_MAINT           = 202;
	//protected static final int R_INQUIRY       = 203;
	protected static final int A_DELETE          = 204;
	
	protected static final int A_DETAIL_LIST     = 401;
	protected static final int R_DETAIL_SIMUL    = 402;
	protected static final int R_DETAIL_MAINT    = 403;
	//protected static final int R_DETAIL_DELETE = 404;
	protected static final int R_DETAIL_INQUIRY  = 405;
	protected static final int A_DETAIL_SIMUL    = 406;
	protected static final int A_DETAIL_MAINT    = 407;

	protected static final int A_DETAIL_ADD      = 702;
	protected static final int R_LIST_APPROVE    = 1000;
	protected static final int A_LIST_APPROVE    = 1001;
	protected static final int A_DELETE_APPROVE  = 1004;
	protected static final int R_INQ_APPROVE     = 1009;
	protected static final int R_INQ_APPROVE_DET = 1010;
	
	protected static final int R_LIST_INQUIRY    = 2000;
	protected static final int A_LIST_INQUIRY    = 2001;
	protected static final int R_LIST_INQ_SIMUL  = 2009;
	protected static final int R_INQUIRY_DET	 = 2010;

	protected static final int R_HISTORY         = 2011;  
	protected static final int A_HISTORY         = 2012;

	protected static final int R_LIST_CHG_STATUS = 3000;
	protected static final int A_LIST_CHG_STATUS = 3001;
	protected static final int R_CHG_STATUS_DET	 = 3002;
	protected static final int A_CHG_STATUS_DET	 = 3003;
	
	@Override
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		
		switch (screen) {
			case R_LIST:
				procReqList(user, req, res, session);
				break;
			case A_LIST:
				procActList(user, req, res, session);
				break;
			case A_LIST_COMPLETE:
				procActListComplete(user, req, res, session);
				break;
			case R_NEW:
				procReqNew(user, req, res, session);
				break;
			case R_MAINT:
				procReqMaint(user, req, res, session);
				break;
			case A_DELETE:
				procActDelete(user, req, res, session);
				break;
			case A_DETAIL_LIST:
				procActDetailList(user, req, res, session);
				break;
			case R_DETAIL_SIMUL:
				procReqDetailSimul(user, req, res, session);
				break;
			case R_DETAIL_MAINT:
				procReqDetailMaint(user, req, res, session);
				break;
			case R_DETAIL_INQUIRY:
				procReqDetailInquiry(user, req, res, session);
				break;
			case A_DETAIL_SIMUL:
				procActDetailSimul(user, req, res, session);
				break;
			case A_DETAIL_MAINT:
				procActDetailMaint(user, req, res, session);
				break;
			case A_DETAIL_ADD:
				procActionDetailAdd(user, req, res, session);
				break;
			case R_LIST_APPROVE:
				procActListApprove(user, req, res, session);
				break;
			case A_LIST_APPROVE:
				procListApprove(user, req, res, session);
				break;
			case A_DELETE_APPROVE:
				procActDeleteApprove(user, req, res, session);
				break;
			case R_INQ_APPROVE:
				procReqInqApprove(user, req, res, session);
				break;
			case R_INQ_APPROVE_DET:
				procApproveDetailInquiry(user, req, res, session);
				break;
			case R_LIST_INQUIRY:
				procReqListInq(user, req, res, session);
				break;
			case A_LIST_INQUIRY:
				procInqList(user, req, res, session);
				break;
			case R_LIST_INQ_SIMUL:
				procReqListInquiry(user, req, res, session);
				break;
			case R_INQUIRY_DET:
				procListDetailInquiry(user, req, res, session);
				break;

			case R_HISTORY:
				procReqHistory(user, req, res, session);
				break;
			case A_HISTORY:
				procActHistory(user, req, res, session);
				break;

			case R_LIST_CHG_STATUS:
				procReqListChgStatus(user, req, res, session);
				break;
			case A_LIST_CHG_STATUS:
				procChgStatusList(user, req, res, session);
				break;
			case R_CHG_STATUS_DET:
				procListDetailChgStatus(user, req, res, session);
				break;
			case A_CHG_STATUS_DET:
				procDetailChgStatus(user, req, res, session);
				break;
			default:
				forward(devPage, req, res);
				break;
		}
	}

	private void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("NEW");
		userPO.setRedirect("/servlet/datapro.eibs.products.JSEDL0555?SCREEN=101");
		userPO.setHeader1("Ingreso de Negociaciones de Creditos");
		userPO.setHeader4(req.getParameter("editControl") == null ? "" : req.getParameter("editControl").trim());
		session.setAttribute("userPO", userPO);
		forward("EDL0555_client_help_container.jsp", req, res);

	}

	private void procActList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("EDL0555", req);
			EDL055501Message msgHeader = (EDL055501Message) mp.getMessageRecord("EDL055501");
			msgHeader.setH01USERID(user.getH01USR());
			msgHeader.setH01PROGRM("EDL0555");
			msgHeader.setH01TIMSYS(getTimeStamp());
			msgHeader.setH01SCRCOD("01");
			msgHeader.setH01OPECOD("0015");
			
			if(!(req.getParameter("E01TYP") == null)){
				msgHeader.setE01SELTYP(req.getParameter("E01TYP"));
			} else if(!(userPO.getType() == null)){
				msgHeader.setE01SELTYP(userPO.getType());
			}

			if(!(req.getParameter("E01CUN") == null)){
				msgHeader.setE01SELCUN(req.getParameter("E01CUN"));
			} else if(!(userPO.getCusNum() == null)){
				msgHeader.setE01SELCUN(userPO.getCusNum());
			}

			if(!(req.getParameter("E01OFN") == null)){
				msgHeader.setE01SELOFN(req.getParameter("E01OFN"));
			} else if(!(userPO.getPorfNum() == null)){
				msgHeader.setE01SELOFN(userPO.getPorfNum());
			}

			userPO.setType(msgHeader.getE01SELTYP());
			userPO.setCusNum(msgHeader.getE01SELCUN());
			userPO.setPorfNum(msgHeader.getE01SELOFN());
			userPO.setRedirect("1");
			
			mp.sendMessage(msgHeader);
			
			ELEERRMessage error = (ELEERRMessage) mp.receiveMessageRecord();

			if (mp.hasError(error)) {
				session.setAttribute("error", error);
				session.setAttribute("userPO", userPO);
				userPO.setRedirect("/servlet/datapro.eibs.products.JSEDL0555?SCREEN=101");
				userPO.setHeader1("Ingreso de Negociaciones de Creditos");
				forward("EDL0555_client_help_container.jsp", req, res);
			} else {
				msgHeader = (EDL055501Message) mp.receiveMessageRecord();

				JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");

				if (list.isEmpty()) {
					procReqNew(user, req, res, session); //If Empty Go Directly to Product Page 
				
				} else {
					session.setAttribute("msgList", list);
					session.setAttribute("msgHeader", msgHeader);
					session.setAttribute("userPO", userPO);
					forward("EDL0555_salesplatform_list.jsp", req, res);				
				}
			
			}

		} finally {
			if (mp != null) mp.close();
		}
		
	}
	
	private void procActListComplete(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
			throws ServletException, IOException {
			
			UserPos userPO = getUserPos(req);
			MessageProcessor mp = null;
			
			try {
				mp = getMessageProcessor("EDL0555", req);
				EDL055501Message msgHeader = (EDL055501Message) mp.getMessageRecord("EDL055501");
				msgHeader.setH01USERID(user.getH01USR());
				msgHeader.setH01PROGRM("EDL0555");
				msgHeader.setH01TIMSYS(getTimeStamp());
				msgHeader.setH01SCRCOD("01");
				msgHeader.setH01OPECOD("1025");
				
				msgHeader.setE01SELCUN(userPO.getCusNum());
				msgHeader.setE01SELOFN(userPO.getPorfNum());
				
				mp.sendMessage(msgHeader);
				
				ELEERRMessage error = (ELEERRMessage) mp.receiveMessageRecord();

				if (mp.hasError(error)) {
					session.setAttribute("error", error);
									
					forward("EDL0555_simulacion_activos_list.jsp", req, res);
					
				} else {
					procActList(user, req, res, session);
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
			mp = getMessageProcessor("EDL0555", req);
			EDL055502Message msgHeader = (EDL055502Message) mp.getMessageRecord("EDL055502");
			EDL055503Message msg = (EDL055503Message) mp.getMessageRecord("EDL055503");
			msg.setH03USERID(user.getH01USR());
			msg.setH03PROGRM("EDL0555");
			msg.setH03TIMSYS(getTimeStamp());
			msg.setH03SCRCOD("01");
			msg.setH03OPECOD("0015");
			
			if(!(req.getParameter("E01CUN") == null)){
				msg.setE03SELCUN(req.getParameter("E01CUN"));
			} else if(!(userPO.getCusNum() == null)){
				msg.setE03SELCUN(userPO.getCusNum());
			}
			
			mp.sendMessage(msg);
			
			ELEERRMessage error = (ELEERRMessage) mp.receiveMessageRecord();
			JBObjList list = mp.receiveMessageRecordList("E03INDOPE");
			msgHeader = (EDL055502Message) mp.receiveMessageRecord("EDL055502");
				
			if (mp.hasError(error)) {
			//	session.setAttribute("msgList", list);
				//session.setAttribute("msgHeader", msgHeader);
				//session.setAttribute("userPO", userPO);
				session.setAttribute("error", error);
				forward("EDL0555_salesplatform_list.jsp", req, res);
			} else {
				session.setAttribute("msgListNew", list);
				session.setAttribute("msgHeaderNew", msgHeader);
				session.setAttribute("userPO", userPO);
					
				forward("EDL0555_plan_buscar_activos_list.jsp", req, res);	
			}
							
						
		} finally {
			if (mp != null) mp.close();
		}
		
	}
	
	private void procReqMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
			
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		EDL055502Message listMessage = null;
			
		try {
			mp = getMessageProcessor("EDL0555", req);
			
			if (req.getParameter("key") != null) {
				JBObjList list = (JBObjList)session.getAttribute("msgList");
				int index = Integer.parseInt(req.getParameter("key").trim());
				listMessage = (EDL055502Message)list.get(index);
			}
			
			userPO.setPorfNum(listMessage.getE02DLNOFN());
			userPO.setCusNum(listMessage.getE02DLNCUN());
			userPO.setCusName(listMessage.getE02DSCPRO());
			
			procReqDetailAdd(user, req, res, session);
			
		} finally {
			if (mp != null) mp.close();
		}
			
	}

	private void procActDelete(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
				
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		EDL055502Message listMessage = null;
				
		try {
			mp = getMessageProcessor("EDL0555", req);
				
			if (req.getParameter("key") != null) {
				JBObjList list = (JBObjList)session.getAttribute("msgList");
				int index = Integer.parseInt(req.getParameter("key").trim());
				listMessage = (EDL055502Message)list.get(index);
			}
				
			userPO.setCusNum(listMessage.getE02DLNCUN());
			userPO.setPorfNum(listMessage.getE02DLNOFN());
				
			mp = getMessageProcessor("EDL0555", req);
			EDL055502Message msg = (EDL055502Message) mp.getMessageRecord("EDL055502");
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("EDL0555");
			msg.setH02TIMSYS(getTimeStamp());
			msg.setH02SCRCOD("01");
			msg.setH02OPECOD("0004");
			
			msg.setE02SELCUN(userPO.getCusNum());
			msg.setE02DLNOFN(userPO.getPorfNum());
			msg.setE02DLNCUN(userPO.getCusNum());

			mp.sendMessage(msg);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");

			procActList(user, req, res, session);
				
		} finally {
			if (mp != null) mp.close();
		}
				
	}

	private void procActDetailList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);

		try {
			mp = getMessageProcessor("EDL0555", req);
			EDL055504Message msg = (EDL055504Message) mp.getMessageRecord("EDL055504");
			msg.setH04USERID(user.getH01USR());
			msg.setH04OPECOD("0015");
			msg.setH04TIMSYS(getTimeStamp());
			
			try {
				msg.setE04DLNOFN(req.getParameter("E04DLNOFN").trim());
				userPO.setPorfNum(req.getParameter("E04DLNOFN").trim());
			} catch (Exception e) {
				msg.setE04DLNOFN(userPO.getPorfNum());
			}
			try {
				msg.setE04DLNCUN(req.getParameter("E04DLNCUN").trim());
				msg.setE04SELCUN(req.getParameter("E04DLNCUN").trim());
				userPO.setCusNum(req.getParameter("E04DLNCUN").trim());
			} catch (Exception e) {
				msg.setE04DLNCUN(userPO.getCusNum());
				msg.setE04SELCUN(userPO.getCusNum());
			}

			mp.sendMessage(msg);

			JBObjList list = mp.receiveMessageRecordList("E04INDOPE");

			session.setAttribute("userpPO", userPO);
			session.setAttribute("EDL055504Lst", list);
			req.setAttribute("ACT",req.getParameter("ACT") == null ? "S" : req.getParameter("ACT").trim());
			forward("EDL0555_detail_list.jsp", req, res);

		} finally {
			if (mp != null) mp.close();
		}
		
	}

	private void procReqDetailSimul(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
				
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		EDL055504Message listMessage = null;
			
		try {
			userPO.setHeader20("MAINTENANCE");
			mp = getMessageProcessor("EDL0555", req);
		
			if (req.getParameter("key") != null) {
				JBObjList list = (JBObjList)session.getAttribute("EDL055504Lst");
				int index = Integer.parseInt(req.getParameter("key").trim());
				listMessage = (EDL055504Message)list.get(index);
			}

			EDL055504Message msgSimul = (EDL055504Message) mp.getMessageRecord("EDL055504");
			populate(listMessage, msgSimul);

			if (listMessage == null) {
				msgSimul.setE04DLNOFN(req.getParameter("PorfNum").trim());
				msgSimul.setE04DLNCUN(req.getParameter("cusNum").trim());
			} else {
				msgSimul.setE04DLNOFN(listMessage.getE04DLNOFN());
				msgSimul.setE04DLNCUN(listMessage.getE04DLNCUN());
				msgSimul.setE04DLNACC(listMessage.getE04DLNACC());
				msgSimul.setE04DLNSIM(listMessage.getE04DLNSIM());
				msgSimul.setE04DLNSID(listMessage.getE04DLNSID());
				msgSimul.setE04DLNSIY(listMessage.getE04DLNSIY());
				msgSimul.setE04DLNTYP(listMessage.getE04DLNTYP());
				msgSimul.setE04DLNCUO(listMessage.getE04DLNCUO());
			}

			session.setAttribute("datarec", msgSimul);
			forward("EDL0555_simulacion_maintenance.jsp", req, res);
		
		} finally {
			if (mp != null) mp.close();
		}

	}

	private void procReqDetailMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
			
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		EDL055504Message listMessage = null;
		
		try {
			userPO.setHeader20("MAINTENANCE");
			mp = getMessageProcessor("EDL0555", req);
	
			if (req.getParameter("key") != null) {
				JBObjList list = (JBObjList)session.getAttribute("EDL055504Lst");
				int index = Integer.parseInt(req.getParameter("key").trim());
				listMessage = (EDL055504Message)list.get(index);
			}

			EDL055504Message msgMaint = (EDL055504Message) mp.getMessageRecord("EDL055504");
			msgMaint.setH04USERID(user.getH01USR());
			msgMaint.setH04PROGRM("EDL0555");
			msgMaint.setH04TIMSYS(getTimeStamp());
			msgMaint.setH04SCRCOD("01");
			msgMaint.setH04OPECOD("0002");

			if (listMessage == null) {
				msgMaint.setE04DLNOFN(req.getParameter("PorfNum").trim());
				msgMaint.setE04SELCUN(req.getParameter("cusNum").trim());
				msgMaint.setE04DLNCUN(req.getParameter("cusNum").trim());
				msgMaint.setE04DLNACC(req.getParameter("accNum").trim());
			} else {
				msgMaint.setE04DLNOFN(listMessage.getE04DLNOFN());
				msgMaint.setE04SELCUN(listMessage.getE04DLNCUN());
				msgMaint.setE04DLNCUN(listMessage.getE04DLNCUN());
				msgMaint.setE04DLNACC(listMessage.getE04DLNACC());
			}

			mp.sendMessage(msgMaint);
			msgMaint = (EDL055504Message) mp.receiveMessageRecord("EDL055504");
			
			session.setAttribute("userPO", userPO);
			session.setAttribute("datarec", msgMaint);
			forward("EDL0555_detail_maintenance.jsp", req, res);

		} finally {
			if (mp != null) mp.close();
		}

	}

	private void procReqDetailInquiry(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
				
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		EDL055504Message listMessage = null;
			
		try {
			userPO.setHeader20("MAINTENANCE");
			mp = getMessageProcessor("EDL0555", req);
	
			if (req.getParameter("key") != null) {
				JBObjList list = (JBObjList)session.getAttribute("EDL055504Lst");
				int index = Integer.parseInt(req.getParameter("key").trim());
				listMessage = (EDL055504Message)list.get(index);
			}

			EDL055504Message msgMaint = (EDL055504Message) mp.getMessageRecord("EDL055504");
			msgMaint.setH04USERID(user.getH01USR());
			msgMaint.setH04PROGRM("EDL0555");
			msgMaint.setH04TIMSYS(getTimeStamp());
			msgMaint.setH04SCRCOD("01");
			msgMaint.setH04OPECOD("0002");

			if (listMessage == null) {
				msgMaint.setE04DLNOFN(req.getParameter("PorfNum").trim());
				msgMaint.setE04SELCUN(req.getParameter("cusNum").trim());
				msgMaint.setE04DLNCUN(req.getParameter("cusNum").trim());
				msgMaint.setE04DLNACC(req.getParameter("accNum").trim());
			} else {
				msgMaint.setE04DLNOFN(listMessage.getE04DLNOFN());
				msgMaint.setE04SELCUN(listMessage.getE04DLNCUN());
				msgMaint.setE04DLNCUN(listMessage.getE04DLNCUN());
				msgMaint.setE04DLNACC(listMessage.getE04DLNACC());
			}

			mp.sendMessage(msgMaint);
			msgMaint = (EDL055504Message) mp.receiveMessageRecord("EDL055504");
				
			session.setAttribute("userPO", userPO);
			session.setAttribute("datarec", msgMaint);
			//forward("EDL0555_detail_maintenance.jsp?readOnly=true", req, res);
			forward("EDL0555_detail_inq_approve.jsp?readOnly=true", req, res);

		} finally {
			if (mp != null) mp.close();
		}

	}

	private void procActDetailSimul(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
					
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("EDL0555", req);
			EDL055504Message msg = (EDL055504Message) mp.getMessageRecord("EDL055504");
			msg.setH04USERID(user.getH01USR());
			msg.setH04PROGRM("EDL0555");
			msg.setH04TIMSYS(getTimeStamp());
			msg.setH04SCRCOD("01");
			msg.setH04OPECOD("0020");
			
			setMessageRecord(req, msg);

			msg.setE04SELCUN(userPO.getCusNum());
			msg.setE04DLNOFN(userPO.getPorfNum());
			msg.setE04DLNCUN(userPO.getCusNum());
			
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EDL055504Message) mp.receiveMessageRecord("EDL055504");

			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("datarec",	msg);
				forward("EDL0555_simulacion_maintenance.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec",	msg);
				req.setAttribute("ACT","S");
				forward("EDL0555_simulacion_maintenance.jsp", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}

	}

	private void procActDetailMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
				
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("EDL0555", req);
			EDL055504Message msg = (EDL055504Message) mp.getMessageRecord("EDL055504");
			msg.setH04USERID(user.getH01USR());
			msg.setH04PROGRM("EDL0555");
			msg.setH04TIMSYS(getTimeStamp());
			msg.setH04SCRCOD("01");
			msg.setH04OPECOD("0005");
			
			setMessageRecord(req, msg);

			msg.setE04SELCUN(userPO.getCusNum());
			msg.setE04DLNOFN(userPO.getPorfNum());
			msg.setE04DLNCUN(userPO.getCusNum());
			
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EDL055504Message) mp.receiveMessageRecord("EDL055504");

			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("datarec",	msg);
				forward("EDL0555_detail_maintenance.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec",	msg);
				req.setAttribute("ACT","S");
				forward("EDL0555_detail_maintenance.jsp", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}

	}

	private void procActionDetailAdd(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
			throws ServletException, IOException {

			UserPos userPO = getUserPos(req);
			EDL055503Message msgCrear = null;
			
			JBObjList loansList = (JBObjList) session.getAttribute("msgListNew");
			String sel = "";
			
			MessageProcessor mp = null;
					
			// Recorre la lista
			for (int i = 0; i < loansList.size(); i++) {
				sel = req.getParameter("E03PDTSEL_" + i) == null ? "N" : req.getParameter("E03PDTSEL_" + i);
				// Graba los registros seleccionados
				if (sel.equals("Y")) {
					if (loansList.get(i)  instanceof EDL055503Message) {
						mp = getMessageProcessor("EDL0555", req);
						msgCrear = (EDL055503Message) loansList.get(i);
						try {
							msgCrear.setH03USERID(user.getH01USR());
							msgCrear.setH03PROGRM("EDL0555");
							msgCrear.setH03TIMSYS(getTimeStamp());
							msgCrear.setH03SCRCOD("01");
							msgCrear.setH03OPECOD("1001");
																					
							mp.sendMessage(msgCrear);
							ELEERRMessage error = (ELEERRMessage) mp.receiveMessageRecord();
						} finally {
							if (mp != null)	mp.close();
						}
					}
				}	
			}
			
					
			try {
				mp = getMessageProcessor("EDL0555", req);
				EDL055502Message msgHeader = (EDL055502Message) mp.getMessageRecord("EDL055502");
				msgHeader.setH02USERID(user.getH01USR());
				msgHeader.setH02PROGRM("EDL0555");
				msgHeader.setH02TIMSYS(getTimeStamp());
				msgHeader.setH02SCRCOD("01");
				msgHeader.setH02OPECOD("0101");
				
				try {
					msgHeader.setE02SELCUN(userPO.getCusNum());
				} catch (Exception e) {
					msgHeader.setE02SELCUN("0");
				}
				try {
					msgHeader.setE02DLNSID(req.getParameter("E02DLNSID").trim());
				} catch (Exception e) {
					msgHeader.setE02DLNSID("0");
				}
				try {
					msgHeader.setE02DLNSIM(req.getParameter("E02DLNSIM").trim());
				} catch (Exception e) {
					msgHeader.setE02DLNSIM("0");
				}
				try {
					msgHeader.setE02DLNSIY(req.getParameter("E02DLNSIY").trim());
				} catch (Exception e) {
					msgHeader.setE02DLNSIY("0");
				}
				
				mp.sendMessage(msgHeader);
				
				ELEERRMessage error = (ELEERRMessage) mp.receiveMessageRecord();
				msgHeader = (EDL055502Message) mp.receiveMessageRecord("EDL055502");
				
				userPO.setCusNum(msgHeader.getE02SELCUN());
				userPO.setPorfNum(msgHeader.getE02DLNOFN());
				
				session.setAttribute("error", error);
				session.setAttribute("msgHeader", msgHeader);

			} finally {
				if (mp != null) mp.close();
			}
						
			procReqDetailAdd(user, req, res, session);
			
		}	
	
	private void procReqDetailAdd(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
			throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("EDL0555", req);
			EDL055504Message msgHeader = (EDL055504Message) mp.getMessageRecord("EDL055504");
			EDL055505Message msgFooter = (EDL055505Message) mp.getMessageRecord("EDL055505");
			msgHeader.setH04USERID(user.getH01USR());
			msgHeader.setH04PROGRM("EDL0555");
			msgHeader.setH04TIMSYS(getTimeStamp());
			msgHeader.setH04SCRCOD("01");
			msgHeader.setH04OPECOD("0102");
			
			if (!(req.getParameter("E01CUN") == null)){
				msgHeader.setE04SELCUN(req.getParameter("E01CUN"));
				msgHeader.setE04DLNCUN(req.getParameter("E01CUN"));
			} else if(!(userPO.getCusNum() == null)){
				msgHeader.setE04SELCUN(userPO.getCusNum());
				msgHeader.setE04DLNCUN(userPO.getCusNum());
			}
			
			if (!(req.getParameter("E01OFN") == null)){
				msgHeader.setE04DLNOFN(req.getParameter("E01OFN"));
			} else if(!(userPO.getPorfNum() == null)){
				msgHeader.setE04DLNOFN(userPO.getPorfNum());
			}
			
			mp.sendMessage(msgHeader);
			
			ELEERRMessage error = (ELEERRMessage) mp.receiveMessageRecord();
			
			JBObjList list = mp.receiveMessageRecordList("E04INDOPE");
				
			session.setAttribute("msgListDet", list);
			session.setAttribute("msgFootDet", msgFooter);
			session.setAttribute("userPO", userPO);
				
			forward("EDL0555_simulacion_activos_list.jsp", req, res);				
						
		} finally {
			if (mp != null) mp.close();
		}
		
	}	
	
	private void procActListApprove(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
			throws ServletException, IOException {
			
			UserPos userPO = getUserPos(req);
			MessageProcessor mp = null;
			
			try {
				mp = getMessageProcessor("EDL0555", req);
				EDL055501Message msgHeader = (EDL055501Message) mp.getMessageRecord("EDL055501");
				msgHeader.setH01USERID(user.getH01USR());
				msgHeader.setH01PROGRM("EDL0555");
				msgHeader.setH01TIMSYS(getTimeStamp());
				msgHeader.setH01SCRCOD("01");
				msgHeader.setH01OPECOD("1000");
				
				mp.sendMessage(msgHeader);
			
				JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");

				session.setAttribute("msgList", list);
				session.setAttribute("msgHeader", msgHeader);
				session.setAttribute("userPO", userPO);
				forward("EDL0555_salesplatform_approve_list.jsp", req, res);				
			
			} finally {
				if (mp != null) mp.close();
			}
			
		}
	
	private void procListApprove(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
			throws ServletException, IOException {
			
			UserPos userPO = getUserPos(req);
			MessageProcessor mp = null;
			EDL055502Message listMessage = null;
				
		try {
			mp = getMessageProcessor("EDL0555", req);
				
			if (req.getParameter("key") != null) {
				JBObjList list = (JBObjList)session.getAttribute("msgList");
				int index = Integer.parseInt(req.getParameter("key").trim());
				listMessage = (EDL055502Message)list.get(index);
			}
				
			userPO.setCusNum(listMessage.getE02DLNCUN());
			userPO.setPorfNum(listMessage.getE02DLNOFN());
				
			mp = getMessageProcessor("EDL0555", req);
			EDL055502Message msg = (EDL055502Message) mp.getMessageRecord("EDL055502");
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("EDL0555");
			msg.setH02TIMSYS(getTimeStamp());
			msg.setH02SCRCOD("01");
			msg.setH02OPECOD("1001");
			
			msg.setE02SELCUN(userPO.getCusNum());
			msg.setE02DLNOFN(userPO.getPorfNum());
			msg.setE02DLNCUN(userPO.getCusNum());

			mp.sendMessage(msg);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");

			if (mp.hasError(msgError)) {
				
			session.setAttribute("error", msgError);
			//session.setAttribute("msgList", list);
			//session.setAttribute("msgHeader", msgHeader);
			session.setAttribute("userPO", userPO);
			
			forward("EDL0555_salesplatform_approve_list.jsp", req, res);	
			} else {
				
				procActListApprove(user, req, res, session);
		
			}
			
		} finally {
			if (mp != null) mp.close();
		}
				
			
		}
	
	private void procActDeleteApprove(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
			throws ServletException, IOException {
					
			UserPos userPO = getUserPos(req);
			MessageProcessor mp = null;
			EDL055502Message listMessage = null;
					
			try {
				mp = getMessageProcessor("EDL0555", req);
					
				if (req.getParameter("key") != null) {
					JBObjList list = (JBObjList)session.getAttribute("msgList");
					int index = Integer.parseInt(req.getParameter("key").trim());
					listMessage = (EDL055502Message)list.get(index);
				}
					
				userPO.setCusNum(listMessage.getE02DLNCUN());
				userPO.setPorfNum(listMessage.getE02DLNOFN());
					
				mp = getMessageProcessor("EDL0555", req);
				EDL055502Message msg = (EDL055502Message) mp.getMessageRecord("EDL055502");
				msg.setH02USERID(user.getH01USR());
				msg.setH02PROGRM("EDL0555");
				msg.setH02TIMSYS(getTimeStamp());
				msg.setH02SCRCOD("01");
				msg.setH02OPECOD("0004");
				
				msg.setE02SELCUN(userPO.getCusNum());
				msg.setE02DLNOFN(userPO.getPorfNum());
				msg.setE02DLNCUN(userPO.getCusNum());

				mp.sendMessage(msg);

				ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");

				procActListApprove(user, req, res, session);
					
			} finally {
				if (mp != null) mp.close();
			}
					
		}

	private void procReqInqApprove(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
			throws ServletException, IOException {
				
			UserPos userPO = getUserPos(req);
			MessageProcessor mp = null;
			EDL055502Message listMessage = null;
				
			try {
				mp = getMessageProcessor("EDL0555", req);
				
				if (req.getParameter("key") != null) {
					JBObjList list = (JBObjList)session.getAttribute("msgList");
					int index = Integer.parseInt(req.getParameter("key").trim());
					listMessage = (EDL055502Message)list.get(index);
				}
				
				userPO.setPorfNum(listMessage.getE02DLNOFN());
				userPO.setCusNum(listMessage.getE02DLNCUN());
				userPO.setCusName(listMessage.getE02DSCPRO());
					
			
				mp = getMessageProcessor("EDL0555", req);
				EDL055504Message msgHeader = (EDL055504Message) mp.getMessageRecord("EDL055504");
				EDL055505Message msgFooter = (EDL055505Message) mp.getMessageRecord("EDL055505");
				msgHeader.setH04USERID(user.getH01USR());
				msgHeader.setH04PROGRM("EDL0555");
				msgHeader.setH04TIMSYS(getTimeStamp());
				msgHeader.setH04SCRCOD("01");
				msgHeader.setH04OPECOD("0021");
								
				msgHeader.setE04SELCUN(userPO.getCusNum());
				msgHeader.setE04DLNCUN(userPO.getCusNum());
				msgHeader.setE04DLNOFN(userPO.getPorfNum());
			
				mp.sendMessage(msgHeader);
					
				ELEERRMessage error = (ELEERRMessage) mp.receiveMessageRecord();
				
				JBObjList list = mp.receiveMessageRecordList("E04INDOPE");
				JBObjList list1 = mp.receiveMessageRecordList("E04INDOPE");
				msgFooter = (EDL055505Message) mp.receiveMessageRecord("EDL055505");
					
				session.setAttribute("error", error);
				session.setAttribute("msgList", list);
				session.setAttribute("userpPO", userPO);
				session.setAttribute("msgList1", list1);
				session.setAttribute("msgFoot", msgFooter);
				
				forward("EDL0555_simulacion_activos_approve_list.jsp", req, res);				
			
				
			} finally {
				if (mp != null) mp.close();
			}
				
		}
	
	private void procApproveDetailInquiry(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
			throws ServletException, IOException {
					
			UserPos userPO = getUserPos(req);
			MessageProcessor mp = null;
			EDL055504Message listMessage = null;

			JBObjList list = (JBObjList)session.getAttribute("msgList1");
			
			try {
				userPO.setHeader20("CONSULTA");
				mp = getMessageProcessor("EDL0555", req);
		
				int index;
				try {
					index = Integer.parseInt(req.getParameter("ROW"));
					listMessage = (EDL055504Message)list.get(index);
				} catch (Exception e) {
					e.printStackTrace();
					throw new ServletException(e);
				}
				
				
				EDL055504Message msgMaint = (EDL055504Message) mp.getMessageRecord("EDL055504");
				msgMaint.setH04USERID(user.getH01USR());
				msgMaint.setH04PROGRM("EDL0555");
				msgMaint.setH04TIMSYS(getTimeStamp());
				msgMaint.setH04SCRCOD("01");
				msgMaint.setH04OPECOD("0002");
				
				msgMaint.setE04DLNOFN(listMessage.getE04DLNOFN());
				msgMaint.setE04SELCUN(listMessage.getE04DLNCUN());
				msgMaint.setE04DLNCUN(listMessage.getE04DLNCUN());
				msgMaint.setE04DLNACC(listMessage.getE04DLNACC());
				

				mp.sendMessage(msgMaint);
				msgMaint = (EDL055504Message) mp.receiveMessageRecord("EDL055504");
					
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msgMaint);
				forward("EDL0555_detail_inq_approve.jsp?readOnly=true", req, res);

			} finally {
				if (mp != null) mp.close();
			}

		}
	
	private void procReqListInq(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
			
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("INQUIRY");
		userPO.setRedirect("/servlet/datapro.eibs.products.JSEDL0555?SCREEN=2001");
		userPO.setHeader1("Consulta de Negociaciones por Clientes");
		userPO.setHeader4(req.getParameter("editControl") == null ? "" : req.getParameter("editControl").trim());
		session.setAttribute("userPO", userPO);
		forward("EDL0555_client_help_container.jsp", req, res);

	}
	
	private void procInqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
			
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
			
		try {
			
			mp = getMessageProcessor("EDL0555", req);
			EDL055501Message msgHeader = (EDL055501Message) mp.getMessageRecord("EDL055501");
			msgHeader.setH01USERID(user.getH01USR());
			msgHeader.setH01PROGRM("EDL0555");
			msgHeader.setH01TIMSYS(getTimeStamp());
			msgHeader.setH01SCRCOD("01");
			msgHeader.setH01OPECOD("1015");
				
			if(!(req.getParameter("E01TYP") == null)){
				msgHeader.setE01SELTYP(req.getParameter("E01TYP"));
			} else if(!(userPO.getType() == null)){
				msgHeader.setE01SELTYP(userPO.getType());
			}

			if(!(req.getParameter("E01CUN") == null)){
				msgHeader.setE01SELCUN(req.getParameter("E01CUN"));
			} else if(!(userPO.getCusNum() == null)){
				msgHeader.setE01SELCUN(userPO.getCusNum());
			}

			if(!(req.getParameter("E01OFN") == null)){
				msgHeader.setE01SELOFN(req.getParameter("E01OFN"));
			} else if(!(userPO.getPorfNum() == null)){
				msgHeader.setE01SELOFN(userPO.getPorfNum());
			}

			userPO.setType(msgHeader.getE01SELTYP());
			userPO.setCusNum(msgHeader.getE01SELCUN());
			userPO.setPorfNum(msgHeader.getE01SELOFN());
			userPO.setRedirect("1");
				
			mp.sendMessage(msgHeader);
				
			ELEERRMessage error = (ELEERRMessage) mp.receiveMessageRecord();

			if (mp.hasError(error)) {
				session.setAttribute("error", error);
				session.setAttribute("userPO", userPO);
				userPO.setRedirect("/servlet/datapro.eibs.products.JSEDL0555?SCREEN=2001");
				userPO.setHeader1("Consulta de Negociaciones por Clientes");
				forward("EDL0555_client_help_container.jsp", req, res);
			} else {
				msgHeader = (EDL055501Message) mp.receiveMessageRecord();
				JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");
				session.setAttribute("msgList", list);
				session.setAttribute("msgHeader", msgHeader);
				session.setAttribute("userPO", userPO);
				forward("EDL0555_salesplatform_inquiry_list.jsp", req, res);				
			}

		} finally {
			if (mp != null) mp.close();
		}
			
	}
	
	private void procReqListInquiry(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
				
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		EDL055502Message listMessage = null;
				
		try {

			mp = getMessageProcessor("EDL0555", req);
				
			if (req.getParameter("key") != null) {
				JBObjList list = (JBObjList)session.getAttribute("msgList");
				int index = Integer.parseInt(req.getParameter("key").trim());
				listMessage = (EDL055502Message)list.get(index);
			}
				
			userPO.setPorfNum(listMessage.getE02DLNOFN());
			userPO.setCusNum(listMessage.getE02DLNCUN());
			userPO.setCusName(listMessage.getE02DSCPRO());
					
			mp = getMessageProcessor("EDL0555", req);
			EDL055504Message msgHeader = (EDL055504Message) mp.getMessageRecord("EDL055504");
			EDL055505Message msgFooter = (EDL055505Message) mp.getMessageRecord("EDL055505");
			msgHeader.setH04USERID(user.getH01USR());
			msgHeader.setH04PROGRM("EDL0555");
			msgHeader.setH04TIMSYS(getTimeStamp());
			msgHeader.setH04SCRCOD("01");
			msgHeader.setH04OPECOD("0025");
								
			msgHeader.setE04SELCUN(userPO.getCusNum());
			msgHeader.setE04DLNCUN(userPO.getCusNum());
			msgHeader.setE04DLNOFN(userPO.getPorfNum());
			
			mp.sendMessage(msgHeader);
					
			ELEERRMessage error = (ELEERRMessage) mp.receiveMessageRecord();
				
			JBObjList list = mp.receiveMessageRecordList("E04INDOPE");
			JBObjList list1 = mp.receiveMessageRecordList("E04INDOPE");
			msgFooter = (EDL055505Message) mp.receiveMessageRecord("EDL055505");
					
			session.setAttribute("error", error);
			session.setAttribute("msgList", list);
			session.setAttribute("userpPO", userPO);
			session.setAttribute("msgList1", list1);
			session.setAttribute("msgFoot", msgFooter);
				
			forward("EDL0555_simulacion_activos_inquiry_list.jsp", req, res);				
			
		} finally {
			if (mp != null) mp.close();
		}
				
	}
	
	private void procListDetailInquiry(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
					
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		EDL055504Message listMessage = null;

		JBObjList list = (JBObjList)session.getAttribute("msgList1");
			
		try {
			
			userPO.setHeader20("CONSULTA");
			mp = getMessageProcessor("EDL0555", req);
			int index;
			
			try {
				index = Integer.parseInt(req.getParameter("ROW"));
				listMessage = (EDL055504Message)list.get(index);
			} catch (Exception e) {
				e.printStackTrace();
				throw new ServletException(e);
			}
				
			EDL055504Message msgMaint = (EDL055504Message) mp.getMessageRecord("EDL055504");
			msgMaint.setH04USERID(user.getH01USR());
			msgMaint.setH04PROGRM("EDL0555");
			msgMaint.setH04TIMSYS(getTimeStamp());
			msgMaint.setH04SCRCOD("01");
			msgMaint.setH04OPECOD("0026");
				
			msgMaint.setE04DLNOFN(listMessage.getE04DLNOFN());
			msgMaint.setE04SELCUN(listMessage.getE04DLNCUN());
			msgMaint.setE04DLNCUN(listMessage.getE04DLNCUN());
			msgMaint.setE04DLNACC(listMessage.getE04DLNACC());
				
			mp.sendMessage(msgMaint);
			msgMaint = (EDL055504Message) mp.receiveMessageRecord("EDL055504");
					
			session.setAttribute("userPO", userPO);
			session.setAttribute("datarec", msgMaint);
			forward("EDL0555_detail_inq_approve.jsp?readOnly=true", req, res);

		} finally {
			if (mp != null) mp.close();
		}

	}
	
	private void procReqHistory(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		EDL055502Message listMessage = null;

		try {
			
			mp = getMessageProcessor("EDL0555", req);
			
			if (req.getParameter("key") != null) {
				JBObjList list = (JBObjList)session.getAttribute("msgList");
				int index = Integer.parseInt(req.getParameter("key").trim());
				listMessage = (EDL055502Message)list.get(index);
			}
				
			userPO.setPorfNum(listMessage.getE02DLNOFN());
			userPO.setCusNum(listMessage.getE02DLNCUN());
			userPO.setCusName(listMessage.getE02DSCPRO());
				
			EDL055506Message msg = (EDL055506Message) mp.getMessageRecord("EDL055506");
			msg.setE06DLNOFN(userPO.getPorfNum());
			msg.setE06DLNCUN(userPO.getCusNum());
				
			session.setAttribute("userPO", userPO);
			session.setAttribute("headInfo", msg);
			forward("EDL0555_history_enter.jsp", req, res);

		} finally {
			if (mp != null) mp.close();
		}
				
	}

	private void procActHistory(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
				
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;

		try {

			mp = getMessageProcessor("EDL0555", req);
			EDL055506Message msgList = (EDL055506Message) mp.getMessageRecord("EDL055506");		
			msgList.setH06USERID(user.getH01USR());
			msgList.setH06PROGRM("EDL0555");
			msgList.setH06TIMSYS(getTimeStamp());
			msgList.setH06OPECOD("");
			msgList.setE06DLNOFN(userPO.getPorfNum());
				
			try {                                                   //Get Dates From Page
				msgList.setE06FMDTMM(req.getParameter("E06FMDTMM"));
				msgList.setE06FMDTDD(req.getParameter("E06FMDTDD"));
				msgList.setE06FMDTYY(req.getParameter("E06FMDTYY"));
			} catch (Exception e) {
				msgList.setE06FMDTMM("0");
				msgList.setE06FMDTDD("0");
				msgList.setE06FMDTYY("0");
			}
				
			try {
				msgList.setE06TODTMM(req.getParameter("E06TODTMM"));
				msgList.setE06TODTDD(req.getParameter("E06TODTDD"));
				msgList.setE06TODTYY(req.getParameter("E06TODTYY"));
			} catch (Exception e) {
				msgList.setE06TODTMM("0");
				msgList.setE06TODTDD("0");
				msgList.setE06TODTYY("0");
			}
				
			mp.sendMessage(msgList);
				
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
				
			if (mp.hasError(msgError)) {
				
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EDL0555_history_enter.jsp", req, res);
					
			} else {
				
				JBObjList list = mp.receiveMessageRecordList("H06FLGMAS");
				EDL055506Message headInfo = (EDL055506Message) mp.getMessageRecord("EDL055506");
					
				headInfo.setE06DLNOFN(userPO.getPorfNum());
				headInfo.setE06DLNCUN(userPO.getCusNum());
				headInfo.setE06DLNACC(userPO.getAccNum());
				headInfo.setE06CUSNA1(userPO.getCusName());
					
				session.setAttribute("userPO", userPO);
				session.setAttribute("headInfo", headInfo);
				session.setAttribute("EDL055506List", list);
				forward("EDL0555_history_list.jsp", req, res);
					
			}
				
		} finally {
			if (mp != null)	mp.close();
		}
				
	}

	private void procReqListChgStatus(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
			throws ServletException, IOException {
			
			UserPos userPO = getUserPos(req);
			userPO.setPurpose("STATUS");
			userPO.setRedirect("/servlet/datapro.eibs.products.JSEDL0555?SCREEN=3001");
			userPO.setHeader1("Cambio de Estado de Negociaciones");
			userPO.setHeader4(req.getParameter("editControl") == null ? "" : req.getParameter("editControl").trim());
			session.setAttribute("userPO", userPO);
			forward("EDL0555_client_help_container.jsp", req, res);

		}
	
	private void procChgStatusList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
			throws ServletException, IOException {
			
			UserPos userPO = getUserPos(req);
			MessageProcessor mp = null;
			
			try {
				mp = getMessageProcessor("EDL0555", req);
				EDL055501Message msgHeader = (EDL055501Message) mp.getMessageRecord("EDL055501");
				msgHeader.setH01USERID(user.getH01USR());
				msgHeader.setH01PROGRM("EDL0555");
				msgHeader.setH01TIMSYS(getTimeStamp());
				msgHeader.setH01SCRCOD("01");
				msgHeader.setH01OPECOD("1020");
				
				if(!(req.getParameter("E01TYP") == null)){
					msgHeader.setE01SELTYP(req.getParameter("E01TYP"));
				} else if(!(userPO.getType() == null)){
					msgHeader.setE01SELTYP(userPO.getType());
				}

				if(!(req.getParameter("E01CUN") == null)){
					msgHeader.setE01SELCUN(req.getParameter("E01CUN"));
				} else if(!(userPO.getCusNum() == null)){
					msgHeader.setE01SELCUN(userPO.getCusNum());
				}

				if(!(req.getParameter("E01OFN") == null)){
					msgHeader.setE01SELOFN(req.getParameter("E01OFN"));
				} else if(!(userPO.getPorfNum() == null)){
					msgHeader.setE01SELOFN(userPO.getPorfNum());
				}

				userPO.setType(msgHeader.getE01SELTYP());
				userPO.setCusNum(msgHeader.getE01SELCUN());
				userPO.setPorfNum(msgHeader.getE01SELOFN());
				userPO.setRedirect("1");
				
				mp.sendMessage(msgHeader);
				
				ELEERRMessage error = (ELEERRMessage) mp.receiveMessageRecord();

				if (mp.hasError(error)) {
					session.setAttribute("error", error);
					session.setAttribute("userPO", userPO);
					userPO.setRedirect("/servlet/datapro.eibs.products.JSEDL0555?SCREEN=3001");
					userPO.setHeader1("Cambio de Estado de Negociaciones");
					forward("EDL0555_client_help_container.jsp", req, res);
				} else {
					msgHeader = (EDL055501Message) mp.receiveMessageRecord();

					JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");
					
					session.setAttribute("msgList", list);
					session.setAttribute("msgHeader", msgHeader);
					session.setAttribute("userPO", userPO);
					forward("EDL0555_salesplatform_chg_status_list.jsp", req, res);				
					
				
				}

			} finally {
				if (mp != null) mp.close();
			}
			
		}
	
	private void procListDetailChgStatus(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
					
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		EDL055502Message listMessage = null;

		JBObjList list = (JBObjList)session.getAttribute("msgList");
			
		try {
				
			mp = getMessageProcessor("EDL0555", req);
		
			int index;
			try {
				index = Integer.parseInt(req.getParameter("ROW"));
				listMessage = (EDL055502Message)list.get(index);
			} catch (Exception e) {
				e.printStackTrace();
				throw new ServletException(e);
			}
								

		EDL055502Message msgMaint = (EDL055502Message) mp.getMessageRecord("EDL055502");
		populate(listMessage, msgMaint);	
		
		userPO.setCusNum(listMessage.getE02DLNCUN());
		userPO.setPorfNum(listMessage.getE02DLNOFN());
		
		session.setAttribute("userPO", userPO);
		session.setAttribute("datarec", msgMaint);
		forward("EDL0555_detail_chg_status.jsp", req, res);

		} finally {
			if (mp != null) mp.close();
		}

	}
	
	private void procDetailChgStatus(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
			
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
			
		try {
							
			mp = getMessageProcessor("EDL0555", req);
			EDL055502Message msg = (EDL055502Message) mp.getMessageRecord("EDL055502");
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("EDL0555");
			msg.setH02TIMSYS(getTimeStamp());
			msg.setH02SCRCOD("01");
			msg.setH02OPECOD("2001");
			
			msg.setE02SELCUN(userPO.getCusNum());
			msg.setE02DLNOFN(userPO.getPorfNum());
			msg.setE02DLNCUN(userPO.getCusNum());
			msg.setE02DLNSTS(req.getParameter("E02DLNSTS") == null ? "" : req.getParameter("E02DLNSTS").trim());

			mp.sendMessage(msg);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EDL0555_detail_chg_status.jsp", req, res);	
			} else {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				req.setAttribute("ACT","S");
				forward("EDL0555_detail_chg_status.jsp", req, res);	
			}
			
		} finally {
			if (mp != null) mp.close();
		}
			
	}
	
}
