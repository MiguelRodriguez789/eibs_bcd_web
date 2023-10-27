package datapro.eibs.menu;

/**
 * This servlet was created by fhernandez.
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.plugins.AccessSecurity;
import datapro.eibs.plugins.AuthorizationManager;

public class JSESS0040Redirector extends datapro.eibs.master.SuperServlet {

	public JSESS0040Redirector() {
		super();
	}
	
	protected void printUnauthorized(PrintWriter out) throws IOException {
		out.println("<HTML>");
		out.println("<HEAD>");
		out.println("<TITLE>Close</TITLE>");
		out.println("</HEAD>");
		out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
		out.println("  function Unauthorized() {");
		out.println("		alert('eIBS Message\\n" +
				"Usted no tiene privilegios para invocar esta opción');");
		out.println("		top.close()");
		out.println("  }");
		out.println("</SCRIPT>");
		out.println("<BODY onLoad=\"Unauthorized()\">");
		out.println("</BODY>");
		out.println("</HTML>");
		out.close();
		return;
	}

	public void service(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		HttpSession session;
		session = (HttpSession) req.getSession(false);

		if (session == null) {
			try {
				res.setContentType("text/html");
				printLogInAgain(res.getWriter());
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Exception ocurred. Exception = " + e);
			}
		} else {
			session.removeAttribute("error");
			session.setAttribute("userPO", new UserPos());
			ESS0030DSMessage msgUser = (ESS0030DSMessage) session.getAttribute("currUser");
			if (msgUser == null) {
				//Session Expiration Control
				try {
					res.setContentType("text/html");
					printLogInAgain(res.getWriter());
				} catch (Exception e) {
					flexLog("Exception ocurred. Exception = " + e);
				}
				return;
			}
			String LangPath = super.rootPath + msgUser.getE01LAN() + "/";
			String resourcePath = req.getParameter("ServletName"); 
			if (req.getParameter("MenuOption") != null) {
				AccessSecurity menuSecurity = (AccessSecurity) session.getAttribute("AccessSecurity");
				if (menuSecurity == null) {
					menuSecurity = new AccessSecurity();
					menuSecurity.setMainMenu((Map) session.getAttribute("mainMenu"));
					menuSecurity.setSubMenu((Map) session.getAttribute("subMenu"));
					menuSecurity.setSecureRequestMap(AuthorizationManager.getSecureContext(req));
				}
				/* synchronized (SessionListener.getMutex(req.getSession())) {
				 * Alternative to Session Object Locks
				 * */
			//	synchronized (req.getSession().getId().intern()) {				
					menuSecurity.refresh();
			//	}
				menuSecurity.setMenuOption(req.getParameter("MenuOption"));
				menuSecurity.setMenuSequence(req.getParameter("MenuSubOption"));
				if (menuSecurity.hasAccess(menuSecurity.getMenuOption(), menuSecurity.getMenuSequence(), resourcePath)) {
					menuSecurity.generateNonce();
					menuSecurity.setAccessTime(System.nanoTime());
					session.setAttribute("AccessSecurity", menuSecurity);
					res.addCookie(AuthorizationManager.newCookie(req, "eibsRequestId", menuSecurity.getRequestId()));
 					if (!resourcePath.startsWith("http")){
 						resourcePath = req.getContextPath() + resourcePath;
					}
					res.sendRedirect(req.getContextPath()+
							LangPath + "body_wait.jsp?ServletName=" + resourcePath);
					return;
				}
			}
			res.sendError(HttpServletResponse.SC_FORBIDDEN);
		}

	}
}