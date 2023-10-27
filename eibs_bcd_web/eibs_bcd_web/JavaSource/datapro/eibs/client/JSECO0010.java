package datapro.eibs.client;

/**
 * Convenios
 * @author: Luis Crosby
 * @author: Catalina Sepulveda
 */
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ECO001001Message;
import datapro.eibs.beans.ECO001002Message;
import datapro.eibs.beans.ECO001003Message;
import datapro.eibs.beans.ECO0010DSMessage;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.Util;

public class JSECO0010 extends JSEIBSServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5013250952357918505L;
	protected static final int R_COVENANT_LIST = 100;
	protected static final int R_COVENANT_EVALUATION_ENTER = 102;
	protected static final int A_COVENANT_LIST = 101;
	protected static final int A_COVENANT_EVALUATION_LIST = 103;
	protected static final int R_COVENANT_NEW = 200;
	protected static final int R_COVENANT_MAINT = 201;
	protected static final int R_COVENANT_DELETE = 202;	
	protected static final int R_COVENANT_INQUIRY = 203;
	protected static final int R_COVENANT_EVALUATION = 300;
	protected static final int R_COVENANT_EVALUATION_INQ = 350;
	protected static final int R_COVENANT_EVALUATION_INQ_ALL = 355;		
	protected static final int A_COVENANT_EVALUATION = 303;
	protected static final int R_COVENANT_DOCUMENT = 400;
	protected static final int A_COVENANT_MAINT = 600;
	
	/**
	 * 
	 */
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		switch (screen) {
		case R_COVENANT_LIST:
			procReqCovenantList(user, req, res, session);
			break;
		case R_COVENANT_EVALUATION_ENTER:
			procReqEvaluationList(user, req, res, session);
			break;
		case A_COVENANT_LIST:
			procActionCovenantList(user, req, res, session, null);
			break;
		case A_COVENANT_EVALUATION_LIST:
			procActionCovenantList(user, req, res, session, "EVALUATION");
			break;
		case R_COVENANT_NEW:
			procReqCovenant(user, req, res, session, "NEW");
			break;
		case R_COVENANT_MAINT:
			procReqCovenant(user, req, res, session, "MAINTENANCE");
			break;
		case R_COVENANT_INQUIRY:
			procReqCovenant(user, req, res, session, "INQUIRY");
			break;
		case R_COVENANT_DOCUMENT:
			procReqCovenant(user, req, res, session, "DOCUMENT");
			break;
		case A_COVENANT_MAINT:
			procActionMaintenance(user, req, res, session);
			break;
		case R_COVENANT_DELETE:
			procReqDelete(user, req, res, session);
			break;
		case R_COVENANT_EVALUATION:
			procReqCovenantEvaluation(user, req, res, session);
			break;
		case R_COVENANT_EVALUATION_INQ:
			procReqCovenantEvaluationInq(user, req, res, session);
			break;
		case R_COVENANT_EVALUATION_INQ_ALL:
			procReqCovenantEvaluationInqAll(user, req, res, session);
			break;				
		case A_COVENANT_EVALUATION:
			procActionEvaluationMaintenance(user, req, res, session);
			break;			
		default:
			forward(SuperServlet.devPage, req, res);
			break;
		}
	}

	/**
	 * procActionMaintenance
	 * 
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procActionMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;

		try {
			mp = getMessageProcessor("ECO0010", req);

			ECO001002Message msg = (ECO001002Message) mp.getMessageRecord("ECO001002", user.getH01USR(), "0005");
			
			//Sets message with page fields
			msg.setH02SCRCOD("01");
			setMessageRecord(req, msg);

			//Sending message
			mp.sendMessage(msg);

			//Receive error and data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ECO001002Message) mp.receiveMessageRecord();

			//Sets session with required data
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("msg", msg);

			if (!mp.hasError(msgError)) {
				//if there are no errors go back to list
				redirectToPage("/servlet/datapro.eibs.client.JSECO0010?SCREEN=101&customer_number="	+ msg.getE02COSECU(), res);
			} else {
				//if there are errors go back to maintenance page and show errors
				session.setAttribute("cnvObj", msg);
				forward("ECO0010_covenant_maintenance.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	
	/**
	 * procActionMaintenance
	 * 
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procActionEvaluationMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;

		try {
			mp = getMessageProcessor("ECO0010", req);

			ECO001003Message msg = (ECO001003Message) mp.getMessageRecord("ECO001003", user.getH01USR(), "0005");
			
			//Sets message with page fields
			msg.setH03SCRCOD("01");
			setMessageRecord(req, msg);

			//Sending message
			mp.sendMessage(msg);

			//Receive error and data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ECO001003Message) mp.receiveMessageRecord();

			//Sets session with required data
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("msg", msg);

			if (!mp.hasError(msgError)) {
				//if there are no errors go back to list
				redirectToPage("/servlet/datapro.eibs.client.JSECO0010?SCREEN=101&customer_number="	+ msg.getE03COSECU(), res);
			} else {
				//if there are errors go back to maintenance page and show errors
				session.setAttribute("cnvObj", msg);
				forward("ECO0010_covenant_evaluation.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}


	/**
	 * procReqCovenantList
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procReqCovenantList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		try {
			flexLog("About to call Page: ECO0010_client_employer_search.jsp");
			forward("ECO0010_client_employer_search.jsp", req, res);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}
	}
	
	/**
	 * procReqEvaluationList
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procReqEvaluationList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		try {
			flexLog("About to call Page: ECO0010_client_evaluation_enter.jsp");
			forward("ECO0010_client_evaluation_enter.jsp", req, res);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}
	}

	/**
	 * procActionCovenantList	  
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procActionCovenantList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session, String option)
			throws ServletException, IOException {

		MessageProcessor mp = null;
		String customer_number = null;
		UserPos userPO = getUserPos(req);
		boolean evaluation = false;
		
		try {
			mp = getMessageProcessor("ECO0010", req);

			ECO001001Message msgList = (ECO001001Message) mp.getMessageRecord("ECO001001", user.getH01USR(), "0015");
			//Sets the employeer number from either the first page or the maintenance page
			customer_number = "";
			if (req.getParameter("customer_number")!= null){
				customer_number = req.getParameter("customer_number");								
			} else if (req.getParameter("E02COSECU") != null ) {
				customer_number = req.getParameter("E02COSECU");
			} else {
				if (req.getParameter("E03COSECU") != null) {
					customer_number = Util.getReqParameter("E03COSECU", req, "0");
				}
			}			
			
			if (option != null){
				evaluation = true;
				msgList.setE01COSSTS("E");
			}
			
			msgList.setE01COSECU(customer_number);

			//Sends message
			mp.sendMessage(msgList);
			
			ELEERRMessage error = (ELEERRMessage)mp.receiveMessageRecord();			
			if (mp.hasError(error)) { // if there are errors go back to first page
				session.setAttribute("error", error);
				if (evaluation){
					flexLog("About to call Page: ECO0010_client_evaluation_enter.jsp");
					forward("ECO0010_client_evaluation_enter.jsp", req, res);
				} else {
					flexLog("About to call Page: ECO0010_client_employer_search.jsp");
					forward("ECO0010_client_employer_search.jsp", req, res);
				}				
			} else {
				//Receive header information
				ECO0010DSMessage header = (ECO0010DSMessage)mp.receiveMessageRecord();
				userPO.setCusNum(header.getEDSCOSECU());
				userPO.setCusName(header.getEDSEMPNA1());
				userPO.setID(header.getEDSEMPIDN());

				//Receive convenant list
				JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
				//if there are NO errors display list
				session.setAttribute("ECO001001List", list);
				forwardOnSuccess("ECO0010_covenant_list.jsp?evaluation="+evaluation, req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	/**
	 * procReqCovenant: This Method show a single convenant either for 
	 * 					a new registry, a maintenance or an inquiry. 
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procReqCovenant(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, String option) throws ServletException,
			IOException {

		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);
		try {
			mp = getMessageProcessor("ECO0010", req);
			userPO.setPurpose(option);

			ECO001002Message msg = null;
			
			//Creates the message with operation code depending on the option
			if (option.equals("NEW")) {
				//New
				msg = (ECO001002Message) mp.getMessageRecord("ECO001002", user.getH01USR(), "0001");
			} else if (option.equals("MAINTENANCE")) {
				//Maintenance
				msg = (ECO001002Message) mp.getMessageRecord("ECO001002", user.getH01USR(), "0002");
			} else {
				//Inquiry
				msg = (ECO001002Message) mp.getMessageRecord("ECO001002", user.getH01USR(), "0004");
			}
			
			//Sets the employeer number
			msg.setE02COSECU(userPO.getCusNum());
			
			//Sets the convenant number for maintenance and inquiry options
			if (req.getParameter("E01COSNUM") != null) {
				msg.setE02COSNUM(req.getParameter("E01COSNUM"));
			}

			//Send message
			mp.sendMessage(msg);

			//Receive error and data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ECO001002Message) mp.receiveMessageRecord();
			
			if (userPO.getCusName() == null || userPO.getCusName().equals("")){
				userPO.setCusName(msg.getE02EMPNME());
				userPO.setID(msg.getE02EMPIDN());
			}

			session.setAttribute("cnvObj", msg);
			if (!mp.hasError(msgError)) {
				//if there are no errors go to maintenance page
				flexLog("About to call Page: ECO0010_covenant_maintenance.jsp");
				if (option.equals("DOCUMENT")) {
					forward("ECO0010_covenant_document.jsp", req, res);
				} else {
					if (option.equals("INQUIRY")) {
						// if the request is an inquiry sets the readOlnly attribute 'true'
						forward("ECO0010_covenant_maintenance.jsp?readOnly=true", req, res);
					} else {
						forward("ECO0010_covenant_maintenance.jsp", req, res);
					}
				}
			} else {				
				if (userPO.getPurpose().equals("INQUIRY")) {//only  enter inquiry
					session.setAttribute("error", msgError);
					forward("ECO0010_covenant_maintenance.jsp?readOnly=true", req, res);				
				}else{
					//if there are errors go back to list page
					session.setAttribute("error", msgError);
					forward("ECO0010_covenant_list.jsp", req, res);
				}				
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
			mp = getMessageProcessor("ECO0010", req);
			
			//Creates message with the 'Delete'operation code
			ECO001002Message msg = (ECO001002Message) mp.getMessageRecord("ECO001002", user.getH01USR(), "0009");
			
			//Sets required values
			msg.setH02SCRCOD("01");
			msg.setE02COSECU(userPO.getCusNum());
			msg.setE02COSNUM(req.getParameter("E01COSNUM"));
			
			//Send message
			mp.sendMessage(msg);

			//Receive Error and Data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();

			if (!mp.hasError(msgError)) {
				//If there are no errors request the list again
				redirectToPage("/servlet/datapro.eibs.client.JSECO0010?SCREEN=101&customer_number="	+ userPO.getCusNum(), res);
			} else {
				//if there are errors show the list without updating
				session.setAttribute("error", msgError);
				forward("ECO0010_covenant_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	
	/**
	 * procReqCovenantEvaluation 
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procReqCovenantEvaluation(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session) throws ServletException,
			IOException {

		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);
		try {
			mp = getMessageProcessor("ECO0010", req);
		
			//Creates the message with operation code 
			ECO001003Message msg  = (ECO001003Message) mp.getMessageRecord("ECO001003", user.getH01USR(), "0002");;
			
			//Sets the employeer number
			msg.setE03COSECU(userPO.getCusNum());
			
			//Sets the convenant number 
			if (req.getParameter("E01COSNUM") != null) {
				msg.setE03COSNUM(req.getParameter("E01COSNUM"));
			}

			//Send message
			mp.sendMessage(msg);

			//Receive error and data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ECO001003Message) mp.receiveMessageRecord();

			session.setAttribute("cnvObj", msg);
			if (!mp.hasError(msgError)) {
				//if there are no errors go to maintenance page
				flexLog("About to call Page: ECO0010_covenant_evaluation.jsp");
				forward("ECO0010_covenant_evaluation.jsp", req, res);
			} else {
				//if there are errors go back to list page
				session.setAttribute("error", msgError);
				forward("ECO0010_covenant_maintenance.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	protected void procReqCovenantEvaluationInq(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session) throws ServletException,
			IOException {

		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);
		try {
			mp = getMessageProcessor("ECO0010", req);
		
			//Creates the message with operation code 
			ECO001003Message msg  = (ECO001003Message) mp.getMessageRecord("ECO001003", user.getH01USR(), "0004");;
			
			//Sets the employeer number
			if (req.getParameter("E01EMPCUN") != null) {
				msg.setE03COSECU(req.getParameter("E01EMPCUN"));
			}
			
			//Sets the convenant number 
			if (req.getParameter("E01COSNUM") != null) {
				msg.setE03COSNUM(req.getParameter("E01COSNUM"));
			}

			//Send message
			mp.sendMessage(msg);

			//Receive error and data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ECO001003Message) mp.receiveMessageRecord();

			session.setAttribute("error", msgError);
			session.setAttribute("cnvObj", msg);
			forward("ECO0010_covenant_evaluation_Inq.jsp?readOnly=true", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}	

	
	protected void procReqCovenantEvaluationInqAll(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session) throws ServletException,
			IOException {

		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);
		try {
			mp = getMessageProcessor("ECO0010", req);
		
			//Creates the message with operation code 
			ECO001003Message msg  = (ECO001003Message) mp.getMessageRecord("ECO001003", user.getH01USR(), "0004");;
			
			//Sets the employeer number
			if (req.getParameter("E01EMPCUN") != null) {
				msg.setE03COSECU(req.getParameter("E01EMPCUN"));
			}
			
			//Sets the convenant number 
			if (req.getParameter("E01COSNUM") != null) {
				msg.setE03COSNUM(req.getParameter("E01COSNUM"));
			}

			//Send message
			mp.sendMessage(msg);

			//Receive error and data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ECO001003Message) mp.receiveMessageRecord();

			session.setAttribute("error", msgError);
			session.setAttribute("cnvObj", msg);
			forward("ECO0010_covenant_evaluation_inq_all.jsp?readOnly=true", req, res);
		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
}
