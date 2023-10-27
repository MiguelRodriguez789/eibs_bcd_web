package datapro.eibs.client;
/**
 * client - Officer Massive Change  
 * Creation date: (06/24/2014)
 * @author: Carlos Castillo
 *  
 * 	// List of Options
 * 	//
 *	// SCREEN =    1	Send List of Officers and Customers 
 *	// SCREEN =    2    Update File with Selections 
 */	

import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class JSESD0093 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		switch (screen) {
			// Requests List 
			case 1 :
				procReqList(user, req, res, session, screen);
				break;
			case 2 : // Update Selections
				procActionDS(user, req, res, session);
				break;
			case 4 :  // Delete Process
			case 6 :  // Request Pending List
			case 7 :  // Process File	
				procReqPndList(user, req, res, session, screen);
				break;
			case 8 :  // Approval list 	
				procReqListApproval(user, req, res, session, screen);
				break;
			case 9 :  // Delete Approval list 	
				procDelListApproval(user, req, res, session, screen);
				break;
			case 10 :  // Approval list Report	
				procRptListApproval(user, req, res, session, screen);
				break;	
			case 11 : // Send Screen for Officer Reassignment	
			case 12 : // Refresh List
			case 20 : // Approval List
				procReqListA(user, req, res, session, screen);
				break;
			case 15  : // Update User Selections
			case 25  : // Approval
				procActionDSA(user, req, res, session, screen);
				break;
			case 26 :  // Process File from approval list	
				procFileApproval(user, req, res, session, screen);
				break;	
			default :
				forward(SuperServlet.devPage, req, res);
				break;  
		}
	}

	// SCREEN = 1 
	// Send List of Officers and Customers  
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("ESD0093");
			//
			// Customer List
			//
			ESD009301Message msg = (ESD009301Message) mp.getMessageRecord("ESD009301");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			
			// Send Initial data
			msg.setH01USERID(user.getH01USR()); 
			msg.setH01PROGRM("ESD0093");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0001");
			msg.setE01NUMREC("0"); 
			//
			msg.setE01CUCOCD((req.getParameter("E01CUCOCD") == null ? " " : req.getParameter("E01CUCOCD")));
			userPO.setHeader1(msg.getE01CUCOCD());
			userPO.setHeader2((req.getParameter("OFCDSC") == null ? " " : req.getParameter("OFCDSC")));
			msg.setE01CUCNCD((req.getParameter("E01CUCNCD") == null ? " " : req.getParameter("E01CUCNCD")));
			userPO.setHeader3(msg.getE01CUCNCD());
			userPO.setHeader4((req.getParameter("OFC2DSC") == null ? " " : req.getParameter("OFC2DSC")));
			msg.setH01FLGWK1((req.getParameter("E01ORD") == null ? " " : req.getParameter("E01ORD")));
			userPO.setHeader5(msg.getH01FLGWK1());
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("custList", list);
			} 
			//
			// Officer List
			//
			mp = null;
			mp = new MessageProcessor("ESD0093");
			ESD009302Message msgC = (ESD009302Message) mp.getMessageRecord("ESD009302");
			// Send Initial data
			msgC.setH02USERID(user.getH01USR());
			msgC.setH02PROGRM("ESD0093");
			msgC.setH02TIMSYS(getTimeStamp());
			msgC.setH02SCRCOD("01");
			msgC.setH02OPECOD("0001");
			try {
				msgC.setE02NUMREC(req.getParameter("FromRecord"));
			} catch (Exception e) {
				msgC.setE02NUMREC("0"); 
			}
			// Send Message	
			mp.sendMessage(msgC);
			// Receive List
			JBObjList listC =
				(JBObjList) mp.receiveMessageRecordList("E02INDOPE","E02NUMREC");
			if (mp.hasError(listC)) {
				ses.setAttribute("error", mp.getError(listC));
			} else {
				ses.setAttribute("ofcList", listC);
			}

			forward("ESD0093_client_officer_change.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}


	// SCREEN = 2
	// Update Selections  (Sending all rows to Socket) 
	//
	protected void procActionDS(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession ses)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		ESD009301Message msg = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		userPO.setPurpose("MAINTENANCE");
		int totRows = Integer.parseInt(req.getParameter("TOTROWS"));
		
		// Send data
		try { 
			mp = new MessageProcessor("ESD0093");
			msg = (ESD009301Message) mp.getMessageRecord("ESD009301");
			
			for (int row = 0; row < totRows ; row++) {
				msg.setH01USERID(user.getH01USR());
				msg.setH01PROGRM("ESD0093");
				msg.setH01TIMSYS(getTimeStamp());  
				msg.setH01SCRCOD("01");
				msg.setH01OPECOD("0002");
				msg.setH01FLGWK3((req.getParameter("ALLRCD") == null ? "0" : req.getParameter("ALLRCD")));
				msg.setE01CUCTYP((req.getParameter("E01CUCTYP") == null ? "O" : req.getParameter("E01CUCTYP")));		
				msg.setE01CUCOCD(req.getParameter("E01CUCOCD"));
				msg.setE01CUCNCD(req.getParameter("E01CUCNCD"));
				msg.setE01CUCCUN(req.getParameter("E01CUCCUN_" + row));
				if (req.getParameter("E01ACT_" + row)== null) {
					msg.setE01ACT("U");
				} else {
					msg.setE01ACT("S");   
				}
				msg.setH01FLGWK1("");
				// Send Message
				mp.sendMessage(msg);
			} // EndFor
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD0093");
			msg.setH01TIMSYS(getTimeStamp());  
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0002");
			msg.setH01FLGWK1("S");  // End of List
			mp.sendMessage(msg);
			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				forward("ESD0093_client_officer_change.jsp", req, res);
			} else {
				redirectToPage("/servlet/datapro.eibs.client.JSESD0093?SCREEN=1&FromRecord=0", res);
			}

		} finally {
			if (mp != null) 
				mp.close();
		}
	}

	// SCREEN = 4,6,7
	// Send Pending List  
	//
	protected void procReqPndList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageRecord newmessage = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("ESD009301");
			ESD009301Message msg = (ESD009301Message) mp.getMessageRecord("ESD009301");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD0093");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			switch (screen) {
			case 4 :  // Delete Process
				msg.setH01OPECOD("0004");
				break;
			case 6 :  // Request Pending List
				msg.setH01OPECOD("0006");
				try {
					userPO.setOption(req.getParameter("OPT"));
				} catch (Exception e) {
					userPO.setOption("T"); 
				}
				break;
			case 7 :  // Process File	
				msg.setH01OPECOD("0007");
				break;
			default :
				msg.setH01OPECOD("0006");
			break;  
			}
			
			userPO.setPurpose("INQUIRY");
			
			msg.setH01FLGWK2(userPO.getOption()==null?"T":userPO.getOption());
			try {
				msg.setE01NUMREC(req.getParameter("FromRecord"));
			} catch (Exception e) {
				msg.setE01NUMREC("0"); 
			}
			msg.setE01CUCTYP((req.getParameter("E01CUCTYP") == null ? "O" : req.getParameter("E01CUCTYP")));
			userPO.setHeader5(msg.getE01CUCTYP());
			msg.setE01CUCVIA((req.getParameter("E01CUCVIA") == null ? "O" : req.getParameter("E01CUCVIA")));
			userPO.setHeader6(msg.getE01CUCVIA());
			msg.setE01CUCDTY((req.getParameter("E01CUCDTY") == null ? "0" : req.getParameter("E01CUCDTY")));
			msg.setE01CUCDTM((req.getParameter("E01CUCDTM") == null ? "0" : req.getParameter("E01CUCDTM")));
			msg.setE01CUCDTD((req.getParameter("E01CUCDTD") == null ? "0" : req.getParameter("E01CUCDTD")));
			msg.setE01CUCSEQ((req.getParameter("E01CUCSEQ") == null ? "0" : req.getParameter("E01CUCSEQ")));
			userPO.setHeader8(msg.getE01CUCSEQ());
			msg.setE01CUCFNM((req.getParameter("E01CUCFNM") == null ? " " : req.getParameter("E01CUCFNM")));
			userPO.setHeader9(msg.getE01CUCFNM());

			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			
			newmessage = mp.receiveMessageRecord(); // Error
			if (mp.hasError(newmessage)){
				ses.setAttribute("error", newmessage);
			}else{
				// Receive List
				JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
				if (mp.hasError(list)) {
					ses.setAttribute("error", mp.getError(list));
				}else {
					ses.setAttribute("ESD0093List", list);
				}
			}	
			forward("ESD0093_process_list.jsp", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	// SCREEN = 11, 12, 20
		// Send List of Customers & Accounts  
		//
		protected void procReqListA(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			UserPos userPO = null;
			MessageProcessor mp = null;
			try {
				mp = new MessageProcessor("ESD0093");
				//
				// Products List
				//
				ESD009311Message msg = (ESD009311Message) mp.getMessageRecord("ESD009311");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				// Send Initial data
				msg.setH11USERID(user.getH01USR());
				msg.setH11PROGRM("ESD0093");
				msg.setH11TIMSYS(getTimeStamp());
				msg.setH11SCRCOD("01");
				msg.setH11OPECOD("0011");
				msg.setE11FRC("0"); 
				
				switch (screen) {
				case 11 :  // Initial Screen  
					msg.setH11OPECOD("0011");
					userPO.setPurpose("NEW");
					break;
				case 12 :  // Refresh List
					msg.setH11OPECOD("0012");
					userPO.setPurpose("MAINTENANCE");
					break;
				case 20 :  // Approval List
					msg.setH11OPECOD("0020");
					userPO.setPurpose("APPROVAL");
					break;
				default :
					msg.setH11OPECOD("0011");
					userPO.setPurpose("MAINTENANCE");
				break;  
				}
				
				msg.setE11TYP("N");
				msg.setE11CUN((req.getParameter("E11CUN") == null ? "0" : req.getParameter("E11CUN")));
				msg.setE11OF1((req.getParameter("E11OF1") == null ? " " : req.getParameter("E11OF1")));
				msg.setE11OF2((req.getParameter("E11OF2") == null ? " " : req.getParameter("E11OF2")));
				msg.setE11BR1((req.getParameter("E11BR1") == null ? "0" : req.getParameter("E11BR1")));
				msg.setE11BR2((req.getParameter("E11BR2") == null ? "0" : req.getParameter("E11BR2")));

				// Send Message	
				mp.sendMessage(msg);
				ses.setAttribute("userPO", userPO);
				// Receive List
				JBObjList list =
					(JBObjList) mp.receiveMessageRecordList("E11INDOPE","E11NUMREC", 9999);
				if (mp.hasError(list)) {
					ses.setAttribute("error", mp.getError(list));
				} else {
					ses.setAttribute("optList", list);
				}

				forward("ESD0093_officers_reasignament_list.jsp", req, res);
			} finally {
				if (mp != null)
					mp.close();
			}
		}


		// SCREEN = 15, 25
		// Update / Approval (Sending all rows to Socket) 
		//
		protected void procActionDSA(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
				HttpSession ses, int screen)
			throws ServletException, IOException {

			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			ESD009311Message msg = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			String ope ="0015";
			String operet ="11";
			switch (screen) {
			case 15 :  // Refresh List for Approval
				userPO.setPurpose("MAINTENANCE");
				break;
			case 25 :  // Approval   
				ope = "0025";
				operet = "20";
				userPO.setPurpose("APPROVAL");
				break;					
			default :
				userPO.setPurpose("MAINTENANCE");
			break;  
			}
			
			int totRows = Integer.parseInt(req.getParameter("TOTROWS"));
			
			// Send data
			try { 
				mp = new MessageProcessor("ESD0093");
				msg = (ESD009311Message) mp.getMessageRecord("ESD009311");
				
				for (int row = 0; row < totRows ; row++) {
					msg.setH11USERID(user.getH01USR());
					msg.setH11PROGRM("ESD0093");
					msg.setH11TIMSYS(getTimeStamp());
					msg.setH11SCRCOD("01");
					msg.setH11OPECOD(ope);
					msg.setE11FRC("0"); 
							
					msg.setE11CUN((req.getParameter("E11CUN") == null ? "0" : req.getParameter("E11CUN")));
					msg.setE11OF1((req.getParameter("E11OF1") == null ? " " : req.getParameter("E11OF1")));
					msg.setE11OF2((req.getParameter("E11OF2") == null ? " " : req.getParameter("E11OF2")));
					msg.setE11BR1((req.getParameter("E11BR1") == null ? " " : req.getParameter("E11BR1")));
					msg.setE11BR2((req.getParameter("E11BR2") == null ? " " : req.getParameter("E11BR2")));
					
					msg.setE11TYR((req.getParameter("E11TYR_" + row) == null ? "H" : req.getParameter("E11TYR_" + row)));
					msg.setE11CUACUN((req.getParameter("E11CUACUN_" + row) == null ? "0" : req.getParameter("E11CUACUN_" + row)));
					msg.setE11CUAACC((req.getParameter("E11CUAACC_" + row) == null ? "0" : req.getParameter("E11CUAACC_" + row)));
					msg.setE11CUAACT((req.getParameter("E11CUAACT_" + row) == null ? "N" : req.getParameter("E11CUAACT_" + row)));
					msg.setE11CUACUS((req.getParameter("E11CUACUS_" + row) == null ? " " : req.getParameter("E11CUACUS_" + row)));
					msg.setE11CUAOF2((req.getParameter("E11OF2") == null ? " " : req.getParameter("E11OF2")));
					msg.setE11CUABR2((req.getParameter("E11BR2") == null ? " " : req.getParameter("E11BR2")));
					
					msg.setH11FLGWK1("");
					// Send Message
					mp.sendMessage(msg);
				} // EndFor
				
				msg.setH11USERID(user.getH01USR());
				msg.setH11PROGRM("ESD0093");
				msg.setH11TIMSYS(getTimeStamp());
				msg.setH11SCRCOD("01");
				msg.setH11OPECOD(ope);
				msg.setE11FRC("0");  
				msg.setH11FLGWK1("S");  // End of List
				
				mp.sendMessage(msg);
				// Receive Error Message or Data Message (Optional)
				ses.setAttribute("userPO", userPO);
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
					forward("ESD0093_officers_reasignament_list.jsp", req, res);
				} else {
					redirectToPage("/servlet/datapro.eibs.client.JSESD0093?SCREEN=" + operet + "&FromRecord=0", res);
				}

			} finally {
				if (mp != null) 
					mp.close();
			}
		}
		
		// SCREEN = 1 
		// Send List of archivos para masivo de asesor/oficina clientes - productos  
		//
		protected void procReqListApproval(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			UserPos userPO = null;
			MessageProcessor mp = null;
			try {
				mp = new MessageProcessor("ESD0093");
				//
				// Customer List
				//
				ESD009301Message msg = (ESD009301Message) mp.getMessageRecord("ESD009301");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				
				// Send Initial data
				msg.setH01USERID(user.getH01USR()); 
				msg.setH01PROGRM("ESD0093");
				msg.setH01TIMSYS(getTimeStamp());
				msg.setH01SCRCOD("01");
				msg.setH01OPECOD("0008");
				msg.setE01NUMREC("0"); 
				
				// Send Message	
				mp.sendMessage(msg);
				ses.setAttribute("userPO", userPO);
				// Receive List
				JBObjList list =
					(JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
				if (mp.hasError(list)) {
					ses.setAttribute("error", mp.getError(list));
				} else {
					ses.setAttribute("msgList", list);
				} 
				forward("ESD0093_process_list_ap.jsp", req, res);
			} finally {
				if (mp != null)
					mp.close();
			}
		}
				
		// SCREEN = 1 
		// Send List of Officers and Customers  
		//
		protected void procDelListApproval(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {
				UserPos userPO = null;
				MessageProcessor mp = null;
				MessageRecord newmessage = null;
					
				try {
					mp = new MessageProcessor("ESD0093");
					ESD009301Message msg = (ESD009301Message) mp.getMessageRecord("ESD009301");
					userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
					// Send Initial data
					msg.setH01USERID(user.getH01USR()); 
					msg.setH01PROGRM("ESD0093");
					msg.setH01TIMSYS(getTimeStamp());
					msg.setH01SCRCOD("04");
					msg.setH01OPECOD("0008");
					msg.setE01NUMREC("0"); 
					//
					msg.setE01CUCVIA((req.getParameter("E01CUCVIA") == null ? " " : req.getParameter("E01CUCVIA")));
					// Send Message	
					mp.sendMessage(msg);
					ses.setAttribute("userPO", userPO);
					// Receive List
					// Receive Error Message or Data Message (Optional)
					newmessage = mp.receiveMessageRecord();
					if (mp.hasError(newmessage)) {
						ses.setAttribute("error", newmessage);
						forward("ESD0093_process_list_ap.jsp", req, res);
					} else {
						redirectToPage("/servlet/datapro.eibs.client.JSESD0093?SCREEN=8", res);
					}
				} finally {
					if (mp != null)
						mp.close();
				}
			}	
				
			// SCREEN = 1 
			// Send List of Officers and Customers  
			//
			protected void procRptListApproval(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
				HttpSession ses, int screen)
				throws ServletException, IOException {

				UserPos userPO = null;
				MessageProcessor mp = null;
				MessageRecord newmessage = null;
					
				try {
					mp = new MessageProcessor("ESD0093");
					ESD009301Message msg = (ESD009301Message) mp.getMessageRecord("ESD009301");
					userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
					// Send Initial data
					msg.setH01USERID(user.getH01USR()); 
					msg.setH01PROGRM("ESD0093");
					msg.setH01TIMSYS(getTimeStamp());
					msg.setH01SCRCOD("05");
					msg.setH01OPECOD("0008");
					msg.setE01NUMREC("0"); 
						//
					msg.setE01CUCVIA((req.getParameter("E01CUCVIA") == null ? " " : req.getParameter("E01CUCVIA")));
			
					// Send Message	
					mp.sendMessage(msg);
					ses.setAttribute("userPO", userPO);
					// Receive List
					// Receive Error Message or Data Message (Optional)
					newmessage = mp.receiveMessageRecord();
					if (mp.hasError(newmessage)) {
						ses.setAttribute("error", newmessage);
						forward("ESD0093_process_list_ap.jsp", req, res);
					} else {
						redirectToPage("/servlet/datapro.eibs.client.JSESD0093?SCREEN=8", res);
					}
				} finally {
					if (mp != null)
						mp.close();
				}
			}
		
		
		// SCREEN = 26 
		// Send List of Officers and Customers  
		//
		protected void procFileApproval(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {

			UserPos userPO = null;
			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			
			try {
				mp = new MessageProcessor("ESD0093");
				ESD009301Message msg = (ESD009301Message) mp.getMessageRecord("ESD009301");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				// Send Initial data
				msg.setH01USERID(user.getH01USR()); 
				msg.setH01PROGRM("ESD0093");
				msg.setH01TIMSYS(getTimeStamp());
				msg.setH01SCRCOD("06");
				msg.setH01OPECOD("0008");
				msg.setE01NUMREC("0"); 
				//
				msg.setE01CUCVIA((req.getParameter("E01CUCVIA") == null ? " " : req.getParameter("E01CUCVIA")));
		
				// Send Message	
				mp.sendMessage(msg);
				ses.setAttribute("userPO", userPO);
				// Receive List
				// Receive Error Message or Data Message (Optional)
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
					forward("ESD0093_process_list_ap.jsp", req, res);
				} else {
					redirectToPage("/servlet/datapro.eibs.client.JSESD0093?SCREEN=8", res);
				}
			} finally {
				if (mp != null)
					mp.close();
			}
		}
				
	
	
}