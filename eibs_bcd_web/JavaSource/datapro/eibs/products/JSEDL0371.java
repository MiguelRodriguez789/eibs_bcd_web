package datapro.eibs.products;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDL037101Message;
import datapro.eibs.beans.EDL037102Message;
import datapro.eibs.beans.EDL037103Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEDL0371 extends JSEIBSServlet {

	protected static final int R_DEDUCCINES_SEARCH = 1000;
	protected static final int R_DEDUCCIONES_LIST = 2000;
	protected static final int R_NEW_DEDUCCIONES = 2001;
	protected static final int R_MAINT_DEDUCCIONES = 2002;
	protected static final int R_DELETE_DEDUCCIONES = 2003;
	protected static final int A_MAINT_DEDUCCIONES = 2004;
	protected static final int A_CANCEL_DEDUCCIONES = 2005;
	protected static final int R_INQUIRY_LIST = 3000;
	protected static final int R_INQUIRY_MAINT = 4000;

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {
	
		switch (screen) {
			case R_DEDUCCINES_SEARCH :
				procReqDeduccionesSearch(user, req, res, session);
				break;
			case R_DEDUCCIONES_LIST :
				procReqDeduccionesList(user, req, res, session);
				break;
			case R_NEW_DEDUCCIONES :
				procReqNewDeducciones(user, req, res, session);
				break;
			case R_MAINT_DEDUCCIONES :
				procReqMaintenanceDeducciones(user, req, res, session);
				break;
			case R_DELETE_DEDUCCIONES :
				procReqDeleteDeducciones(user, req, res, session);
				break;
			case A_MAINT_DEDUCCIONES :
				procActionMaintenanceDeducciones(user, req, res, session);
				break;
			case A_CANCEL_DEDUCCIONES :
				procActionCancelDeducciones(user, req, res, session);
				break;
			case R_INQUIRY_LIST :
				procReqInquiryList(user, req, res, session);
				break;
			case R_INQUIRY_MAINT :
				procReqInquiryMaint(user, req, res, session);
				break;
			default:	
				forward(devPage, req, res);
				break;
		}
	}

	private void procReqDeduccionesSearch(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
	
		forward("EDL0371_deductions_search.jsp", req, res);
	}

	private void procReqDeduccionesList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0371", req);
			EDL037102Message msgList = (EDL037102Message) mp.getMessageRecord("EDL037102");
			msgList.setH02USERID(user.getH01USR());
			msgList.setH02PROGRM("EDL0371");
			msgList.setH02TIMSYS(getTimeStamp());
			msgList.setH02SCRCOD("01");
		 	if (req.getParameter("E02DEAACC")== null){
		 		msgList.setE02DEAACC(userPO.getAccNum());
		 	} else {
				msgList.setE02DEAACC(req.getParameter("E02DEAACC").trim());
				userPO.setAccNum(req.getParameter("E02DEAACC").trim());
		 	}

			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();

			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("EDL0371_deductions_search.jsp", req, res);
			} else {
				EDL037103Message msgHeader = (EDL037103Message) mp.receiveMessageRecord();
				JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");

				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("list", list);
				session.setAttribute("header", msgHeader);
				forward("EDL0371_deductions_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}

	}

	private void procReqNewDeducciones(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0371", req);
			EDL037101Message msgDed = (EDL037101Message) mp.getMessageRecord("EDL037101");
			msgDed.setH01USERID(user.getH01USR());
			msgDed.setH01PROGRM("EDL0371");
			msgDed.setH01TIMSYS(getTimeStamp());
			msgDed.setH01SCRCOD("01");
			msgDed.setH01OPECOD("0001");
			msgDed.setE01DEAACC(userPO.getAccNum());
			msgDed.setE01DLICDE(req.getParameter("E02DLICDE"));

			mp.sendMessage(msgDed);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgDed = (EDL037101Message) mp.receiveMessageRecord();

			if (!mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("deduct", msgDed);
				session.setAttribute("error", msgError);
				forward("EDL0371_deductions_maint.jsp?newOnly=true", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("EDL0371_deductions_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqMaintenanceDeducciones(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0371", req);
			
			JBObjList list = (JBObjList)session.getAttribute("list");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EDL037102Message listMessage = (EDL037102Message)list.get(index);
			
			EDL037101Message msgDed = (EDL037101Message) mp.getMessageRecord("EDL037101");
			msgDed.setH01USERID(user.getH01USR());
			msgDed.setH01PROGRM("EDL0371");
			msgDed.setH01TIMSYS(getTimeStamp());
			msgDed.setH01SCRCOD("01");
			msgDed.setH01OPECOD("0002");
			msgDed.setE01DLICDE(listMessage.getE02DLICDE());
			msgDed.setE01DEAACC(userPO.getAccNum());

			mp.sendMessage(msgDed);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgDed = (EDL037101Message) mp.receiveMessageRecord();
			
			if (!mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("deduct", msgDed);
				session.setAttribute("error", msgError);
				forward("EDL0371_deductions_maint.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("EDL0371_deductions_list.jsp", req, res);
			}
			
		} finally {
			if(mp !=null)
				mp.close();
		}
		
	}

	private void procReqDeleteDeducciones(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("EDL0371", req);
			
			JBObjList list = (JBObjList)session.getAttribute("list");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EDL037102Message listMessage = (EDL037102Message)list.get(index);
			
			EDL037101Message msgDed = (EDL037101Message) mp.getMessageRecord("EDL037101");
			msgDed.setH01USERID(user.getH01USR());
			msgDed.setH01TIMSYS(getTimeStamp());
		 	msgDed.setH01SCRCOD("01");
		 	msgDed.setH01OPECOD("0009");	
			msgDed.setE01DLICDE(listMessage.getE02DLICDE());
			msgDed.setE01DEAACC(userPO.getAccNum());
			
			mp.sendMessage(msgDed);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();

			if (!mp.hasError(msgError)) {
				procReqDeduccionesList(user, req, res, session);
			} else {
				session.setAttribute("error", msgError);
				forward("EDL0371_deductions_list.jsp", req, res);
			}
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActionMaintenanceDeducciones(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0371", req);
			EDL037101Message msgDed = (EDL037101Message) mp.getMessageRecord("EDL037101");
			msgDed.setH01USERID(user.getH01USR());
			msgDed.setH01PROGRM("EDL0371");
			msgDed.setH01TIMSYS(getTimeStamp());
			msgDed.setH01SCRCOD("01");
			msgDed.setH01OPECOD("0005");
			
		 	setMessageRecord(req,msgDed);
			
			mp.sendMessage(msgDed);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgDed = (EDL037101Message) mp.receiveMessageRecord();

			if (!mp.hasError(msgError)) {
				procReqDeduccionesList(user, req, res, session);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("deduct", msgDed);
				forward("EDL0371_deductions_maint.jsp", req, res);
			}
		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionCancelDeducciones(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		procReqDeduccionesList(user, req, res, session);
	
	}
	
	private void procReqInquiryList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0371", req);
			EDL037102Message msgList = (EDL037102Message) mp.getMessageRecord("EDL037102");
			msgList.setH02USERID(user.getH01USR());
			msgList.setH02PROGRM("EDL0371");
			msgList.setH02TIMSYS(getTimeStamp());
			msgList.setH02SCRCOD("01");
			
			if (req.getParameter("E01DEAACC")== null){
		 		msgList.setE02DEAACC(userPO.getAccNum());
		 	} else {
				msgList.setE02DEAACC(req.getParameter("E01DEAACC").trim());
				userPO.setAccNum(msgList.getE02DEAACC());
		 	}

			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();

			if (mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("EDL0140_approval_list.jsp", req, res);
			} else {
				EDL037103Message msgHeader = (EDL037103Message) mp.receiveMessageRecord();
				JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");

				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("list", list);
				session.setAttribute("header", msgHeader);
				forward("EDL0371_deductions_inquiry_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}

	}

	private void procReqInquiryMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0371", req);
			
			JBObjList list = (JBObjList)session.getAttribute("list");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EDL037102Message listMessage = (EDL037102Message)list.get(index);
			
			EDL037101Message msgDed = (EDL037101Message) mp.getMessageRecord("EDL037101");
			msgDed.setH01USERID(user.getH01USR());
			msgDed.setH01PROGRM("EDL0371");
			msgDed.setH01TIMSYS(getTimeStamp());
			msgDed.setH01SCRCOD("01");
			msgDed.setH01OPECOD("0002");
			msgDed.setE01DLICDE(listMessage.getE02DLICDE());
			msgDed.setE01DEAACC(userPO.getAccNum());
			msgDed.setH01FLGWK1("A");
			
			mp.sendMessage(msgDed);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgDed = (EDL037101Message) mp.receiveMessageRecord();
			
			if (!mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("deduct", msgDed);
				session.setAttribute("error", msgError);
				forward("EDL0371_deductions_inquiry_maint.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("EDL0371_deductions_inquiry_list.jsp", req, res);
			}
			
		} finally {
			if(mp !=null)
				mp.close();
		}
	}



}