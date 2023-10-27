package datapro.eibs.params;

/**
 * Registros  de FEBRK
 * @author: Jose M. Buitrago
 */
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EFE009501Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.Util;

public class JSEFE0095 extends JSEIBSServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5013250952357918505L;
	protected static final int R_FEBRK_LIST = 100;
	protected static final int A_FEBRK_LIST = 101;
	protected static final int R_FEBRK_NEW = 200;
	protected static final int R_FEBRK_MAINT = 201;
	protected static final int R_FEBRK_DELETE = 202;	
	protected static final int R_FEBRK_INQUIRY = 203;
	protected static final int A_FEBRK_MAINT = 600;
	
	/**
	 * 
	 */
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		switch (screen) {
		case R_FEBRK_LIST:
			procReqTablaFebrkList(user, req, res, session);
			break;
		case A_FEBRK_LIST:
			procActionTablaFebrkList(user, req, res, session, null);
			break;
		case R_FEBRK_NEW:
			procReqTablaFebrk(user, req, res, session, "NEW");
			break;
		case R_FEBRK_MAINT:
			procReqTablaFebrk(user, req, res, session, "MAINTENANCE");
			break;
		case R_FEBRK_INQUIRY:
			procReqTablaFebrk(user, req, res, session, "INQUIRY");
			break;
		case A_FEBRK_MAINT:
			procActionMaintenance(user, req, res, session);
			break;
		case R_FEBRK_DELETE:
			procReqDelete(user, req, res, session);
			break;
		default:
			forward(SuperServlet.devPage, req, res);
			break;
		}
	}


	/**
	 * procReqTablaFebrkList
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procReqTablaFebrkList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		try {
			flexLog("About to call Page: EFE0095_FEBRK_enter_search.jsp");
			forward("EFE0095_FEBRK_enter_search.jsp", req, res);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}
	}
	

	/**
	 * procActionTablaFebrkList	  
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procActionTablaFebrkList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session, String option)
			throws ServletException, IOException {

		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);
		
		boolean evaluation = false;
		
		try {
			mp = getMessageProcessor("EFE0095", req);

			EFE009501Message msg = (EFE009501Message) mp.getMessageRecord("EFE009501");
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0015");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setE01SELATY(Util.getReqParameter("E01SELATY", req, userPO.getOption()));
			msg.setE01NUMREC(Util.getReqParameter("Pos", req, "0"));

			mp.sendMessage(msg);

			//Receive insurance  list
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS","E01NUMREC");
			
			if(!"".equals(Util.getReqParameter("E01SELATY", req)))	userPO.setOption(Util.getReqParameter("E01SELATY", req));
 
			session.setAttribute("userpPO", userPO);
			session.setAttribute("EFE009501List", list);
			forwardOnSuccess("EFE0095_FEBRK_list.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	/**
	 * procReqTablaFebrk: This Method show a single  TablaFebrk either for 
	 * 					a new register, a maintenance or an inquiry. 
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procReqTablaFebrk(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, String option) throws ServletException,
			IOException {

		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);
		try {
			mp = getMessageProcessor("EFE0095", req);
			userPO.setPurpose(option);
			
			//Creates the message with operation code depending on the option
			EFE009501Message msg = (EFE009501Message) mp.getMessageRecord("EFE009501");
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
			if (req.getParameter("E01FEBNUM") != null) {
				msg.setE01FEBNUM(req.getParameter("E01FEBNUM"));
			}
			msg.setE01FEBATY(userPO.getOption());

			//Send message
			mp.sendMessage(msg);

			//Receive error and data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (EFE009501Message) mp.receiveMessageRecord();

			//Sets session with required data
			session.setAttribute("userPO", userPO);
			session.setAttribute("cnvObj", msg);

			if (!mp.hasError(msgError)) {
				//if there are no errors go to maintenance page
				flexLog("About to call Page: EFE0095_FEBRK_maintenance.jsp");
				if (option.equals("INQUIRY")) {
					// if the request is an inquiry sets the readOlnly attribute 'true'
					forward("EFE0095_FEBRK_maintenance.jsp?readOnly=true", req, res);
				} else {
					forward("EFE0095_FEBRK_maintenance.jsp", req, res);
				}
			} else {
				//if there are errors go back to list page
				session.setAttribute("error", msgError);
				forward("EFE0095_FEBRK_list.jsp", req, res);
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
			mp = getMessageProcessor("EFE0095", req);

			EFE009501Message msg = (EFE009501Message) mp.getMessageRecord("EFE009501");
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0005");
			msg.setH01TIMSYS(getTimeStamp());
			
			//Sets message with page fields
			msg.setH01SCRCOD("01");
			setMessageRecord(req, msg);
			msg.setE01FEBATY(userPO.getOption());

			//Sending message
			mp.sendMessage(msg);

			//Receive error and data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (EFE009501Message) mp.receiveMessageRecord();

			//Sets session with required data
			session.setAttribute("userPO", userPO);
			session.setAttribute("cnvObj", msg);

			if (!mp.hasError(msgError)) {
				//if there are no errors go back to list
				redirectToPage("/servlet/datapro.eibs.params.JSEFE0095?SCREEN=101&E01SELATY=" + userPO.getOption(), res);
			} else {
				//if there are errors go back to maintenance page and show errors
				session.setAttribute("error", msgError);
				forward("EFE0095_FEBRK_maintenance.jsp", req, res);
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
			mp = getMessageProcessor("EFE0095", req);
			
			//Creates message with the 'Delete'operation code
			EFE009501Message msg = (EFE009501Message) mp.getMessageRecord("EFE009501");
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0009");
			msg.setH01TIMSYS(getTimeStamp());
			
			//Sets required values
			msg.setH01SCRCOD("01");
			//Sets the Code for delete options
			if (req.getParameter("E01FEBNUM") != null) {
				msg.setE01FEBNUM(req.getParameter("E01FEBNUM"));
			}
			msg.setE01FEBATY(userPO.getOption());
			
			//Send message
			mp.sendMessage(msg);

			//Receive Error and Data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (EFE009501Message) mp.receiveMessageRecord();

			//Sets session with required data
			session.setAttribute("userPO", userPO);
			session.setAttribute("cnvObj", msg);

			if (!mp.hasError(msgError)) {
				//If there are no errors request the list again
				redirectToPage("/servlet/datapro.eibs.params.JSEFE0095?SCREEN=101&E01SELATY=" + userPO.getOption(), res);
			} else {
				//if there are errors show the list without updating
				session.setAttribute("error", msgError);
				forward("EFE0095_FEBRK_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

}
