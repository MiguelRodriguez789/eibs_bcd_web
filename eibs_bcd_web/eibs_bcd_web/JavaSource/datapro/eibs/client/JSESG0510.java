package datapro.eibs.client;

/**
 * Tabla de Seguros
 * @author: Jose M. Buitrago
 */
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESG051001Message;
import datapro.eibs.beans.ESG051002Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;

public class JSESG0510 extends JSEIBSServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5013250952357918505L;
	protected static final int R_TBL_SEGUROS_LIST = 100;
	protected static final int A_TBL_SEGUROS_LIST = 101;
	protected static final int R_TBL_SEGUROS_NEW = 200;
	protected static final int R_TBL_SEGUROS_MAINT = 201;
	protected static final int R_TBL_SEGUROS_DELETE = 202;	
	protected static final int R_TBL_SEGUROS_INQUIRY = 203;
	protected static final int A_TBL_SEGUROS_MAINT = 600;
	
	/**
	 * 
	 */
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		switch (screen) {
		case R_TBL_SEGUROS_LIST:
			procReqTablaSegurosList(user, req, res, session);
			break;
		case A_TBL_SEGUROS_LIST:
			procActionTablaSegurosList(user, req, res, session, null);
			break;
		case R_TBL_SEGUROS_NEW:
			procReqTablaSeguros(user, req, res, session, "NEW");
			break;
		case R_TBL_SEGUROS_MAINT:
			procReqTablaSeguros(user, req, res, session, "MAINTENANCE");
			break;
		case R_TBL_SEGUROS_INQUIRY:
			procReqTablaSeguros(user, req, res, session, "INQUIRY");
			break;
		case A_TBL_SEGUROS_MAINT:
			procActionMaintenance(user, req, res, session);
			break;
		case R_TBL_SEGUROS_DELETE:
			procReqDelete(user, req, res, session);
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
			mp = getMessageProcessor("ESG0510", req);

			ESG051001Message msg = (ESG051001Message) mp.getMessageRecord("ESG051001", user.getH01USR(), "0005");
			
			//Sets message with page fields
			msg.setH01SCRCOD("01");
			setMessageRecord(req, msg);

			//Sending message
			mp.sendMessage(msg);

			//Receive error and data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ESG051001Message) mp.receiveMessageRecord();

			//Sets session with required data
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("msg", msg);

			if (!mp.hasError(msgError)) {
				//if there are no errors go back to list
				procActionTablaSegurosList(user, req, res, session, null);
			} else {
				//if there are errors go back to maintenance page and show errors
				session.setAttribute("cnvObj", msg);
				forward("ESG0510_TBL_seguros_maintenance.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}
	

	/**
	 * procReqTablaSegurosList
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procReqTablaSegurosList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		try {
			flexLog("About to call Page: ESG0510_TBL_seguro_enter_search.jsp");
			forward("ESG0510_TBL_seguro_enter_search.jsp", req, res);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}
	}
	

	/**
	 * procActionTablaSegurosList	  
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procActionTablaSegurosList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session, String option)
			throws ServletException, IOException {

		MessageProcessor mp = null;
		String codigo_seguro = null;
		UserPos userPO = getUserPos(req);
		boolean evaluation = false;
		
		try {
			mp = getMessageProcessor("ESG0510", req);

			ESG051001Message msgList = (ESG051001Message) mp.getMessageRecord("ESG051001", user.getH01USR(), "0015");
			//Sets the employee  number from either the first page or the maintenance page
			codigo_seguro = "";
			if (req.getParameter("codigo_seguro")!= null){
				codigo_seguro = req.getParameter("codigo_seguro");								
			} else {
				codigo_seguro = userPO.getCusNum();
			}
			
			if (option != null){
				evaluation = true;
				msgList.setE01SGTSTS("E");
			}
			
			msgList.setE01SGTCOD(codigo_seguro);

			//Sends message
			mp.sendMessage(msgList);
			
			ELEERRMessage error = (ELEERRMessage)mp.receiveMessageRecord();			
			if (mp.hasError(error)) { // if there are errors go back to first page
				session.setAttribute("error", error);
				flexLog("About to call Page: ESG0510_TBL_seguro_enter_search.jsp");
				forward("ESG0510_TBL_seguro_enter_search.jsp", req, res);
			} else {
				//Receive header information
				ESG051002Message header = (ESG051002Message)mp.receiveMessageRecord();
				userPO.setCusNum(header.getE02SGTCOD());
				userPO.setCusName(header.getE02DESCRI());

				//Receive insurance  list
				JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
				//if there are NO errors display list
				session.setAttribute("ESG051001List", list);
				forwardOnSuccess("ESG0510_TBL_seguros_list.jsp?evaluation="+evaluation, req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	/**
	 * procReqTablaSeguros: This Method show a single  TablaSeguros either for 
	 * 					a new register, a maintenance or an inquiry. 
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procReqTablaSeguros(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, String option) throws ServletException,
			IOException {

		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);
		try {
			mp = getMessageProcessor("ESG0510", req);
			userPO.setPurpose(option);

			ESG051001Message msg = null;
			
			//Creates the message with operation code depending on the option
			if (option.equals("NEW")) {
				//New
				msg = (ESG051001Message) mp.getMessageRecord("ESG051001", user.getH01USR(), "0001");
			} else if (option.equals("MAINTENANCE")) {
				//Maintenance
				msg = (ESG051001Message) mp.getMessageRecord("ESG051001", user.getH01USR(), "0002");
			} else {
				//Inquiry
				msg = (ESG051001Message) mp.getMessageRecord("ESG051001", user.getH01USR(), "0004");
			}
			
			//Sets the Codigo Seguro
			msg.setE01SGTCOD(userPO.getCusNum());
			
			//Sets the insurance number for maintenance and inquiry options
			if (req.getParameter("E01SGTPLN") != null) {
				msg.setE01SGTPLN(req.getParameter("E01SGTPLN"));
			}

			//Send message
			mp.sendMessage(msg);

			//Receive error and data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ESG051001Message) mp.receiveMessageRecord();

			session.setAttribute("cnvObj", msg);
			if (!mp.hasError(msgError)) {
				//if there are no errors go to maintenance page
				flexLog("About to call Page: ESG0510_TBL_seguros_maintenance.jsp");
				if (option.equals("INQUIRY")) {
					// if the request is an inquiry sets the readOlnly attribute 'true'
					forward("ESG0510_TBL_seguros_maintenance.jsp?readOnly=true", req, res);
				} else {
					forward("ESG0510_TBL_seguros_maintenance.jsp", req, res);
				}
			} else {
				//if there are errors go back to list page
				session.setAttribute("error", msgError);
				forward("ESG0510_TBL_seguros_list.jsp", req, res);
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
			mp = getMessageProcessor("ESG0510", req);
			
			//Creates message with the 'Delete'operation code
			ESG051001Message msg = (ESG051001Message) mp.getMessageRecord("ESG051001", user.getH01USR(), "0009");
			
			//Sets required values
			msg.setH01SCRCOD("01");
			//Sets the Codigo Seguro
			msg.setE01SGTCOD(userPO.getCusNum());
			
			//Sets the insurance number for maintenance and inquiry options
			if (req.getParameter("E01SGTPLN") != null) {
				msg.setE01SGTPLN(req.getParameter("E01SGTPLN"));
			}
			
			//Send message
			mp.sendMessage(msg);

			//Receive Error and Data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ESG051001Message) mp.receiveMessageRecord();

			//Sets session with required data
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("msg", msg);

			if (!mp.hasError(msgError)) {
				//If there are no errors request the list again
				procActionTablaSegurosList(user, req, res, session, null);
			} else {
				//if there are errors show the list without updating
				session.setAttribute("error", msgError);
				forward("ESG0510_TBL_seguros_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

}
