/*
 * Created on Apr 7, 2008
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package datapro.eibs.products;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELC056001Message;
import datapro.eibs.beans.ELC056002Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.MessageContext;
import datapro.eibs.sockets.MessageContextHandler;
import datapro.eibs.sockets.MessageField;
import datapro.eibs.sockets.MessageRecord;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSELC0560 extends SuperServlet {

	String LangPath = "s/";
	
	public JSELC0560() {
		super();
	}
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
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
				mc = new MessageContext(super.getMessageHandler("ELC0560", req));
						
				try {
					screen = Integer.parseInt(req.getParameter("SCREEN"));
					flexLog("Screen  Number: " + screen);
				} catch (Exception e) {
					flexLog("Screen set to default value");
				}
				
				String PageToCall = "";

				switch (screen)	{
					case 1 : // LC NEGO ENTER NEW
						procNewNegotiation(user, req, res, screen);
						break;
					case 5 : // LC NEGO ENTER MAINT
						procMaintNegotiation(user, req, res, screen);
						break;
					case 2 : // LC NEGO ENTER NEW/MAINT SUBMIT
						requestNegotiation(mc, user, req, res, screen);
						break;
					case 3 : // submit sp, acp, or ref page
						requestReferencePage(mc, user, req, res, screen);
						break;
					case 8 : // SUBMIT CONFIRMATION PAGE
						requestConfirmationPage(mc, user, req, res, screen);
						break;
					case 9 : // SUBMIT CONFIRMATION PAGE
						requestConfirmation(mc, user, req, res, screen);
						break;
					case 10 :
						requestApprovalInquiry(mc, user, req, res, screen);
						break;
					case 11 :
						requestInquiry(mc, user, req, res, screen);
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
				mc.close();
				flexLog("Socket used by JSELC0560 closed.");
			}
		}	
	}	
	
	
	/**
	 * @param req
	 * @param res
	 * @param screen
	 */
	protected void procNewNegotiation(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		initTransaction(userPO, user, String.valueOf(screen), "NEW", "");
		String PageToCall = "ELC0560_lc_nego_enter.jsp";
		userPO.setPrevPage(PageToCall);
		userPO.setRedirect(srctx + "/servlet/datapro.eibs.products.JSELC0560");
		putDataInSession(session, userPO, null);	
		callPage(PageToCall, req, res);
	}	
	
	/**
	 * @param req
	 * @param res
	 * @param screen
	 */
	protected void procMaintNegotiation(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		initTransaction(userPO, user, String.valueOf(screen), "MAINTENANCE", "");
		String PageToCall = "ELC0560_lc_nego_enter_maint.jsp";
		userPO.setPrevPage(PageToCall);
		putDataInSession(session, userPO, null);	
		callPage(PageToCall, req, res);
	}	
	
	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	protected void requestInquiry(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC056001Message msg01 = (ELC056001Message) mc.getMessageRecord("ELC056001");
			msg01.setH01USERID(user.getH01USR());
			msg01.setH01OPECOD("0002");
			try	{
				msg01.setE01LCRNUM(req.getParameter("E01LCRNUM"));
			} catch (Exception e) {
			}
			try	{
				msg01.setE01DRWNUM(req.getParameter("E01DRWNUM"));
			} catch (Exception e) {
			}
			initTransaction(userPO, user, String.valueOf(screen), "", msg01.getE01LCRNUM());
			msgHandle.sendMessage(msg01);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg01 = (ELC056001Message) msgHandle.receiveMessage();
			String PageToCall = "";
			int opcode; 
			try {
				opcode = Integer.parseInt(msg01.getE01OPCODE().trim());
			} catch (Exception e) {
				opcode = 0;
			}
			switch (opcode)	{
				case 1:
				case 6: PageToCall = "ELC0560_lc_nego_sp_readonly.jsp"; break;
				case 2:
				case 4: PageToCall = "ELC0560_lc_nego_acp_readonly.jsp"; break;
				case 9: PageToCall = "ELC0560_lc_nego_com_readonly.jsp"; break;
				default: PageToCall = "ELC0560_lc_nego_ref_readonly.jsp"; break;
			}
			userPO.setNextPage(PageToCall);
			putDataInSession(session, userPO, msgError);	
			session.setAttribute("msg01", msg01);
			callPage(isNotError ? userPO.getNextPage() : userPO.getPrevPage(), req, res);
		
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
	protected void requestConfirmationPage(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC056001Message msg01 = (ELC056001Message) session.getAttribute("msg01");
			msg01.setH01USERID(user.getH01USR());
			if (msg01 == null) {
				msg01 = (ELC056001Message) mc.getMessageRecord("ELC056001");
			}
			try	{
				msg01.setE01LCRNUM(req.getParameter("E01LCRNUM"));
			} catch (Exception e) {
			}
			initTransaction(userPO, user, String.valueOf(screen), "", msg01.getE01LCRNUM());
			String PageToCall = "";
			ELEERRMessage msgError = null;
			if (req.getParameter("H01FLGWK1").equals("Y")) {
				msg01.setH01FLGWK1(req.getParameter("H01FLGWK1"));
				msgHandle.sendMessage(msg01);
				msgError = msgHandle.receiveErrorMessage();
				msg01 = (ELC056001Message) msgHandle.receiveMessage();
				if (msg01.getE01PMTVIA().equals("5")) {
					res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSEPR0000?SCREEN=0003&REFNUM=" + msg01.getE01TRFNUM());
					return;
				} else {
					if (userPO.getPurpose().equals("MAINTENANCE")) {
						PageToCall = "ELC0560_lc_nego_enter_maint.jsp";
					} else {
						res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSELC0560?SCREEN=1");//"ELC0560_lc_nego_enter.jsp";
						return;
					}
				}
			} else {
				int opcode; 
				try {
					opcode = Integer.parseInt(msg01.getE01OPCODE().trim());
				} catch (Exception e) {
					opcode = 0;
				}
				switch (opcode)	{
					case 1:
					case 6: PageToCall = "ELC0560_lc_nego_sp.jsp"; break;
					case 2:
					case 4: PageToCall = "ELC0560_lc_nego_acp.jsp"; break;
					case 9: PageToCall = "ELC0560_lc_nego_com.jsp"; break;
					default: PageToCall = "ELC0560_lc_nego_ref.jsp"; break;
				}
			}
			putDataInSession(session, userPO, msgError);	
			session.setAttribute("msg01", msg01);
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
	protected void requestReferencePage(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC056001Message msg01 = (ELC056001Message) session.getAttribute("msg01");
			if (msg01 == null) {
				msg01 = (ELC056001Message) mc.getMessageRecord("ELC056001");
			}
			msg01.setH01USERID(user.getH01USR());
			msg01.setH01FLGWK1("N");
			initTransaction(userPO, user, String.valueOf(screen), "", msg01.getE01LCRNUM());
			setFieldsFromPage(req, msg01);
			msgHandle.sendMessage(msg01);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg01 = (ELC056001Message) msgHandle.receiveMessage();
			ELC056002Message msg02 = null;
			if (isNotError) {
				msg02 = (ELC056002Message) msgHandle.receiveMessage();
			}
			endTransaction(userPO, msgError, msg01);
			putDataInSession(session, userPO, msgError);	
			session.setAttribute("msg01", msg01);
			session.setAttribute("msg02", msg02);
			callPage(isNotError ? userPO.getNextPage() : userPO.getPrevPage(), req, res);
			
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}
	
	public void setFieldsFromPage(HttpServletRequest request, MessageRecord message) throws Exception {
		// all the fields here
		Enumeration enu = message.fieldEnumeration();
		MessageField field = null;
		String value = "";
		String name = "";
		while (enu.hasMoreElements()) {
			try {
				field = (MessageField) enu.nextElement();
				name = field.getTag();
				try {
					value = request.getParameter(name).toUpperCase();
				} catch (Exception e) {
					value = null;
				}
				if (value != null) {
					field.setString(value);
				}
			} catch (Exception e) {
				if(name.compareTo("SCREEN")==0){
					continue;
				}
				//*throw new Exception("Exception get value from "  + name + " " + e.toString() + e.getMessage());
			}
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	protected void requestNegotiation(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC056001Message msg01 = (ELC056001Message) session.getAttribute("msg01");
			if (msg01 == null) {
				msg01 = (ELC056001Message) mc.getMessageRecord("ELC056001");
			}
			msg01.setH01USERID(user.getH01USR());

			initTransaction(userPO, user, String.valueOf(screen), "", msg01.getE01LCRNUM());
			msgHandle.setFieldsFromPage(req, msg01);
			msgHandle.sendMessage(msg01);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg01 = (ELC056001Message) msgHandle.receiveMessage();
			endTransaction(userPO, msgError, msg01);

			// decide between which page to call
			String PageToCall = "";
			
			int code = 0;
			try {
				code = Integer.parseInt(msg01.getE01OPCODE().trim());
			} catch (Exception e) {
			}
			
			switch (code)	{
				case 1:
				case 6: PageToCall = "ELC0560_lc_nego_sp.jsp"; break;
				case 2:
				case 4: PageToCall = "ELC0560_lc_nego_acp.jsp"; break;
				case 9: PageToCall = "ELC0560_lc_nego_com.jsp"; break;
				default: PageToCall = "ELC0560_lc_nego_ref.jsp"; break;
			}
			userPO.setNextPage(PageToCall);
			putDataInSession(session, userPO, msgError);	
			session.setAttribute("msg01", msg01);
			callPage(isNotError ? userPO.getNextPage() : userPO.getPrevPage(), req, res);
			
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
			msgCon.setE02LCRNUM(userPO.getAccNum());
			msgCon.setE02DRWNUM(userPO.getSeqNum());
			initTransaction(userPO, user, String.valueOf(screen), "", msgCon.getE02LCRNUM());
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
				PageToCall = "ELC0560_lc_nego_view_conf.jsp";
			}
			session.setAttribute("msg", msgCon);
			putDataInSession(session, userPO, msgError);
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
	private void requestApprovalInquiry(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos  userPO = getUserPos(req);
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC056001Message msgInq = (ELC056001Message) msgHandle.initMessage("ELC056001", user.getH01USR(), "0004");
			try {
				msgInq.setE01LCRNUM(req.getParameter("E02LCRNUM").trim());
			} catch (Exception e) {
				msgInq.setE01LCRNUM(userPO.getAccNum());
			}
			try {
				msgInq.setE01DRWNUM(req.getParameter("E02DRWNUM"));
			} catch (Exception e) {
				msgInq.setE01DRWNUM(userPO.getSeqNum());
			}
			userPO.setAccNum(msgInq.getE01LCRNUM());
			userPO.setSeqNum(msgInq.getE01DRWNUM());
			initTransaction(userPO, user, String.valueOf(screen), "VIEW", msgInq.getE01LCRNUM());
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
			session.setAttribute("msg01", msgInq);
			putDataInSession(session, userPO, null);
			if ("".equals(PageToCall)) {
				res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSELC0100?SCREEN=3");
			} else {
				callPage(PageToCall, req, res);
			}
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	protected void initTransaction(UserPos userPO, ESS0030DSMessage user, String optMenu, String purpose, String number) {
		if (!optMenu.equals("")) userPO.setOption(optMenu);
		if (!purpose.equals("")) userPO.setPurpose(purpose);
		userPO.setHeader1(user.getE01INT());
		if (!number.equals(""))	userPO.setAccNum(number);
	}
	
	protected void endTransaction(UserPos userPO, ELEERRMessage msgError, MessageRecord msg) {
		userPO.setHeader18(msg.toString());
		userPO.setHeader19(msgError.toString());
		userPO.setHeader20(msg.toString());
	}
	
	public void callPage(String page, HttpServletRequest req, HttpServletResponse res) {
		try {
			super.callPage(LangPath + page, req, res);
		} catch (Exception e) {
			flexLog("Exception calling page " + e.toString() + e.getMessage());
		}
		return; 
	}
	
	protected void putDataInSession(HttpSession session, UserPos userPO, ELEERRMessage msgError) {
		flexLog("Putting java beans into the session");

		if (msgError == null) {
			msgError = new ELEERRMessage(); 
		}
		session.setAttribute("error", msgError);
		session.setAttribute("userPO", userPO);
	}

}
