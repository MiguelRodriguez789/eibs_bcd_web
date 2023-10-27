// Interfaces List IFS Files to Process 
// C. Castillo  10/08/14
// Source File Name:   JSECA0008.java 

package datapro.eibs.interfaces;

import datapro.eibs.beans.*;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.MessageRecord;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class JSECA0008 extends JSEIBSServlet {
	
	protected void processRequest(ESS0030DSMessage msgUser, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {
			
		switch (screen) {
			case 1 :
				reqList(msgUser, req, res, session);
				break;
			case 2 :
			case 3 :	
				prcFile(msgUser, req, res, session, screen);
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
			mp = new MessageProcessor("ECA0008");				
			ECA0008DSMessage msg = (ECA0008DSMessage) mp.getMessageRecord("ECA0008DS");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			msg.setRWDUSR(user.getH01USR());
			msg.setRWDTYP("L");
			try {
            	msg.setRWDNOI(req.getParameter("INTERFAZ"));
            } catch (Exception e) { }
           	
			try {
				msg.setRWDFRC(req.getParameter("FromRecord"));
			} catch (Exception e) {	}
			
			userPO.setType(msg.getRWDTYP().trim());
			userPO.setHeader18(msg.getRWDNOI().trim());
			
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			JBObjList list = (JBObjList) mp.receiveMessageRecordList("SWDOPE", "SWDREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("msgList", list);
			}
			forward("ECA0008_interfaces_files_list.jsp", req, res);

		} finally {
			if(mp != null) mp.close();
		}
	}	


	protected void prcFile(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses, int screen)
	throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;
		try {
			mp = new MessageProcessor("ECA0008");				
			ECA0008DSMessage msg = (ECA0008DSMessage) mp.getMessageRecord("ECA0008DS");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

			msg.setRWDUSR(user.getH01USR());
			msg.setRWDTYP("P");
			switch (screen) {
			case 2 : // Validate File
				msg.setRWDTYP("V");
				break;
			case 3 : // Process File         
				msg.setRWDTYP("P");
				break;
			default :
				forward(SuperServlet.devPage, req, res);
				break;
			}
			try {
				msg.setRWDNOI(req.getParameter("INTERFAZ"));
			} catch (Exception e) { }
	
			try { 
				msg.setSWDNAM(req.getParameter("SWDNAM"));
			} catch (Exception e) {	}

			try {
				msg.setRWDFRC(req.getParameter("FromRecord"));
			} catch (Exception e) {	}
			
			userPO.setType(msg.getRWDTYP().trim());
			userPO.setHeader18(msg.getRWDNOI().trim());
			userPO.setHeader19(msg.getRWDFRC().trim());

			mp.sendMessage(msg);
			// Receive Error Message 
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				forward("ECA0008_interfaces_files_list.jsp", req, res);
			} else {
				res.sendRedirect(srctx + "/servlet/datapro.eibs.interfaces.JSECA0008?SCREEN=1&INTERFAZ=" + userPO.getHeader18() + "&FromRecord=" + userPO.getHeader19());	
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

}	
