package datapro.eibs.client; 
/**
 * Maintenance of Relations, Contacts and adresses Records
 * Creation date: (09/15/11)
 * @author: Carlos Castillo
 * 
 * 	// List of Options
 * 	//
 *	// SCREEN =    1	Send List of Cumad/Curel/Cucnt Records
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

public class JSESD0086 extends JSEIBSServlet { 
	 
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		switch (screen) {
			// Requests List 
			case 1 :
			case 6 :
			case 8 :	
				procReqList(user, req, res, session, screen);
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

	// SCREEN = 1, 6 , 8
	// Send List of Records  
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses, int screen)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("ESD0086");
			ESD008601Message msg = (ESD008601Message) mp.getMessageRecord("ESD008601");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD0086");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCR(userPO.getSource());   // Maintenance Type
			msg.setH01OPECOD("0001");
			if (screen == 1) {
				userPO.setPurpose("MAINTENANCE");
			} else if (screen == 6) {
				userPO.setPurpose("APPROVAL");
			} else if (screen == 8) {
				msg.setH01OPECOD("0008");
				userPO.setPurpose("INQUIRY");
			}
			
			msg.setE01NUMREC((req.getParameter("FromRecord") == null ? "0" : req.getParameter("FromRecord")));
			userPO.setHeader10(req.getParameter("RECTYP"));
			msg.setE01CUN((req.getParameter("E01CUN") == null ? userPO.getCusNum() : req.getParameter("E01CUN")));
			msg.setE01RTP(userPO.getHeader10());
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			JBObjList list =
				(JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
				redirectToPage("/servlet/datapro.eibs.client.JSESD1080?SCREEN=6&OPE=" + userPO.getSource() + "", res);
			} else {
				ses.setAttribute("ESD0086List", list);
				forward("ESD0086_client_entity_list.jsp", req, res);
			}
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
		UserPos userPO = null;
		String dtlPage = "";
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send data
		try {
			mp = new MessageProcessor("ESD0086");
			ESD008601Message msg = (ESD008601Message) mp.getMessageRecord("ESD008601");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("ESD0086");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCR(userPO.getSource());   // Maintenance Type
			switch (screen) {
				case 2 : // Request new Record
					msg.setH01OPECOD("0002");
					userPO.setPurpose("NEW");
					break;
				case 3 : // Request old Record
					msg.setH01OPECOD("0003");
					if (userPO.getPurpose().equals("INQUIRY")) msg.setH01OPECOD("0013"); ;
					break;
				case 4 : // Delete Record
					msg.setH01OPECOD("0004");
					break;
				case 5 : // Submit the Record for update
					msg.setH01OPECOD("0005");
					break;
				case 10: // Submit the Record to move to Customers Work file
					msg.setH01OPECOD("0010");
					break;	
				default :
					forward(SuperServlet.devPage, req, res);
					break;
			}
			// Get key field
			msg.setE01CUN((req.getParameter("H01CUN") == null ? userPO.getCusNum() : req.getParameter("H01CUN")));
			msg.setE01RTP((req.getParameter("E01RTP") == null ? userPO.getHeader10() : req.getParameter("E01RTP")));
			msg.setE01MAN((req.getParameter("E01MAN") == null ? "0" : req.getParameter("E01MAN")));
			userPO.setCusNum(msg.getE01CUN());
			userPO.setHeader10(msg.getE01RTP());
			userPO.setSource((userPO.getSource() == null ? "01" : userPO.getSource()));
			if (screen == 5) {
				// Get all fields in page
				try {
					super.setMessageRecord(req, msg);
				} catch (Exception e) {				
				}
			}
			//
			if (msg.getE01RTP().equals("1")) {
			    // Direcciones
				dtlPage = "ESD0086_client_direcciones.jsp";
			} else if (msg.getE01RTP().equals("2")) {
			    // Stock Holders
				dtlPage = "ESD0086_client_stock_holders.jsp";
			} else if (msg.getE01RTP().equals("3")) {	
				// Board of Directors
				dtlPage = "ESD0086_client_board.jsp";	
			} else if (msg.getE01RTP().equals("4")) {	
				// Beneficiaries
				dtlPage = "ESD0086_client_beneficiaries.jsp";
			} else if (msg.getE01RTP().equals("5")) {	
				// Legal Representatives
				dtlPage = "ESD0086_client_legal_rep.jsp";
			} else if (msg.getE01RTP().equals("6")) {	
				// Bank References
				dtlPage = "ESD0086_client_bank_references.jsp";
			} else if (msg.getE01RTP().equals("7")) {	
				// Commercial References
				dtlPage = "ESD0086_client_commercial_references.jsp";
			} else if (msg.getE01RTP().equals("9")) {	
				// Assets
				dtlPage = "ESD0086_client_assets.jsp";
			} else if (msg.getE01RTP().equals("A")) {	
				// Liabilities
				dtlPage = "ESD0086_client_liabilities.jsp";
			} else if (msg.getE01RTP().equals("C")) {	
				// Dependants
				dtlPage = "ESD0086_client_relationship.jsp";
	
			} else if (msg.getE01RTP().equals("G")) {	
				// Dependants
				dtlPage = "ESD0086_client_dependants.jsp";
			} else if (msg.getE01RTP().equals("F")) {	
				// Family References
				dtlPage = "ESD0086_client_family_references.jsp";
			} else if (msg.getE01RTP().equals("P")) {	
				// Personal References
				dtlPage = "ESD0086_client_personal_references.jsp";
			} else if (msg.getE01RTP().equals("M")) {	
				// Relationship
				dtlPage = "ESD0086_client_relationship.jsp";
			} else if (msg.getE01RTP().equals("W")) {	
				// Pagares
				dtlPage = "ESD0086_client_pagare.jsp";	
			} else if (msg.getE01RTP().equals("Y")) {	
				// Telefonos
				dtlPage = "ESD0086_client_telefonos.jsp";
			} else if (msg.getE01RTP().equals("Z")) {	
				// Correos Electronicos
				dtlPage = "ESD0086_client_correos_electronicos.jsp";
			} else if (msg.getE01RTP().equals("U")) {	
				// Usos de Domicilio
				dtlPage = "ESD0086_client_usos_domicilio.jsp";	
			} else if (msg.getE01RTP().equals("V")) {	
				// Informacion Adicional
				dtlPage = "ESD0086_client_add_info.jsp";		
			} else {
				dtlPage= "MISC_under_construction.html";
			}
			msg.setH01FLGWK1(""); 
			// Send Message 
			mp.sendMessage(msg);

			// Receive Error Message or Data Message (Optional)
			ses.setAttribute("userPO", userPO);
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				if (screen == 2 || screen == 3 || screen == 4) {
					forward(dtlPage, req, res);
				} else {
					// Receive Data
					newmessage = mp.receiveMessageRecord();
					ses.setAttribute("ESD0086Record", newmessage);
					forward(dtlPage, req, res); 
				}

			} else {
				ses.setAttribute("ESD0086Record", newmessage);
				if (screen == 4 || screen == 5 ) {
					res.sendRedirect(super.srctx + "/servlet/datapro.eibs.client.JSESD0086?SCREEN=1" +
						"&RECTYP=" + userPO.getHeader10().trim() + "&FromRecord=0");
				} else {
					forwardOnSuccess(dtlPage, req, res);
				}
			}
 
		} finally {
			if (mp != null) 
				mp.close();
		}
	}

}