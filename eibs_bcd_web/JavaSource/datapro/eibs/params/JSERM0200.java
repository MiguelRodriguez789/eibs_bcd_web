package datapro.eibs.params;
/**
 * Maintenance Parameters of Remanentes
 * Creation date: (28/05/2021)
 * @author: Jose Camperos
 * 
 * 
 */
import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class JSERM0200 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		switch (screen) {
			// Requests Enter
			case 1 :
				procReqEnter(user, req, res, session);
				break;
			// Requests List 
			case 2 :
				procReqList(user, req, res, session);
				break;
			// Requests New	
			case 3 :
				procReqNew(user, req, res, session);
				break;
			// Requests Update	
			case 4 :
				procReqMaint(user, req, res, session);
				break;	
			case 15: // Submit the Record for write New
				procActionNew(user, req, res, session);
				break;
			case 16: // Submit the Record for update 
				procActionMaint(user, req, res, session);
				break;	
			case 17: // Submit the Record for update 
				procActionDelete(user, req, res, session);
				break;		
				// Requests List with components
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	// SCREEN = 1
	
	protected void procReqEnter(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses) 
			throws ServletException, IOException {
			
			forward("ERM0200_enter_bank_search.jsp", req, res);
			
	}
	
	// SCREEN = 2
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("ERM0200");
			ERM020001Message msg = (ERM020001Message) mp.getMessageRecord("ERM020001");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ERM0200");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0015");
			try {
				msg.setE01NUMREC(req.getParameter("FromRecord"));
			} catch (Exception e) {
				msg.setE01NUMREC("0"); 
			}
			try {
				msg.setE01BNK(req.getParameter("E01BNK"));
				userPO.setBank(msg.getE01BNK());
			} catch (Exception e) {
				msg.setE01BNK(userPO.getBank());
			}
			try {
				msg.setE01CCY(req.getParameter("E01CCY"));
				userPO.setCurrency(msg.getE01CCY());
			} catch (Exception e) {
				msg.setE01CCY(userPO.getCurrency());
			}
			
			// Send Message	
			mp.sendMessage(msg);
			userPO.setPurpose("MAINTENANCE");
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("JBOList", list);
			}
			forward("ERM0200_remanentes_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	//SCREEN = 3
	protected void procReqNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);

		ERM020001Message msgData = new ERM020001Message();
		msgData.setE01BNK(userPO.getBank());
		msgData.setE01CCY(userPO.getCurrency());
		
		ses.setAttribute("data", msgData);
		forward("ERM0200_remanentes_maint.jsp", req, res);
	
	}
	
	//SCREEN = 4
	protected void procReqMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
				HttpSession ses)
				throws ServletException, IOException {
			
		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;
		
		userPO = getUserPos(req);
		// Send data
		try {
			mp = new MessageProcessor("ERM0200");
			ERM020001Message msg = (ERM020001Message) mp.getMessageRecord("ERM020001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ERM0200");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0002");
			msg.setH01SCRCOD("01");
			userPO.setPurpose("MAINTENANCE");
			// Get all fields in page
			try {
				super.setMessageRecord(req, msg);
			} catch (Exception e) {				
		}
				
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				// Receive Data
				newmessage = mp.receiveMessageRecord();
				ses.setAttribute("data", newmessage);
				forward("ERM0200_remanentes_list.jsp", req, res);
			} else {
				// Receive Data
				newmessage = mp.receiveMessageRecord();
				ses.setAttribute("data", newmessage);
				forward("ERM0200_remanentes_maint.jsp", req, res);
			}
		} finally {
			if (mp != null) 
				mp.close();
		}
		
	}

	// SCREEN = 15
	protected void procActionNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send data
		try {
			mp = new MessageProcessor("ERM0200");
			ERM020001Message msg = (ERM020001Message) mp.getMessageRecord("ERM020001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ERM0200");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0001");
			msg.setH01SCRCOD("01");
			userPO.setPurpose("NEW");
			// Get all fields in page
			try {
				super.setMessageRecord(req, msg);
			} catch (Exception e) {				
			}
			
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				// Receive Data
				newmessage = mp.receiveMessageRecord();
				ses.setAttribute("data", newmessage);
				forward("ERM0200_remanentes_maint.jsp", req, res);
			} else {
				// get list
				redirectToPage("/servlet/datapro.eibs.params.JSERM0200?SCREEN=2", res);
			}
		} finally {
			if (mp != null) 
				mp.close();
		}
	}
	
	// SCREEN = 15
	protected void procActionMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send data
		try {
			mp = new MessageProcessor("ERM0200");
			ERM020001Message msg = (ERM020001Message) mp.getMessageRecord("ERM020001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ERM0200");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0005");
			msg.setH01SCRCOD("01");
			userPO.setPurpose("MAINTENANCE");
			// Get all fields in page
			try {
				super.setMessageRecord(req, msg);
			} catch (Exception e) {				
			}
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				// Receive Data
				newmessage = mp.receiveMessageRecord();
				ses.setAttribute("data", newmessage);
				forward("ERM0200_remanentes_maint.jsp", req, res);
			} else {
				// get list
				redirectToPage("/servlet/datapro.eibs.params.JSERM0200?SCREEN=2", res);
			}
		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	// SCREEN = 17
	protected void procActionDelete(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send data
		try {
			mp = new MessageProcessor("ERM0200");
			ERM020001Message msg = (ERM020001Message) mp.getMessageRecord("ERM020001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ERM0200");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0004");
			msg.setH01SCRCOD("01");
			userPO.setPurpose("MAINTENANCE");
			// Get all fields in page
			try {
				super.setMessageRecord(req, msg);
			} catch (Exception e) {				
			}
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				// Receive Data
				newmessage = mp.receiveMessageRecord();
				ses.setAttribute("data", newmessage);
				forward("ERM0200_remanentes_list.jsp", req, res);
			} else {
				// get list
				redirectToPage("/servlet/datapro.eibs.params.JSERM0200?SCREEN=2", res);
			}
		} finally {
			if (mp != null) 
				mp.close();
		}
	}	
		
	
}