package datapro.eibs.products;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDL037201Message;
import datapro.eibs.beans.EDL037202Message;
import datapro.eibs.beans.EDL037203Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEDL0372 extends JSEIBSServlet {

	protected static final int R_SEARCH = 1000;
	protected static final int R_LIST = 2000;
	protected static final int R_NEW = 2001;
	protected static final int R_MAINT = 2002;
	protected static final int R_DELETE = 2003;
	protected static final int A_MAINT = 2004;
	protected static final int A_CANCEL = 2005;
	protected static final int R_INQUIRY_LIST = 3000;
	protected static final int R_INQUIRY_MAINT = 4000;

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {
	
		switch (screen) {
			case R_SEARCH :
				procSearch(user, req, res, session);
				break;
			case R_LIST :
				procList(user, req, res, session);
				break;
			case R_NEW :
				procReqNew(user, req, res, session);
				break;
			case R_MAINT :
				procReqMaintenance(user, req, res, session);
				break;
			case R_DELETE :
				procReqDelete(user, req, res, session);
				break;
			case A_MAINT :
				procActionMaintenance(user, req, res, session);
				break;
			case A_CANCEL :
				procActionCancel(user, req, res, session);
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

	private void procSearch(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
	
		forward("EDL0372_commissions_search.jsp", req, res);
	}

	private void procList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0372", req);
			EDL037202Message msgList = (EDL037202Message) mp.getMessageRecord("EDL037202");
			msgList.setH02USERID(user.getH01USR());
			msgList.setH02PROGRM("EDL0372");
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
				forward("EDL0372_commissions_search.jsp", req, res);
			} else {
				EDL037203Message msgHeader = (EDL037203Message) mp.receiveMessageRecord();
				JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");

				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("list", list);
				session.setAttribute("header", msgHeader);
				forward("EDL0372_commissions_list.jsp", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}

	}

	private void procReqNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0372", req);
			EDL037201Message msg = (EDL037201Message) mp.getMessageRecord("EDL037201");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDL0372");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0001");
			msg.setE01DEAACC(userPO.getAccNum());
			msg.setE01DCOCDE(req.getParameter("E02DCOCDE"));

			mp.sendMessage(msg);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (EDL037201Message) mp.receiveMessageRecord();

			if (!mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msg);
				session.setAttribute("error", msgError);
				forward("EDL0372_commissions_maint.jsp?newOnly=true", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("EDL0372_commissions_list.jsp", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}
		
	}

	private void procReqMaintenance(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0372", req);
			
			JBObjList list = (JBObjList)session.getAttribute("list");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EDL037202Message listMessage = (EDL037202Message)list.get(index);
			
			EDL037201Message msg = (EDL037201Message) mp.getMessageRecord("EDL037201");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDL0372");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0002");
			msg.setE01DCOCDE(listMessage.getE02DCOCDE());
			msg.setE01DEAACC(userPO.getAccNum());

			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (EDL037201Message) mp.receiveMessageRecord();
			
			if (!mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msg);
				session.setAttribute("error", msgError);
				forward("EDL0372_commissions_maint.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("EDL0372_commissions_list.jsp", req, res);
			}
			
		} finally {
			if(mp !=null) mp.close();
		}
		
	}

	private void procReqDelete(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("EDL0372", req);
			
			JBObjList list = (JBObjList)session.getAttribute("list");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EDL037202Message listMessage = (EDL037202Message)list.get(index);
			
			EDL037201Message msg = (EDL037201Message) mp.getMessageRecord("EDL037201");
			msg.setH01USERID(user.getH01USR());
			msg.setH01TIMSYS(getTimeStamp());
		 	msg.setH01SCRCOD("01");
		 	msg.setH01OPECOD("0009");	
			msg.setE01DCOCDE(listMessage.getE02DCOCDE());
			msg.setE01DEAACC(userPO.getAccNum());
			
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();

			if (!mp.hasError(msgError)) {
				procList(user, req, res, session);
			} else {
				session.setAttribute("error", msgError);
				forward("EDL0372_commissions_list.jsp", req, res);
			}
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActionMaintenance(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0372", req);
			EDL037201Message msg = (EDL037201Message) mp.getMessageRecord("EDL037201");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDL0372");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0005");
			
		 	setMessageRecord(req,msg);
			
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (EDL037201Message) mp.receiveMessageRecord();

			if (!mp.hasError(msgError)) {
				procList(user, req, res, session);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("datarec", msg);
				forward("EDL0372_commissions_maint.jsp", req, res);
			}
		} finally {
			if (mp != null) mp.close();
		}
		
	}

	private void procActionCancel(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		procList(user, req, res, session);
	
	}
	
	private void procReqInquiryList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0372", req);
			EDL037202Message msgList = (EDL037202Message) mp.getMessageRecord("EDL037202");
			msgList.setH02USERID(user.getH01USR());
			msgList.setH02PROGRM("EDL0372");
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
				EDL037203Message msgHeader = (EDL037203Message) mp.receiveMessageRecord();
				JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				session.setAttribute("list", list);
				session.setAttribute("header", msgHeader);
				forward("EDL0372_commissions_list.jsp?readOnly=true", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}

	}

	private void procReqInquiryMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0372", req);
			
			JBObjList list = (JBObjList)session.getAttribute("list");
			int index = Integer.parseInt(req.getParameter("key").trim());
			
			EDL037202Message listMessage = (EDL037202Message)list.get(index);
			
			EDL037201Message msg = (EDL037201Message) mp.getMessageRecord("EDL037201");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDL0372");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0002");
			msg.setE01DCOCDE(listMessage.getE02DCOCDE());
			msg.setE01DEAACC(userPO.getAccNum());
			msg.setH01FLGWK1("A");
			
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (EDL037201Message) mp.receiveMessageRecord();
			
			if (!mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("datarec", msg);
				session.setAttribute("error", msgError);
				forward("EDL0372_commissions_maint.jsp?readOnly=true", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("error", msgError);
				forward("EDL0372_commissions_list.jsp?readOnly=true", req, res);
			}
			
		} finally {
			if(mp !=null) mp.close();
		}
	}

}