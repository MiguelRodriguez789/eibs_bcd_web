package datapro.eibs.bap;
/**
 * Source Documents Rating - Accounts Payable 
 * Creation date: (03/17/11)
 * @author: Linet Riaño
 * 	// List of Options
 * 	//
 *	// SCREEN =    1	Send screen for selection parameters
 *	// SCREEN =    2    Send List with results for inquiry
 *	// SCREEN =    3    Send Rating Service - old record
 *  // SCREEN =    5    Send Rating Service
 *  // SCREEN =    6    Submit Record for update
 */

import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class JSEBP0138 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		switch (screen) {
			//  
		case 1 : // Request Search Parameters 
			procReqSrhPrm(user, req, res, session);
			break;
		case 2 : // Send list with results for inquery
		    procReqList(user, req, res, session, screen);
			break;  
		case 3 : // Send Source Document Rating - Request old record
		case 4 : // Delete record	
		case 5 : // New Record
        case 6 : // Submit Record for update
            procActionRec(user, req, res, session, screen);
			break;
		default :
			forward(SuperServlet.devPage, req, res);
			break;
		}
	}

	// SCREEN = 1 
	// Send Screen for Search Parameters  
	//
	protected void procReqSrhPrm(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		userPO.setPurpose("ENTER");
		ses.setAttribute("userPO", userPO);
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("EBP0138");
			EBP013801Message msg = (EBP013801Message) mp.getMessageRecord("EBP013801");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EBP0138");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			try {
				msg.setE01REQTYP(req.getParameter("E01REQTYP"));
			} catch (Exception e) { 
				msg.setE01REQTYP("P");
			}
			ses.setAttribute("msgList", msg);
			forwardOnSuccess("EBP0138_source_rating_search.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	// SCREEN = 2 
	// Send List with Search Results  
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("EBP0138");
			EBP013801Message msg = (EBP013801Message) mp.getMessageRecord("EBP013801");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EBP0138");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			
			switch (screen) {
		    case 2 : // List Source Documents
		        msg.setH01OPECOD("0001");
				userPO.setPurpose("INQUIRY");
			    break;
			default :
				forward(SuperServlet.devPage, req, res);
				break;
			}			
			try {
				msg.setE01NUMREC(req.getParameter("FromRecord"));
			} catch (Exception e) {
				msg.setE01NUMREC("0"); 
			}
			try {
				msg.setE01REQTYP(req.getParameter("E01REQTYP"));
			} catch (Exception e) { 
				msg.setE01REQTYP("V");
			}
			try {
				msg.setE01REQBNK(req.getParameter("E01REQBNK"));
			} catch (Exception e) { 
				msg.setE01REQBNK("01");
			}
			try {
				msg.setE01REQBRN(req.getParameter("E01REQBRN"));
			} catch (Exception e) { 
				msg.setE01REQBRN("");
			}
			try {
				msg.setE01REQKIN(req.getParameter("E01REQKIN"));
			} catch (Exception e) { 
				msg.setE01REQKIN(" ");
			}
			try {
				msg.setE01REQDFM(req.getParameter("E01REQDFM")); 
			} catch (Exception e) { 
				msg.setE01REQDFM("0");
			}
			try {
				msg.setE01REQDFD(req.getParameter("E01REQDFD"));
			} catch (Exception e) { 
				msg.setE01REQDFD("0");
			}
			try {
				msg.setE01REQDFY(req.getParameter("E01REQDFY"));
			} catch (Exception e) { 
				msg.setE01REQDFY("0");
			}
			
			try {
				msg.setE01REQDTM(req.getParameter("E01REQDTM"));
			} catch (Exception e) { 
				msg.setE01REQDTM("0");
			}
			try {
				    msg.setE01REQDTD(req.getParameter("E01REQDTD"));
			} catch (Exception e) { 
				msg.setE01REQDTD("0");
			}
			try {
				    msg.setE01REQDTY(req.getParameter("E01REQDTY"));
			} catch (Exception e) { 
				msg.setE01REQDFY("0");
			}
			
			userPO.setBank(msg.getE01REQBNK());
			userPO.setBranch(msg.getE01REQBRN());
			userPO.setHeader1(msg.getE01REQTYP());
			userPO.setHeader2(req.getParameter("E01REQDFM"));
			userPO.setHeader3(req.getParameter("E01REQDFD"));
			userPO.setHeader4(req.getParameter("E01REQDFY"));
			userPO.setHeader5(req.getParameter("E01REQDTM"));
			userPO.setHeader6(req.getParameter("E01REQDTD"));
			userPO.setHeader7(req.getParameter("E01REQDTY"));
			userPO.setHeader8(msg.getE01REQKIN());
			
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list = (JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("EBP0138List", list);
			}
			forward("EBP0138_source_rating_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	//	 SCREEN = 3,4,5,6,
	// Get or Process Record  
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
			mp = new MessageProcessor("EBP0138");
			EBP013801Message msg = (EBP013801Message) mp.getMessageRecord("EBP013801");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EBP0138");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			
			msg.setE01REQBNK(userPO.getBank());
			msg.setE01REQBRN(userPO.getBranch());
			msg.setE01REQTYP(userPO.getHeader1());
			msg.setE01REQDFM(userPO.getHeader2());
			msg.setE01REQDFD(userPO.getHeader3());
			msg.setE01REQDFY(userPO.getHeader4());
			msg.setE01REQDTM(userPO.getHeader5());
			msg.setE01REQDTD(userPO.getHeader6());
			msg.setE01REQDTY(userPO.getHeader7());
			msg.setE01REQKIN(userPO.getHeader8());
			
			switch (screen) {
			    case 3 : // Request old Record
			        msg.setH01OPECOD("0003");
			        userPO.setPurpose("MAINTENANCE");
				    break;
			    case 4 : // Delete Record
					msg.setH01OPECOD("0004");
					break;
			    case 5 : // Request new Record
					msg.setH01OPECOD("0002");
					userPO.setPurpose("NEW");
					break;
				case 6 : // Submit the Record for update
					msg.setH01OPECOD("0005");
					break;
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
			// Get page field
			try {
				msg.setE01BDCNUM(req.getParameter("E01BDCNUM"));
			} catch (Exception e) {
				msg.setE01BDCNUM("888");
			}
			userPO.setIdentifier(msg.getE01BDCNUM());

			if (screen == 6) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {				
				}
			}
			
			msg.setE01ACT(" ");
			msg.setH01FLGWK1(""); 
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 3 || screen == 4 || screen == 5 ) {
					redirectToPage("/servlet/datapro.eibs.bap.JSEBP0138?SCREEN=2&FromRecord=0" +
							"&E01REQBNK=" + userPO.getBank() + 
						    "&E01REQBRN=" + userPO.getBranch() +
							"&E01REQTYP=" + userPO.getHeader1() + 
					        "&E01REQDFM=" + userPO.getHeader2() +
				  			"&E01REQDFD=" + userPO.getHeader3() +
				  			"&E01REQDFY=" + userPO.getHeader4() +
				  			"&E01REQDTM=" + userPO.getHeader5() +
				  			"&E01REQDTD=" + userPO.getHeader6() +
				  			"&E01REQDTY=" + userPO.getHeader7() +
							"&E01REQKIN=" + userPO.getHeader8() +
							"", res);
				} else {
					// Receive Data Error
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("EBP0138Record", newmessage);
					forward("EBP0138_source_rating_detail.jsp", req, res);				 
				}
			} else {
				if (screen == 5 ) {
					ses.setAttribute("EBP0138Record", newmessage);
					forwardOnSuccess("EBP0138_source_rating_detail.jsp", req, res);
				} else {
					redirectToPage("/servlet/datapro.eibs.bap.JSEBP0138?SCREEN=2&FromRecord=0"+
							"&E01REQBNK=" + userPO.getBank() + 
						    "&E01REQBRN=" + userPO.getBranch() +
							"&E01REQTYP=" + userPO.getHeader1() + 
				  			"&E01REQDFM=" + userPO.getHeader2() +
				  			"&E01REQDFD=" + userPO.getHeader3() +
				  			"&E01REQDFY=" + userPO.getHeader4() +
				  			"&E01REQDTM=" + userPO.getHeader5() +
				  			"&E01REQDTD=" + userPO.getHeader6() +
				  			"&E01REQDTY=" + userPO.getHeader7() +
				  			"&E01REQKIN=" + userPO.getHeader8() +
							"", res);
				}
			}

	} finally {
			if (mp != null) 
				mp.close();
		}
	}

}