package datapro.eibs.menu;

/**
 * This servlet was created by fhernandez.
 */
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datapro.eibs.plugins.RequestWrapper;

public class JSInitSession extends HttpServlet {
	
	  private static long sSession = System.currentTimeMillis();

	private synchronized String getSessionPath(HttpServletRequest request) {
	    long id = sSession++;
	    return request.getContextPath() + RequestWrapper.SESSION_URL_PATH + id;
	    //return RequestWrapper.SESSION_PREFIX + id;
	}

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String page = "/pages/s/LOOK_eIBS.jsp";
		
		/*
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", -1);
		// response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Cache-Control", "max-age=0");
		response.addHeader("Cache-Control", "s-maxage=0");*/

		//HttpSession session = request.getSession(true);

		if (request instanceof RequestWrapper) {
			RequestWrapper requestWrapper = (RequestWrapper) request;
			if (requestWrapper.isNewSessionRequest()) {
				Cookie cookie = new Cookie("eibsSessionId", requestWrapper.getApplicationId());
				response.addCookie(cookie);
			}
		}
		
		response.sendRedirect(getSessionPath(request) +  page);
		//getServletConfig().getServletContext().getRequestDispatcher(page).forward(request, response);
	}

}