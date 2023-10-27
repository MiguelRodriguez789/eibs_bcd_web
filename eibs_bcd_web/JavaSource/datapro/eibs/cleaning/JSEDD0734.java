package datapro.eibs.cleaning;
/**
 * Mantenimiento 
 * Creation date: (10/25/17)
*/
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EDD0734DSMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;
import datapro.eibs.beans.JBObjList;


public class JSEDD0734 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		switch (screen) {
			// Requests List 
			case 1: // Display Translate
			case 5: // Submit the Record for update (Translate)
				procActionRec(user, req, res, session, screen);
				break;
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}


	protected void procActionRec(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send data
			try {
				mp = new MessageProcessor("EDD0734DS");
				EDD0734DSMessage msg = (EDD0734DSMessage) mp.getMessageRecord("EDD0734DS");
				msg.setH01USERID(user.getH01USR());
				msg.setH01PROGRM("EDD0734");
				msg.setH01TIMSYS(getTimeStamp());
				switch (screen) {
					case 1 : // Delete Record
						msg.setH01OPECOD("0001");
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
				

				
				// Send Message 
				mp.sendMessage(msg);

				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
					if (screen == 1) {
						forward("EDD0734_canje_enviado.jsp", req, res);
					} else {
						// Receive Data
						newmessage = mp.receiveMessageRecord();
						ses.setAttribute("msgRcd", newmessage);
						forward("EDD0734_canje_enviado.jsp", req, res);
					}

				} else {
					ses.setAttribute("msgRcd", newmessage);
					if (screen == 5) {     // Update or Delete
						forward("EDD0734_canje_enviado_end.jsp", req, res);
					} else {
						forward("EDD0734_canje_enviado.jsp", req, res);
					}
				}

			} finally {
				if (mp != null) 
					mp.close();
			}
		}
	
	
}