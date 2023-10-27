package datapro.eibs.products;

/**
 * Registros  de Cartolas
 * @author: Jose M. Buitrago
 */
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ERC000001Message;
import datapro.eibs.beans.ERC000002Message;
import datapro.eibs.beans.ERC000003Message;
import datapro.eibs.beans.ERC000004Message;
import datapro.eibs.beans.ERM000001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.MessageRecord;

public class JSERC0000 extends JSEIBSServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5013250952357918505L;
	protected static final int R_STATEMENT_ENTER = 100;	
	protected static final int A_HEADER_LIST = 150;
	protected static final int R_HEADER_NEW = 200;
	protected static final int R_HEADER_MAINT = 201;
	protected static final int R_HEADER_DELETE = 202;	
	protected static final int R_HEADER_INQUIRY = 203;
	protected static final int A_HEADER_MAINT = 600;

	protected static final int A_TRANSACTION_LIST = 1150;
	protected static final int R_TRANSACTION_NEW = 1200;
	protected static final int R_TRANSACTION_MAINT = 1201;
	protected static final int R_TRANSACTION_DELETE = 1202;	
	protected static final int R_TRANSACTION_INQUIRY = 1203;
	protected static final int A_TRANSACTION_MAINT = 1600;
	
	/**
	 * 
	 */
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		switch (screen) {
		case R_STATEMENT_ENTER:
			procReqStatementEnter(user, req, res, session);
			break;
		case A_HEADER_LIST:
			procActionTablaHeaderList(user, req, res, session, null);
			break;
		case R_HEADER_NEW:
			procReqTablaHeader(user, req, res, session, "NEW");
			break;
		case R_HEADER_MAINT:
			procReqTablaHeader(user, req, res, session, "MAINTENANCE");
			break;
		case R_HEADER_INQUIRY:
			procReqTablaHeader(user, req, res, session, "INQUIRY");
			break;
		case A_HEADER_MAINT:
			procActionMaintenanceHeader(user, req, res, session);
			break;
		case R_HEADER_DELETE:
			procReqDeleteHeader(user, req, res, session);
			break;

		case A_TRANSACTION_LIST:
			procActionTablaTransactionList(user, req, res, session, " ");
			break;
		case R_TRANSACTION_NEW:
			procReqTablaTransaction(user, req, res, session, "NEW");
			break;
		case R_TRANSACTION_MAINT:
			procReqTablaTransaction(user, req, res, session, "MAINTENANCE");
			break;
		case R_TRANSACTION_INQUIRY:
			procReqTablaTransaction(user, req, res, session, "INQUIRY");
			break;
		case A_TRANSACTION_MAINT:
			procActionMaintenanceTransaction(user, req, res, session);
			break;
		case R_TRANSACTION_DELETE:
			procReqDeleteTransaction(user, req, res, session);
			break;
		
		default:
			forward(SuperServlet.devPage, req, res);
			break;
		}
	}
	/**
	 * procReqStatementEnter
	 * 
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procReqStatementEnter(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		try {
			flexLog("About to call Page: ERC0000_rcbank_enter_selection.jsp");
			forward("ERC0000_rcbank_enter_selection.jsp", req, res);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}
	}

	/**
	 * procActionTablaHeaderList	  
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procActionTablaHeaderList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session, String option)
			throws ServletException, IOException {

		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);
		
		try {
			mp = getMessageProcessor("ERC0000", req);
 
			ERC000001Message msg = (ERC000001Message) mp.getMessageRecord("ERC000001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0015");
			msg.setH01TIMSYS(getTimeStamp());
			
			if (req.getParameter("E01RCSRBK") != null) {
				msg.setE01RCSRBK(req.getParameter("E01RCSRBK"));
			}
			if (req.getParameter("E01RCSCTA") != null) {
				msg.setE01RCSCTA(req.getParameter("E01RCSCTA"));
			}

			userPO.setHeader20(msg.getE01RCSRBK());
			userPO.setHeader21(msg.getE01RCSCTA());

			//Sends message
			mp.sendMessage(msg);

			//Receive error and data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ERC000001Message) mp.receiveMessageRecord();

			if (mp.hasError(msgError)) {
				
				session.setAttribute("error", msgError);
				forward("ERC0000_rcbank_enter_selection.jsp", req, res);
				
			} else {

				JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");
	 
				session.setAttribute("rcbank", msg);
				session.setAttribute("userpPO", userPO);
				session.setAttribute("ERC000002List", list);
				forwardOnSuccess("ERC0000_rcbank_statement_list.jsp", req, res);
			}
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	/**
	 * procReqTablaHeader: This Method show a single  TablaHeader either for 
	 * 					a new register, a maintenance or an inquiry. 
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procReqTablaHeader(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, String option) throws ServletException,
			IOException {

		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);
		try {
			mp = getMessageProcessor("ERC0000", req);
			userPO.setPurpose(option);
			
			//Creates the message with operation code depending on the option
			ERC000002Message msg = (ERC000002Message) mp.getMessageRecord("ERC000002");
			msg.setH02USERID(user.getH01USR());
			msg.setH02TIMSYS(getTimeStamp());
			if (option.equals("NEW")) {
				msg.setH02OPECOD("0001");
			} else if (option.equals("MAINTENANCE")) {
				msg.setH02OPECOD("0002");
			} else {
				msg.setH02OPECOD("0004");
			}

			msg.setE02RCSRBK(userPO.getHeader20());
			msg.setE02RCSCTA(userPO.getHeader21());
			
			if (req.getParameter("E02RCSSTN") != null) {
				msg.setE02RCSSTN(req.getParameter("E02RCSSTN"));
			}
			if (req.getParameter("E02RCSSDD") != null) {
				msg.setE02RCSSDD(req.getParameter("E02RCSSDD"));
			}
			if (req.getParameter("E02RCSSDM") != null) {
				msg.setE02RCSSDM(req.getParameter("E02RCSSDM"));
			}
			if (req.getParameter("E02RCSSDY") != null) {
				msg.setE02RCSSDY(req.getParameter("E02RCSSDY"));
			}

			//Send message
			mp.sendMessage(msg);

			//Receive error and data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ERC000002Message) mp.receiveMessageRecord();

			//Sets session with required data
			session.setAttribute("userPO", userPO);
			session.setAttribute("cnvObj", msg);

			if (!mp.hasError(msgError)) {
				//if there are no errors go to maintenance page
				flexLog("About to call Page: ERC0000_rcbank_statement_maintenance.jsp");
				if (option.equals("INQUIRY")) {
					// if the request is an inquiry sets the readOlnly attribute 'true'
					forward("ERC0000_rcbank_statement_maintenance.jsp?readOnly=true", req, res);
				} else {
					forward("ERC0000_rcbank_statement_maintenance.jsp", req, res);
				}
			} else {
				//if there are errors go back to list page
				session.setAttribute("error", msgError);
				forwardOnSuccess("ERC0000_rcbank_statement_list.jsp", req, res);
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
	protected void procActionMaintenanceHeader(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;

		try {
			mp = getMessageProcessor("ERC0000", req);

			ERC000002Message msg = (ERC000002Message) mp.getMessageRecord("ERC000002");
			msg.setH02USERID(user.getH01USR());
			msg.setH02OPECOD("0005");
			msg.setH02TIMSYS(getTimeStamp());
			
			//Sets message with page fields
			msg.setH02SCRCOD("01");
			setMessageRecord(req, msg);

			//Sending message
			mp.sendMessage(msg);

			//Receive error and data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ERC000002Message) mp.receiveMessageRecord();

			//Sets session with required data
			session.setAttribute("userPO", userPO);
			session.setAttribute("cnvObj", msg);

			if (!mp.hasError(msgError)) {
				//if there are no errors go back to list
				redirectToPage("/servlet/datapro.eibs.products.JSERC0000?SCREEN=100", res);
			} else {
				//if there are errors go back to maintenance page and show errors
				session.setAttribute("error", msgError);
				forward("ERC0000_rcbank_statement_maintenance.jsp", req, res);
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
	protected void procReqDeleteHeader(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		userPO.setPurpose("MAINTENANCE");

		MessageProcessor mp = null;

		try {
			mp = getMessageProcessor("ERC0000", req);
			
			//Creates message with the 'Delete'operation code
			ERC000002Message msg = (ERC000002Message) mp.getMessageRecord("ERC000002");
			msg.setH02USERID(user.getH01USR());
			msg.setH02OPECOD("0009");
			msg.setH02TIMSYS(getTimeStamp());
			
			msg.setE02RCSRBK(userPO.getHeader20());
			msg.setE02RCSCTA(userPO.getHeader21());
			
			if (req.getParameter("E02RCSSTN") != null) {
				msg.setE02RCSSTN(req.getParameter("E02RCSSTN"));
			}
			if (req.getParameter("E02RCSSDD") != null) {
				msg.setE02RCSSDD(req.getParameter("E02RCSSDD"));
			}
			if (req.getParameter("E02RCSSDM") != null) {
				msg.setE02RCSSDM(req.getParameter("E02RCSSDM"));
			}
			if (req.getParameter("E02RCSSDY") != null) {
				msg.setE02RCSSDY(req.getParameter("E02RCSSDY"));
			}
			
			//Send message
			mp.sendMessage(msg);

			//Receive Error and Data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ERC000002Message) mp.receiveMessageRecord();

			//Sets session with required data
			session.setAttribute("userPO", userPO);
			session.setAttribute("cnvObj", msg);

			if (!mp.hasError(msgError)) {
				//If there are no errors request the list again
				redirectToPage("/servlet/datapro.eibs.products.JSERC0000?SCREEN=100", res);
			} else {
				//if there are errors show the list without updating
				session.setAttribute("error", msgError);
				forward("ERC0000_rcbank_statement_maintenance.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	/**
	 * procActionTablaHeaderList	  
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procActionTablaTransactionList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session, String option)
			throws ServletException, IOException {

		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);
		
		try {
			mp = getMessageProcessor("ERC0000", req);
 
			ERC000003Message msg = (ERC000003Message) mp.getMessageRecord("ERC000003");
			msg.setH03USERID(user.getH01USR());
			msg.setH03OPECOD("0015");
			msg.setH03TIMSYS(getTimeStamp());
			
			msg.setE03RCIRBK(userPO.getHeader20());
			msg.setE03RCICTA(userPO.getHeader21());

			if (option.equals("LIST")) {
				msg.setE03RCISTN(userPO.getHeader10());
				msg.setE03RCISDD(userPO.getHeader11());
				msg.setE03RCISDM(userPO.getHeader12());
				msg.setE03RCISDY(userPO.getHeader13());
			} else {
				if (req.getParameter("E02RCSSTN") != null) {
					msg.setE03RCISTN(req.getParameter("E02RCSSTN"));
				}
				if (req.getParameter("E02RCSSDD") != null) {
					msg.setE03RCISDD(req.getParameter("E02RCSSDD"));
				}
				if (req.getParameter("E02RCSSDM") != null) {
					msg.setE03RCISDM(req.getParameter("E02RCSSDM"));
				}
				if (req.getParameter("E02RCSSDY") != null) {
					msg.setE03RCISDY(req.getParameter("E02RCSSDY"));
				}
			}
			
			//Sends message
			mp.sendMessage(msg);

			//Receive error and data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ERC000003Message) mp.receiveMessageRecord();

			if (mp.hasError(msgError)) {
				
				session.setAttribute("error", msgError);
				forward("ERC0000_rcbank_enter_selection.jsp", req, res);
				
			} else {
				userPO.setHeader20(msg.getE03RCIRBK());
				userPO.setHeader21(msg.getE03RCICTA());
				userPO.setCusName(msg.getE03CUSNA1());
				userPO.setHeader10(msg.getE03RCISTN());
				userPO.setHeader11(msg.getE03RCISDD());
				userPO.setHeader12(msg.getE03RCISDM());
				userPO.setHeader13(msg.getE03RCISDY());
				userPO.setHeader14(msg.getE03RCIACC());
				JBObjList list = mp.receiveMessageRecordList("H04FLGMAS");
	 
				session.setAttribute("rcbank", msg);
				session.setAttribute("userpPO", userPO);
				session.setAttribute("ERC000004List", list);
				forwardOnSuccess("ERC0000_rcbank_transaction_list.jsp", req, res);
				
			}
		} finally {
			if (mp != null)
				mp.close();
		}
	}
	/**
	 * procReqTablaHeader: This Method show a single  TablaHeader either for 
	 * 					a new register, a maintenance or an inquiry. 
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procReqTablaTransaction(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, String option) throws ServletException,
			IOException {

		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);
		try {
			mp = getMessageProcessor("ERC0000", req);
			userPO.setPurpose(option);
			
			//Creates the message with operation code depending on the option
			ERC000004Message msg = (ERC000004Message) mp.getMessageRecord("ERC000004");
			msg.setH04USERID(user.getH01USR());
			msg.setH04TIMSYS(getTimeStamp());
			if (option.equals("NEW")) {
				msg.setH04OPECOD("0001");
			} else if (option.equals("MAINTENANCE")) {
				msg.setH04OPECOD("0002");
			} else {
				msg.setH04OPECOD("0004");
			}
			
			msg.setE04RCIRBK(userPO.getHeader20());
			msg.setE04RCICTA(userPO.getHeader21());
			msg.setE04RCISTN(userPO.getHeader10());
			msg.setE04RCISDD(userPO.getHeader11());
			msg.setE04RCISDM(userPO.getHeader12());
			msg.setE04RCISDY(userPO.getHeader13());

			if (req.getParameter("E04RCIUID") != null) {
				msg.setE04RCIUID(req.getParameter("E04RCIUID"));
			}

			//Send message
			mp.sendMessage(msg);

			//Receive error and data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ERC000004Message) mp.receiveMessageRecord();

			//Sets session with required data
			session.setAttribute("userPO", userPO);
			session.setAttribute("cnvObj", msg);

			if (!mp.hasError(msgError)) {
				//if there are no errors go to maintenance page
				flexLog("About to call Page: ERC0000_rcbank_transaction_maintenance.jsp");
				if (option.equals("INQUIRY")) {
					// if the request is an inquiry sets the readOlnly attribute 'true'
					forward("ERC0000_rcbank_transaction_maintenance.jsp?readOnly=true", req, res);
				} else {
					forward("ERC0000_rcbank_transaction_maintenance.jsp", req, res);
				}
			} else {
				//if there are errors go back to list page
				session.setAttribute("error", msgError);
				forwardOnSuccess("ERC0000_rcbank_transaction_list.jsp", req, res);
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
	protected void procActionMaintenanceTransaction(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;

		try {
			mp = getMessageProcessor("ERC0000", req);

			ERC000004Message msg = (ERC000004Message) mp.getMessageRecord("ERC000004");
			msg.setH04USERID(user.getH01USR());
			msg.setH04OPECOD("0005");
			msg.setH04TIMSYS(getTimeStamp());
			
			//Sets message with page fields
			msg.setH04SCRCOD("01");
			setMessageRecord(req, msg);

			//Sending message
			mp.sendMessage(msg);

			//Receive error and data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ERC000004Message) mp.receiveMessageRecord();

			//Sets session with required data
			session.setAttribute("userPO", userPO);
			session.setAttribute("cnvObj", msg);

			if (!mp.hasError(msgError)) {
				//if there are no errors go back to list
				procActionTablaTransactionList(user, req, res, session, "LIST");
			} else {
				//if there are errors go back to maintenance page and show errors
				session.setAttribute("error", msgError);
				forward("ERC0000_rcbank_transaction_maintenance.jsp", req, res);
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
	protected void procReqDeleteTransaction(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		userPO.setPurpose("MAINTENANCE");

		MessageProcessor mp = null;

		try {
			mp = getMessageProcessor("ERC0000", req);
			
			//Creates message with the 'Delete'operation code
			ERC000004Message msg = (ERC000004Message) mp.getMessageRecord("ERC000004");
			msg.setH04USERID(user.getH01USR());
			msg.setH04OPECOD("0009");
			msg.setH04TIMSYS(getTimeStamp());
			
			if (req.getParameter("E04RCIUID") != null) {
				msg.setE04RCIUID(req.getParameter("E04RCIUID"));
			}
			
			//Send message
			mp.sendMessage(msg);

			//Receive Error and Data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ERC000004Message) mp.receiveMessageRecord();

			//Sets session with required data
			session.setAttribute("userPO", userPO);
			session.setAttribute("cnvObj", msg);

			if (!mp.hasError(msgError)) {
				//If there are no errors request the list again
				userPO.setOption("LIST");
				procActionTablaTransactionList(user, req, res, session, "LIST");
			} else {
				//if there are errors show the list without updating
				session.setAttribute("error", msgError);
				forward("ERC0000_rcbank_transaction_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	
	
}
