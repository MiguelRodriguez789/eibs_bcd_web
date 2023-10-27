package com.datapro.eibs.internet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD200001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSESD2000 extends JSEIBSServlet {

	protected static final int R_ENTER 			= 1;
	protected static final int R_PREV_LIST 		= 100;
	protected static final int R_NEW 			= 300;
	protected static final int R_MAINTENANCE	= 500;
	protected static final int A_MAINTENANCE	= 600;
	protected static final int A_POSITION 		= 800;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			//Request
			case R_PREV_LIST :
				procReqTablesList(user, req, res, session);
				break;
			case R_NEW :
				 procReqNew(user, req, res, session);							
				break;	
			case R_MAINTENANCE :
				procReqMaintenance(user, req, res, session);							
				break;
				// Action
			case A_POSITION :
				procActionPos(user, req, res, session);
				break;
			case A_MAINTENANCE :
				 procActionMaintenance(user, req, res, session);							
				break;
			// END Entering
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procActionMaintenance(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD2000", req);
			ESD200001Message msgRT = (ESD200001Message) session.getAttribute("prevDetails");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("ESD2000");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0005");
			
			setMessageRecord(req, msgRT);
			
			mp.sendMessage(msgRT);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (ESD200001Message) mp.receiveMessageRecord("ESD200001");
			
			session.setAttribute("error", msgError);
			session.setAttribute("prevDetails", msgRT);
			
			if (mp.hasError(msgError)) {
				forward("ESD2000_internet_parameters_details.jsp", req, res);
			} else {
				procReqTablesList(user, req, res, session);
			}
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionPos(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		int inptOPT;
		try {
			inptOPT = Integer.parseInt(req.getParameter("opt"));
		} catch (Exception e) {
			inptOPT = 0;
		}

		switch (inptOPT) {
			case 1 : //New
				procReqNew(user, req, res, session);
				break;
			case 2 : //Maintenance
				procReqMaintenance(user, req, res, session);
				break;
			default :
				procReqTablesList(user, req, res, session);
				break;
		}
	}

	private void procReqMaintenance(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("MAINTENANCE");
		userPO.setHeader21(user.getE01INT()); //Sets country at header 21
		
		int idx;
		try {
			idx = Integer.parseInt(req.getParameter("CURRCODE"));
		} catch (Exception e) {
			throw new ServletException(e);
		}
		JBObjList bl = (JBObjList) session.getAttribute("ESD200001Help");
		if (bl != null) {
			ESD200001Message msgDoc = (ESD200001Message) bl.get(idx);
			
			session.setAttribute("userPO", userPO);
			session.setAttribute("prevDetails", msgDoc);
			
			forward("ESD2000_internet_parameters_details.jsp", req, res);
		}
	}

	private void procReqNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("NEW");
		userPO.setHeader21(user.getE01INT()); //Sets country at header 21
		session.setAttribute("userPO", userPO);
		session.setAttribute("prevDetails", new ESD200001Message());
		
		forward("ESD2000_internet_parameters_details.jsp", req, res);
	}

	private void procReqTablesList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD2000", req);
			ESD200001Message msgList = (ESD200001Message) mp.getMessageRecord("ESD200001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD2000");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0015");
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = new ELEERRMessage();
			JBObjList list = mp.receiveMessageRecordList("E01FINREC");
			
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ESD2000_internet_parameters_list.jsp";
			}
			session.setAttribute("error", msgError);
			session.setAttribute("ESD200001Help", list);
			
            forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

}
