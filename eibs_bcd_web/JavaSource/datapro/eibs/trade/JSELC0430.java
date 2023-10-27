
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

import datapro.eibs.beans.ELC043001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageContext;
import datapro.eibs.sockets.MessageRecord;

public class JSELC0430 extends JSEIBSServlet {
	
	protected static final int R_SEARCH 	= 1;
	protected static final int R_LIST 		= 1500;
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
		MessageProcessor mp = getMessageProcessor("ELC0430", req);
		try {
			initTransaction(userPO, String.valueOf(screen), "INQUIRY");
			ELC043001Message msg = (ELC043001Message) getMessageRecord(req, session);
			putDataInSession(session, null, userPO, "msg", msg);
			forward("ELC0430_declaration_basic.jsp", req, res);
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
	private void procActionDelete(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = getMessageProcessor("ELC0430", req);
		try {
			initTransaction(userPO, String.valueOf(screen), "DELETE");
			ELC043001Message msg = (ELC043001Message) getMessageRecord(req, session);
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
		MessageProcessor mp = getMessageProcessor("ELC0430", req);
		try {
			initTransaction(userPO, String.valueOf(screen), "");
			ELC043001Message msg = (ELC043001Message) session.getAttribute("msg");
			setMessageRecord(req, msg);
			mp.sendMessage(msg);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg = (ELC043001Message) mp.receiveMessageRecord();
			if (mp.hasError(msgError)) {
				putDataInSession(session, msgError, userPO, "msg", msg);
				forward("ELC0430_declaration_basic.jsp", req, res);
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
		ELC043001Message msg = (ELC043001Message) getMessageRecord(req, session);
		msg.setH01OPECOD("0005"); //Maintenance
		putDataInSession(session, null, userPO, "msg", msg);
		forward("ELC0430_declaration_basic.jsp", req, res);
	}

	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 */
	private void procReqNew(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws IOException, ServletException {
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = getMessageProcessor("ELC0430", req);
		try {
			initTransaction(userPO, String.valueOf(screen), "NEW");
			ELC043001Message msg = (ELC043001Message) mp.getMessageRecord("ELC043001", user.getH01USR(), "0001");
			msg.setE01DIPACC(userPO.getAccNum().trim());
			msg.setE01DIPCOR(userPO.getIdentifier().trim());
			msg.setE01DDICUN(userPO.getCusNum().trim());
			msg.setE01CUSNME(userPO.getCusName().trim());
			ELEERRMessage msgError = new ELEERRMessage();
			putDataInSession(session, msgError, userPO, "msg", msg);
			forward("ELC0430_declaration_basic.jsp", req, res);
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
		MessageProcessor mp = getMessageProcessor("ELC0430", req);
		try {
			initTransaction(userPO, String.valueOf(screen), "");
			ELC043001Message msg = (ELC043001Message) mp.getMessageRecord("ELC043001", user.getH01USR(), "0015");
			String account = "";
			try {
				account = req.getParameter("E01DIPACC");
				if (account == null) account = userPO.getAccNum();
			} catch (Exception e) {
				account = "";
			}
			msg.setE01DIPACC(account);
			String correlative = "";
			try {
				correlative = req.getParameter("E01DIPCOR");
				if (correlative == null) correlative = "";
			} catch (Exception e) {
				correlative = "";
			}
			msg.setE01DIPCOR(correlative);
			String type = "";
			try {
				type = req.getParameter("H01FLGWK1");
				if (type == null) type = " ";
			} catch (Exception e) {
				type = " ";
			}
			msg.setH01FLGWK1(type);
			msg.setE01DIPCOR(correlative);
			mp.sendMessage(msg);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			JBObjList list = (JBObjList) mp.receiveMessageRecordList("E01INDOPE");
			if (mp.hasError(msgError)) {
				//msgError = (ELEERRMessage) mp.getError(list);
				PageToCall = "ELC0430_enter_account.jsp";
			} else {
				//msgError = new ELEERRMessage();
				list.initRow();
				if (list.getNextRow()) {
					msg = (ELC043001Message) list.getRecord();
					userPO.setCusNum(msg.getE01DDICUN().trim());
					userPO.setCusName(msg.getE01CUSNME().trim());
					userPO.setAccNum(msg.getE01DIPACC().trim());
					userPO.setIdentifier(msg.getE01DIPCOR().trim());
				} else {
					userPO.setAccNum(account);
					userPO.setIdentifier(correlative);
				}
				PageToCall = "ELC0430_declaration_list.jsp";
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
		UserPos userPO = getUserPos(req);
		String type = "";
		try {
			type = req.getParameter("FLAG");
			if (type == null) type = " ";
		} catch (Exception e) {
			type = " ";
		}
		userPO.setAccOpt(type);
		putDataInSession(session, null, userPO, null, null);
		forward("ELC0430_enter_account.jsp", req, res);
	}

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