package datapro.eibs.bap;
/**
 * Maintenance of Source Document Detail Entry 
 * Creation date: (04/05/11)
 * @author: Martha L. Riaño
 * Source Document - Details
 * 	// List of Options
 * 	//
 *	// SCREEN =    1	Send List of Details lines for a Source Document 
 *	// SCREEN =    2    Request new record
 *	// SCREEN =    3    Request old record
 *	// SCREEN =    4	Delete record  
 *	// SCREEN =    5	Submit the record for Update
 */
import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class JSEBP0142 extends JSEIBSServlet { 
	 
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
				procReqList(user, req, res, session);
				break;
			case 2 : // Request new Record
			case 3 : // Request old Record
			case 4 : // Delete record	
			case 5 : // Submit the Record for update
				procActionRec(user, req, res, session, screen);
				break;
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	// SCREEN = 1 
	// Send List of Source Document Entries  
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("EBP0142");
			EBP014201Message msg = (EBP014201Message) mp.getMessageRecord("EBP014201");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EBP0142");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0001");
			
			try {
				msg.setE01NUMREC(req.getParameter("FromRecord"));
			} catch (Exception e) {
				msg.setE01NUMREC("0"); 
			}
			try {
				msg.setE01BPYNUM(req.getParameter("DOCUMENTO"));
			} catch (Exception e) {
				msg.setE01BPYNUM("0");
			}
			try {
				msg.setE01BPYSEQ(req.getParameter("SEQUENCE"));
			} catch (Exception e) {
				msg.setE01BPYSEQ("0");
			}
			userPO.setIdentifier(msg.getE01BPYNUM());
			userPO.setProdCode(msg.getE01BPYSEQ());
			userPO.setPurpose("NEW");
			
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("EBP0142List", list);
			}
			forward("EBP0142_payment_beneficiary_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	// SCREEN = 2,3,5
	// Get or Process the Record  
	//
	protected void procActionRec(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		MessageRecord newmessageD = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send data
		try {
			mp = new MessageProcessor("EBP0142");
			
			EBP014201Message msgD = (EBP014201Message) mp.getMessageRecord("EBP014201");
			msgD.setH01USERID(user.getH01USR());
			msgD.setH01PROGRM("EBP0142");
			msgD.setH01TIMSYS(getTimeStamp());
			msgD.setH01SCRCOD("01");
			msgD.setH01OPECOD("0111");
			msgD.setE01NUMREC("0"); 
			
			//	Get key fields
			try {
				msgD.setE01BPYNUM(req.getParameter("DOCUMENTO"));
			} catch (Exception e) {
				msgD.setE01BPYNUM("");
			}
	
			// Send Message	
			mp.sendMessage(msgD);
			ses.setAttribute("userPO", userPO);
			// Receive 
			newmessageD = mp.receiveMessageRecord();
			
			
			if (mp.hasError(newmessageD)) {
				ses.setAttribute("error", newmessageD);
			} else {
				ses.setAttribute("EBP0130Record", newmessageD);
			}
			//
			
			mp = null;
			mp = new MessageProcessor("EBP0142");
			EBP014201Message msg = (EBP014201Message) mp.getMessageRecord("EBP014201");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EBP0142");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			switch (screen) {
				case 2 : // Request new Record
					msg.setH01OPECOD("0002");
					userPO.setPurpose("NEW");
					break;
				case 3 : // Request old Record
					msg.setH01OPECOD("0003");
					break;
				case 4 : // Delete Record
					msg.setH01OPECOD("0004");
					userPO.setPurpose("MAINTENANCE");
					break;
				case 5 : // Submit the Record for update
					msg.setH01OPECOD("0005");
					userPO.setPurpose("MAINTENANCE");
					break;
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
			//	Get key fields
			
			try {
				msg.setE01BPYNUM(req.getParameter("DOCUMENTO"));
			} catch (Exception e) {
				msg.setE01BPYNUM("");
			}
			try {
				msg.setE01BPYSEQ(req.getParameter("SEQUENCE"));
			} catch (Exception e) {
				msgD.setE01BPYSEQ("0");
			}
			try {
				msg.setE01BPYBSQ(req.getParameter("E01BPYBSQ"));
			} catch (Exception e) {
				msgD.setE01BPYBSQ("0");
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
				if (screen == 2 || screen == 3 || screen == 4) {
					forward("EBP0142_payment_beneficiary_list.jsp", req, res);
				} else {
					//	Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("EBP0142Record", newmessage);
					forward("EBP0142_payment_beneficiary_detail.jsp", req, res);
				}

			} else {
				if (screen == 4 || screen == 5) {
					redirectToPage("/servlet/datapro.eibs.bap.JSEBP0142?SCREEN=1&DOCUMENTO=" + userPO.getIdentifier()+"&SEQUENCE=" + userPO.getProdCode(), res);
				} else {
					ses.setAttribute("EBP0142Record", newmessage);
					forwardOnSuccess("EBP0142_payment_beneficiary_detail.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

}