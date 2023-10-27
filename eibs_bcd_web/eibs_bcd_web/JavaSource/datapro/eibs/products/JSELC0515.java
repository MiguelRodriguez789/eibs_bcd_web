/*
 * Created on Apr 8, 2008
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package datapro.eibs.products;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELC051501Message;
import datapro.eibs.beans.ELC051502Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.MessageContext;
import datapro.eibs.sockets.MessageRecord;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSELC0515 extends SuperServlet {

	String LangPath = "s/";
	
	private static final int R_SWIFT_LIST = 1;
	private static final int R_INQ_SWIFT = 2;
	private static final int A_APPROVAL_SWIFT = 3;
	private static final int A_DELETE 		= 9;
				
	public JSELC0515() {
		super();
	}
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}
	
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = (HttpSession) req.getSession(false);
		if (session == null) {
			try {
				res.setContentType("text/html");
				super.printLogInAgain(res.getWriter());
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Exception ocurred. Exception = " + e);
			}
		} else {
			int screen = -1;

			ESS0030DSMessage user = (datapro.eibs.beans.ESS0030DSMessage) session.getAttribute("currUser");
			// Here we should get the path from the user profile
			LangPath = rootPath + user.getE01LAN() + "/";
			
			MessageContext mc = null;
			try {
				mc = new MessageContext(super.getMessageHandler("ELC0515", req));
						
				try {
					screen = Integer.parseInt(req.getParameter("SCREEN"));
					flexLog("Screen  Number: " + screen);
				} catch (Exception e) {
					flexLog("Screen set to default value");
				}
				
				String PageToCall = "";

				switch (screen) {
					// Request
					case R_SWIFT_LIST :
						procReqIncomingSwiftList(mc, user, req, res, screen);
						break;
					case R_INQ_SWIFT :
						procReqIncomingSwiftInquiry(mc, user, req, res, screen);
						break;
					// Action
					case A_APPROVAL_SWIFT :
						procActionApprovalSwift(mc, user, req, res, screen);
						break;
					case A_DELETE :
						procActionDelete(mc, user, req, res, screen);
						break;
					default :
						PageToCall = "MISC_not_available.jsp";
						callPage(PageToCall, req, res);
						break;
				}

			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				res.sendRedirect(srctx + LangPath + sckNotRespondPage);
			} finally {
				if (mc != null) mc.close();
				flexLog("Socket used by JSELC0515 closed.");
			}
		}	
	}
	
	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void procActionApprovalSwift(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		JBObjList msgList = (JBObjList) session.getAttribute("msgList");
		int row = 0;
		try {
			row = Integer.parseInt(req.getParameter("CURRCODE"));
			MessageProcessor msgHandle = new MessageProcessor(mc);
			
			ELC051501Message msg01 = (ELC051501Message) msgList.get(row);
			msg01.setH01USERID(user.getH01USR());
			msg01.setH01OPECOD("0002");
			initTransaction(userPO, String.valueOf(screen), "");
			msg01.setH01SCRCOD("01");
			try {
				msg01.setE01LCMPRO(req.getParameter("PRODUCT").trim());
			} catch (Exception e) {
				msg01.setE01LCMPRO("");
			}
			msgHandle.sendMessage(msg01);
			ELEERRMessage msgError = (ELEERRMessage) msgHandle.receiveMessageRecord();
			msgHandle.hasError(msgError);
			msg01 = (ELC051501Message) msgHandle.receiveMessageRecord();
			if (!msgHandle.hasError(msgError)) {
				session.setAttribute("msgELC", msg01);
				if (msg01.getE01WAPFMT().equals("700")
						|| msg01.getE01WAPFMT().equals("710")) {
					if (msg01.getH01FLGWK2().equals("S") || msg01.getH01FLGWK2().equals("R")) {
						//stand by
						res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSELC0410?SCREEN=3&E01LCMACC=" + msg01.getE01LCMACC() + "&H01FLGMAS=N");							
					} else {
						//commercial
						res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSELC0510?SCREEN=3&E01LCMACC=" + msg01.getE01LCMACC() + "&H01FLGMAS=N");							
					}
				} else {
					procReqIncomingSwiftList(mc, user, req, res, screen);
				}
			} else {
				session.setAttribute("error", msgError);
				callPage("ELC0515_incoming_swift_list.jsp", req, res);
			}
		
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
	
	private void procActionDelete(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) 
		throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		JBObjList msgList = (JBObjList) session.getAttribute("msgList");
		try {
			MessageProcessor msgHandle = new MessageProcessor(mc);
			
			int row = Integer.parseInt(req.getParameter("CURRCODE"));
			ELC051501Message msgDeleted = (ELC051501Message) msgList.get(row);
			
			ELC051501Message msg01 = (ELC051501Message) mc.getMessageRecord("ELC051501");
			msg01.setH01USERID(user.getH01USR());
			msg01.setH01OPECOD("0009");
			
			msg01.setE01WAPRBK(msgDeleted.getE01WAPRBK());
			msg01.setE01WAPRNO(msgDeleted.getE01WAPRNO());
			msg01.setE01WAPRRF(msgDeleted.getE01WAPRRF());
			msg01.setE01WAPSBK(msgDeleted.getE01WAPSBK());
			msg01.setE01WAPSRF(msgDeleted.getE01WAPSRF());
			
			msgHandle.sendMessage(msg01);
			MessageRecord newmessage = msgHandle.receiveMessageRecord();
			if (msgHandle.hasError(newmessage)) {
				session.setAttribute("error", newmessage);
				callPage("ELC0515_incoming_swift_list.jsp", req, res);
			} else {
				procReqIncomingSwiftList(mc, user, req, res, screen);
			}
		
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void procReqIncomingSwiftInquiry(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		try {
			initTransaction(userPO, String.valueOf(screen), "");
			MessageProcessor msgHandle = new MessageProcessor(mc);
			ELC051502Message msg02 = (ELC051502Message) mc.getMessageRecord("ELC051502");
			msg02.setH02USERID(user.getH01USR());
			msg02.setH02OPECOD("0005");
			try {
				msg02.setE02SWIRNO(req.getParameter("RNO"));
			} catch (Exception e) {
				msg02.setE02SWIRNO("");
			}
			try {
				msg02.setE02SWIRBK(req.getParameter("RBK"));
			} catch (Exception e) {
				msg02.setE02SWIRBK("");
			}
			msgHandle.sendMessage(msg02);
			JBObjList jbList = msgHandle.receiveMessageRecordList("H02FLGMAS");
			if (!msgHandle.hasError(jbList)) {
				session.setAttribute("msgSwift", jbList);
				callPage("ELC0515_inq_incoming_swift_message.jsp", req, res);
			} else {
				session.setAttribute("error", msgHandle.getError(jbList));
				callPage("error_viewer.jsp", req, res);
			}
		
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void procReqIncomingSwiftList(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		try {
			MessageProcessor msgHandle = new MessageProcessor(mc);
			ELC051501Message msg01 = (ELC051501Message) mc.getMessageRecord("ELC051501");
			msg01.setH01USERID(user.getH01USR());
			msg01.setH01OPECOD("0015");
			initTransaction(userPO, String.valueOf(screen), "");
			msg01.setH01SCRCOD("01");
			try {
				msg01.setE01NUMREC(req.getParameter("Pos"));
			} catch (Exception ex) {
				msg01.setE01NUMREC("0");
			}
			msgHandle.sendMessage(msg01);
			
			JBObjList jbList = msgHandle.receiveMessageRecordList("E01INDOPE");
			
			if (!msgHandle.hasError(jbList)) {
				session.setAttribute("msgList", jbList);
				callPage("ELC0515_incoming_swift_list.jsp", req, res);
			} else {
				session.setAttribute("error", msgHandle.getError(jbList));
				callPage("ELC0510_lc_enter_maint.jsp", req, res);
			}
		
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

	private void initTransaction(UserPos userPO, String optMenu, String purpose) {
		userPO.setOption(optMenu);
		userPO.setPurpose(purpose);
	}
	
	public void callPage(String page, HttpServletRequest req, HttpServletResponse res) {
		try {
			super.callPage(LangPath + page, req, res);
		} catch (Exception e) {
			flexLog("Exception calling page " + e.toString() + e.getMessage());
		}
		return; 
	}

}
