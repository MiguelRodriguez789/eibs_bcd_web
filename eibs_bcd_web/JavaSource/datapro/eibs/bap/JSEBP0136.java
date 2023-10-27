package datapro.eibs.bap;
/**
 * Maintenance of Source Document GL Information 
 * Creation date: (04/11/11)
 * @author: Martha L. Riaño
 * Source Document - GL Information
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

public class JSEBP0136 extends JSEIBSServlet { 
	 
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

	// SCREEN = 1, 2, 6
	// Send List of Bill GL Transactions  
	//
	private synchronized void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("EBP0136");
			EBP013601Message msg = (EBP013601Message) mp.getMessageRecord("EBP013601");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EBP0136");
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
				msg.setE01BPGNUM(req.getParameter("DOCUMENTO"));
			} catch (Exception e) {
				msg.setE01BPGNUM("0");
			}
			try {
				msg.setE01BPGSEQ(req.getParameter("SEARCHCDE"));
			} catch (Exception e) {
				msg.setE01BPGSEQ("");
			}
			userPO.setIdentifier(msg.getE01BPGNUM());
			userPO.setProdCode(msg.getE01BPGSEQ());
			
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list = (JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("EBP0136List", list);
			}
			forward("EBP0136_bill_gl_list.jsp", req, res);
			
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
		EBP013601Message msg = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		userPO.setPurpose("MAINTENANCE");
		int totRows = Integer.parseInt(req.getParameter("TOTROWS"));
		
		// Send data
		try {
			mp = new MessageProcessor("EBP0136");
			msg = (EBP013601Message) mp.getMessageRecord("EBP013601");
			
			for (int row = 0; row < totRows ; row++) {
				msg.setH01USERID(user.getH01USR());
				msg.setH01PROGRM("EBP0136");
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
					msg.setE01BPGNUM(req.getParameter("E01BPGNUM_" + row));
				} catch (Exception e) {
					msg.setE01BPGNUM("0");
				}
				msg.setE01BPGSEQ(req.getParameter("E01BPGSEQ_" + row));
				msg.setE01BPGTYP(req.getParameter("E01BPGTYP_" + row));
				
				msg.setE01BPGDC(req.getParameter("E01BPGDC_" + row));
				
				try {
					msg.setE01BPGBNK(req.getParameter("E01BPGBNK_" + row));
					} catch (Exception e) {
						msg.setE01BPGBNK("0");
					}
				
				try {
					msg.setE01BPGBRN(req.getParameter("E01BPGBRN_" + row));
					} catch (Exception e) {
						msg.setE01BPGBRN("0");
					}
				try {
					msg.setE01BPGCCY(req.getParameter("E01BPGCCY_" + row));
					} catch (Exception e) {
						msg.setE01BPGCCY("0");
					}
				try {
					msg.setE01BPGGLN(req.getParameter("E01BPGGLN_" + row));
					} catch (Exception e) {
						msg.setE01BPGGLN("0");
					}
				try {
					msg.setE01BPGACC(req.getParameter("E01BPGACC_" + row));
					} catch (Exception e) {
						msg.setE01BPGACC("0");
					}
				try {
					msg.setE01BPGCCN(req.getParameter("E01BPGCCN_" + row));
					} catch (Exception e) {
						msg.setE01BPGCCN("0");
					}
				try {
					msg.setE01BPGAMT(req.getParameter("E01BPGAMT_" + row));
					} catch (Exception e) {
						msg.setE01BPGAMT("0");
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
			msg.setH01PROGRM("EBP01360");
			msg.setH01TIMSYS(getTimeStamp());  
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0005");
			msg.setH01FLGWK1("S");  // End of List
			mp.sendMessage(msg);
			// Receive Error Message
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
			}
			// Receive List updated
			newmessage = (EBP013601Message) mp.getMessageRecord("EBP013601");
			JBObjList list = (JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			ses.setAttribute("EBP0136List", list);
			ses.setAttribute("userPO", userPO);
			
			forward("EBP0136_bill_gl_list.jsp", req, res);
 
		} finally {
			if (mp != null) 
				mp.close();
		}
	}

}