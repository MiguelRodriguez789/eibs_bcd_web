package datapro.eibs.interfaces;
/**
 * Mantenimiento Convenios de Motor de pagos
 * Creation date: (10/25/17)
*/
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ECA001901Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;
import datapro.eibs.beans.JBObjList;


public class JSECA0019 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		switch (screen) {
			case 3 : // Request old Record
			case 5 : // Submit the Record for update
				procActionRec(user, req, res, session, screen);
				break;

			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	// SCREEN = 2,3,5
	// Get or Process the Record  
	//
	protected void procActionRec(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send data
		try {
			mp = new MessageProcessor("ECA001901");
			ECA001901Message msg = (ECA001901Message) mp.getMessageRecord("ECA001901");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ECA0019");
			msg.setH01TIMSYS(getTimeStamp());
			switch (screen) {
				case 3 : // Request old Record
					msg.setH01OPECOD("0003");
					userPO.setPurpose("MAINTENANCE");
					break;
				case 5 : // Submit the Record for update
					msg.setH01OPECOD("0005");
					break;	
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
			
			if (screen == 5) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {				
				}
			}
			
			if (screen != 5){

			}
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 3) {
					forward("ECA0019_cb_params_previsions.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("ECA0019_cb_params_previsions.jsp", req, res);
				}

			} else {
				ses.setAttribute("msgRcd", newmessage);
				if (screen == 10) {     // Update or Delete
					res.sendRedirect(srctx + "/servlet/datapro.eibs.client.JSECA0019?SCREEN=3&SEARCHCDE=" + userPO.getHeader2());	
				} else {
					forward("ECA0019_cb_params_previsions.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}
	
	
}