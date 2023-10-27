package datapro.eibs.reports; 
/**
 * Printer Customer Taxes 
 * Creation date: (05/02/2021)
 * @author: Jose Camperos
 */

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.SuperServlet;

public class JSEFRM015 extends JSEIBSServlet { 
	 
	private static final long serialVersionUID = 1L;

	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		switch (screen) {
			case 1 : // Request enter data
				procReqEnterData(user, req, res, session, screen);
//			case 1 : // Request list reports from eibs Forms
//				procReqListForms(user, req, res, session, screen);
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}
	
	protected void procReqEnterData(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			ELEERRMessage msgError = null;
			UserPos userPO = null;

			try {

				msgError = new ELEERRMessage();
				userPO = new UserPos();
				
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
		
			} catch (Exception ex) {
				flexLog("Error: " + ex);
			}
			
			forwardOnSuccess("EFRM015_print_customer_taxes.jsp", req, res);

		}

}