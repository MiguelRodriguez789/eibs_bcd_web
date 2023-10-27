package datapro.eibs.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import datapro.eibs.beans.ECO031001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;

/**
 * 
 * @author Jose M. Buitrago
 *
 */
public class JSECO0310 extends JSEIBSServlet {

	protected static final int GENERACION_ANTICIPADA_SEARCH = 100;
	protected static final int GENERACION_ANTICIPADA_SHOW = 200;
	protected static final int GENERACION_ANTICIPADA_PROCESS = 300;
		

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		switch (screen) {
			case GENERACION_ANTICIPADA_SEARCH:
				procSearchGeneracionAnticipadaPlanillas(user, req, res, session);
			break;		

			case GENERACION_ANTICIPADA_SHOW:
				procGeneracionAnticipadaPlanillasShow(user, req, res, session);
				break;	
			case GENERACION_ANTICIPADA_PROCESS:
				procGeneracionAnticipadaPlanillasProcess(user, req, res, session);
				break;					
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}		
	}
	

	protected void procSearchGeneracionAnticipadaPlanillas(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		try {
			flexLog("About to call Page: ECO0310_generacion_anticipada_planilla_search.jsp");
			forward("ECO0310_generacion_anticipada_planilla_search.jsp", req, res);			
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}
	}
	
	protected void procGeneracionAnticipadaPlanillasShow(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession session)
			throws ServletException, IOException {
			
			MessageProcessor mp = null;
			try {
				mp = getMessageProcessor("ECO0310", req);

				ECO031001Message msg = (ECO031001Message) mp.getMessageRecord("ECO031001");
				msg.setH01USERID(user.getH01USR());
				msg.setH01OPECOD("0002");
				
				msg.setE01SELCDE(req.getParameter("E01SELCDE"));
				
			 	mp.sendMessage(msg);			 	
			 	
				ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
				msg = (ECO031001Message) mp.receiveMessageRecord();
			 	 
			 	if (!msgError.getERRNUM().equals("0")){
		        	 session.setAttribute("error", ((ELEERRMessage)msgError));
		        	 forward("ECO0310_generacion_anticipada_planilla_search.jsp", req, res);	
	        }else{
		        	session.setAttribute("cnvObj", ((ECO031001Message)msg));	
					forward("ECO0310_generacion_anticipada_planilla.jsp", req, res);
		        	
		        }
			} finally {
				if (mp != null)	mp.close();
			}
		}

	protected void procGeneracionAnticipadaPlanillasProcess(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res, 
			HttpSession session)
			throws ServletException, IOException {
			
			MessageProcessor mp = null;
			
			try {
				//define dds to send
				mp = getMessageProcessor("ECO0310", req);
				
				//Creates the message with operation code 
				ECO031001Message msg  = (ECO031001Message) mp.getMessageRecord("ECO031001");		
				msg.setH01USERID(user.getH01USR());			
				msg.setH01OPECOD("0005");
				
				super.setMessageRecord(req, msg);

			 	mp.sendMessage(msg);
			 	
			 	ELEERRMessage msgError = (ELEERRMessage)mp.receiveMessageRecord(); 			 				 
				msg = (ECO031001Message) mp.receiveMessageRecord();
			 	if (!mp.hasError(msgError)){
					flexLog("About to call Page: ECO0310_generacion_anticipada_planilla_search.jsp");
		        	 forward("ECO0310_generacion_anticipada_planilla_search.jsp", req, res);	
			 	}else{
			 		session.setAttribute("error", ((ELEERRMessage)msgError));
			 		session.setAttribute("cnvObj", msg);
					forward("ECO0310_generacion_anticipada_planilla.jsp", req, res);
			 	} 				
			} finally {
				if (mp != null)	mp.close();
			}
		}
	

 }