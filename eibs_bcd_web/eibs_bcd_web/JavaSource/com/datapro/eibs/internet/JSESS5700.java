package com.datapro.eibs.internet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.ESS570001Message;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSESS5700 extends JSEIBSServlet {

	protected static final int A_MESSAGE_LIST 	= 100;
	protected static final int A_MESSAGE_DETAIL = 110;
	protected static final int A_MESSAGE_NEW 	= 120;
	protected static final int A_MESSAGE_UPDATE = 200;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case A_MESSAGE_LIST :
				procReqList(user, req, res, session);
				break;
			case A_MESSAGE_DETAIL :
				procReqDetail(user, req, res, session);
				break;		
			case A_MESSAGE_NEW :
				procNewMessage(user, req, res, session);
				break;	
			case A_MESSAGE_UPDATE:
				procUpdateMessage(user, req, res, session);
				break;						
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procUpdateMessage(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESS5700", req);
			ESS570001Message msgList = (ESS570001Message) mp.getMessageRecord("ESS570001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01OPECOD("02");
			
			setMessageRecord(req, msgList);
			
//			Para no perder las modifciaciones previas
			ESS570001Message msg = new ESS570001Message();
			populate(msgList, msg);
			
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
	            forward("ESS5700_Message_Detail.jsp", req, res);
			} else {
				procReqList(user, req, res, session);
			}
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procNewMessage(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		session .setAttribute("msgData", new ESS570001Message());
        forward("ESS5700_Message_Detail.jsp", req, res);
	}

	private void procReqDetail(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String MsgNo = req.getParameter("E01IMFCDE") == null ? "" : req.getParameter("E01IMFCDE");	
		String Lang  = req.getParameter("E01IMFLIF") == null ? "" : req.getParameter("E01IMFLIF");	
		JBObjList objList = (JBObjList) session.getAttribute("ESS5701List");
		
		objList.initRow();
		while(objList.getNextRow()){
			ESS570001Message msgList = (ESS570001Message) objList.getRecord();
			if (MsgNo.equals(msgList.getE01IMFCDE()) && Lang.equals(msgList.getE01IMFLIF())) {
				session.setAttribute("msgData", msgList);
				break;
			}
		}
        forward("ESS5700_Message_Detail.jsp", req, res);
	}

	private void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESS5700", req);
			ESS570001Message msgList = (ESS570001Message) mp.getMessageRecord("ESS570001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01OPECOD("01");
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = new ELEERRMessage(); 
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
			
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ESS5700_Message_List.jsp";
			}
			session.setAttribute("ESS5701List", list);
			session.setAttribute("error", msgError);
			
            forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

}
