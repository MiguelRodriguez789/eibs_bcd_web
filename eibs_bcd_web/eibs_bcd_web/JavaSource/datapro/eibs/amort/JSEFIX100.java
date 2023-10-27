package datapro.eibs.amort;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: David Mavilla
 */
import java.io.*;
import java.net.*;
import java.beans.Beans;
import javax.servlet.*;
import javax.servlet.http.*;

import datapro.eibs.beans.*;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
 
import datapro.eibs.sockets.*;

public class JSEFIX100 extends JSEIBSServlet {

	// Action 
	protected static final  int R_ENTER_MAINTENANCE	    = 100;
	
	protected static final  int A_ENTER_MAINTENANCE		= 200;
	protected static final  int A_MAINTENANCE			= 400;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen) {

		// Action
		
		case A_ENTER_MAINTENANCE :
			procActionEnterMaintenance(user, req, res, session);
			break;
		
		case A_MAINTENANCE :
			procActionMaintenance(user, req, res, session);
			break;
		//Request
							
		case R_ENTER_MAINTENANCE :
			procReqEnterMaintenance(user, req, res, session);
			break;			
		// END Entering

		default :
			forward(devPage, req, res);
			break;
		}
	}

	private void procReqEnterMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setPurpose("MAINTENANCE");
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		
		EFIX10001Message msgRT = new EFIX10001Message();
		msgRT.setH01USERID(user.getH01USR());
		msgRT.setH01PROGRM("EFIX000");
		msgRT.setH01TIMSYS(getTimeStamp());
		msgRT.setH01SCRCOD("01");
		msgRT.setE01FIXBNK(user.getE01UBK());
		session.setAttribute("fix", msgRT);
		
		forward("EFIX100_fix_enter_parameters.jsp", req, res);
	}

	private void procActionMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFIX100", req);
			EFIX10001Message msgInst = (EFIX10001Message) mp.getMessageRecord("EFIX10001");
			msgInst.setH01USERID(user.getH01USR());
		 	msgInst.setH01PROGRM("EFIX00001");
		 	msgInst.setH01TIMSYS(getTimeStamp());
		 	msgInst.setH01SCRCOD("01");
		 	msgInst.setH01OPECOD("0005");
		 	
		 	setMessageRecord(req, msgInst);

			mp.sendMessage(msgInst);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgInst = (EFIX10001Message) mp.receiveMessageRecord("EFIX10001");

			if (mp.hasError(msgError)) {
				session.setAttribute("fix", msgInst);
				session.setAttribute("error", msgError);
				forward("EFIX100_fix_parameters.jsp", req, res);
			} else {
				procReqEnterMaintenance(user, req, res, session);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionEnterMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFIX100", req);
			EFIX10001Message msgRT = (EFIX10001Message) mp.getMessageRecord("EFIX10001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EFIX10001");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0002");
			
			try {
				msgRT.setE01FIXBNK(req.getParameter("E01FIXBNK").trim());
			} catch (Exception e) {
			}

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgRT = (EFIX10001Message) mp.receiveMessageRecord("EFIX10001");

			if (mp.hasError(msgError)) {
				pageName = "EFIX100_fix_enter_parameters.jsp";
			} else {
				pageName = "EFIX100_fix_parameters.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("fix", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}	

	
}
