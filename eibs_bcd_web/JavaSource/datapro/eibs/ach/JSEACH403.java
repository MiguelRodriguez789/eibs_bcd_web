package datapro.eibs.ach;
/**
 * Text File Generation for Payments and Rejects from ACH Originator 
 * Creation date: (04/09/13)
 * @author: Carlos Castillo
 * ACH 
 * 	// List of Options
 * 	//
 *	// SCREEN =    1	Send List of Pending Records 
 *	// SCREEN =    5	Submit the record for Text File Gneration
 */
import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class JSEACH403 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		switch (screen) {
			// Requests List 
			case 1  :
				procReqList(user, req, res, session, screen);
				break;
			case 5  : // Submit the Record 	
				procActionRec(user, req, res, session, screen);
				break;
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	// SCREEN = 1 
	// Send List of Pending Records  
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("EACH403");
			EACH40301Message msg = (EACH40301Message) mp.getMessageRecord("EACH40301");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EACH403");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0001");
			switch (screen) {
			case 1  : // Pending Batches List 
				msg.setH01OPECOD("0001");
				userPO.setPurpose("MAINTENANCE");
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
				msg.setE01ACPCDE(req.getParameter("SEARCHCDE"));
			} catch (Exception e) {
				msg.setE01ACPCDE("");
			}
			userPO.setProdCode(msg.getE01ACPCDE());
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("EACH403List", list);
			}
			forward("EACH403_ach_files_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	// SCREEN = 5
	// Process the Record  
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
			mp = new MessageProcessor("EACH403");
			EACH40301Message msg = (EACH40301Message) mp.getMessageRecord("EACH40301");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EACH403");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			switch (screen) {
				case 5 : // Submit the Record for update
					msg.setH01OPECOD("0005");
					break;
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
			//	Get key fields
			try {
				msg.setE01ACPCDE(req.getParameter("E01ACPCDE"));
			} catch (Exception e) {
				msg.setE01ACPCDE("");
			}
			
			if (screen == 5) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {	}
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
				//	Receive Data
				forward("EACH403_ach_files_list.jsp", req, res);
				
			} else {
				redirectToPage("/servlet/datapro.eibs.ach.JSEACH403?SCREEN=1&FromRecord=0", res);
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

}