package datapro.eibs.products;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD079201Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;

@SuppressWarnings("serial")

public class JSESD0792 extends JSEIBSServlet {

	protected static final int A_PAGADURIA_LIST   = 100;
	protected static final int R_PAGADURIA_NEW    = 200;
	protected static final int R_PAGADURIA_MAINT  = 201;
	protected static final int R_PAGADURIA_DELETE = 202;
	protected static final int R_PAGADURIA_INQ    = 301;
	protected static final int A_PAGADURIA_MAINT  = 600;

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {
		
		switch (screen) {

			case A_PAGADURIA_LIST:
				procActionTablaPagaduriasList(user, req, res, session);
				break;
			case R_PAGADURIA_NEW:
				procReqPagaduriasNew(user, req, res, session);
				break;
			case R_PAGADURIA_MAINT:
				procReqPagaduriasMaint(user, req, res, session);
				break;
			case R_PAGADURIA_INQ:
				procReqPagaduriasInq(user, req, res, session);
				break;
			case A_PAGADURIA_MAINT:
				procActionMaintenance(user, req, res, session);
				break;
			case R_PAGADURIA_DELETE:
				procReqDelete(user, req, res, session);
				break;
			default:
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}


	protected void procActionTablaPagaduriasList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);

		try {
			mp = getMessageProcessor("ESD0792", req);

			ESD079201Message msg = (ESD079201Message) mp.getMessageRecord("ESD079201");
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0015");
			msg.setH01TIMSYS(getTimeStamp());
			
			try {
				msg.setE01COPCDE(req.getParameter("E01COPCDE").trim());
				userPO.setHeader1(req.getParameter("E01COPCDE").trim());
			} catch (Exception e) {
				msg.setE01COPCDE(userPO.getHeader1());
			}
			
			mp.sendMessage(msg);

			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");


			session.setAttribute("userpPO", userPO);
			session.setAttribute("ESD079201List", list);
			req.setAttribute("ACT",req.getParameter("ACT") == null ? "S" : req.getParameter("ACT").trim());

			forward("ESD0792_pagadurias_table_listA.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqPagaduriasNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			userPO.setHeader20("NEW");


			mp = getMessageProcessor("ESD0792", req);
			ESD079201Message msgNew = (ESD079201Message) mp.getMessageRecord("ESD079201");
			msgNew.setH01USERID(user.getH01USR());
			msgNew.setH01PROGRM("ESD0792");
			msgNew.setH01TIMSYS(getTimeStamp());
			msgNew.setH01SCRCOD("01");
			msgNew.setH01OPECOD("0001");
			
			msgNew.setE01COPCDE(userPO.getHeader1());
			try {
				msgNew.setE01COPSEQ(req.getParameter("E01COPSEQ"));
			} catch (Exception e) {
				msgNew.setE01COPSEQ("");
			}
	
			mp.sendMessage(msgNew);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgNew = (ESD079201Message) mp.receiveMessageRecord("ESD079201");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("ESD0792_pagadurias_table_listA.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msgNew);
				session.setAttribute("error", msgError);
				forward("ESD0792_pagadurias_table_details.jsp", req, res);
			}
	
		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqPagaduriasMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		userPO.setHeader20("MAINTENANCE");
		
		procReqPagaduriasMaintInq(user, req, res, session);
		
	}
	
	private void procReqPagaduriasInq(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
	
		UserPos userPO = getUserPos(req);
		userPO.setHeader20("INQUIRY");
		
		procReqPagaduriasMaintInq(user, req, res, session);
		
	}

	private void procReqPagaduriasMaintInq(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		ESD079201Message listMessage = null;
		String readOnly = "false"; 
		
		try {
			
			if (userPO.getHeader20().equals("INQUIRY")) {
				readOnly = "true";
			}
			
			mp = getMessageProcessor("ESD0792", req);
	
			if (req.getParameter("currRow") != null) {
				JBObjList list = (JBObjList)session.getAttribute("ESD079201List");
				int index = Integer.parseInt(req.getParameter("currRow").trim());
				listMessage = (ESD079201Message)list.get(index);
			}
	
			ESD079201Message msgMaint = (ESD079201Message) mp.getMessageRecord("ESD079201");
			msgMaint.setH01USERID(user.getH01USR());
			msgMaint.setH01PROGRM("ESD0792");
			msgMaint.setH01TIMSYS(getTimeStamp());
			msgMaint.setH01SCRCOD("01");
			msgMaint.setH01OPECOD("0002");
			
			if (listMessage == null) {
				msgMaint.setE01COPCDE(req.getParameter("E01COPCDE").trim());
				msgMaint.setE01COPSEQ(req.getParameter("E01COPSEQ").trim());
			} else {
				msgMaint.setE01COPCDE(listMessage.getE01COPCDE());
				msgMaint.setE01COPSEQ(listMessage.getE01COPSEQ());
			}
	
			mp.sendMessage(msgMaint);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgMaint = (ESD079201Message) mp.receiveMessageRecord("ESD079201");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("ESD0792_pagadurias_table_listA.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msgMaint);
				session.setAttribute("error", msgError);
				forward("ESD0792_pagadurias_table_details.jsp?readOnly="+readOnly, req, res);
			}
	
		} finally {
			if (mp != null)
				mp.close();
		}
	
	}

	protected void procActionMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)

			throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0792", req);
			ESD079201Message msg = (ESD079201Message) session.getAttribute("datarec");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD0792");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0005");
			
			setMessageRecord(req, msg);
			
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (ESD079201Message) mp.receiveMessageRecord("ESD079201");

			
			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("datarec",	msg);
				forward("ESD0792_pagadurias_table_details.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec",	msg);
				req.setAttribute("ACT","S");
				forward("ESD0792_pagadurias_table_details.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}

	}

	protected void procReqDelete(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0792", req);
			
			JBObjList list = (JBObjList)session.getAttribute("ESD079201List");
			int index = Integer.parseInt(req.getParameter("currRow").trim());
			ESD079201Message listMessage = (ESD079201Message)list.get(index);
			
			ESD079201Message msgDelete = (ESD079201Message) mp.getMessageRecord("ESD079201");
			msgDelete.setH01USERID(user.getH01USR());
			msgDelete.setH01PROGRM("ESD0792");
			msgDelete.setH01TIMSYS(getTimeStamp());
			msgDelete.setH01SCRCOD("01");
			msgDelete.setH01OPECOD("0009");
			
			msgDelete.setE01COPCDE(listMessage.getE01COPCDE());
			msgDelete.setE01COPSEQ(listMessage.getE01COPSEQ());

			mp.sendMessage(msgDelete);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (!mp.hasError(msgError)) {
				procActionTablaPagaduriasList(user, req, res, session);
			} else {
				session.setAttribute("error", msgError);
				forward("ESD0792_pagadurias_table_listA.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}
}
