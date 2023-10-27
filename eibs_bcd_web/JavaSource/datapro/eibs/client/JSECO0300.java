package datapro.eibs.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import datapro.eibs.beans.ECO030001Message;
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
public class JSECO0300 extends JSEIBSServlet {

	protected static final int PLANILLA_REENVIO_SEARCH = 100;
	protected static final int PLANILLA_REENVIO_SHOW = 200;
	protected static final int PLANILLA_REENVIO_PROCESS = 300;
		

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		switch (screen) {
			case PLANILLA_REENVIO_SEARCH:
				procSearchPlanillaReenvio(user, req, res, session);
			break;		

			case PLANILLA_REENVIO_SHOW:
				procPlanillaReenvioShow(user, req, res, session);
				break;	
			case PLANILLA_REENVIO_PROCESS:
				procPlanillaReenvioProcess(user, req, res, session);
				break;					
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}		
	}
	

	protected void procSearchPlanillaReenvio(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		try {
			flexLog("About to call Page: ECO0300_planilla_reenvio_search.jsp");
			forward("ECO0300_planilla_reenvio_search.jsp", req, res);			
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}
	}
	
	protected void procPlanillaReenvioShow(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession session)
			throws ServletException, IOException {
			
			MessageProcessor mp = null;
			try {
				mp = getMessageProcessor("ECO0300", req);

				ECO030001Message msg = (ECO030001Message) mp.getMessageRecord("ECO030001");
				msg.setH01USERID(user.getH01USR());
				msg.setH01OPECOD("0002");
				
				msg.setE01SELCDE(req.getParameter("E01SELCDE"));
				
			 	mp.sendMessage(msg);			 	
			 	
				ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
				msg = (ECO030001Message) mp.receiveMessageRecord();
			 	 
			 	if (!msgError.getERRNUM().equals("0")){
		        	 session.setAttribute("error", ((ELEERRMessage)msgError));
		        	 forward("ECO0300_planilla_reenvio_search.jsp", req, res);	
	        }else{
		        	session.setAttribute("cnvObj", ((ECO030001Message)msg));	
					forward("ECO0300_planilla_reenvio.jsp", req, res);
		        	
		        }
			} finally {
				if (mp != null)	mp.close();
			}
		}

	protected void procPlanillaReenvioProcess(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res, 
			HttpSession session)
			throws ServletException, IOException {
			
			MessageProcessor mp = null;
			
			try {
				//define dds to send
				mp = getMessageProcessor("ECO0300", req);
				
				//Creates the message with operation code 
				ECO030001Message msg  = (ECO030001Message) mp.getMessageRecord("ECO030001");		
				msg.setH01USERID(user.getH01USR());			
				msg.setH01OPECOD("0005");
				
				super.setMessageRecord(req, msg);

			 	mp.sendMessage(msg);
			 	
			 	ELEERRMessage msgError = (ELEERRMessage)mp.receiveMessageRecord(); 			 				 
				msg = (ECO030001Message) mp.receiveMessageRecord();
			 	if (!mp.hasError(msgError)){
					flexLog("About to call Page: ECO0300_planilla_reenvio_search.jsp");
		        	 forward("ECO0300_planilla_reenvio_search.jsp", req, res);	
			 	}else{
			 		session.setAttribute("error", ((ELEERRMessage)msgError));
			 		session.setAttribute("cnvObj", msg);
					forward("ECO0300_planilla_reenvio.jsp", req, res);
			 	} 				
			} finally {
				if (mp != null)	mp.close();
			}
		}
	

 }