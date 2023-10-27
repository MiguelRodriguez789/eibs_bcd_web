package datapro.eibs.params;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDL054601Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEDL0546 extends JSEIBSServlet {
	
	static final int R_ENTER         = 1000; 
	static final int R_APROB         = 2000;
	static final int R_LIST          = 10;
	static final int R_NEW           = 1;
	static final int R_MAINT         = 2;
	static final int R_DELETE        = 3;
	static final int A_MAINT         = 200;
	static final int A_APROB         = 12;
	static final int A_APROB_DELETE  = 13;
	static final int R_APROB_INQUIRY = 24;
	
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
			case R_APROB_INQUIRY:
				procReqAprobInquiry(user, req, res, session);
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
		
		forward("EDL0546_ln_enter_sel_tables.jsp", req, res);
		
	}

	private void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("EDL0546", req);
			EDL054601Message msgList = (EDL054601Message) mp.getMessageRecord("EDL054601");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0546");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0015");
			
			if (req.getParameter("E01EXCTYP")== null){
				msgList.setE01EXCTYP(userPO.getType());
			}else{
				msgList.setE01EXCTYP(req.getParameter("E01EXCTYP"));
				userPO.setType(req.getParameter("E01EXCTYP"));
			}
						
			if (req.getParameter("E01EXCPRO")== null){
				msgList.setE01EXCPRO(userPO.getProdCode());
			}else{
				msgList.setE01EXCPRO(req.getParameter("E01EXCPRO"));
				userPO.setProdCode(req.getParameter("E01EXCPRO"));
			}  

			if (req.getParameter("E01EXCCUN")== null){
				msgList.setE01EXCCUN(userPO.getCusNum());
			}else{
				msgList.setE01EXCCUN(req.getParameter("E01EXCCUN"));
				userPO.setCusNum(req.getParameter("E01EXCCUN"));
			}  

			if (req.getParameter("E01EXCACC")== null){
				msgList.setE01EXCACC(userPO.getAccNum());
			}else{
				msgList.setE01EXCACC(req.getParameter("E01EXCACC"));
				userPO.setAccNum(req.getParameter("E01EXCACC"));
			}  

			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();

			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("EDL0546_ln_enter_sel_tables.jsp", req, res);
			} else {
				JBObjList list = mp.receiveMessageRecordList("E01EXCOPE");
				session.setAttribute("userPO", userPO);
				session.setAttribute("EDL0546Help", list);
				forward("EDL0546_ln_sel_tables.jsp", req, res);
			}
		} finally {
			if (mp != null) mp.close();
		}
		
	}
	
	private void procReqAprobList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0546", req);
			EDL054601Message msgList = (EDL054601Message) mp.getMessageRecord("EDL054601");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0546");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0025");
										
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();

			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("EDL0546_ln_enter_sel_tables.jsp", req, res);
			} else {
				JBObjList list = mp.receiveMessageRecordList("E01EXCOPE");

				session.setAttribute("userPO", userPO);
				session.setAttribute("EDL0546Help", list);
				forward("EDL0546_ln_aprob_tables.jsp", req, res);
			}
		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	private void procReqNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0546", req);
			EDL054601Message msgList = (EDL054601Message) mp.getMessageRecord("EDL054601");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0546");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("01");
			msgList.setH01OPECOD("0001");
			
			msgList.setE01EXCTYP(userPO.getType());
					
			if (req.getParameter("E01EXCPRO")== null){
				msgList.setE01EXCPRO(" ");
			}else{
				msgList.setE01EXCPRO(req.getParameter("E01EXCPRO"));
			}                
			if (req.getParameter("E01EXCCUN")== null){
				msgList.setE01EXCCUN("0");
			}else{
				msgList.setE01EXCCUN(req.getParameter("E01EXCCUN"));
			}  
			if (req.getParameter("E01EXCACC")== null){
				msgList.setE01EXCACC("0");
			}else{
				msgList.setE01EXCACC(req.getParameter("E01EXCACC"));
			}  
			if (req.getParameter("E01EXCPOR")== null){
				msgList.setE01EXCPOR("0");
			}else{
				msgList.setE01EXCPOR(req.getParameter("E01EXCPOR"));
			}  
			if (req.getParameter("E01EXCMAM")== null){
				msgList.setE01EXCMAM("0");
			}else{
				msgList.setE01EXCMAM(req.getParameter("E01EXCMAM"));
			} 
			if (req.getParameter("E01EXCMAD")== null){
				msgList.setE01EXCMAD("0");
			}else{
				msgList.setE01EXCMAD(req.getParameter("E01EXCMAD"));
			} 
			if (req.getParameter("E01EXCMAY")== null){
				msgList.setE01EXCMAY("0");
			}else{
				msgList.setE01EXCMAY(req.getParameter("E01EXCMAY"));
			} 
			
			mp.sendMessage(msgList);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL054601Message) mp.receiveMessageRecord("EDL054601");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDL0546_ln_sel_tables.jsp", req, res);
			} else {
				procReqList(user, req, res, session);
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
			mp = getMessageProcessor("EDL0540", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EDL0546Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EDL054601Message listMessage = (EDL054601Message)list.get(index);			
			EDL054601Message msgList = (EDL054601Message) mp.getMessageRecord("EDL054601");
			populate(listMessage, msgList);
			
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0546");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("01");
			msgList.setH01OPECOD("0002");
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL054601Message) mp.receiveMessageRecord("EDL054601");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward(devPage, req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("lnParam", msgList);
				forward("EDL0546_ln_table_maint.jsp", req, res);
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
			mp = getMessageProcessor("EDL0546", req);
			EDL054601Message msgList = (EDL054601Message) session.getAttribute("lnParam");
		
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0546");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("01");
			msgList.setH01OPECOD("0005");
			
			setMessageRecord(req, msgList);
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL054601Message) mp.receiveMessageRecord("EDL054601");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("lnParam", msgList);
				session.setAttribute("userPO",userPO);
				forward("EDL0546_ln_table_maint.jsp", req, res);
			} else {
				procReqList(user, req, res, session);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	private void procReqDelete(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws IOException, ServletException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0546", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EDL0546Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EDL054601Message listMessage = (EDL054601Message)list.get(index);
			EDL054601Message msgList = (EDL054601Message) mp.getMessageRecord("EDL054601");
			populate(listMessage, msgList);
			
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0546");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("01");
			msgList.setH01OPECOD("0009");
			msgList.setH01FLGMAS( req.getParameter("H01FLGMAS") );
	
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDL0546_ln_sel_tables.jsp", req, res);
			} else {
				procReqList(user, req, res, session);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqAprobMaintenance(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0546", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EDL0546Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EDL054601Message listMessage = (EDL054601Message)list.get(index);			
			EDL054601Message msgList = (EDL054601Message) mp.getMessageRecord("EDL054601");
			populate(listMessage, msgList);
			
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0546");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("01");
			msgList.setH01OPECOD("0012");
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL054601Message) mp.receiveMessageRecord("EDL054601");

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
			mp = getMessageProcessor("EDL0546", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EDL0546Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EDL054601Message listMessage = (EDL054601Message)list.get(index);
			EDL054601Message msgList = (EDL054601Message) mp.getMessageRecord("EDL054601");
			populate(listMessage, msgList);
			
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0546");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("01");
			msgList.setH01OPECOD("0019");
			msgList.setH01FLGMAS( req.getParameter("H01FLGMAS") );
	
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDL0546_ln_aprob_tables.jsp", req, res);
			} else {
				procReqAprobList(user, req, res, session);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqAprobInquiry(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws IOException, ServletException {
				
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0540", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EDL0546Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EDL054601Message listMessage = (EDL054601Message)list.get(index);			
			EDL054601Message msgList = (EDL054601Message) mp.getMessageRecord("EDL054601");
			populate(listMessage, msgList);
				
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0546");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("01");
			msgList.setH01OPECOD("0024");
				
			mp.sendMessage(msgList);
				
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL054601Message) mp.receiveMessageRecord("EDL054601");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward(devPage, req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("lnParam", msgList);
				forward("EDL0546_ln_table_maint.jsp?readOnly=true", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}
				
	}
	
}
