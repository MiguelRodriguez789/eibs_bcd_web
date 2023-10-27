package datapro.eibs.params;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDL052201Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEDL0522 extends JSEIBSServlet {

	protected static final int A_POSITION 	= 800;

	protected static final int R_PREV_LIST 	= 100;
	
	protected static final int R_ENTER 		= 1;
	protected static final int R_NEW 		= 300; 
	protected static final int R_MAINTENANCE= 500;
	protected static final int R_DELETE = 3;
	
	protected static final int A_MAINTENANCE= 600;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen) {

			case R_PREV_LIST :
				procReqTablesList(user, req, res, session);
				break;
			case R_NEW :
				 procReqNew(user, req, res, session);							
				break;	
			case R_MAINTENANCE :
				procReqMaintenance(user, req, res, session);							
				break;
			case R_DELETE :
				procReqDelete(user, req, res, session);
				break;
			case A_POSITION :
				procActionPos(user, req, res, session);
				break;
			case A_MAINTENANCE :
				 procActionMaintenance(user, req, res, session);							
				break;
			default :
				forward(devPage, req, res);
				break;
		}

	}

	private void procActionMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws IOException, ServletException {

		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL052201", req);
			EDL052201Message msgRT = (EDL052201Message) mp.getMessageRecord("EDL052201");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDL052201");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			if (userPO.getPurpose().equals("NEW")){
				msgRT.setH01OPECOD("0001");
			} else {
				msgRT.setH01OPECOD("0005");
			}

			setMessageRecord(req, msgRT);

			mp.sendMessage(msgRT);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDL052201Message) mp.receiveMessageRecord("EDL052201");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				session.setAttribute("prevDetails",msgRT);
				forward("EDL0522_previsions_details.jsp", req, res);
				
			} else {
				procReqTablesList(user, req, res, session);
			}

			
			

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionPos(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws IOException, ServletException {
		
		UserPos userPO = getUserPos(session);
		int inptOPT = 0;

		inptOPT = Integer.parseInt(req.getParameter("opt"));

		switch (inptOPT) {
			case 1 : //New
				procReqNew(user, req, res, session);
				break;
			case 2 : //Maintenance
				procReqMaintenance(user, req, res, session);
				break;
			case 3: //Delete
				procReqDelete(user, req, res, session);
			default :
				forward(devPage, req, res);
				break;
		}
		
	}

	private void procReqDelete(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session)
		throws IOException, ClassCastException, ServletException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL052201", req);
				
			JBObjList list = (JBObjList)session.getAttribute("EDL052201Help");
			int index = Integer.parseInt(req.getParameter("CURRCODE").trim());
			
			EDL052201Message listMessage = (EDL052201Message)list.get(index);
			
			EDL052201Message msgList = (EDL052201Message) mp.getMessageRecord("EDL052201");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL052201");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0009");
			msgList.setE01PRVTBL(listMessage.getE01PRVTBL());
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDL0522_previsions_list.jsp", req, res);
			} else {
				procReqTablesList(user, req, res, session);
			}
			
		} finally {
			if (mp != null)	mp.close();
		}
		
	}

	private void procReqMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws IOException, ServletException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL052201", req);
			
			userPO.setPurpose("MAINTENANCE");
			
			JBObjList list = (JBObjList)session.getAttribute("EDL052201Help");
			int index = Integer.parseInt(req.getParameter("CURRCODE").trim());
			
			EDL052201Message listMessage = (EDL052201Message)list.get(index);
			
			session.setAttribute("prevDetails", listMessage);
			session.setAttribute("userPO", userPO);

			forward("EDL0522_previsions_details.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqNew(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) 
		throws IOException, ServletException {
		
		UserPos userPO = getUserPos(session);

		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL052201", req);
			EDL052201Message msgList = (EDL052201Message) mp.getMessageRecord("EDL052201");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL052201");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0001");
			
			userPO.setPurpose("NEW");
			
			session.setAttribute("prevDetails", msgList);
			session.setAttribute("userPO", userPO);
			forward("EDL0522_previsions_details.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqTablesList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ClassCastException, IOException, ServletException {

		UserPos userPO = getUserPos(session);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL052201", req);
			EDL052201Message msgList = (EDL052201Message) mp.getMessageRecord("EDL052201");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL052201");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0015");
			
			mp.sendMessage(msgList);
			
			JBObjList list = mp.receiveMessageRecordList("E01PRVOPE");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "error_viewer.jsp";
			} 
				pageName = "EDL0522_previsions_list.jsp";
			
			session.setAttribute("userPO", userPO);
			session.setAttribute("EDL052201Help", list);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

}
