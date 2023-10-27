package datapro.eibs.transfer;

/**
  */
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EPR204001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSEPR2040 extends JSEIBSServlet {

	// options
	protected static final int R_SHOW_LETTRF = 1;
	protected static final int A_SHOW_LETTRF = 2;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen) {
		case R_SHOW_LETTRF :
			procReqShowLetter(user, req, res, session);
			break;
		default :
			forward(devPage, req, res);
			break;
		}
	}

	private void procReqShowLetter(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPR2040", req);
			EPR204001Message msgLetter = (EPR204001Message) mp.getMessageRecord("EPR204001");
			msgLetter.setH01USERID(user.getH01USR());
			msgLetter.setH01PROGRM("EPR2040");
			msgLetter.setH01TIMSYS(getTimeStamp());
			try {
				msgLetter.setE01PRPDAC(req.getParameter("account").trim());
			} catch (Exception e) {
			}
			try {
				msgLetter.setE01PRPNUM(req.getParameter("ref").trim());
			} catch (Exception e) {
			}

			mp.sendMessage(msgLetter);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgLetter = (EPR204001Message) mp.receiveMessageRecord("EPR204001");

			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "EPR2040_pr_transfer_letter.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("msgLetter", msgLetter);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

}