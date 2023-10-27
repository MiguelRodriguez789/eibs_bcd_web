/*
 * Created on Jul 27, 2010
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package datapro.eibs.trade;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELC056501Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWP001001Message;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSELC0565 extends JSEIBSServlet {

	/* (non-Javadoc)
	 * @see datapro.eibs.master.JSEIBSServlet#processRequest(datapro.eibs.beans.ESS0030DSMessage, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, javax.servlet.http.HttpSession, int)
	 */
	protected void processRequest(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession session,
		int screen)
		throws ServletException, IOException {
			
		switch (screen) {
			case 1 : // Enter (Control de Documentos Recibidos)
				forward("ELC0565_lc_doc_enter.jsp", req, res);
				break;
			case 4 : // CALL LC DOCUMENTS MAINT
				requestMaintenance(user, req, res, session, screen);
				break;
			case 5 :
				requestActionUpdate(user, req, res, session, screen);
				break;
			case 25 :
				requestActionPrint(user, req, res, session, screen);
				break;
			case 1111 :
				requestMaintenanceHelp(user, req, res, session, screen);
				break;
			default :
				forward("MISC_not_available.jsp", req, res);
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
	private void requestActionPrint(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		String PageToCall = "";
		UserPos userPO = getUserPos(req);
		userPO.setOption(String.valueOf(screen));
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("ELC0565");
			ELC056501Message msg = (ELC056501Message) mp.getMessageRecord("ELC056501", user.getH01USR(), "0025");
			
			setMessageRecord(req, msg);
			
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ELC056501Message) mp.receiveMessageRecord("ELC056501");
			
			if (mp.hasError(msg)) {
				flexLog("Putting java beans into the session");
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				session.setAttribute("msg01", msg);
				PageToCall = "ELC0565_lc_doc_info.jsp";
			} else {
				PageToCall = "ELC0565_lc_doc_enter.jsp";
			}
			
			forward("ELC0565_lc_doc_info.jsp", req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}

	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 * @param screen
	 */
	private void requestMaintenanceHelp(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		String clause = req.getParameter("E01CLSCDE") == null ? "" : req.getParameter("E01CLSCDE"); 
		String text = req.getParameter("E01CLSTXN") == null ? "" : req.getParameter("E01CLSTXN"); 
		String description = req.getParameter("E01CLSDSC") == null ? "" : req.getParameter("E01CLSDSC"); 
		
		JBObjList jbList = (JBObjList) session.getAttribute("jbList");
		
		jbList.initRow();
		while (jbList.getNextRow()) {
			EWP001001Message bean = (EWP001001Message) jbList.getRecord(); 
			if (bean.getE01CLSCDE().equals(clause) && bean.getE01CLSTXN().equals(text)) {
				ELC056501Message msg = (ELC056501Message) session.getAttribute("msg01");
				if (msg != null) {
					if (msg.getE01PMTI01().trim().equals("")) {
						msg.setE01PMTI01(bean.getE01CLSL01().trim());
						msg.setE01PMTI02(bean.getE01CLSL02().trim());
					} else if (msg.getE01PMTI03().trim().equals("")) {
						msg.setE01PMTI03(bean.getE01CLSL01().trim());
						msg.setE01PMTI04(bean.getE01CLSL02().trim());
					} else if (msg.getE01PMTI05().trim().equals("")) {
						msg.setE01PMTI05(bean.getE01CLSL01().trim());
						msg.setE01PMTI06(bean.getE01CLSL02().trim());
					}	
					flexLog("Putting java beans into the session");
					session.setAttribute("msg01", msg);
			
					forward("ELC0565_lc_doc_info.jsp", req, res);
				}
				break;
			}
		}
	}

	/**
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 * @param screen
	 */
	private void requestActionUpdate(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		userPO.setOption(String.valueOf(screen));
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("ELC0565");
			ELC056501Message msg = (ELC056501Message) mp.getMessageRecord("ELC056501", user.getH01USR(), "0005");
			
			setMessageRecord(req, msg);
			
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ELC056501Message) mp.receiveMessageRecord("ELC056501");

			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("msg01", msg);
			
			forward("ELC0565_lc_doc_info.jsp", req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param session
	 * @param screen
	 */
	private void requestMaintenance(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		String PageToCall = "";
		UserPos userPO = getUserPos(req);
		userPO.setOption(String.valueOf(screen));
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor("ELC0565");
			ELC056501Message msg = (ELC056501Message) mp.getMessageRecord("ELC056501", user.getH01USR(), "0002");
			String account = req.getParameter("E01LCMACC") == null ? userPO.getAccNum() : req.getParameter("E01LCMACC");
			msg.setE01LCRNUM(account);
			userPO.setAccNum(account);
			String drwnum = req.getParameter("E01LCMACC0") == null ? userPO.getHeader1() : req.getParameter("E01LCMACC0");
			msg.setE01DRWNUM(drwnum);
			userPO.setHeader1(drwnum);
			String ttrdoc = req.getParameter("E01TTRDOC") == null ? userPO.getHeader2() : req.getParameter("E01TTRDOC");
			msg.setE01TTRDOC(ttrdoc);
			userPO.setHeader2(ttrdoc);
			
			mp.sendMessage(msg);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msg = (ELC056501Message) mp.receiveMessageRecord("ELC056501");

			if (mp.hasError(msgError)) {
				PageToCall = "ELC0565_lc_doc_enter.jsp";
			} else {
				PageToCall = "ELC0565_lc_doc_info.jsp";
			}

			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("msg01", msg);
			
			forward(PageToCall, req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

}
