// Reports - Modules Help 
// C. Castillo  08/16/16
// Source File Name:   JSEWD9012.java 

package datapro.eibs.reports;

import datapro.eibs.beans.*;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class JSEWD9012 extends JSEIBSServlet {
	
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
			mp = new MessageProcessor("EWD9012");				
			EWD9012DSMessage msg = (EWD9012DSMessage) mp.getMessageRecord("EWD9012DS");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			msg.setRWDUSR(user.getH01USR());
			msg.setRWDRPT((req.getParameter("code") == null ? "" : req.getParameter("code")));
			msg.setRWDLIF((req.getParameter("lang") == null ? "" : req.getParameter("lang")));
			msg.setRWDFRC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
           	
			userPO.setType(msg.getRWDLIF().trim());
			userPO.setHeader18(msg.getRWDRPT().trim()); 
			
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			JBObjList list = (JBObjList) mp.receiveMessageRecordList("SWDOPE", "SWDREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("msgHelp", list);
			}
			forward("EWD9012_modules_helpmessage.jsp", req, res);

		} finally {
			if(mp != null) mp.close();
		}
	}	
}	
