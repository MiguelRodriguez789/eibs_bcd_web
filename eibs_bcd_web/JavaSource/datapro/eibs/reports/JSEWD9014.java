// Reports - Web menus Help 
// C. Castillo  04/21/17
// Source File Name:   JSEWD9014.java 

package datapro.eibs.reports;

import datapro.eibs.beans.*;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.CharacterField;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class JSEWD9014 extends JSEIBSServlet {
	
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
			mp = new MessageProcessor("EWD9014");				
			EWD9014DSMessage msg = (EWD9014DSMessage) mp.getMessageRecord("EWD9014DS");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			msg.setRWDUSR(user.getH01USR());
			try {
				((CharacterField) msg.getField("RWDID")).setStringUD(req.getParameter("code"));  // Get without change lower case and special characters
			} catch (Exception e) {
				msg.setRWDID("");
			}	
			msg.setRWDFRC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
           	
			userPO.setHeader18(msg.getRWDID().trim()); 
			
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			JBObjList list = (JBObjList) mp.receiveMessageRecordList("SWDOPE", "SWDREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("msgHelp", list);
			}
			forward("EWD9014_webmm_helpmessage.jsp", req, res);

		} finally {
			if(mp != null) mp.close();
		}
	}	
}	
