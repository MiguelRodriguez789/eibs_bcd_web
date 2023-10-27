package datapro.eibs.tools;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.master.JSEIBSServlet;

public class JSGetHostErrorCode extends JSEIBSServlet {

	@Override
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		
		switch ( screen ) {
		case 100: //RETURN FIRST ERROR CODE
			if( null != session.getAttribute("error") ){
				ELEERRMessage error = (ELEERRMessage)session.getAttribute("error");
				res.setHeader("DataproHostErrorCode", !"".equals(error.getERNU01())?error.getERNU01():"0" );
			} else {
				res.setHeader("DataproHostErrorCode", "0" );
			}
			
			break;

		case 200: //Delete Error message from session
			session.removeAttribute("error");
			break;
			
		default:
			break;
		}
		

	}


	
}
