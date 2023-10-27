package datapro.eibs.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import datapro.eibs.beans.ECO001003Message;
import datapro.eibs.beans.ECO025001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;

/**
 * 
 * @author evargas
 *
 */
public class JSECO0250 extends JSEIBSServlet {

	protected static final int COVENANT_PAY_SEARCH = 100;
	protected static final int COVENANT_PAY_SHOW = 200;
	protected static final int COVENANT_PAY_PROCESS = 300;
		

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		switch (screen) {
			case COVENANT_PAY_SEARCH:
				procSearchCovenantPayCommission(user, req, res, session);
			break;		

			case COVENANT_PAY_SHOW:
				procCovenantPayshowCommission(user, req, res, session);
				break;	
			case COVENANT_PAY_PROCESS:
				procCovenantCommissionProcess(user, req, res, session);
				break;					
			default :
				forward(SuperServlet.devPage, req, res);
				break;
		}		
	}
	

	protected void procSearchCovenantPayCommission(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		try {
			flexLog("About to call Page: ECO0250_covenant_pay_search.jsp");
			forward("ECO0250_covenant_pay_commission_search.jsp", req, res);			
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}
	}
	
	protected void procCovenantPayshowCommission(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession session)
			throws ServletException, IOException {
			
			MessageProcessor mp = null;
			try {
				mp = getMessageProcessor("ECO0250", req);

				ECO025001Message msg = (ECO025001Message) mp.getMessageRecord("ECO025001");
				msg.setH01USERID(user.getH01USR());
				msg.setH01OPECOD("0002");
				
				msg.setE01SELNUM(req.getParameter("E01SELNUM"));
				msg.setE01SELRCY(req.getParameter("E01SELRCY"));
				
			 	mp.sendMessage(msg);			 	
			 	
				ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
				msg = (ECO025001Message) mp.receiveMessageRecord();
			 	 
			 	if (!msgError.getERRNUM().equals("0")){
		        	 session.setAttribute("error", ((ELEERRMessage)msgError));
		        	 forward("ECO0250_covenant_pay_commission_search.jsp", req, res);	
	        }else{
		        	session.setAttribute("cnvObj", ((ECO025001Message)msg));	
					forward("ECO0250_covenant_pay_commission.jsp", req, res);
		        	
		        }
			} finally {
				if (mp != null)	mp.close();
			}
		}

	protected void procCovenantCommissionProcess(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res, 
			HttpSession session)
			throws ServletException, IOException {
			
			MessageProcessor mp = null;
			
			try {
				//define dds to send
				mp = getMessageProcessor("ECO0250", req);
				
				//Creates the message with operation code 
				ECO025001Message msg  = (ECO025001Message) mp.getMessageRecord("ECO025001");		
				msg.setH01USERID(user.getH01USR());			
				msg.setH01OPECOD("0005");
				
				super.setMessageRecord(req, msg);

			 	mp.sendMessage(msg);
			 	
			 	ELEERRMessage msgError = (ELEERRMessage)mp.receiveMessageRecord(); 			 				 
				msg = (ECO025001Message) mp.receiveMessageRecord();
			 	if (!mp.hasError(msgError)){
					flexLog("About to call Page: ECO0250_covenant_pay_commission_search.jsp");
		        	 forward("ECO0250_covenant_pay_commission_search.jsp", req, res);	
			 	}else{
			 		session.setAttribute("error", ((ELEERRMessage)msgError));
			 		session.setAttribute("cnvObj", msg);
					forward("ECO0250_covenant_pay_commission.jsp", req, res);
			 	} 				
			} finally {
				if (mp != null)	mp.close();
			}
		}
	

 }