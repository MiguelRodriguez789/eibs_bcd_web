package datapro.eibs.salesplatform;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EPV113001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;

@SuppressWarnings("serial")
public class JSEPV1130 extends JSEIBSServlet {

	protected static final int A_PAGADURIA_LIST      = 100;
	protected static final int R_PAGADURIA_NEW 		 = 200;
	protected static final int R_PAGADURIA_MAINT 	 = 201;
	protected static final int R_PAGADURIA_DELETE 	 = 202;
	protected static final int R_PAGADURIA_INQ       = 300;
	protected static final int A_PAGADURIA_MAINT 	 = 600;


	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {
		
		switch (screen) {

			case A_PAGADURIA_LIST:
				procActionTablaFomentoList(user, req, res, session);
				break;
			case R_PAGADURIA_NEW:
				procReqFomentoNew(user, req, res, session);
				break;
			case R_PAGADURIA_MAINT:
				procReqFomentoMaint(user, req, res, session);
				break;
			case R_PAGADURIA_INQ:
				procReqFomentoInquiry(user, req, res, session);
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


	protected void procActionTablaFomentoList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);

		try {
			mp = getMessageProcessor("EPV1130", req);

			EPV113001Message msg = (EPV113001Message) mp.getMessageRecord("EPV113001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0015");
			msg.setH01TIMSYS(getTimeStamp());
			
			try {
				msg.setE01PFNCUN(req.getParameter("E01PFNCUN").trim());
				userPO.setCusNum(req.getParameter("E01PFNCUN").trim());
			} catch (Exception e) {
				msg.setE01PFNCUN(userPO.getCusNum());
			}
			
			try {
				msg.setE01PFNACC(req.getParameter("E01PFNACC").trim());
				userPO.setAccNum(req.getParameter("E01PFNACC").trim());
			} catch (Exception e) {
				msg.setE01PFNACC(userPO.getAccNum());
			}	
			
			try {
				msg.setE01PFNNUM(req.getParameter("E01PFNNUM").trim());
				userPO.setPorfNum(req.getParameter("E01PFNNUM").trim());
			} catch (Exception e) {
				msg.setE01PFNNUM(userPO.getPorfNum());
			}	
			
			try {
				msg.setE01PFNCNM(req.getParameter("E01PFNCNM").trim());
				userPO.setCusName(req.getParameter("E01PFNCNM").trim());
			} catch (Exception e) {
				msg.setE01PFNCNM(userPO.getCusName());
			}				
			
			mp.sendMessage(msg);

			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");


			session.setAttribute("userpPO", userPO);
			session.setAttribute("EPV113001List", list);
			req.setAttribute("ACT",req.getParameter("ACT") == null ? "S" : req.getParameter("ACT").trim());

			forward("EPV1130_plan_fomento_list.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqFomentoNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			userPO.setHeader20("NEW");


			mp = getMessageProcessor("EPV1130", req);
			EPV113001Message msgNew = (EPV113001Message) mp.getMessageRecord("EPV113001");
			msgNew.setH01USERID(user.getH01USR());
			msgNew.setH01PROGRM("EPV1130");
			msgNew.setH01TIMSYS(getTimeStamp());
			msgNew.setH01SCRCOD("01");
			msgNew.setH01OPECOD("0001");
			msgNew.setE01PFNSEQ("");
			msgNew.setE01PFNCUN(userPO.getCusNum());
			msgNew.setE01PFNCNM(userPO.getCusName());
			msgNew.setE01PFNACC(userPO.getAccNum());
			msgNew.setE01PFNNUM(userPO.getPorfNum());
			msgNew.setE01PFNCOD(req.getParameter("E01PFNCOD"));
	
			mp.sendMessage(msgNew);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgNew = (EPV113001Message) mp.receiveMessageRecord("EPV113001");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				req.setAttribute("ACT","S");
				forward("EPV1130_plan_fomento_details.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msgNew);
				session.setAttribute("error", msgError);
				forward("EPV1130_plan_fomento_details.jsp", req, res);
			}
	
		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqFomentoMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		EPV113001Message listMessage = null;
		
		try {
			userPO.setHeader20("MAINTENANCE");
			
			mp = getMessageProcessor("EPV1130", req);
	
			if (req.getParameter("currRow") != null) {
				JBObjList list = (JBObjList)session.getAttribute("EPV113001List");
				int index = Integer.parseInt(req.getParameter("currRow").trim());
				listMessage = (EPV113001Message)list.get(index);
			}

			EPV113001Message msgMaint = (EPV113001Message) mp.getMessageRecord("EPV113001");
			msgMaint.setH01USERID(user.getH01USR());
			msgMaint.setH01PROGRM("EPV1130");
			msgMaint.setH01TIMSYS(getTimeStamp());
			msgMaint.setH01SCRCOD("01");
			msgMaint.setH01OPECOD("0002");
			msgMaint.setE01PFNACC(userPO.getAccNum());
			msgMaint.setE01PFNNUM(userPO.getPorfNum());			
			
			if (listMessage == null) {
				msgMaint.setE01PFNCUN(req.getParameter("E01PFNCUN").trim());
				msgMaint.setE01PFNSEQ(req.getParameter("E01PFNSEQ").trim());
			} else {
				msgMaint.setE01PFNCUN(listMessage.getE01PFNCUN());
				msgMaint.setE01PFNSEQ(listMessage.getE01PFNSEQ());
				msgMaint.setE01PFNCOD(listMessage.getE01PFNCOD());
				msgMaint.setE01PFNCSQ(listMessage.getE01PFNCSQ());				
			}
			

			mp.sendMessage(msgMaint);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgMaint = (EPV113001Message) mp.receiveMessageRecord("EPV113001");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				req.setAttribute("ACT","S");
				forward("EPV1130_plan_fomento_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msgMaint);
				session.setAttribute("error", msgError);
				forward("EPV1130_plan_fomento_details.jsp", req, res);
			}
	
		} finally {
			if (mp != null)
				mp.close();
		}

	}
	
	private void procReqFomentoInquiry(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
	throws ServletException, IOException {
	
	UserPos userPO = getUserPos(req);
	MessageProcessor mp = null;
	
	try {
		mp = getMessageProcessor("EPV1130", req);
	
		JBObjList list = (JBObjList)session.getAttribute("EPV113001List");
		int index = Integer.parseInt(req.getParameter("currRow").trim());
		EPV113001Message listMessage = (EPV113001Message)list.get(index);

		EPV113001Message msgDes = (EPV113001Message) mp.getMessageRecord("EPV113001");
		msgDes.setH01USERID(user.getH01USR());
		msgDes.setH01PROGRM("EPV1300");
		msgDes.setH01TIMSYS(getTimeStamp());
		msgDes.setH01SCRCOD("01");
		msgDes.setH01OPECOD("0004");
	
		msgDes.setE01PFNNUM(listMessage.getE01PFNNUM());
		msgDes.setE01PFNSEQ(listMessage.getE01PFNSEQ());
		msgDes.setE01PFNCUP(listMessage.getE01PFNCUP());
		msgDes.setE01PFNCSQ(listMessage.getE01PFNCSQ());
		msgDes.setE01PFNCOD(listMessage.getE01PFNCOD());
		

		mp.sendMessage(msgDes);
		
		ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
		msgDes = (EPV113001Message) mp.receiveMessageRecord("EPV113001");
	
		if (mp.hasError(msgError)) {
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			req.setAttribute("ACT","S");
			forward("EPV1130_plan_fomento_list.jsp", req, res);
		} else {
			session.setAttribute("userPO", userPO);
			session.setAttribute("datarec", msgDes);
			session.setAttribute("error", msgError);
			forward("EPV1130_plan_fomento_details.jsp?readOnly=true", req, res);
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
			mp = getMessageProcessor("EPV1130", req);
			EPV113001Message msg = (EPV113001Message) session.getAttribute("datarec");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EPV1130");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("");
			
			
			msg.setE01PFNCUN(userPO.getCusNum());
			msg.setE01PFNCNM(userPO.getCusName());
			msg.setE01PFNACC(userPO.getAccNum());
			msg.setE01PFNNUM(userPO.getPorfNum());
			
			setMessageRecord(req, msg);
			
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EPV113001Message) mp.receiveMessageRecord("EPV113001");

			
			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("datarec",	msg);
				forward("EPV1130_plan_fomento_details.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec",	msg);
				req.setAttribute("ACT","S");
				forward("EPV1130_plan_fomento_details.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}

	}

	protected void procReqDelete(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {
		UserPos userPO = getUserPos(req);

		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPV1130", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EPV113001List");
			int index = Integer.parseInt(req.getParameter("currRow").trim());
			EPV113001Message listMessage = (EPV113001Message)list.get(index);
			
			EPV113001Message msgDelete = (EPV113001Message) mp.getMessageRecord("EPV113001");
			msgDelete.setH01USERID(user.getH01USR());
			msgDelete.setH01PROGRM("EPV1130");
			msgDelete.setH01TIMSYS(getTimeStamp());
			msgDelete.setH01SCRCOD("01");
			msgDelete.setH01OPECOD("0009");
			msgDelete.setE01PFNNUM(userPO.getPorfNum());
			
			
			msgDelete.setE01PFNCUN(listMessage.getE01PFNCUN());
			msgDelete.setE01PFNSEQ(listMessage.getE01PFNSEQ());
			msgDelete.setE01PFNCOD(listMessage.getE01PFNCOD());
			

			mp.sendMessage(msgDelete);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (!mp.hasError(msgError)) {
				procActionTablaFomentoList(user, req, res, session);
			} else {
				session.setAttribute("error", msgError);
				forward("EPV1130_plan_fomento_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}
}
