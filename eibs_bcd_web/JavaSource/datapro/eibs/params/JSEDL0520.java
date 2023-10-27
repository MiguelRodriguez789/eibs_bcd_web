package datapro.eibs.params;

import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class JSEDL0520 extends JSEIBSServlet
{
    protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
		HttpSession session, int screen) throws ServletException, IOException 
    {
	switch (screen) 
	{
		// Requests List 
		case 1 : // simulacion completa
			procActionRec(user, req, res, session, screen);
			break;
		case 2 : // confirmacion simulacion completa
			procActionMaint(user, req, res, session);
			break;
		case 3 : // simulacion por producto
			procActionRecPro(user, req, res, session, screen);
			break;
		case 4 : // Request approve list
			procReqList(user, req, res, session);
			break;						
		case 5 : // Request approve list
			procActionAct(user, req, res, session, screen);
			break;
		case 6 : // regresa a pantalla anterior
			procActionRegPro(user, req, res, session);
			break;
		case 7 : // recive data para actualizar
			procActionRecDat(user, req, res, session, screen);
			break;			
		case 8 : // Envia simulacion
			procActionSimul(user, req, res, session);
			break;
		//para chequear el proceso simulado
		case 9 : // simulacion por producto
			procActionRecSim(user, req, res, session, screen);
			break;
		case 10 : // Envia Informacion para ser consultada
			procActionRegSim(user, req, res, session);
			break;
		case 11 : // Consulta simulacion
			procActionActConsu(user, req, res, session, screen);
			break;			
		case 12 : // Envia simulacion
			procActionSimulAprob(user, req, res, session);
			break;			
		case 13 : // Rechaza simulacion
			procActionSimulRechazo(user, req, res, session);
			break;						
		case 14 : // Consulta estadistica de la simulacion
			procActionActConsuStatistics(user, req, res, session, screen);
			break;				
		case 15 : // Eliminar Registro del Proceso
			procActionActDel(user, req, res, session, screen);
			break;				
		default :
			forward(SuperServlet.devPage, req, res);
			break;
	}
    }
    
    protected void procActionRec(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
    		HttpSession ses, int screen) throws ServletException, IOException 
        {
    	UserPos userPO = null;
		//UserPos userPO = (UserPos) ses.getAttribute("userPO");
    	userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		String PageToCall = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0520", req);
			EDL052001Message msg = (EDL052001Message) mp.getMessageRecord("EDL052001", user.getH01USR(), "0001");
			setMessageRecord(req, msg);
			msg.setH01SCRCOD("01");
			
			mp.sendMessage(msg);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EDL052001Message) mp.receiveMessageRecord();
			
			//userPO.setIdentifier(msg.getE01PRINUM());
			//userPO.setPurpose("MAINTENANCE");

			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("msg", msg);
			ses.setAttribute("userPO", userPO);
			
			if (mp.hasError(msgError)) {
				PageToCall = "EDL0520_cal_prov.jsp";
			} else {
				PageToCall = "EDL0520_cal_prov.jsp";
			}
			forward(PageToCall, req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}

				
   		
        }
    protected void procActionRecPro(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
    		HttpSession ses, int screen) throws ServletException, IOException 
        {
    	UserPos userPO = null;
		//UserPos userPO = (UserPos) ses.getAttribute("userPO");
    	userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		String PageToCall = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0520", req);
			EDL052001Message msg = (EDL052001Message) mp.getMessageRecord("EDL052001", user.getH01USR(), "0001");
			setMessageRecord(req, msg);
			msg.setH01SCRCOD("03");
			
			mp.sendMessage(msg);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EDL052001Message) mp.receiveMessageRecord();
			
			//userPO.setIdentifier(msg.getE01PRINUM());
			//userPO.setPurpose("MAINTENANCE");

			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("msg", msg);
			ses.setAttribute("userPO", userPO);
			
			if (mp.hasError(msgError)) {
				PageToCall = "EDL0520_cal_prov_producto.jsp";
			} else {
				PageToCall = "EDL0520_cal_prov_producto.jsp";
			}
			forward(PageToCall, req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}

				
   		
        }    
    protected void procActionRecSim(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
    		HttpSession ses, int screen) throws ServletException, IOException 
        {
    	UserPos userPO = null;
		//UserPos userPO = (UserPos) ses.getAttribute("userPO");
    	userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		String PageToCall = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0520", req);
			EDL052001Message msg = (EDL052001Message) mp.getMessageRecord("EDL052001", user.getH01USR(), "0001");
			setMessageRecord(req, msg);
			msg.setH01SCRCOD("09");
			
			mp.sendMessage(msg);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EDL052001Message) mp.receiveMessageRecord();
			
			//userPO.setIdentifier(msg.getE01PRINUM());
			//userPO.setPurpose("MAINTENANCE");

			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("msg", msg);
			ses.setAttribute("userPO", userPO);
			
			if (mp.hasError(msgError)) {
				PageToCall = "EDL0520_cal_prov_producto.jsp";
			} else {
				PageToCall = "EDL0520_cal_prov_producto.jsp";
			}
			forward(PageToCall, req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}

				
   		
        }      
    protected void procActionMaint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
    		HttpSession ses) throws ServletException, IOException 
        {
		UserPos userPO = (UserPos) ses.getAttribute("userPO");
		
		String PageToCall = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0520", req);
			EDL052001Message msg = (EDL052001Message) mp.getMessageRecord("EDL052001", user.getH01USR(), "0001");
			setMessageRecord(req, msg);
			msg.setH01SCRCOD("02");
			
			mp.sendMessage(msg);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EDL052001Message) mp.receiveMessageRecord();
			
			//userPO.setIdentifier(msg.getE01PRINUM());
			userPO.setPurpose("MAINTENANCE");

			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("msg", msg);
			ses.setAttribute("userPO", userPO);
			
			if (mp.hasError(msgError)) {
				PageToCall = "EDL0520_cal_prov_confirm.jsp";
			} else {
				PageToCall = "EDL0520_cal_prov_confirm.jsp";
			}
			forward(PageToCall, req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}
        }
    protected void procActionSimul(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
    		HttpSession ses) throws ServletException, IOException 
        {
		UserPos userPO = (UserPos) ses.getAttribute("userPO");
		
		String PageToCall = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0520", req);
			EDL052002Message msg = (EDL052002Message) mp.getMessageRecord("EDL052002", user.getH01USR(), "0001");
			setMessageRecord(req, msg);
			msg.setH02SCRCOD("08");
			
			mp.sendMessage(msg);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EDL052002Message) mp.receiveMessageRecord();
			
			//userPO.setIdentifier(msg.getE01PRINUM());
			userPO.setPurpose("MAINTENANCE");

			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("msg", msg);
			ses.setAttribute("userPO", userPO);
			
			if (mp.hasError(msgError)) {
				PageToCall = "EDL0520_cal_prov_confirm.jsp";
			} else {
				PageToCall = "EDL0520_cal_prov_confirm.jsp";
			}
			forward(PageToCall, req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}
        }    
    protected void procActionSimulAprob(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
    		HttpSession ses) throws ServletException, IOException 
        {
		UserPos userPO = (UserPos) ses.getAttribute("userPO");
		
		String PageToCall = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0520", req);
			EDL052002Message msg = (EDL052002Message) mp.getMessageRecord("EDL052002", user.getH01USR(), "0001");
			setMessageRecord(req, msg);
			msg.setH02SCRCOD("12");
			
			mp.sendMessage(msg);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EDL052002Message) mp.receiveMessageRecord();
			
			//userPO.setIdentifier(msg.getE01PRINUM());
			userPO.setPurpose("MAINTENANCE");

			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("msg", msg);
			ses.setAttribute("userPO", userPO);
			
			if (mp.hasError(msgError)) {
				PageToCall = "EDL0520_cal_prov_confirm_aprob.jsp";
			} else {
				PageToCall = "EDL0520_cal_prov_confirm_aprob.jsp";
			}
			forward(PageToCall, req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}
        }        
    protected void procActionSimulRechazo(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
    		HttpSession ses) throws ServletException, IOException 
        {
		UserPos userPO = (UserPos) ses.getAttribute("userPO");
		
		String PageToCall = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0520", req);
			EDL052002Message msg = (EDL052002Message) mp.getMessageRecord("EDL052002", user.getH01USR(), "0001");
			setMessageRecord(req, msg);
			msg.setH02SCRCOD("13");
			
			mp.sendMessage(msg);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (EDL052002Message) mp.receiveMessageRecord();
			
			//userPO.setIdentifier(msg.getE01PRINUM());
			userPO.setPurpose("MAINTENANCE");

			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("msg", msg);
			ses.setAttribute("userPO", userPO);
			
			if (mp.hasError(msgError)) {
				PageToCall = "EDL0520_cal_prov_confirm_rechazo.jsp";
			} else {
				PageToCall = "EDL0520_cal_prov_confirm_rechazo.jsp";
			}
			forward(PageToCall, req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}
        }      
	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

			UserPos userPO = null;
			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			try { 
				mp = new MessageProcessor("EDL0520");
				EDL052002Message msg = (EDL052002Message) mp.getMessageRecord("EDL052002");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				userPO.setPurpose("SIMULA");
				// Send Initial data
				msg.setH02USERID(user.getH01USR());
				msg.setH02PROGRM("EDL0520");
				msg.setH02TIMSYS(getTimeStamp());
				msg.setH02SCRCOD("04");
				msg.setH02OPECOD("0001");
				
				try {
					msg.setE02NUMREC(req.getParameter("FromRecord"));
				} catch (Exception e) {
					msg.setE02NUMREC("0"); 
				}
				try {
					msg.setE02CYPPRO(req.getParameter("E01CYPPRO"));
				} catch (Exception e) {
					msg.setE02CYPPRO(" "); 
				}
				try {
					msg.setE02CYPCUN(req.getParameter("E01CYPCUN"));
				} catch (Exception e) {
					msg.setE02CYPCUN("0"); 
				}
				try {
					msg.setE02CYPCAL(req.getParameter("E01CYPCAL"));
				} catch (Exception e) {
					userPO.setHeader3("0"); 
				}
				try {
					userPO.setHeader1(req.getParameter("E01CYPPRO"));
				} catch (Exception e) {
					userPO.setHeader1(""); 
				}
				try {
					userPO.setHeader2(req.getParameter("E01CYPCUN"));
				} catch (Exception e) {
					userPO.setHeader2("0"); 
				}
				try {
					userPO.setHeader3(req.getParameter("E01CYPCAL"));
				} catch (Exception e) {
					userPO.setHeader3("0"); 
				}
				// Send Message	
				mp.sendMessage(msg);
				ses.setAttribute("userPO", userPO);
				// Receive List
				
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
					forward("EDL0520_cal_prov_producto.jsp", req, res);
				} else {
				
				
				JBObjList list = (JBObjList) mp.receiveMessageRecordList("E02INDOPE","E02NUMREC");
				ses.setAttribute("userPO", userPO);
				if (mp.hasError(list)) {
					ses.setAttribute("error", mp.getError(list));
					forwardOnSuccess("EDL0520_cal_prov_producto.jsp", req, res);
				} else {
					ses.setAttribute("EDL0520List", list);
					forwardOnSuccess("EDL0520_simulacion_list_prestamos.jsp", req, res);
				}
				}
			} finally {
				if (mp != null)
					mp.close();
			}
		}
	protected void procActionAct(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {
			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("SIMULA");

			// Send data
			try {
				mp = new MessageProcessor("EDL0520");
				EDL052002Message msg = (EDL052002Message) mp.getMessageRecord("EDL052002");
				msg.setH02USERID(user.getH01USR());
				msg.setH02PROGRM("EDL0520");
				msg.setH02TIMSYS(getTimeStamp());
				msg.setH02SCRCOD("05");
				msg.setH02OPECOD("0001");
				//	Get key fields
				try {
					msg.setE02CYPCUN(userPO.getHeader2());
				} catch (Exception e) { 
					msg.setE02CYPCUN("0");
				}
				try {
					msg.setE02CYPPRO(userPO.getHeader1());
				} catch (Exception e) { 
					msg.setE02CYPPRO(" ");
				}
				try {
					msg.setE02DEAACC(req.getParameter("E02DEAACC"));
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
					forward("EDL0520_simulacion_list_prestamos.jsp", req, res);
				} else {
				msg = (EDL052002Message) newmessage;
				
				try {
				} catch (Exception e) { }
				
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("SIMULA", newmessage);
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
					forwardOnSuccess("EDL0520_simulacion_list_prestamos.jsp", req, res);
				} else {
					ses.setAttribute("Main_Incum", newmessage);
					forwardOnSuccess("EDL0520_ln_calificacion_proceso.jsp", req, res);
				}
				}

			} finally {
				if (mp != null) 
					mp.close();
			}
		}    
	// SCREEN = 8

	protected void procActionRegPro(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

			UserPos userPO = null;
			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			try { 
				mp = new MessageProcessor("EDL0520");
				EDL052002Message msg = (EDL052002Message) mp.getMessageRecord("EDL052002");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				userPO.setPurpose("SIMULA");
				// Send Initial data
				msg.setH02USERID(user.getH01USR());
				msg.setH02PROGRM("EDL0520");
				msg.setH02TIMSYS(getTimeStamp());
				msg.setH02SCRCOD("06");
				msg.setH02OPECOD("0001");
				
				// Send Message	
				mp.sendMessage(msg);
				ses.setAttribute("userPO", userPO);
				// Receive List
				
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
					forward("EDL0520_ln_calificacion_proceso.jsp", req, res);
				} else {
				
				
				JBObjList list = (JBObjList) mp.receiveMessageRecordList("E02INDOPE","E02NUMREC");
				ses.setAttribute("userPO", userPO);
				if (mp.hasError(list)) {
					ses.setAttribute("error", mp.getError(list));
					forwardOnSuccess("EDL0520_ln_calificacion_proceso.jsp", req, res);
				} else {
					ses.setAttribute("EDL0520List", list);
					forwardOnSuccess("EDL0520_simulacion_list_prestamos.jsp", req, res);
				}
				}
			} finally {
				if (mp != null)
					mp.close();
			}
		}
	protected void procActionRegSim(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

			UserPos userPO = null;
			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			try { 
				mp = new MessageProcessor("EDL0520");
				EDL052002Message msg = (EDL052002Message) mp.getMessageRecord("EDL052002");
				userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
				userPO.setPurpose("CONSUL_SIMULA");
				// Send Initial data
				msg.setH02USERID(user.getH01USR());
				msg.setH02PROGRM("EDL0520");
				msg.setH02TIMSYS(getTimeStamp());
				msg.setH02SCRCOD("10");
				msg.setH02OPECOD("0001");
				
				// Send Message	
				mp.sendMessage(msg);
				ses.setAttribute("userPO", userPO);
				// Receive List
				
				newmessage = mp.receiveMessageRecord();
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
					forward("EDL0520_cal_prov_producto.jsp.jsp", req, res);
				} else {
				
				
				JBObjList list = (JBObjList) mp.receiveMessageRecordList("E02INDOPE","E02NUMREC");
				ses.setAttribute("userPO", userPO);
				if (mp.hasError(list)) {
					ses.setAttribute("error", mp.getError(list));
					forwardOnSuccess("EDL0520_cal_prov_producto.jsp.jsp", req, res);
				} else {
					ses.setAttribute("EDL0520List", list);
					forwardOnSuccess("EDL0520_simulacion_list_prestamos_inq.jsp", req, res);
				}
				}
			} finally {
				if (mp != null)
					mp.close();
			}
		}	
	protected void procActionRecDat(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {
		UserPos userPO = null;

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		try { 
			mp = new MessageProcessor("EDL0520");
			EDL052002Message msg = (EDL052002Message) mp.getMessageRecord("EDL052002");
			userPO.setPurpose("SIMULA");
			// Send Initial data
			msg.setH02USERID(user.getH01USR());
			msg.setH02PROGRM("EDL0520");
			msg.setH02TIMSYS(getTimeStamp());
			msg.setH02SCRCOD("07");
			msg.setH02OPECOD("0001");
			
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
				forward("EDL0520_ln_calificacion_proceso.jsp", req, res);
			} else {
			msg = (EDL052002Message) newmessage;
			
			try {
			} catch (Exception e) { }
			
			ses.setAttribute("userPO", userPO);
			ses.setAttribute("SIMULA", newmessage);
			if (mp.hasError(newmessage)) {
				ses.setAttribute("error", newmessage);
				forwardOnSuccess("EDL0520_ln_calificacion_proceso.jsp", req, res);
			} else {
				redirectToPage("/servlet/datapro.eibs.params.JSEDL0520?SCREEN=6", res);	
			}
			}
		} finally {
			if (mp != null)
				mp.close();
		}
	}
	protected void procActionActConsu(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {
			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("SIMULA");

			// Send data
			try {
				mp = new MessageProcessor("EDL0520");
				EDL052002Message msg = (EDL052002Message) mp.getMessageRecord("EDL052002");
				msg.setH02USERID(user.getH01USR());
				msg.setH02PROGRM("EDL0520");
				msg.setH02TIMSYS(getTimeStamp());
				msg.setH02SCRCOD("11");
				msg.setH02OPECOD("0001");
				//	Get key fields
				try {
					msg.setE02DEAACC(req.getParameter("E02DEAACC"));
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
					forward("EDL0520_simulacion_list_prestamos_inq.jsp", req, res);
				} else {
				msg = (EDL052002Message) newmessage;
				
				try {
				} catch (Exception e) { }
				
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("SIMULA", newmessage);
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
					forwardOnSuccess("EDL0520_simulacion_list_prestamos_inq.jsp", req, res);
				} else {
					ses.setAttribute("Main_Incum", newmessage);
					forwardOnSuccess("EDL0520_ln_calificacion_proceso_consul.jsp", req, res);
				}
				}

			} finally {
				if (mp != null) 
					mp.close();
			}
		}
	//aqui
	protected void procActionActDel(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {
			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("SIMULA");

			// Send data
			try {
				mp = new MessageProcessor("EDL0520");
				EDL052002Message msg = (EDL052002Message) mp.getMessageRecord("EDL052002");
				msg.setH02USERID(user.getH01USR());
				msg.setH02PROGRM("EDL0520");
				msg.setH02TIMSYS(getTimeStamp());
				msg.setH02SCRCOD("15");
				msg.setH02OPECOD("0001");
				//	Get key fields
				try {
					msg.setE02DEAACC(req.getParameter("E02DEAACC"));
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
					forward("EDL0520_simulacion_list_prestamos_inq.jsp", req, res);
				} else {
				msg = (EDL052002Message) newmessage;
				
				try {
				} catch (Exception e) { }
				
				//
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("SIMULA", newmessage);
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
					forwardOnSuccess("EDL0520_simulacion_list_prestamos_inq.jsp", req, res);
				} else {
					redirectToPage("/servlet/datapro.eibs.params.JSEDL0520?SCREEN=10", res);	
				}
				//
				}

			} finally {
				if (mp != null) 
					mp.close();
			}
		}	
	protected void procActionActConsuStatistics(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res,
			HttpSession ses, int screen)
			throws ServletException, IOException {
			MessageProcessor mp = null;
			MessageRecord newmessage = null;
			UserPos userPO = null;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("SIMULA");

			// Send data
			try {
				mp = new MessageProcessor("EDL0520");
				EDL052002Message msg = (EDL052002Message) mp.getMessageRecord("EDL052002");
				msg.setH02USERID(user.getH01USR());
				msg.setH02PROGRM("EDL0520");
				msg.setH02TIMSYS(getTimeStamp());
				msg.setH02SCRCOD("14");
				msg.setH02OPECOD("0001");
				//	Get key fields
				try {
					msg.setE02DEAACC(req.getParameter("E02DEAACC"));
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
					forward("EDL0520_simulacion_list_prestamos_inq.jsp", req, res);
				} else {
				msg = (EDL052002Message) newmessage;
				
				try {
				} catch (Exception e) { }
				
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("SIMULA", newmessage);
				if (mp.hasError(newmessage)) {
					ses.setAttribute("error", newmessage);
					forwardOnSuccess("EDL0520_simulacion_list_prestamos_inq.jsp", req, res);
				} else {
					ses.setAttribute("Main_Incum", newmessage);
					forwardOnSuccess("EDL0520_ln_calificacion_proceso_consul_estadis.jsp", req, res);
				}
				}

			} finally {
				if (mp != null) 
					mp.close();
			}
		}    	
}
