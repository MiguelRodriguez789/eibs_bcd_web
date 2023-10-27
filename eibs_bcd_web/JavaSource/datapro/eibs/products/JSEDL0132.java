package datapro.eibs.products;

/**
 * Split & Merge for CDs 
 * Creation date: (10/09/12)
 * @author: Carlos Castillo
 * 
 * 	//
 *	// 
 */
import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class JSEDL0132 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		
		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) session.getAttribute("userPO");

		switch (screen) {
			 
			case 1 : // Send CD Search Screen
			case 11 :
				procReqCD(user, req, res, session, screen);
				break;
			case 2 : // Send Screen for Split Info
			case 22:	
				procActFR(user, req, res, session, screen);
				break;
			case 3 : // Request new Record
			case 4 : // Delete record	
			case 5 : // Request old Record		
			case 6 : // Submit the Record for update
			case 15: // View	
				procActionRecFR(user, req, res, session, screen);
				break;
			case 9 : // Validate and send split to approval queue
				procActAprFR(user, req, res, session);
				break;
			case 12 : // Send Screen for Merge Info
			case 32 :	
				procActFU(user, req, res, session, screen);
				break;
			case 13 : // Add CD to Merge
			case 14 : // Delete from Merge
				procActionRecFU(user, req, res, session, screen);
				break;
			case 19 : // Validate ans send Merge to approval queue
				procActAprFU(user, req, res, session);
				break;
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	
	// SCREEN = 1, 11 
	// Send CD Search Screen  
	//
	protected void procReqCD(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		userPO.setPurpose("ENTER");
		
		String AppCode = "";		
		try {
			AppCode = req.getParameter("AppCode").trim();
		} catch (Exception e) {
			AppCode = "CD";
		}
		userPO.setOption(AppCode);
		
		switch (screen) {
		case 1 : // Split
			userPO.setType("FR");
			break;
		case 11 : // Merge
			userPO.setType("FU");
			break;	
		default :
			forward(SuperServlet.devPage, req, res);
			break;
	}
		ses.setAttribute("userPO", userPO);
		forwardOnSuccess("EDL0132_cd_enter_fraction.jsp", req, res);
		
	}	
	
	// SCREEN = 2, 22 
	// // Send Screen for Split Info  
	//
	protected void procActFR(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageRecord newmessage = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("EDL0132");
			EDL013201Message msg = (EDL013201Message) mp.getMessageRecord("EDL013201");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDL0132");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0001");
			try {
				msg.setE01DEAACC(req.getParameter("E01DEAACC"));
			} catch (Exception e) {
				msg.setE01DEAACC(userPO.getAccNum());
			}
			if (screen == 2 ) {
				userPO.setPurpose("MAINTENANCE");
			} else {
				userPO.setPurpose("INQUIRY");
			}
			userPO.setType("FR");
			userPO.setIdentifier(msg.getE01DEAACC());
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive answer
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
					forward("EDL0132_cd_enter_fraction.jsp", req, res);
			} else {
				ses.setAttribute("mainDeal", newmessage);
				//	 Receive List
				JBObjList list =
					(JBObjList) mp.receiveMessageRecordList("E13INDOPE","E13NUMREC");
				if (mp.hasError(list)) {
					ses.setAttribute("error", mp.getError(list));
				} else {
					ses.setAttribute("frList", list);
				}
				forwardOnSuccess("EDL0132_cd_split_maintenance.jsp", req, res);
			}
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	// SCREEN = 3,4,5,6, 15
	// Get or Process the Record  - Split
	//
	protected void procActionRecFR(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send data
		try {
			mp = new MessageProcessor("EDL0132");
			EDL013213Message msg = (EDL013213Message) mp.getMessageRecord("EDL013213");
			msg.setH13USERID(user.getH01USR());
			msg.setH13PROGRM("EDL0132");
			msg.setH13TIMSYS(getTimeStamp());
			msg.setH13SCRCOD("01");
			switch (screen) {
				case 3 : // Request new Record
					msg.setH13OPECOD("0003");
					userPO.setPurpose("NEW");
					break;
				case 5 : // Request old Record
				case 15: // View	
					msg.setH13OPECOD("0005");
					if (screen == 5 ) {
						userPO.setPurpose("MAINTENANCE");
					} else {
						userPO.setPurpose("INQUIRY");
					}
					break;
				case 4 : // Delete Record
					msg.setH13OPECOD("0004");
					userPO.setPurpose("MAINTENANCE");
					break;
				case 6 : // Submit the Record for update
					msg.setH13OPECOD("0006");
					userPO.setPurpose("MAINTENANCE");
					break;
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
			//	Get key fields
			try {
				msg.setE13DEAACC(req.getParameter("E01DEAACC"));
			} catch (Exception e) {
				msg.setE13DEAACC("0");
			}
			try {
				msg.setE13FRCACC(req.getParameter("E13FRCACC"));
			} catch (Exception e) {
				msg.setE13FRCACC("0");
			}
			userPO.setIdentifier(msg.getE13DEAACC());
			userPO.setType("FR");
			
			if (screen == 6) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {	}
			}				
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 3 || screen == 4 || screen == 5) {
					forward("EDL0132_cd_split_maintenance.jsp", req, res);
				} else {
					//	Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("dataMsg", newmessage);
					forward("EDL0132_cd_split_detail.jsp", req, res);
				}

			} else {
				if (screen == 4 || screen == 6) {
					redirectToPage("/servlet/datapro.eibs.products.JSEDL0132?SCREEN=2&FromRecord=0&E01DEAACC=" + userPO.getIdentifier(), res);
				} else {
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("dataMsg", newmessage);
					forwardOnSuccess("EDL0132_cd_split_detail.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	// SCREEN = 9 
	// // Send Split to Approval Queue  
	//
	protected void procActAprFR(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageRecord newmessage = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("EDL0132");
			EDL013201Message msg = (EDL013201Message) mp.getMessageRecord("EDL013201");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDL0132");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0009");
			try {
				msg.setE01DEAACC(req.getParameter("E01DEAACC"));
			} catch (Exception e) {
				msg.setE01DEAACC("0");
			}
			userPO.setPurpose("MAINTENANCE");
			userPO.setIdentifier(msg.getE01DEAACC());
			userPO.setType("FR");
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive answer
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				forward("EDL0132_cd_split_maintenance.jsp", req, res);
			} else {
				forwardOnSuccess("EDL0132_split_conf.jsp", req, res);
			}
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	// SCREEN = 12, 32 
	// Send Screen for Merge Info  
	//
	protected void procActFU(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageRecord newmessage = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("EDL0132");
			EDL013201Message msg = (EDL013201Message) mp.getMessageRecord("EDL013201");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDL0132");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0011");
			try {
				msg.setE01DEAACC(req.getParameter("E01DEAACC"));
			} catch (Exception e) {
				msg.setE01DEAACC(userPO.getAccNum());
			}
			
			if (screen == 12 ) {
				userPO.setPurpose("MAINTENANCE");
			} else {
				userPO.setPurpose("INQUIRY");
			}

			userPO.setType("FU");
			userPO.setIdentifier(msg.getE01DEAACC());
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive answer
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
					forward("EDL0132_cd_enter_fraction.jsp", req, res);
			} else {
				ses.setAttribute("mainDeal", newmessage);
				//	 Receive List
				JBObjList list =
					(JBObjList) mp.receiveMessageRecordList("E13INDOPE","E13NUMREC");
				if (mp.hasError(list)) {
					ses.setAttribute("error", mp.getError(list));
				} else {
					ses.setAttribute("fuList", list);
				}
				forwardOnSuccess("EDL0132_cd_merge_maintenance.jsp", req, res);
			}
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	// SCREEN = 13,14
	// Get or Process the Record  - Merge
	//
	protected void procActionRecFU(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send data
		try {
			mp = new MessageProcessor("EDL0132");
			EDL013213Message msg = (EDL013213Message) mp.getMessageRecord("EDL013213");
			msg.setH13USERID(user.getH01USR());
			msg.setH13PROGRM("EDL0132");
			msg.setH13TIMSYS(getTimeStamp());
			msg.setH13SCRCOD("01");
			switch (screen) {
				case 13 : // Request new Record
					msg.setH13OPECOD("0013");
					userPO.setPurpose("NEW");
					break;
				case 14 : // Delete Record
					msg.setH13OPECOD("0014");
					userPO.setPurpose("MAINTENANCE");
					break;
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
			//	Get key fields
			try {
				msg.setE13DEAACC(req.getParameter("E01DEAACC"));
			} catch (Exception e) {
				msg.setE13DEAACC("0");
			}
			try {
				msg.setE13FRCACC(req.getParameter("E13FRCACC"));
			} catch (Exception e) {
				msg.setE13FRCACC("0");
			}
			userPO.setIdentifier(msg.getE13DEAACC());
			
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			userPO.setType("FU");
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				forward("EDL0132_cd_merge_maintenance.jsp", req, res);
			} else {
				redirectToPage("/servlet/datapro.eibs.products.JSEDL0132?SCREEN=12&FromRecord=0&E01DEAACC=" + userPO.getIdentifier(), res);
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	// SCREEN = 19 
	// // Send Merge to Approval Queue  
	//
	protected void procActAprFU(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageRecord newmessage = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("EDL0132");
			EDL013201Message msg = (EDL013201Message) mp.getMessageRecord("EDL013201");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDL0132");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0019");
			try {
				msg.setE01DEAACC(req.getParameter("E01DEAACC"));
			} catch (Exception e) {
				msg.setE01DEAACC("0");
			}
			userPO.setPurpose("MAINTENANCE");
			userPO.setIdentifier(msg.getE01DEAACC());
			userPO.setType("FU");
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive answer
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				forward("EDL0132_cd_merge_maintenance.jsp", req, res);
			} else {
				forwardOnSuccess("EDL0132_split_conf.jsp", req, res);
			}
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	
}