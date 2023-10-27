package datapro.eibs.products;

/**
 * Insert the type's description here.
 * Creation date: (8/28/2000 4:02:17 PM)
 * @author: Orestes Garcia
**/

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


import datapro.eibs.beans.*;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;

import datapro.eibs.sockets.*;

public class JSERC0065 extends JSEIBSServlet {

	protected static final int RECONC_BANC 	= 100;  //procActReport 
	protected static final int GENER_REPORT = 200;  //ProcGenRepo

	@Override
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen)
					throws ServletException, IOException {

			switch (screen) {
				case RECONC_BANC :
					procActReport(user, req, res, session);
					break;
				case GENER_REPORT :
					ProcGenRepo(user, req, res, session);
					break; 
				default :
					forward(devPage, req, res);
					break;
		}
	}
	
	protected void procActReport(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {
		forward("ERC0065_rcbank_enter_selection.jsp", req, res);
	}
	
	
	protected void ProcGenRepo( ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {
		
		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		ERC006501Message msgList = null;
		ELEERRMessage msgError = null;

		// Send Initial data
		try {
			mp = getMessageProcessor("ERC0065", req);
			msgList = (ERC006501Message) mp.getMessageRecord("ERC006501");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ERC0065");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0015");
			msgList.setE01BRMEID(Util.getReqParameter("E01BRMEID", req));
			msgList.setE01BRMCTA(Util.getReqParameter("E01BRMCTA", req));
			
			mp.sendMessage(msgList);

			newmessage = mp.receiveMessageRecord();
			if (newmessage instanceof ELEERRMessage) {
				msgError = (ELEERRMessage) newmessage;
				ses.setAttribute("error", msgError);
				forward("ERC0065_rcbank_enter_selection.jsp", req, res);
			}
		} finally {
			if(null != mp){
				mp.close();
			}
		}
	}
}