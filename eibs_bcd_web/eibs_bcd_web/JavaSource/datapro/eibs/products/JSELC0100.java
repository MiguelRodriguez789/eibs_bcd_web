/*
 * Created on Apr 7, 2008
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package datapro.eibs.products;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELC010001Message;
import datapro.eibs.beans.ELC010002Message;
import datapro.eibs.beans.ELC056001Message;
import datapro.eibs.beans.ELC056002Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.MessageContext;
import datapro.eibs.sockets.MessageContextHandler;
import datapro.eibs.sockets.MessageRecord;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSELC0100 extends SuperServlet {

	String LangPath = "s/";
	
	public JSELC0100() {
		super();
	}
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}
	
	public void destroy() {
		flexLog("free resources used by JSELC0100");
	}

	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = (HttpSession) req.getSession(false);
		if (session == null) {
			try {
				res.setContentType("text/html");
				super.printLogInAgain(res.getWriter());
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Exception ocurred. Exception = " + e);
			}
		} else {
			int screen = -1;

			ESS0030DSMessage user = (datapro.eibs.beans.ESS0030DSMessage) session.getAttribute("currUser");
			// Here we should get the path from the user profile
			LangPath = rootPath + user.getE01LAN() + "/";
			
			MessageContext mc = null;
			try {
				mc = new MessageContext(super.getMessageHandler("ELC0100", req));
						
				try {
					screen = Integer.parseInt(req.getParameter("SCREEN"));
					flexLog("Screen  Number: " + screen);
				} catch (Exception e) {
					flexLog("Screen set to default value");
				}
				
				String PageToCall = "";

				switch (screen) {
					case 3 : // ENTER / CALL LIST (from side menu)
					case 6 : // ENTER / CALL LIST (from maintenance help)
						requestList(mc, user, req, res, screen);
						break;
					case 5 : // Call basic page from List
						requestNegotiation(mc, user, req, res, screen);
						break;
					case 8 : // Call basic page from optMenu
						requestNegotiation(mc, user, req, res, screen);
						break;
					case 7 : // Call confirmation page from optMenu
						requestConfirmation(mc, user, req, res, screen);
						break;
					case 2 :
						requestAction(mc, user, req, res, screen);
						break;
					default :
						PageToCall = "MISC_not_available.jsp";
						callPage(PageToCall, req, res);
						break;
				}

			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				res.sendRedirect(srctx + LangPath + sckNotRespondPage);
			} finally {
				if (mc != null) mc.close();
				flexLog("Socket used by JSELC0100 closed.");
			}
		}	
	}			

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void requestAction(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos  userPO = getUserPos(req);
		String PageToCall = "";
		try {
			switch (screen) {
				case 3: PageToCall = "ELC0100_lc_nego_apr_list.jsp"; break;
				case 6: PageToCall = "ELC0100_lc_nego_help_list.jsp"; break;
			}
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC010002Message msg02 = (ELC010002Message) msgHandle.initMessage("ELC010002", user.getH01USR(), "0002");
			initTransaction(userPO, String.valueOf(screen), "");
			msgHandle.setFieldsFromPage(req, msg02);
			msgHandle.sendMessage(msg02);
			MessageRecord newmsg = msgHandle.receiveMessage();
			ELEERRMessage msgError = new ELEERRMessage(); 
			if (newmsg.getFormatName().equals("ELEERRMessage")) {
				msgError = (ELEERRMessage) newmsg;
				session.setAttribute("error", msgError);
				callPage(PageToCall, req, res);
			} else {
				requestList(mc, user, req, res, 3); //Request Approval List
			}
			
			
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void requestConfirmation(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos  userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC056002Message msgCon = (ELC056002Message) msgHandle.initMessage("ELC056002", user.getH01USR(), "0004");
			initTransaction(userPO, String.valueOf(screen), "");
			msgCon.setE02LCRNUM(userPO.getAccNum());
			msgCon.setE02DRWNUM(userPO.getSeqNum());
			msgHandle.sendMessage(msgCon);
			//msgError = msgHandle.receiveErrorMessage();
			//boolean isNotError = msgError.getERRNUM().equals("0");
			//msgCon = (ELC056002Message) msgHandle.receiveMessage();
			MessageRecord newmsg = msgHandle.receiveMessage();
			ELEERRMessage msgError = new ELEERRMessage(); 
			if (newmsg.getFormatName().equals("ELEERRMessage")) {
				msgError = (ELEERRMessage) newmsg;
				PageToCall = "ELC0100_lc_nego_apr_list.jsp";
			} else {
				msgCon = (ELC056002Message) newmsg;
				PageToCall = "ELC0100_lc_nego_view_conf.jsp";
			}
			putDataInSession(session, userPO, msgError, "msg", msgCon, null);
			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void requestNegotiation(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos  userPO = getUserPos(req);
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC056001Message msgInq = (ELC056001Message) msgHandle.initMessage("ELC056001", user.getH01USR(), "0004");
			initTransaction(userPO, String.valueOf(screen), "VIEW");
			try {
				msgInq.setE01LCRNUM(req.getParameter("E02LCRNUM").trim());
				userPO.setAccNum(req.getParameter("E02LCRNUM"));
			} catch (Exception e) {
				msgInq.setE01LCRNUM(userPO.getAccNum());
			}
			try {
				msgInq.setE01DRWNUM(req.getParameter("E02DRWNUM"));
				userPO.setSeqNum(msgInq.getE01DRWNUM());
			} catch (Exception e) {
				msgInq.setE01DRWNUM(userPO.getSeqNum());
			}
			msgHandle.sendMessage(msgInq);
			//msgError = msgHandle.receiveErrorMessage();
			//boolean isNotError = msgError.getERRNUM().equals("0");
			msgInq = (ELC056001Message) msgHandle.receiveMessage();
			String PageToCall = "";
			int opcode; 
			try {
				opcode = Integer.parseInt(msgInq.getE01OPCODE().trim());
			} catch (Exception e) {
				opcode = 0;
			}
			switch (opcode)	{
				case 1:
				case 6: PageToCall = "ELC0560_lc_nego_sp_readonly.jsp"; break;
				case 2:
				case 4: PageToCall = "ELC0560_lc_nego_acp_readonly.jsp"; break;
				case 9: PageToCall = "ELC0560_lc_nego_com_readonly.jsp"; break;
				case 3:
				case 5: PageToCall = "ELC0560_lc_nego_ref_readonly.jsp"; break;
				default: break;
			}
			userPO.setAccNum(msgInq.getE01LCRNUM());
			userPO.setSeqNum(msgInq.getE01DRWNUM());
			putDataInSession(session, userPO, null, "msg01", msgInq, null);
			if (screen == 5) {
				requestList(mc, user, req, res, screen);
			} else {
				callPage(PageToCall, req, res);
			}
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void requestList(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos  userPO = getUserPos(req);
		String PageToCall = "MISC_not_available.jsp";
		switch (screen) {
			case 3: PageToCall = "ELC0100_lc_nego_apr_list.jsp"; break;
			case 6: PageToCall = "ELC0100_lc_nego_help_list.jsp"; break;
		}
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC010001Message msg01 = (ELC010001Message) msgHandle.initMessage("ELC010001", user.getH01USR(), "0015");
			initTransaction(userPO, String.valueOf(screen), "");
			msgHandle.sendMessage(msg01);
			ELEERRMessage msgError = new ELEERRMessage(); 
			JBObjList jbList = msgHandle.receiveMessageList("ELC010001", "H01FLGMAS", msgError);
			putDataInSession(session, userPO, msgError, "", null, jbList);
			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	private void initTransaction(UserPos userPO, String optMenu, String purpose) {
		if (!optMenu.equals("")) userPO.setOption(optMenu);
		if (!purpose.equals("")) userPO.setPurpose(purpose);
	}
	
	public void callPage(String page, HttpServletRequest req, HttpServletResponse res) {
		try {
			super.callPage(LangPath + page, req, res);
		} catch (Exception e) {
			flexLog("Exception calling page " + e.toString() + e.getMessage());
		}
		return; 
	}
	
	private void putDataInSession(HttpSession session, UserPos userPO, ELEERRMessage msgError, String msg_name, MessageRecord msg, JBObjList jbList) {
			flexLog("Putting java beans into the session");
        
		if (msgError == null) {
			msgError = new ELEERRMessage(); 
		}
		session.setAttribute("error", msgError);
		session.setAttribute("userPO", userPO);
		if (msg != null) session.setAttribute(msg_name, msg);
		if (jbList != null) session.setAttribute("jbList", jbList);
	}


}
