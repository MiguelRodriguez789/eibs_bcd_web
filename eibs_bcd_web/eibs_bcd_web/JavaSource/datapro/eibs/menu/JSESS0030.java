/*
 * Created on Nov 17, 2009
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package datapro.eibs.menu;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.eibs.exception.FacadeException;
import com.datapro.eibs.facade.FASecurity;
import com.datapro.eibs.security.vo.WEBMMViewByUser;
import com.datapro.exception.ServiceLocatorException;
import com.datapro.interfaces.InitSessionPlugin;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS003002Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.ESS0040DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSProp;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.Util;
import datapro.eibs.plugins.AccessSecurity;
import datapro.eibs.plugins.AuthorizationManager;
import datapro.eibs.sockets.MessageField;
import datapro.eibs.sockets.MessageHandler;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSESS0030 extends SuperServlet {

	protected static final int A_LOGIN = 2;
	protected static final int R_LOGIN_CHANGE_PASSWORD = 3;
	protected static final int A_LOGIN_CHANGE_PASSWORD = 4;
	protected static final int R_CHANGE_PASSWORD = 5;
	protected static final int A_CHANGE_PASSWORD = 6;
	protected static final int R_CHECK_APP_PASSWORD = 7;
	protected static final int A_CHECK_APP_PASSWORD = 8;
	
	public void service(HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException {

		ESS0030DSMessage msgUser = null;
		HttpSession session = null;

		int screen ;
		try {
			screen = Integer.parseInt(req.getParameter("SCREEN"));
		} catch (Exception e) {
			screen = A_LOGIN;
		}
		
		session = req.getSession(false);
		if (session == null && screen != A_LOGIN) {
			try {
				res.setContentType("text/html");
				printLogInAgain(res.getWriter());
			}
			catch(Exception e) {
				flexLog("Exception = " + e);
			}
		} else {
			if (screen != A_LOGIN) {
				msgUser = (ESS0030DSMessage) session.getAttribute("currUser");
			}
			try {
			// Here we should get the path from the user profile
				processRequest(msgUser, req, res, session, screen);
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				forward(SuperServlet.sckNotOpenPage, req, res);
			}
		}
	}

	protected UserPos getUserPos(HttpSession session) {
		return (datapro.eibs.beans.UserPos) session.getAttribute("userPO");
	}
	
	protected String getLangPath(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		if (session != null) {
			ESS0030DSMessage msgUser =
				(ESS0030DSMessage) session.getAttribute("currUser");
			if (msgUser != null) {
				return SuperServlet.rootPath + msgUser.getE01LAN().toLowerCase() + "/";
			}
		}
		return SuperServlet.rootPath
				+ (req.getParameter("Language") == null ? "s" : req
						.getParameter("Language").toLowerCase()) + "/";
	}

	protected void forward(String pageName,
		HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException {
		callPage(getLangPath(req) + pageName, req, res);
	}
	
	/**
	 * @param string
	 * @param req
	 * @return
	 */
	private MessageProcessor getMessageProcessor(String targetProgram, HttpServletRequest req) throws IOException {
		MessageProcessor mp = null;
		MessageHandler mh;
		try {
			mh = getMessageHandler(targetProgram, req);
		} catch (ServiceLocatorException e) {
			throw new IOException(e.getMessage());
		}		
		mp = new MessageProcessor(mh);
		return mp;
	}
	
	protected HttpSession getSession(HttpServletRequest req) {
		HttpSession session = null;

		session = (HttpSession) req.getSession(false); 

		if (session == null) {
			session = (HttpSession) req.getSession(true);
		} else {
			Enumeration sessionAttributes = session.getAttributeNames();
			while (sessionAttributes.hasMoreElements()) {
				session.removeAttribute((String)sessionAttributes.nextElement());
			}			
		}
		return session;
	}

	/**
	 * @param msgUser
	 * @param req
	 * @param res
	 * @param session
	 * @param screen
	 */
	private void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		switch (screen) {
			case A_LOGIN:
				procActionLogIn(user, req, res, session);
				break;
			case R_CHANGE_PASSWORD:
				procReqChangePassword(user, req, res, session);
				break;
			case A_LOGIN_CHANGE_PASSWORD:
				procActionLogInChangePassword(user, req, res, session);
				break;	
			case A_CHANGE_PASSWORD:
				procActionChangePassword(user, req, res, session);
				break;	
			case R_CHECK_APP_PASSWORD:
				procReqChkAppPassword(user, req, res, session);
				break;	
			case A_CHECK_APP_PASSWORD:
				procActionChkAppPassword(user, req, res, session);
				break;	
			case R_LOGIN_CHANGE_PASSWORD:	
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procActionLogInChangePassword(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		ELEERRMessage msgError = new ELEERRMessage();
		String password = (req.getParameter("NewPassword_1") == null) ? "" : req.getParameter("NewPassword_1").toUpperCase();
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESS0030", req);
			ESS003002Message msgPsw = (ESS003002Message) mp.getMessageRecord("ESS003002", null, "");
			msgPsw.setH02USR(user.getH01USR());
			msgPsw.setE02OPR("1");
			msgPsw.setE02APW(user.getE01PSW());
			msgPsw.setE02PSW(password);
			try {
				msgPsw.setH02WK1(req.getParameter("SOURCE").trim());
			} catch(Exception e) {
				msgPsw.setH02WK1("");
			}
			mp.sendMessage(msgPsw);
			
			msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			session.setAttribute("error", msgError);
			
			if (mp.hasError(msgError)) {
				forward("ESS0030_LogIn_change_password.jsp", req, res);
			} else {
				user.setE01PSW(password);
				session.setAttribute("currUser", user);
				forward("ESS0030_LogIn.jsp", req, res);
			}
			
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procActionChkAppPassword(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		String password = (req.getParameter("AppPassword") == null) ? "" : req.getParameter("AppPassword");
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESS0030", req);
			
			ESS0030DSMessage auxuser = (ESS0030DSMessage) mp.getMessageRecord("ESS0030DS", null, "");
			auxuser.setH01USR(user.getH01USR());
			auxuser.setH01PGM("ESS0030");
			auxuser.setE01PSW(password);
			auxuser.setH01TIM(getTimeStamp());
			auxuser.setH01SCR("01");
			if("short".equals(req.getParameter("mode"))){
				//short approval password
				auxuser.setH01OPE("0007");
			} else {
				auxuser.setH01OPE("0004");
			}
			auxuser.setE01LAN(user.getE01LAN());
			setMessageField(auxuser, "E01DSK", Util.getIpAddress(req));
			
			mp.sendMessage(auxuser);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			session.setAttribute("error", msgError);
			
			if (mp.hasError(msgError)) {
				forward("ESS0030_app_enter_password.jsp", req, res);
			} else {
				UserPos userPO = getUserPos(req);
				flexLog("About to call Page: " + userPO.getRedirect());
				res.sendRedirect(super.srctx + userPO.getRedirect());
			}
			
		} finally {
			if (mp != null)	mp.close();
		}
		
	}

	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procActionChangePassword(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		ELEERRMessage msgError = new ELEERRMessage();
		
		String newLoginPsw = (req.getParameter("LoginPassword_1") == null) ? "" : req.getParameter("LoginPassword_1").toUpperCase();
		String oldLoginPsw = (req.getParameter("LoginPassword") == null) ? "" : req.getParameter("LoginPassword").toUpperCase();
		String newAppPsw = (req.getParameter("AppPassword_1") == null) ? "" : req.getParameter("AppPassword_1").toUpperCase();
		String oldAppPsw = (req.getParameter("AppPassword") == null) ? "" : req.getParameter("AppPassword").toUpperCase();
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESS0030", req);
			ESS003002Message msgPsw = (ESS003002Message) mp.getMessageRecord("ESS003002", null, "");
			msgPsw.setH02USR(user.getH01USR());
			msgPsw.setE02OPR(user.getE01OPR());
			msgPsw.setE02APW(oldLoginPsw);
			msgPsw.setE02PSW(newLoginPsw);
			msgPsw.setE02APS(oldAppPsw);
			msgPsw.setE02PSE(newAppPsw);
			try {
				msgPsw.setH02WK1(req.getParameter("SOURCE"));
			} catch(Exception e) {
				msgPsw.setH02WK1("");
			}
			mp.sendMessage(msgPsw);
			
			msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			session.setAttribute("error", msgError);
			
			if (mp.hasError(msgError)) {
				forward("ESS0030_change_password.jsp", req, res);
			} else {
				user.setE01PSW(newLoginPsw);
				user.setE01PSE(newAppPsw);
				session.setAttribute("currUser", user);
				flexLog("About to call Page: " + SuperServlet.bgPage);
				res.sendRedirect(SuperServlet.srctx + SuperServlet.bgPage);
			}
			
		} finally {
			if (mp != null)	mp.close();
		}
	}	
	
	/**
	 * @param request
	 * @return
	 */
	protected String getUser(HttpServletRequest request) {
		String userid = "";
		if (request.getParameter("UserId") != null){
			userid = request.getParameter("UserId");
		} else if (request.getParameter("j_username") != null){
			userid = request.getParameter("j_username");
		} else {			
			if (request.getRemoteUser() != null) {
				userid = request.getRemoteUser();
				int idx = userid.lastIndexOf('/');
				if (idx == -1) {
					return userid;
				} else {
					return userid.substring(idx + 1);
				}
			} 			
		}
		return userid;
	}
	
	protected String getPassword(HttpServletRequest request) {
		String password = "";
		if (request.getParameter("Password") != null) {
			password = request.getParameter("Password").toUpperCase();			
		} else if (request.getParameter("j_password") != null) {
			password = request.getParameter("j_password").toUpperCase();
		}
		return password;
	}

	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procActionLogIn(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		//user = null;
		ELEERRMessage msgError = new ELEERRMessage();
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESS0030", req);
			user = (ESS0030DSMessage) mp.getMessageRecord("ESS0030DS", null, "");
			String userId = getUser(req).toUpperCase().trim();
			user.setH01USR(userId.length() > 10 ? "" : userId);
			user.setE01NTU(userId);
			user.setE01PSW(getPassword(req));
			user.setH01PGM("ESS0030");
			user.setH01TIM(getTimeStamp());
			setMessageField(user, "E01DSK", Util.getIpAddress(req));
			user.setH01SCR("01");
			user.setH01OPE("0004");
			String language = (req.getParameter("Language") == null) ? "" : req.getParameter("Language").toLowerCase(); 
			user.setE01LAN(language);
			try {
				user.setH01WK1(req.getParameter("SOURCE").trim());
			} catch(Exception e) {
				user.setH01WK1("");
			}
			mp.sendMessage(user);
			
			msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			boolean succeed = !mp.hasError(msgError);
			
			user = (ESS0030DSMessage) mp.receiveMessageRecord("ESS0030DS");
			
			if (succeed) {
				session = getSession(req);
				session.setAttribute("currUser", user);
				session.setAttribute("option-menu", req.getParameter("option-menu"));
				
				initPlugin(session, user);
            	procSecurityMenu(user, req, res, session);
            	
				AccessSecurity menuSecurity = new AccessSecurity();
				menuSecurity.setMainMenu((Map) session.getAttribute("mainMenu"));
				menuSecurity.setSubMenu((Map) session.getAttribute("subMenu"));
				menuSecurity.setSecureRequestMap(AuthorizationManager.getSecureContext(req));
				menuSecurity.generateNonce();
				menuSecurity.setAccessTime(System.nanoTime());
				menuSecurity.setSecurityId(String.valueOf(System.nanoTime()));
				session.setAttribute("AccessSecurity", menuSecurity);
				
				forward("LOOK_eIBS.jsp", req, res);
			} else {
				if (user.getE01OPR().equals("")) {
					req.setAttribute("error", msgError);
					forward("ESS0030_LogIn.jsp", req, res);
				} else {
					session = getSession(req);
					session.setAttribute("currUser", user);
					session.setAttribute("error", msgError);
					
					forward("ESS0030_LogIn_change_password.jsp", req, res);
				}
			}
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

	/**
	 * @param session
	 * @param user
	 */
	private void initPlugin(HttpSession session, ESS0030DSMessage user) {
		String className = JSEIBSProp.getSessionPluginClass();
		if (!className.equals("")) {
			Map map = new HashMap();
			Enumeration enu = user.fieldEnumeration();
			MessageField field = null;
			String value = null;
			while(enu.hasMoreElements())  {
				field = (MessageField)enu.nextElement();
				try {
					map.put(new String(field.getTag()), new String(field.getString()));
				} catch(Exception exception) { 
				}
			}

			try {
				Class c = Class.forName(className);
				InitSessionPlugin sp = (InitSessionPlugin)c.newInstance();
				sp.init(session, map);
			}
			catch(Exception e) {
				flexLog("Error: " + e);
			}
		}
	}
	
	private void procSecurityMenu(ESS0030DSMessage msgUser, 
			HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, MessageProcessor mp) throws ServletException, IOException {
			
			session.removeAttribute("mainMenu");
			session.removeAttribute("subMenu");
			
			Map mainMenu = new HashMap();
			Map subMenu = new HashMap();
			
			// Send Request
			ESS0040DSMessage msgMenu = (ESS0040DSMessage) mp.getMessageRecord("ESS0040DS");
			msgMenu.setESSUSR(msgUser.getH01USR());
			msgMenu.setESSTYP(msgUser.getE01LAN());
			mp.sendMessage(msgMenu);
			
			msgMenu = (ESS0040DSMessage) mp.receiveMessageRecord("ESS0040DS");
			
			if ("T".equals(msgMenu.getESSTYP())) {
				JBObjList list = mp.receiveMessageRecordList("ESSTYP");
				if (!list.isEmpty()) {
					Iterator iter = list.listIterator();
					while (iter.hasNext()) {
						msgMenu = (ESS0040DSMessage) iter.next();
						if ("M".equals(msgMenu.getESSTYP())) {
							mainMenu.put(msgMenu.getESSSID(), msgMenu);
						} else if ("C".equals(msgMenu.getESSTYP())) {
							List subMenuList = (List) subMenu.get(msgMenu.getESSSID());
							if(subMenuList == null){
								subMenuList = new JBObjList();
								subMenu.put(msgMenu.getESSSID(), subMenuList);
							}
							subMenuList.add(msgMenu);
						}
					}
				}
			}
			
			session.setAttribute("mainMenu", mainMenu);
			session.setAttribute("subMenu", subMenu);
	}
	
	private void procSecurityMenu(ESS0030DSMessage msgUser, 
			HttpServletRequest req, HttpServletResponse res, 
			HttpSession session) throws ServletException, IOException {
			
		session.removeAttribute("mainMenu");
		session.removeAttribute("subMenu");
		
		Map mainMenu = new HashMap();
		Map subMenu = new HashMap();
		
		FASecurity facade = new FASecurity();
		facade.setSessionUser(msgUser);
		
		try {
			List list = facade.getMainMenu(facade.getUser());
			if (!list.isEmpty()) {
				Iterator iter = list.listIterator();
				while (iter.hasNext()) {
					WEBMMViewByUser msgMenu = (WEBMMViewByUser) iter.next();
					if ("M".equals(msgMenu.getESSTYP())) {
						mainMenu.put(msgMenu.getESSSID(), msgMenu);
					} else if ("C".equals(msgMenu.getESSTYP())) {
						List subMenuList = (List) subMenu.get(msgMenu.getESSSID());
						if(subMenuList == null){
							subMenuList = new JBObjList();
							subMenu.put(msgMenu.getESSSID(), subMenuList);
						}
						subMenuList.add(msgMenu);
					}	
				}
			}
			session.setAttribute("mainMenu", mainMenu);
			session.setAttribute("subMenu", subMenu);
		} catch (FacadeException e) {
			throw new ServletException(e);
		}
	}
	
	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procReqChkAppPassword(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		ELEERRMessage msgError = new ELEERRMessage();
		
		if (user.getE01SEC().equals("Y")) {
			forward("ESS0030_app_enter_password.jsp", req, res);
		} else {
			UserPos userPO = getUserPos(req);
			res.sendRedirect(super.srctx + userPO.getRedirect());
		}
		
	}

	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procReqChangePassword(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		UserPos userPO = new UserPos();
		userPO.setOption("PASSWORD");
		userPO.setPurpose("MAINTENANCE");
		session.setAttribute("userPO", userPO);
		
		ELEERRMessage msgError = new ELEERRMessage();
		session.setAttribute("error", msgError);
		
		forward("ESS0030_change_password.jsp", req, res);
	}

}
