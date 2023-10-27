package datapro.eibs.menu;

/**
 * This servlet was created by fhernandez.
 */
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.datapro.eibs.security.vo.WEBCO;

import datapro.eibs.master.Util;
import datapro.eibs.plugins.AuthorizationManager;
import datapro.eibs.plugins.RequestWrapper;

public class JSResourceLocator extends HttpServlet {

	private static final long serialVersionUID = 248054726482101224L;
	
	public void service(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {

		String resourcePath = null;
		if (request.getParameter("optMenuId") != null) {
			Map optionMenu = (Map) request.getSession(false).getAttribute("optionMenu");
			if (optionMenu == null) {
				optionMenu = (Map) getServletContext().getAttribute("optionMenu");
			}
			List options = (List) optionMenu.get(request.getParameter("optMenu"));
			if (options != null) {
				WEBCO menuOption = (WEBCO) options.get(Util.parseInt(request.getParameter("index")));
				if (menuOption.getCMOSID().equals(request.getParameter("optMenuId"))
					&& menuOption.getCMODEN().equals(request.getParameter("optMenuDen"))) {
					resourcePath = menuOption.getCMOGAD();
				}
			}
			if (resourcePath == null) {
				response.sendError(HttpServletResponse.SC_FORBIDDEN);
			} else {
				response.sendRedirect(request.getContextPath()+resourcePath);
			}
			return;
		} else {
			resourcePath = AuthorizationManager.getResourcePath(request);
		}
		if(resourcePath.indexOf(AuthorizationManager.AUTHORIZATION_SERVLET) == -1){
			RequestDispatcher requestDispatcher = null;
			int pos = resourcePath.indexOf("/servlet/");
			if (pos != -1) {
				pos = pos + "/servlet/".length();
				requestDispatcher = getServletContext().getNamedDispatcher(
						resourcePath.substring(pos, resourcePath.length()));
			}
			if (requestDispatcher == null) {
				requestDispatcher = getServletContext().getRequestDispatcher(resourcePath);
			}
			if (requestDispatcher != null) {
				String type = resourcePath.toLowerCase();
				if (type.endsWith(".jsp")) {
					// This is for preventing cache from the browser on direct calls to JSPs
					response.setHeader("Pragma", "no-cache");
					response.setDateHeader("Expires", -1);
					response.setHeader("Cache-Control", "no-cache");
					response.addHeader("Cache-Control", "max-age=0");
					response.addHeader("Cache-Control", "s-maxage=0");
					response.addHeader("Cache-Control", "no-store");
					response.addHeader("Cache-Control", "must-revalidate");
				}
				if (request instanceof RequestWrapper) {
					requestDispatcher.forward(request, response);
				} else {
					requestDispatcher.forward(new RequestWrapper(request), response);
				}
			}
		}
	}

}