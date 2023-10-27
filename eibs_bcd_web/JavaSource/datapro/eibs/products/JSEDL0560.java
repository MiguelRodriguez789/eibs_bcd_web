package datapro.eibs.products;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDL056001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;

public class JSEDL0560 extends JSEIBSServlet {
	
	static final int R_ENTER  = 100; 
	static final int R_NEW    = 101; 
	static final int R_MAINT  = 102; 
	static final int A_MAINT  = 105; 
	static final int R_DELETE = 109; 
	static final int R_LIST   = 115; 
	
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {

		switch (screen){
			case R_ENTER:
				procReqEnter(user, req, res, session);
				break;
			case R_NEW:
				procReqNew(user, req, res, session);
				break;
			case R_MAINT:
				procReqMaintenance(user, req, res, session);
				break;
			case A_MAINT:
				procActMaintenance(user, req, res, session);
				break;
			case R_DELETE:
				procReqDelete(user, req, res, session);
				break;
			case R_LIST:
				procReqList(user, req, res, session);
				break;
		
			default:
				forward(devPage, req, res); 
				break;
		}
	}

	private void procReqEnter(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(session);
		forward("EDL0560_ln_enter_admin.jsp", req, res);
		
	}

	private void procReqNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("EDL0560", req);
			EDL056001Message msgList = (EDL056001Message) mp.getMessageRecord("EDL056001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0560");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("0001");

			msgList.setE01DEAACC(req.getParameter("E01DEAACC") == null ? "0" : req.getParameter("E01DEAACC").trim());
			msgList.setE01DEAOPE(req.getParameter("E01DEAOPE") == null ? "1" : req.getParameter("E01DEAOPE").trim());
			msgList.setE01DEAOAM(req.getParameter("E01DEAOAM") == null ? "0" : req.getParameter("E01DEAOAM").trim());

			String page = "";
			
			// Abono a Fondo
			if (msgList.getE01DEAOPE().equals("1")) {
				page = "EDL0560_ln_payment_fund_admin.jsp";
			} 
			// Pago a Fondo
			if (msgList.getE01DEAOPE().equals("2")) {
				page = "EDL0560_ln_payment_admin.jsp";
			}

			mp.sendMessage(msgList);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL056001Message) mp.receiveMessageRecord("EDL056001");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDL0560_ln_enter_admin.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("lnData", msgList);
				forward(page, req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}

	}
	
	private void procReqMaintenance(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
//		UserPos userPO = getUserPos(session);
//		MessageProcessor mp = null;
//		try {
//			mp = getMessageProcessor("EDL0548", req);
//			
//			JBObjList list = (JBObjList)session.getAttribute("EDL0548Help");
//			int index = Integer.parseInt(req.getParameter("key").trim());
//			
//			EDL054801Message listMessage = (EDL054801Message)list.get(index);			
//			EDL054801Message msgList = (EDL054801Message) mp.getMessageRecord("EDL054801");
//			populate(listMessage, msgList);
//			
//			msgList.setH01USERID(user.getH01USR());
//			msgList.setH01PROGRM("EDL0548");
//			msgList.setH01TIMSYS(getTimeStamp());
//			msgList.setH01OPECOD("01");
//			msgList.setH01OPECOD("0002");
//			
//			mp.sendMessage(msgList);
//			
//			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
//			msgList = (EDL054801Message) mp.receiveMessageRecord("EDL054801");
//
//			if (mp.hasError(msgError)) {
//				session.setAttribute("error", msgError);
//				forward(devPage, req, res);
//			} else {
//				session.setAttribute("userPO", userPO);
//				session.setAttribute("lnData", msgList);
//				forward("EDL0548_ln_cust_maint.jsp", req, res);
//			}
//
//		} finally {
//			if (mp != null) mp.close();
//		}
		
	}

	private void procActMaintenance(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0560", req);
			EDL056001Message msgList = (EDL056001Message) session.getAttribute("lnData");
		
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0560");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("0005");
			
			setMessageRecord(req, msgList);
					
			String page = "";
			
			// Abono a Fondo
			if (msgList.getE01DEAOPE().equals("1")) {
				page = "EDL0560_ln_payment_fund_admin.jsp";
			}  
			// Pago a Fondo
			if (msgList.getE01DEAOPE().equals("2")) {
				page = "EDL0560_ln_payment_admin.jsp";
			}

			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL056001Message) mp.receiveMessageRecord("EDL056001");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("lnData", msgList);
				session.setAttribute("userPO",userPO);
				forward(page, req, res);
			} else {
				procReqEnter(user, req, res, session);
			}

		} finally {
			if (mp != null) mp.close();
		}
		
	}
	
	private void procReqDelete(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws IOException, ServletException {
		
//		MessageProcessor mp = null;
//		try {
//			mp = getMessageProcessor("EDL0548", req);
//			
//			JBObjList list = (JBObjList)session.getAttribute("EDL0548Help");
//			int index = Integer.parseInt(req.getParameter("key").trim());
//			
//			EDL054801Message listMessage = (EDL054801Message)list.get(index);
//			EDL054801Message msgList = (EDL054801Message) mp.getMessageRecord("EDL054801");
//			populate(listMessage, msgList);
//			
//			msgList.setH01USERID(user.getH01USR());
//			msgList.setH01PROGRM("EDL0548");
//			msgList.setH01TIMSYS(getTimeStamp());
//			msgList.setH01OPECOD("01");
//			msgList.setH01OPECOD("0009");
//			msgList.setH01FLGMAS( req.getParameter("H01FLGMAS") );
//	
//			
//			mp.sendMessage(msgList);
//			
//			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
//			
//			if (mp.hasError(msgError)) {
//				session.setAttribute("error", msgError);
//				forward("EDL0548_ln_sel_tables.jsp", req, res);
//			} else {
//				procReqList(user, req, res, session);
//			}
//
//		} finally {
//			if (mp != null) mp.close();
//		}
		
	}

	private void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
//		UserPos userPO = getUserPos(session);
//		MessageProcessor mp = null;
//		try {
//			mp = getMessageProcessor("EDL0548", req);
//			EDL054801Message msgList = (EDL054801Message) session.getAttribute("recData");
//			msgList.setH01USERID(user.getH01USR());
//			msgList.setH01PROGRM("EDL0548");
//			msgList.setH01TIMSYS(getTimeStamp());
//			msgList.setH01SCRCOD("01");
//			msgList.setH01OPECOD("0015");
//			setMessageRecord(req, msgList);
//			userPO.setHeader1(req.getParameter("E01CTPCNV"));
//								
//			mp.sendMessage(msgList);
//			
//			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
//			msgList = (EDL054801Message) mp.receiveMessageRecord();
//			session.setAttribute("recData", msgList);
//			
//			if (mp.hasError(msgError)) {
//				session.setAttribute("userPO", userPO);
//				session.setAttribute("error", msgError);
//				forward("EDL0548_ln_enter_sel_cust.jsp", req, res);
//			} else {
//				JBObjList list = mp.receiveMessageRecordList("E01CTPOPE");
//
//				session.setAttribute("userPO", userPO);
//				session.setAttribute("EDL0548Help", list);
//				forward("EDL0548_ln_sel_cust.jsp", req, res);
//			}
//		} finally {
//			if (mp != null) mp.close();
//		}
		
	}

}
