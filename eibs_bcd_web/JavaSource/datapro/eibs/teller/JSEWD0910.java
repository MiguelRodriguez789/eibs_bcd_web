// Level IBSbranch Users Help 
// L. Ria�o  03/21/18
// Source File Name:   JSEWD0910.java 

package datapro.eibs.teller;

import datapro.eibs.beans.*;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class JSEWD0910 extends JSEIBSServlet {
	
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
			mp = new MessageProcessor("EWD0910");				
			EWD0910DSMessage msg = (EWD0910DSMessage) mp.getMessageRecord("EWD0910DS");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			msg.setRWDUSR(user.getH01USR());
			try {
				msg.setRWDTYP(req.getParameter("type"));
			} catch (Exception e) {
			}
			try {
            	msg.setSWDLEV(req.getParameter("SelNew"));
            } catch (Exception e) { }
           	
			try {
				msg.setRWDFRC(req.getParameter("FromRecord"));
			} catch (Exception e) {	}
			
			userPO.setType(msg.getRWDTYP().trim());
			userPO.setHeader18(msg.getSWDLEV().trim());
			
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			JBObjList list = (JBObjList) mp.receiveMessageRecordList("SWDOPE", "SWDREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("msgHelp", list);
			}
			forward("EWD0910_level_helpmessage.jsp", req, res);

		} finally {
			if(mp != null) mp.close();
		}
	}	
}	
