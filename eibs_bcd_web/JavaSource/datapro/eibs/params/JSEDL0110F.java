package datapro.eibs.params;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDL011001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEDL0110F extends JSEIBSServlet {

	static final int R_LIST = 1;
	static final int R_NEW = 10;
	static final int R_MAINT = 20;
	static final int R_DELETE = 30;
	static final int A_MAINT = 200;

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			
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
				procActionMaintenance(user, req, res, session, screen);
				break;
			case R_DELETE:
				procReqDelete(user, req, res, session);
				break;
			default:
				forward(devPage, req, res); 
				break;
		}
	}

	private void procReqList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0110", req);
			EDL011001Message msgList = (EDL011001Message) mp.getMessageRecord("EDL011001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0110");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0015");
		
			mp.sendMessage(msgList);
			
			JBObjList list = mp.receiveMessageRecordList("E01PRPOPE");

			session.setAttribute("userPO", userPO);
			session.setAttribute("EDL0110FHelp", list);

			forward("EDL0110F_rt_sel_tables.jsp", req, res);

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
			mp = getMessageProcessor("EDL0110", req);
			EDL011001Message msgList = (EDL011001Message) mp.getMessageRecord("EDL011001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0110");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0001");
			
			userPO.setPurpose("NEW");
			
			session.setAttribute("userPO", userPO);
			session.setAttribute("rates", msgList);
			forward("EDL0110F_rt_tables.jsp", req, res);
			
				
		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	private void procReqMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0110", req);
			
			userPO.setPurpose("MAINTENANCE");

			JBObjList list = (JBObjList)session.getAttribute("EDL0110FHelp");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EDL011001Message listMessage = (EDL011001Message)list.get(index);

			session.setAttribute("userPO", userPO);
			session.setAttribute("rates", listMessage);
			
			forward("EDL0110F_rt_tables_maint.jsp", req, res);
			
		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	private void procActionMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0110", req);
			EDL011001Message msgList = (EDL011001Message) mp.getMessageRecord("EDL011001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0110");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			if (userPO.getPurpose().equals("NEW")) {
				msgList.setH01OPECOD("0001");
			} else {
				msgList.setH01OPECOD("0005");
			}
			
			setMessageRecord(req, msgList);

			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL011001Message) mp.receiveMessageRecord("EDL011001");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				session.setAttribute("rates", msgList);
				
				if (userPO.getPurpose().equals("NEW")) {
					forward("EDL0110F_rt_tables.jsp", req, res);
				} else {
					forward("EDL0110F_rt_tables_maint.jsp", req, res);
				}
				
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
		throws ServletException, IOException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0110", req);
			JBObjList list = (JBObjList)session.getAttribute("EDL0110FHelp");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EDL011001Message listMessage = (EDL011001Message)list.get(index);

			EDL011001Message msgList = (EDL011001Message) mp.getMessageRecord("EDL011001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0110");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0009");
			msgList.setE01PRRTBL(listMessage.getE01PRRTBL());
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDL0110F_rt_sel_tables.jsp", req, res);
			} else {
				procReqList(user, req, res, session);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	

	

	

}
