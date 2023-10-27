package datapro.eibs.bolgaran;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELC556001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSELC5560 extends JSEIBSServlet {

	// Request 
	protected static final int R_PAY_CANCEL			= 100;
	protected static final int R_ENTER				= 200;
	
	// actions
	protected static final int A_PAY_CANCEL			= 3;
	protected static final int A_ENTER				= 2;
	
	protected static final int R_PASSWORD 			= 1;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case R_PASSWORD :
				 procReqPassword(req, res, session);
				 break;				
			case R_ENTER :
				 procReqEnter(user , req, res, session);
			     break;					
			case A_ENTER :
				 procActionEnter(user , req, res, session);
			     break; 
			case A_PAY_CANCEL :				     
				 procActionPayCancel(user , req, res, session);
				 break;
			default :
				forward("MISC_not_available.jsp", req, res);
				break;
		}
	}

	private void procActionPayCancel(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC5560", req);
			ELC556001Message msgBol = (ELC556001Message) mp.getMessageRecord("ELC556001", user.getH01USR(), "0005");
			msgBol.setH01SCRCOD("01");
			
			setMessageRecord(req, msgBol);
			
			mp.sendMessage(msgBol);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgBol = (ELC556001Message) mp.receiveMessageRecord("ELC556001");
			
			if (mp.hasError(msgError)) {
				pageName = "ELC5560_bg_paycancel.jsp";
			} else {
				pageName = "ELC5560_bg_enter_paycancel.jsp";
			}
			session.setAttribute("error", msgError);
			session.setAttribute("bolgaran", msgBol);
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActionEnter(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		if (req.getParameter("E01LCMACC") != null) {
			userPO.setIdentifier(req.getParameter("E01LCMACC"));
		}
		session.setAttribute("userPO", userPO);
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC5560", req);
			ELC556001Message msgBol = (ELC556001Message) mp.getMessageRecord("ELC556001", user.getH01USR(), "0002");
		 	msgBol.setH01SCRCOD("01");
		 	msgBol.setE01LCMACD("43");		
			msgBol.setE01LCMACC(userPO.getIdentifier().trim());
			msgBol.setE01TYPOPE(req.getParameter("OPT") == null ? "1" : req.getParameter("OPT"));
			
			mp.sendMessage(msgBol);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgBol = (ELC556001Message) mp.receiveMessageRecord("ELC556001");
			
			if (mp.hasError(msgError)) {
				if (userPO.getPurpose().equals("APPROVAL_INQ")) {
					pageName = "error_viewer.jsp";
				} else {
					pageName = "ELC5560_bg_enter_paycancel.jsp";
				}
			} else {
				if (userPO.getPurpose().equals("APPROVAL_INQ")) {
					pageName = "ELC5560_bg_app_paycancel.jsp";
				} else {
					pageName = "ELC5560_bg_paycancel.jsp";
				}
			}
			
			session.setAttribute("bolgaran", msgBol);
			session.setAttribute("error", msgError);
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procReqEnter(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos	userPO = new UserPos();
		ELC556001Message msgBol = new ELC556001Message();
		userPO.setPurpose("MAINTENANCE");
		userPO.setOption("0");
		session.setAttribute("bolgaran", msgBol);
		session.setAttribute("userPO", userPO);
		
		forward("ELC5560_bg_enter_paycancel.jsp", req, res);
	}

	private void procReqPassword(HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos	userPO = getUserPos(req);
		userPO.setRedirect("/servlet/datapro.eibs.bolgaran.JSELC5560?SCREEN=" + R_ENTER + (req.getParameter("ACCNUM") == null ? "" : "&ACCNUM=" + req.getParameter("ACCNUM")));
		session.setAttribute("userPO", userPO);
		res.sendRedirect(srctx +"/servlet/datapro.eibs.menu.JSESS0030?SCREEN=7");
	}

}
