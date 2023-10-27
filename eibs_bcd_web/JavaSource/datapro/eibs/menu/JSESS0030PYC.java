package datapro.eibs.menu;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: Orestes Garcia
 */
import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.SuperServlet;

public class JSESS0030PYC extends datapro.eibs.master.SuperServlet {

	/**
	 * This method was created by Orestes Garcia.
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);

	}
	
	private String buildParameters(HttpServletRequest req, boolean append) {
		StringBuffer buff = new StringBuffer();
		java.util.Enumeration enu = req.getParameterNames();
		while (enu.hasMoreElements()) {
			String parname = (String)enu.nextElement();
			if(!append){
				append = !append;
				buff.append("?" + parname + "=" + req.getParameter(parname));				
			} else {
				buff.append("&" + parname + "=" + req.getParameter(parname));
			}
		}
		return buff.toString();
	}
	
	protected String getLangPath(HttpServletRequest req) {
		ESS0030DSMessage msgUser =
			(ESS0030DSMessage) req.getSession(false).getAttribute("currUser");
		if (msgUser == null) {			
			return SuperServlet.rootPath + req.getParameter("Language").toLowerCase() + "/";
		} else {
			return SuperServlet.rootPath + msgUser.getE01LAN() + "/";
		}
	}	
	
	protected UserPos getUserPos(HttpSession session) {
		return (datapro.eibs.beans.UserPos) session.getAttribute("userPO");
	}
	
	protected void forward(String pageName,
		HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException {
		callPage(getLangPath(req) + pageName, req, res);
	}
	
	private void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {
		switch (screen) {
			case 2:
				procActionRedirectToSource(user, req, res, session);
				break;
			default :
				procReqPreviousYear(req, res, session);
				break;
		}
	}
	
	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procActionRedirectToSource(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		res.sendRedirect(super.srctx + userPO.getRedirect() + buildParameters(req, true));
	}
	
	/**
	 */
	protected void procReqPreviousYear(HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		try {
			UserPos	userPO = getUserPos(req);
			
			//String url = req.getParameter("ServletName").toString();
			//url = url.substring(url.indexOf("URL=") + 4, url.length());
			String url = req.getParameter("URL") == null ? "" : req.getParameter("URL").toString();
			userPO.setRedirect(url + "&PY=true");
			
			ses.setAttribute("userPO", userPO);
			forward("ESS0030_previous_year_enter.jsp", req, res);
		
		} catch (Exception e)	{
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException(e.getMessage());
		}	
	
	}
	
	public void service(HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException {
		HttpSession session;
		ESS0030DSMessage msgUser = null;

		session = (HttpSession) req.getSession(false);

		if (session == null || session.getAttribute("currUser") == null) {
			try {
				res.setContentType("text/html");
				printLogInAgain(res.getWriter());
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Exception ocurred. Exception = " + e);
			}
		} else {
			try {
				int screen = 0;
				try {
					screen = Integer.parseInt(req.getParameter("SCREEN"));
				} catch (Exception e) {
				}
				msgUser = (ESS0030DSMessage) session.getAttribute("currUser");
				
				processRequest(msgUser, req, res, session, screen);
				
			} catch (Exception e) {
				flexLog("Error: " + e);
				forward(SuperServlet.sckNotOpenPage, req, res);
			}
		}
	}

}