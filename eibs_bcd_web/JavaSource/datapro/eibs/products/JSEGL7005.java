package datapro.eibs.products;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.master.MessageProcessor;

import datapro.eibs.beans.EGL700501Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;

public class JSEGL7005 extends JSEIBSServlet {

	protected static final int R_BANK = 1;
	protected static final int A_BANK = 200;

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {
		
		switch (screen) {
			case R_BANK:
				procReqBank(user, req, res, session);
				break;
			case A_BANK:
				procActionBank(user, req, res, session);
				break;
			default:
				forward(devPage, req, res);
				break;
		}

	}

	private void procReqBank(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		forward("EGL7005_cancel_enter.jsp", req, res);
		
	}

	private void procActionBank(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EGL7005", req);
			EGL700501Message msgBank = (EGL700501Message) mp.getMessageRecord("EGL700501");
			msgBank.setH01USERID(user.getH01USR());
			msgBank.setH01PROGRM("EGL7005");
			msgBank.setH01TIMSYS(getTimeStamp());
			msgBank.setH01SCRCOD("01");
			msgBank.setH01OPECOD("0001");
			msgBank.setE01CNTBNK(req.getParameter("E01CNTBNK"));
			
			mp.sendMessage(msgBank);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				forward("EGL7005_cancel_enter.jsp", req, res);
			} else {
				forward("EGL7005_cancel_process.jsp", req, res);   
			}


		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

}
