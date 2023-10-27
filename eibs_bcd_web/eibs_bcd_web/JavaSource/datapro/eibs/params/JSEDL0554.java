package datapro.eibs.params;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDL055401Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEDL0554 extends JSEIBSServlet {

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
		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) session.getAttribute("userPO");
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL055401", req);
			EDL055401Message msgRT = (EDL055401Message) mp.getMessageRecord("EDL055401");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDL055401");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			if (userPO.getPurpose().equals("NEW")){
				msgRT.setH01OPECOD("0001");
			} else {
				msgRT.setH01OPECOD("0005");
			}
			
			setMessageRecord(req, msgRT);
			
			if (userPO.getOption().equals("MODIF")){
				msgRT.setE01MODTYP("1");
			} 
			if (userPO.getOption().equals("REEST")){
				msgRT.setE01MODTYP("2");
			}

			mp.sendMessage(msgRT);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDL055401Message) mp.receiveMessageRecord("EDL055401");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				session.setAttribute("prevDetails",msgRT);
				forward("EDL0554_previsions_details.jsp", req, res);
				
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
			mp = getMessageProcessor("EDL055401", req);
				
			JBObjList list = (JBObjList)session.getAttribute("EDL055401Help");
			int index = Integer.parseInt(req.getParameter("CURRCODE").trim());
			
			EDL055401Message listMessage = (EDL055401Message)list.get(index);
			
			EDL055401Message msgList = (EDL055401Message) mp.getMessageRecord("EDL055401");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL055401");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0009");
			msgList.setE01MODTBL(listMessage.getE01MODTBL());
			
			if (userPO.getOption().equals("MODIF")){
				msgList.setE01MODTYP("1");
			} 
			if (userPO.getOption().equals("REEST")){
				msgList.setE01MODTYP("2");
			}
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDL0554_previsions_list.jsp", req, res);
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
			mp = getMessageProcessor("EDL055401", req);
			
			userPO.setPurpose("MAINTENANCE");

			

			JBObjList list = (JBObjList)session.getAttribute("EDL055401Help");
			int index = Integer.parseInt(req.getParameter("CURRCODE").trim());
			
			EDL055401Message listMessage = (EDL055401Message)list.get(index);
			
			if (userPO.getOption().equals("MODIF")){
				listMessage.setE01MODTYP("1");
			} 
			if (userPO.getOption().equals("REEST")){
				listMessage.setE01MODTYP("2");
			}
			
			session.setAttribute("prevDetails", listMessage);
			session.setAttribute("userPO", userPO);

			forward("EDL0554_previsions_details.jsp", req, res);

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
			mp = getMessageProcessor("EDL055401", req);
			EDL055401Message msgList = (EDL055401Message) mp.getMessageRecord("EDL055401");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL055401");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0001");
			
			userPO.setPurpose("NEW");
			
			session.setAttribute("prevDetails", msgList);
			session.setAttribute("userPO", userPO);
			forward("EDL0554_previsions_details.jsp", req, res);

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
			mp = getMessageProcessor("EDL055401", req);
			EDL055401Message msgList = (EDL055401Message) mp.getMessageRecord("EDL055401");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL055401");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0015");
			
			
			if (userPO.getOption().equals("MODIF")){
				msgList.setE01MODTYP("1");
			} 
			if (userPO.getOption().equals("REEST")){
				msgList.setE01MODTYP("2");
			}
			
			if (msgList.getE01MODTYP().equals("")) {
			msgList.setE01MODTYP((req.getParameter("OPT") == null ? "1" : req.getParameter("OPT")));
			}
			
			if (msgList.getE01MODTYP().equals("1")) {
				userPO.setOption("MODIF");	
			} 
			if (msgList.getE01MODTYP().equals("2")) {
				userPO.setOption("REEST");
			}
			
			
			
			mp.sendMessage(msgList);
			
			JBObjList list = mp.receiveMessageRecordList("E01MODOPE");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "error_viewer.jsp";
			} 
				pageName = "EDL0554_previsions_list.jsp";
			
			session.setAttribute("userPO", userPO);
			session.setAttribute("EDL055401Help", list);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

}
