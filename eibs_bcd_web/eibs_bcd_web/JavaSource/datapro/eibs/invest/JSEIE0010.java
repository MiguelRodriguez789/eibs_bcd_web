package datapro.eibs.invest; 
/**
 * Opciones de Portafolio de Inversiones
 * Creation date: (04/23/17)
 * @author: C. Castillo
 * 
 * 	// List of Options
 * 	//
 *	// SCREEN =    1	Investment Profile - Maintenance
 *	// SCREEN =    11   Cash Accounts - Maintenance
 *	// SCREEN =    21   Money Laundering - Maintenance
 *  // SCREEN =    3	Investment Profile - Inquiry
 *	// SCREEN =    13   Cash Accounts - Inquiry
 *	// SCREEN =    23   Money Laundering - Inquiry
 *	
 */
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EIE001001Message;
import datapro.eibs.beans.ELD000001Message;
import datapro.eibs.beans.EIE001101Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;
import datapro.eibs.beans.JBObjList;


public class JSEIE0010 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		switch (screen) {
			// Investment Profile
			case 1 : // Get record For Maintenance
			case 3 : // Get Record For Inquiry
			case 5 : // Submit Record For Update
				procActionRecPrf(user, req, res, session, screen);
				break;
			// Cash Accounts
			case 11 : // Get record For Maintenance
			case 13 : // Get Record For Inquiry
			case 15 : // Submit Record For Update
				procActionRecCsh(user, req, res, session, screen);
				break;
			// Money Laundering
			case 21 : // Get Record For Maintenance
			case 23 : // Get Record For Inquiry
			case 25 : // Submit Record For Update
				procActionRecMny(user, req, res, session, screen);
				break;
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}


	// Portfolio Profile  SCREEN 1, 3, 5
	// Get or Process the Record  
	//
	protected void procActionRecPrf(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send data
		try {
			mp = new MessageProcessor("EIE001001");
			EIE001001Message msg = (EIE001001Message) mp.getMessageRecord("EIE001001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EIE0010");
			msg.setH01TIMSYS(getTimeStamp());
			switch (screen) {
				case 1 : // Request Record for Maintenance
					msg.setH01OPECOD("0003");
					userPO.setPurpose("MAINTENANCE");
					break;
				case 3 : // Request Record for Inquiry
					msg.setH01OPECOD("0003");
					userPO.setPurpose("INQUIRY");
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
			
			msg.setE01PRFNUM(userPO.getCusNum());
			msg.setE01PRFCUN(userPO.getIdentifier());
			
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 1 || screen == 3 ) {
					forward("ESD0088_cus_port_basic.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("EIE0010_inv_port_basic.jsp", req, res);
				}

			} else {
				newmessage = mp.receiveMessageRecord();
				ses.setAttribute("msgRcd", newmessage);
				
				if (screen == 5 ) {     // Update 
					res.sendRedirect(srctx + "/servlet/datapro.eibs.client.JSESD0088?SCREEN=200");	
				} else {
					forward("EIE0010_inv_port_basic.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	// Portfolio Cash Accounts  SCREEN 11, 13, 15
	// Get or Process the Record  
	//
	protected void procActionRecCsh(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send data
		try {
			mp = new MessageProcessor("EIE001101");
			EIE001101Message msg = (EIE001101Message) mp.getMessageRecord("EIE001101");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EIE0011");
			msg.setH01TIMSYS(getTimeStamp());
			switch (screen) {
				case 11 : // Request Record for Maintenance
					msg.setH01OPECOD("0003");
					userPO.setPurpose("MAINTENANCE");
					break;
				case 13 : // Request Record for Inquiry
					msg.setH01OPECOD("0003");
					userPO.setPurpose("INQUIRY");
					break;
				case 25 : // Submit the Record for update
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
			
			msg.setE01PCANUM(userPO.getCusNum());
			msg.setE01PCACUN(userPO.getIdentifier());
			
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 1 || screen == 3 ) {
					forward("ESD0088_cus_port_basic.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("EIE0010_inv_port_acc.jsp", req, res);
				}

			} else {
				newmessage = mp.receiveMessageRecord();
				ses.setAttribute("msgRcd", newmessage);
				
				if (screen == 5 ) {     // Update 
					res.sendRedirect(srctx + "/servlet/datapro.eibs.client.JSESD0088?SCREEN=200");	
				} else {
					forward("EIE0010_inv_port_acc.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	// Portfolio Money Laundering SCREEN 21, 23, 25
	// Get or Process the Record  
	//
	protected void procActionRecMny(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send data
		try {
			mp = new MessageProcessor("EIE001001");
			EIE001001Message msg = (EIE001001Message) mp.getMessageRecord("EIE001001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EIE0010");
			msg.setH01TIMSYS(getTimeStamp());
			switch (screen) {
				case 1 : // Request Record for Maintenance
					msg.setH01OPECOD("0003");
					userPO.setPurpose("MAINTENANCE");
					break;
				case 3 : // Request Record for Inquiry
					msg.setH01OPECOD("0003");
					userPO.setPurpose("INQUIRY");
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
			
			msg.setE01PRFNUM(userPO.getCusNum());
			msg.setE01PRFCUN(userPO.getIdentifier());
			
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 1 || screen == 3 ) {
					forward("ESD0088_cus_port_basic.jsp", req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("msgRcd", newmessage);
					forward("EIE0010_inv_port_basic.jsp", req, res);
				}

			} else {
				newmessage = mp.receiveMessageRecord();
				ses.setAttribute("msgRcd", newmessage);
				
				if (screen == 5 ) {     // Update 
					res.sendRedirect(srctx + "/servlet/datapro.eibs.client.JSESD0088?SCREEN=200");	
				} else {
					forward("EIE0010_inv_port_basic.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	
}