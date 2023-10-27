package datapro.eibs.bap;
/**
 * Accounts Payable - Payments Selection
 * Creation date: (03/02/10)
 * @author: C. Castillo
 * 	// List of Options
 * 	//
 *	// SCREEN =    1	Send screen for selection parameters
 *	// SCREEN =    2    Send Payment List  
 *	// SCREEN =    3    Approval Payment
 *	// SCREEN =    4    Reject Payment  
 *	// SCREEN =    5    Approval All Payment
 * **/

import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class JSEBP0145 extends JSEIBSServlet { 
	 
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
		case 2 :  // Send list with results for Process
			procReqList(user, req, res, session, screen);
			break;
		case 3 : // Approval Payment
       	case 4 : // Reject Payment
       	case 5 : // Approval All Payment	
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
			mp = new MessageProcessor("EBP0145");
			EBP014501Message msg = (EBP014501Message) mp.getMessageRecord("EBP014501");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EBP0145");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			try {
				msg.setE01REQTYP(req.getParameter("E01REQTYP"));
			} catch (Exception e) { 
				msg.setE01REQTYP("V");
			}
			try {
				msg.setE01REQPYM(req.getParameter("E01REQPYM"));
			} catch (Exception e) { 
				msg.setE01REQPYM("S");
			}
			ses.setAttribute("msgList", msg);
			forwardOnSuccess("EBP0145_payment_approval_search.jsp", req, res);
			
		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	
	// SCREEN = 2 
	// Send Payment List  
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("EBP0145");
			EBP014501Message msg = (EBP014501Message) mp.getMessageRecord("EBP014501");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EBP0145");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0001");
			userPO.setPurpose("LIST");
						
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
				msg.setE01REQPYM(req.getParameter("E01REQPYM"));
			} catch (Exception e) { 
				msg.setE01REQTYP("S");
			}
			try {
				msg.setE01REQVEN(req.getParameter("E01REQVEN"));
			} catch (Exception e) { 
				msg.setE01REQVEN("0");
			}
			try {
				msg.setE01REQPVI(req.getParameter("E01REQPVI"));
			} catch (Exception e) { 
				msg.setE01REQPVI(" ");
			}
			userPO.setType(msg.getE01REQTYP());
			userPO.setHeader20(msg.getE01REQPYM());
			userPO.setHeader21(msg.getE01REQVEN());
			userPO.setHeader22(msg.getE01REQPVI());
			
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
				forward("EBP0145_payment_approval_search.jsp", req, res);
			} else {
				ses.setAttribute("EBP0145List", list);
				forwardOnSuccess("EBP0145_payment_approval_list.jsp", req, res);
			}
		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	//	 SCREEN = 3,4,5
	// Get or Process Record  
	//
	protected void procActionRec(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		EBP014501Message msg = null;
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
			mp = new MessageProcessor("EBP0145");
			msg = (EBP014501Message) mp.getMessageRecord("EBP014501");
			
			switch (screen) {
	    		case 3 : // Approval Payment    
	    		    msg.setH01OPECOD("0002");
	    		    userPO.setPurpose("APPROVAL");
	    		    break;
	    		case 4 : // Reject Payment
	    		    msg.setH01OPECOD("0003");
	    		    userPO.setPurpose("REJECT");
	    		    break;
	    		case 5 : // Approval Payment    
	    		    msg.setH01OPECOD("0005");
	    		    userPO.setPurpose("APPROVAL");
	    		    break;    
	    		default :
	    		    forward(SuperServlet.devPage, req, res);
					break;
			}
			
			for (int row = 0; row < totRows ; row++) {
			    msg.setH01USERID(user.getH01USR());
			    msg.setH01PROGRM("EBP0145");
			    msg.setH01TIMSYS(getTimeStamp());
			    msg.setH01SCRCOD("01");
			    
			    msg.setE01REQTYP(userPO.getType());
			    msg.setE01REQPYM(userPO.getHeader20());
			    msg.setE01REQVEN(userPO.getHeader21());
			    msg.setE01REQPVI(userPO.getHeader22());
			    
			// Get page field
			
			    try {
			        msg.setE01BPPNUM(req.getParameter("E01BPPNUM_" + row));
			    } catch (Exception e) {
			        msg.setE01BPPNUM("0");
			    }
			    try {
			        msg.setE01BPPSEQ(req.getParameter("E01BPPSEQ_" + row));
			    } catch (Exception e) {
			        msg.setE01BPPSEQ("0");
			    }
			    try {
			        msg.setE01BPBBIL(req.getParameter("E01BPBBIL_" + row));  // Check Number if Payment via is Checks 
			    } catch (Exception e) {
			        msg.setE01BPBBIL("0");
			    }
			    if (req.getParameter("E01ACT_" + row)== null) {
					msg.setE01ACT(" ");
				} else {
					msg.setE01ACT("A");   // Approval or Reject Record
				}	
			    
			    msg.setH01FLGWK1(""); 
			    // Send Message 
			    mp.sendMessage(msg);
			} // EndFor
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EACH130");
			msg.setH01TIMSYS(getTimeStamp());  
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0005");
			msg.setH01FLGWK1("S");  // End of List
			mp.sendMessage(msg);
			//	Receive Error Message
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
			}	
			// Receive List updated
			newmessage = (EBP014501Message) mp.getMessageRecord("EBP014501");
			JBObjList list = (JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
				forward("EBP0145_payment_approval_list.jsp", req, res);
			} else {
				redirectToPage("/servlet/datapro.eibs.bap.JSEBP0145?SCREEN=2&FromRecord=0" +
		        		"&E01REQTYP=" + userPO.getType() + 
		        		"&E01REQPYM=" + userPO.getHeader20() +
		        		"&E01REQVEN=" + userPO.getHeader21() +
		        		"&E01REQPVI=" + userPO.getHeader22() +
		        		"", res);
			}
			
			

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

}