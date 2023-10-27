/*
 * Created on Jan 23, 2009
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package datapro.eibs.menu;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.Util;
import datapro.eibs.services.URIServices;
import net.sf.json.JSONObject;

public class JSPopUpUrl extends JSEIBSServlet {
	
	private static final long serialVersionUID = 4260353645972228009L;
	
	private void requestJSURL(ESS0030DSMessage msgUser, HttpServletRequest req, HttpServletResponse res, int screen) 
			throws IOException, ServletException {
		String resourcePath = null;
		String popUpID = req.getParameter("popUpID");
		String popUpJSON = Util.getReqParameter("popUpJSON" , req);
		
		resourcePath = URIServices.getHelpURI(req, popUpID);
		
		//Populate JS variables
		if (null != resourcePath && !resourcePath.equals("") && !popUpJSON.equals("")) {
			JSONObject jObject = JSONObject.fromObject(popUpJSON);
			jObject.size();
			Iterator<?> keys = jObject.keys();
			
			while( keys.hasNext() ) {
			    String key = (String)keys.next();
			    resourcePath = resourcePath.replace("a["+key+"]", jObject.getString(key));
			}
		}
		//Redirect or Forward Response
		if (resourcePath.equals("")) {
			res.sendError(HttpServletResponse.SC_FORBIDDEN);
		} else {
			res.sendRedirect(req.getContextPath()+resourcePath);
		}
	}

	@Override
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		requestJSURL(user, req, res,screen);
	}
}
