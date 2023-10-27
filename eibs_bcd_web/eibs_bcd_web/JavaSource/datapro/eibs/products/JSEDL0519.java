package datapro.eibs.products;
/** 
 * Provision-Incumplimiento Prestamos. 
 * Creation date: (18/Nov/15)
 * @author: Rommel Gonzalez
 */
import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class JSEDL0519 extends JSEIBSServlet { 
	protected String LangPath = "S";
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		switch (screen) {
			// Requests List 
			
			case 10 :	
				procReqNewEnter(user, req, res, session);
				break;
			case 1 :
				procReqList(user, req, res, session);
				break;
			case 2 : // Request new Record
			case 3 : // Request old Record
			case 4 : // Delete record	
			case 5 : // Submit the Record for update
				procActionRec(user, req, res, session, screen);
				break;
			case 6 : // Envia data para ser modificada
				procReqListProd(user, req, res, session);
				break;	
			case 7 : // recive data para actualizar
				procActionRecPro(user, req, res, session, screen);
				break;
			case 8 : // regresa a pantalla anterior
				procActionRegPro(user, req, res, session, screen);
				break;
				
			case 11 :
				procReqInqEnter(user, req, res, session);
				break;				
			
			case 12 :
				procReqListConsu(user, req, res, session);
				break;	
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}
	}
	// SCREEN = 10 
	// Solicita Datos de Entrada 
	//
	protected void procReqNewEnter(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
	throws ServletException, IOException {

		ELEERRMessage msgError = null;
		UserPos	userPO = null;	
		EDL051901Message msgInc = null;
			try {

				msgError = new datapro.eibs.beans.ELEERRMessage();
				userPO = new datapro.eibs.beans.UserPos();
				msgInc = new datapro.eibs.beans.EDL051901Message();
				userPO.setOption("MAIN_INCUMP");
				userPO.setPurpose("NEW");
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("incump", msgInc);

			} catch (Exception ex) { 
				flexLog("Error: " + ex); 
			}

			try {
				flexLog("About to call Page: " + LangPath + "EDL0519_ln_incumplimiento_enter.jsp");
				forwardOnSuccess("EDL0519_ln_incumplimiento_enter.jsp", req, res);
			}
			catch (Exception e) {
				flexLog("Exception calling page " + e);
			}

}
	// SCREEN = 1 
	//
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		try { 
			mp = new MessageProcessor("EDL0519");
			EDL051901Message msg = (EDL051901Message) mp.getMessageRecord("EDL051901");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAIN_INCUMP");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDL0519");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0001");
			
			try {
				msg.setE01NUMREC(req.getParameter("FromRecord"));
			} catch (Exception e) {
				msg.setE01NUMREC("0"); 
			}
			try {
				msg.setE01CUSCUN(req.getParameter("E01CUSCUN"));
			} catch (Exception e) { 
				msg.setE01CUSCUN("");
			}
			try {
				msg.setE01DLCMOD(req.getParameter("E01DLCMOD"));
			} catch (Exception e) { 
				msg.setE01DLCMOD("");
			}
			try {
				msg.setE01PERMES(req.getParameter("E01PERMES"));
			} catch (Exception e) { 
				msg.setE01PERMES("");
			}
			try {
				msg.setE01PERAYO(req.getParameter("E01PERAYO"));
			} catch (Exception e) { 
				msg.setE01PERAYO("");
			}
			try {
				userPO.setHeader1(msg.getE01CUSCUN());
			} catch (Exception e) { }
			try {
				userPO.setHeader2(msg.getE01DLCMOD());
			} catch (Exception e) { }
			try {
				userPO.setHeader3(msg.getE01PERMES());
			} catch (Exception e) { }
			try {
				userPO.setHeader4(msg.getE01PERAYO());
			} catch (Exception e) { }
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				forward("EDL0519_ln_incumplimiento_enter.jsp", req, res);
			} else {
			
			
			JBObjList list = (JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			try {
				userPO.setHeader5(msg.getD01DLCMOD());
			} catch (Exception e) { }
			try {
				userPO.setHeader6(msg.getE01CUSTID());
			} catch (Exception e) { }
			
			try {
				userPO.setHeader7(msg.getE01CUSIDN());
			} catch (Exception e) { }
			try {
				userPO.setHeader8(msg.getE01CUSNA1());
			} catch (Exception e) { }
			try {
				userPO.setHeader9(msg.getD01CODTEL());
			} catch (Exception e) { }
			try {
				userPO.setHeader10(msg.getE01CODEMA());
			} catch (Exception e) { }
			try {
				userPO.setHeader11(msg.getD01CODEMA());
			} catch (Exception e) { }
			try {
				userPO.setHeader12(msg.getE01TELCLI());
			} catch (Exception e) { }
			try {
				userPO.setHeader13(msg.getE01MAICLI());
			} catch (Exception e) { }
			try {
			} catch (Exception e) { }
			ses.setAttribute("userPO", userPO);
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
				forwardOnSuccess("EDL0519_ln_incumplimiento_enter.jsp", req, res);
			} else {
				ses.setAttribute("EDL0519List", list);
				forwardOnSuccess("EDL0519_ln_maint_incumplimiento.jsp", req, res);
			}
			}
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	
	// SCREEN = 6
	// 
	protected void procReqListProd(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		try { 
			mp = new MessageProcessor("EDL0519");
			EDL051902Message msg = (EDL051902Message) mp.getMessageRecord("EDL051902");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAIN_INCUMP");
			// Send Initial data
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("EDL0519");
			msg.setH02TIMSYS(getTimeStamp());
			msg.setH02SCRCOD("01");
			msg.setH02OPECOD("0001");
			
			
			try {
				msg.setE02CUSCUN(req.getParameter("E01CUSCUN"));
			} catch (Exception e) { 
				msg.setE02CUSCUN("");
			}
			try {
				msg.setE02DEAACC(req.getParameter("E01DEAACC"));
			} catch (Exception e) { 
				msg.setE02DEAACC("");
			}
			try {
				msg.setE02DLCMOD(userPO.getHeader2());
			} catch (Exception e) { 
				msg.setE02DLCMOD("");
			}
			try {
				msg.setE02PERMES(req.getParameter("E02PERMES"));
			} catch (Exception e) { 
				msg.setE02PERMES("");
			}
			try {
				msg.setE02PERAYO(req.getParameter("E02PERAYO"));
			} catch (Exception e) { 
				msg.setE02PERAYO("");
			}
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				forward("EDL0519_ln_maint_incumplimiento.jsp", req, res);
			} else {
			msg = (EDL051902Message) newmessage;
			
			try {
			} catch (Exception e) { }
			
			ses.setAttribute("userPO", userPO);
			ses.setAttribute("Main_Incum", newmessage);
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				forwardOnSuccess("EDL0519_ln_maint_incumplimiento.jsp", req, res);
			} else {
				ses.setAttribute("Main_Incum", newmessage);
				forwardOnSuccess("EDL0519_ln_incumplimiento_proceso.jsp", req, res);
			}
			}
		} finally {
			if (mp != null)
				mp.close();
		}
	}	
	// SCREEN = 7
	protected void procActionRecPro(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {
		UserPos userPO = null;
		//EDL051902Message msg = null;
		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		try { 
			mp = new MessageProcessor("EDL0519");
			EDL051902Message msg = (EDL051902Message) mp.getMessageRecord("EDL051902");
			userPO.setPurpose("MAIN_INCUMP");
			// Send Initial data
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("EDL0519");
			msg.setH02TIMSYS(getTimeStamp());
			msg.setH02SCRCOD("01");
			msg.setH02OPECOD("0004");
			
			try {
				super.setMessageRecord(req, msg);
			} catch (Exception e) {				
			}
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive Data
			
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				forward("EDL0519_ln_incumplimiento_proceso.jsp", req, res);
			} else {
			msg = (EDL051902Message) newmessage;
			
			try {
			} catch (Exception e) { }
			
			ses.setAttribute("userPO", userPO);
			ses.setAttribute("Main_Incum", newmessage);
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				forwardOnSuccess("EDL0519_ln_incumplimiento_proceso.jsp", req, res);
			} else {
				//ses.setAttribute("Main_Incum", newmessage);
				//forwardOnSuccess("EDL0519_ln_incumplimiento_proceso.jsp", req, res);
				redirectToPage("/servlet/datapro.eibs.products.JSEDL0519?SCREEN=1&FromRecord=0&E01CUSCUN=" + userPO.getHeader1() + "&E01DLCMOD=" + userPO.getHeader2() + "&E01PERMES=" + userPO.getHeader3()+ "&E01PERAYO=" + userPO.getHeader4(), res);	
			}
			}
		} finally {
			if (mp != null)
				mp.close();
		}
	}
	// SCREEN = 8
	protected void procActionRegPro(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {
		UserPos userPO = null;
		EDL051902Message msg = null;
		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		try { 
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAIN_INCUMP");

			redirectToPage("/servlet/datapro.eibs.products.JSEDL0519?SCREEN=1&FromRecord=0&E01CUSCUN=" + userPO.getHeader1() + "&E01DLCMOD=" + userPO.getHeader2() + "&E01PERMES=" + userPO.getHeader3()+ "&E01PERAYO=" + userPO.getHeader4(), res);
		
		} finally {
			if (mp != null)
				mp.close();
		}
	}
	//screen 5
	//AQUI
	protected void procActionRec(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {
			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAIN_INCUMP");

			// Send data
			try {
				mp = new MessageProcessor("EDL0519");
				EDL051902Message msg = (EDL051902Message) mp.getMessageRecord("EDL051902");
				msg.setH02USERID(user.getH01USR());
				msg.setH02PROGRM("EDL0519");
				msg.setH02TIMSYS(getTimeStamp());
				msg.setH02SCRCOD("01");
				msg.setH02OPECOD("0001");
				switch (screen) {
					case 4 : // Consultar Record
						msg.setH02SCRCOD("03");
						break;
					case 5 : // Modificar Record
						msg.setH02SCRCOD("02");
						break;
					default :
						forward(SuperServlet.devPage, req, res);
						break;
				}
				//	Get key fields
				try {
					msg.setE02CUSCUN(userPO.getHeader1());
				} catch (Exception e) { 
					msg.setE02CUSCUN("");
				}
				try {
					msg.setE02PERMES(userPO.getHeader3());
				} catch (Exception e) {
					msg.setE02PERMES("");
				}
				try {
					msg.setE02PERAYO(userPO.getHeader4());
				} catch (Exception e) {
					msg.setE02PERAYO("");
				}
				try {
					userPO.setHeader5(msg.getE02DLCMOD());
				} catch (Exception e) { }
  				try {
  					msg.setE02DLCMOD(userPO.getHeader2());
  				} catch (Exception e) { 
  					msg.setE02DLCMOD("");
  				}
				try {
					msg.setE02DEAACC(req.getParameter("E01INCACC"));
				} catch (Exception e) {
					msg.setE02DEAACC("");
				}
				
				msg.setE02ACT(" ");
				msg.setH02FLGWK1(""); 
				// Send Message	
				mp.sendMessage(msg);
				ses.setAttribute("userPO", userPO);
				// Send Message 
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
					forward("EDL0519_ln_maint_incumplimiento.jsp", req, res);
				} else {
				msg = (EDL051902Message) newmessage;
				
				try {
				} catch (Exception e) { }
				
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("Main_Incum", newmessage);
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
					forwardOnSuccess("EDL0519_ln_maint_incumplimiento.jsp", req, res);
				} else {
					ses.setAttribute("Main_Incum", newmessage);
					forwardOnSuccess("EDL0519_ln_incumplimiento_proceso.jsp", req, res);
				}
				}

			} finally {
				if (mp != null) 
					mp.close();
			}
		}
	// SCREEN = 11 
	// Solicita Datos de Entrada para consulta
	//
	protected void procReqInqEnter(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
	throws ServletException, IOException {

		ELEERRMessage msgError = null;
		UserPos	userPO = null;	
		EDL051901Message msgInc = null;
			try {

				msgError = new datapro.eibs.beans.ELEERRMessage();
				userPO = new datapro.eibs.beans.UserPos();
				msgInc = new datapro.eibs.beans.EDL051901Message();
				userPO.setOption("CONSUL_INCUMP");
				userPO.setPurpose("INQUIRY");
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("incump_c", msgInc);

			} catch (Exception ex) { 
				flexLog("Error: " + ex); 
			}

			try {
				flexLog("About to call Page: " + LangPath + "EDL0519_ln_consul_incumplimiento_enter.jsp");
				forwardOnSuccess("EDL0519_ln_consul_incumplimiento_enter.jsp", req, res);
			}
			catch (Exception e) {
				flexLog("Exception calling page " + e);
			}

}
	// SCREEN = 12 
	//
	protected void procReqListConsu(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		UserPos userPO = null;
		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		try { 
			mp = new MessageProcessor("EDL0519");
			EDL051901Message msg = (EDL051901Message) mp.getMessageRecord("EDL051901");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("CONSUL_INCUMP");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDL0519");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0002");
			
			try {
				msg.setE01NUMREC(req.getParameter("FromRecord"));
			} catch (Exception e) {
				msg.setE01NUMREC("0"); 
			}
			try {
				msg.setE01CUSCUN(req.getParameter("E01CUSCUN"));
			} catch (Exception e) { 
				msg.setE01CUSCUN("");
			}
			
			try {
				userPO.setHeader1(msg.getE01CUSCUN());
			} catch (Exception e) { }
			
			// Send Message	
			mp.sendMessage(msg);
			ses.setAttribute("userPO", userPO);
			// Receive List
			
			newmessage = mp.receiveMessageRecord();
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				forward("EDL0519_ln_consul_incumplimiento_enter.jsp", req, res);
			} else {
			
			
			JBObjList list = (JBObjList) mp.receiveMessageRecordList("E01INDOPE","E01NUMREC");
			try {
				userPO.setHeader6(msg.getE01CUSTID());
			} catch (Exception e) { }
			
			try {
				userPO.setHeader7(msg.getE01CUSIDN());
			} catch (Exception e) { }
			try {
				userPO.setHeader8(msg.getE01CUSNA1());
			} catch (Exception e) { }
			try {
				userPO.setHeader9(msg.getD01CODTEL());
			} catch (Exception e) { }
			try {
				userPO.setHeader10(msg.getE01CODEMA());
			} catch (Exception e) { }
			try {
				userPO.setHeader11(msg.getD01CODEMA());
			} catch (Exception e) { }
			try {
				userPO.setHeader12(msg.getE01TELCLI());
			} catch (Exception e) { }
			try {
				userPO.setHeader13(msg.getE01MAICLI());
			} catch (Exception e) { }
			try {
			} catch (Exception e) { }
			ses.setAttribute("userPO", userPO);
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
				forwardOnSuccess("EDL0519_ln_consul_incumplimiento_enter.jsp", req, res);
			} else {
				ses.setAttribute("EDL0519List", list);
				forwardOnSuccess("EDL0519_ln_consul_maint_incumplimiento.jsp", req, res);
			}
			}
		} finally {
			if (mp != null)
				mp.close();
		}
	}

}