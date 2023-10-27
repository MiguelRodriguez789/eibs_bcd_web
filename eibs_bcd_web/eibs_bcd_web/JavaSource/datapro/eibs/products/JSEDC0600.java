package datapro.eibs.products;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDC060001Message;
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

public class JSEDC0600 extends SuperServlet {

	String LangPath = "s/";

	static final int R_ENTER = 1;
	static final int R_LIST = 2;
	static final int A_LIST = 3;
	static final int A_MAINT = 4;
	static final int A_DELETE = 9;
	static final int R_CUST_ENTER = 5;
	static final int R_CUST_LIST = 6;
	static final int A_CUST_LIST = 7;
	static final int A_CUST_MAINT = 8;
	static final int A_CUST_DELETE = 10;

	public JSEDC0600() {
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
				mc = new MessageContext(super.getMessageHandler("EDC0600", req));
						
				try {
					screen = Integer.parseInt(req.getParameter("SCREEN"));
					flexLog("Screen  Number: " + screen);
				} catch (Exception e) {
					flexLog("Screen set to default value");
				}
				
				String PageToCall = "";

				switch (screen)	{
					case R_ENTER: // '\001'
						procReqEnterBank(req, res, screen);
						break;
					case R_LIST: // '\002'
						procReqList(mc, user, req, res, screen);
						break;
					case A_LIST: // '\003'
						procActionList(mc, user, req, res, screen);
						break;
					case A_MAINT: // '\004'
						procActionMaintenance(mc, user, req, res, screen);
						break;
					case R_CUST_ENTER: // '\005'
						procReqCustEnterBank(req, res, screen);
						break;
					case R_CUST_LIST: // '\006'
						procReqCustList(mc, user, req, res, screen);
						break;
					case A_CUST_LIST: // '\007'
						procActionCustList(mc, user, req, res, screen);
						break;
					case A_CUST_MAINT: // '\008'
						procActionCustMaintenance(mc, user, req, res, screen);
						break;
					case A_DELETE: // '\009'
						procActionDelete(mc, user, req, res, screen);
						break;
					case A_CUST_DELETE: // '\010'
						procActionCustDelete(mc, user, req, res, screen);
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
				flexLog("Socket used by JSEDC0600 closed.");
			}
		}	
	}	

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void procActionCustDelete(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			EDC060001Message msg = (EDC060001Message) mc.getMessageRecord("EDC060001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0009");
			msg.setH01SCRCOD("01");
			msg.setH01FLGWK1("2");

			setMessageField(msg, "E01RCOBNK", req.getParameter("BNK"));
			setMessageField(msg, "E01RCOATY", req.getParameter("ATY"));
			setMessageField(msg, "E01RCOTBL", req.getParameter("STN"));
			setMessageField(msg, "E01RCOCUN", req.getParameter("CUN"));
			
			initTransaction(userPO, String.valueOf(screen), "D");
			msgHandle.sendMessage(msg);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			putDataInSession(session, userPO, msgError, null, null, null);
			procReqCustList(mc, user, req, res, screen);
		
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
	private void procActionDelete(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			EDC060001Message msg = (EDC060001Message) mc.getMessageRecord("EDC060001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0009");
			msg.setH01SCRCOD("01");
			msg.setH01FLGWK1("1");
			
			setMessageField(msg, "E01RCOBNK", req.getParameter("BNK"));
			setMessageField(msg, "E01RCOATY", req.getParameter("ATY"));
			setMessageField(msg, "E01RCOTBL", req.getParameter("STN"));
			setMessageField(msg, "E01RCOCUN", req.getParameter("CUN"));

			initTransaction(userPO, String.valueOf(screen), "D");
			msgHandle.sendMessage(msg);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			putDataInSession(session, userPO, msgError, null, null, null);
			procReqList(mc, user, req, res, screen);
		
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
	private void procActionCustMaintenance(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			EDC060001Message msg = (EDC060001Message) mc.getMessageRecord("EDC060001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0005");
			msg.setH01SCRCOD("01");
			msg.setH01FLGWK1("2");
			String opt = req.getParameter("OPT");
			initTransaction(userPO, String.valueOf(screen), opt);
			msgHandle.setFieldsFromPage(req, msg);
			msgHandle.sendMessage(msg);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg = (EDC060001Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "sc", msg, null);
			if (isNotError) {
				procReqCustList(mc, user, req, res, screen);
			} else {	
				String PageToCall = "EDC0600_sc_cust_basic.jsp";
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
	private void procActionCustList(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			EDC060001Message msg = (EDC060001Message) mc.getMessageRecord("EDC060001");
			msg.setH01USERID(user.getH01USR());
			String opt = req.getParameter("opt");
			if ("N".equals(opt)) {
				msg.setH01OPECOD("0001");
				setMessageField(msg, "E01RCOBNK", req.getParameter("NEWBNK"));
				setMessageField(msg, "E01RCOTBL", req.getParameter("NEWSTN"));
				setMessageField(msg, "E01RCOCUN", req.getParameter("NEWCUN"));
			} else {
				msg.setH01OPECOD("0002");
				setMessageField(msg, "E01RCOBNK", req.getParameter("BNK"));
				setMessageField(msg, "E01RCOATY", req.getParameter("ATY"));
				setMessageField(msg, "E01RCOTBL", req.getParameter("STN"));
				setMessageField(msg, "E01RCOCUN", req.getParameter("CUN"));
			}
			msg.setH01SCRCOD("01");
			msg.setH01FLGWK1("2");
			initTransaction(userPO, String.valueOf(screen), opt);
			msgHandle.sendMessage(msg);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg = (EDC060001Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "sc", msg, null);
			String PageToCall = "EDC0600_sc_cust_list.jsp";
			if (isNotError) {
				PageToCall = "EDC0600_sc_cust_basic.jsp";
			}	
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
	private void procReqCustList(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			EDC060001Message msg = (EDC060001Message) mc.getMessageRecord("EDC060001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0015");
			msg.setH01SCRCOD("01");
			msg.setH01FLGWK1("2");
			try {
				msg.setE01RCOBNK(req.getParameter("E01RCOBNK"));
			} catch(Exception e) {
				msg.setE01RCOBNK(req.getParameter("BNK"));
			}
			try {
				msg.setE01RCOCUN(req.getParameter("E01RCOCUN"));
			} catch(Exception e) {
				msg.setE01RCOCUN(req.getParameter("CUN"));
			}
			initTransaction(userPO, String.valueOf(screen), "M");
			msgHandle.sendMessage(msg);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			JBObjList jbList = msgHandle.receiveMessageList("E01INDOPE");
			putDataInSession(session, userPO, msgError, null, null, jbList);
			String PageToCall = "MISC_not_available.jsp";
			if (isNotError) {
				PageToCall = "EDC0600_sc_cust_list.jsp";
			} else {
				PageToCall = "EDC0600_sc_cust_enter_selection.jsp";
			}
			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 */
	private void procReqCustEnterBank(HttpServletRequest req, HttpServletResponse res, int screen) throws IOException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = new UserPos();
		
		String PageToCall = "EDC0600_sc_cust_enter_selection.jsp";
		initTransaction(userPO, String.valueOf(screen), "M");
		putDataInSession(session, userPO, null, null, null, null);
		callPage(PageToCall, req, res);
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void procActionMaintenance(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			EDC060001Message msg = (EDC060001Message) mc.getMessageRecord("EDC060001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0005");
			msg.setH01SCRCOD("01");
			msg.setH01FLGWK1("1");
			String opt = req.getParameter("OPT");
			initTransaction(userPO, String.valueOf(screen), opt);
			msgHandle.setFieldsFromPage(req, msg);
			msgHandle.sendMessage(msg);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg = (EDC060001Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "sc", msg, null);
			if (isNotError) {
				procReqList(mc, user, req, res, screen);
			} else {	
				String PageToCall = "EDC0600_sc_basic.jsp";
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
	private void procActionList(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			EDC060001Message msg = (EDC060001Message) mc.getMessageRecord("EDC060001");
			msg.setH01USERID(user.getH01USR());
			String opt = req.getParameter("opt");
			if (opt.equals("N")) {
				msg.setH01OPECOD("0001");
				try {
					msg.setE01RCOBNK(req.getParameter("NEWBNK"));
				} catch(Exception e) { 
				}
				try {
					msg.setE01RCOTBL(req.getParameter("NEWSTN"));
				} catch(Exception e) { 
				}
				try {
					msg.setE01RCOATY(req.getParameter("NEWATY"));
				} catch(Exception e) { 
				}
			} else {
				msg.setH01OPECOD("0002");
				setMessageField(msg, "E01RCOBNK", req.getParameter("BNK"));
				setMessageField(msg, "E01RCOATY", req.getParameter("ATY"));
				setMessageField(msg, "E01RCOTBL", req.getParameter("STN"));
				setMessageField(msg, "E01RCOCUN", req.getParameter("CUN"));
			}
			msg.setH01SCRCOD("01");
			msg.setH01FLGWK1("1");
			initTransaction(userPO, String.valueOf(screen), opt);
			msgHandle.sendMessage(msg);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg = (EDC060001Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "sc", msg, null);
			String PageToCall = "EDC0600_sc_list.jsp";
			if (isNotError) {
				if (opt.equals("I")) {
					PageToCall = "EDC0600_sc_basic_inq.jsp";
				} else {	
					PageToCall = "EDC0600_sc_basic.jsp";
				}
			}	
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
	private void procReqList(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			EDC060001Message msg = (EDC060001Message) mc.getMessageRecord("EDC060001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0015");
			msg.setH01SCRCOD("01");
			msg.setH01FLGWK1("1");
			try {
				msg.setE01RCOBNK(req.getParameter("E01RCOBNK"));
			} catch(Exception e) {
				msg.setE01RCOBNK(req.getParameter("BNK"));
			}
			try {
				msg.setE01RCOATY(req.getParameter("E01RCOATY"));
			} catch(Exception e) {
				msg.setE01RCOATY(req.getParameter("ATY"));
			}
			initTransaction(userPO, String.valueOf(screen), "M");
			msgHandle.sendMessage(msg);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			JBObjList jbList = msgHandle.receiveMessageList("E01INDOPE");
			putDataInSession(session, userPO, msgError, null, null, jbList);
			String PageToCall = "MISC_not_available.jsp";
			if (isNotError) {
				PageToCall = "EDC0600_sc_list.jsp";
			} else {
				PageToCall = "EDC0600_sc_enter_selection.jsp";
			}
			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 */
	private void procReqEnterBank(HttpServletRequest req, HttpServletResponse res, int screen) throws IOException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = new UserPos();
		
		String PageToCall = "EDC0600_sc_enter_selection.jsp";
		initTransaction(userPO, String.valueOf(screen), "M");
		putDataInSession(session, userPO, null, null, null, null);
		callPage(PageToCall, req, res);
	}

	private void initTransaction(UserPos userPO, String optMenu, String purpose) {
		userPO.setOption(optMenu);
		userPO.setPurpose(purpose);
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
		if (jbList != null) session.setAttribute("ccList", jbList);
	}
					
}