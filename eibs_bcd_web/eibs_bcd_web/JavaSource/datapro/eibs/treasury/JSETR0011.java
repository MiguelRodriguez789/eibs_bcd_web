package datapro.eibs.treasury;
/**
 * Dealer Slip for Treasury Deposits 
 * Creation date: (11/18/16)
 * @author: Carlos Castillo
 * 
 * 	// List of Options
 * 	//
 *	// SCREEN =    2	Process Dealer Slip 
 *	// SCREEN =    3    Request old record
 *	// SCREEN =    4	Delete record  
 *	// SCREEN =    5	Submit the record for Update
 *  // SCREEN =    6	Get Original Deal Data
 */
import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class JSETR0011 extends JSEIBSServlet { 
	 
	/**
	 *  Menu   
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		
		UserPos userPO = null;
		userPO = getUserPos(req);

		switch (screen) {
			 
			case 2 : // Process new Dealer Slip
			case 3 : // Request old Dealer Slip
			case 4 : // Delete Dealer Slip
			case 5 : // Submit the Record for Update
			case 6 : // Get Original Deal Data	
				procActionRec(user, req, res, session, screen);
				break;
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}


	// SCREEN = 2,3,4,5, 6
	// Get or Process the Record  
	//
	protected void procActionRec(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;
		ETR000001Message base = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		base = (datapro.eibs.beans.ETR000001Message) ses.getAttribute("base");
		// Send data
		try {
			
			mp = null;
			mp = new MessageProcessor("ETR0011");
			newmessage = null;
			ETR001101Message msgD = (ETR001101Message) mp.getMessageRecord("ETR001101");
			// Send Initial data
			msgD.setH01USERID(user.getH01USR());
			msgD.setH01PROGRM("ETR0011");
			msgD.setH01TIMSYS(getTimeStamp());
			msgD.setH01SCRCOD("01");
			msgD.setH01OPECOD("0001");
			msgD.setE01DLSACC(base.getR01TREACC());
			if (!msgD.getE01DLSACC().equals("0")) {
				msgD.setH01OPECOD("0003");
			}
			msgD.setE01DLSCUN(base.getR01TRECUN());
			msgD.setE01DLSPRO(base.getR01TREPRD());
			msgD.setE01DLSTYP(base.getR01TRETYP());
			msgD.setE01DLSACD(base.getR01TREACD());
			//
			switch (screen) {
			case 2 : // Process new Record
				msgD.setH01OPECOD("0001");
				userPO.setPurpose("NEW");
				break;
			case 3 : // Get old Record
				msgD.setH01OPECOD("0003");
				userPO.setPurpose("MAINTENANCE");
				break;	
			case 4 : // Delete Record
				msgD.setH01OPECOD("0004");
				userPO.setPurpose("MAINTENANCE");
				break;
			case 5 : // Update Record
				msgD.setH01OPECOD("0005");
				userPO.setPurpose("MAINTENANCE");
				break;
			case 6 : // Get Original Data
				msgD.setH01OPECOD("0006");
				userPO.setPurpose("MAINTENANCE");
				break;	
			default :
				forward(SuperServlet.devPage, req, res);
				break;
			}
		
			if ((screen == 4 || screen == 5 || screen == 6)) {
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
					redirectToPage("/servlet/datapro.eibs.treasury.JSETR0000?SCREEN=1", res);
				}	
			}
			newmessage = mp.receiveMessageRecord();
			ses.setAttribute("base", base);
			ses.setAttribute("deal", newmessage);
			ses.setAttribute("userPO", userPO);
			forward("ETR0011_dealer_slip.jsp", req, res);

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

}