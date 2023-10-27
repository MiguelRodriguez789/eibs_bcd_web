package datapro.eibs.cleaning;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDD095001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;

public class JSEDD0950 extends JSEIBSServlet {

	protected static final int R_ENTER = 100;
	protected static final int A_ENTER = 200;
	protected static final int A_apply = 2;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
		case R_ENTER:
			procReqEnter(user, req, res, session);
			break;
		case A_ENTER:
			procActionEnter(user, req, res, session);
			break;
		case A_apply:
			procActionapply(user, req, res, session);
			break;
		default:
			forward(devPage, req, res);
			break;
		}
	}

	private void procReqEnter(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("CLEANING");
		userPO.setPurpose("apply");
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		
		forward("EDD0950_enter_cleaning_apply.jsp", req, res);
	}

	private void procActionapply(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		forward("EDD0950_cleaning_apply_confirm.jsp", req, res);
	}

	private void procActionEnter(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		String pageName = "";

		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0950", req);
			EDD095001Message msgAPP = (EDD095001Message) mp.getMessageRecord("EDD095001");
			msgAPP.setH01USERID(user.getH01USR());
			msgAPP.setH01PROGRM("EDD0950");
			msgAPP.setH01TIMSYS(getTimeStamp());
			msgAPP.setH01SCRCOD("01");
			msgAPP.setH01OPECOD("0004");

			// all the fields here
			try {
				msgAPP.setE01CNTFEM(req.getParameter("E01CNTFEM").trim());
			} catch (Exception e) {
				msgAPP.setE01CNTFEM("0");
			}
			try {
				msgAPP.setE01CNTFED(req.getParameter("E01CNTFED").trim());
			} catch (Exception e) {
				msgAPP.setE01CNTFED("0");
			}
			try {
				msgAPP.setE01CNTFEY(req.getParameter("E01CNTFEY").trim());
			} catch (Exception e) {
				msgAPP.setE01CNTFEY("0");
			}
			try {
				msgAPP.setE01ACTION(req.getParameter("E01ACTION").trim());
			} catch (Exception e) {
				msgAPP.setE01ACTION("A");
			}

			mp.sendMessage(msgAPP);
			MessageRecord msg = mp.receiveMessageRecord();

			if (mp.hasError(msg)) {
				msgError = (ELEERRMessage) msg;
				pageName = "EDD0950_enter_cleaning_apply.jsp";
			} else {
				pageName = "EDD0950_cleaning_apply_confirm.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

}
