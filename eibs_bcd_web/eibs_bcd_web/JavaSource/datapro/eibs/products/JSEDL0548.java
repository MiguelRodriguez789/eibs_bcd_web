package datapro.eibs.products;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDL054801Message;
import datapro.eibs.beans.EDL054802Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;

public class JSEDL0548 extends JSEIBSServlet {
	
	static final int R_ENTER         = 100; 
	static final int R_NEW           = 101; 
	static final int R_MAINT         = 102; 
	static final int A_MAINT         = 105; 
	static final int R_DELETE        = 109; 
	static final int R_LIST          = 115; 
	
	static final int R_DETAIL_ENTER  = 200;  
	static final int R_DETAIL_NEW    = 201;  
	static final int R_DETAIL_MAINT  = 202;  
	static final int A_DETAIL_MAINT  = 205;  
	static final int R_DETAIL_DELETE = 209;  
	static final int R_DETAIL_INQ    = 210;  
	static final int R_DETAIL_LIST   = 215;  

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
			case R_DETAIL_ENTER:
				procReqDetailEnter(user, req, res, session);
				break;
			case R_DETAIL_NEW:
				procReqDetailNew(user, req, res, session);
				break;
			case R_DETAIL_MAINT:
				procReqDetailMaintenance(user, req, res, session);
				break;
			case A_DETAIL_MAINT:
				procActDetailMaintenance(user, req, res, session);
				break;
			case R_DETAIL_DELETE:
				procReqDetailDelete(user, req, res, session);
				break;
			case R_DETAIL_INQ:
				procReqDetailInq(user, req, res, session);
				break;
			case R_DETAIL_LIST:
				procReqDetailList(user, req, res, session);
				break;
		
			default:
				forward(devPage, req, res); 
				break;
		}
	}

	private void procReqEnter(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(session);
		forward("EDL0548_ln_enter_sel_cust.jsp", req, res);
		
	}

	private void procReqNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0548", req);
			EDL054801Message msgList = (EDL054801Message) mp.getMessageRecord("EDL054801");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0548");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("01");
			msgList.setH01OPECOD("0001");
			
			msgList.setE01CTPCNV(userPO.getHeader1());
			msgList.setE01CTPTYP(req.getParameter("E01CTPTYP"));
			
			mp.sendMessage(msgList);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL054801Message) mp.receiveMessageRecord("EDL054801");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDL0548_ln_sel_cust.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("lnData", msgList);
				forward("EDL0548_ln_cust_maint.jsp", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}
		
	}
	
	private void procReqMaintenance(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0548", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EDL0548Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EDL054801Message listMessage = (EDL054801Message)list.get(index);			
			EDL054801Message msgList = (EDL054801Message) mp.getMessageRecord("EDL054801");
			populate(listMessage, msgList);
			
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0548");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("01");
			msgList.setH01OPECOD("0002");
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL054801Message) mp.receiveMessageRecord("EDL054801");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward(devPage, req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("lnData", msgList);
				forward("EDL0548_ln_cust_maint.jsp", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}
		
	}

	private void procActMaintenance(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0548", req);
			EDL054801Message msgList = (EDL054801Message) session.getAttribute("lnData");
		
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0548");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("01");
			msgList.setH01OPECOD("0005");
			
			setMessageRecord(req, msgList);
					
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL054801Message) mp.receiveMessageRecord("EDL054801");
			

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("lnData", msgList);
				session.setAttribute("userPO",userPO);
				forward("EDL0548_ln_cust_maint.jsp", req, res);
				
			} else {
				procReqList(user, req, res, session);
			}

		} finally {
			if (mp != null) mp.close();
		}
		
	}
	
	private void procReqDelete(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws IOException, ServletException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0548", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EDL0548Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EDL054801Message listMessage = (EDL054801Message)list.get(index);
			EDL054801Message msgList = (EDL054801Message) mp.getMessageRecord("EDL054801");
			populate(listMessage, msgList);
			
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0548");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("01");
			msgList.setH01OPECOD("0009");
			msgList.setH01FLGMAS( req.getParameter("H01FLGMAS") );
	
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDL0548_ln_sel_tables.jsp", req, res);
			} else {
				procReqList(user, req, res, session);
			}

		} finally {
			if (mp != null) mp.close();
		}
		
	}

	private void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0548", req);
			EDL054801Message msgList = (EDL054801Message) session.getAttribute("recData");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0548");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0015");
			setMessageRecord(req, msgList);
			userPO.setHeader1(req.getParameter("E01CTPCNV"));
								
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgList = (EDL054801Message) mp.receiveMessageRecord();
			session.setAttribute("recData", msgList);
			
			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("EDL0548_ln_enter_sel_cust.jsp", req, res);
			} else {
				JBObjList list = mp.receiveMessageRecordList("E01CTPOPE");

				session.setAttribute("userPO", userPO);
				session.setAttribute("EDL0548Help", list);
				forward("EDL0548_ln_sel_cust.jsp", req, res);
			}
		} finally {
			if (mp != null) mp.close();
		}
		
	}

	private void procReqDetailEnter(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(session);
		forward("EDL0548_ln_enter_sel_detail.jsp", req, res);
			
	}

	private void procReqDetailNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {
		
	}
	
	private void procReqDetailMaintenance(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("EDL0548", req);
			EDL054802Message msg = (EDL054802Message) mp.getMessageRecord("EDL054802");
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("EDL0548");
			msg.setH02TIMSYS(getTimeStamp());
			msg.setH02OPECOD("01");
			msg.setH02OPECOD("0002");
			
			msg.setE02CTLCUN(req.getParameter("E02CTLCUN"));
			msg.setE02CTLNUM(req.getParameter("E02CTLNUM"));
			msg.setE02CTLSEQ(req.getParameter("E02CTLSEQ"));
			
			mp.sendMessage(msg);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EDL054802Message) mp.receiveMessageRecord("EDL054802");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDL0548_ln_enter_sel_detail.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("recData", msg);
				forward("EDL0548_ln_detail_maint.jsp", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}
		
	}

	private void procActDetailMaintenance(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0548", req);
			EDL054802Message msg = (EDL054802Message) session.getAttribute("recData");
		
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("EDL0548");
			msg.setH02TIMSYS(getTimeStamp());
			msg.setH02OPECOD("01");
			msg.setH02OPECOD("0005");
			
			setMessageRecord(req, msg);
					
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EDL054802Message) mp.receiveMessageRecord("EDL054802");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("recData", msg);
				session.setAttribute("userPO",userPO);
				forward("EDL0548_ln_detail_maint.jsp", req, res);
			} else {
				//procReqDetailEnter(user, req, res, session);
				session.setAttribute("error", msgError);
				session.setAttribute("recData", msg);
				session.setAttribute("userPO",userPO);
				forward("EDL0548_ln_detail_maint.jsp", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}
		
	}
	
	private void procReqDetailDelete(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws IOException, ServletException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0548", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EDL0548Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EDL054802Message listMessage = (EDL054802Message)list.get(index);
			EDL054802Message msgList = (EDL054802Message) mp.getMessageRecord("EDL054803");
			populate(listMessage, msgList);
			
			msgList.setH02USERID(user.getH01USR());
			msgList.setH02PROGRM("EDL0548");
			msgList.setH02TIMSYS(getTimeStamp());
			msgList.setH02OPECOD("01");
			msgList.setH02OPECOD("0009");
			msgList.setH02FLGMAS( req.getParameter("H02FLGMAS") );
	
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDL0548_ln_sel_tables.jsp", req, res);
			} else {
				procReqDetailList(user, req, res, session);
			}

		} finally {
			if (mp != null) mp.close();
		}
		
	}

	private void procReqDetailInq(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
			throws ServletException, IOException {

		UserPos userPO = getUserPos(session);
		forward("EDL0548_ln_enter_sel_reserva.jsp", req, res);

	}

	private void procReqDetailList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0548", req);
			EDL054802Message msgList = (EDL054802Message) session.getAttribute("recLogs");
			msgList.setH02USERID(user.getH01USR());
			msgList.setH02PROGRM("EDL0548");
			msgList.setH02TIMSYS(getTimeStamp());
			msgList.setH02SCRCOD("01");
			msgList.setH02OPECOD("0015");
			setMessageRecord(req, msgList);
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();

			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("EDL0548_ln_enter_sel_reserva.jsp", req, res);
			} else {
				JBObjList list = mp.receiveMessageRecordList("E02CTLOPE");

				session.setAttribute("userPO", userPO);
				session.setAttribute("EDL0548Logs", list);
				forward("EDL0548_ln_list_reserva.jsp", req, res);
			}
		} finally {
			if (mp != null) mp.close();
		}
		
	}

}
