package datapro.eibs.params;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EIB000001Message;
import datapro.eibs.beans.EIB000002Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEIB0000 extends JSEIBSServlet {

	protected static final int R_ENTER 			= 1;
	protected static final int A_ENTER 			= 2;
	protected static final int R_GENERATION 	= 100;
	protected static final int A_GENERATION 	= 200;
	protected static final int A_MAINTENANCE 	= 400;

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case A_ENTER :
				procReqMaintenance(user, req, res, session);
				break;
			case R_GENERATION :
				procReqGeneration(user, req, res, session);
				break;
			case R_ENTER :
				procReqEnterMaintenance(user, req, res, session);
				break;
			case A_MAINTENANCE :
				procActionMaintenance(user, req, res, session);
				break;
			case A_GENERATION :
				procActionGeneration(user, req, res, session);
				break;
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procActionGeneration(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("", req);
			EIB000001Message msgRT = (EIB000001Message) session.getAttribute("branch");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EIB000002");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01OPECOD("0005");
			
			setMessageRecord(req, msgRT);

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EIB000001Message) mp.receiveMessageRecord("EIB000001");

			if (mp.hasError(msgError)) {
				pageName = "EIB0000_interbranch_generation.jsp";
			} else {
				callPage( bgPage, req, res);
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("branch", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("", req);
			EIB000002Message msgRT = (EIB000002Message) session.getAttribute("branch");
			msgRT.setH02USERID(user.getH01USR());
			msgRT.setH02PROGRM("EIB000002");
			msgRT.setH02TIMSYS(getTimeStamp());
			msgRT.setH02OPECOD("0005");
			
			setMessageRecord(req, msgRT);

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EIB000002Message) mp.receiveMessageRecord("EIB000002");

			if (mp.hasError(msgError)) {
				pageName = "EIB0000_interbranch_maintenance.jsp";
			} else {
				pageName = "EIB0000_interbranch_enter_maintenance.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("branch", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procReqEnterMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", new UserPos());
		
		forward("EIB0000_interbranch_enter_maintenance.jsp", req, res);
	}

	private void procReqGeneration(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("branch", new EIB000001Message());
		
		forward("EIB0000_interbranch_generation.jsp", req, res);
	}

	private void procReqMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("", req);
			EIB000002Message msgRT = (EIB000002Message) mp.getMessageRecord("EIB000002");
			msgRT.setH02USERID(user.getH01USR());
			msgRT.setH02PROGRM("EIB000002");
			msgRT.setH02TIMSYS(getTimeStamp());
			msgRT.setH02SCRCOD("01");
			msgRT.setH02OPECOD("0002");
			try {
				msgRT.setE02IBTDFB(req.getParameter("E02IBTDFB").trim());
			} catch (Exception e) {
			}
			try {
				msgRT.setE02IBTDFR(req.getParameter("E02IBTDFR").trim());
			} catch (Exception e) {
			}
			try {
				msgRT.setE02IBTDFC(req.getParameter("E02IBTDFC").trim());
			} catch (Exception e) {
			}
			try {
				msgRT.setE02IBTDTB(req.getParameter("E02IBTDTB").trim());
			} catch (Exception e) {
			}
			try {
				msgRT.setE02IBTDTR(req.getParameter("E02IBTDTR").trim());
			} catch (Exception e) {
			}

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EIB000002Message) mp.receiveMessageRecord("EIB000002");

			if (mp.hasError(msgError)) {
				pageName = "EIB0000_interbranch_enter_maintenance.jsp";
			} else {
				pageName = "EIB0000_interbranch_maintenance.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("branch", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}

}
