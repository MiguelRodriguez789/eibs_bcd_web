// ACH Help for Entry Classes
// C. Castillo  07/03/08
// Source File Name:   JSEWD0361.java 

package datapro.eibs.ach;

import datapro.eibs.beans.*;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class JSEWD0361 extends JSEIBSServlet {
	
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
			mp = new MessageProcessor("EWD0361");				
			EWD0361DSMessage msg = (EWD0361DSMessage) mp.getMessageRecord("EWD0361DS");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			msg.setRWDUSR(user.getH01USR());
			try {
				msg.setRWDTYP(req.getParameter("Type"));
			} catch (Exception e) {
			}
			try {
            	msg.setSWDCDE(req.getParameter("SelNew"));
            } catch (Exception e) { }
           	
			try {
				msg.setRWDFRC(req.getParameter("FromRecord"));
			} catch (Exception e) {	}
			
			userPO.setType(msg.getRWDTYP().trim());
			userPO.setHeader18(msg.getSWDCDE().trim());
			
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			JBObjList list = (JBObjList) mp.receiveMessageRecordList("SWDOPE", "SWDREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("msgHelp", list);
			}
			forward("EWD0361_ach_classes_helpmessage.jsp", req, res);

		} finally {
			if(mp != null) mp.close();
		}
	}	
}	
