package datapro.eibs.salesplatform;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EPV118001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;

public class JSEPV1180 extends JSEIBSServlet {

	protected static final int R_SEGUROS_LIST = 100;
	protected static final int A_SEGUROS_LIST = 101;
	protected static final int R_SEGUROS_NEW = 200;
	protected static final int R_SEGUROS_MAINT = 201;
	protected static final int R_SEGUROS_DELETE = 202;
	protected static final int R_SEGUROS_INQUIRY = 203;
	protected static final int R_SEGUROS_DESMARCAR = 300;
	protected static final int A_SEGUROS_MAINT = 600;

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {
		
		switch (screen) {
			case R_SEGUROS_LIST:
				procReqTablaSegurosList(user, req, res, session);
				break;
			case A_SEGUROS_LIST:
				procActionTablaSegurosList(user, req, res, session);
				break;
			case R_SEGUROS_NEW:
				procReqSegurosNew(user, req, res, session);
				break;
			case R_SEGUROS_MAINT:
				procReqSegurosMaint(user, req, res, session);
				break;
			case R_SEGUROS_INQUIRY:
				procReqSegurosInquiry(user, req, res, session);
				break;
			case A_SEGUROS_MAINT:
				procActionMaintenance(user, req, res, session);
				break;
			case R_SEGUROS_DELETE:
				procReqDelete(user, req, res, session);
				break;
			case R_SEGUROS_DESMARCAR:
				procReqDesmarcar(user, req, res, session);
				break;
			default:
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	protected void procReqTablaSegurosList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		try {
			flexLog("About to call Page: EPV1180_seguros_enter_search.jsp");
			forward("EPV1180_seguros_enter_search.jsp", req, res);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}
	}

	protected void procActionTablaSegurosList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);

		try {
			String appType = (req.getParameter("appType") != null ? req.getParameter("appType") : "");
			mp = getMessageProcessor("EPV1180", req);
			EPV118001Message msg = (EPV118001Message) mp.getMessageRecord("EPV118001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EPV1180");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD(appType);
			msg.setH01OPECOD("0015");
			
			try {
				msg.setE01PSGCUN(req.getParameter("E01PSGCUN").trim());
				userPO.setCusNum(req.getParameter("E01PSGCUN").trim());
			} catch (Exception e) {
				msg.setE01PSGCUN(userPO.getCusNum());
			}
			
			try {
				msg.setE01PSGNUM(req.getParameter("E01PSGNUM").trim());
				userPO.setPorfNum(req.getParameter("E01PSGNUM").trim());
			} catch (Exception e) {
				msg.setE01PSGNUM(userPO.getPorfNum());
			}

			mp.sendMessage(msg);

			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");

			session.setAttribute("userpPO", userPO);
			session.setAttribute("EPV118001List", list);
			req.setAttribute("appType",appType);
			req.setAttribute("ACT",req.getParameter("ACT") == null ? "S" : req.getParameter("ACT").trim());
			req.setAttribute("newCuota",req.getParameter("newCuota") == null ? "" : req.getParameter("newCuota").trim());
			forward("EPV1180_seguros_list.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqSegurosNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		
		try {
			userPO.setHeader20("NEW");
			String appType = (req.getParameter("appType") != null ? req.getParameter("appType") : "");
			mp = getMessageProcessor("EPV1180", req);
			EPV118001Message msgNew = (EPV118001Message) mp.getMessageRecord("EPV118001");
			msgNew.setH01USERID(user.getH01USR());
			msgNew.setH01PROGRM("EPV1180");
			msgNew.setH01TIMSYS(getTimeStamp());
			msgNew.setH01SCRCOD(appType);
			msgNew.setH01OPECOD("0001");
			
			msgNew.setE01PSGCUN(userPO.getCusNum());
			msgNew.setE01PSGNUM(userPO.getPorfNum());
	
			mp.sendMessage(msgNew);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgNew = (EPV118001Message) mp.receiveMessageRecord("EPV118001");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				req.setAttribute("appType",appType);
				forward("EPV1180_seguros_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msgNew);
				session.setAttribute("error", msgError);
				req.setAttribute("appType",appType);
				forward("EPV1180_seguros_maintenance.jsp", req, res);
			}
	
		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqSegurosMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		EPV118001Message listMessage = null;
		
		try {
			userPO.setHeader20("MAINTENANCE");
			String appType = (req.getParameter("appType") != null ? req.getParameter("appType") : "");
			mp = getMessageProcessor("EPV1180", req);
	
			if (req.getParameter("key") != null) {
				JBObjList list = (JBObjList)session.getAttribute("EPV118001List");
				int index = Integer.parseInt(req.getParameter("key").trim());
				listMessage = (EPV118001Message)list.get(index);
			}

			EPV118001Message msgMaint = (EPV118001Message) mp.getMessageRecord("EPV118001");
			msgMaint.setH01USERID(user.getH01USR());
			msgMaint.setH01PROGRM("EPV1180");
			msgMaint.setH01TIMSYS(getTimeStamp());
			msgMaint.setH01SCRCOD(appType);
			msgMaint.setH01OPECOD("0002");
			
			if (listMessage == null) {
				msgMaint.setE01PSGCUN(req.getParameter("cusNum").trim());
				msgMaint.setE01PSGNUM(req.getParameter("PorfNum").trim());
				msgMaint.setE01PSGSEQ(req.getParameter("E01PSGSEQ").trim());
			} else {
				msgMaint.setE01PSGCUN(listMessage.getE01PSGCUN());
				msgMaint.setE01PSGNUM(listMessage.getE01PSGNUM());
				msgMaint.setE01PSGSEQ(listMessage.getE01PSGSEQ());
			}

			mp.sendMessage(msgMaint);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgMaint = (EPV118001Message) mp.receiveMessageRecord("EPV118001");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				req.setAttribute("appType",appType);
				forward("EPV1180_seguros_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msgMaint);
				session.setAttribute("error", msgError);
				req.setAttribute("appType",appType);
				forward("EPV1180_seguros_maintenance.jsp", req, res);
			}
	
		} finally {
			if (mp != null)
				mp.close();
		}

	}

	private void procReqSegurosInquiry(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		EPV118001Message listMessage = null;
		
		try {

			String appType = (req.getParameter("appType") != null ? req.getParameter("appType") : "");
			mp = getMessageProcessor("EPV1180", req);
		
			if (req.getParameter("key") != null) {
				JBObjList list = (JBObjList)session.getAttribute("EPV118001List");
				int index = Integer.parseInt(req.getParameter("key").trim());
				listMessage = (EPV118001Message)list.get(index);
			}
			
			EPV118001Message msgMaint = (EPV118001Message) mp.getMessageRecord("EPV118001");
			msgMaint.setH01USERID(user.getH01USR());
			msgMaint.setH01PROGRM("EPV1180");
			msgMaint.setH01TIMSYS(getTimeStamp());
			msgMaint.setH01SCRCOD(appType);
			msgMaint.setH01OPECOD("0004");
		
			if (listMessage == null) {
				msgMaint.setE01PSGCUN(req.getParameter("cusNum").trim());
				msgMaint.setE01PSGNUM(req.getParameter("PorfNum").trim());
				msgMaint.setE01PSGSEQ(req.getParameter("E01PSGSEQ").trim());
			} else {
				msgMaint.setE01PSGCUN(listMessage.getE01PSGCUN());
				msgMaint.setE01PSGNUM(listMessage.getE01PSGNUM());
				msgMaint.setE01PSGSEQ(listMessage.getE01PSGSEQ());
			}

			mp.sendMessage(msgMaint);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgMaint = (EPV118001Message) mp.receiveMessageRecord("EPV118001");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EPV1180_seguros_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msgMaint);
				session.setAttribute("error", msgError);
				forward("EPV1180_seguros_maintenance.jsp?readOnly=true", req, res);
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
			String appType = (req.getParameter("appType") != null ? req.getParameter("appType") : "");
			mp = getMessageProcessor("EPV1180", req);
			EPV118001Message msg = (EPV118001Message) mp.getMessageRecord("EPV118001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EPV1180");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD(appType);
			msg.setH01OPECOD("0005");
			
			setMessageRecord(req, msg);

			msg.setE01PSGCUN(userPO.getCusNum());
			msg.setE01PSGNUM(userPO.getPorfNum());
			
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EPV118001Message) mp.receiveMessageRecord("EPV118001");

			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("datarec",	msg);
				req.setAttribute("appType",appType);
				forward("EPV1180_seguros_maintenance.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec",	msg);
				req.setAttribute("appType",appType);
				req.setAttribute("ACT","S");
				//Forma de Pago: Con Las Cuotas
				if("L".equals(msg.getE01PSGCOP().trim())) req.setAttribute("newCuota","TRUE");
				forward("EPV1180_seguros_maintenance.jsp", req, res);
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
			
			String appType = (req.getParameter("appType") != null ? req.getParameter("appType") : "");
			mp = getMessageProcessor("EPV1180", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EPV118001List");
			int index = Integer.parseInt(req.getParameter("key").trim());
			EPV118001Message listMessage = (EPV118001Message)list.get(index);
			
			EPV118001Message msgDelete = (EPV118001Message) mp.getMessageRecord("EPV118001");
			msgDelete.setH01USERID(user.getH01USR());
			msgDelete.setH01PROGRM("EPV1180");
			msgDelete.setH01TIMSYS(getTimeStamp());
			msgDelete.setH01SCRCOD(appType);
			msgDelete.setH01OPECOD("0009");
			
			msgDelete.setE01PSGCUN(listMessage.getE01PSGCUN());
			msgDelete.setE01PSGNUM(listMessage.getE01PSGNUM());
			msgDelete.setE01PSGSEQ(listMessage.getE01PSGSEQ());

			mp.sendMessage(msgDelete);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (!mp.hasError(msgError)) {
				procActionTablaSegurosList(user, req, res, session);
			} else {
				session.setAttribute("error", msgError);
				req.setAttribute("ACT","S");
				req.setAttribute("newCuota","TRUE");
				forward("EPV1180_seguros_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqDesmarcar(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		MessageProcessor mp = null;
		try {
			
			String appType = (req.getParameter("appType") != null ? req.getParameter("appType") : "");
			mp = getMessageProcessor("EPV1180", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EPV118001List");
			int index = Integer.parseInt(req.getParameter("key").trim());
			EPV118001Message listMessage = (EPV118001Message)list.get(index);
			
			EPV118001Message msgSelect = (EPV118001Message) mp.getMessageRecord("EPV118001");
			msgSelect.setH01USERID(user.getH01USR());
			msgSelect.setH01PROGRM("EPV1180");
			msgSelect.setH01TIMSYS(getTimeStamp());
			msgSelect.setH01SCRCOD(appType);
			msgSelect.setH01OPECOD("0007");
			
			msgSelect.setE01PSGCUN(listMessage.getE01PSGCUN());
			msgSelect.setE01PSGNUM(listMessage.getE01PSGNUM());
			msgSelect.setE01PSGSEQ(listMessage.getE01PSGSEQ());

			mp.sendMessage(msgSelect);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (!mp.hasError(msgError)) {
				procActionTablaSegurosList(user, req, res, session);
			} else {
				session.setAttribute("error", msgError);
				forward("EPV1180_seguros_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

}
