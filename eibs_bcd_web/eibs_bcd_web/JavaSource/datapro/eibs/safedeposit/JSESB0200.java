package datapro.eibs.safedeposit; 

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESB020001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageField;
import datapro.eibs.sockets.MessageRecord;

public class JSESB0200 extends JSEIBSServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected static final int R_LIST 		= 1;
	protected static final int A_LIST 		= 2;
	protected static final int R_NEW 		= 100;
	protected static final int R_MAINT 		= 200;
	protected static final int A_DELETE 	= 400;
	protected static final int A_MAINT 		= 500;

	protected String LangPath = "S";
	/**
	 * JSEXEDD0000 constructor comment.
	 */
	public JSESB0200() {
		super();
	}
	
	/**
	 * This method was created by Orestes Garcia.
	 */
	public void destroy() {
		flexLog("free resources used by JSESB0110");
	}
	
	/**
	 * 
	 */
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		switch (screen) {
		case R_NEW:
			requestNew(user, req, res, session);
			break;
		case R_LIST:
			requestList(user, req, res, session);
			break;
		case A_LIST:
			executeList(user, req, res, session);
			break;
		case R_MAINT:
			requestMaintenance(user, req, res, session);
			break;
		case A_DELETE:
			executeDeletion(user, req, res, session);
			break;
		case A_MAINT:
			executeMaintenance(user, req, res, session);
			break;
		default:
			res.sendRedirect(super.srctx + LangPath + super.devPage);
			break;
		}

	}
	

	/**
	 * requestNew: first page. Request the bank from which the list will be displayed.
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void requestNew(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession session)
		throws ServletException, IOException {

		UserPos userPO = null;
		userPO = getUserPos(req);
		userPO.setPurpose("NEW");

		ESB020001Message msg = new ESB020001Message();
		msg.setE01SBSBNK(req.getParameter("bank"));
		ELEERRMessage msgError = new ELEERRMessage();
		session.setAttribute("msgPart", msg);
		session.setAttribute("error", msgError);
		session.setAttribute("userPO",userPO);
		
		String PageToCall = "ESB0200_safe_deposit_availables_maintenance.jsp";
		forward(PageToCall, req, res);

	}
	
	/**
	 * 
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void requestList(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		String PageToCall = "ESB0200_safe_deposit_availables_enter_new.jsp";
		forward(PageToCall, req, res);
	}

	/**
	 * 
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void executeList(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession session)
		throws ServletException, IOException {
	
		String PageToCall = "";
		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		UserPos userPO = null;
		userPO = getUserPos(req);
		try {
			mp = getMessageProcessor("ESB0200", req);
			
			ESB020001Message  msg = (ESB020001Message) mp.getMessageRecord("ESB020001");
			msg.setE01SBSBNK(req.getParameter("E01SBSBNK"));
			msg.setH01OPECOD("0015");
			msg.setH01USERID(user.getH01USR());// User
			msg.setH01PROGRM("ESB0200");
			msg.setH01TIMSYS(getTimeStamp());
												
			mp.sendMessage(msg);
			
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
			
			if (mp.hasError(list)) {
				list.initRow();
				list.getNextRow();
				msgError = (ELEERRMessage) list.getRecord();
				PageToCall = "ESB0200_safe_deposit_availables_enter_new.jsp";
			} else {
				PageToCall = "ESB0200_safe_deposit_availables_list.jsp";
			}
			userPO.setBank(req.getParameter("E01SBSBNK"));
		
			session.setAttribute("msgList", list);			
			session.setAttribute("error", msgError);
			forward(PageToCall, req, res);
		} finally {
			if (mp != null)	mp.close();
		}

	}
	
	/**
	 * 
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void requestMaintenance(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		ESB020001Message msgPart = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		JBObjList beanList = null;
		boolean IsNotError = true;
		MessageProcessor mp = null;
		String PageToCall = "";
		
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		userPO.setPurpose("MAINTENANCE");

		// Send Initial data
		try {
			//Get the message from the row 
			ESB020001Message msgTemp = null;
			beanList = (JBObjList) ses.getAttribute("msgList");
			beanList.setCurrentRow(Integer.parseInt(req.getParameter("ROW")));
			msgTemp = (ESB020001Message) beanList.getRecord();
			
			mp = getMessageProcessor("EBS0200", req);
			msgPart = (ESB020001Message)mp.getMessageRecord("ESB020001");
			msgPart.setE01SBSCOD(msgTemp.getBigDecimalE01SBSCOD());
			msgPart.setH01OPECOD("0003");
			msgPart.setH01USERID(user.getH01USR());// User
			msgPart.setH01PROGRM("ESB0200");
			msgPart.setH01TIMSYS(getTimeStamp());
			
			mp.sendMessage(msgPart);
			
			//Receive Error
			MessageRecord newmsg = mp.receiveMessageRecord();
			if (mp.hasError(newmsg)) {
				msgError = (ELEERRMessage) newmsg;
				IsNotError = false;				
			}
			
			//Receive Data
			newmessage = mp.receiveMessageRecord("ESB020001");
			msgPart = (ESB020001Message) newmessage;
			
			ses.setAttribute("error", msgError);
			ses.setAttribute("userPO", userPO);
			ses.setAttribute("msgPart", msgPart);

			if (IsNotError) { // There are no errors
				PageToCall = "ESB0200_safe_deposit_availables_maintenance.jsp";
			} else { // There are errors
				PageToCall = "ESB0200_safe_deposit_availables_list.jsp";
			}
			forward(PageToCall, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}
	
	/**
	 * 
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void executeDeletion(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
		
		JBObjList beanList = null;
		ESB020001Message msgPart = null;
		boolean IsNotError = true;
		ELEERRMessage msgError = null;

		MessageProcessor mp = null;
		
		// Send Initial data
		try {
			//Get the message from the row 
			ESB020001Message msgTemp = null;
			beanList = (JBObjList) ses.getAttribute("msgList");
			beanList.setCurrentRow(Integer.parseInt(req.getParameter("ROW")));
			msgTemp = (ESB020001Message) beanList.getRecord();
			
			mp = getMessageProcessor("EBS0200", req);
			msgPart = (ESB020001Message)mp.getMessageRecord("ESB020001");
			msgPart.setE01SBSCOD(msgTemp.getBigDecimalE01SBSCOD());
			msgPart.setH01OPECOD("0004");
			msgPart.setH01USERID(user.getH01USR());// User
			msgPart.setH01PROGRM("ESB0200");
			msgPart.setH01TIMSYS(getTimeStamp());
			
			mp.sendMessage(msgPart);
			
			//Receive Error
			MessageRecord newmsg = mp.receiveMessageRecord();
			if (mp.hasError(newmsg)) {
				msgError = (ELEERRMessage) newmsg;
				IsNotError = false;				
			}
			
			ses.setAttribute("error", msgError);
			ses.setAttribute("msgPart", msgPart);

			if (IsNotError) { // There are no errors
				res.sendRedirect(super.srctx + "/servlet/datapro.eibs.safedeposit.JSESB0200?SCREEN=2&E01SBSBNK=" + msgPart.getE01SBSBNK());
			} else { // There are errors
				forward("ESB0200_safe_deposit_availables_list.jsp", req, res);
			}
		} finally {
			if (mp != null)	mp.close();
		}

	}

	/**
	 * 
	 * @param user
	 * @param req
	 * @param res
	 * @param ses
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void executeMaintenance(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
	
		MessageRecord newmessage = null;
		ESB020001Message msgPart = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = true;

		MessageProcessor mp = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send Initial data
		try {
			//Get the message from the row 			
			mp = getMessageProcessor("EBS0200", req);
			
			msgPart = (ESB020001Message)mp.getMessageRecord("ESB020001");
			if (userPO.getPurpose().equals("NEW")){
				msgPart.setH01OPECOD("0001");
			} else {
				msgPart.setH01OPECOD("0005");
			}
			msgPart.setH01USERID(user.getH01USR());// User
			msgPart.setH01PROGRM("ESB0200");
			msgPart.setH01TIMSYS(getTimeStamp());
			
			// all the fields here
			java.util.Enumeration enu = msgPart.fieldEnumeration();
			MessageField field = null;
			String value = null;
			while (enu.hasMoreElements()) {
				field = (MessageField) enu.nextElement();
				try {
					value = req.getParameter(field.getTag()).toUpperCase();
					if (value != null) {
						field.setString(value);
					}
				} catch (Exception e) {
				}
			}
	
			mp.sendMessage(msgPart);
			
			// Receive Error Message
			MessageRecord newmsg = mp.receiveMessageRecord();
			if (mp.hasError(newmsg)) {
				msgError = (ELEERRMessage) newmsg;
				IsNotError = false;				
			}
	
			// Receive Data
			newmessage = mp.receiveMessageRecord("ESB020001");
			msgPart = (ESB020001Message) newmessage;
		
			ses.setAttribute("error", msgError);
			ses.setAttribute("msgPart", msgPart);
			ses.setAttribute("userPO", userPO);
	
				if (IsNotError) { // There are no errors
					res.sendRedirect(super.srctx + "/servlet/datapro.eibs.safedeposit.JSESB0200?SCREEN=2&E01SBSBNK=" + msgPart.getE01SBSBNK());
				} else { // There are errors
					forward("ESB0200_safe_deposit_availables_maintenance.jsp", req, res);
				}
	
		} finally {
			if (mp != null)	mp.close();
		}	
	}
}