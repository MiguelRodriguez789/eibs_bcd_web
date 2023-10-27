package datapro.eibs.params;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDL054701Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEDL0547 extends JSEIBSServlet {
	
	static final int R_ENTER  = 1000; 
	static final int R_LIST   = 10;
	static final int R_NEW    = 1;
	static final int A_NEW    = 100;
	static final int R_MAINT  = 2;
	static final int R_DELETE = 3;
	static final int A_MAINT  = 200;
	static final int R_LIST_RATE = 300;	
	static final int A_RATES  = 400;
		
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {

		switch (screen){
			case R_ENTER:
				procEnterTable(user, req, res, session);
				break;
			case R_LIST:
				procReqList(user, req, res, session);
				break;
			case R_NEW:
				procEnterNew(user, req, res, session);
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
			case R_LIST_RATE:
				procReqListRate(user, req, res, session);
				break;
			case A_RATES:
				procActionRates(user, req, res, session);
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
		session.setAttribute("userPO", userPO);
		
		forward("EDL0547_ln_enter_sel_tables.jsp", req, res);
		
	}

	private void procReqList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0547", req);
			EDL054701Message msgList = (EDL054701Message) mp.getMessageRecord("EDL054701");
			
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0547");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0015");
			setMessageRecord(req, msgList);
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();

			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("EDL0547_ln_enter_sel_tables.jsp", req, res);
			} else {
				JBObjList list = mp.receiveMessageRecordList("E01CMLOPE");
				userPO.setHeader1(msgList.getE01CMLCON());
				userPO.setHeader2(msgList.getE01CMLBRN());
				session.setAttribute("userPO", userPO);
				session.setAttribute("EDL0547Help", list);
				forward("EDL0547_ln_sel_tables.jsp", req, res);
			}
		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	private void procReqListRate(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0547", req);
			EDL054701Message msgList = (EDL054701Message) mp.getMessageRecord("EDL054701");
			
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0547");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0006");
			setMessageRecord(req, msgList);
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgList = (EDL054701Message) mp.receiveMessageRecord("EDL054701");
			
			if (!mp.hasError(msgError)) {
			  	session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("lnParam", msgList); 
								
				forwardOnSuccess("EDL0547_milagroso_rates.jsp", req, res);
			} else {
				printClose(res.getWriter());
			}
				
			
		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	
	
	private void procEnterNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {
		
		UserPos userPO = (datapro.eibs.beans.UserPos) session.getAttribute("userPO");
		userPO.setPurpose("NEW");
		
		MessageProcessor mp = null;
		
		try {
		
			mp = getMessageProcessor("EDL0547", req);
			EDL054701Message msgList = (EDL054701Message) mp.getMessageRecord("EDL054701");
			
			msgList.setE01CMLCON(userPO.getHeader1());
			msgList.setE01CMLBRN(userPO.getHeader2());
			
			session.setAttribute("lnParam", msgList);
			session.setAttribute("userPO", userPO);
			
			forward("EDL0547_ln_table_new.jsp", req, res);
	
		} finally {
			if (mp != null) mp.close();
		}
		
	}
	
	private void procReqNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0547", req);
			EDL054701Message msgList = (EDL054701Message) mp.getMessageRecord("EDL054701");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0547");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("01");
			msgList.setH01OPECOD("0001");
			setMessageRecord(req, msgList);
			
			mp.sendMessage(msgList);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL054701Message) mp.receiveMessageRecord("EDL054701");

			if (mp.hasError(msgError)) {
				session.setAttribute("lnParam", msgList); 
				session.setAttribute("error", msgError);
				forward("EDL0547_ln_table_new.jsp", req, res);
			} else {
				
				session.removeAttribute("EDL0547Help");
				// if there are no errors go to maintenance page
				res.sendRedirect(srctx + "/servlet/datapro.eibs.params.JSEDL0547?SCREEN=10&E01CMLCON=" + msgList.getE01CMLCON().trim() + "&E01CMLBRN=" + msgList.getE01CMLBRN().trim());
				
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
			mp = getMessageProcessor("EDL0547", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EDL0547Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EDL054701Message listMessage = (EDL054701Message)list.get(index);			
			EDL054701Message msgList = (EDL054701Message) mp.getMessageRecord("EDL054701");
			populate(listMessage, msgList);
			
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0547");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("01");
			msgList.setH01OPECOD("0002");
				
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL054701Message) mp.receiveMessageRecord("EDL054701");

			userPO.setPurpose("MAINTENANCE");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward(devPage, req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("lnParam", msgList);
				forward("EDL0547_ln_table_maint.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionMaintenance(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("EDL0547", req);
			EDL054701Message msgList = (EDL054701Message) session.getAttribute("lnParam");
		
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0547");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("01");
			msgList.setH01OPECOD("0005");
			
			setMessageRecord(req, msgList);
						
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL054701Message) mp.receiveMessageRecord("EDL054701");
			
			session.setAttribute("lnParam", msgList);
			session.setAttribute("userPO",userPO);
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDL0547_ln_table_maint.jsp", req, res);
			} else {
			//	procReqList(user, req, res, session);
				session.removeAttribute("EDL0547Help");
				// if there are no errors go to maintenance page
				res.sendRedirect(srctx + "/servlet/datapro.eibs.params.JSEDL0547?SCREEN=10&E01CMLCON=" + msgList.getE01CMLCON().trim() + "&E01CMLBRN=" + msgList.getE01CMLBRN().trim());
				//procListSolicit(user, req, res, session);//reload list
			}

		} finally {
			if (mp != null) mp.close();
		}
		
	}
	
	private void procReqDelete(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws IOException, ServletException {
		
		UserPos userPO = getUserPos(session);
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0547", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EDL0547Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EDL054701Message listMessage = (EDL054701Message)list.get(index);
			EDL054701Message msgList = (EDL054701Message) mp.getMessageRecord("EDL054701");
			populate(listMessage, msgList);
			
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0547");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("01");
			msgList.setH01OPECOD("0009");
			msgList.setH01FLGMAS( req.getParameter("H01FLGMAS") );
	
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgList = (EDL054701Message) mp.receiveMessageRecord("EDL054701");
			
			session.setAttribute("lnParam", msgList);
			session.setAttribute("userPO",userPO);
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDL0547_ln_sel_tables.jsp", req, res);
			} else {
				session.removeAttribute("EDL0547Help");
				// if there are no errors go to maintenance page
				res.sendRedirect(srctx + "/servlet/datapro.eibs.params.JSEDL0547?SCREEN=10&E01CMLCON=" + userPO.getHeader1().trim() + "&E01CMLBRN=" + userPO.getHeader2().trim());
				//procListSolicit(user, req, res, session);//reload list
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionRates(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0547", req);
			EDL054701Message msgList = (EDL054701Message) session.getAttribute("lnParam");
		
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0547");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("01");
			msgList.setH01OPECOD("0007");
			
			msgList.setH01FLGWK1(req.getParameter("key") == null ? "1" : req.getParameter("key").trim());
			
			setMessageRecord(req, msgList);
						
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL054701Message) mp.receiveMessageRecord("EDL054701");
			
			session.setAttribute("lnParam", msgList);
			session.setAttribute("userPO",userPO);
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				
				forward("EDL0547_milagroso_rates.jsp", req, res);
				
			} else {
				printClose(res.getWriter());
			}
			
			
		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

}
