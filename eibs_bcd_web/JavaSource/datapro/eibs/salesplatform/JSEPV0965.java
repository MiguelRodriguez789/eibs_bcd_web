package datapro.eibs.salesplatform;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EPV096501Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;

public class JSEPV0965 extends JSEIBSServlet {

	protected static final int R_SEGUROS_LIST = 100;
	protected static final int A_SEGUROS_LIST = 101;
	protected static final int R_SEGUROS_NEW = 200;
	protected static final int R_SEGUROS_MAINT = 201;
	protected static final int R_SEGUROS_DELETE = 202;
	protected static final int R_SEGUROS_INQUIRY = 203;
	protected static final int R_SEGUROS_DESEMBARCAR = 300;
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
			case R_SEGUROS_DESEMBARCAR:
				procReqDesembarcar(user, req, res, session);
				break;
			default:
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	protected void procReqTablaSegurosList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		try {
			flexLog("About to call Page: EPV0965_seguros_enter_search.jsp");
			forward("EPV0965_seguros_enter_search.jsp", req, res);
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
			mp = getMessageProcessor("EPV0965", req);

			EPV096501Message msg = (EPV096501Message) mp.getMessageRecord("EPV096501");
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0015");
			msg.setH01TIMSYS(getTimeStamp());
			
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
			session.setAttribute("EPV096501List", list);
			req.setAttribute("ACT",req.getParameter("ACT") == null ? "S" : req.getParameter("ACT").trim());

			forward("EPV0965_simulacion_seguros_list.jsp", req, res);

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


			mp = getMessageProcessor("EPV0965", req);
			EPV096501Message msgNew = (EPV096501Message) mp.getMessageRecord("EPV096501");
			msgNew.setH01USERID(user.getH01USR());
			msgNew.setH01PROGRM("EPV0965");
			msgNew.setH01TIMSYS(getTimeStamp());
			msgNew.setH01SCRCOD("01");
			msgNew.setH01OPECOD("0001");
			
			msgNew.setE01PSGCUN(userPO.getCusNum());
			msgNew.setE01PSGNUM(userPO.getPorfNum());
	
			mp.sendMessage(msgNew);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgNew = (EPV096501Message) mp.receiveMessageRecord("EPV096501");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EPV0965_simulacion_seguros_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msgNew);
				session.setAttribute("error", msgError);
				forward("EPV0965_simulacion_seguros_maint.jsp", req, res);
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
		EPV096501Message listMessage = null;
		
		try {
			userPO.setHeader20("MAINTENANCE");

			
			mp = getMessageProcessor("EPV0965", req);
	
			if (req.getParameter("key") != null) {
				JBObjList list = (JBObjList)session.getAttribute("EPV096501List");
				int index = Integer.parseInt(req.getParameter("key").trim());
				listMessage = (EPV096501Message)list.get(index);
			}

			EPV096501Message msgMaint = (EPV096501Message) mp.getMessageRecord("EPV096501");
			msgMaint.setH01USERID(user.getH01USR());
			msgMaint.setH01PROGRM("EPV0965");
			msgMaint.setH01TIMSYS(getTimeStamp());
			msgMaint.setH01SCRCOD("01");
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
			msgMaint = (EPV096501Message) mp.receiveMessageRecord("EPV096501");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EPV0965_simulacion_seguros_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msgMaint);
				session.setAttribute("error", msgError);
				forward("EPV0965_simulacion_seguros_maint.jsp", req, res);
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
		EPV096501Message listMessage = null;
		
		try {
			mp = getMessageProcessor("EPV0965", req);
		
			if (req.getParameter("key") != null) {
				JBObjList list = (JBObjList)session.getAttribute("EPV096501List");
				int index = Integer.parseInt(req.getParameter("key").trim());
				listMessage = (EPV096501Message)list.get(index);
			}

			
			EPV096501Message msgMaint = (EPV096501Message) mp.getMessageRecord("EPV096501");
			msgMaint.setH01USERID(user.getH01USR());
			msgMaint.setH01PROGRM("EPV0965");
			msgMaint.setH01TIMSYS(getTimeStamp());
			msgMaint.setH01SCRCOD("01");
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
			msgMaint = (EPV096501Message) mp.receiveMessageRecord("EPV096501");

			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EPV0965_simulacion_seguros_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msgMaint);
				session.setAttribute("error", msgError);
				forward("EPV0965_simulacion_seguros_maint.jsp?readOnly=true", req, res);
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
			mp = getMessageProcessor("EPV0965", req);
			EPV096501Message msg = (EPV096501Message) mp.getMessageRecord("EPV096501");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EPV0965");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0005");
			
			setMessageRecord(req, msg);

			msg.setE01PSGCUN(userPO.getCusNum());
			msg.setE01PSGNUM(userPO.getPorfNum());
			
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EPV096501Message) mp.receiveMessageRecord("EPV096501");

			
			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("datarec",	msg);
				forward("EPV0965_simulacion_seguros_maint.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec",	msg);
				req.setAttribute("ACT","S");
				forward("EPV0965_simulacion_seguros_maint.jsp", req, res);
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
			mp = getMessageProcessor("EPV0965", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EPV096501List");
			int index = Integer.parseInt(req.getParameter("key").trim());
			EPV096501Message listMessage = (EPV096501Message)list.get(index);
			
			EPV096501Message msgDelete = (EPV096501Message) mp.getMessageRecord("EPV096501");
			msgDelete.setH01USERID(user.getH01USR());
			msgDelete.setH01PROGRM("EPV0965");
			msgDelete.setH01TIMSYS(getTimeStamp());
			msgDelete.setH01SCRCOD("01");
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
				forward("EPV0965_simulacion_seguros_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqDesembarcar(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPV0965", req);

			
			JBObjList list = (JBObjList)session.getAttribute("EPV096501List");
			int index = Integer.parseInt(req.getParameter("key").trim());
			EPV096501Message listMessage = (EPV096501Message)list.get(index);

			
			EPV096501Message msgSelect = (EPV096501Message) mp.getMessageRecord("EPV096501");
			msgSelect.setH01USERID(user.getH01USR());
			msgSelect.setH01PROGRM("EPV0965");
			msgSelect.setH01TIMSYS(getTimeStamp());
			msgSelect.setH01SCRCOD("01");
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


				forward("EPV0965_simulacion_seguros_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

}
