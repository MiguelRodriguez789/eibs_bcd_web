package datapro.eibs.salesplatform;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EPV112001Message;
import datapro.eibs.beans.EPV118001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEPV1120 extends JSEIBSServlet {

	protected static final int R_RELIQUIDAR_LIST       = 101;
	protected static final int R_RELIQUIDAR_NEW    	   = 200;
	protected static final int R_RELIQUIDAR_COD        = 201;
	protected static final int R_RELIQUIDAR_MAINT      = 300;
	protected static final int R_RELIQUIDAR_INQ        = 301;
	protected static final int R_RELIQUIDAR_DELETE     = 400;
	protected static final int A_RELIQUIDAR_MAINT      = 500;
	protected static final int A_RELIQUIDAR_COD        = 501;
	
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {
		
		switch (screen) {
			case R_RELIQUIDAR_LIST:
				procReqreliquidarList(user, req, res, session);
				break;
			case R_RELIQUIDAR_NEW:
				procReqreliquidarNew(user, req, res, session);
				break;
			case R_RELIQUIDAR_COD:
				procReqreliquidarCode(user, req, res, session);
				break;
			case R_RELIQUIDAR_MAINT:
				procReqreliquidarMaintenance(user, req, res, session);
				break;
			case R_RELIQUIDAR_INQ:
				procReqreliquidarInquiry(user, req, res, session);
				break;
			case R_RELIQUIDAR_DELETE:
				procReqreliquidarDelete(user, req, res, session);
				break;
			case A_RELIQUIDAR_MAINT:
				procActionreliquidarMaintenance(user, req, res, session);
				break;
			case A_RELIQUIDAR_COD:
				procActionreliquidarCode(user, req, res, session);
				break;
			default:
				break;
		}

	}

	private void procReqreliquidarList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPV1120", req);
			EPV112001Message msgReq = (EPV112001Message) mp.getMessageRecord("EPV112001");
			msgReq.setH01USERID(user.getH01USR());
			msgReq.setH01TIMSYS(getTimeStamp());
			msgReq.setH01OPECOD("0015");
			
			try {
				msgReq.setE01ORLCUN(req.getParameter("E01ORLCUN").trim());
				userPO.setCusNum(req.getParameter("E01ORLCUN").trim());
			} catch (Exception e) {
				msgReq.setE01ORLCUN(userPO.getCusNum());
			}
			
			try {
				msgReq.setE01ORLNUM(req.getParameter("E01ORLNUM").trim());
				userPO.setPorfNum(req.getParameter("E01ORLNUM").trim());
			} catch (Exception e) {
				msgReq.setE01ORLNUM(userPO.getPorfNum());
			}
						
			mp.sendMessage(msgReq);

			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");

			session.setAttribute("userPO", userPO);
			session.setAttribute("EPV1120List", list);
			req.setAttribute("ACT",req.getParameter("ACT") == null ? "S" : req.getParameter("ACT").trim());
			req.setAttribute("prdCode", req.getParameter("prdCode"));
			forward("EPV1120_reliquidar_list.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqreliquidarNew(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		try {
			userPO.setHeader20("NEW");
			
			mp = getMessageProcessor("EPV1120", req);
			EPV112001Message msgReq = (EPV112001Message) mp.getMessageRecord("EPV112001");
			msgReq.setH01USERID(user.getH01USR());
			msgReq.setH01PROGRM("EPV1120");
			msgReq.setH01TIMSYS(getTimeStamp());
			msgReq.setH01SCRCOD("01");
			msgReq.setH01OPECOD("0001");

			msgReq.setE01ORLCUN(userPO.getCusNum());
			msgReq.setE01ORLNUM(userPO.getPorfNum());

			mp.sendMessage(msgReq);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgReq = (EPV112001Message) mp.receiveMessageRecord("EPV112001");

			req.setAttribute("prdCode", req.getParameter("prdCode"));
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EPV1120_reliquidar_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msgReq);
				session.setAttribute("error", msgError);
				forward("EPV1120_reliquidar_maintenance.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqreliquidarCode(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		try {
			userPO.setHeader20("NEW");
			
			mp = getMessageProcessor("EPV1120", req);
			EPV112001Message msgReq = (EPV112001Message) mp.getMessageRecord("EPV112001");
			msgReq.setH01USERID(user.getH01USR());
			msgReq.setH01PROGRM("EPV1120");
			msgReq.setH01TIMSYS(getTimeStamp());
			msgReq.setH01SCRCOD("01");
			msgReq.setH01OPECOD("0001");

			msgReq.setE01ORLCUN(userPO.getCusNum());
			msgReq.setE01ORLNUM(userPO.getPorfNum());

			mp.sendMessage(msgReq);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgReq = (EPV112001Message) mp.receiveMessageRecord("EPV112001");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EPV1120_reliquidar_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msgReq);
				session.setAttribute("error", msgError);
				forward("EPV1120_reliquidar_code.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}

	}

	private void procReqreliquidarMaintenance(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		
		try {
			userPO.setHeader20("MAINTENANCE");

			mp = getMessageProcessor("EPV1120", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EPV1120List");
			int index = Integer.parseInt(req.getParameter("keys").trim());
			
			EPV112001Message listMessage = (EPV112001Message)list.get(index);

			EPV112001Message msgReq = (EPV112001Message) mp.getMessageRecord("EPV112001");
			msgReq.setH01USERID(user.getH01USR());
			msgReq.setH01PROGRM("EPV1120");
			msgReq.setH01TIMSYS(getTimeStamp());
			msgReq.setH01SCRCOD("01");
			msgReq.setH01OPECOD("0002");

			msgReq.setE01ORLCUN(listMessage.getE01ORLCUN());
			msgReq.setE01ORLNUM(listMessage.getE01ORLNUM());
			msgReq.setE01ORLSEQ(listMessage.getE01ORLSEQ());

			mp.sendMessage(msgReq);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgReq = (EPV112001Message) mp.receiveMessageRecord("EPV112001");

			req.setAttribute("prdCode", req.getParameter("prdCode"));
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EPV1120_reliquidar_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msgReq);
				session.setAttribute("error", msgError);
				forward("EPV1120_reliquidar_maintenance.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqreliquidarInquiry(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		EPV112001Message listMessage = null;
		
		try {
			mp = getMessageProcessor("EPV1120", req);
		
			if (req.getParameter("keys") != null) {
				JBObjList list = (JBObjList)session.getAttribute("EPV1120List");
				int index = Integer.parseInt(req.getParameter("keys").trim());
				listMessage = (EPV112001Message)list.get(index);
			}
			
			EPV112001Message msgReq = (EPV112001Message) mp.getMessageRecord("EPV112001");
			msgReq.setH01USERID(user.getH01USR());
			msgReq.setH01PROGRM("EPV1120");
			msgReq.setH01TIMSYS(getTimeStamp());
			msgReq.setH01SCRCOD("01");
			msgReq.setH01OPECOD("0004");
		
			if (listMessage == null) {
				msgReq.setE01ORLCUN(req.getParameter("cusNum").trim());
				msgReq.setE01ORLNUM(req.getParameter("PorfNum").trim());
				msgReq.setE01ORLSEQ(req.getParameter("E01ORLSEQ").trim());
			} else {
				msgReq.setE01ORLCUN(listMessage.getE01ORLCUN());
				msgReq.setE01ORLNUM(listMessage.getE01ORLNUM());
				msgReq.setE01ORLSEQ(listMessage.getE01ORLSEQ());
			}
			
			mp.sendMessage(msgReq);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgReq = (EPV112001Message) mp.receiveMessageRecord("EPV112001");
		
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EPV1120_reliquidar_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msgReq);
				session.setAttribute("error", msgError);
				forward("EPV1120_reliquidar_maintenance.jsp?readOnly=true", req, res);
			}
		
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqreliquidarDelete(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPV1120", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EPV1120List");
			int index = Integer.parseInt(req.getParameter("keys").trim());
			EPV112001Message listMessage = (EPV112001Message)list.get(index);
			
			EPV112001Message msgReq = (EPV112001Message) mp.getMessageRecord("EPV112001");
			msgReq.setH01USERID(user.getH01USR());
			msgReq.setH01PROGRM("EPV1120");
			msgReq.setH01TIMSYS(getTimeStamp());
			msgReq.setH01SCRCOD("01");
			msgReq.setH01OPECOD("0009");
			
			msgReq.setE01ORLCUN(listMessage.getE01ORLCUN());
			msgReq.setE01ORLNUM(listMessage.getE01ORLNUM());
			msgReq.setE01ORLSEQ(listMessage.getE01ORLSEQ());

			mp.sendMessage(msgReq);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			req.setAttribute("prdCode", req.getParameter("prdCode"));
			if (!mp.hasError(msgError)) {
				procReqreliquidarList(user, req, res, session);
			} else {
				session.setAttribute("error", msgError);
				forward("EPV1120_reliquidar_list.jsp", req, res);
			}
			
		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionreliquidarMaintenance(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPV1120", req);
			EPV112001Message msg = (EPV112001Message) mp.getMessageRecord("EPV112001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EPV1120");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0005");
			
			setMessageRecord(req, msg);

			msg.setE01ORLCUN(userPO.getCusNum());
			msg.setE01ORLNUM(userPO.getPorfNum());
			
			msg.setE01ORLOAC(req.getParameter("REFOAC"));
			
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EPV112001Message) mp.receiveMessageRecord("EPV112001");
			
			req.setAttribute("prdCode", req.getParameter("prdCode"));
			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("datarec",	msg);
				forward("EPV1120_reliquidar_maintenance.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec",	msg);
				req.setAttribute("ACT","S");
				forward("EPV1120_reliquidar_maintenance.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionreliquidarCode(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPV1120", req);
			EPV112001Message msg = (EPV112001Message) mp.getMessageRecord("EPV112001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EPV1120");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0006");
			
			setMessageRecord(req, msg);
	
			msg.setE01ORLCUN(userPO.getCusNum());
			msg.setE01ORLNUM(userPO.getPorfNum());
			
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EPV112001Message) mp.receiveMessageRecord("EPV112001");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("datarec",	msg);
				forward("EPV1120_reliquidar_code.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec",	msg);
				req.setAttribute("ACT","S");
				forward("EPV1120_reliquidar_code.jsp", req, res);
			}
	
		} finally {
			if (mp != null)
				mp.close();
		}
	}

}
