package datapro.eibs.bap;
/**
 * Maintenance of Source Document Payment Plan 
 * Creation date: (04/14/11)
 * @author: Martha L. Riaño
 * 
 *  // Source Document - Payment Plan
 * 	// List of Options
 * 	//
 *	// SCREEN =    1	Send List of Details lines for a Source Document 
 *	// SCREEN =    2    Request new record
 *	// SCREEN =    4	Delete record
 *	// SCREEN =    5	Submit the record for Update
 *	// SCREEN =    6    Duplicate record
 */
import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class JSEBP0128 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		
		UserPos userPO = null;
		userPO = getUserPos(req);

		switch (screen) {
			 
			case 1 : // Requests List
			case 2 :    // With new Row
			case 6 : // With new Row - Duplicate		
				procReqList(user, req, res, session, screen);
				break;
			case 4 : // Submit the Record for update(Delete)	
			case 5 : // Submit the Record for update
				procActionList(user, req, res, session, screen);
				break;
			default :
				redirectToPage(SuperServlet.devPage, res);
				break;
				}
	}

	// SCREEN = 1 or 2
	// Send List of Source Document Payment Plan  
	//
	private synchronized void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("EBP0128");
			EBP012801Message msg = (EBP012801Message) mp.getMessageRecord("EBP012801");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EBP0128");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			switch (screen) {
				case 2 : // Request new Record
					msg.setH01OPECOD("0001");
					break;
				case 6 : // Duplicate new Record
					msg.setH01OPECOD("0006");
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
			try {
				msg.setE01BDPNUM(req.getParameter("DOCUMENTO"));
			} catch (Exception e) {
				msg.setE01BDPNUM("0");
			}
			try {
				msg.setE01BDPSEQ(req.getParameter("SEARCHCDE"));
			} catch (Exception e) {
				msg.setE01BDPSEQ("");
			}
			userPO.setIdentifier(msg.getE01BDPNUM());
			userPO.setProdCode(msg.getE01BDPSEQ());
			
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list = (JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("EBP0128List", list);
			}
			forward("EBP0128_source_document_pp_list.jsp", req, res);
			
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	// SCREEN = 5
	// Process the List (Sending all rows to Socket)  
	//
	protected void procActionList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		EBP012801Message msg = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		userPO.setPurpose("MAINTENANCE");
		int totRows = Integer.parseInt(req.getParameter("TOTROWS"));
		
		// Send data
		try {
			mp = new MessageProcessor("EBP0128");
			msg = (EBP012801Message) mp.getMessageRecord("EBP012801");
			
			for (int row = 0; row < totRows ; row++) {
				msg.setH01USERID(user.getH01USR());
				msg.setH01PROGRM("EBP0128");
				msg.setH01TIMSYS(getTimeStamp());  
				msg.setH01SCRCOD("01");
				switch (screen) {
				case 4 : // Submit the Record for update(Delete)
					msg.setH01OPECOD("0004");
					break;
				case 5 : // Submit the Record for update
					msg.setH01OPECOD("0005");
					break;
				default : 
					msg.setH01OPECOD("0005");
					break;
				}
				try {
					msg.setE01BDPNUM(req.getParameter("E01BDPNUM_" + row));
				} catch (Exception e) {
					msg.setE01BDPNUM("0");
				}
				msg.setE01BDPSEQ(req.getParameter("E01BDPSEQ_" + row));
				
				try {
					msg.setE01BDPPD1(req.getParameter("E01BDPPD1_" + row));
					} catch (Exception e) {
						msg.setE01BDPPD1("0");
					}
				
				try {
					msg.setE01BDPPD2(req.getParameter("E01BDPPD2_" + row));
					} catch (Exception e) {
						msg.setE01BDPPD2("0");
					}
				try {
					msg.setE01BDPPD3(req.getParameter("E01BDPPD3_" + row));
					} catch (Exception e) {
						msg.setE01BDPPD3("0");
					}
				
				try {
					msg.setE01BDPAMT(req.getParameter("E01BDPAMT_" + row));
					} catch (Exception e) {
						msg.setE01BDPAMT("0");
					}
					
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
			msg.setH01PROGRM("EBP01280");
			msg.setH01TIMSYS(getTimeStamp());  
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0005");
			msg.setH01FLGWK1("S");  // End of List
			mp.sendMessage(msg);
			// Receive Error Message
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
			
				// Receive List updated
				newmessage = (EBP012801Message) mp.getMessageRecord("EBP012801");
				JBObjList list = (JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			
				if (mp.hasError(list)) {
					ses.setAttribute("error", mp.getError(list));
					ses.setAttribute("EBP0128List", list);
					ses.setAttribute("userPO", userPO);
				}	
				forward("EBP0128_source_document_pp_list.jsp", req, res);
				}
			else {
				redirectToPage("/servlet/datapro.eibs.bap.JSEBP0128?SCREEN=1&DOCUMENTO=" + userPO.getIdentifier() + "", res);
			}
			
		} finally {
			if (mp != null) 
				mp.close();
		}
	}
}