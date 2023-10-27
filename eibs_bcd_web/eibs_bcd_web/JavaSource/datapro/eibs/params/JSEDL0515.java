package datapro.eibs.params;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDL051501Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEDL0515 extends JSEIBSServlet {
	
	static final int R_ENTER = 100; 
	static final int R_LIST = 200;
	static final int R_NEW = 201;
	static final int R_MAINT = 202;
	static final int R_DELETE = 203;
	static final int A_MAINT = 300;
	
	
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {

		switch (screen){
			case R_ENTER:
				procEnter(user, req, res, session);
				break;
			case R_LIST:
				procReqList(user, req, res, session);
				break;
			case R_NEW:
				procReqNew(user, req, res, session);
				break;
			case R_MAINT:
				procReqMaintenance(user, req, res, session);
				break;
			case A_MAINT:
				procActionMaintenance(user, req, res, session);
				break;
			case R_DELETE:
				procReqDelete(user, req, res, session);
				break;
			default:
				forward(devPage, req, res); 
				break;
		}
	}

	private void procEnter(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		forward("EDL0515_condiciones_enter.jsp", req, res);
		
	}

	private void procReqList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0515", req);
			EDL051501Message msgList = (EDL051501Message) mp.getMessageRecord("EDL051501");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0515");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0015");
			
			if (req.getParameter("E01CDLBNK")== null){
				msgList.setE01CDLBNK(userPO.getBank());
			}else{
				msgList.setE01CDLBNK(req.getParameter("E01CDLBNK"));
				userPO.setBank(req.getParameter("E01CDLBNK"));
			}
			
			mp.sendMessage(msgList);
			
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");

			session.setAttribute("userPO", userPO);
			session.setAttribute("msglist", list);

			forward("EDL0515_condiciones_list.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	private void procReqNew(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0515", req);
			EDL051501Message msgList = (EDL051501Message) mp.getMessageRecord("EDL051501");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0515");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0001");
			
			msgList.setE01CDLBNK(userPO.getBank());
			
			userPO.setPurpose("NEW");
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL051501Message) mp.receiveMessageRecord("EDL051501");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EDL0515_condiciones_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("Param", msgList);
				forward("EDL0515_condiciones_maint.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	private void procReqMaintenance(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0515", req);
			
			JBObjList list = (JBObjList)session.getAttribute("msglist");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EDL051501Message listMessage = (EDL051501Message)list.get(index);
			
			EDL051501Message msgList = (EDL051501Message) mp.getMessageRecord("EDL051501");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0515");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("01");
			msgList.setH01OPECOD("0002");
			
			msgList.setE01CDLBNK(userPO.getBank());
			msgList.setE01CDLDLC(listMessage.getE01CDLDLC());
			
			userPO.setPurpose("MAINT");
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL051501Message) mp.receiveMessageRecord("EDL051501");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				session.setAttribute("Param", msgList);
				forward("EDL0515_condiciones_list.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("Param", msgList);
				forward("EDL0515_condiciones_maint.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0515", req);
			EDL051501Message msgList = (EDL051501Message) mp.getMessageRecord("EDL051501");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0515");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("01");
			msgList.setH01OPECOD("0005");
			
			setMessageRecord(req, msgList);
			
			msgList.setE01CDLBNK(userPO.getBank());
			msgList.setE01CDLDLC(req.getParameter("E01CDLDLC"));
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL051501Message) mp.receiveMessageRecord("EDL051501");
			

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("lnParam", msgList);
				session.setAttribute("userPO",userPO);
				forward("EDL0515_condiciones_maint.jsp", req, res);
			} else {
				procReqList(user, req, res, session);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	private void procReqDelete(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws IOException, ServletException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0515", req);
			
			JBObjList list = (JBObjList)session.getAttribute("msglist");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EDL051501Message listMessage = (EDL051501Message)list.get(index);
			
			EDL051501Message msgList = (EDL051501Message) mp.getMessageRecord("EDL051501");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0515");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("01");
			msgList.setH01OPECOD("0009");
			msgList.setE01CDLBNK(listMessage.getE01CDLBNK());
			msgList.setE01CDLDLC(listMessage.getE01CDLDLC());
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDL0515_condiciones_list.jsp", req, res);
			} else {
				procReqList(user, req, res, session);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	

}
