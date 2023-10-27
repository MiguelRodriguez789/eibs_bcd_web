package datapro.eibs.salesplatform;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EPV116601Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;

public class JSEPV1166 extends JSEIBSServlet {

	protected static final int R_CARGOS_LIST = 100;
	protected static final int A_CARGOS_LIST = 101;
	protected static final int R_CARGOS_NEW = 200;
	protected static final int R_CARGOS_MAINT = 201;
	protected static final int R_CARGOS_DELETE = 202;	
	protected static final int R_CARGOS_INQUIRY = 203;
	protected static final int A_CARGOS_MAINT = 600;
	
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {
		
		switch (screen) {
			case R_CARGOS_LIST:
				procReqTablaCargosList(user, req, res, session);
				break;
			case A_CARGOS_LIST:
				procActionTablaCargosList(user, req, res, session);
				break;
			case R_CARGOS_NEW:
				procReqCargosNew(user, req, res, session);
				break;
			case R_CARGOS_MAINT:
				procReqCargosMaint(user, req, res, session);
				break;
			case R_CARGOS_INQUIRY:
				procReqCargosInquiry(user, req, res, session);
				break;
			case A_CARGOS_MAINT:
				procActionMaintenance(user, req, res, session);
				break;
			case R_CARGOS_DELETE:
				procReqDelete(user, req, res, session);
				break;
			default:
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	protected void procReqTablaCargosList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		try {
			flexLog("About to call Page: EPV1166_cargos_enter_search.jsp");
			forward("EPV1166_cargos_enter_search.jsp", req, res);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}
		
	}
	
	protected void procActionTablaCargosList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);
		
		try {

			String appType = (req.getParameter("appType") != null ? req.getParameter("appType") : "");
			userPO.setCusNum(req.getParameter("E01TYPCUN") != null ? req.getParameter("E01TYPCUN").trim() : userPO.getCusNum());
			userPO.setPorfNum(req.getParameter("E01TYPNUM") != null ? req.getParameter("E01TYPNUM").trim() : userPO.getPorfNum());
			userPO.setHeader1(req.getParameter("E01TYPRF1") != null ? req.getParameter("E01TYPRF1").trim() : userPO.getHeader1());
			
			mp = getMessageProcessor("EPV1166", req);

			EPV116601Message msg = (EPV116601Message) mp.getMessageRecord("EPV116601");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EPV1166");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD(appType);
			msg.setH01OPECOD("0015");
			
			msg.setE01TYPCUN(userPO.getCusNum());
			msg.setE01TYPNUM(userPO.getPorfNum());
		//	msg.setE01TYPRF1(userPO.getHeader1());
			
			mp.sendMessage(msg);

			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
 
			req.setAttribute("appType",appType);
			req.setAttribute("ACT",req.getParameter("ACT") == null ? "S" : req.getParameter("ACT").trim());
			session.setAttribute("userpPO", userPO);
			session.setAttribute("EPV116601List", list);
			forwardOnSuccess("EPV1166_cargos_list.jsp", req, res);

		} finally {
			if (mp != null) mp.close();
		}
		
	}

	private void procReqCargosNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;

		try {

			userPO.setHeader20("NEW");
			String appType = (req.getParameter("appType") != null ? req.getParameter("appType") : "");
			
			mp = getMessageProcessor("EPV1166", req);
			EPV116601Message msgNew = (EPV116601Message) mp.getMessageRecord("EPV116601");
			msgNew.setH01USERID(user.getH01USR());
			msgNew.setH01PROGRM("EPV1166");
			msgNew.setH01TIMSYS(getTimeStamp());
			msgNew.setH01SCRCOD(appType);
			msgNew.setH01OPECOD("0001");
			
			msgNew.setE01TYPCUN(userPO.getCusNum());
			msgNew.setE01TYPNUM(userPO.getPorfNum());
		//	msgNew.setE01TYPRF1(userPO.getHeader1());
			
			mp.sendMessage(msgNew);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgNew = (EPV116601Message) mp.receiveMessageRecord("EPV116601");
			
			if (mp.hasError(msgError)) {
				req.setAttribute("appType",appType);
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EPV1166_cargos_list.jsp", req, res);
			} else {
				req.setAttribute("appType",appType);
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msgNew);
				session.setAttribute("error", msgError);
				forward("EPV1166_cargos_maintenance.jsp", req, res);
			}
	
		} finally {
			if (mp != null) mp.close();
		}
		
	}

	private void procReqCargosMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		EPV116601Message listMessage = null;
		
		try {

			userPO.setHeader20("MAINTENANCE");
			String appType = (req.getParameter("appType") != null ? req.getParameter("appType") : "");

			mp = getMessageProcessor("EPV1166", req);
	
			if (req.getParameter("key") != null) {
				JBObjList list = (JBObjList)session.getAttribute("EPV116601List");
				int index = Integer.parseInt(req.getParameter("key").trim());
				listMessage = (EPV116601Message)list.get(index);
			}

			EPV116601Message msgMaint = (EPV116601Message) mp.getMessageRecord("EPV116601");
			msgMaint.setH01USERID(user.getH01USR());
			msgMaint.setH01PROGRM("EPV1166");
			msgMaint.setH01TIMSYS(getTimeStamp());
			msgMaint.setH01SCRCOD(appType);
			msgMaint.setH01OPECOD("0002");
			
			if (listMessage == null) {
				msgMaint.setE01TYPCUN(req.getParameter("cusNum").trim());
				msgMaint.setE01TYPNUM(req.getParameter("PorfNum").trim());
				msgMaint.setE01TYPSEQ(req.getParameter("E01TYPSEQ").trim());
			} else {
				msgMaint.setE01TYPCUN(listMessage.getE01TYPCUN());
				msgMaint.setE01TYPNUM(listMessage.getE01TYPNUM());
				msgMaint.setE01TYPSEQ(listMessage.getE01TYPSEQ());
			}

			mp.sendMessage(msgMaint);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgMaint = (EPV116601Message) mp.receiveMessageRecord("EPV116601");
			
			if (mp.hasError(msgError)) {
				req.setAttribute("appType",appType);
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EPV1166_cargos_list.jsp", req, res);
			} else {
				req.setAttribute("appType",appType);
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msgMaint);
				session.setAttribute("error", msgError);
				forward("EPV1166_cargos_maintenance.jsp", req, res);
			}
	
		} finally {
			if (mp != null) mp.close();
		}

	}

	private void procReqCargosInquiry(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		EPV116601Message listMessage = null;
		
		try {
			
			String appType = (req.getParameter("appType") != null ? req.getParameter("appType") : "");
			
			mp = getMessageProcessor("EPV1166", req);
		
			if (req.getParameter("key") != null) {
				JBObjList list = (JBObjList)session.getAttribute("EPV116601List");
				int index = Integer.parseInt(req.getParameter("key").trim());
				listMessage = (EPV116601Message)list.get(index);
			}

			EPV116601Message msgMaint = (EPV116601Message) mp.getMessageRecord("EPV116601");
			msgMaint.setH01USERID(user.getH01USR());
			msgMaint.setH01PROGRM("EPV1166");
			msgMaint.setH01TIMSYS(getTimeStamp());
			msgMaint.setH01SCRCOD(appType);
			msgMaint.setH01OPECOD("0004");
		
			if (listMessage == null) {
				msgMaint.setE01TYPCUN(req.getParameter("cusNum").trim());
				msgMaint.setE01TYPNUM(req.getParameter("PorfNum").trim());
				msgMaint.setE01TYPSEQ(req.getParameter("E01TYPSEQ").trim());
			} else {
				msgMaint.setE01TYPCUN(listMessage.getE01TYPCUN());
				msgMaint.setE01TYPNUM(listMessage.getE01TYPNUM());
				msgMaint.setE01TYPSEQ(listMessage.getE01TYPSEQ());
			}

			mp.sendMessage(msgMaint);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgMaint = (EPV116601Message) mp.receiveMessageRecord("EPV116601");
		
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("error_viewer.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msgMaint);
				session.setAttribute("error", msgError);
				forward("EPV1166_cargos_maintenance.jsp?readOnly=true", req, res);
			}
		
		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	protected void procActionMaintenance(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {

			String appType = (req.getParameter("appType") != null ? req.getParameter("appType") : "");
			
			mp = getMessageProcessor("EPV1166", req);
			EPV116601Message msg = (EPV116601Message) mp.getMessageRecord("EPV116601");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EPV1166");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD(appType);
			msg.setH01OPECOD("0005");
			
			setMessageRecord(req, msg);

			msg.setE01TYPCUN(userPO.getCusNum());
			msg.setE01TYPNUM(userPO.getPorfNum());
		//	msg.setE01TYPRF1(userPO.getHeader1());
			
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EPV116601Message) mp.receiveMessageRecord("EPV116601");

			if (mp.hasError(msgError)) {
				req.setAttribute("appType",appType);
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("datarec",	msg);
				forward("EPV1166_cargos_maintenance.jsp", req, res);
			} else {
				req.setAttribute("appType",appType);
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec",	msg);
				req.setAttribute("ACT","S");
				forward("EPV1166_cargos_maintenance.jsp", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}
	}

	protected void procReqDelete(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		MessageProcessor mp = null;
		try {

			mp = getMessageProcessor("EPV1166", req);
			String appType = (req.getParameter("appType") != null ? req.getParameter("appType") : "");
			
			JBObjList list = (JBObjList)session.getAttribute("EPV116601List");
			int index = Integer.parseInt(req.getParameter("key").trim());
			EPV116601Message listMessage = (EPV116601Message)list.get(index);
			
			EPV116601Message msgDelete = (EPV116601Message) mp.getMessageRecord("EPV116601");
			msgDelete.setH01USERID(user.getH01USR());
			msgDelete.setH01PROGRM("EPV1166");
			msgDelete.setH01TIMSYS(getTimeStamp());
			msgDelete.setH01SCRCOD(appType);
			msgDelete.setH01OPECOD("0009");
			
			msgDelete.setE01TYPCUN(listMessage.getE01TYPCUN());
			msgDelete.setE01TYPNUM(listMessage.getE01TYPNUM());
			msgDelete.setE01TYPSEQ(listMessage.getE01TYPSEQ());

			mp.sendMessage(msgDelete);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (!mp.hasError(msgError)) {
				procActionTablaCargosList(user, req, res, session);
			} else {
				session.setAttribute("error", msgError);
				forward("EPV1166_cargos_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

}


