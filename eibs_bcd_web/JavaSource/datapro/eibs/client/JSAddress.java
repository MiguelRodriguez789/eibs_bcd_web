package datapro.eibs.client;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: Orestes Garcia
 */
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.eibs.constants.ISOCodes;
import com.ibm.as400.util.commtrace.Data;

import datapro.eibs.beans.DataAddress;
import datapro.eibs.beans.ESD000004Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.Util;
import datapro.eibs.tools.BufferedHttpResponseWrapper;

public class JSAddress extends JSEIBSServlet {
	
	private Logger logger = Logger.getLogger(this.getClass().getName());
	
	private String mapCountry(String country){
		if (country == null || country.equals("")) {
			return "01";
		}
		return ISOCodes.getIBSCountryCode(country);
	}

	protected void processRequest(
		ESS0030DSMessage user,
		HttpServletRequest request,
		HttpServletResponse response,
		HttpSession session,
		int screen)
		throws ServletException, IOException {
		BufferedHttpResponseWrapper wrapper =new BufferedHttpResponseWrapper(response);
		boolean clearData = "true".equals( request.getParameter("clearData") )  ;
		String country = Util.getReqParameter("country", request);
		request.setAttribute("readOnly", Util.getReqParameter("readOnly", request, "false"));
		request.setAttribute("country", country);
		request.setAttribute("dCountry", Util.getReqParameter("dCountry", request));
		request.setAttribute("suffix", Util.getReqParameter("suffix", request, "E01CUM"));
		request.setAttribute("messageName", Util.getReqParameter("messageName", request));
		session.setAttribute("suffix", Util.getReqParameter("suffix", request, "E01CUM"));

		String messageName = request.getParameter("messageName");

		datapro.eibs.sockets.MessageRecord mr = (datapro.eibs.sockets.MessageRecord) session.getAttribute(messageName);
		datapro.eibs.sockets.MessageRecord omr = mr ;
		
		if( clearData ){
			try {
				mr = mr.getClass().newInstance();
				session.setAttribute(messageName, mr);
			} catch (Exception e) {
				e.printStackTrace();
				// Could not create a new class, and uses the existing one
			}
		} 
		
		ServletContext context = request.getSession().getServletContext();
		String templatePage = DataAddress.getTemplatePage(request, mapCountry(country), mr ); 
		String url = response.encodeRedirectURL(getLangPath(user) + templatePage);
		
		logger.log(Level.FINE, String.format("Template page : %s being called", url));
		response.setCharacterEncoding("utf-8");
		RequestDispatcher dispatcher = context.getRequestDispatcher(url.toString());

		/* must use include. With forward the RequestDispatcher seems to hold an internal state
		   which prevents to do a forward after this to return to the webclient */
		dispatcher.include(request, wrapper);

		/* ... add other stuff like returning something to the webclient ... */
		StringBuffer buffer = new StringBuffer(); 
//		buffer.append("<?xml version=\"1.0\" encoding=\"ISO-8859-1\" ?>");
		buffer.append(wrapper.getOutput());
		
		sendResponse(response, buffer.toString().replace("\n", "").replace("\r", ""), "html" );
		session.setAttribute(messageName, omr);
	}
}