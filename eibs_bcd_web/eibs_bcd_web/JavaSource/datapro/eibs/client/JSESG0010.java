package datapro.eibs.client;

/**
 * Pac de Seguros
 * @author: Jose M. Buitrago
 */
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ESG001001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESG001002Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.MessageField;

public class JSESG0010 extends JSEIBSServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5013250952357918505L;
	protected static final int R_PAC_SEGUROS_LIST_NEW = 100;
	protected static final int R_PAC_SEGUROS_LIST_MAINTENANCE = 300;
	protected static final int A_PAC_SEGUROS_LIST = 101;
	protected static final int R_PAC_SEGUROS_NEW = 200;
	protected static final int R_PAC_SEGUROS_MAINT = 201;
	protected static final int R_PAC_SEGUROS_DELETE = 202;	
	protected static final int R_PAC_SEGUROS_INQUIRY = 203;
	protected static final int A_PAC_SEGUROS_MAINT = 600;
	
	/**
	 * 
	 */
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		switch (screen) {
		case R_PAC_SEGUROS_LIST_NEW:
			procReqSegurosList(user, req, res, session, "NEW");
			break;
		case R_PAC_SEGUROS_LIST_MAINTENANCE:
			procReqSegurosList(user, req, res, session, "MAINTENANCE");
			break;
		case A_PAC_SEGUROS_LIST:
			procActionSegurosList(user, req, res, session, null);
			break;
		case R_PAC_SEGUROS_NEW:
			procReqSeguros(user, req, res, session, "NEW");
			break;
		case R_PAC_SEGUROS_MAINT:
			procReqSeguros(user, req, res, session, "MAINTENANCE");
			break;
		case R_PAC_SEGUROS_INQUIRY:
			procReqSeguros(user, req, res, session, "INQUIRY");
			break;
		case A_PAC_SEGUROS_MAINT:
			procActionMaintenance(user, req, res, session);
			break;
		case R_PAC_SEGUROS_DELETE:
			procReqDelete(user, req, res, session);
			break;
		default:
			forward(SuperServlet.devPage, req, res);
			break;
		}
	}

	protected void procActionMaintenance(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;

		try {
			mp = getMessageProcessor("ESG0010", req);

			ESG001001Message msg = (ESG001001Message) mp.getMessageRecord("ESG001001", user.getH01USR(), "0005");
			
			//Sets message with page fields
			msg.setH01SCRCOD("01");
			msg.setH01FLGWK1("U");
			setMessageRecord(req, msg);

			//Sending message
			mp.sendMessage(msg);

			//Receive error and data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ESG001001Message) mp.receiveMessageRecord();

			//Sets session with required data
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("msg", msg);

			if (!mp.hasError(msgError)) {
				//if there are no errors go back to list
				redirectToPage("/servlet/datapro.eibs.client.JSESG0010?SCREEN=101&customer_number="	+ msg.getE01PACCUN() + "&loan_number=" + msg.getE01PACACC(), res);
			} else {
				//if there are errors go back to maintenance page and show errors
				session.setAttribute("cnvObj", msg);
				forward("ESG0010_PAC_seguros_maintenance.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}
	

	/**
	 * procReqSegurosList
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procReqSegurosList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses, String option )
			throws ServletException, IOException {
		UserPos userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		userPO.setPurpose(option);
		ses.setAttribute("userPO", userPO);
		try {
			flexLog("About to call Page: ESG0010_PAC_client_enter_search.jsp");
			forward("ESG0010_PAC_client_enter_search.jsp", req, res);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}
	}
	
	protected void procActionSegurosList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, String option)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		String customer_number = null;
		String loan_number = null;
		UserPos userPO = getUserPos(req);
		boolean evaluation = false;
		
		try {
			mp = getMessageProcessor("ESG0010", req);

			ESG001001Message msgList = (ESG001001Message) mp.getMessageRecord("ESG001001", user.getH01USR(), "0015");
			//Sets the employee  number from either the first page or the maintenance page
			customer_number = "";
			loan_number = "";
			
			if (req.getParameter("customer_number")!= null){
				customer_number = req.getParameter("customer_number");								
			} else {
				customer_number = req.getParameter("E01PACCUN") == null ? "" : req.getParameter("E01PACCUN").trim();
			}
			
			if (req.getParameter("loan_number")!= null){
				loan_number = req.getParameter("loan_number");								
			} else {
				loan_number = req.getParameter("E01PACACC") == null ? "" : req.getParameter("E01PACACC").trim();
			}

			if (option != null){
				evaluation = true;
				msgList.setE01PACSTS("E");
			}
			
			msgList.setE01PACCUN(customer_number);
			msgList.setE01PACACC(loan_number);
			msgList.setH01FLGWK1("U");

			//Sends message
			mp.sendMessage(msgList);
			
			ELEERRMessage error = (ELEERRMessage)mp.receiveMessageRecord();			
			if (mp.hasError(error)) { // if there are errors go back to first page
				session.setAttribute("error", error);
				flexLog("About to call Page: ESG0010_PAC_client_enter_search.jsp");
				forward("ESG0010_PAC_client_enter_search.jsp", req, res);
			} else {
				//Receive header information
				ESG001002Message header = (ESG001002Message)mp.receiveMessageRecord();
				userPO.setCusNum(header.getE02CUSCUN());
				userPO.setCusName(header.getE02CUSNA1());
				userPO.setID(header.getE02CUSIDN());

				//Receive insurance  list
				JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
				//if there are NO errors display list
				session.setAttribute("ESG001001List", list);
				forwardOnSuccess("ESG0010_PAC_seguros_list.jsp?evaluation="+evaluation, req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	/**
	 * procReqSeguros: This Method show a single Pac Seguros either for 
	 * 					a new register, a maintenance or an inquiry. 
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procReqSeguros(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, String option) throws ServletException,
			IOException {

		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);
		try {
			mp = getMessageProcessor("ESG0010", req);
			userPO.setPurpose(option);

			ESG001001Message msg = null;
			
			//Creates the message with operation code depending on the option
			if (option.equals("NEW")) {
				//New
				msg = (ESG001001Message) mp.getMessageRecord("ESG001001", user.getH01USR(), "0001");
			} else if (option.equals("MAINTENANCE")) {
				//Maintenance
				msg = (ESG001001Message) mp.getMessageRecord("ESG001001", user.getH01USR(), "0002");
			} else {
				//Inquiry
				msg = (ESG001001Message) mp.getMessageRecord("ESG001001", user.getH01USR(), "0004");
			}
			
			//Sets the Customer number
			if (option.equals("NEW")) {
				msg.setE01PACCUN(req.getParameter("customer_number"));
			} else {
				msg.setE01PACCUN(userPO.getCusNum());
			}
			
			//Sets the Customer number
			if (option.equals("NEW")) {
				msg.setE01PACACC(req.getParameter("loan_number"));
			} else {
				msg.setE01PACACC(userPO.getAccNum());
			}

			//Sets the insurance number for maintenance and inquiry options
			if (req.getParameter("E01PACNUM") != null) {
				msg.setE01PACNUM(req.getParameter("E01PACNUM"));
			}
			msg.setH01FLGWK1("U");

			//Send message
			mp.sendMessage(msg);

			//Receive error and data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ESG001001Message) mp.receiveMessageRecord();
			
			if (userPO.getCusName() == null || userPO.getCusName().equals("")){
				userPO.setCusName(msg.getE01CUSNA1());
				userPO.setID(msg.getE01CUSIDN());
			}

			if (option.equals("NEW")) 
			{
				userPO.setPurpose("NEW");
			} 
			else if (option.equals("MAINTENANCE")) 
			{
				userPO.setPurpose("MAINTENANCE");
			} 
			else if (option.equals("INQUIRY")) 
			{
				userPO.setPurpose("INQUIRY");			
			}
			session.setAttribute("cnvObj", msg);
			session.setAttribute("userPO", userPO);
			if (!mp.hasError(msgError)) {
				//if there are no errors go to maintenance page
				flexLog("About to call Page: ESG0010_PAC_seguros_maintenance.jsp");
				if (option.equals("INQUIRY")) {
					// if the request is an inquiry sets the readOlnly attribute 'true'
					forward("ESG0010_PAC_seguros_maintenance.jsp?readOnly=true", req, res);
				} else {
					forward("ESG0010_PAC_seguros_maintenance.jsp", req, res);
				}
			} else {
				//if there are errors go back to list page
				session.setAttribute("error", msgError);
				forward("ESG0010_PAC_seguros_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	/**
	 * procReqDelete
	 * 
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procReqDelete(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		userPO.setPurpose("MAINTENANCE");

		MessageProcessor mp = null;

		try {
			mp = getMessageProcessor("ESG0010", req);
			
			//Creates message with the 'Delete'operation code
			ESG001001Message msg = (ESG001001Message) mp.getMessageRecord("ESG001001", user.getH01USR(), "0009");
			
			//Sets required values
			msg.setH01SCRCOD("01");
			msg.setE01PACCUN(userPO.getCusNum());
			msg.setE01PACNUM(req.getParameter("E01PACNUM"));
			msg.setH01FLGWK1("U");
			
			//Send message
			mp.sendMessage(msg);

			//Receive Error and Data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ESG001001Message) mp.receiveMessageRecord();

			if (!mp.hasError(msgError)) {
				//If there are no errors request the list again
				redirectToPage("/servlet/datapro.eibs.client.JSESG0010?SCREEN=101&customer_number="	+ msg.getE01PACCUN() + "&loan_number=" + msg.getE01PACACC(), res);
			} else {
				//if there are errors show the list without updating
				session.setAttribute("error", msgError);
				forward("ESG0010_PAC_seguros_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

}
