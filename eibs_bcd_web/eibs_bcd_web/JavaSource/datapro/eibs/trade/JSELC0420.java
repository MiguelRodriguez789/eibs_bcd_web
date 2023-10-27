
package datapro.eibs.trade;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELC042001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageContext;
import datapro.eibs.sockets.MessageRecord;

public class JSELC0420 extends JSEIBSServlet {
	
	protected static final int R_SEARCH 	= 1;
	protected static final int R_LIST 		= 1500;
	protected static final int R_HELP 		= 1600;
	protected static final int R_NEW 		= 100;
	protected static final int R_MAINT 		= 200;
	protected static final int A_MAINT 		= 500;
	protected static final int A_INQUIRY 	= 400;
	protected static final int A_DELETE 	= 900;
	

	protected void processRequest(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession session,
		int screen)
		throws ServletException, IOException {

		switch (screen) {
			case R_SEARCH :							
				procReqSearch(req, res, session);
				break;						
			case R_LIST :							
			case R_HELP :							
				procReqList(user, req, res, session, screen);
				break;						
			case R_NEW :
				procReqNew(user, req, res, session, screen);
				break;
			case R_MAINT :
				procReqMaintenance(user, req, res, session, screen);
				break;
			case A_MAINT :
				procActionMaintenance(user, req, res, session, screen);
				break;
			case A_INQUIRY :
				procActionInquiry(user, req, res, session, screen);
				break;
			case A_DELETE :
				procActionDelete(user, req, res, session, screen);
				break;
			default :
				forward(super.devPage, req, res);
				break;
		}
	}

	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 * @param screen
	 */
	private void procActionInquiry(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = getMessageProcessor("ELC0420", req);
		try {
			initTransaction(userPO, String.valueOf(screen), "INQUIRY");
			ELC042001Message msg = (ELC042001Message) getMessageRecord(req, session);
			putDataInSession(session, null, userPO, "msg", msg);
			forward("ELC0420_declaration_basic.jsp", req, res);
		} finally {
			if(mp != null) mp.close();
		}
	}

	/**
	 * @param req
	 * @param session
	 * @return
	 */

	private MessageRecord getMessageRecord(HttpServletRequest req, HttpSession session) {
		MessageRecord result = null;
		JBObjList list = (JBObjList) session.getAttribute("msgList");
		list.initRow();
		int row = 0;
		try {
			row = Integer.parseInt(req.getParameter("ROW"));
		} catch (Exception e) {
			row = 0;
		}
		if (row <= list.getLastRec()) {
			list.setCurrentRow(row);
			result = (MessageRecord) list.getRecord();
		}
		return result;
	}

	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 * @param screen
	 */
	private void procActionDelete(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = getMessageProcessor("ELC0420", req);
		try {
			initTransaction(userPO, String.valueOf(screen), "DELETE");
			ELC042001Message msg = (ELC042001Message) getMessageRecord(req, session);
			msg.setH01OPECOD("0009"); //Delete
			mp.sendMessage(msg);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			putDataInSession(session, msgError, userPO, null, null);
			procReqList(user, req, res, session, screen);	
		} finally {
			if(mp != null) mp.close();
		}
	}

	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 * @param screen
	 */
	private void procActionMaintenance(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = getMessageProcessor("ELC0420", req);
		try {
			initTransaction(userPO, String.valueOf(screen), "");
			ELC042001Message msg = (ELC042001Message) session.getAttribute("msg");
			setMessageRecord(req, msg);
			mp.sendMessage(msg);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (ELC042001Message) mp.receiveMessageRecord();
			if (mp.hasError(msgError)) {
				putDataInSession(session, msgError, userPO, "msg", msg);
				forward("ELC0420_declaration_basic.jsp", req, res);
			} else {
				procReqList(user, req, res, session, screen);	
			}
		} finally {
			if(mp != null) mp.close();
		}
	}

	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 * @param screen
	 */
	private void procReqMaintenance(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		initTransaction(userPO, String.valueOf(screen), "MAINTENANCE");
		ELC042001Message msg = (ELC042001Message) getMessageRecord(req, session);
		msg.setH01OPECOD("0005"); //Maintenance
		putDataInSession(session, null, userPO, "msg", msg);
		forward("ELC0420_declaration_basic.jsp", req, res);
	}

	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procReqNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws IOException, ServletException {
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = getMessageProcessor("ELC0420", req);
		try {
			initTransaction(userPO, String.valueOf(screen), "NEW");
			ELC042001Message msg = (ELC042001Message) mp.getMessageRecord("ELC042001", user.getH01USR(), "0001");
			
			msg.setE01DDICUN(userPO.getCusNum().trim());
			msg.setE01CUSNME(userPO.getCusName().trim());			
			ELEERRMessage msgError = new ELEERRMessage();
			msg.setE01DDIMDA("USD");
			putDataInSession(session, msgError, userPO, "msg", msg);
			forward("ELC0420_declaration_basic.jsp", req, res);
		} finally {
			if(mp != null) mp.close();
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procReqList(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws IOException, ServletException {
		String PageToCall = "";
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = getMessageProcessor("ELC0420", req);
		try {
			initTransaction(userPO, String.valueOf(screen), "");
			ELC042001Message msg = (ELC042001Message) mp.getMessageRecord("ELC042001", user.getH01USR(), "0015");
			String customer = "";
			try {
				customer = req.getParameter("E01DDIRUT");
				if (customer == null) customer = userPO.getCusNum();
			} catch (Exception e) {
				customer = userPO.getCusNum();
			}
			userPO.setCusNum(customer);
			msg.setE01DDICUN(customer);
			mp.sendMessage(msg);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			JBObjList list = (JBObjList) mp.receiveMessageRecordList("E01INDOPE");
			if (mp.hasError(msgError)) {
				//msgError = (ELEERRMessage) mp.getError(list);
				if (screen == 1600) {
					PageToCall = "ELC0420_declaration_help.jsp";
				} else {
					PageToCall = "ELC0420_enter_customer.jsp";
				}
			} else {
				list.initRow();
				if (list.getNextRow()) {
					msg = (ELC042001Message) list.getRecord();
					userPO.setCusNum(msg.getE01DDICUN().trim());
					userPO.setCusName(msg.getE01CUSNME().trim());
				}
				if (screen == 1600) {
					PageToCall = "ELC0420_declaration_help.jsp";
				} else {
					PageToCall = "ELC0420_declaration_list.jsp";
				}
			}
			putDataInSession(session, msgError, userPO, "msgList", list);
			forward(PageToCall, req, res);
			
		} finally {
			if(mp != null) mp.close();
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procReqSearch(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		putDataInSession(session, null, null, null, null);
		forward("ELC0420_enter_customer.jsp", req, res);
	}

	private void initTransaction(
		UserPos userPO,
		String optMenu,
		String purpose) {
		try {
			if (!optMenu.equals(""))
				userPO.setOption(optMenu);
			if (!purpose.equals(""))
				userPO.setPurpose(purpose);

		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}
		try {
		} catch (Exception ex) {
			flexLog("Error getting userPO from session: " + ex);
		}
	}

	private void putDataInSession(
		HttpSession session,
		ELEERRMessage msgError,
		UserPos user,
		String name,
		Object obj) {
		try {
			flexLog("Putting java beans into the session");
			if (msgError != null)
				session.setAttribute("error", msgError);
			if (user != null)
				session.setAttribute("userPO", user);
			if (obj != null)
				session.setAttribute(name, obj);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error at putBeansInSession(): " + e);
			throw new RuntimeException("Socket Communication Error");
		}
	}

}