package datapro.eibs.treasury;
/**
 * Treasury - Main  
 * Creation date: (09/15/16)
 * @author: Carlos Castillo
 *  
 * 	// List of Options
 * 	//
 *	// SCREEN =    1	Dealer Slip - Send List Treasury Products & Clients 
 *	// SCREEN =    2    Dealer Slip - New or Maintenance 
 *	// SCREEN =    3    Dealer Slip - Old deal maintenance
 *  // SCREEN =   11    BackOffice - Send List Treasury Type of Products & Deals in Dealer Slip
 *  // SCREEN =   12    BackOffice - Complete or maintenance
 *  // SCREEN =   14    BackOffice - Reject
 *  // SCREEN =   21    Approval List   
 *  // SCREEN =   25    BackOffice - Approval 
 *  // SCREEN =   51    Help for Treasury Accounts
 */	

import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class JSETR0000 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {

		UserPos userPO = new UserPos();
		session.setAttribute("userPO", userPO);
		
		switch (screen) {
			 
			case 1  : // Requests List
				procReqList(user, req, res, session, screen);
				break;
			case 2  : // New or Maintenance on Dealer Slip Deal
			case 3  :	
				procActionDS(user, req, res, session, screen);
				break;
			case 11  :
			case 21  :	
				procReqDSList(user, req, res, session, screen);
				break;
			case 12 : // Complete or Maintenance on Deal for BackOffice
			case 14 :
			case 16 :	
				procActionBO(user, req, res, session, screen);
				break;
			case 25 :	
				procActionApr(user, req, res, session, screen);
				break;	
			case 41 : // Request List for Treasury Line of Credit
				procReqListLC(user, req, res, session, screen);
				break;
			case 42 : // Update Treasury Line of Credit
			case 43 :
			case 44 :
			case 45 :
				procActionLC(user, req, res, session, screen);
				break;	
			case 100:
				procReqPassword(user, req, res, session, screen);
				break;
			default :
				forward(SuperServlet.devPage, req, res);
				break;  
		}
	}

	// SCREEN = 1 
	// Send List of Treasury Products & Customers  
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("ETR0000");
			//
			// Products List
			//
			ETR000001Message msg = (ETR000001Message) mp.getMessageRecord("ETR000001");
			
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ETR0000");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0001");
			msg.setE01NUMREC("0"); 
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list = (JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("prodList", list);
			}
			//
			// Customers List
			//
			mp = null;
			mp = new MessageProcessor("ETR0000");
			ETR000002Message msgC = (ETR000002Message) mp.getMessageRecord("ETR000002");
			// Send Initial data
			msgC.setH02USERID(user.getH01USR());
			msgC.setH02PROGRM("ETR0000");
			msgC.setH02TIMSYS(getTimeStamp());
			msgC.setH02SCRCOD("01");
			msgC.setH02OPECOD("0001");
			msgC.setE02NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			// Send Message	
			mp.sendMessage(msgC);
			// Receive List
			JBObjList listC = (JBObjList) mp.receiveMessageRecordList("E02INDOPE","E02NUMREC");
			if (mp.hasError(listC)) {
				ses.setAttribute("error", mp.getError(listC));
			} else {
				ses.setAttribute("custList", listC);
			}

			forward("ETR0000_dealer_slip.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	// SCREEN = 2, 3
	// Dealer Slip - New or Maintenance  
	//
	protected void procActionDS(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;
		String program = "";
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send data
		try {
			mp = new MessageProcessor("ETR0000");
			ETR000001Message msg = (ETR000001Message) mp.getMessageRecord("ETR000001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ETR0000");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0002");
			userPO.setPurpose("NEW");
			
			//	Get key fields
			msg.setR01TREPRD((req.getParameter("R01TREPRD") == null ? "" : req.getParameter("R01TREPRD")));
			msg.setR01TRETYP((req.getParameter("R01TRETYP") == null ? "" : req.getParameter("R01TRETYP")));
			msg.setR01TREDSC((req.getParameter("R01TREDSC") == null ? "" : req.getParameter("R01TREDSC")));
			msg.setR01TREACD((req.getParameter("R01TREACD") == null ? "" : req.getParameter("R01TREACD")));
			msg.setR01TREACC((req.getParameter("R01TREACC") == null ? "0" : req.getParameter("R01TREACC")));
			msg.setR01TRECUN((req.getParameter("R01TRECUN") == null ? "0" : req.getParameter("R01TRECUN")));
			msg.setR01TREPGM((req.getParameter("R01TREPGM") == null ? "ETR0000" : req.getParameter("R01TREPGM")));
			program = msg.getR01TREPGM().trim();
			if (!msg.getR01TREACC().equals("0")) {
				msg.setH01OPECOD("0003");
				userPO.setPurpose("MAINTENANCE");
			}
			userPO.setType(msg.getR01TRETYP());
			msg.setE01ACT(" ");
			msg.setH01FLGWK1(""); 
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				forward("ETR0000_dealer_slip.jsp", req, res);
			} else {
				ses.setAttribute("base", newmessage);
				msg = (ETR000001Message) newmessage;
				program = msg.getR01TREPGM().trim();
				userPO.setType(msg.getR01TRETYP());
				redirectToPage("/servlet/datapro.eibs.treasury.JS" + program + "?SCREEN=" + screen, res);
			}
		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	// SCREEN = 11 , 21
	// Send List of Treasury Type of Products & Deals in Dealer Slip  
	//
	protected void procReqDSList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("ETR0000");
			//
			// Products List
			//
			ETR000001Message msg = (ETR000001Message) mp.getMessageRecord("ETR000001");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ETR0000");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0001");
			msg.setE01NUMREC("0"); 
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list = (JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("prodList", list);
			}
			// 
			// Dealer Slip Accounts List
			//
			mp = null;
			mp = new MessageProcessor("ETR0000");
			ETR000003Message msgC = (ETR000003Message) mp.getMessageRecord("ETR000003");
			// Send Initial data
			msgC.setH03USERID(user.getH01USR());
			msgC.setH03PROGRM("ETR0000");
			msgC.setH03TIMSYS(getTimeStamp());
			msgC.setH03SCRCOD("01");
			if (screen == 11 ) {
				msgC.setH03OPECOD("0001");
			}
			if (screen == 21 ) {
				msgC.setH03OPECOD("0011");
			}
			msgC.setE03NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			msgC.setE03TRDSTS((req.getParameter("E03TRDSTS") == null ? "" : req.getParameter("E03TRDSTS")));
			msgC.setE03TRDTYP((req.getParameter("E03TRDTYP") == null ? "" : req.getParameter("E03TRDTYP")));
			msgC.setE03TRDPRO((req.getParameter("E03TRDPRO") == null ? "" : req.getParameter("E03TRDPRO")));
			msgC.setE03TRDCUN((req.getParameter("E03TRDCUN") == null ? "0" : req.getParameter("E03TRDCUN")));
			msgC.setE03TRDACC((req.getParameter("E03TRDACC") == null ? "0" : req.getParameter("E03TRDACC")));
			// Send Message	
			mp.sendMessage(msgC);
			// Receive List
			JBObjList listC = (JBObjList) mp.receiveMessageRecordList("E03INDOPE","E03NUMREC");
			if (mp.hasError(listC)) {
				ses.setAttribute("error", mp.getError(listC));
			} else {
				ses.setAttribute("dealList", listC);
			}
			if (screen == 21 ) {
				forward("ETR0000_approval.jsp", req, res);
			} else {
				forward("ETR0000_backoffice.jsp", req, res);
			}
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	// SCREEN = 12, 14, 16
	// BackOffice - Complete or Maintenance or Inquiry 
	//
	protected void procActionBO(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;
		String program = "";
		String format = "";
		String reference = "";
		String account = "";
		String url = "";
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send data
		try {
			mp = new MessageProcessor("ETR0000");
			ETR000003Message msg = (ETR000003Message) mp.getMessageRecord("ETR000003");
			msg.setH03USERID(user.getH01USR());
			msg.setH03PROGRM("ETR0000");
			msg.setH03TIMSYS(getTimeStamp());
			msg.setH03SCRCOD("01");
			msg.setH03OPECOD("0002");
			userPO.setPurpose("MAINTENANCE");
			int newScreen = 3;
			if (screen == 14) {
				msg.setH03OPECOD("0004"); // Reject
			}
			if (screen == 16) {
				userPO.setPurpose("INQUIRY");
				newScreen = 6;
			}
			
			//	Get key fields
			msg.setE03TRDACC((req.getParameter("E03TRDACC") == null ? "" : req.getParameter("E03TRDACC")));
			msg.setE03ACT((req.getParameter("action") == null ? "" : req.getParameter("action")));
			msg.setE03MSGTXT((req.getParameter("reason") == null ? "" : req.getParameter("reason")));
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				forward("ETR0000_backoffice.jsp", req, res);
			} else {
				newmessage = mp.receiveMessageRecord();
				program = newmessage.getField("E03TRDPGM").toString().trim();
				format = newmessage.getField("E03TRDFMT").toString().trim();
				reference = newmessage.getField("E03TRDACC").toString().trim();
				account = newmessage.getField("E03TRDDAC").toString().trim();
				ses.setAttribute("base", newmessage);
				if (screen == 14) {
					redirectToPage("/servlet/datapro.eibs.treasury.JSETR0000?SCREEN=11&E03TRDSTS=X", res);
				}
				//
				if (format.equals("EDL013111")) {
					url = "/servlet/datapro.eibs.treasury.JS" + program + "?SCREEN=" + newScreen + "&E11DEAREF=" + reference + "&E02DEAACC=" + account;
				} else if (format.equals("EDL010502")) {
					url = "/servlet/datapro.eibs.treasury.JS" + program + "?SCREEN=" + newScreen + "&E02DEAREF=" + reference + "&E02DEAACC=" + account;
				} else if (format.equals("EDL010802")) {
					url = "/servlet/datapro.eibs.treasury.JS" + program + "?SCREEN=" + newScreen + "&E02DEAREF=" + reference + "&E02DEAACC=" + account;
				} else if (format.equals("EFE0120DS")) {
					url = "/servlet/datapro.eibs.treasury.JS" + program + "?SCREEN=" + newScreen + "&E02FESREF=" + reference + "&E01FESACC=" + account;
				} else if (format.equals("ETR0130DS")) {
					url = "/servlet/datapro.eibs.treasury.JS" + program + "?SCREEN=" + newScreen + "&E01WFRREF=" + reference + "&E01WFRACC=" + account;
				}
				// 
				redirectToPage(url , res);
			    //	
			}
		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	
	// SCREEN = 25
	// BackOffice - Contract Approval 
	//
	protected void procActionApr(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send data
		try {
			mp = new MessageProcessor("EDL0140");
			EDL014002Message msg = (EDL014002Message) mp.getMessageRecord("EDL014002");
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("EDL0140");
			msg.setH02TIMSYS(getTimeStamp());
			msg.setH02SCRCOD("06");
		 	msg.setE02ACTION((req.getParameter("action") == null ? "A" : req.getParameter("action")));
		 	msg.setE02MSGTXT((req.getParameter("reason") == null ? " " : req.getParameter("reason")));
		 	
			//	Get key fields
			msg.setE02DEAACC((req.getParameter("E03TRDDAC") == null ? "0" : req.getParameter("E03TRDDAC")));
			
			userPO.setPurpose("APPROVAL");
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				forward("ETR0000_approval.jsp", req, res);
			} else {
				redirectToPage("/servlet/datapro.eibs.treasury.JSETR0000?SCREEN=21&E03TRDSTS=B", res);
			}
		} finally {
			if (mp != null) 
				mp.close();
		}
	}
	
	// SCREEN = 41 
	// Send List of Treasury Customers for Line of Credit 
	//
	protected void procReqListLC(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("ETR0000");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			ses.setAttribute("userPO", userPO);
			//
			// Customers List
			//
			ETR000002Message msgC = (ETR000002Message) mp.getMessageRecord("ETR000002");
			// Send Initial data
			msgC.setH02USERID(user.getH01USR());
			msgC.setH02PROGRM("ETR0000");
			msgC.setH02TIMSYS(getTimeStamp());
			msgC.setH02SCRCOD("01");
			msgC.setH02OPECOD("0001");
			msgC.setE02NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			// Send Message	
			mp.sendMessage(msgC);
			// Receive List
			JBObjList listC =
				(JBObjList) mp.receiveMessageRecordList("E02INDOPE","E02NUMREC");
			if (mp.hasError(listC)) {
				ses.setAttribute("error", mp.getError(listC));
			} else {
				ses.setAttribute("custList", listC);
			}

			forward("ETR0000_line_credit.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}	
	
	// SCREEN = 42, 43, 44, 45
	// Treasury Credit Lines Maintenance  
	//
	protected void procActionLC(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		// Send data
		try {
			
			mp = null;
			mp = new MessageProcessor("ELN0000");
			newmessage = null;
			ELN000001Message msg = (ELN000001Message) mp.getMessageRecord("ELN000001");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ELN0000");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("");
			msg.setH01OPECOD("0002");
			//
			switch (screen) {
			case 42 : // Process new Record
				msg.setH01OPECOD("0001");
				userPO.setPurpose("NEW");
				break;
			case 43 : // Get old Record
				msg.setH01OPECOD("0002");
				userPO.setPurpose("MAINTENANCE");
				break;	
			case 44 : // Delete Record
				msg.setH01OPECOD("0009");
				userPO.setPurpose("MAINTENANCE");
				break;
			case 45 : // Update Record
				msg.setH01OPECOD("0005");
				userPO.setPurpose("MAINTENANCE");
				break;	
			default :
				forward(SuperServlet.devPage, req, res);
				break;
			}
		
			msg.setE01WLNNUM(("6666"));
			msg.setE01WLNTYL(("TRS"));
			msg.setE01WLNCUN((req.getParameter("R01TRECUN") == null ? "0" : req.getParameter("R01TRECUN")));
			
			if ((screen == 44 || screen == 45)) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {	}
			}				
			// Send Message	
			mp.sendMessage(msg);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
			} else {	
				if (screen == 4 ) {
					redirectToPage("/servlet/datapro.eibs.treasury.JSETR0000?SCREEN=41", res);
				}	
			}
			newmessage = mp.receiveMessageRecord();
			ses.setAttribute("msg", newmessage);
			ses.setAttribute("userPO", userPO);
			forward("ETR0000_line_credit_maint.jsp", req, res);

		} finally {
			if (mp != null) 
				mp.close();
		}
	}
	
	protected void procReqPassword(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
					throws ServletException, IOException {
		
		UserPos	userPO = null;
		userPO = (datapro.eibs.beans.UserPos)ses.getAttribute("userPO");
		userPO.setRedirect("/servlet/datapro.eibs.treasury.JSETR0000?SCREEN=21&E03TRDSTS=B");
		ses.setAttribute("userPO", userPO);
		redirectToPage("/servlet/datapro.eibs.menu.JSESS0030?SCREEN=7", res);
	}	
	
}	