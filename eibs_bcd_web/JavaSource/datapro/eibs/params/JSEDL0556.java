package datapro.eibs.params;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDL054601Message;
import datapro.eibs.beans.EDL055601Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEDL0556 extends JSEIBSServlet {
	
	static final int R_LIST   = 10;
	static final int R_NEW    = 1;
	static final int R_MAINT  = 2;
	static final int R_DELETE = 3;
	static final int A_NEW    = 100;
	static final int A_MAINT  = 200;
		
		
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {

		switch (screen){
			
			case R_LIST:
				procReqList(user, req, res, session);
				break;
			case R_NEW:
				procReqNewUser(user, req, res, session);
				break;
			case A_NEW:
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

	
	private void procReqList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0556", req);
			EDL055601Message msgList = (EDL055601Message) mp.getMessageRecord("EDL055601");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0556");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0015");
					
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			JBObjList list = mp.receiveMessageRecordList("E01NUSOPE");
			
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("EDL0556Help", list);
			forward("EDL0556_ln_sel_user_list.jsp", req, res);
			
		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	private void procReqNewUser(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(session);
		session.setAttribute("userPO", userPO);
		
		forward("EDL0556_ln_user_new.jsp", req, res);
		
	}	
	private void procReqNew(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0556", req);
			EDL055601Message msgList = (EDL055601Message) session.getAttribute("lnParam");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0556");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("01");
			msgList.setH01OPECOD("0001");
			
			setMessageRecord(req, msgList);
			           
						
			mp.sendMessage(msgList);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL055601Message) mp.receiveMessageRecord("EDL055601");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDL0556_ln_user_new.jsp", req, res);
			} else {
				
				procReqList(user, req, res, session);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	private void procReqMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0556", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EDL0556Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EDL055601Message listMessage = (EDL055601Message)list.get(index);			
			EDL055601Message msgList = (EDL055601Message) mp.getMessageRecord("EDL055601");
			populate(listMessage, msgList);
			
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0556");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("01");
			msgList.setH01OPECOD("0002");
			
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL055601Message) mp.receiveMessageRecord("EDL055601");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward(devPage, req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("lnParam", msgList);
				forward("EDL0556_ln_user_maint.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0556", req);
			EDL055601Message msgList = (EDL055601Message) session.getAttribute("lnParam");
		
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0556");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("01");
			msgList.setH01OPECOD("0005");
			
			setMessageRecord(req, msgList);
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL055601Message) mp.receiveMessageRecord("EDL055601");
			

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("lnParam", msgList);
				session.setAttribute("userPO",userPO);
				forward("EDL0556_ln_user_maint.jsp", req, res);
				
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
			mp = getMessageProcessor("EDL0556", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EDL0556Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EDL055601Message listMessage = (EDL055601Message)list.get(index);
			EDL055601Message msgList = (EDL055601Message) mp.getMessageRecord("EDL055601");
			populate(listMessage, msgList);
			
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0556");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("01");
			msgList.setH01OPECOD("0009");
			msgList.setH01FLGMAS( req.getParameter("H01FLGMAS") );
	
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDL0556_ln_sel_user_list.jsp", req, res);
			} else {
				procReqList(user, req, res, session);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	

	

}
