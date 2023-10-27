package datapro.eibs.params;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDL055701Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEDL0557 extends JSEIBSServlet {
	
	static final int R_ENTER  = 1000; 
	static final int R_APROB  = 2000;
	static final int R_LIST   = 10;
	static final int R_NEW    = 1;
	static final int R_MAINT  = 2;
	static final int R_DELETE = 3;
	static final int A_MAINT  = 200;
	static final int A_APROB  = 12;
	static final int A_APROB_DELETE = 13;
	
		
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {

		switch (screen){
			case R_ENTER:
				procEnterTable(user, req, res, session);
				break;
			case R_LIST:
				procReqList(user, req, res, session);
				break;
			case R_APROB:
				procReqAprobList(user, req, res, session);
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
			case A_APROB:
				procReqAprobMaintenance(user, req, res, session);
				break;
			case A_APROB_DELETE:
				procReqAprobDelete(user, req, res, session);
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
		
		forward("EDL0557_ln_enter_sel_tables.jsp", req, res);
		
	}

	private void procReqList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0557", req);
			EDL055701Message msgList = (EDL055701Message) mp.getMessageRecord("EDL055701");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0557");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0015");
			
			if (req.getParameter("E01EXITYP")== null){
				msgList.setE01EXITYP(userPO.getHeader1());
			}else{
				msgList.setE01EXITYP(req.getParameter("E01EXITYP"));
				userPO.setHeader1(req.getParameter("E01EXITYP"));
			}
						
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();

			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("EDL0557_ln_enter_sel_tables.jsp", req, res);
			} else {
				JBObjList list = mp.receiveMessageRecordList("E01EXIOPE");

				session.setAttribute("userPO", userPO);
				session.setAttribute("EDL0557Help", list);
				forward("EDL0557_ln_sel_tables.jsp", req, res);
			}
		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	private void procReqAprobList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0557", req);
			EDL055701Message msgList = (EDL055701Message) mp.getMessageRecord("EDL055701");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0557");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0025");
										
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();

			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("EDL0557_ln_enter_sel_tables.jsp", req, res);
			} else {
				JBObjList list = mp.receiveMessageRecordList("E01EXIOPE");

				session.setAttribute("userPO", userPO);
				session.setAttribute("EDL0557Help", list);
				forward("EDL0557_ln_aprob_tables.jsp", req, res);
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
			mp = getMessageProcessor("EDL0557", req);
			EDL055701Message msgList = (EDL055701Message) mp.getMessageRecord("EDL055701");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0557");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("01");
			msgList.setH01OPECOD("0001");
			
			msgList.setE01EXITYP(userPO.getHeader1());
					
			if (req.getParameter("E01EXIPRO")== null){
				msgList.setE01EXIPRO(" ");
			}else{
				msgList.setE01EXIPRO(req.getParameter("E01EXIPRO"));
			}                
			if (req.getParameter("E01EXICUN")== null){
				msgList.setE01EXICUN("0");
			}else{
				msgList.setE01EXICUN(req.getParameter("E01EXICUN"));
			}  
			if (req.getParameter("E01EXIACC")== null){
				msgList.setE01EXIACC("0");
			}else{
				msgList.setE01EXIACC(req.getParameter("E01EXIACC"));
			}  
			if (req.getParameter("E01EXIMIN")== null){
				msgList.setE01EXIMIN("0");
			}else{
				msgList.setE01EXIMIN(req.getParameter("E01EXIMIN"));
			}  
			if (req.getParameter("E01EXIMAX")== null){
				msgList.setE01EXIMAX("0");
			}else{
				msgList.setE01EXIMAX(req.getParameter("E01EXIMAX"));
			}  
			if (req.getParameter("E01EXITRC")== null){
				msgList.setE01EXITRC(" ");
			}else{
				msgList.setE01EXITRC(req.getParameter("E01EXITRC"));
			} 
			if (req.getParameter("E01EXITRM")== null){
				msgList.setE01EXITRM("0");
			}else{
				msgList.setE01EXITRM(req.getParameter("E01EXITRM"));
			} 
			if (req.getParameter("E01EXITRX")== null){
				msgList.setE01EXITRX("0");
			}else{
				msgList.setE01EXITRX(req.getParameter("E01EXITRX"));
			} 
			if (req.getParameter("E01EXIDMX")== null){
				msgList.setE01EXIDMX("0");
			}else{
				msgList.setE01EXIDMX(req.getParameter("E01EXIDMX"));
			} 
			
			
			
			
			
			
			mp.sendMessage(msgList);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL055701Message) mp.receiveMessageRecord("EDL055701");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDL0557_ln_sel_tables.jsp", req, res);
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
			mp = getMessageProcessor("EDL0540", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EDL0557Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EDL055701Message listMessage = (EDL055701Message)list.get(index);			
			EDL055701Message msgList = (EDL055701Message) mp.getMessageRecord("EDL055701");
			populate(listMessage, msgList);
			
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0557");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("01");
			msgList.setH01OPECOD("0002");
	
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL055701Message) mp.receiveMessageRecord("EDL055701");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward(devPage, req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("lnParam", msgList);
				forward("EDL0557_ln_table_maint.jsp", req, res);
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
			mp = getMessageProcessor("EDL0557", req);
			EDL055701Message msgList = (EDL055701Message) session.getAttribute("lnParam");
		
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0557");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("01");
			msgList.setH01OPECOD("0005");
			
			setMessageRecord(req, msgList);
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL055701Message) mp.receiveMessageRecord("EDL055701");
			

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("lnParam", msgList);
				session.setAttribute("userPO",userPO);
				forward("EDL0557_ln_table_maint.jsp", req, res);
				
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
			mp = getMessageProcessor("EDL0557", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EDL0557Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EDL055701Message listMessage = (EDL055701Message)list.get(index);
			EDL055701Message msgList = (EDL055701Message) mp.getMessageRecord("EDL055701");
			populate(listMessage, msgList);
			
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0557");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("01");
			msgList.setH01OPECOD("0009");
			msgList.setH01FLGMAS( req.getParameter("H01FLGMAS") );
	
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDL0557_ln_sel_tables.jsp", req, res);
			} else {
				procReqList(user, req, res, session);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqAprobMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0557", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EDL0557Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EDL055701Message listMessage = (EDL055701Message)list.get(index);			
			EDL055701Message msgList = (EDL055701Message) mp.getMessageRecord("EDL055701");
			populate(listMessage, msgList);
			
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0557");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("01");
			msgList.setH01OPECOD("0012");
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL055701Message) mp.receiveMessageRecord("EDL055701");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward(devPage, req, res);
			} else {
				procReqAprobList(user, req, res, session);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}	
	
	private void procReqAprobDelete(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws IOException, ServletException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0557", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EDL0557Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EDL055701Message listMessage = (EDL055701Message)list.get(index);
			EDL055701Message msgList = (EDL055701Message) mp.getMessageRecord("EDL055701");
			populate(listMessage, msgList);
			
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0557");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("01");
			msgList.setH01OPECOD("0019");
			msgList.setH01FLGMAS( req.getParameter("H01FLGMAS") );
	
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDL0557_ln_aprob_tables.jsp", req, res);
			} else {
				procReqAprobList(user, req, res, session);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	

}
