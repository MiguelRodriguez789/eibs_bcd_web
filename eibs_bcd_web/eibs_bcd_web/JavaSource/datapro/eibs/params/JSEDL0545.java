package datapro.eibs.params;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDL054501Message;
import datapro.eibs.beans.EDL054502Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEDL0545 extends JSEIBSServlet {
	
	static final int R_ENTER  = 1000; 
	static final int R_LIST   = 10;
	static final int R_NEW    = 1;
	static final int R_MAINT  = 2;
	static final int R_DELETE = 3;
	static final int A_MAINT  = 200;
	
	static final int R_RECORD_LIST        = 1100;
	static final int A_RECORD_LIST        = 1101;  // procActionRecordList
	static final int R_RECORD_NEW         = 1200;  // procReqRecordNew
	static final int R_RECORD_MAINT       = 1201;
	static final int R_RECORD_DELETE      = 1202;  // procReqRecordDelete
	static final int A_RECORD_MAINT       = 1600;
	
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

			case A_RECORD_LIST:
				procActionRecordList(user, req, res, session);
				break;
			case R_RECORD_NEW:
				procReqRecordNew(user, req, res, session);
				break;
			case R_RECORD_DELETE:
				procReqRecordDelete(user, req, res, session);
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
		
		forward("EDL0545_ln_enter_sel_tables.jsp", req, res);
		
	}

	private void procReqList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0540", req);
			EDL054501Message msgList = (EDL054501Message) mp.getMessageRecord("EDL054501");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0545");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0015");
			
			if (req.getParameter("E01CSTBNK")== null){
				msgList.setE01CSTBNK(userPO.getHeader1());
			}else{
				msgList.setE01CSTBNK(req.getParameter("E01CSTBNK"));
				userPO.setHeader1(req.getParameter("E01CSTBNK"));
			}
						
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();

			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("EDL0545_ln_enter_sel_tables.jsp", req, res);
			} else {
				JBObjList list = mp.receiveMessageRecordList("E01CSTOPE");

				session.setAttribute("userPO", userPO);
				session.setAttribute("EDL0545Help", list);
				forward("EDL0545_ln_sel_tables.jsp", req, res);
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
			mp = getMessageProcessor("EDL0545", req);
			EDL054501Message msgList = (EDL054501Message) mp.getMessageRecord("EDL054501");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0545");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("01");
			msgList.setH01OPECOD("0001");
			
			msgList.setE01CSTBNK(userPO.getHeader1());
			msgList.setE01CSTRCD(req.getParameter("E01CSTRCD"));
			
			mp.sendMessage(msgList);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL054501Message) mp.receiveMessageRecord("EDL054501");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDL0545_ln_sel_tables.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("lnParam", msgList);
				forward("EDL0545_ln_table_maint.jsp", req, res);
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
			
			JBObjList list = (JBObjList)session.getAttribute("EDL0545Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EDL054501Message listMessage = (EDL054501Message)list.get(index);			
			EDL054501Message msgList = (EDL054501Message) mp.getMessageRecord("EDL054501");
			populate(listMessage, msgList);
			
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0545");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("01");
			msgList.setH01OPECOD("0002");
			
		//	msgList.setE02DLVBNK(userPO.getHeader1());
		//	msgList.setE02DLVTYP(listMessage.getE01DLVTYP());
		//	msgList.setE02DLVTLN(listMessage.getE01DLVTBL());
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL054501Message) mp.receiveMessageRecord("EDL054501");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward(devPage, req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("lnParam", msgList);
				forward("EDL0545_ln_table_maint.jsp", req, res);
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
			mp = getMessageProcessor("EDL0545", req);
			EDL054501Message msgList = (EDL054501Message) session.getAttribute("lnParam");
		
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0545");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("01");
			msgList.setH01OPECOD("0005");
			
			setMessageRecord(req, msgList);
			
		//	msgList.setE02DLVBNK(userPO.getHeader1());
		//	msgList.setE02DLVTYP(req.getParameter("E02DLVTYP"));
		//	msgList.setE02DLVTLN(req.getParameter("E02DLVTLN"));
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EDL054501Message) mp.receiveMessageRecord("EDL054501");
			

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("lnParam", msgList);
				session.setAttribute("userPO",userPO);
				forward("EDL0545_ln_table_maint.jsp", req, res);
				
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
			mp = getMessageProcessor("EDL0545", req);
			
			JBObjList list = (JBObjList)session.getAttribute("EDL0545Help");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EDL054501Message listMessage = (EDL054501Message)list.get(index);
			EDL054501Message msgList = (EDL054501Message) mp.getMessageRecord("EDL054501");
			populate(listMessage, msgList);
			
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0545");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01OPECOD("01");
			msgList.setH01OPECOD("0009");
			msgList.setH01FLGMAS( req.getParameter("H01FLGMAS") );
	
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDL0545_ln_sel_tables.jsp", req, res);
			} else {
				procReqList(user, req, res, session);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	protected void procActionRecordList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);

		try {
			
			mp = getMessageProcessor("EDL0545", req);
			EDL054502Message msg = (EDL054502Message) mp.getMessageRecord("EDL054502");
			msg.setH02USERID(user.getH01USR());
			msg.setH02OPECOD("0015");
			msg.setH02TIMSYS(getTimeStamp());
			
			try {
				msg.setE02CSTREG(req.getParameter("E02CSTREG").trim());
				userPO.setProdCode(req.getParameter("E02CSTREG").trim());
			} catch (Exception e) {
				msg.setE02CSTREG(userPO.getProdCode());
			}

			try {
				msg.setE02CSTTYP(req.getParameter("E02CSTTYP").trim());
				userPO.setType(req.getParameter("E02CSTTYP").trim());
			} catch (Exception e) {
				msg.setE02CSTTYP(userPO.getType());
			}
			
			String prodCode = msg.getE02CSTREG();
			String type = msg.getE02CSTTYP();

			mp.sendMessage(msg);

			JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");

			session.setAttribute("userpPO", userPO);
			req.setAttribute("ACT",req.getParameter("ACT") == null ? "S" : req.getParameter("ACT").trim());
			
			session.setAttribute("EDL054502List"+prodCode, list);
			forward("EDL0545_ln_detalle_list.jsp?prodCode="+prodCode+"&type="+type, req, res);

		} finally {
			if (mp != null) mp.close();
		}
	}

	protected void procReqRecordNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		MessageProcessor mp = null;

		try {
			mp = getMessageProcessor("EDL0545", req);
			
			EDL054502Message msg = (EDL054502Message) mp.getMessageRecord("EDL054502");
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("EDL0545");
			msg.setH02TIMSYS(getTimeStamp());
			msg.setH02SCRCOD("01");
			msg.setH02OPECOD("0005");
			
			msg.setE02CSTREG(req.getParameter("E02CSTREG") == null ? "" : req.getParameter("E02CSTREG").trim());
			msg.setE02CSTTYP(req.getParameter("E02CSTTYP") == null ? "" : req.getParameter("E02CSTTYP").trim());
			msg.setE02CSTRCD(req.getParameter("E02CSTRCD") == null ? "" : req.getParameter("E02CSTRCD").trim());

			mp.sendMessage(msg);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (!mp.hasError(msgError)) {
				procActionRecordList(user, req, res, session);
			} else {
				session.setAttribute("error", msgError);
				req.setAttribute("ACT","S");
				forward("EDL0545_ln_detalle_list.jsp", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}

	}

	protected void procReqRecordDelete(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		MessageProcessor mp = null;

		try {
			mp = getMessageProcessor("EDL0545", req);
			
			EDL054502Message msg = (EDL054502Message) mp.getMessageRecord("EDL054502");
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("EDL0545");
			msg.setH02TIMSYS(getTimeStamp());
			msg.setH02SCRCOD("01");
			msg.setH02OPECOD("0009");
			
			msg.setE02CSTREG(req.getParameter("E02CSTREG") == null ? "" : req.getParameter("E02CSTREG").trim());
			msg.setE02CSTTYP(req.getParameter("E02CSTTYP") == null ? "" : req.getParameter("E02CSTTYP").trim());
			msg.setE02CSTRCD(req.getParameter("E02CSTRCD") == null ? "" : req.getParameter("E02CSTRCD").trim());

			mp.sendMessage(msg);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (!mp.hasError(msgError)) {
				procActionRecordList(user, req, res, session);
			} else {
				session.setAttribute("error", msgError);
				req.setAttribute("ACT","S");
				forward("EDL0545_ln_detalle_list.jsp", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}

	}

}
