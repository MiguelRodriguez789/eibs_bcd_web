package datapro.eibs.client; 
/**
 * Scoring Inquiry
 * Creation date: (07/27/17)
 * @author: Carlos Castillo
 * 
 * 	// List of Options
 * 	//
 *	// SCREEN =    8    Request record for Inquiry
 */
import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class JSESD0091 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		switch (screen) {
			case 8 : // Request Record for Approval	
				procActionRec(user, req, res, session, screen);
				break;
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}


	// SCREEN = 8
	// Get or the Record  
	//
	protected void procActionRec(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;
		String dtlPage = "";
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send data
		try {
			mp = new MessageProcessor("ESD0091");
			ESD009101Message msg = (ESD009101Message) mp.getMessageRecord("ESD009101");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD0091");
			msg.setH01TIMSYS(getTimeStamp());
			switch (screen) {
				case 8: // For Inquiry
					msg.setH01OPECOD("0008");
					userPO.setPurpose("INQUIRY");
					break;	
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
			// Get key field
			try {
				msg.setH01CUN(userPO.getCusNum());
			} catch (Exception e) {
				msg.setH01CUN("0");
			}
			//
			//
			dtlPage = "ESD0091_scoring.jsp";
			msg.setH01FLGWK1(""); 
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
			}
			// Receive Data
			newmessage = mp.receiveMessageRecord();
			ses.setAttribute("ESD0091Record", newmessage);
			forward(dtlPage, req, res);

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

}