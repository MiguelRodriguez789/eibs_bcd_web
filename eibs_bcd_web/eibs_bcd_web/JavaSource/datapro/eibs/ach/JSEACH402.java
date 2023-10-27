package datapro.eibs.ach;
/**
 * ACH Incoming  
 * Creation date: (08/22/2012)
 * @author: Carlos Castillo
 *                   
 * 	// List of Options
 * 	//
 *	// SCREEN =    1	Send List of Pending FEP          
 *	// SCREEN =    2    Process Pending FEP File
 *  // SCREEN =    3	Request new FEP File Name
 *  // SCREEN =    4    Delete Pending FEP File
 **	// SCREEN =    5    Process new FEP File 
 */
import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;

import java.io.IOException;
import java.io.LineNumberReader;
import java.io.StringReader;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspsmart.upload.SmartUpload;
import javax.servlet.ServletConfig;

public class JSEACH402 extends JSEIBSServlet { 
	
	private ServletConfig config = null;
	
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		
		UserPos userPO = null;
		userPO = getUserPos(req);
		
		switch (screen) {

			//
			case 1 : // Request Pending FEP List 
				procReqPndList(user, req, res, session, screen);
				break;
			case 2 : // Process Pending 
			case 4 : // Delete Pending 
				procActionPnd(user, req, res, session, screen);
				break;
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		this.config = config;
	}

	// SCREEN = 1 
	// Send Pending List  
	//
	protected void procReqPndList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("EACH401");
			EACH40101Message msg = (EACH40101Message) mp.getMessageRecord("EACH40101");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EACH401");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0001");
			if (screen == 1) {
				userPO.setPurpose("MAINTENANCE");
			} else {
				userPO.setPurpose("INQUIRY");
			}
			try {
				msg.setE01NUMREC(req.getParameter("FromRecord"));
			} catch (Exception e) {
				msg.setE01NUMREC("0"); 
			}
			try {
				msg.setE01AFHNUM(req.getParameter("SEARCHCDE"));
			} catch (Exception e) {
				msg.setE01AFHNUM("0");
			}
			userPO.setProdCode(msg.getE01AFHNUM());
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("EACH401List", list);
			}
			forward("EACH401_fep_pending_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}


	
	// SCREEN = 2,4
	// Get or Process the Record  
	//
	protected void procActionPnd(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send data
		try {
			mp = new MessageProcessor("EACH401");
			EACH40101Message msg = (EACH40101Message) mp.getMessageRecord("EACH40101");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EACH401");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			switch (screen) {
				case 2 : // Process Pending FEP
					msg.setH01OPECOD("0002");
					userPO.setPurpose("MAINTENANCE");
					break;
				case 4 : // Delete Pending FEP
					msg.setH01OPECOD("0004");
					break;
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
			// Get key field
			try {
				msg.setE01AFHNUM(req.getParameter("E01AFHNUM"));
			} catch (Exception e) {
				msg.setE01AFHNUM("");
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
				forward("EACH401_fep_pending_list.jsp", req, res);
				
			} else {
				redirectToPage("/servlet/datapro.eibs.ach.JSEACH402?SCREEN=1&FromRecord=0", res);
				
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}
	
}