package datapro.eibs.client; 
/**
 * Maintenance of Clients  / Prospects / Entities
 * Creation date: (03/05/14)
 * @author: Carlos Castillo
 * 
 * 	// List of Options
 * 	//
 *	// SCREEN =    1	Send List of Clients for Update
 *	// SCREEN =    2    Request new record
 *	// SCREEN =    3    Request old record
 *	// SCREEN =    4	Delete record 
 *	// SCREEN =    5	Submit the record for Update 
 *	// SCREEN =    6	Send List of Clients for Inquiry
 */
import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class JSESD1080 extends JSEIBSServlet { 
	 
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/***
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		switch (screen) {
			// Request new customer
			case 1 :
				procReqNew(user, req, res, session);
				break;
				// Process Basic Maintenance
			case 2 : // Validate ID and send basic data for new customer
			case 3 : // Request WK old Record
			case 4 : // Delete WK record	
			case 5 : // Submit the Record for update
			case 7 : // Inquiry WK for Approval	
			case 8 : // Inquiry
				procActionRec(user, req, res, session, screen);
				break;
				// Requests List 
			case 6 :	
				procReqList(user, req, res, session, screen);
				break;
				// Requests Inquiry 
			case 16 :	
				procReqInq(user, req, res, session);
				break;
				// Request new entity
			case 21 :
					procReqNewEnt(user, req, res, session);
					break;
					// Process Basic Maintenance
			case 22 : // Validate ID and send basic data for new Entity		
			case 23 : // Request WK old Entity Record
			case 24 : // Delete WK entity record	
			case 25 : // Submit the Entity Record for update
			case 28 : // Inquiry
					procActionRecEnt(user, req, res, session, screen);
					break;
					// Requests Entities List 
			case 26 :	
					procReqListEnt(user, req, res, session, screen);
					break;
			case 9 : // Submit the Record for move from Entity to prospect
				procActionRecEnt(user, req, res, session, screen);
				break;
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}

	// SCREEN = 1 
	// Send Screen for new customer   
	//
	protected void procReqNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = getUserPos(req);
		
		try {
			mp = getMessageProcessor("ESD1080", req);
			ESD108001Message msg = (ESD108001Message) mp.getMessageRecord("ESD108001");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD1080");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0000");
			msg.setE01OPE((req.getParameter("OPE") == null ? "01" : req.getParameter("OPE")));
			userPO.setPurpose("NEW");
			userPO.setOption("C1");
			userPO.setSource(msg.getE01OPE());
			userPO.setCusNum(msg.getE01CUN());
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive Error
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
			}	
			// Receive Data
			newmessage = mp.receiveMessageRecord();
			ses.setAttribute("client", newmessage);
			String bPage = "ESD1080_client_enter_new.jsp";
			if (userPO.getSource().equals("20")) bPage = "ESD1080_prospect_enter_new.jsp";
			forward(bPage, req, res);
			
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	
	// SCREEN = 6 
	// Send List of Clients   
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		String searchType = "";
		try {
			mp = getMessageProcessor("ESD1080", req);
			ESD108001Message msg = (ESD108001Message) mp.getMessageRecord("ESD108001");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD1080");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0015");
			if (screen == 6) {
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
				searchType = req.getParameter("SEARCHTYPE");
			} catch (Exception e) { }
			if (searchType == null) {
				searchType = "C";
			}
			if (searchType.equals("C")) {
				try {
					msg.setE01CUN(req.getParameter("SEARCHCDE"));
				} catch (Exception e) { 
					msg.setE01CUN("0");
				}
			} else if (searchType.equals("S")) {
				try {
					msg.setE01SHN(req.getParameter("SEARCHCDE"));
				} catch (Exception e) {	
					msg.setE01SHN("");
				}
			} else if(searchType.equals("I")) {
				try {
					msg.setE01IDN(req.getParameter("SEARCHCDE"));
				} catch (Exception e) {
					msg.setE01IDN("");
				}
			}
			
			msg.setE01OPE((req.getParameter("OPE") == null ? "01" : req.getParameter("OPE")));
			msg.setH01FLGWK1(searchType);
			userPO.setType(msg.getH01FLGWK1());
			try {
				userPO.setHeader11(req.getParameter("SEARCHCDE"));
			} catch (Exception e) { }
			
			userPO.setCusNum(msg.getE01CUN());
			userPO.setCusName(msg.getE01SHN());
			userPO.setIdentifier(msg.getE01IDN());
			userPO.setSource(msg.getE01OPE());
			userPO.setOption("C1");
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("ESD1080List", list);
			}
			String lstPage = "ESD1080_client_list.jsp";
			if (userPO.getSource().equals("20")) lstPage = "ESD1080_prospect_list.jsp";
			forward(lstPage, req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	// SCREEN = 2,4,3,5,7,8
	// Get or Process the Record  
	//
	protected void procActionRec(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = getUserPos(req);
		userPO.setApplicationCode("C1");
		
		// Send data
		try {
			mp = getMessageProcessor("ESD1080", req);
			ESD108001Message msg = (ESD108001Message) mp.getMessageRecord("ESD108001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD1080");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setE01OPE((req.getParameter("OPE") == null ? "01" : req.getParameter("OPE")));
			msg.setH01FLGWK1((req.getParameter("VALMOT") == null ? "Y" : req.getParameter("VALMOT")));
			
			switch (screen) {
				case 2 : // Request new Record
					msg.setH01OPECOD("0001");
					userPO.setPurpose("NEW");
					break;
				case 3 : // Request old Record
					msg.setH01OPECOD("0003");
					break;
				case 4 : // Delete Record
					userPO.setPurpose("MAINTENANCE");
					msg.setH01OPECOD("0009");
					break;
				case 5 : // Submit the Record for update
					msg.setH01OPECOD("0005");
					break;
				case 7 : // Submit the Record for Approval Inquiry
					userPO.setPurpose("APPROVAL");
					msg.setH01OPECOD("0007");	
					break;
				case 8 : // Submit the Record for Inquiry
					userPO.setPurpose("INQUIRY");
					msg.setH01OPECOD("0008");	
					break;
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
			// Get key field
			msg.setE01CUN((req.getParameter("E01CUN") == null ? userPO.getCusNum() : req.getParameter("E01CUN")));
			userPO.setSource(((msg.getE01OPE() == null) ? "01" : msg.getE01OPE()));
			userPO.setCusNum((msg.getE01CUN() == null) ? "0" : msg.getE01CUN());
			
			userPO.setOption("C1");
			if(screen == 8){
				userPO.setIdentifier(msg.getE01CUN());
			}					
			if (screen == 2 || screen == 5 ) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {				
				}
			}
			String dtlPage = "ESD1080_client_basic.jsp";
			String lstPage = "ESD1080_client_list.jsp";
			String newPage = "ESD1080_client_enter_new.jsp";
			if (msg.getE01OPE().equals("00")) dtlPage = "ESD1080_client_basic.jsp";
			if (msg.getE01OPE().equals("02")) dtlPage = "ESD1080_client_status.jsp";
			if (msg.getE01OPE().equals("10")) dtlPage = "ESD1080_client_fusion.jsp";
			if (msg.getE01OPE().equals("12")) dtlPage = "ESD1080_client_ley_victimas.jsp";
			if (msg.getE01OPE().equals("15")) dtlPage = "ESD1080_client_id.jsp";
			if (msg.getE01OPE().equals("30")) dtlPage = "ESD1080_client_biometria.jsp";
			if (msg.getE01OPE().equals("20")) {
				dtlPage = "ESD1080_prospect_basic.jsp";
				lstPage = "ESD1080_prospect_list.jsp";
				newPage = "ESD1080_prospect_enter_new.jsp";
			}
			if (msg.getE01OPE().equals("25")) dtlPage = "ESD1080_client_taxes_basic.jsp";
			// Send CIF List for Fusion 
			if (msg.getE01OPE().equals("10") && msg.getH01OPECOD().equals("0005")) procActionCif(user, req, res, ses);
			// Send Message 
			mp.sendMessage(msg);
			//
			if (userPO.getSource().equals("10") ) {   // Fusion: Receive Product List
				JBObjList list =
					(JBObjList) mp.receiveMessageRecordList("E06INDOPE","E06NUMREC");
					ses.setAttribute("ECIF010List", list);
			}
			// Receive Error Message   
			newmessage = mp.receiveMessageRecord();
			boolean indErr = false;
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				indErr = true;
			}	
			// Receive Data
			newmessage = mp.receiveMessageRecord();
			msg = (ESD108001Message) newmessage;
			userPO.setCusName(msg.getE01NA1());
			userPO.setCusType(msg.getE01LGT());
						
			// formatear fechas
			String fec    = null;
			String fecha1 = null; 
			String fecha2 = null; 
			String fecha3 = null;
			
			try{
			fec = msg.getC01LB6().substring(0, 32);	
			fecha1 = msg.getC01LB6().substring(0, 10);
			fecha2 = msg.getC01LB6().substring(10, 21);
			fecha3 = msg.getC01LB6().substring(21, 32);
			
			} catch(Exception e){
				fecha1 = "0";
				fecha2 = "0";
				fecha3 = "0";
			}			
		// 	String fecha11 = datapro.eibs.master.Util.formatCustomDate(user.getE01DTF(),fecha1);
		//	String fecha21 = datapro.eibs.master.Util.formatCustomDate(user.getE01DTF(),fecha2);
	    //	String fecha31 = datapro.eibs.master.Util.formatCustomDate(user.getE01DTF(),fecha3);
			
			userPO.setHeader15(fecha1);
			userPO.setHeader16(fecha2);
			userPO.setHeader17(fecha3);
			//
			ses.setAttribute("client", newmessage);
			ses.setAttribute("userPO", userPO);
					
			
			if (indErr) {
				if (screen == 2 ) {
					forward(newPage, req, res);
				} else if (screen == 3) { 
					forward(lstPage, req, res);
				} else if (screen == 8) {
					procReqInq(user, req, res, ses);
				} else {
					forward(dtlPage, req, res);
				}
			} else {
				if (screen == 4 || screen == 5 || msg.getE01APR().equals("L") || msg.getE01OPE().equals("30")) {
					forward("ESD1080_client_confirm.jsp", req, res);
				} else {
					forward(dtlPage, req, res);
				}
			}

		} finally {

			if (mp != null) 
				mp.close();
		}
	}

	// SCREEN = 5 with OPE = '10' --> FUSION
	// Process the CIF List (Sending all rows to Socket) 
	//
	protected void procActionCif(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		MessageProcessor mp6 = null;
		ESD108006Message msg6 = null;
		int totRows = Integer.parseInt(req.getParameter("TOTROWS"));
		
		// Send data
		try { 
			mp6 = getMessageProcessor("ESD1080", req);
			msg6 = (ESD108006Message) mp6.getMessageRecord("ESD108006");
			msg6.setH06FLGWK1("D");
			
			for (int row = 0; row < totRows ; row++) {
				msg6.setH06USERID(user.getH01USR());
				msg6.setH06PROGRM("ESD1080");
				msg6.setH06TIMSYS(getTimeStamp());  
				msg6.setH06SCRCOD("01");
				msg6.setH06OPECOD("0005");
				
				msg6.setE06ACT((req.getParameter("E06ACT_" + row) == null ? "N" : req.getParameter("E06ACT_" + row)));
				msg6.setE06SELCUN(req.getParameter("E06SELCUN_" + row));
				msg6.setE06SELACD(req.getParameter("E06SELACD_" + row));
				msg6.setE06SELTYP(req.getParameter("E06SELTYP_" + row));
				msg6.setE06ACCNUM(req.getParameter("E06ACCNUM_" + row));
				// Send Message
				mp6.sendMessage(msg6);
				msg6.setH06FLGWK1(" ");
			} // EndFor
			msg6.setH06FLGWK1("S");  // End of List
			mp6.sendMessage(msg6);
		} finally {
			if (mp6 != null) 
				mp6.close();
		}
	}
	
	// SCREEN = 16 
	// Send Screen Inquiry   
	//
	protected void procReqInq(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		userPO.setSource((req.getParameter("OPE") == null ? "00" : req.getParameter("OPE")));
		userPO.setPurpose(userPO.getSource().equals("00") ? "INQUIRY" : "MAINTENANCE");
		userPO.setOption("C1");
		ses.setAttribute("userPO", userPO);
		
		try {
			String bPage = "ESD1080_client_inq_enter.jsp";
			forward(bPage, req, res);
			
		} finally {
		}
	}
	
	// SCREEN = 21 
	// Send Screen for new entity   
	//
	protected void procReqNewEnt(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = getUserPos(req);
		
		try {
			mp = getMessageProcessor("ESD1080", req);
			ESD108001Message msg = (ESD108001Message) mp.getMessageRecord("ESD108001");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD1080");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0000");
			msg.setE01OPE((req.getParameter("OPE") == null ? "22" : req.getParameter("OPE")));
			userPO.setPurpose("NEW");
			userPO.setOption("C1");
			userPO.setProdCode(msg.getE01OPE());
			userPO.setPorfNum(msg.getE01CUN());
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive Error
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
			}	
			// Receive Data
			newmessage = mp.receiveMessageRecord();
			ses.setAttribute("client", newmessage);
			String bPage = "ESD1080_entity_enter_new.jsp";
			forward(bPage, req, res);
			
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	
	// SCREEN = 26 
	// Send List of Entities   
	//
	protected void procReqListEnt(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		String searchType = "";
		try {
			mp = getMessageProcessor("ESD1080", req);
			ESD108001Message msg = (ESD108001Message) mp.getMessageRecord("ESD108001");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD1080");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01OPECOD("0015");
			if (screen == 26) {
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
				searchType = req.getParameter("SEARCHTYPE");
			} catch (Exception e) { }
			if (searchType == null) {
				searchType = "C";
			}
			if (searchType.equals("C")) {
				try {
					msg.setE01CUN(req.getParameter("SEARCHCDE"));
				} catch (Exception e) { 
					msg.setE01CUN("0");
				}
			} else if (searchType.equals("S")) {
				try {
					msg.setE01SHN(req.getParameter("SEARCHCDE"));
				} catch (Exception e) {	
					msg.setE01SHN("");
				}
			} else if(searchType.equals("I")) {
				try {
					msg.setE01IDN(req.getParameter("SEARCHCDE"));
				} catch (Exception e) {
					msg.setE01IDN("");
				}
			}
			
			msg.setE01OPE((req.getParameter("OPE") == null ? "22" : req.getParameter("OPE")));
			msg.setH01FLGWK1(searchType);
			userPO.setType(msg.getH01FLGWK1());
			try {
				userPO.setHeader11(req.getParameter("SEARCHCDE"));
			} catch (Exception e) { }
			
			userPO.setPorfNum(msg.getE01CUN());
			userPO.setCusName(msg.getE01SHN());
			userPO.setIdentifier(msg.getE01IDN());
			userPO.setProdCode(msg.getE01OPE());
			userPO.setOption("C1");
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
			} else {
				ses.setAttribute("ESD1080List", list);
			}
			String lstPage = "ESD1080_entity_list.jsp";
			forward(lstPage, req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	// SCREEN = 22,24,23,25,27,28, 9
	// Get or Process the Record  
	//
	protected void procActionRecEnt(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		UserPos userPO = getUserPos(req);
		userPO.setApplicationCode("C1");
		
		// Send data
		try {
			mp = getMessageProcessor("ESD1080", req);
			ESD108001Message msg = (ESD108001Message) mp.getMessageRecord("ESD108001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD1080");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setE01OPE((req.getParameter("OPE") == null ? "22" : req.getParameter("OPE")));
			msg.setH01FLGWK1((req.getParameter("VALMOT") == null ? "Y" : req.getParameter("VALMOT")));
			
			switch (screen) {
				case 22 : // Request new Record
					msg.setH01OPECOD("0001");
					userPO.setPurpose("NEW");
					break;
				case 23 : // Request old Record
					msg.setH01OPECOD("0003");
					break;
				case 24 : // Delete Record
					userPO.setPurpose("MAINTENANCE");
					msg.setH01OPECOD("0009");
					break;
				case 25 : // Submit the Record for update
					msg.setH01OPECOD("0005");
					break;
				case 28 : // Submit the Record for Inquiry
					userPO.setPurpose("INQUIRY");
					msg.setH01OPECOD("0008");	
					break;
				case 9 : // Submit the Record for move from Entity to Prospect
					msg.setH01OPECOD("0010");
					break;					
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
			// Get key field
			
			msg.setE01CUN((req.getParameter("E01CUN") == null ? userPO.getPorfNum() : req.getParameter("E01CUN")));
			userPO.setProdCode(((msg.getE01OPE() == null) ? "22" : msg.getE01OPE()));
			userPO.setPorfNum((msg.getE01CUN() == null) ? "0" : msg.getE01CUN());
			
			
			userPO.setOption("C1");
			if(screen == 28){
				userPO.setIdentifier(msg.getE01CUN());
			}					
			if (screen == 22 || screen == 25 || screen == 9) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {				
				}
			}
			String dtlPage = "ESD1080_entity_basic.jsp";
			String lstPage = "ESD1080_entity_list.jsp";
			String newPage = "ESD1080_entity_enter_new.jsp";
			// Send Message 
			mp.sendMessage(msg);
			//
			// Receive Error Message   
			newmessage = mp.receiveMessageRecord();
			boolean indErr = false;
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				indErr = true;
			}	
			// Receive Data
			newmessage = mp.receiveMessageRecord();
			msg = (ESD108001Message) newmessage;
			userPO.setCusName(msg.getE01NA1());
			userPO.setCusType(msg.getE01LGT());
			ses.setAttribute("client", newmessage);
			ses.setAttribute("userPO", userPO);
			if (indErr) {
				if (screen == 22 ) {
					forward(newPage, req, res);
				} else if (screen == 23) { 
					forward(lstPage, req, res);
				} else if (screen == 28) {
					procReqInq(user, req, res, ses);
				} else {
					forward(dtlPage, req, res);
				}
			} else {
				if (screen == 24 || screen == 25 || screen == 9 || msg.getE01APR().equals("L")) {
					forward("ESD1080_client_confirm.jsp", req, res);
				} else {
					forward(dtlPage, req, res);
				}
			}

		} finally {

			if (mp != null) 
				mp.close();
		}
	}
	
}