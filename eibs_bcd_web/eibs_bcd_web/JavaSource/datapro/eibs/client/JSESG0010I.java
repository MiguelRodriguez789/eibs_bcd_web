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

import com.datapro.generic.tool.Util;

import datapro.eibs.beans.ESG001001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESG001002Message;
import datapro.eibs.beans.ESG010001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.MessageContext;
import datapro.eibs.sockets.MessageRecord;

public class JSESG0010I extends JSEIBSServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5013250952357918505L;
	protected static final int R_PAC_SEGUROS_LIST = 100;
	protected static final int A_PAC_SEGUROS_LIST = 101;
	protected static final int A_PAC_SEGUROS_LIST_FROM_LOANS = 102;
	
	protected static final int R_PAC_SEGUROS_INQUIRY = 203;
	protected static final int R_PAC_SEGUROS_POSITION = 205;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		switch (screen) {
		case R_PAC_SEGUROS_LIST:
			procReqSegurosList(user, req, res, session);
			break;
		case A_PAC_SEGUROS_LIST_FROM_LOANS:
		case A_PAC_SEGUROS_LIST:
			procActionSegurosList(user, req, res, session, null, screen);
			break;
		case R_PAC_SEGUROS_INQUIRY:
			procReqSeguros(user, req, res, session, "INQUIRY");
			break;
		case R_PAC_SEGUROS_POSITION:
			procReqSegurosPosition(user, req, res, session, "INQUIRY");
			break;
			
		default:
			forward(SuperServlet.devPage, req, res);
			break;
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
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		try {
			flexLog("About to call Page: ESG0010_PAC_Inq_client_enter_search.jsp");
			forward("ESG0010_PAC_Inq_client_enter_search.jsp", req, res);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}
	}
	

	/**
	 * procActionSegurosList	  
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procActionSegurosList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session, String option, int screen)
			throws ServletException, IOException {

		MessageProcessor mp = null;
		String customer_number = null;
		String loan_number = "0";
		
		UserPos userPO = getUserPos(req); 
		boolean evaluation = false;
		boolean inquiryLoan = screen == A_PAC_SEGUROS_LIST_FROM_LOANS;
		
		try {
			mp = getMessageProcessor("ESG0010", req);

			ESG001001Message msgList = (ESG001001Message) mp.getMessageRecord("ESG001001", user.getH01USR(), "0015");
			//Sets the employee  number from either the first page or the maintenance page
			customer_number = "";
			
			if(!inquiryLoan){
				if (req.getParameter("customer_number")!= null){
					customer_number = req.getParameter("customer_number");								
				} else {
					customer_number = req.getParameter("E01PACCUN");
				}
				
				if (option != null){
					evaluation = true;
					msgList.setE01PACSTS("E");
				}
			
			} else {
				customer_number = userPO.getCusNum();
				loan_number = userPO.getAccNum();
			}
			
			msgList.setE01PACCUN(customer_number);
//			msgList.setE01PACACC(loan_number);
			msgList.setH01FLGWK1("I");
			
			//Sends message
			mp.sendMessage(msgList);
			
			ELEERRMessage error = (ELEERRMessage)mp.receiveMessageRecord();			
			if (mp.hasError(error)) { // if there are errors go back to first page
				session.setAttribute("error", error);
				flexLog("About to call Page: ESG0010_PAC_Inq_client_enter_search.jsp");
				forward("ESG0010_PAC_Inq_client_enter_search.jsp", req, res);
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
				
				String flag = header.getH02FLGWK3();
				
				req.setAttribute("flag",flag);
				
				forwardOnSuccess("ESG0010_PAC_Inq_seguros_list.jsp?evaluation="+evaluation, req, res);
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

			JBObjList list = (JBObjList)session.getAttribute("ESG001001List");
			int index = Util.parseInt(req.getParameter("key"));
			
			ESG001001Message listMessage = (ESG001001Message)list.get(index);

			ESG001001Message msg = null;
			
			//Creates the message with operation code depending on the option
			//Inquiry
			msg = (ESG001001Message) mp.getMessageRecord("ESG001001", user.getH01USR(), "0044");
			
			//Sets the Customer number
			msg.setE01PACCUN(listMessage.getE01PACCUN());
			msg.setE01PACNUM(listMessage.getE01PACNUM());
			msg.setH01FLGWK1("I");

			//Send message
			mp.sendMessage(msg);

			//Receive error and data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ESG001001Message) mp.receiveMessageRecord();
			
			if (userPO.getCusName() == null || userPO.getCusName().equals("")){
				userPO.setCusName(msg.getE01CUSNA1());
				userPO.setID(msg.getE01CUSIDN());
			}

			session.setAttribute("cnvObj", msg);
			if (!mp.hasError(msgError)) {
				//if there are no errors go to maintenance page
				flexLog("About to call Page: ESG0010_PAC_seguros_maintenance.jsp");
				// if the request is an inquiry sets the readOlnly attribute 'true'
				forward("ESG0010_PAC_Inq_seguros.jsp?readOnly=true", req, res);
			} else {

				//Receive insurance  list
				//if there are NO errors display list
				session.setAttribute("ESG001001List", list);
				
				
				//if there are errors go back to list page
				session.setAttribute("error", msgError);
				forward("ESG0010_PAC_Inq_seguros_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	protected void procReqSegurosPosition(ESS0030DSMessage user,
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
		//Inquiry
		msg = (ESG001001Message) mp.getMessageRecord("ESG001001", user.getH01USR(), "0044");
		
		//Sets the Customer number
		msg.setE01PACCUN(userPO.getCusNum());
		msg.setE01PACNUM(userPO.getAccNum());
		msg.setH01FLGWK1("I");

		//Send message
		mp.sendMessage(msg);

		//Receive error and data
		ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
		msg = (ESG001001Message) mp.receiveMessageRecord();
		
		if (userPO.getCusName() == null || userPO.getCusName().equals("")){
			userPO.setCusName(msg.getE01CUSNA1());
			userPO.setID(msg.getE01CUSIDN());
		}

		session.setAttribute("cnvObj", msg);
		if (!mp.hasError(msgError)) {
			//if there are no errors go to maintenance page
			flexLog("About to call Page: ESG0010_PAC_seguros_maintenance.jsp");
			// if the request is an inquiry sets the readOlnly attribute 'true'
			forward("ESG0010_PAC_Inq_seguros.jsp?readOnly=true", req, res);
		} else {
			//if there are errors go back to list page
			session.setAttribute("error", msgError);
			forward("ESG0010_PAC_Inq_seguros_list.jsp", req, res);
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
	protected void procReqSegurosRetList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		try {
			flexLog("About to call Page: ESG0010I_PAC_Ret_Inq_client_enter_search.jsp");
			forward("ESG0010I_PAC_Ret_Inq_client_enter_search.jsp", req, res);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}
	}	
	
/**  **/	
}
