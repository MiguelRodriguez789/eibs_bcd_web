package datapro.eibs.salesplatform;

/**
 * Registros  de PVSGT
 * @author: Jose M. Buitrago
 */
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EPV118501Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;

public class JSEPV1185 extends JSEIBSServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5013250952357918505L;
	protected static final int A_PVSGT_LIST = 100;
	protected static final int R_PVSGT_NEW = 200;
	protected static final int R_PVSGT_MAINT = 201;
	protected static final int R_PVSGT_DELETE = 202;	
	protected static final int R_PVSGT_INQUIRY = 203;
	protected static final int A_PVSGT_MAINT = 600;
	
	/**
	 * 
	 */
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		switch (screen) {
		case A_PVSGT_LIST:
			procActionTablaPvctbList(user, req, res, session, null);
			break;
		case R_PVSGT_NEW:
			procReqTablaPvctb(user, req, res, session, "NEW");
			break;
		case R_PVSGT_MAINT:
			procReqTablaPvctb(user, req, res, session, "MAINTENANCE");
			break;
		case R_PVSGT_INQUIRY:
			procReqTablaPvctb(user, req, res, session, "INQUIRY");
			break;
		case A_PVSGT_MAINT:
			procActionMaintenance(user, req, res, session);
			break;
		case R_PVSGT_DELETE:
			procReqDelete(user, req, res, session);
			break;
		default:
			forward(SuperServlet.devPage, req, res);
			break;
		}
	}

	/**
	 * procActionTablaPvctbList	  
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procActionTablaPvctbList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session, String option)
			throws ServletException, IOException {

		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);
		boolean evaluation = false;
		
		try {
			mp = getMessageProcessor("EPV1185", req);

			EPV118501Message msg = (EPV118501Message) mp.getMessageRecord("EPV118501");
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0015");
			msg.setH01TIMSYS(getTimeStamp());
			//Sends message
			mp.sendMessage(msg);

			//Receive insurance  list
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
 
			session.setAttribute("userpPO", userPO);
			session.setAttribute("EPV118501List", list);
			forwardOnSuccess("EPV1185_PVSGT_list.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	/**
	 * procReqTablaPvctb: This Method show a single  TablaPvctb either for 
	 * 					a new register, a maintenance or an inquiry. 
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procReqTablaPvctb(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, String option) throws ServletException,
			IOException {

		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);
		try {
			mp = getMessageProcessor("EPV1185", req);
			userPO.setPurpose(option);
			
			//Creates the message with operation code depending on the option
			EPV118501Message msg = (EPV118501Message) mp.getMessageRecord("EPV118501");
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
			if (req.getParameter("E01PSTDED") != null) {
				msg.setE01PSTDED(req.getParameter("E01PSTDED"));
			}

			//Send message
			mp.sendMessage(msg);

			//Receive error and data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (EPV118501Message) mp.receiveMessageRecord();

			//Sets session with required data
			session.setAttribute("userPO", userPO);
			session.setAttribute("cnvObj", msg);

			if (!mp.hasError(msgError)) {
				//if there are no errors go to maintenance page
				flexLog("About to call Page: EPV1185_PVSGT_maintenance.jsp");
				if (option.equals("INQUIRY")) {
					// if the request is an inquiry sets the readOlnly attribute 'true'
					forward("EPV1185_PVSGT_maintenance.jsp?readOnly=true", req, res);
				} else {
					forward("EPV1185_PVSGT_maintenance.jsp", req, res);
				}
			} else {
				//if there are errors go back to list page
				session.setAttribute("error", msgError);
				forward("EPV1185_PVSGT_list.jsp", req, res);
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
			mp = getMessageProcessor("EPV1185", req);

			EPV118501Message msg = (EPV118501Message) mp.getMessageRecord("EPV118501");
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
			msg = (EPV118501Message) mp.receiveMessageRecord();

			//Sets session with required data
			session.setAttribute("userPO", userPO);
			session.setAttribute("cnvObj", msg);

			if (!mp.hasError(msgError)) {
				//if there are no errors go back to list
				redirectToPage("/servlet/datapro.eibs.salesplatform.JSEPV1185?SCREEN=100", res);
			} else {
				//if there are errors go back to maintenance page and show errors
				session.setAttribute("error", msgError);
				forward("EPV1185_PVSGT_maintenance.jsp", req, res);
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
			mp = getMessageProcessor("EPV1185", req);
			
			//Creates message with the 'Delete'operation code
			EPV118501Message msg = (EPV118501Message) mp.getMessageRecord("EPV118501");
			msg.setH01USERID(user.getH01USR());
			msg.setH01OPECOD("0009");
			msg.setH01TIMSYS(getTimeStamp());
			
			//Sets required values
			msg.setH01SCRCOD("01");
			//Sets the Code for delete options
			if (req.getParameter("E01PSTDED") != null) {
				msg.setE01PSTDED(req.getParameter("E01PSTDED"));
			}
			
			//Send message
			mp.sendMessage(msg);

			//Receive Error and Data
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (EPV118501Message) mp.receiveMessageRecord();

			//Sets session with required data
			session.setAttribute("userPO", userPO);
			session.setAttribute("cnvObj", msg);

			if (!mp.hasError(msgError)) {
				//If there are no errors request the list again
				redirectToPage("/servlet/datapro.eibs.salesplatform.JSEPV1185?SCREEN=100", res);
			} else {
				//if there are errors show the list without updating
				session.setAttribute("error", msgError);
				forward("EPV1185_PVSGT_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

}
