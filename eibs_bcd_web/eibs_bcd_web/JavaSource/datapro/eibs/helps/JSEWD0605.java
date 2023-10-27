// City Categories - Help 
// C. Castillo  08/15/17
// Source File Name:   JSEWD0605.java 

package datapro.eibs.helps;

import datapro.eibs.beans.*;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.CharacterField;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class JSEWD0605 extends JSEIBSServlet {
	
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
			mp = new MessageProcessor("EWD0605");				
			EWD0605DSMessage msg = (EWD0605DSMessage) mp.getMessageRecord("EWD0605DS");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			msg.setRWDUSR(user.getH01USR());
			msg.setRWDFRC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			msg.setRWDCTR((req.getParameter("ctrfilter") == null ? " " : req.getParameter("ctrfilter")));
			msg.setRWDSTE((req.getParameter("stefilter") == null ? " " : req.getParameter("stefilter")));
			msg.setRWDCTY((req.getParameter("ctyfilter") == null ? " " : req.getParameter("ctyfilter")));
			msg.setRWDCTG((req.getParameter("ctgfilter") == null ? " " : req.getParameter("ctgfilter")));
			msg.setRWDTYP((req.getParameter("typfilter") == null ? " " : req.getParameter("typfilter")));
           	
			userPO.setHeader19(msg.getRWDTYP().trim());
			userPO.setHeader20(msg.getRWDCTR().trim()); 
			userPO.setHeader21(msg.getRWDSTE().trim());
			userPO.setHeader22(msg.getRWDCTY().trim());
			userPO.setHeader23(msg.getRWDCTG().trim());
			
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			JBObjList list = (JBObjList) mp.receiveMessageRecordList("SWDOPE", "SWDREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("msgHelp", list);
			}
			forward("EWD0605_city_categories_helpmessage.jsp", req, res);

		} finally {
			if(mp != null) mp.close();
		}
	}	
}	
