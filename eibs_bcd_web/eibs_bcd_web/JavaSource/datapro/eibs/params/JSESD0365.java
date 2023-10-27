package datapro.eibs.params;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD036501Message;
import datapro.eibs.beans.ESD036502Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;

@SuppressWarnings("serial")
public class JSESD0365 extends JSEIBSServlet {

	protected static final int R_NEW 	 = 200;
	protected static final int R_MAINT 	 = 300;
	protected static final int R_DELETE  = 400;

	protected static final int A_LIST    = 500;
	protected static final int A_MAINT 	 = 600;


	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {
		
		switch (screen) {

			case R_NEW:
				procReqNewFomento(user, req, res, session,"NEW");
				break;
			case R_MAINT:
				procReqMaintFomento(user, req, res, session,"MAINTENANCE");
				break;
			case R_DELETE:
				procReqDeleteFomento(user, req, res, session, "DELETE");
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
	

	private void procReqNewFomento(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, String option) 
		throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		userPO.setPurpose(option);
		userPO.setCusName(userPO.getCusName());

		try {
			mp = getMessageProcessor("ESD0365", req);
			ESD036501Message msgNew = (ESD036501Message) mp.getMessageRecord("ESD036501");
			msgNew.setH01USERID(user.getH01USR());
			msgNew.setH01PROGRM("ESD0365");
			msgNew.setH01TIMSYS(getTimeStamp());
			msgNew.setH01SCRCOD("01");
			msgNew.setH01OPECOD("0001");
			
			msgNew.setE01PFMCOD(req.getParameter("E01PFMCOD"));
	
			mp.sendMessage(msgNew);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgNew = (ESD036501Message) mp.receiveMessageRecord("ESD036501");
			msgNew.setE01CUSNA1(userPO.getCusName());
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("ESD0365_planes_fomento_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("RecData", msgNew);
				session.setAttribute("error", msgError);
				forward("ESD0365_plan_fomento_detalles.jsp", req, res);
			}
	
		} finally {
			if (mp != null)
				mp.close();
		}
}

	private void procReqDeleteFomento(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, String option) 
	throws ServletException, IOException {
	
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		userPO.setPurpose(option);
		userPO.setCusName(userPO.getCusName());

		try {
			mp = getMessageProcessor("ESD0365", req);
			
			JBObjList list = (JBObjList)session.getAttribute("ESD036501List");
			int index = Integer.parseInt(req.getParameter("key").trim());
			ESD036501Message listMessage = (ESD036501Message)list.get(index);
			
			ESD036501Message msgDelete = (ESD036501Message) mp.getMessageRecord("ESD036501");
			msgDelete.setH01USERID(user.getH01USR());
			msgDelete.setH01PROGRM("ESD0365");
			msgDelete.setH01TIMSYS(getTimeStamp());
			msgDelete.setH01SCRCOD("01");
			msgDelete.setH01OPECOD("0009");
			
			msgDelete.setE01PFMCOD(listMessage.getE01PFMCOD());

			mp.sendMessage(msgDelete);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (!mp.hasError(msgError)) {
				procActionDataList(user, req, res, session);
			} else {
				session.setAttribute("error", msgError);
				forward("ESD0365_planes_fomento_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}
	


	private void procReqMaintFomento(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, String option) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		userPO.setPurpose(option);
		ESD036501Message listMessage = null;
		userPO.setCusName(userPO.getCusName());

		try {
			mp = getMessageProcessor("ESD0365", req);
			
			if (req.getParameter("key") != null) {
				JBObjList list = (JBObjList)session.getAttribute("ESD036501List");
				int index = Integer.parseInt(req.getParameter("key").trim());
				listMessage = (ESD036501Message)list.get(index);
			}
			
			
			ESD036501Message msgMaint = (ESD036501Message) mp.getMessageRecord("ESD036501");
			msgMaint.setH01USERID(user.getH01USR());
			msgMaint.setH01PROGRM("ESD0365");
			msgMaint.setH01TIMSYS(getTimeStamp());
			msgMaint.setH01SCRCOD("01");
			msgMaint.setH01OPECOD("0004");
			if (listMessage == null) {
				msgMaint.setE01PFMCOD(req.getParameter("E01PFMCOD").trim());
			} else {
				msgMaint.setE01PFMCOD(listMessage.getE01PFMCOD());
			}

	
			mp.sendMessage(msgMaint);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgMaint = (ESD036501Message) mp.receiveMessageRecord("ESD036501");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("ESD0365_planes_fomento_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("RecData", msgMaint);
				session.setAttribute("error", msgError);
				forward("ESD0365_plan_fomento_detalles.jsp", req, res);
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
			mp = getMessageProcessor("ESD0365", req);
			ESD036501Message msg = (ESD036501Message) mp.getMessageRecord("ESD036501");
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0015");
			msg.setH01TIMSYS(getTimeStamp());
			
			mp.sendMessage(msg);

			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
			session.setAttribute("userpPO", userPO);
			session.setAttribute("ESD036501List", list);
			forward("ESD0365_planes_fomento_list.jsp", req, res);
	
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
			mp = getMessageProcessor("ESD0365", req);
			ESD036501Message msg = (ESD036501Message) session.getAttribute("RecData");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD0365");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0005");
			msg.setE01PFMCOD(req.getParameter("E01PFMCOD").trim());
			
			setMessageRecord(req, msg);
			
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (ESD036501Message) mp.receiveMessageRecord("ESD036501");

			
			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("RecData",	msg);
				forward("ESD0365_plan_fomento_detalles.jsp", req, res);
			} else {
				procActionDataList(user, req, res, session);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}



	
}	




