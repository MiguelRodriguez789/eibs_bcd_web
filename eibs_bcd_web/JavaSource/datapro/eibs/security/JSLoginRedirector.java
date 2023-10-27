package datapro.eibs.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.Util;

/**
 * @version 1.0
 * @author fhernandez
 */
public class JSLoginRedirector extends JSEIBSServlet {
	
	private static final long serialVersionUID = 2900502590224723710L;

	protected String getCookieValue(Cookie[] cookies, String cookieName) {
		for (int i = 0; i < cookies.length; i++) {
			Cookie cookie = cookies[i];
			if (cookieName.equals(cookie.getName()))
				return (cookie.getValue());
		}
		return null;
	}
	
	protected String getJavaSessionId(Cookie[] cookies) {
		return getCookieValue(cookies, "JSESSIONID");
	}
	
	protected String getUser(HttpServletRequest request) {
		String userid = "";
		HttpSession session = (HttpSession)request.getSession(false);
		if (session != null && session.getAttribute("currUser") != null) {
			userid = ((ESS0030DSMessage) session.getAttribute("currUser")).getH01USR();
		} else if (request.getParameter("UserId") != null){
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
	
	public void service(HttpServletRequest req, HttpServletResponse res) 
		throws ServletException, IOException {
		//user = null;
		try {
			String newURL = req.getParameter("URL");
			
			String queryString = req.getQueryString();			
			queryString = Util.replace(queryString, "&URL=" + newURL, "");
			if(queryString.startsWith("&")) queryString = queryString.substring(1);
			
			queryString = "user="+ getUser(req) + "&JSESSIONID="+ getJavaSessionId(req.getCookies());
				//+ "&" + queryString;
			
			if(!res.isCommitted()) 
				res.sendRedirect(newURL+ "?" + queryString);
		} catch (Exception e) {
			e.printStackTrace();
			if(!res.isCommitted()) 
				res.sendError(HttpServletResponse.SC_UNAUTHORIZED);
		}
		
	}

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}
}
