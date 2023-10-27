package datapro.eibs.treasury;
/**
 * BackOffice for Treasury Deposits        
 * Creation date: (10/20/16)
 * @author: Carlos Castillo
 * 
 * 	// List of Options
 * 	//
 *	// SCREEN =    3    Request old record
 *	// SCREEN =    4	Delete record  
 *	// SCREEN =    5	Submit the record for Update
 */
import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class JSEDL0131 extends JSEIBSServlet { 
	 
	/**
	 *  Menu   
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		
		UserPos userPO = null;
		userPO = getUserPos(req);

		switch (screen) {
			 
			case 3 : // Request BackOffice
			case 4 : // Delete BackOffice
			case 5 : // Submit the Record for Update
			case 6 : // Inquiry	
				procActionRec(user, req, res, session, screen);
				break;
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}


	// SCREEN = 3,4,5,6
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
			
			mp = null;
			mp = new MessageProcessor("EDL0131");
			newmessage = null;
			EDL013111Message msgD = (EDL013111Message) mp.getMessageRecord("EDL013111");
			// Send Initial data
			msgD.setH11USERID(user.getH01USR());
			msgD.setH11PROGRM("EDL0131");
			msgD.setH11TIMSYS(getTimeStamp());
			msgD.setH11SCRCOD("01");
			msgD.setH11OPECOD("0003");
			msgD.setE11DEAREF((req.getParameter("E11DEAREF") == null ? "" : req.getParameter("E11DEAREF")));
			msgD.setE11DEAACC((req.getParameter("E11DEAACC") == null ? "0" : req.getParameter("E11DEAACC")));
			//
			userPO.setPurpose("MAINTENANCE");
            //
			switch (screen) {
			case 3 : // Get old Record
				msgD.setH11OPECOD("0003");
				break;	
			case 4 : // Delete Record
				msgD.setH11OPECOD("0004");
				break;
			case 5 : // Update Record
				msgD.setH11OPECOD("0005");
				break;	
			case 6 : // Inquiry Record
				msgD.setH11OPECOD("0002");	
				userPO.setPurpose("INQUIRY");
				break;
			default :
				forward(SuperServlet.devPage, req, res);
				break;
			}
		
			if ((screen == 4 || screen == 5)) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msgD);
				} catch (Exception e) {	}
			}				
			// Send Message	
			mp.sendMessage(msgD);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
			} else {	
				if (screen == 4 ) {
					redirectToPage("/servlet/datapro.eibs.treasury.JSETR0000?SCREEN=11&E03TRDSTS=X", res);
				}	
			}
			newmessage = mp.receiveMessageRecord();
			ses.setAttribute("deal", newmessage);
			ses.setAttribute("userPO", userPO);
			forward("EDL0131_backoffice.jsp", req, res);

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

}