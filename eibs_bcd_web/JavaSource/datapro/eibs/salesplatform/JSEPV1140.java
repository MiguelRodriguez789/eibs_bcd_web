package datapro.eibs.salesplatform;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EPV114001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;

public class JSEPV1140 extends JSEIBSServlet {

	protected static final int R_TITULARS_LIST = 100;
	protected static final int A_TITULARS_LIST = 101;
	protected static final int R_TITULARS_NEW = 200;
	protected static final int R_TITULARS_MAINT = 201;
	protected static final int R_TITULARS_DELETE = 202;	
	protected static final int R_TITULARS_INQUIRY = 203;
	protected static final int A_TITULARS_MAINT = 600;
	
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {
		
		switch (screen) {
			case R_TITULARS_LIST:
				procReqTablaList(user, req, res, session);
				break;
			case A_TITULARS_LIST:
				procActionTablaList(user, req, res, session);
				break;
			case R_TITULARS_NEW:
				procReqNew(user, req, res, session);
				break;
			case R_TITULARS_MAINT:
				procReqMaint(user, req, res, session);
				break;
			case R_TITULARS_INQUIRY:
				procReqInquiry(user, req, res, session);
				break;
			case A_TITULARS_MAINT:
				procActionMaintenance(user, req, res, session);
				break;
			case R_TITULARS_DELETE:
				procReqDelete(user, req, res, session);
				break;
			default:
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	protected void procReqTablaList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		try {
			flexLog("About to call Page: EPV1140_titulars_enter_search.jsp");
			forward("EPV1140_titulars_enter_search.jsp", req, res);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}
	}
	
	protected void procActionTablaList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);
		
		try {
			mp = getMessageProcessor("EPV1140", req);

			EPV114001Message msg = (EPV114001Message) mp.getMessageRecord("EPV114001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0015");
			msg.setH01TIMSYS(getTimeStamp());
			
			try {
				msg.setE01PVTCUN(req.getParameter("E01PVTCUN").trim());
				userPO.setCusNum(req.getParameter("E01PVTCUN").trim());
			} catch (Exception e) {
				msg.setE01PVTCUN(userPO.getCusNum());
			}
			try {
				msg.setE01PVTNUM(req.getParameter("E01PVTNUM").trim());
				userPO.setPorfNum(req.getParameter("E01PVTNUM").trim());
			} catch (Exception e) {
				msg.setE01PVTNUM(userPO.getPorfNum());
			}
			
			mp.sendMessage(msg);

			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
 
			session.setAttribute("userpPO", userPO);
			session.setAttribute("EPV114001List", list);
			req.setAttribute("ACT",req.getParameter("ACT") == null ? "S" : req.getParameter("ACT").trim());
			forwardOnSuccess("EPV1140_titulars_list.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			userPO.setHeader20("NEW");
			
			mp = getMessageProcessor("EPV1140", req);
			EPV114001Message msgNew = (EPV114001Message) mp.getMessageRecord("EPV114001");
			msgNew.setH01USERID(user.getH01USR());
			msgNew.setH01PROGRM("EPV1140");
			msgNew.setH01TIMSYS(getTimeStamp());
			msgNew.setH01SCRCOD("01");
			msgNew.setH01OPECOD("0001");
			
			msgNew.setE01PVTCUN(userPO.getCusNum());
			msgNew.setE01PVTNUM(userPO.getPorfNum());
	
			mp.sendMessage(msgNew);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgNew = (EPV114001Message) mp.receiveMessageRecord("EPV114001");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EPV1140_titulars_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msgNew);
				session.setAttribute("error", msgError);
				forward("EPV1140_titulars_maintenance.jsp", req, res);
			}
	
		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		EPV114001Message listMessage = null;
		
		try {
			userPO.setHeader20("MAINTENANCE");

			mp = getMessageProcessor("EPV1140", req);
	
			if (req.getParameter("key") != null) {
				JBObjList list = (JBObjList)session.getAttribute("EPV114001List");
				int index = Integer.parseInt(req.getParameter("key").trim());
				listMessage = (EPV114001Message)list.get(index);
			}

			EPV114001Message msgMaint = (EPV114001Message) mp.getMessageRecord("EPV114001");
			msgMaint.setH01USERID(user.getH01USR());
			msgMaint.setH01PROGRM("EPV1140");
			msgMaint.setH01TIMSYS(getTimeStamp());
			msgMaint.setH01SCRCOD("01");
			msgMaint.setH01OPECOD("0002");
			
			if (listMessage == null) {
				msgMaint.setE01PVTCUN(req.getParameter("cusNum").trim());
				msgMaint.setE01PVTNUM(req.getParameter("PorfNum").trim());
				msgMaint.setE01PVTSEQ(req.getParameter("E01PVTSEQ").trim());
			} else {
				msgMaint.setE01PVTCUN(listMessage.getE01PVTCUN());
				msgMaint.setE01PVTNUM(listMessage.getE01PVTNUM());
				msgMaint.setE01PVTSEQ(listMessage.getE01PVTSEQ());
			}

			mp.sendMessage(msgMaint);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgMaint = (EPV114001Message) mp.receiveMessageRecord("EPV114001");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EPV1140_titulars_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msgMaint);
				session.setAttribute("error", msgError);
				forward("EPV1140_titulars_maintenance.jsp", req, res);
			}
	
		} finally {
			if (mp != null)
				mp.close();
		}

	}

	private void procReqInquiry(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		EPV114001Message listMessage = null;
		
		try {
			mp = getMessageProcessor("EPV1140", req);
		
			if (req.getParameter("key") != null) {
				JBObjList list = (JBObjList)session.getAttribute("EPV114001List");
				int index = Integer.parseInt(req.getParameter("key").trim());
				listMessage = (EPV114001Message)list.get(index);
			}

			EPV114001Message msgMaint = (EPV114001Message) mp.getMessageRecord("EPV114001");
			msgMaint.setH01USERID(user.getH01USR());
			msgMaint.setH01PROGRM("EPV1140");
			msgMaint.setH01TIMSYS(getTimeStamp());
			msgMaint.setH01SCRCOD("01");
			msgMaint.setH01OPECOD("0004");
		
			if (listMessage == null) {
				msgMaint.setE01PVTCUN(req.getParameter("cusNum").trim());
				msgMaint.setE01PVTNUM(req.getParameter("PorfNum").trim());
				msgMaint.setE01PVTSEQ(req.getParameter("E01PVTSEQ").trim());
			} else {
				msgMaint.setE01PVTCUN(listMessage.getE01PVTCUN());
				msgMaint.setE01PVTNUM(listMessage.getE01PVTNUM());
				msgMaint.setE01PVTSEQ(listMessage.getE01PVTSEQ());
			}

			mp.sendMessage(msgMaint);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgMaint = (EPV114001Message) mp.receiveMessageRecord("EPV114001");
		
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EPV1140_titulars_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msgMaint);
				session.setAttribute("error", msgError);
				forward("EPV1140_titulars_maintenance.jsp?readOnly=true", req, res);
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
			mp = getMessageProcessor("EPV1140", req);
			EPV114001Message msg = (EPV114001Message) mp.getMessageRecord("EPV114001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EPV1140");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0005");
			
			setMessageRecord(req, msg);

			msg.setE01PVTCUN(userPO.getCusNum());
			msg.setE01PVTNUM(userPO.getPorfNum());
			
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EPV114001Message) mp.receiveMessageRecord("EPV114001");

			
			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("datarec",	msg);
				forward("EPV1140_titulars_maintenance.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec",	msg);
				req.setAttribute("ACT","S");
				forward("EPV1140_titulars_maintenance.jsp", req, res);
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
			mp = getMessageProcessor("EPV1140", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EPV114001List");
			int index = Integer.parseInt(req.getParameter("key").trim());
			EPV114001Message listMessage = (EPV114001Message)list.get(index);
			
			EPV114001Message msgDelete = (EPV114001Message) mp.getMessageRecord("EPV114001");
			msgDelete.setH01USERID(user.getH01USR());
			msgDelete.setH01PROGRM("EPV1140");
			msgDelete.setH01TIMSYS(getTimeStamp());
			msgDelete.setH01SCRCOD("01");
			msgDelete.setH01OPECOD("0009");
			
			msgDelete.setE01PVTCUN(listMessage.getE01PVTCUN());
			msgDelete.setE01PVTNUM(listMessage.getE01PVTNUM());
			msgDelete.setE01PVTSEQ(listMessage.getE01PVTSEQ());

			mp.sendMessage(msgDelete);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (!mp.hasError(msgError)) {
				procActionTablaList(user, req, res, session);
			} else {
				session.setAttribute("error", msgError);
				forward("EPV1140_titulars_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

}
