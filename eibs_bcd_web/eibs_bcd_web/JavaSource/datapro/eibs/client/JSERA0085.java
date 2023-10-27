package datapro.eibs.client; 
/**
 * Ofertas Comerciales
 * Creation date: (07/29/14)
 * @author: Rafael Gonzalez
 * 
 * 	// List of Options
 * 	//
 *	// SCREEN =    1	Send request
 *	// SCREEN =    2    Send process confirmation
 *	// SCREEN =    3    
 *	// SCREEN =    4	 
 *	// SCREEN =    5	 
 */
import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class JSERA0085 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		switch (screen) {
			// Requests 
			case 1 :
				procEnter(user, req, res, session);
				break;	
			case 2 : // Send request process
				procProcess(user, req, res, session, screen);
				break;	
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	protected void procEnter(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		try {
			flexLog("About to call Page: ERA0085_ga_wnc_enter.jsp");
			forward("ERA0085_ga_wnc_enter.jsp", req, res);			
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}
	}
	
	//
	protected void procProcess(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		//String searchType = "";
		try {
			mp = new MessageProcessor("ERA0085");
			ERA008501Message msg = (ERA008501Message) mp.getMessageRecord("ERA008501");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");

			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ERA0085");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0001");

			// Send Message	
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			String enterPage= "ERA0085_ga_wnc_confirm.jsp";
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				enterPage= "ERA0085_ga_wnc_enter.jsp";
			}
			// Receive Data
			newmessage = mp.receiveMessageRecord();
			ses.setAttribute("ESD0085Record", newmessage);
			forward(enterPage, req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	}