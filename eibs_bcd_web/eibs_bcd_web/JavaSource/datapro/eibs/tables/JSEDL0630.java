package datapro.eibs.tables;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDL063001Message;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;

public class JSEDL0630 extends JSEIBSServlet {

	protected static final int R_INQUIRY = 100;
	protected static final int A_INQUIRY = 200;

	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch(screen) {
			case R_INQUIRY: 
				procInquiry(user, req, res, session);
				break;

			case A_INQUIRY: 
				procActionInquiry(user, req, res, session);
				break;
				
			default:
				forward(devPage, req, res);
				break;
		}
	}


	private void procInquiry(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		forward("EDL0630_float_table_enter.jsp", req, res);
		
	}

	private void procActionInquiry(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0630", req);
			EDL063001Message msgdata = (EDL063001Message) mp.getMessageRecord("EDL063001");
			msgdata.setH01USERID(user.getH01USR());
			msgdata.setH01PROGRM("EDL0630");
			msgdata.setH01TIMSYS(getTimeStamp());
			msgdata.setH01SCRCOD("01");
			msgdata.setH01OPECOD("0015");
			msgdata.setE01FRHTBL(req.getParameter("E01FRHTBL"));
			msgdata.setE01FRDTEY(req.getParameter("E01FRDTEY"));
			msgdata.setE01FRDTED(req.getParameter("E01FRDTED"));
			msgdata.setE01FRDTEM(req.getParameter("E01FRDTEM"));
			msgdata.setE01TODTEY(req.getParameter("E01TODTEY"));
			msgdata.setE01TODTEM(req.getParameter("E01TODTEM"));
			msgdata.setE01TODTED(req.getParameter("E01TODTED"));
						
			mp.sendMessage(msgdata);
			
			ELEERRMessage error = (ELEERRMessage) mp.receiveMessageRecord();
			msgdata = (EDL063001Message) mp.receiveMessageRecord();
			
			if (mp.hasError(error)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("msgdata", msgdata);
				session.setAttribute("error", error);
				forward("EDL0630_float_table_enter.jsp", req, res);
			} else {
				JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");
				session.setAttribute("msgdata", msgdata);
				session.setAttribute("userPO", userPO);
				session.setAttribute("list", list);
				forward("EDL0630_float_table.jsp", req, res);
			}

		} finally {
				mp.close();
		}
		
	
	}

}
