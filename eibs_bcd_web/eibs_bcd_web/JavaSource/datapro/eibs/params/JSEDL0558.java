package datapro.eibs.params;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDL055801Message;
import datapro.eibs.beans.EDL055802Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEDL0558 extends JSEIBSServlet {
	
	static final int R_LIST    = 100; 
	static final int A_LIST    = 101;
	static final int R_NEW     = 102;
	static final int R_MAINT   = 103;
	static final int R_DELETE  = 104;
	static final int A_MAINT   = 105;
		
	static final int R_HISTORY = 200; 
	static final int A_HISTORY = 201;

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {

		switch (screen){
			case R_LIST:
				procReqList(user, req, res, session);
				break;
			case A_LIST:
				procActList(user, req, res, session);
				break;
			case R_NEW:
				procReqNew(user, req, res, session);
				break;
			case R_MAINT:
				procReqMaint(user, req, res, session);
				break;
			case A_MAINT:
				procActMaint(user, req, res, session);
				break;
			case R_DELETE:
				procReqDelete(user, req, res, session);
				break;
			case R_HISTORY:
				procReqHistory(user, req, res, session);
				break;
			case A_HISTORY:
				procActHistory(user, req, res, session);
				break;
			default:
				forward(devPage, req, res); 
				break;
		}
	}

	private void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		procActList(user, req, res, session);
		
	}

	private void procActList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		
		try {
			
			mp = getMessageProcessor("EDL0558", req);
			EDL055801Message msgList = (EDL055801Message) mp.getMessageRecord("EDL055801");
			
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0558");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0015");
			setMessageRecord(req, msgList);
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();

			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("EDL0558_ln_sel_tables.jsp", req, res);
			} else {
				JBObjList list = mp.receiveMessageRecordList("E01MNPOPE");
				userPO.setHeader1(msgList.getE01MNPCON());
				userPO.setHeader2(msgList.getE01MNPBRN());
				session.setAttribute("userPO", userPO);
				session.setAttribute("EDL0558Help", list);
				forward("EDL0558_ln_sel_tables.jsp", req, res);
			}
		} finally {
			if (mp != null) mp.close();
		}
		
	}
	
	private void procReqNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		
		try {
			
			mp = getMessageProcessor("EDL0558", req);
			EDL055801Message msgList = (EDL055801Message) mp.getMessageRecord("EDL055801");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0558");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("01");
			msgList.setH01OPECOD("0001");
			setMessageRecord(req, msgList);
			
			mp.sendMessage(msgList);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL055801Message) mp.receiveMessageRecord("EDL055801");

			if (mp.hasError(msgError)) {
				session.setAttribute("lnParam", msgList); 
				session.setAttribute("error", msgError);
				forward("EDL0558_ln_sel_tables.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("lnParam", msgList);
				forward("EDL0558_ln_table_maint.jsp", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}
		
	}
	
	private void procReqMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;

		try {
			
			mp = getMessageProcessor("EDL0558", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EDL0558Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EDL055801Message listMessage = (EDL055801Message)list.get(index);			
			EDL055801Message msgList = (EDL055801Message) mp.getMessageRecord("EDL055801");
			populate(listMessage, msgList);
			
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0558");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("01");
			msgList.setH01OPECOD("0002");
				
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL055801Message) mp.receiveMessageRecord("EDL055801");

			userPO.setPurpose("MAINTENANCE");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward(devPage, req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("lnParam", msgList);
				forward("EDL0558_ln_table_maint.jsp", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}
		
	}

	private void procActMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		
		try {
			
			mp = getMessageProcessor("EDL0558", req);
			EDL055801Message msgList = (EDL055801Message) session.getAttribute("lnParam");
		
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0558");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("01");
			msgList.setH01OPECOD("0005");
			
			setMessageRecord(req, msgList);
						
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL055801Message) mp.receiveMessageRecord("EDL055801");
			
			session.setAttribute("lnParam", msgList);
			session.setAttribute("userPO",userPO);
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDL0558_ln_table_maint.jsp", req, res);
			} else {
				session.removeAttribute("EDL0558Help");
				res.sendRedirect(srctx + "/servlet/datapro.eibs.params.JSEDL0558?SCREEN=100&E01MNPCON=" + msgList.getE01MNPCON().trim() + "&E01MNPBRN=" + msgList.getE01MNPBRN().trim());
			}

		} finally {
			if (mp != null) mp.close();
		}
		
	}
	
	private void procReqDelete(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws IOException, ServletException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;

		try {
		
			mp = getMessageProcessor("EDL0558", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EDL0558Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EDL055801Message listMessage = (EDL055801Message)list.get(index);
			EDL055801Message msgList = (EDL055801Message) mp.getMessageRecord("EDL055801");
			populate(listMessage, msgList);
			
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0558");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("01");
			msgList.setH01OPECOD("0009");
			msgList.setH01FLGMAS( req.getParameter("H01FLGMAS") );
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgList = (EDL055801Message) mp.receiveMessageRecord("EDL055801");
			
			session.setAttribute("lnParam", msgList);
			session.setAttribute("userPO",userPO);
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDL0558_ln_sel_tables.jsp", req, res);
			} else {
				session.removeAttribute("EDL0558Help");
				res.sendRedirect(srctx + "/servlet/datapro.eibs.params.JSEDL0558?SCREEN=100&E01MNPCON=" + userPO.getHeader1().trim() + "&E01MNPBRN=" + userPO.getHeader2().trim());
			}

		} finally {
			if (mp != null) mp.close();
		}
		
	}

	private void procReqHistory(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;

		mp = getMessageProcessor("EDL0558", req);
		EDL055802Message msg = (EDL055802Message) mp.getMessageRecord("EDL055802");		
		
		msg.setE02DEAACC(userPO.getAccNum());   //Set to be able to use custom Tag
		msg.setE02DEACUN(userPO.getCusNum());
		msg.setE02CUSNA1(userPO.getCusName());
		msg.setE02DEAPRO(userPO.getProdCode());
		msg.setE02DEACCY(userPO.getCurrency());
		msg.setE02DEATYP(userPO.getType());
		
		session.setAttribute("userPO", userPO);
		session.setAttribute("headInfo", msg);
		forward("EDL0558_ln_monitor_enter.jsp", req, res);
			
	}

	private void procActHistory(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
			
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;

		try {

			mp = getMessageProcessor("EDL0558", req);
			EDL055802Message msgList = (EDL055802Message) mp.getMessageRecord("EDL055802");		
			msgList.setH02USERID(user.getH01USR());
			msgList.setH02PROGRM("EDL0558");
			msgList.setH02TIMSYS(getTimeStamp());
			msgList.setH02OPECOD("");
			msgList.setE02MNHACC(req.getParameter("E02DEAACC"));
			
			try {                                                   //Get Dates From Page
				msgList.setE02FMDTMM(req.getParameter("E02FMDTMM"));
				msgList.setE02FMDTDD(req.getParameter("E02FMDTDD"));
				msgList.setE02FMDTYY(req.getParameter("E02FMDTYY"));
			} catch (Exception e) {
				msgList.setE02FMDTMM("0");
				msgList.setE02FMDTDD("0");
				msgList.setE02FMDTYY("0");
			}
			
			try {
				msgList.setE02TODTMM(req.getParameter("E02TODTMM"));
				msgList.setE02TODTDD(req.getParameter("E02TODTDD"));
				msgList.setE02TODTYY(req.getParameter("E02TODTYY"));
			} catch (Exception e) {
				msgList.setE02TODTMM("0");
				msgList.setE02TODTDD("0");
				msgList.setE02TODTYY("0");
			}
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			
			if (mp.hasError(msgError)) {
			
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EDL0558_ln_monitor_enter.jsp", req, res);
				
			} else {
			
				JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");
				EDL055802Message headInfo = (EDL055802Message) mp.getMessageRecord("EDL055802");
				
				headInfo.setE02DEAACC(userPO.getAccNum()); 		//Set to be able to use custom Tag
				headInfo.setE02DEACUN(userPO.getCusNum());
				headInfo.setE02CUSNA1(userPO.getCusName());
				headInfo.setE02DEAPRO(userPO.getProdCode());
				headInfo.setE02DEACCY(userPO.getCurrency());
				headInfo.setE02DEATYP(userPO.getType());
				
				session.setAttribute("userPO", userPO);
				session.setAttribute("headInfo", headInfo);
				session.setAttribute("EDL055802List", list);
				forward("EDL0558_ln_monitor_list.jsp", req, res);
				
			}
			
		} finally {
			if (mp != null)	mp.close();
		}
			
	}

}
