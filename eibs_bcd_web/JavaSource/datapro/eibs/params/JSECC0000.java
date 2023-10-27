package datapro.eibs.params;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ECC000001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EUT011001Message;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSECC0000 extends JSEIBSServlet {
	
	static final int R_ENTER  	= 1;
	static final int R_LIST  	= 2;
	static final int A_LIST	 	= 3;
	static final int A_MAINT 	= 4;
	static final int A_DELETE	= 5;
	
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {
		
		switch (screen) {

			case R_ENTER:
				procReqEnterBank(user, req, res, session);
				break;
			case R_LIST:
				procReqList(user, req, res, session);
				break;
			case A_DELETE:
				procActionDelete(user, req, res, session);
			case A_LIST:
				procActionList(user, req, res, session);
				break;
			case A_MAINT:
				procActionMaintenance(user, req, res, session);
				break;
	
			default:
				forward(devPage, req, res);
				break;
		}
	}

	private void procActionDelete(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws IOException, ServletException {

		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("ECC0000", req);
			
			JBObjList list = (JBObjList)session.getAttribute("ccList");
			int index = Integer.parseInt(req.getParameter("ROW1").trim());
			ECC000001Message listMessage = (ECC000001Message)list.get(index);
			
						
			ECC000001Message msgList = (ECC000001Message) mp.getMessageRecord("ECC000001");
						
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ECC0000");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0009");
			msgList.setE01CCDBNK(listMessage.getE01CCDBNK());
			msgList.setE01CCDCCN(listMessage.getE01CCDCCN());
			msgList.setE01CCDCCD(listMessage.getE01CCDCCD());
			
			mp.sendMessage(msgList);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("ECC0000_cost_center_list.jsp", req, res);
			} else {
				procReqList(user, req, res, session);
			}
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActionMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		String opeCode = "0005";

		String opt = req.getParameter("OPT");

		if (opt.equals("N")) {
			opeCode = "0001";
		} else if (opt.equals("M")) {
			opeCode = "0005";
		}
		
		try {
			mp = getMessageProcessor("ECC0000", req);
			ECC000001Message msgList = (ECC000001Message) mp.getMessageRecord("ECC000001");
			
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ECC0000");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD(opeCode);
			msgList.setE01CCDBNK(req.getParameter("E01CCDBNK"));
			msgList.setE01CCDCCN(req.getParameter("E01CCDCCN"));
			msgList.setE01CCDCCD(req.getParameter("E01CCDCCD"));
			msgList.setE01CCDGRP(req.getParameter("E01CCDGRP"));
			msgList.setE01CCDSBR(req.getParameter("E01CCDSBR"));
			
						
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (ECC000001Message) mp.receiveMessageRecord("ECC000001");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				pageName = "ECC0000_cost_center_basic.jsp";
				forward(pageName, req, res);
			} else {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				session.setAttribute("cc", msgList);

				procReqList(user, req, res, session);
			}

			
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		
		String opt = req.getParameter("opt");
		try {
			mp = getMessageProcessor("ECC0000", req);
			ECC000001Message msgList = (ECC000001Message) mp.getMessageRecord("ECC000001");
			
			if (opt.equals("N")) {
				
				userPO.setPurpose("N");
				msgList.setE01CCDBNK(user.getE01UBK());
				msgList.setE01CCDCCN("0");
				msgList.setE01CCDCCD("");
				msgList.setE01CCDGRP("");
				msgList.setE01CCDSBR("");
			
										
			} else if (opt.equals("M")) {
				
				JBObjList list = (JBObjList)session.getAttribute("ccList");
				int index = Integer.parseInt(req.getParameter("ROW1").trim());
				ECC000001Message listMessage = (ECC000001Message)list.get(index);
				
				userPO.setPurpose("M");
				msgList.setE01CCDBNK(listMessage.getE01CCDBNK());
				msgList.setE01CCDCCN(listMessage.getE01CCDCCN());
				msgList.setE01CCDCCD(listMessage.getE01CCDCCD());
				msgList.setE01CCDGRP(listMessage.getE01CCDGRP());
				msgList.setE01CCDSBR(listMessage.getE01CCDSBR());
				
			}
						
			pageName = "ECC0000_cost_center_basic.jsp";
			
			flexLog("Putting java beans into the session");
			session.setAttribute("cc", msgList);
			session.setAttribute("userPO", userPO);
			

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException{
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("ECC0000", req);
			ECC000001Message msgList = (ECC000001Message) mp.getMessageRecord("ECC000001");
			
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ECC0000");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0015");
			
			if(req.getParameter("E01CCDBNC")!=null){
				msgList.setE01CCDBNK(req.getParameter("E01CCDBNC"));
				userPO.setBank(req.getParameter("E01CCDBNC"));
			}
	 	
			mp.sendMessage(msgList);
			
			JBObjList ccList = mp.receiveMessageRecordList("E01CCDOPE");
			
			if (mp.hasError(ccList)) {
				session.setAttribute("error", mp.getError(ccList));
				pageName = "error_viewer.jsp";
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("ccList", ccList);
				pageName = "ECC0000_cost_center_list.jsp";
			}
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null)
				mp.close();
		}
			
	}

	private void procReqEnterBank(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {

		flexLog("Putting java beans into the session");
		forward("ECC0000_enter_param.jsp", req, res);
		
	}

	

	
	
}
