package datapro.eibs.misc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EDL098001Message;
import datapro.eibs.beans.ESD036001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;


public class JSEDL0980 extends JSEIBSServlet {
	
	protected static final int A_Enter    	    = 100;
	protected static final int A_CALCULATE		= 800;

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen)
		throws ServletException, IOException {
		
		switch (screen) {
		case A_Enter :
			procActionEnter(user, req, res, session);
			break;
		case A_CALCULATE :
			procActionCalculate(user, req, res, session);
			break;
		default :
			forward("MISC_not_available.jsp", req, res);
			break;
	}
}

	private void procActionEnter(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		forward("EDL0980_Tasa_Equivalente.jsp", req, res);
	}

	private void procActionCalculate(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("EDL0980", req);
			EDL098001Message msgCal = (EDL098001Message) session.getAttribute("tasaData");
			msgCal.setH01USERID(user.getH01USR());
			msgCal.setH01PROGRM("EDL0980");
			msgCal.setH01TIMSYS(getTimeStamp());
			msgCal.setH01OPECOD("0004");
			setMessageRecord(req, msgCal);
			
			mp.sendMessage(msgCal);
			
			msgCal = (EDL098001Message) mp.receiveMessageRecord("EDL098001");

			flexLog("Putting java beans into the session");
			session.setAttribute("tasaData", msgCal);
			session.setAttribute("userPO", userPO);
			forward("EDL0980_Tasa_Equivalente.jsp", req, res);		
			
		} finally {
			if (mp != null)	mp.close();
		}
	}
}	
