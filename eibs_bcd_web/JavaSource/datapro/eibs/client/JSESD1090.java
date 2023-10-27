package datapro.eibs.client;
/**
 * Maintenance of Customer Parameters  
 * Creation date: (08/25/14)
 * @author: Carlos Castillo
 * 
 *	// Customer Parameters
 *	// List of Options
 *	//
 *	// SCREEN =    1	Send List of Customer Parameters
 *	// SCREEN =    2    Request new record 
 *	// SCREEN =    5	Submit the list for Update
 */ 
import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class JSESD1090 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
	
			switch (screen) {
			// Requests List 
			case 1 :
			case 2 :    // With new Row
				procReqList(user, req, res, session, screen);
				break;	
			//  Submit the list for update
			case 5 :
				procActionList(user, req, res, session);
				break;
			default :
				redirectToPage(SuperServlet.devPage, res);
				break;
				}
	}
	
	// SCREEN = 1 or 2
	// Send List of Customers Parameters  
	//
	private synchronized void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("ESD1090");
			ESD109001Message msg = (ESD109001Message) mp.getMessageRecord("ESD109001"); 
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD1090");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			switch (screen) {
				case 2 : // Request new Record
					msg.setH01OPECOD("0001");
					break;
				default : 
					msg.setH01OPECOD("0002");
					break;
			}	
			try {
				msg.setE01NUMREC(req.getParameter("FromRecord"));
			} catch (Exception e) {
				msg.setE01NUMREC("0");
			}
			// Send Message	
			mp.sendMessage(msg);
			// Receive List
			JBObjList list = (JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("list", list);
			}
			forward("ESD1090_client_parameters_list.jsp", req, res);
			
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	// SCREEN = 5
	// Process the List (Sending all rows to Socket) 
	//
	protected void procActionList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession ses)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		ESD109001Message msg = null;
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
			mp = new MessageProcessor("ESD1090");
			msg = (ESD109001Message) mp.getMessageRecord("ESD109001");
			for (int row = 0; row < totRows ; row++) {
				msg.setH01USERID(user.getH01USR());
				msg.setH01PROGRM("ESD1090");
				msg.setH01TIMSYS(getTimeStamp());  
				msg.setH01SCRCOD("" + row);
				msg.setH01OPECOD("0005");
						
				msg.setE01BNK(req.getParameter("E01BNK_" + row));
				msg.setE01LDV(req.getParameter("E01LDV_" + row));
				msg.setE01LDA(req.getParameter("E01LDA_" + row));
				msg.setE01KIL(req.getParameter("E01KIL_" + row));
				msg.setE01EAD(req.getParameter("E01EAD_" + row));
				msg.setE01EMB(req.getParameter("E01EMB_" + row));
				msg.setE01TTR(req.getParameter("E01TTR_" + row));
				msg.setE01TTE(req.getParameter("E01TTE_" + row));
				msg.setE01TTC(req.getParameter("E01TTC_" + row));
				msg.setE01TTF(req.getParameter("E01TTF_" + row));
				msg.setE01PFD(req.getParameter("E01PFD_" + row));
				msg.setE01PFF(req.getParameter("E01PFF_" + row));
				msg.setE01PFG(req.getParameter("E01PFG_" + row));
				msg.setE01JFD(req.getParameter("E01JFD_" + row));
				msg.setE01JFF(req.getParameter("E01JFF_" + row));
				msg.setE01JFG(req.getParameter("E01JFG_" + row));
				msg.setE01TDO(req.getParameter("E01TDO_" + row));
				msg.setE01TDP(req.getParameter("E01TDP_" + row));
				msg.setE01TAV(req.getParameter("E01TAV_" + row));
				msg.setE01TAI(req.getParameter("E01TAI_" + row));
				if (req.getParameter("E01ACT_" + row)== null) {
					msg.setE01ACT(" ");
				} else {
					msg.setE01ACT("D");   // Delete Record
				}	
				msg.setH01FLGWK1("");
				// Send Message
				mp.sendMessage(msg);
			} // EndFor
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD1090");
			msg.setH01TIMSYS(getTimeStamp());  
			msg.setH01SCRCOD("");
			msg.setH01OPECOD("0005");
			msg.setH01FLGWK1("S");  // End of List
			mp.sendMessage(msg);
			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				forward("ESD1090_client_parameters_list.jsp", req, res);
			} else {
				redirectToPage("/servlet/datapro.eibs.client.JSESD1090?SCREEN=1&FromRecord=0", res);
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

}