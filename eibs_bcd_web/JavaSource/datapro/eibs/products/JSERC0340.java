package datapro.eibs.products;

/**
 * Registros  de BRMST
 * @author: Jose M. Buitrago
 */
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ERC034001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;

public class JSERC0340 extends JSEIBSServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5013250952357918505L;
	protected static final int A_BANKS_LIST = 100;
	protected static final int R_BANKS_NEW = 200;
	protected static final int R_BANKS_MAINT = 201;
	protected static final int R_BANKS_DELETE = 202;	
	protected static final int R_BANKS_INQUIRY = 203;
	protected static final int A_BANKS_MAINT = 600;
	
	/**
	 * 
	 */
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		switch (screen) {
		case A_BANKS_LIST:
			procActionTablaBrmstList(user, req, res, session, null);
			break;
		case R_BANKS_NEW:
			procReqTablaBrmst(user, req, res, session, "NEW");
			break;
		case R_BANKS_MAINT:
			procReqTablaBrmst(user, req, res, session, "MAINTENANCE");
			break;
		case R_BANKS_INQUIRY:
			procReqTablaBrmst(user, req, res, session, "INQUIRY");
			break;
		case A_BANKS_MAINT:
			procActionMaintenance(user, req, res, session);
			break;
		case R_BANKS_DELETE:
			procReqDelete(user, req, res, session);
			break;
		default:
			forward(SuperServlet.devPage, req, res);
			break;
		}
	}

	/**
	 * procActionTablaBrmstList	  
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procActionTablaBrmstList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session, String option)
			throws ServletException, IOException {

		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);
		
		try {
			mp = getMessageProcessor("ERC0340", req);
 
			ERC034001Message msg = (ERC034001Message) mp.getMessageRecord("ERC034001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0015");
			msg.setH01TIMSYS(getTimeStamp());
			//Sends message
			mp.sendMessage(msg);

			//Receive insurance  list
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
 
			session.setAttribute("userpPO", userPO);
			session.setAttribute("ERC034001List", list);
			forwardOnSuccess("ERC0340_bancos_reconciliacion_list.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	/**
	 * procReqTablaBrmst: This Method show a single  TablaBrmst either for 
	 * 					a new register, a maintenance or an inquiry. 
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procReqTablaBrmst(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, String option) throws ServletException,
			IOException {

		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);
		try {
			mp = getMessageProcessor("ERC0340", req);
			userPO.setPurpose(option);
			
			//Creates the message with operation code depending on the option
			ERC034001Message msg = (ERC034001Message) mp.getMessageRecord("ERC034001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01TIMSYS(getTimeStamp());
			if (option.equals("NEW")) {
				msg.setH01OPECOD("0001");
			} else if (option.equals("MAINTENANCE")) {
				msg.setH01OPECOD("0002");
			} else {
				msg.setH01OPECOD("0004");
			}
			
			//Sets the number for maintenance and inquiry options
			if (req.getParameter("E01BRMEID") != null) {
				msg.setE01BRMEID(req.getParameter("E01BRMEID"));
			}
			if (req.getParameter("E01BRMCTA") != null) {
				msg.setE01BRMCTA(req.getParameter("E01BRMCTA"));
			}

			//Send message
			mp.sendMessage(msg);

			//Receive error and data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ERC034001Message) mp.receiveMessageRecord();

			//Sets session with required data
			session.setAttribute("userPO", userPO);
			session.setAttribute("cnvObj", msg);

			if (!mp.hasError(msgError)) {
				//if there are no errors go to maintenance page
				flexLog("About to call Page: ERC0340_bancos_reconciliacion_maintenance.jsp");
				if (option.equals("INQUIRY")) {
					// if the request is an inquiry sets the readOlnly attribute 'true'
					forward("ERC0340_bancos_reconciliacion_maintenance.jsp?readOnly=true", req, res);
				} else {
					forward("ERC0340_bancos_reconciliacion_maintenance.jsp", req, res);
				}
			} else {
				//if there are errors go back to list page
				session.setAttribute("error", msgError);
				forward("ERC0340_bancos_reconciliacion_list.jsp", req, res);
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
	protected void procActionMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;

		try {
			mp = getMessageProcessor("ERC0340", req);

			ERC034001Message msg = (ERC034001Message) mp.getMessageRecord("ERC034001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0005");
			msg.setH01TIMSYS(getTimeStamp());
			
			//Sets message with page fields
			msg.setH01SCRCOD("01");
			setMessageRecord(req, msg);

			//Sending message
			mp.sendMessage(msg);

			//Receive error and data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ERC034001Message) mp.receiveMessageRecord();

			//Sets session with required data
			session.setAttribute("userPO", userPO);
			session.setAttribute("cnvObj", msg);

			if (!mp.hasError(msgError)) {
				//if there are no errors go back to list
				redirectToPage("/servlet/datapro.eibs.products.JSERC0340?SCREEN=100", res);
			} else {
				//if there are errors go back to maintenance page and show errors
				session.setAttribute("error", msgError);
				forward("ERC0340_bancos_reconciliacion_maintenance.jsp", req, res);
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
			mp = getMessageProcessor("ERC0340", req);
			
			//Creates message with the 'Delete'operation code
			ERC034001Message msg = (ERC034001Message) mp.getMessageRecord("ERC034001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0009");
			msg.setH01TIMSYS(getTimeStamp());
			
			//Sets required values
			msg.setH01SCRCOD("01");
			//Sets the Code for delete options
			if (req.getParameter("E01BRMEID") != null) {
				msg.setE01BRMEID(req.getParameter("E01BRMEID"));
			}
			if (req.getParameter("E01BRMCTA") != null) {
				msg.setE01BRMCTA(req.getParameter("E01BRMCTA"));
			}
			
			//Send message
			mp.sendMessage(msg);

			//Receive Error and Data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ERC034001Message) mp.receiveMessageRecord();

			//Sets session with required data
			session.setAttribute("userPO", userPO);
			session.setAttribute("cnvObj", msg);

			if (!mp.hasError(msgError)) {
				//If there are no errors request the list again
				redirectToPage("/servlet/datapro.eibs.products.JSERC0340?SCREEN=100", res);
			} else {
				//if there are errors show the list without updating
				session.setAttribute("error", msgError);
				forward("ERC0340_bancos_reconciliacion_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

}
