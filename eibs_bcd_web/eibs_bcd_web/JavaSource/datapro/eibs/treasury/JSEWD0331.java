// Treasury Help for Contracts
// C. Castillo  09/15/16
// Source File Name:   JSEWD03331.java 

package datapro.eibs.treasury;

import datapro.eibs.beans.*;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class JSEWD0331 extends JSEIBSServlet {
	
	protected void processRequest(ESS0030DSMessage msgUser, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {
			
		switch (screen) {
			case 1 :
				reqList(msgUser, req, res, session);
				break;
			default :
				forward(super.devPage, req, res);
				break;
		}
	}
     

	protected void reqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {
		
		MessageProcessor mp = null;
		UserPos userPO = null;
		try {
			mp = new MessageProcessor("EWD0331");				
			EWD0331DSMessage msg = (EWD0331DSMessage) mp.getMessageRecord("EWD0331DS");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			msg.setRWDUSR(user.getH01USR());
			msg.setRWDTYP((req.getParameter("type") == null ? "D" : req.getParameter("type")));
			msg.setSWDACC((req.getParameter("code") == null ? "0" : req.getParameter("code")));
			msg.setRWDFRC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			
			userPO.setType(msg.getRWDTYP().trim());
			userPO.setSeqNum(msg.getSWDACC().trim());
			
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			JBObjList list = (JBObjList) mp.receiveMessageRecordList("SWDOPE", "SWDREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("msgHelp", list);
			}
			forward("EWD0331_treasury_deals_helpmessage.jsp", req, res);

		} finally {
			if(mp != null) mp.close();
		}
	}	
}	
