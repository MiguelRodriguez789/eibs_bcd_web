package datapro.eibs.salesplatform;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EPV115001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;

public class JSEPV1150 extends JSEIBSServlet {

	protected static final int R_CHECKS_THIRD_LIST = 100;
	protected static final int A_CHECKS_THIRD_LIST = 101;
	protected static final int R_CHECKS_THIRD_NEW = 200;
	protected static final int R_CHECKS_THIRD_MAINT = 201;
	protected static final int R_CHECKS_THIRD_DELETE = 202;	
	protected static final int R_CHECKS_THIRD_INQUIRY = 203;
	protected static final int A_CHECKS_THIRD_MAINT = 600;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case R_CHECKS_THIRD_LIST:
				procReqTablaChequesTercerosList(user, req, res, session);
				break;
			case A_CHECKS_THIRD_LIST:
				procActionTablaChequesTercerosList(user, req, res, session);
				break;
			case R_CHECKS_THIRD_NEW:
				procReqThirdNew(user, req, res, session);
				break;
			case R_CHECKS_THIRD_MAINT:
				procReqThirdMaint(user, req, res, session);
				break;
			case R_CHECKS_THIRD_INQUIRY:
				procReqThirdInquiry(user, req, res, session);
				break;
			case A_CHECKS_THIRD_MAINT:
				procActionMaintenance(user, req, res, session);
				break;
			case R_CHECKS_THIRD_DELETE:
				procReqDelete(user, req, res, session);
				break;
			default:
				forward(SuperServlet.devPage, req, res);
				break;
			}
	}

	protected void procReqTablaChequesTercerosList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		try {
			flexLog("About to call Page: EPV1150_checks_third_enter_search.jsp");
			forward("EPV1150_checks_third_enter_search.jsp", req, res);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}
	}

	protected void procActionTablaChequesTercerosList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);
		
		try {
			mp = getMessageProcessor("EPV1150", req);

			EPV115001Message msg = (EPV115001Message) mp.getMessageRecord("EPV115001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0015");
			msg.setH01TIMSYS(getTimeStamp());
			
			if(req.getParameter("E01PVCCUN") == null){
				msg.setE01PVCCUN(userPO.getCusNum());
			} else {
				msg.setE01PVCCUN(req.getParameter("E01PVCCUN").trim());
				userPO.setCusNum(req.getParameter("E01PVCCUN").trim());
			}
			if(req.getParameter("E01PVCNUM") == null){
				msg.setE01PVCNUM(userPO.getPorfNum());
			} else {
				msg.setE01PVCNUM(req.getParameter("E01PVCNUM").trim());
				userPO.setPorfNum(req.getParameter("E01PVCNUM").trim());
			}
			
			mp.sendMessage(msg);

			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
 
			session.setAttribute("userpPO", userPO);
			session.setAttribute("EPV115001List", list);
			forwardOnSuccess("EPV1150_checks_third_list.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

private void procReqThirdNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
	throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			userPO.setHeader20("NEW");
			
			mp = getMessageProcessor("EPV1150", req);
			EPV115001Message msgNew = (EPV115001Message) mp.getMessageRecord("EPV115001");
			msgNew.setH01USERID(user.getH01USR());
			msgNew.setH01PROGRM("EPV1150");
			msgNew.setH01TIMSYS(getTimeStamp());
			msgNew.setH01SCRCOD("01");
			msgNew.setH01OPECOD("0001");
			
			msgNew.setE01PVCCUN(userPO.getCusNum());
			msgNew.setE01PVCNUM(userPO.getPorfNum());
	
			mp.sendMessage(msgNew);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgNew = (EPV115001Message) mp.receiveMessageRecord("EPV115001");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EPV1150_checks_third_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msgNew);
				session.setAttribute("error", msgError);
				forward("EPV1150_checks_third_maintenance.jsp", req, res);
			}
	
		} finally {
			if (mp != null)
				mp.close();
		}
	
}

private void procReqThirdMaint(ESS0030DSMessage user,HttpServletRequest req, HttpServletResponse res, HttpSession session) 
	throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		EPV115001Message listMessage = null; 
		
		try {
			userPO.setHeader20("MAINTENANCE");

			mp = getMessageProcessor("EPV1150", req);
	
			if (req.getParameter("key") != null) {
				JBObjList list = (JBObjList)session.getAttribute("EPV115001List");
				int index = Integer.parseInt(req.getParameter("key").trim());
				listMessage = (EPV115001Message)list.get(index);
			}
	
			EPV115001Message msgMaint = (EPV115001Message) mp.getMessageRecord("EPV115001");
			msgMaint.setH01USERID(user.getH01USR());
			msgMaint.setH01PROGRM("EPV1150");
			msgMaint.setH01TIMSYS(getTimeStamp());
			msgMaint.setH01SCRCOD("01");
			msgMaint.setH01OPECOD("0002");
			
			if (listMessage == null) {
				msgMaint.setE01PVCCUN(req.getParameter("cusNum").trim());
				msgMaint.setE01PVCNUM(req.getParameter("PorfNum").trim());
				msgMaint.setE01PVCSEQ(req.getParameter("E01PVCSEQ").trim());
			} else {
				msgMaint.setE01PVCCUN(listMessage.getE01PVCCUN());
				msgMaint.setE01PVCNUM(listMessage.getE01PVCNUM());
				msgMaint.setE01PVCSEQ(listMessage.getE01PVCSEQ());
			}
			
			mp.sendMessage(msgMaint);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgMaint = (EPV115001Message) mp.receiveMessageRecord("EPV115001");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EPV1150_checks_third_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msgMaint);
				session.setAttribute("error", msgError);
				forward("EPV1150_checks_third_maintenance.jsp", req, res);
			}
	
		} finally {
			if (mp != null)
				mp.close();
		}

}

private void procReqThirdInquiry(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
	throws IOException, ServletException {

	UserPos userPO = getUserPos(req);
	MessageProcessor mp = null;
	EPV115001Message listMessage = null; 
	
	try {
		mp = getMessageProcessor("EPV1150", req);
	
		if (req.getParameter("key") != null) {
			JBObjList list = (JBObjList)session.getAttribute("EPV115001List");
			int index = Integer.parseInt(req.getParameter("key").trim());
			listMessage = (EPV115001Message)list.get(index);
		}
	
		EPV115001Message msgMaint = (EPV115001Message) mp.getMessageRecord("EPV115001");
		msgMaint.setH01USERID(user.getH01USR());
		msgMaint.setH01PROGRM("EPV1150");
		msgMaint.setH01TIMSYS(getTimeStamp());
		msgMaint.setH01SCRCOD("01");
		msgMaint.setH01OPECOD("0004");
	
		if (listMessage == null) {
			msgMaint.setE01PVCCUN(req.getParameter("cusNum").trim());
			msgMaint.setE01PVCNUM(req.getParameter("PorfNum").trim());
			msgMaint.setE01PVCSEQ(req.getParameter("E01PVCSEQ").trim());
		} else {
			msgMaint.setE01PVCCUN(listMessage.getE01PVCCUN());
			msgMaint.setE01PVCNUM(listMessage.getE01PVCNUM());
			msgMaint.setE01PVCSEQ(listMessage.getE01PVCSEQ());
		}

		mp.sendMessage(msgMaint);
	
		ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
		msgMaint = (EPV115001Message) mp.receiveMessageRecord("EPV115001");
		
		if (mp.hasError(msgError)) {
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			forward("EPV1150_checks_third_list.jsp", req, res);
		} else {
			session.setAttribute("userPO", userPO);
			session.setAttribute("datarec", msgMaint);
			session.setAttribute("error", msgError);
			forward("EPV1150_checks_third_maintenance.jsp?readOnly=true", req, res);
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
			mp = getMessageProcessor("EPV1150", req);
			EPV115001Message msg = (EPV115001Message) mp.getMessageRecord("EPV115001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EPV1150");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0005");
			
			setMessageRecord(req, msg);

			msg.setE01PVCCUN(userPO.getCusNum());
			msg.setE01PVCNUM(userPO.getPorfNum());
			
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EPV115001Message) mp.receiveMessageRecord("EPV115001");

			
			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("datarec",	msg);
				forward("EPV1150_checks_third_maintenance.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec",	msg);
				req.setAttribute("ACT","S");
				forward("EPV1150_checks_third_maintenance.jsp", req, res);
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
			mp = getMessageProcessor("EPV1150", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EPV115001List");
			int index = Integer.parseInt(req.getParameter("key").trim());
			EPV115001Message listMessage = (EPV115001Message)list.get(index);
			
			EPV115001Message msgMaint = (EPV115001Message) mp.getMessageRecord("EPV115001");
			msgMaint.setH01USERID(user.getH01USR());
			msgMaint.setH01PROGRM("EPV1150");
			msgMaint.setH01TIMSYS(getTimeStamp());
			msgMaint.setH01SCRCOD("01");
			msgMaint.setH01OPECOD("0009");
			
			msgMaint.setE01PVCCUN(listMessage.getE01PVCCUN());
			msgMaint.setE01PVCNUM(listMessage.getE01PVCNUM());
			msgMaint.setE01PVCSEQ(listMessage.getE01PVCSEQ());

			mp.sendMessage(msgMaint);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (!mp.hasError(msgError)) {
				procActionTablaChequesTercerosList(user, req, res, session);
			} else {
				session.setAttribute("error", msgError);
				forward("EPV1150_checks_third_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

}


