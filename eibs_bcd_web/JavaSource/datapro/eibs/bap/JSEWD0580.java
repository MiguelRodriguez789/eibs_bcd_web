// BP Help for Source Documents
// M. Riaño  04/27/2011
// Source File Name:   JSEWD0580.java 

package datapro.eibs.bap;

import datapro.eibs.beans.*;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class JSEWD0580 extends JSEIBSServlet {
	
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
			mp = new MessageProcessor("EWD0580");				
			EWD0580DSMessage msg = (EWD0580DSMessage) mp.getMessageRecord("EWD0580DS");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			msg.setEWDUSR(user.getH01USR());
			try {
				msg.setEWDSTYP(req.getParameter("Type"));
			} catch (Exception e) {
			}
			try {
            	msg.setEWDNUM(req.getParameter("SelNew"));
            } catch (Exception e) { }
           	
			try {
				msg.setEWDFRC(req.getParameter("FromRecord"));
			} catch (Exception e) {	}
			
			userPO.setType(msg.getEWDSTYP().trim());
			userPO.setHeader18(msg.getEWDNUM().trim());
			
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			JBObjList list = (JBObjList) mp.receiveMessageRecordList("EWDOPE", "EWDREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("msgHelp", list);
			}
			forward("EWD0580_bp_source_document_help.jsp", req, res);

		} finally {
			if(mp != null) mp.close();
		}
	}	
}	
