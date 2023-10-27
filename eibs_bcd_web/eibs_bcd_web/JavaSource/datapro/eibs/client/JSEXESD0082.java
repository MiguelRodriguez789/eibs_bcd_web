package datapro.eibs.client;

/**
 * Customer Payment Instructions
 * Creation date: (12/21/08 9:30:55 PM)
 * @author: Linet Riano
 */
import java.io.*;
import java.net.*;
import javax.servlet.*;
import javax.servlet.http.*;

import datapro.eibs.beans.*;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.*;

public class JSEXESD0082 extends JSEIBSServlet {

	protected static final int R_ENTER 		= 100;

	protected static final int A_ENTER 		= 101;
	protected static final int A_STATUS 	= 201;

	@Override
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen)
			throws ServletException,IOException {
		
		switch (screen) {
		case R_ENTER:
			procReqEnter(user, req, res, session);
			break;
		case A_ENTER:
			procActEnter(user, req, res, session);
			break;
		case A_STATUS:
			procActStatus(user, req, res, session);
			break;
		default:
			forward(devPage, req, res);
			break;
		}
	}

	private void procActStatus(ESS0030DSMessage user, 
			HttpServletRequest req,
			HttpServletResponse res, 
			HttpSession session) throws ServletException, IOException {
				
		MessageProcessor mp = null;
		
		try{
			mp = getMessageProcessor("ESD0082", req);
			ESD008201Message msg = (ESD008201Message)mp.getMessageRecord("ESD008201");
			setMessageRecord(req, msg);
			msg.setH01OPECOD("0005");
			msg.setH01USERID(user.getH01USR());
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ESD008201Message) mp.receiveMessageRecord();

			session.setAttribute("client", msg);
			if(mp.hasError(msgError)){
				session.setAttribute("error", msgError);
				forward("ESD0082_status_maint.jsp", req, res);
			} else {
				session.setAttribute("client", msg);
				forward("ESD0082_status_enter.jsp", req, res);
			}
		} finally {
			if(null != mp){
				mp.close();
			}
		}
	}

	private void procActEnter(ESS0030DSMessage user, 
			HttpServletRequest req,
			HttpServletResponse res, 
			HttpSession session) throws ServletException, IOException {
		
		MessageProcessor mp = null;
		
		try{
			mp = getMessageProcessor("ESD0082", req);
			ESD008201Message msg = (ESD008201Message)mp.getMessageRecord("ESD008201");
			setMessageRecord(req, msg);
			msg.setH01OPECOD("0002");
			msg.setH01USERID(user.getH01USR());
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ESD008201Message) mp.receiveMessageRecord();
			
			if(mp.hasError(msgError)){
				session.setAttribute("error", 	msgError);
				forward("ESD0082_status_enter.jsp", req, res);
			} else {
				session.removeAttribute("error");
				session.setAttribute("client", msg);
				forward("ESD0082_status_maint.jsp", req, res);
			}
		} finally {
			if(null != mp){
				mp.close();
			}
		}
	}

	private void procReqEnter(ESS0030DSMessage user, 
			HttpServletRequest req,
			HttpServletResponse res, 
			HttpSession session) throws ServletException, IOException {
		
		session.removeAttribute("userPO");
		session.removeAttribute("error");
		forward("ESD0082_status_enter.jsp", req, res);
	}
}