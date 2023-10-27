/*
 * Created on Sep 23, 2008
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
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

import datapro.eibs.beans.ELC050007Message;
import datapro.eibs.beans.ELC051007Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageContext;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSELC0500A extends JSEIBSServlet {

	protected static final int R_NEW_INFO = 1;
	protected static final int A_NEW_INFO = 2;
	protected static final int R_MAINT_INFO = 3;
	protected static final int A_MAINT_INFO = 4;
	protected static final int R_INQ_INFO = 5;
	protected static final int R_APP_NEW_INQ_INFO = 6;
	protected static final int R_APP_MAINT_INQ_INFO = 7;
	protected static final int R_LC_MAINT_INQ_INFO = 8;
	
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
		// TODO Auto-generated method stub
 
		switch (screen) {
			//New
			case R_NEW_INFO :
				reqNewAdditonalInfo(user, req, res, session, screen);
				break;
			case A_NEW_INFO :
				actNewAdditonalInfo(user, req, res, session, screen);
				break;
			//Maintenance	
			case R_MAINT_INFO :
				reqMaintAdditonalInfo(user, req, res, session, screen);
				break;
			case A_MAINT_INFO :
				actMaintAdditonalInfo(user, req, res, session, screen);
				break;
			//Inquiry	
			case R_INQ_INFO :
			case R_APP_NEW_INQ_INFO :
			case R_APP_MAINT_INQ_INFO :
			case R_LC_MAINT_INQ_INFO :
				reqInqAdditonalInfo(user, req, res, session, screen);
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
	private void reqInqAdditonalInfo(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = getMessageProcessor("ELC0510", req);
		try {
			String purpose = "";
			switch (screen) {
				case R_INQ_INFO :
					purpose = "INQUIRY";
					break;
				case R_APP_NEW_INQ_INFO :
					purpose = "APP_NEW";
					break;
				case R_APP_MAINT_INQ_INFO :
					purpose = "APP_MAINTENANCE";
					break;
				case R_LC_MAINT_INQ_INFO:
				    purpose = "LC_MAINTENANCE";
				break;
			}
			initTransaction(userPO, String.valueOf(screen), purpose);
			ELC051007Message msg07 = (ELC051007Message) mp.getMessageRecord("ELC051007", user.getH01USR(), "0004");
			msg07.setE07LCMACC(userPO.getIdentifier());
			mp.sendMessage(msg07);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg07 = (ELC051007Message) mp.receiveMessageRecord();
			putDataInSession(session, msgError, userPO, "msg07", msg07);
			forward("ELC0510_lc_additional_info.jsp", req, res);
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
	private void actMaintAdditonalInfo(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = getMessageProcessor("ELC0510", req);
		try {
			initTransaction(userPO, String.valueOf(screen), "");
			ELC051007Message msg07 = (ELC051007Message) mp.getMessageRecord("ELC051007", user.getH01USR(), "0005");
			setMessageRecord(req, msg07);
			mp.sendMessage(msg07);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg07 = (ELC051007Message) mp.receiveMessageRecord();
			putDataInSession(session, msgError, userPO, "msg07", msg07);
			if (isNotError) {
				res.sendRedirect(super.srctx + "/servlet/datapro.eibs.products.JSELC0510?SCREEN=3");
			} else {
				forward("ELC0510_lc_additional_info.jsp", req, res);
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
	private void reqMaintAdditonalInfo(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = getMessageProcessor("ELC0510", req);
		try {
			initTransaction(userPO, String.valueOf(screen), "MAINTENANCE");
			ELC051007Message msg07 = (ELC051007Message) mp.getMessageRecord("ELC051007", user.getH01USR(), "0002");
			msg07.setE07LCMACC(userPO.getIdentifier());
			mp.sendMessage(msg07);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg07 = (ELC051007Message) mp.receiveMessageRecord();
			putDataInSession(session, msgError, userPO, "msg07", msg07);
			forward("ELC0510_lc_additional_info.jsp", req, res);
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
	private void actNewAdditonalInfo(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = getMessageProcessor("ELC0500", req);
		try {
			initTransaction(userPO, String.valueOf(screen), "");
			ELC050007Message msg07 = (ELC050007Message) mp.getMessageRecord("ELC050007", user.getH01USR(), "0005");
			setMessageRecord(req, msg07);
			mp.sendMessage(msg07);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg07 = (ELC050007Message) mp.receiveMessageRecord();
			putDataInSession(session, msgError, userPO, "msg07", msg07);
			if (isNotError) {
				res.sendRedirect(super.srctx + "/servlet/datapro.eibs.products.JSELC0500?SCREEN=3");
			} else {
				forward("ELC0500_lc_additional_info.jsp", req, res);
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
	private void reqNewAdditonalInfo(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = getMessageProcessor("ELC0500", req);
		try {
			initTransaction(userPO, String.valueOf(screen), "NEW");
			ELC050007Message msg07 = (ELC050007Message) mp.getMessageRecord("ELC050007", user.getH01USR(), "0002");
			msg07.setE07LCMACC(userPO.getIdentifier());
			mp.sendMessage(msg07);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msg07 = (ELC050007Message) mp.receiveMessageRecord();
			putDataInSession(session, msgError, userPO, "msg07", msg07);
			forward("ELC0500_lc_additional_info.jsp", req, res);
		} finally {
			if(mp != null) mp.close();
		}
	}

	private void initTransaction(UserPos userPO, String optMenu, String purpose) {
		if (!optMenu.equals("")) userPO.setOption(optMenu);
		if (!purpose.equals("")) userPO.setPurpose(purpose);
	}
	
	private void putDataInSession(HttpSession session, ELEERRMessage msgError, UserPos user, String name, Object obj) {
		flexLog("Putting java beans into the session");
		if (msgError != null) session.setAttribute("error", msgError);
		if (user != null) session.setAttribute("userPO", user);
		if (obj != null) session.setAttribute(name, obj);
	}

}
