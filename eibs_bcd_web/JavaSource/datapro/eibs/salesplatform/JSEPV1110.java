package datapro.eibs.salesplatform;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EPV111001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;

public class JSEPV1110 extends JSEIBSServlet {

	protected static final int R_REASSESSMENT_LIST    = 100;
	protected static final int A_REASSESSMENT_LIST    = 101;
	protected static final int R_REASSESSMENT_NEW     = 200;
	protected static final int R_REASSESSMENT_MAINT   = 300;
	protected static final int R_REASSESSMENT_INQ     = 301;
	protected static final int R_REASSESSMENT_DELETE  = 400;	
	protected static final int A_REASSESSMENT_MAINT   = 500;
	
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {

		switch (screen) {
			case R_REASSESSMENT_LIST:
				procReqReassessmentList(user, req, res, session);
				break;
			case A_REASSESSMENT_LIST:
				procActionReassessmentList(user, req, res, session);
				break;
			case R_REASSESSMENT_NEW:
				procReqReassessmentNew(user, req, res, session);
				break;
			case R_REASSESSMENT_MAINT:
				procReqReassessmentMaint(user, req, res, session);
				break;
			case R_REASSESSMENT_INQ:
				procReqReassessmentInquiry(user, req, res, session);
				break;
			case A_REASSESSMENT_MAINT:
				procActionMaintenance(user, req, res, session);
				break;
			case R_REASSESSMENT_DELETE:
				procReqDelete(user, req, res, session);
				break;
			default:
				forward(SuperServlet.devPage, req, res);
				break;
			}
	}

	protected void procReqReassessmentList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		UserPos userPO = getUserPos(ses);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPV1110", req);
			EPV111001Message msgDes = (EPV111001Message) mp.getMessageRecord("EPV111001");
			msgDes.setH01USERID(user.getH01USR());
			msgDes.setH01TIMSYS(getTimeStamp());
			msgDes.setH01OPECOD("0015");
			
			try {
				msgDes.setE01PRLCUN(req.getParameter("E01PRLCUN").trim());
				userPO.setCusNum(req.getParameter("E01PRLCUN").trim());
			} catch (Exception e) {
				msgDes.setE01PRLCUN(userPO.getCusNum());
			}
			
			try {
				msgDes.setE01PRLNUM(req.getParameter("E01PRLNUM").trim());
				userPO.setPorfNum(req.getParameter("E01PRLNUM").trim());
			} catch (Exception e) {
				msgDes.setE01PRLNUM(userPO.getPorfNum());
			}
						
			mp.sendMessage(msgDes);

			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");

			ses.setAttribute("userPO", userPO);
			ses.setAttribute("EPV1110List", list);
			req.setAttribute("ACT",req.getParameter("ACT") == null ? "S" : req.getParameter("ACT").trim());
			forward("EPV1110_reassessment_list.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}

	}

	protected void procActionReassessmentList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);
		
		try {
			mp = getMessageProcessor("EPV1110", req);

			EPV111001Message msg = (EPV111001Message) mp.getMessageRecord("EPV111001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0015");
			msg.setH01TIMSYS(getTimeStamp());
			
			if(req.getParameter("E01PRLCUN") == null){
				msg.setE01PRLCUN(userPO.getCusNum());
			} else {
				msg.setE01PRLCUN(req.getParameter("E01PRLCUN").trim());
				userPO.setCusNum(req.getParameter("E01PRLCUN").trim());
			}
			if(req.getParameter("E01PRLNUM") == null){
				msg.setE01PRLNUM(userPO.getPorfNum());
			} else {
				msg.setE01PRLNUM(req.getParameter("E01PRLNUM").trim());
				userPO.setPorfNum(req.getParameter("E01PRLNUM").trim());
			}
			
			mp.sendMessage(msg);

			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
 
			session.setAttribute("userpPO", userPO);
			session.setAttribute("EPV1110List", list);
			req.setAttribute("ACT",req.getParameter("ACT") == null ? "S" : req.getParameter("ACT").trim());
			forwardOnSuccess("EPV1110_reassessment_list.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqReassessmentNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		String ajaxRequest = "";
		
		try {
			userPO.setHeader20("NEW");
			mp = getMessageProcessor("EPV1110", req);
			EPV111001Message msgNew = (EPV111001Message) mp.getMessageRecord("EPV111001");
			msgNew.setH01USERID(user.getH01USR());
			msgNew.setH01PROGRM("EPV1110");
			msgNew.setH01TIMSYS(getTimeStamp());
			msgNew.setH01SCRCOD("01");
			msgNew.setH01OPECOD("0001");
			
			msgNew.setE01PRLCUN(userPO.getCusNum());
			msgNew.setE01PRLNUM(userPO.getPorfNum());
			msgNew.setE01PRLACR(req.getParameter("E01PRLACR") == null ? "" : req.getParameter("E01PRLACR").trim());
			
			ajaxRequest = (req.getParameter("ajaxRequest") == null ? "" : req.getParameter("ajaxRequest").trim());
			
			mp.sendMessage(msgNew);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgNew = (EPV111001Message) mp.receiveMessageRecord("EPV111001");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				if (ajaxRequest.equals("Y")) {
					JSONObject json = new JSONObject();
					json.put("type", "error");
					sendJSONResponse(res, json);
				} else {
					forward("EPV1110_reassessment_list.jsp", req, res);
				}
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msgNew);
				session.setAttribute("error", msgError);
				if (ajaxRequest.equals("Y")) {
					JSONObject json = new JSONObject();
					json.put("type", "data");
					sendJSONResponse(res, json);
				} else {
					forward("EPV1110_reassessment_maintenance.jsp", req, res);
				}
			}
	
		} finally {
			if (mp != null) mp.close();
		}
	
	}

	private void procReqReassessmentMaint(ESS0030DSMessage user,HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		EPV111001Message listMessage = null; 
		
		try {
			userPO.setHeader20("MAINTENANCE");
			mp = getMessageProcessor("EPV1110", req);
	
			if (req.getParameter("keys") != null) {
				JBObjList list = (JBObjList)session.getAttribute("EPV1110List");
				int index = Integer.parseInt(req.getParameter("keys").trim());
				listMessage = (EPV111001Message)list.get(index);
			}
	
			EPV111001Message msgMaint = (EPV111001Message) mp.getMessageRecord("EPV111001");
			msgMaint.setH01USERID(user.getH01USR());
			msgMaint.setH01PROGRM("EPV1110");
			msgMaint.setH01TIMSYS(getTimeStamp());
			msgMaint.setH01SCRCOD("01");
			msgMaint.setH01OPECOD("0002");
			
			if (listMessage == null) {
				msgMaint.setE01PRLCUN(req.getParameter("cusNum").trim());
				msgMaint.setE01PRLNUM(req.getParameter("PorfNum").trim());
				msgMaint.setE01PRLSEQ(req.getParameter("E01PRLSEQ").trim());
			} else {
				msgMaint.setE01PRLCUN(listMessage.getE01PRLCUN());
				msgMaint.setE01PRLNUM(listMessage.getE01PRLNUM());
				msgMaint.setE01PRLSEQ(listMessage.getE01PRLSEQ());
			}
			
			mp.sendMessage(msgMaint);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgMaint = (EPV111001Message) mp.receiveMessageRecord("EPV111001");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EPV1110_reassessment_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msgMaint);
				session.setAttribute("error", msgError);
				forward("EPV1110_reassessment_maintenance.jsp", req, res);
			}
	
		} finally {
			if (mp != null) mp.close();
		}

}

private void procReqReassessmentInquiry(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
	throws IOException, ServletException {

	UserPos userPO = getUserPos(req);
	MessageProcessor mp = null;
	EPV111001Message listMessage = null; 
	
	try {
		mp = getMessageProcessor("EPV1110", req);
	
		if (req.getParameter("keys") != null) {
			JBObjList list = (JBObjList)session.getAttribute("EPV1110List");
			int index = Integer.parseInt(req.getParameter("keys").trim());
			listMessage = (EPV111001Message)list.get(index);
		}
	
		EPV111001Message msgMaint = (EPV111001Message) mp.getMessageRecord("EPV111001");
		msgMaint.setH01USERID(user.getH01USR());
		msgMaint.setH01PROGRM("EPV1110");
		msgMaint.setH01TIMSYS(getTimeStamp());
		msgMaint.setH01SCRCOD("01");
		msgMaint.setH01OPECOD("0004");
	
		if (listMessage == null) {
			msgMaint.setE01PRLCUN(req.getParameter("cusNum").trim());
			msgMaint.setE01PRLNUM(req.getParameter("PorfNum").trim());
			msgMaint.setE01PRLSEQ(req.getParameter("E01PRLSEQ").trim());
		} else {
			msgMaint.setE01PRLCUN(listMessage.getE01PRLCUN());
			msgMaint.setE01PRLNUM(listMessage.getE01PRLNUM());
			msgMaint.setE01PRLSEQ(listMessage.getE01PRLSEQ());
		}

		mp.sendMessage(msgMaint);
	
		ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
		msgMaint = (EPV111001Message) mp.receiveMessageRecord("EPV111001");
		
		if (mp.hasError(msgError)) {
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			forward("EPV1110_reassessment_list.jsp", req, res);
		} else {
			session.setAttribute("userPO", userPO);
			session.setAttribute("datarec", msgMaint);
			session.setAttribute("error", msgError);
			forward("EPV1110_reassessment_maintenance.jsp?readOnly=true", req, res);
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
			mp = getMessageProcessor("EPV1110", req);
			EPV111001Message msg = (EPV111001Message) mp.getMessageRecord("EPV111001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EPV1110");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0005");
			
			setMessageRecord(req, msg);

			msg.setE01PRLCUN(userPO.getCusNum());
			msg.setE01PRLNUM(userPO.getPorfNum());
			
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EPV111001Message) mp.receiveMessageRecord("EPV111001");

			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("datarec",	msg);
				forward("EPV1110_reassessment_maintenance.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec",	msg);
				req.setAttribute("ACT","S");
				forward("EPV1110_reassessment_maintenance.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	protected void procReqDelete(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPV1110", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EPV1110List");
			int index = Integer.parseInt(req.getParameter("keys").trim());
			EPV111001Message listMessage = (EPV111001Message)list.get(index);
			
			EPV111001Message msgMaint = (EPV111001Message) mp.getMessageRecord("EPV111001");
			msgMaint.setH01USERID(user.getH01USR());
			msgMaint.setH01PROGRM("EPV1110");
			msgMaint.setH01TIMSYS(getTimeStamp());
			msgMaint.setH01SCRCOD("01");
			msgMaint.setH01OPECOD("0009");
			
			msgMaint.setE01PRLCUN(listMessage.getE01PRLCUN());
			msgMaint.setE01PRLNUM(listMessage.getE01PRLNUM());
			msgMaint.setE01PRLSEQ(listMessage.getE01PRLSEQ());

			mp.sendMessage(msgMaint);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (!mp.hasError(msgError)) {
				procActionReassessmentList(user, req, res, session);
			} else {
				session.setAttribute("error", msgError);
				forward("EPV1110_reassessment_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

}


