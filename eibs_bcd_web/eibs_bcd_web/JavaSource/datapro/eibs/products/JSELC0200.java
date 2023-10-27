/*
 * Created on Apr 7, 2008
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package datapro.eibs.products;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELC020001Message;
import datapro.eibs.beans.ELC020003Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.MessageContext;
import datapro.eibs.sockets.MessageContextHandler;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSELC0200 extends SuperServlet {
	
	String LangPath = "s/";

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
				mc = new MessageContext(super.getMessageHandler("ELC0200", req));
						
				try {
					screen = Integer.parseInt(req.getParameter("SCREEN"));
					flexLog("Screen  Number: " + screen);
				} catch (Exception e) {
					flexLog("Screen set to default value");
				}
				
				String PageToCall = "";

				switch (screen) {
					case 1 : // Enter (Control de Documentos Recibidos)
						PageToCall = "ELC0200_lc_doc_enter.jsp";
						callPage(PageToCall, req, res);
						break;
					case 2 : // Call list (submit 1st page)
						requestList(mc, user, req, res, screen);
						break;
					case 3 : // CALL LC DOCUMENTS NEW
						requestNew(mc, user, req, res, screen);
						break;
					case 4 : // CALL LC DOCUMENTS MAINT
						requestMaintenance(mc, user, req, res, screen);
						break;
					case 5 :
						requestAction(mc, user, req, res, screen);
						break;
					case 11 :
						procRecOptionMenu(mc, user, req, res);
						break;
					case 12 :
						procActionOptionMenu(mc, user, req, res);
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
				flexLog("Socket used by JSELC0200 closed.");
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
		UserPos userPO = getUserPos(req);
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC020001Message msg = (ELC020001Message) mc.getMessageRecord("ELC020001");					
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0005");
			
			initTransaction(userPO, String.valueOf(screen), "");
			msgHandle.setFieldsFromPage(req, msg);
			
			boolean isFinal = msg.getH01FLGWK1().equals("Y");
			msgHandle.sendMessage(msg);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg = (ELC020001Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, msg, null);
			if (isNotError) {
				if (isFinal) {
					super.callPage(SuperServlet.bgPage, req, res);
				} else {
					userPO.setHeader1("SENT");
					requestMaintenance(mc, user, req, res, screen);
				}
			} else
				callPage("ELC0200_lc_doc_info.jsp", req, res);
		
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
	private void requestMaintenance(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "ELC0200_lc_doc_info.jsp";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC020001Message msg = (ELC020001Message) mc.getMessageRecord("ELC020001");					
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0002");
			initTransaction(userPO, String.valueOf(screen), "");
			try {
				msg.setE01LCMACC(userPO.getAccNum());
				if(req.getParameter("E01LCIDNO") == null){
					msg.setE01LCIDNO(userPO.getHeader10());
				} else {
					msg.setE01LCIDNO(req.getParameter("E01LCIDNO"));
					userPO.setHeader10(req.getParameter("E01LCIDNO"));
				}
			} catch (Exception e) {
				flexLog("E01LCIDNO not available from page");
			}
			msgHandle.sendMessage(msg);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			msg = (ELC020001Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, msg, null);
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
	private void requestNew(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "ELC0200_lc_doc_info.jsp";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC020001Message msg = (ELC020001Message) mc.getMessageRecord("ELC020001");					
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0001");
			initTransaction(userPO, String.valueOf(screen), "");
			msg.setE01LCMACC(userPO.getAccNum());
			msgHandle.sendMessage(msg);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			msg = (ELC020001Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, msg, null);
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
	private void requestList(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "ELC0200_lc_doc_list.jsp";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC020001Message msg = (ELC020001Message) mc.getMessageRecord("ELC020001");					
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0015");
			initTransaction(userPO, String.valueOf(screen), "");
			try {
				msg.setE01LCMACC(req.getParameter("E01LCMACC"));
				userPO.setAccNum(msg.getE01LCMACC());
			} catch (Exception e) {
				flexLog("E01LCMACC not available from page");
			}
			try {
				msg.setE01LCIDNO(req.getParameter("E01LCIDNO"));
				userPO.setHeader10(req.getParameter("E01LCIDNO"));
			} catch (Exception e) {
				flexLog("E01LCIDNO not available from page");
			}
			msgHandle.sendMessage(msg);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			JBObjList jbList = msgHandle.receiveMessageList("H01FLGMAS");
			putDataInSession(session, userPO, msgError, msg, jbList);
			if(!(msgError.getERRNUM().equals("0"))){
				PageToCall = "ELC0200_lc_doc_enter.jsp";
			}
			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}
	
	private void procRecOptionMenu(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC020003Message msg03 = (ELC020003Message) mc.getMessageRecord("ELC020003");
			msg03.setH03USERID(user.getH01USR());
			msg03.setH03OPECOD("0002");
			msg03.setH03SCRCOD("01");
			msg03.setE03LCMACC(userPO.getAccNum());
			msg03.setE03LCIDNO(userPO.getHeader10());
			try {
				msg03.setE03LCDFCD(req.getParameter("CODE").trim());
			} catch (Exception e) {
			}
			
			setMessageRecord(req, msg03);
			
			msgHandle.sendMessage(msg03);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			msg03 = (ELC020003Message) msgHandle.receiveMessage();
			
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("msg03", msg03);

			callPage("ELC0200_lc_field_info.jsp", req, res);
		
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
	private void procActionOptionMenu(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC020003Message msg03 = (ELC020003Message) mc.getMessageRecord("ELC020003");
			msg03.setH03USERID(user.getH01USR());
			msg03.setH03OPECOD("0005");
			msg03.setH03SCRCOD("01");
			
			setMessageRecord(req, msg03);
			
			msgHandle.sendMessage(msg03);
			
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			msg03 = (ELC020003Message) msgHandle.receiveMessage();
			
			session.setAttribute("error", msgError);
			session.setAttribute("msg03", msg03);
			
			if (msgError.getBigDecimalERRNUM().intValue() == 0) {
				requestMaintenance(mc, user, req, res, 0);
			} else {
				callPage("ELC0200_lc_field_info.jsp", req, res);
			}
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}
				
	private void initTransaction(UserPos userPO, String optMenu, String purpose) {
		try {
			if (!optMenu.equals("")) userPO.setOption(optMenu);
			if (!purpose.equals("")) userPO.setPurpose(purpose);
			
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}
		try {
		} catch (Exception ex) {
			flexLog("Error getting userPO from session: " + ex);
		}
	}
	
	public void callPage(String page, HttpServletRequest req, HttpServletResponse res) {
		try {
			super.callPage(LangPath + page, req, res);
		} catch (Exception e) {
			flexLog("Exception calling page " + e.toString() + e.getMessage());
		}
		return; 
	}
	
	private void putDataInSession(HttpSession session, UserPos userPO, ELEERRMessage msgError, ELC020001Message msg, JBObjList jbList) {
		flexLog("Putting java beans into the session");

		if (msgError == null) {
			msgError = new ELEERRMessage(); 
		}
		session.setAttribute("error", msgError);
		session.setAttribute("userPO", userPO);
		if (msg != null) session.setAttribute("msg01", msg);
		if (jbList != null) session.setAttribute("jbList", jbList);
	}

}
