package datapro.eibs.menu;

/**
 * This type was created by Orestes Garcia.
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.security.HistUserAccessEntry;
import com.datapro.security.UserRegistryFacade;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.master.ServiceLocator;
import datapro.eibs.master.Util;

public class JSLogOff extends datapro.eibs.master.SuperServlet {

	private static final long serialVersionUID = 318670912590271230L;
	
	private static final String REGISTRY_KEY = ServiceLocator.getInstance()
		.getDataSourceJndiName(UserRegistryFacade.DB_REGISTRY);

/**
 * Insert the method's description here.
 * Creation date: (1/14/00 12:29:44 PM)
 */
public JSLogOff() {
	super();	
}
/**
 * This method was created by Orestes Garcia.
 */
public void destroy() {

	flexLog("free resources used by JSLogOff");
	
}
/**
 * This method was created by Orestes Garcia.
 */
public void init(ServletConfig config) throws ServletException {
	super.init(config);

}

private UserRegistryFacade getUserRegistryFacade(HttpServletRequest req, HttpSession session){

	UserRegistryFacade userRegistryFacade = null;
	try {
		String realm = getServletContext().getInitParameter("realm");
		String usersImpl = getServletContext().getInitParameter("users");

		if (usersImpl != null) {
			userRegistryFacade = (UserRegistryFacade) Class.forName(usersImpl)
				.getConstructor(new Class[] { String.class })
				.newInstance(new Object[] { realm });
			userRegistryFacade.initialize(REGISTRY_KEY, req.getLocale());
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return userRegistryFacade;
}

public String getCookieValue(Cookie[] cookies, String cookieName) {
	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			Cookie cookie = cookies[i];
			if (cookieName.equals(cookie.getName()))
				return (cookie.getValue());
		}			
	}
	return null;
}

public String getJavaSessionId(Cookie[] cookies) {
	return getCookieValue(cookies, "JSESSIONID");
}

public void revokeSSO(HttpServletRequest request, HttpServletResponse response) {
	HistUserAccessEntry accessEntry = new HistUserAccessEntry();
	if (response != null) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().startsWith("LtpaToken")) {
					cookies[i].setMaxAge(0);
					cookies[i].setPath("/");
					response.addCookie(cookies[i]);
				} else if (cookies[i].getName().equals("JSESSIONID")) {
					accessEntry.setUserSessionId(cookies[i].getValue());
				}
			}
		}
	}
	HttpSession session = (HttpSession)request.getSession(false);
	if (session != null && session.getAttribute("currUser") != null) {
		accessEntry.setUid(((ESS0030DSMessage) session.getAttribute("currUser")).getH01USR());
	}
	if (accessEntry.getUid() != null) {
		try {
			UserRegistryFacade userRegistryFacade = getUserRegistryFacade(request, session);
			accessEntry.setPwdHistory(HistUserAccessEntry.TWO);
			accessEntry.setIpHostName(request.getRemoteHost());
			accessEntry.setIpHostNumber(request.getRemoteAddr());
			userRegistryFacade.updateAccessHistory(accessEntry);
		} catch (Exception e) {
			System.out.println("The User Session couldn't be updated on DB : Cause By :" + e.getMessage());
		}
	}
}
/**
 * This method was created by Orestes Garcia.
 * @param request HttpServletRequest
 * @param response HttpServletResponse
 */
public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
	HttpSession session = (HttpSession)req.getSession(false);
	
	if (req.getParameter("SSO") != null) {
		revokeSSO(req, res);
	}
	if (session != null) {
		Enumeration<String> sessionAttributes = session.getAttributeNames();
		while (sessionAttributes.hasMoreElements()) {
			session.removeAttribute((String)sessionAttributes.nextElement());
		}				
		session.invalidate();
	}
	
	if(!"UNLOAD".equals(Util.getReqParameter("SCREEN", req))){
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
	
		out.println("<HTML>");
		out.println("<HEAD><TITLE>IBS Menu</TITLE></HEAD>");
		out.println("<BODY>");
		out.println("<SCRIPT>");
		out.println("	top.close();");
		out.println("</SCRIPT>");
		out.println("</BODY>");
		out.println("</HTML>");
	
		out.close();
	}
}


}