package datapro.eibs.amort;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: David Mavilla
 */
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EFIX00001Message;
import datapro.eibs.beans.EFIX03001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEFIX030 extends JSEIBSServlet {

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
		
		EFIX03001Message msgRT = new EFIX03001Message();
		msgRT.setH01USERID(user.getH01USR());
		msgRT.setH01PROGRM("EFIX030");
		msgRT.setH01TIMSYS(getTimeStamp());
		msgRT.setH01SCRCOD("01");
		msgRT.setE01FIXBNK(user.getE01UBK());
		session.setAttribute("fix", msgRT);
		
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		
		forward("EFIX030_fix_enter_cross_references.jsp", req, res);
	}

	private void procActionMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFIX030", req);
			EFIX03001Message msgInst = (EFIX03001Message) session.getAttribute("fix");
			msgInst.setH01USERID(user.getH01USR());
		 	msgInst.setH01PROGRM("EFIX030");
		 	msgInst.setH01TIMSYS(getTimeStamp());
		 	msgInst.setH01SCRCOD("01");
		 	msgInst.setH01OPECOD("0005");
		 	
		 	setMessageRecord(req, msgInst);

			mp.sendMessage(msgInst);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgInst = (EFIX03001Message) mp.receiveMessageRecord("EFIX03001");

			if (mp.hasError(msgError)) {
				pageName = "EFIX030_fix_cross_references.jsp";
			} else {
				pageName = "EFIX030_fix_enter_cross_references.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("fix", msgInst);

			forward(pageName, req, res);

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
			mp = getMessageProcessor("EFIX030", req);
			EFIX03001Message msgRT = (EFIX03001Message) mp.getMessageRecord("EFIX03001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EFIX030");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0002");
			
			try {
				msgRT.setE01FIXBNK(req.getParameter("E01FIXBNK").trim());
			} catch (Exception e) {
			}

			try {
				msgRT.setE01FIXCCY(req.getParameter("E01FIXCCY").trim());
			} catch (Exception e) {
			}

			try {
				msgRT.setE01FIXGLN(req.getParameter("E01FIXGLN").trim());
			} catch (Exception e) {
			}

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgRT = (EFIX03001Message) mp.receiveMessageRecord("EFIX03001");

			if (mp.hasError(msgError)) {
				pageName = "EFIX030_fix_enter_cross_references.jsp";
			} else {
				pageName = "EFIX030_fix_cross_references.jsp";
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
