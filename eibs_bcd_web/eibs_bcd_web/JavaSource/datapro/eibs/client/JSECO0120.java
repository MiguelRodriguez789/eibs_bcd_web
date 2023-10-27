package datapro.eibs.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ECO012001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.MessageRecord;

/**
 * 
 * @author evargas
 *
 */
public class JSECO0120 extends JSEIBSServlet {

	protected static final int CANCELACION_SEARCH = 100;
	protected static final int CANCELACION_SHOW = 200;
	protected static final int CANCELACION_PROCESS = 500;
		

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		switch (screen) {
			case CANCELACION_SEARCH:
				procCancelation(user, req, res, session);
			break;		
			case CANCELACION_SHOW:
				procCancelationshow(user, req, res, session);
				break;	
			case CANCELACION_PROCESS:
				procCancelationProcess(user, req, res, session);
				break;					
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}		
	}
	


	protected void procCancelation(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		try {
			flexLog("About to call Page: ECO0120_cancelar_planilla_search.jsp");
			forward("ECO0120_cancelar_planilla_search.jsp", req, res);			
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}
	}
	
	protected void procCancelationshow(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {
			
			MessageProcessor mp = null;
			try {
				mp = getMessageProcessor("ECO0120", req);

				ECO012001Message msg = (ECO012001Message) mp.getMessageRecord("ECO012001");
				msg.setH01OPECOD("0002");
				msg.setH01USERID(user.getH01USR());
				if (req.getParameter("E01SELNUM")!=null && !"".equals(req.getParameter("E01SELNUM").trim())){
					msg.setE01SELNUM(req.getParameter("E01SELNUM"));
				}
				if (req.getParameter("E01SELRCY")!=null && !"".equals(req.getParameter("E01SELRCY").trim())){
					msg.setE01SELRCY(req.getParameter("E01SELRCY"));
				}
				
			 	mp.sendMessage(msg);			 	
			 	
			 	MessageRecord resp = mp.receiveMessageRecord(); //receive first messaje, errors or header.
			 	 
		        if(resp.getFormatName().equals("ELEERR")){
		        	 ses.setAttribute("error", ((ELEERRMessage)resp));
		        	 forward("ECO0120_cancelar_planilla_search.jsp", req, res);	
		        }else{
		        	ses.setAttribute("header", ((ECO012001Message)resp));	//header dds01
					forward("ECO0120_cancelar_planilla_apply.jsp", req, res);
		        	
		        }
			} finally {
				if (mp != null)	mp.close();
			}
		}
	

	protected void procCancelationProcess(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res, 
			HttpSession ses)
			throws ServletException, IOException {
			
			MessageProcessor mp = null;
			try {
				mp = getMessageProcessor("ECO0120", req);

				ECO012001Message msg = (ECO012001Message) mp.getMessageRecord("ECO012001");
				msg = (ECO012001Message) ses.getAttribute("header");
				msg.setH01OPECOD("0005");
				msg.setH01USERID(user.getH01USR());
				
			 	mp.sendMessage(msg);			 	
			 	
			 	MessageRecord resp = mp.receiveMessageRecord(); //receive first messaje, errors or header.
			 	 
		        if(resp.getFormatName().equals("ELEERR")){
		        	ses.setAttribute("error", ((ELEERRMessage)resp));
					forward("ECO0120_cancelar_planilla_apply.jsp", req, res);
		        }else{
		        	forward("ECO0120_cancelar_planilla_search.jsp", req, res);	
		        	
		        }
			} finally {
				if (mp != null)	mp.close();
			}
		}

 }