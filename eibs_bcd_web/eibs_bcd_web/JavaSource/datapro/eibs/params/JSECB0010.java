package datapro.eibs.params;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ECB001001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.Util;

@SuppressWarnings("serial")
public class JSECB0010 extends JSEIBSServlet {

	protected static final int R_NEW 	 = 200;
	protected static final int R_MAINT 	 = 300;
	protected static final int R_DELETE  = 400;

	protected static final int A_LIST    = 500;
	protected static final int A_MAINT 	 = 600;


	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {
		
		switch (screen) {

			case R_NEW:
				procReqNewCodeCobranza(user, req, res, session,"NEW");
				break;
			case R_MAINT:
				procReqMaintCobranza(user, req, res, session,"MAINTENANCE");
				break;
			case R_DELETE:
				procReqDeleteCobranza(user, req, res, session, "DELETE");
				break;
			case A_LIST:
				procActionDataList(user, req, res, session);
				break;
			case A_MAINT:
				procActionMaintenance(user, req, res, session);
				
				break;
			default:
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}
	

	private void procReqNewCodeCobranza(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, String option) 
		throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		userPO.setPurpose(option);

		try {
			mp = getMessageProcessor("ECB0010", req);
			ECB001001Message msgNew = (ECB001001Message) mp.getMessageRecord("ECB001001");
			msgNew.setH01USERID(user.getH01USR());
			msgNew.setH01PROGRM("ECB0010");
			msgNew.setH01TIMSYS(getTimeStamp());
			msgNew.setH01SCRCOD("01");
			msgNew.setH01OPECOD("0001");
			msgNew.setE01CBZCDE(Util.getReqParameter("E01CBZCDE", req));
	
			mp.sendMessage(msgNew);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgNew = (ECB001001Message) mp.receiveMessageRecord("ECB001001");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("ECB0010_codigos_cobranza_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("RecData", msgNew);
				session.setAttribute("error", msgError);
				forward("ECB0010_codigos_cobranza_detalles.jsp", req, res);
			}
	
		} finally {
			if (mp != null)
				mp.close();
		}
}

	private void procReqDeleteCobranza(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, String option) 
	throws ServletException, IOException {
	
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		userPO.setPurpose(option);

		try {
			mp = getMessageProcessor("ECB0010", req);
			
			JBObjList list = (JBObjList)session.getAttribute("ECB001001List");
			int index = Integer.parseInt(req.getParameter("key").trim());
			ECB001001Message listMessage = (ECB001001Message)list.get(index);
			
			ECB001001Message msgDelete = (ECB001001Message) mp.getMessageRecord("ECB001001");
			msgDelete.setH01USERID(user.getH01USR());
			msgDelete.setH01PROGRM("ECB0010");
			msgDelete.setH01TIMSYS(getTimeStamp());
			msgDelete.setH01SCRCOD("01");
			msgDelete.setH01OPECOD("0009");
			msgDelete.setE01CBZCDE(listMessage.getE01CBZCDE());

			mp.sendMessage(msgDelete);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (!mp.hasError(msgError)) {
				procActionDataList(user, req, res, session);
			} else {
				session.setAttribute("error", msgError);
				forward("ECB0010_codigos_cobranza_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}


	private void procReqMaintCobranza(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, String option) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		userPO.setPurpose(option);
		ECB001001Message listMessage = null;

		try {
			mp = getMessageProcessor("ECB0010", req);
			
			if (req.getParameter("key") != null) {
				JBObjList list = (JBObjList)session.getAttribute("ECB001001List");
				int index = Integer.parseInt(req.getParameter("key").trim());
				listMessage = (ECB001001Message)list.get(index);
			}
			
			
			ECB001001Message msgMaint = (ECB001001Message) mp.getMessageRecord("ECB001001");
			msgMaint.setH01USERID(user.getH01USR());
			msgMaint.setH01PROGRM("ECB0010");
			msgMaint.setH01TIMSYS(getTimeStamp());
			msgMaint.setH01SCRCOD("01");
			msgMaint.setH01OPECOD("0004");
			msgMaint.setE01CBZCDE(listMessage == null ? Util.getReqParameter("E01CBZCDE", req) : listMessage.getE01CBZCDE());
	
			mp.sendMessage(msgMaint);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgMaint = (ECB001001Message) mp.receiveMessageRecord("ECB001001");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("ECB0010_codigos_cobranza_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("RecData", msgMaint);
				session.setAttribute("error", msgError);
				forward("ECB0010_codigos_cobranza_detalles.jsp", req, res);
			}
	
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionDataList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);


		try {
			mp = getMessageProcessor("ECB0010", req);
			ECB001001Message msg = (ECB001001Message) mp.getMessageRecord("ECB001001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0015");
			msg.setH01TIMSYS(getTimeStamp());
			mp.sendMessage(msg);

			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
			
			session.setAttribute("userpPO", userPO);
			session.setAttribute("ECB001001List", list);
			forward("ECB0010_codigos_cobranza_list.jsp", req, res);
	
			} finally {
				if (mp != null)
					mp.close();
			}
	}	

	private void procActionMaintenance(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ECB0010", req);
			ECB001001Message msg = (ECB001001Message) session.getAttribute("RecData");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ECB0010");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0005");
			
			setMessageRecord(req, msg);
			
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (ECB001001Message) mp.receiveMessageRecord("ECB001001");

			
			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("RecData",	msg);
				forward("ECB0010_codigos_cobranza_detalles.jsp", req, res);
			} else {
				procActionDataList(user, req, res, session);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}



	
}	




