package datapro.eibs.client; 
/**
 * Maintenance of Cumrk Records
 * Creation date: (08/21/14)
 * @author: Carlos Castillo
 * 
 * 	// List of Options
 * 	//
 *	// SCREEN =    2    Request record
 *	// SCREEN =    5	Submit the record for Update 
 *  // SCREEN =    6    Request record for Inquiry
 */
import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class JSESD0094 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		switch (screen) {
			case 2 : // Request new Record
			case 5 : // Submit the Record for update
			case 6 : // Request Record for Approval	
			case 8 : // Request Record for Inquiry		
				procActionRec(user, req, res, session, screen);
				break;
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}


	// SCREEN = 2,5,6
	// Get or Process the Record  
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
			mp = new MessageProcessor("ESD0094");
			ESD009401Message msg = (ESD009401Message) mp.getMessageRecord("ESD009401");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD0094");
			msg.setH01TIMSYS(getTimeStamp());
			switch (screen) {
				case 2 : // Request new Record
					msg.setH01OPECOD("0002");
					userPO.setPurpose("MAINTENANCE");
					break;
				case 5 : // Submit the Record for update
					msg.setH01OPECOD("0005");
					break;
				case 6: // For Inquiry
					msg.setH01OPECOD("0006");
					userPO.setPurpose("APPROVAL_INQ");
					break;
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
			try {
				userPO.setHeader10(req.getParameter("E01RTP"));
				msg.setE01RTP(userPO.getHeader10());
			} catch (Exception e) {
				msg.setE01RTP("C");
			}
			if (screen == 5) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {				
				}
			}
			//
			if (msg.getE01RTP().equals("C")) {
			    // Canales
				dtlPage = "ESD0094_client_contact_via.jsp";
			} else if (msg.getE01RTP().equals("U")) {
			    // Universidades
				dtlPage = "ESD0094_client_univ.jsp";
			} else if (msg.getE01RTP().equals("M")) {
			    // Insurance Info
				dtlPage = "ESD0094_client_mark.jsp";
			} else if (msg.getE01RTP().equals("E")) {
			    // Insurance Info
				dtlPage = "ESD0094_client_cuentas_me.jsp";	
			} else if (msg.getE01RTP().equals("G")) {
			    // GeoReferenciador
				dtlPage = "ESD0094_client_geo.jsp";	
			} else {
				dtlPage= "MISC_under_construction.html";
			}
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
			ses.setAttribute("ESD0094Record", newmessage);
			forward(dtlPage, req, res);

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

}