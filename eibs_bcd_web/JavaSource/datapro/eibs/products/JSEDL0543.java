package datapro.eibs.products;
/** 
 * Provision-Consulta Calificaciones Adicionales. 
 * Creation date: (23/Ene/18)
 * @author: Rommel Gonzalez
 */
import datapro.eibs.beans.*;
import datapro.eibs.master.*;
import datapro.eibs.sockets.*;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class JSEDL0543 extends JSEIBSServlet { 
	protected String LangPath = "S";
	/**
	 *  Menu 
	 */
	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, 
			HttpSession session, int screen)
		throws ServletException, IOException {
		switch (screen) {
			// Requests List 
			
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
	// SCREEN = 11 
	// Solicita Datos de Entrada para consulta
	//
	protected void procReqInqEnter(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
	throws ServletException, IOException {

		ELEERRMessage msgError = null;
		UserPos	userPO = null;	
		EDL054301Message msgInc = null;
			try {

				msgError = new datapro.eibs.beans.ELEERRMessage();
				userPO = new datapro.eibs.beans.UserPos();
				msgInc = new datapro.eibs.beans.EDL054301Message();
				userPO.setOption("CONSUL_INCUMP");
				userPO.setPurpose("INQUIRY");
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("califica", msgInc);

			} catch (Exception ex) { 
				flexLog("Error: " + ex); 
			}

			try {
				flexLog("About to call Page: " + LangPath + "EDL0543_ln_consul_his_calificaciones_enter.jsp");
				forwardOnSuccess("EDL0543_ln_consul_his_calificaciones_enter.jsp", req, res);
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
			mp = new MessageProcessor("EDL0543");
			EDL054301Message msg = (EDL054301Message) mp.getMessageRecord("EDL054301");
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("CONSUL_CALIFICA");
			// Send Initial data
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDL0543");
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
				forward("EDL0543_ln_consul_his_calificaciones_enter.jsp", req, res);
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
			} catch (Exception e) { }
			ses.setAttribute("userPO", userPO);
			if (mp.hasError(list)) {
				ses.setAttribute("error", mp.getError(list));
				forwardOnSuccess("EDL0543_ln_consul_his_calificaciones_enter.jsp", req, res);
			} else {
				ses.setAttribute("EDL0543List", list);
				forwardOnSuccess("EDL0543_ln_consul_maint_his_calificaciones.jsp", req, res);
			}
			}
		} finally {
			if (mp != null)
				mp.close();
		}
	}

}