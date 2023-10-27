package datapro.eibs.params;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDL054001Message;
import datapro.eibs.beans.EDL054002Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEDL0540 extends JSEIBSServlet {
	
	static final int R_ENTER = 1000; 
	static final int R_LIST = 10;
	static final int R_NEW = 1;
	static final int R_MAINT = 2;
	static final int R_DELETE = 3;
	static final int A_MAINT = 200;
	
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen){
			case R_ENTER:
				procEnterTable(user, req, res, session);
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

	private void procEnterTable(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(session);
		userPO.setHeader3("0");
		session.setAttribute("userPO", userPO);
		
		forward("EDL0540_ln_enter_sel_tables.jsp", req, res);
		
	}

	private void procReqList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0540", req);
			EDL054001Message msgList = (EDL054001Message) mp.getMessageRecord("EDL054001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0540");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0015");
			
			if (req.getParameter("E01DLVBNK")== null){
				msgList.setE01DLVBNK(userPO.getHeader1());
			}else{
				msgList.setE01DLVBNK(req.getParameter("E01DLVBNK"));
				userPO.setHeader1(req.getParameter("E01DLVBNK"));
			}
			if (req.getParameter("E01DLVTYP")== null){
				msgList.setE01DLVTYP(userPO.getHeader2());
			}else{
				msgList.setE01DLVTYP(req.getParameter("E01DLVTYP"));
				userPO.setHeader2(req.getParameter("E01DLVTYP"));
			}
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();

			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("EDL0540_ln_enter_sel_tables.jsp", req, res);
			} else {
				JBObjList list = mp.receiveMessageRecordList("E01CDROPE");

				session.setAttribute("userPO", userPO);
				session.setAttribute("EDL0540Help", list);
				forward("EDL0540_ln_sel_tables.jsp", req, res);
			}
		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	private void procReqNew(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0540", req);
			EDL054002Message msgList = (EDL054002Message) mp.getMessageRecord("EDL054002");
			msgList.setH02USERID(user.getH01USR());
			msgList.setH02PROGRM("EDL0540");
			msgList.setH02TIMSYS(getTimeStamp());
			msgList.setH02OPECOD("01");
			msgList.setH02OPECOD("0001");
			
			msgList.setE02DLVBNK(userPO.getHeader1());
			msgList.setE02DLVTYP(req.getParameter("E01DLVTYP"));
			msgList.setE02DLVTLN(req.getParameter("E01DLVTBL"));
			
			mp.sendMessage(msgList);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL054002Message) mp.receiveMessageRecord("EDL054002");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDL0540_ln_sel_tables.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("lnParam", msgList);
				forward("EDL0540_ln_table_maint.jsp", req, res);
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
			mp = getMessageProcessor("EDL0540", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EDL0540Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EDL054001Message listMessage = (EDL054001Message)list.get(index);
			
			EDL054002Message msgList = (EDL054002Message) mp.getMessageRecord("EDL054002");
			msgList.setH02USERID(user.getH01USR());
			msgList.setH02PROGRM("EDL0540");
			msgList.setH02TIMSYS(getTimeStamp());
			msgList.setH02OPECOD("01");
			msgList.setH02OPECOD("0002");
			
			msgList.setE02DLVBNK(userPO.getHeader1());
			msgList.setE02DLVTYP(listMessage.getE01DLVTYP());
			msgList.setE02DLVTLN(listMessage.getE01DLVTBL());
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL054002Message) mp.receiveMessageRecord("EDL054002");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward(devPage, req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("lnParam", msgList);
				forward("EDL0540_ln_table_maint.jsp", req, res);
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
			mp = getMessageProcessor("EDL0540", req);
			EDL054002Message msgList = (EDL054002Message) mp.getMessageRecord("EDL054002");
			msgList.setH02USERID(user.getH01USR());
			msgList.setH02PROGRM("EDL0540");
			msgList.setH02TIMSYS(getTimeStamp());
			msgList.setH02OPECOD("01");
			msgList.setH02OPECOD("0005");
			
			setMessageRecord(req, msgList);
			
			msgList.setE02DLVBNK(userPO.getHeader1());
			msgList.setE02DLVTYP(req.getParameter("E02DLVTYP"));
			msgList.setE02DLVTLN(req.getParameter("E02DLVTLN"));
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL054002Message) mp.receiveMessageRecord("EDL054002");
			

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("lnParam", msgList);
				session.setAttribute("userPO",userPO);
				forward("EDL0540_ln_table_maint.jsp", req, res);
				
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
			mp = getMessageProcessor("EDL0540", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EDL0540Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EDL054001Message listMessage = (EDL054001Message)list.get(index);
			
			EDL054002Message msgList = (EDL054002Message) mp.getMessageRecord("EDL054002");
			msgList.setH02USERID(user.getH01USR());
			msgList.setH02PROGRM("EDL0540");
			msgList.setH02TIMSYS(getTimeStamp());
			msgList.setH02OPECOD("01");
			msgList.setH02OPECOD("0009");
			msgList.setH02FLGMAS( req.getParameter("H02FLGMAS") );
			msgList.setE02DLVBNK(listMessage.getE01DLVBNK());
			msgList.setE02DLVTYP(listMessage.getE01DLVTYP());
			msgList.setE02DLVTLN(listMessage.getE01DLVTBL());
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDL0540_ln_sel_tables.jsp", req, res);
			} else {
				procReqList(user, req, res, session);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
}
