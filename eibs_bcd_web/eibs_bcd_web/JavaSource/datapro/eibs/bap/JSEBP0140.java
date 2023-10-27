package datapro.eibs.bap;
/**
 * Accounts Payable - Payments Selection
 * Creation date: (03/02/10)
 * @author: C. Castillo
 * 	// List of Options
 * 	//
 *	// SCREEN =    1	Send screen for selection parameters
 *	// SCREEN =    2    Send List with bills selected
 *	// SCREEN =    3    Request to Modify Payment
 *  // SCREEN =    4    Confirm / Deny Payment
 *  // SCREEN =    5    Confirm All
 *  // SCREEN =    6    Validate & Modify Payment  
 */

import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class JSEBP0140 extends JSEIBSServlet { 
	 
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
		case 2 : // Send list with results for Process
			procReqList(user, req, res, session, screen);
			break;
		case 3 : // Request to Modify Payment
			procReqModPay(user, req, res, session);
			break;
       	case 4 : // Confirm / Deny Payment
       		procActionConDen(user, req, res, session);
       		break;
		case 5 : // Confirm All
			procActionConAll(user, req, res, session);
			break;
		case 6 : // Validate and modify Payment
			procActionModPay(user, req, res, session);
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
			mp = new MessageProcessor("EBP0140");
			EBP014001Message msg = (EBP014001Message) mp.getMessageRecord("EBP014001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EBP0140");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			try {
				msg.setE01REQTYP(req.getParameter("E01REQTYP"));
			} catch (Exception e) { 
				msg.setE01REQTYP("V");
			}
			ses.setAttribute("msgList", msg);
			forwardOnSuccess("EBP0140_pay_search.jsp", req, res);
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
			mp = new MessageProcessor("EBP0140");
			EBP014001Message msg = (EBP014001Message) mp.getMessageRecord("EBP014001");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EBP0140");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0001");
			userPO.setPurpose("PAY");
						
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
				msg.setE01REQPVI(req.getParameter("E01REQPVI"));
			} catch (Exception e) { 
				msg.setE01REQPVI("T");
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
				msg.setE01REQDTD("0");
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
			userPO.setType(msg.getE01REQTYP());
			userPO.setHeader1(msg.getE01REQPVI());
			userPO.setHeader2(req.getParameter("E01REQDFM"));
			userPO.setHeader3(req.getParameter("E01REQDFD"));
			userPO.setHeader4(req.getParameter("E01REQDFY"));
			userPO.setHeader5(req.getParameter("E01REQDTM"));
			userPO.setHeader6(req.getParameter("E01REQDTD"));
			userPO.setHeader7(req.getParameter("E01REQDTY"));
			userPO.setHeader8(msg.getE01REQDFY());
			userPO.setHeader9(msg.getE01REQDFM());
			userPO.setHeader10(msg.getE01REQDFD());
			userPO.setHeader11(msg.getE01REQDTY());
			userPO.setHeader12(msg.getE01REQDTM());
			userPO.setHeader13(msg.getE01REQDTD());
			
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
				forward("EBP0140_pay_search.jsp", req, res);
			} else {
				ses.setAttribute("EBP0140List", list);
				forwardOnSuccess("EBP0140_pay_list.jsp", req, res);
			}
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	// SCREEN = 3
	// Request to Modify Payment  
	//
	protected void procReqModPay(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		MessageRecord newmessageD = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		userPO.setPurpose("MAINTENANCE");
				
		// Send request for payment details
		try {
			mp = new MessageProcessor("EBP0140");
			EBP014001Message msg = (EBP014001Message) mp.getMessageRecord("EBP014001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EBP0140");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
	        msg.setH01OPECOD("0003");
			
			msg.setE01REQBNK(userPO.getBank());
			msg.setE01REQBRN(userPO.getBranch());
			msg.setE01REQTYP(userPO.getType());
			msg.setE01REQPVI(userPO.getHeader1());
			msg.setE01REQDFY(userPO.getHeader8());
			msg.setE01REQDFM(userPO.getHeader9());
			msg.setE01REQDFD(userPO.getHeader10());
			msg.setE01REQDTY(userPO.getHeader11());
			msg.setE01REQDTM(userPO.getHeader12());
			msg.setE01REQDTD(userPO.getHeader13());
			// Get Payment Number and Sequence
			try {
				msg.setE01BPBNUM(req.getParameter("E01BPBNUM"));
			} catch (Exception e) {
				msg.setE01BPBNUM("0");
			}
			try {
				msg.setE01BPBSEQ(req.getParameter("E01BPBSEQ"));
			} catch (Exception e) {
				msg.setE01BPBSEQ("000");
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
				forward("EBP0140_pay_list.jsp", req, res);
			} else {
				ses.setAttribute("EBP0140Record", newmessage);
			}	
			// Send request for GL Detail List
			try {
				mp = new MessageProcessor("EBP0140");
				
				EBP014002Message msgD = (EBP014002Message) mp.getMessageRecord("EBP014002");
				msgD.setH02USERID(user.getH01USR());
				msgD.setH02PROGRM("EBP0140");
				msgD.setH02TIMSYS(getTimeStamp());
				msgD.setH02SCRCOD("01");
				msgD.setH02OPECOD("0001");
				msgD.setE02NUMREC("0"); 
				// Get Payment Number and Sequence
				try {
					msgD.setE02BPGNUM(req.getParameter("E01BPBNUM"));
				} catch (Exception e) {
					msgD.setE02BPGNUM("0");
				}
											
				// Send Message	
				mp.sendMessage(msgD);
				ses.setAttribute("userPO", userPO);
				//	 Receive List
				JBObjList list = (JBObjList) mp.receiveMessageRecordList("E02INDOPE","E02NUMREC");
				if (mp.hasError(list)) {
					ses.setAttribute("error", mp.getError(list));
				} else {
					ses.setAttribute("EBP0140glList", list);
				}
			} catch (Exception e){
			}
			
			forwardOnSuccess("EBP0140_pay_detail.jsp", req, res);
		} finally {
			if (mp != null) 
				mp.close();
		}
	}
	
	// SCREEN = 4
	// Confirm or Deny Payment  
	//
	protected void procActionConDen(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		userPO.setPurpose("MAINTENANCE");
				
		// Send data
		try {
			mp = new MessageProcessor("EBP0140");
			EBP014001Message msg = (EBP014001Message) mp.getMessageRecord("EBP014001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EBP0140");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			
			msg.setE01REQBNK(userPO.getBank());
			msg.setE01REQBRN(userPO.getBranch());
			msg.setE01REQTYP(userPO.getType());
			msg.setE01REQPVI(userPO.getHeader1());
			msg.setE01REQDFY(userPO.getHeader8());
			msg.setE01REQDFM(userPO.getHeader9());
			msg.setE01REQDFD(userPO.getHeader10());
			msg.setE01REQDTY(userPO.getHeader11());
			msg.setE01REQDTM(userPO.getHeader12());
			msg.setE01REQDTD(userPO.getHeader13());
			// Get Payment Number and Sequence
			try {
				msg.setE01BPBNUM(req.getParameter("E01BPBNUM"));
			} catch (Exception e) {
				msg.setE01BPBNUM("0");
			}
			try {
				msg.setE01BPBSEQ(req.getParameter("E01BPBSEQ"));
			} catch (Exception e) {
				msg.setE01BPBSEQ("000");
			}
			msg.setH01OPECOD("0004");
			msg.setE01ACT(" ");
			msg.setH01FLGWK1(""); 
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				forward("EBP0140_pay_list.jsp", req, res);
			} else {
				redirectToPage("/servlet/datapro.eibs.bap.JSEBP0140?SCREEN=2&FromRecord=0" +
					"&E01REQBNK=" + userPO.getBank() +
					"&E01REQBRN=" + userPO.getBranch() +
			        "&E01REQTYP=" + userPO.getType() +
			        "&E01REQPVI=" + userPO.getHeader1() +
		  			"&E01REQDFM=" + userPO.getHeader2() +
		  			"&E01REQDFD=" + userPO.getHeader3() +
		  			"&E01REQDFY=" + userPO.getHeader4() +
		  			"&E01REQDTM=" + userPO.getHeader5() +
		  			"&E01REQDTD=" + userPO.getHeader6() +
		  			"&E01REQDTY=" + userPO.getHeader7() +
					"", res);
			}

		} finally {
			if (mp != null) 
				mp.close();
		}

	}	
	
	// SCREEN = 5
	// Confirm All  
	//
	protected void procActionConAll(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		EBP014001Message msg = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		userPO.setPurpose("MAINTENANCE");
		String nextrows = "0";
		String currrows = "0"; 
		int totRows = Integer.parseInt(req.getParameter("TOTROWS"));
		try{
			nextrows = req.getParameter("NEXTROWS");
		} catch (Exception e) {}
		try{
			currrows = req.getParameter("CURRROWS");
		} catch (Exception e) {}
		
		// Send data
		try { 
			mp = new MessageProcessor("EBP0140");
			msg = (EBP014001Message) mp.getMessageRecord("EBP014001");
			
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EBP0140");
			msg.setH01TIMSYS(getTimeStamp());  
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0005");
			mp.sendMessage(msg);
			
			for (int row = 0; row < totRows ; row++) {
				msg.setH01USERID(user.getH01USR());
				msg.setH01PROGRM("EBP0140");
				msg.setH01TIMSYS(getTimeStamp());  
				msg.setH01SCRCOD("01");
				msg.setH01OPECOD("0005");
				msg.setE01BPBNUM(req.getParameter("E01BPBNUM_" + row));
				msg.setE01BPBSEQ(req.getParameter("E01BPBSEQ_" + row));
				msg.setH01FLGWK1("");
				// Send Message
				mp.sendMessage(msg);
			} // EndFor
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EBP0140");
			msg.setH01TIMSYS(getTimeStamp());  
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0005");
			msg.setH01FLGWK1("S");  // End of List
			mp.sendMessage(msg);

			// Receive Error Message
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
					forward("EBP0140_pay_list.jsp", req, res);
			} else {
				redirectToPage("/servlet/datapro.eibs.bap.JSEBP0140?SCREEN=2&FromRecord=0" +
						"&E01REQBNK=" + userPO.getBank() +
						"&E01REQBRN=" + userPO.getBranch() +
				        "&E01REQTYP=" + userPO.getType() +
				        "&E01REQPVI=" + userPO.getHeader1() +
			  			"&E01REQDFM=" + userPO.getHeader2() +
			  			"&E01REQDFD=" + userPO.getHeader3() +
			  			"&E01REQDFY=" + userPO.getHeader4() +
			  			"&E01REQDTM=" + userPO.getHeader5() +
			  			"&E01REQDTD=" + userPO.getHeader6() +
			  			"&E01REQDTY=" + userPO.getHeader7() +
						"", res);
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}	
	
	// SCREEN = 6
	// Validate and Modify Payment  
	//
	protected void procActionModPay(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		EBP014002Message msg = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		userPO.setPurpose("MAINTENANCE");
		String nextrows = "0";
		String currrows = "0"; 
		String billType = "F";
		int totRows = Integer.parseInt(req.getParameter("TOTROWS"));
		try{
			nextrows = req.getParameter("NEXTROWS");
		} catch (Exception e) {}
		try{
			currrows = req.getParameter("CURRROWS");
		} catch (Exception e) {}
		try{
			billType = req.getParameter("E01BPBPTY");
		} catch (Exception e) {}
		
		// Send data
		try { 
			mp = new MessageProcessor("EBP0140");
			msg = (EBP014002Message) mp.getMessageRecord("EBP014002");
			
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("EBP0140");
			msg.setH02TIMSYS(getTimeStamp());  
			msg.setH02SCRCOD("01");
			msg.setH02OPECOD("0006");
			msg.setE02BPBNUM(req.getParameter("E01BPBNUM"));
			msg.setE02BPBSEQ(req.getParameter("E01BPBSEQ"));
			msg.setE02BPPAMT(req.getParameter("E01BPPAMT"));
			msg.setE02BPPPDY(req.getParameter("E01BPPPDY"));
			msg.setE02BPPPDM(req.getParameter("E01BPPPDM"));
			msg.setE02BPPPDD(req.getParameter("E01BPPPDD"));
			msg.setE02BPPPVI(req.getParameter("E01BPPPVI"));
			msg.setE02BPPSTS(req.getParameter("E01BPPSTS"));
			msg.setH02FLGWK1(billType);
			mp.sendMessage(msg);
			
			if (billType.equals("V")) {
				for (int row = 0; row < totRows ; row++) {
					msg.setH02USERID(user.getH01USR());
					msg.setH02PROGRM("EBP0140");
					msg.setH02TIMSYS(getTimeStamp());  
					msg.setH02SCRCOD("01");
					msg.setH02OPECOD("0006");
					msg.setE02BPBNUM(req.getParameter("E01BPBNUM"));
					msg.setE02BPBSEQ(req.getParameter("E01BPBSEQ"));
					msg.setE02BPPAMT(req.getParameter("E01BPPAMT"));
					msg.setE02BPPPDY(req.getParameter("E01BPPPDY"));
					msg.setE02BPPPDM(req.getParameter("E01BPPPDM"));
					msg.setE02BPPPDD(req.getParameter("E01BPPPDD"));
					msg.setE02BPPPVI(req.getParameter("E01BPPPVI"));
					msg.setE02BPPSTS(req.getParameter("E01BPPSTS"));
					msg.setE02BPGNUM(req.getParameter("E02BPGNUM_" + row));
					msg.setE02BPGSEQ(req.getParameter("E02BPGSEQ_" + row));
					msg.setE02BPGAMT(req.getParameter("E02BPGAMT_" + row));
					msg.setE02BPGBNK(req.getParameter("E02BPGBNK_" + row));
					msg.setE02BPGBRN(req.getParameter("E02BPGBRN_" + row));
					msg.setE02BPGCCY(req.getParameter("E02BPGCCY_" + row));
					msg.setE02BPGGLN(req.getParameter("E02BPGGLN_" + row));
					msg.setE02BPGACC(req.getParameter("E02BPGACC_" + row));
					msg.setE02BPGCCN(req.getParameter("E02BPGCCN_" + row));
					msg.setE02BPGDC(req.getParameter("E02BPGDC_" + row));
				
					if (req.getParameter("E02ACT_" + row)== null) {
						msg.setE02ACT(" ");
					} else {
						msg.setE02ACT("D");   // Delete Record
					}	
					msg.setH02FLGWK1("");
					// Send Message
					mp.sendMessage(msg);
				} // EndFor
				msg.setH02USERID(user.getH01USR());
				msg.setH02PROGRM("EBP0140");
				msg.setH02TIMSYS(getTimeStamp());  
				msg.setH02SCRCOD("01");
				msg.setH02OPECOD("0006");
				msg.setE02BPBNUM(req.getParameter("E01BPBNUM"));
				msg.setE02BPBSEQ(req.getParameter("E01BPBSEQ"));
				msg.setE02BPPAMT(req.getParameter("E01BPPAMT"));
				msg.setE02BPPPDY(req.getParameter("E01BPPPDY"));
				msg.setE02BPPPDM(req.getParameter("E01BPPPDM"));
				msg.setE02BPPPDD(req.getParameter("E01BPPPDD"));
				msg.setE02BPPPVI(req.getParameter("E01BPPPVI"));
				msg.setE02BPPSTS(req.getParameter("E01BPPSTS"));
				msg.setH02FLGWK1("S");  // End of List
				mp.sendMessage(msg);
			}	
			// Receive Error Message
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
					forward("EBP0140_pay_detail.jsp", req, res);
			} else {
				redirectToPage("/servlet/datapro.eibs.bap.JSEBP0140?SCREEN=2&FromRecord=0" +
					"&E01REQBNK=" + userPO.getBank() +
					"&E01REQBRN=" + userPO.getBranch() +
			        "&E01REQTYP=" + userPO.getType() +
			        "&E01REQPVI=" + userPO.getHeader1() +
		  			"&E01REQDFM=" + userPO.getHeader2() +
		  			"&E01REQDFD=" + userPO.getHeader3() +
		  			"&E01REQDFY=" + userPO.getHeader4() +
		  			"&E01REQDTM=" + userPO.getHeader5() +
		  			"&E01REQDTD=" + userPO.getHeader6() +
		  			"&E01REQDTY=" + userPO.getHeader7() +
					"", res);
			}

		} finally {
			if (mp != null) 
				mp.close();
		}

	}	
	
}