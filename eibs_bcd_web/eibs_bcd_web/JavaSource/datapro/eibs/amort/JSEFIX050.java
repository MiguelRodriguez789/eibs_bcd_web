package datapro.eibs.amort;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EFIX05001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEFIX050 extends JSEIBSServlet {

	
	static final int R_LIST = 100;
	static final int R_NEW = 1;
	static final int R_MAINT = 2;
	static final int R_DELETE = 3;
	static final int A_MAINT = 600;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen){
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
			default:
				forward(devPage, req, res); 
				break;
		}

	}

	private void procReqList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFIX050", req);
			EFIX05001Message msgList = (EFIX05001Message) mp.getMessageRecord("EFIX05001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EFIX050");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0015");

			mp.sendMessage(msgList);
			JBObjList list = mp.receiveMessageRecordList("E01LOCOPE");

			session.setAttribute("userPO", userPO);
			session.setAttribute("EFIX05001Help", list);

			forward("EFIX050_locations_list.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqNew(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFIX050", req);
			EFIX05001Message msgList = (EFIX05001Message) mp.getMessageRecord("EFIX05001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EFIX050");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0001");
			
			userPO.setPurpose("NEW");
			
			session.setAttribute("userPO", userPO);
			session.setAttribute("loc",msgList);

			forward("EFIX050_locations_details.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFIX050", req);
			
			userPO.setPurpose("MAINTENANCE");		
			
			JBObjList list = (JBObjList)session.getAttribute("EFIX05001Help");
			int index = Integer.parseInt(req.getParameter("CURRCODE").trim());	
			
			EFIX05001Message listMessage = (EFIX05001Message)list.get(index);
			
			session.setAttribute("loc", listMessage);
			session.setAttribute("userPO", userPO);

			forward("EFIX050_locations_details.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
	private void procActionMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFIX050", req);
			EFIX05001Message msgList = (EFIX05001Message) mp.getMessageRecord("EFIX05001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EFIX050");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			if (userPO.getPurpose().equals("NEW")){
				msgList.setH01OPECOD("0001");
			} else {
				msgList.setH01OPECOD("0005");
			}
			
			setMessageRecord(req, msgList);
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgList = (EFIX05001Message) mp.receiveMessageRecord("EFIX05001");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				session.setAttribute("EFIX05001Help", msgList);
				
				forward("EFIX050_locations_details.jsp", req, res);
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
		throws ServletException, IOException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFIX050", req);

			JBObjList list = (JBObjList)session.getAttribute("EFIX05001Help");
			int index = Integer.parseInt(req.getParameter("CURRCODE").trim());
			
			EFIX05001Message listMessage = (EFIX05001Message)list.get(index);

			EFIX05001Message msgList = (EFIX05001Message) mp.getMessageRecord("EFIX05001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EFIX050");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0009");
			msgList.setE01LOCLOC(listMessage.getE01LOCLOC());
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EFIX050_locations_list.jsp", req, res);
			} else {
				procReqList(user, req, res, session);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


}
