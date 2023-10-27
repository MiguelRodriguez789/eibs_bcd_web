package datapro.eibs.params;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDL051001Message;
import datapro.eibs.beans.EDL051002Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEDL0510 extends JSEIBSServlet {
	
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

		UserPos userPO = getUserPos(req);
		userPO.setHeader3("0");
		session.setAttribute("userPO", userPO);
		
		forward("EDL0510_ln_enter_sel_tables.jsp", req, res);
		
		
	}

	private void procReqList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0510", req);
			EDL051001Message msgList = (EDL051001Message) mp.getMessageRecord("EDL051001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0510");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0015");
			
			if (req.getParameter("E01DLSBNK")== null){
				msgList.setE01DLSBNK(userPO.getHeader1());
			}else{
				msgList.setE01DLSBNK(req.getParameter("E01DLSBNK"));
				userPO.setHeader1(req.getParameter("E01DLSBNK"));
			}
			if (req.getParameter("E01DLSTYP")== null){
				msgList.setE01DLSTYP(userPO.getHeader2());
			}else{
				msgList.setE01DLSTYP(req.getParameter("E01DLSTYP"));
				userPO.setHeader2(req.getParameter("E01DLSTYP"));
			}
//			if (req.getParameter("E01DLSCUN")== null){
//				msgList.setE01DLSCUN(userPO.getHeader3());
//			}else{
//				msgList.setE01DLSCUN(req.getParameter("E01DLSCUN"));
//				userPO.setHeader3(req.getParameter("E01DLSCUN"));
//			}
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();

			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("EDL0510_ln_enter_sel_tables.jsp", req, res);
			} else {
				JBObjList list = mp.receiveMessageRecordList("E01CDROPE");

				session.setAttribute("userPO", userPO);
				session.setAttribute("EDL0510Help", list);
				forward("EDL0510_ln_sel_tables.jsp", req, res);
			}
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
			mp = getMessageProcessor("EDL0510", req);
			EDL051002Message msgList = (EDL051002Message) mp.getMessageRecord("EDL051002");
			msgList.setH02USERID(user.getH01USR());
			msgList.setH02PROGRM("EDL0510");
			msgList.setH02TIMSYS(getTimeStamp());
			msgList.setH02OPECOD("01");
			msgList.setH02OPECOD("0001");
			
			msgList.setE02DLSBNK(userPO.getHeader1());
			msgList.setE02DLSTYP(userPO.getHeader2());
			//msgList.setE02DLSCUN(userPO.getHeader3());
			msgList.setE02DLSTLN(req.getParameter("E01DLSTLN"));
			
			mp.sendMessage(msgList);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL051002Message) mp.receiveMessageRecord("EDL051002");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDL0510_ln_sel_tables.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("lnParam", msgList);
				if (msgList.getE02DLSCUN().equals("0")){
					forward("EDL0510_ln_table_maint.jsp", req, res);
				} else {
					forward("EDL0510_ln_table_customer_maint.jsp", req, res);
				}
			}

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
			mp = getMessageProcessor("EDL0510", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EDL0510Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EDL051001Message listMessage = (EDL051001Message)list.get(index);
			
			EDL051002Message msgList = (EDL051002Message) mp.getMessageRecord("EDL051002");
			msgList.setH02USERID(user.getH01USR());
			msgList.setH02PROGRM("EDL0510");
			msgList.setH02TIMSYS(getTimeStamp());
			msgList.setH02OPECOD("01");
			msgList.setH02OPECOD("0002");
			
			msgList.setE02DLSBNK(userPO.getHeader1());
			msgList.setE02DLSTYP(userPO.getHeader2());
		//	msgList.setE02DLSCUN(userPO.getHeader3());
			msgList.setE02DLSTLN(listMessage.getE01DLSTLN());
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL051002Message) mp.receiveMessageRecord("EDL051002");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward(devPage, req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("lnParam", msgList);
				if (msgList.getE02DLSCUN().equals("0")){
					forward("EDL0510_ln_table_maint.jsp", req, res);
				} else {
					forward("EDL0510_ln_table_customer_maint.jsp", req, res);
				}
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
			mp = getMessageProcessor("EDL0510", req);
			EDL051002Message msgList = (EDL051002Message) mp.getMessageRecord("EDL051002");
			msgList.setH02USERID(user.getH01USR());
			msgList.setH02PROGRM("EDL0510");
			msgList.setH02TIMSYS(getTimeStamp());
			msgList.setH02OPECOD("01");
			msgList.setH02OPECOD("0005");
			
			setMessageRecord(req, msgList);
			
			msgList.setE02DLSBNK(userPO.getHeader1());
			msgList.setE02DLSTYP(userPO.getHeader2());
		//	msgList.setE02DLSCUN(userPO.getHeader3());
			msgList.setE02DLSTLN(req.getParameter("E02DLSTLN"));
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL051002Message) mp.receiveMessageRecord("EDL051002");
			

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("lnParam", msgList);
				session.setAttribute("userPO",userPO);
				if (msgList.getE02DLSCUN().equals("0")){
					forward("EDL0510_ln_table_maint.jsp", req, res);
				} else {
					forward("EDL0510_ln_table_customer_maint.jsp", req, res);
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
		throws IOException, ServletException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0510", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EDL0510Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EDL051001Message listMessage = (EDL051001Message)list.get(index);
			
			EDL051002Message msgList = (EDL051002Message) mp.getMessageRecord("EDL051002");
			msgList.setH02USERID(user.getH01USR());
			msgList.setH02PROGRM("EDL0510");
			msgList.setH02TIMSYS(getTimeStamp());
			msgList.setH02OPECOD("01");
			msgList.setH02OPECOD("0009");
			msgList.setH02FLGMAS( req.getParameter("H02FLGMAS") );
			msgList.setE02DLSBNK(listMessage.getE01DLSBNK());
			msgList.setE02DLSTLN(listMessage.getE01DLSTLN());
			msgList.setE02DLSTYP(listMessage.getE01DLSTYP());
		//	msgList.setE02DLSCUN(listMessage.getE01DLSCUN());
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDL0510_ln_sel_tables.jsp", req, res);
			} else {
				procReqList(user, req, res, session);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	

}
