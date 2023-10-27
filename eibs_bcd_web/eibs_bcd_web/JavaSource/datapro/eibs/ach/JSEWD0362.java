// ACH Help for ACH Recipients
// C. Castillo  07/03/08
// Source File Name:   JSEWD0362.java 

package datapro.eibs.ach;

import datapro.eibs.beans.*;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class JSEWD0362 extends JSEIBSServlet {
	
	protected void processRequest(ESS0030DSMessage msgUser, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {
			
		switch (screen) {
			case 1 :
				reqList(msgUser, req, res, session);
				break;
			default :
				reqList(msgUser, req, res, session);
				break;
		}
	}
     

	protected void reqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {
		
		MessageProcessor mp = null;
		UserPos userPO = null;
		try {
			mp = new MessageProcessor("EWD0362");				
			EWD0362DSMessage msg = (EWD0362DSMessage) mp.getMessageRecord("EWD0362DS");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			msg.setRWDUSR(user.getH01USR());
			try {
				msg.setRWDTYP(req.getParameter("Type"));
			} catch (Exception e) {
				msg.setRWDTYP(" ");
			}
			try {
            	msg.setRWDCUN(req.getParameter("selNew"));
            } catch (Exception e) { 
            	msg.setRWDCUN("0");
            }
            try {
				msg.setRWDSHN(req.getParameter("NameSearch"));
			} catch (Exception e) { }
			try {
				msg.setRWDFRC(req.getParameter("FromRecord"));
			} catch (Exception e) {	}
			
			userPO.setType(msg.getRWDTYP().trim());
			userPO.setHeader18(msg.getRWDCUN().trim());
			userPO.setHeader19(msg.getRWDSHN().trim());
			
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			JBObjList list = (JBObjList) mp.receiveMessageRecordList("SWDOPE", "SWDREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("msgHelp", list);
			}
			forward("EWD0362_ach_recipients_helpmessage.jsp", req, res);

		} finally {
			if(mp != null) mp.close();
		}
	}	
}	
