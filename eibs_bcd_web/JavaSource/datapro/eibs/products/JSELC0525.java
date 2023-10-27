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

import datapro.eibs.approval.JOApprovalRedirect;
import datapro.eibs.beans.EDI001002Message;
import datapro.eibs.beans.ELC040001Message;
import datapro.eibs.beans.ELC040002Message;
import datapro.eibs.beans.ELC040003Message;
import datapro.eibs.beans.ELC040004Message;
import datapro.eibs.beans.ELC050001Message;
import datapro.eibs.beans.ELC050002Message;
import datapro.eibs.beans.ELC050003Message;
import datapro.eibs.beans.ELC050004Message;
import datapro.eibs.beans.ELC050006Message;
import datapro.eibs.beans.ELC050009Message;
import datapro.eibs.beans.ELC051001Message;
import datapro.eibs.beans.ELC051002Message;
import datapro.eibs.beans.ELC051003Message;
import datapro.eibs.beans.ELC051004Message;
import datapro.eibs.beans.ELC051005Message;
import datapro.eibs.beans.ELC051006Message;
import datapro.eibs.beans.ELC052501Message;
import datapro.eibs.beans.ELC052502Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EPR040001Message;
import datapro.eibs.beans.ESD000002Message;
import datapro.eibs.beans.ESD000005Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSProp;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.MessageContext;
import datapro.eibs.sockets.MessageContextHandler;
import datapro.eibs.sockets.MessageRecord;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSELC0525 extends SuperServlet {

	String LangPath = "s/";
	
	public JSELC0525() {
		super();
	}
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}
	
	public void destroy() {
		flexLog("free resources used by JSELC0525");
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
				mc = new MessageContext(super.getMessageHandler("ELC0525", req));
						
				try {
					screen = Integer.parseInt(req.getParameter("SCREEN"));
					flexLog("Screen  Number: " + screen);
				} catch (Exception e) {
					flexLog("Screen set to default value");
				}
				
				String PageToCall = "";

				switch (screen) {
					case 3 : // ENTER / CALL (from side menu)
						requestList(mc, user, req, res, screen);
						break;
					case 0 : // MESSAGE SWIFT 
						requestMessageSwift(mc, user, req, res, screen);
						break;
					case 1 : // APPROVE (from LC list) and call list again
						requestFromList(mc, user, req, res, screen);
						break;
					case 2 : // DELETE (from LC list) and call list again
						requestDelete(mc, user, req, res, screen);
						break;
					case 4 : // REJECT (from LC list) and call list again
						rejectFromList(mc, user, req, res, screen);
						break;
					case 5 : // SELECT AN LC FROM THE LIST
						requestLetterOfCredit(mc, user, req, res, screen);
						break;
					/* CALL BASIC INFO PAGE */
					case 5001 : // for type LC commercial new
						requestNewComercial(mc, user, req, res, screen);
						break;
					case 5101 : // for type LC commercial maint
						requestMaintenanceComercial(mc, user, req, res, screen);
						break; 
					case 4001 : // for type LC stand by
						requestStandby(mc, user, req, res, screen);
						break; 
					/* CALL DOCUMENTS PAGE*/
					case 5002 :
						requestNewDocument(mc, user, req, res, screen);
						break; 
					case 5102 :
						requestMaintenanceDocument(mc, user, req, res, screen);
						break; 
					/* CALL DETAILS PAGE */
					case 5003 : // for type LC commercial new
						requestNewDetailComercial(mc, user, req, res, screen);
						break; 
					case 5103 : // for type LC commercial maint
						requestMaintenanceDetailComercial(mc, user, req, res, screen);
						break; 
					case 4003 : // for type LC stand by
						requestDetailStandby(mc, user, req, res, screen);
						break; 
					/* CALL SPECIAL INSTRUCTIONS PAGE */
					case 5004 :
					case 5104 :
					case 4004 :
						requestSpecialInstruction(mc, user, req, res, screen);
						break; 
					/* COMMISSIONS */
					case 5005 :
						requestNewCommission(mc, user, req, res, screen);
						break; 
					case 5105 :
						requestMaintenanceCommission(mc, user, req, res, screen);
						break; 
					case 4005 :
						requestStandbyCommission(mc, user, req, res, screen);
						break; 
					/* SPECIAL CODES */
					case 5006 :
					case 5106 :
					case 4006 :
						requestSpecialCodes(mc, user, req, res, screen);
						break; 
					/* ALL OTHER OPTIONS THAT USE ELC0**003 */
					case 40:
						requestStandbyOther(mc, user, req, res, screen);
						break; 
					case 50:
						requestNewOther(mc, user, req, res, screen);
						break; 
					case 51:
						requestMaintenanceOther(mc, user, req, res, screen);
						break; 
					case 5107 :
						procReqTransfer(mc, user, req, res, screen);
						break;
					case 5108 :
						procReqTransferCommission(mc, user, req, res, screen);
						break;
					case 5009 : // View Transactions
						requestViewTransactions(mc, user, req, res, screen);
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
				if (mc != null)  mc.close();
				flexLog("Socket used by JSELC0525 closed.");
			}
		}	
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void procReqTransferCommission(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);		
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC051005Message msg051005 = (ELC051005Message) session.getAttribute("msg051005");
			msg051005 = (ELC051005Message) msgHandle.initMessage(msg051005, user.getH01USR(), "0008");
			initTransaction(userPO, user, "LC", "INQUIRY");
			msg051005.setH05SCRCOD("01");
			msg051005.setE05LCMACC(userPO.getIdentifier());
			msgHandle.sendMessage(msg051005);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			msg051005 = (ELC051005Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "msg051005", msg051005, null);
			PageToCall = "ELC0525_lc_transfer_commissi.jsp";
			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void procReqTransfer(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);		
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC051005Message msg051005 = (ELC051005Message) msgHandle.initMessage("ELC051005", user.getH01USR(), "0002");
			String action = "INQUIRY";
			initTransaction(userPO, user, "LC", action);
			msg051005.setH05SCRCOD("01");
			msg051005.setE05LCMACC(userPO.getIdentifier());
			msgHandle.sendMessage(msg051005);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			msg051005 = (ELC051005Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "msg051005", msg051005, null);
			
			userPO.setHeader23(msg051005.getE05LCTNLC());
			session.setAttribute("userPO", userPO);
			
			PageToCall = "ELC0525_lc_transfer.jsp";
			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void requestMaintenanceOther(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);		
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC051003Message msg051003 = (ELC051003Message) msgHandle.initMessage("ELC051003", user.getH01USR(), "0002");
			initTransaction(userPO, user, "LC", "MAINTENANCE");
			msg051003.setE03LCDACC(userPO.getAccNum());
			msg051003.setE03LCDFCD(req.getParameter("fcode"));
			msgHandle.sendMessage(msg051003);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			msg051003 = (ELC051003Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "msg", msg051003, null);
			PageToCall = "ELC0525_lc_field_info_maint.jsp";
			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void requestNewOther(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);		
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC050003Message msg050003 = (ELC050003Message) msgHandle.initMessage("ELC050003", user.getH01USR(), "0002");
			initTransaction(userPO, user, "LC", "NEW");
			msg050003.setE03LCDACC(userPO.getAccNum());
			msg050003.setE03LCDFCD(req.getParameter("fcode"));
			msgHandle.sendMessage(msg050003);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			msg050003 = (ELC050003Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "msg", msg050003, null);
			PageToCall = "ELC0525_lc_field_info.jsp";
			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void requestStandbyOther(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);		
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC040003Message msg040003 = (ELC040003Message) msgHandle.initMessage("ELC040003", user.getH01USR(), "0002");
			msg040003.setE03LCDFCD(req.getParameter("fcode"));
			initTransaction(userPO, user, "LC", "");
			msg040003.setE03LCDACC(userPO.getAccNum());
			msgHandle.sendMessage(msg040003);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			msg040003 = (ELC040003Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "msg", msg040003, null);
			PageToCall = "ELC0525_sb_field_info.jsp";
			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void requestSpecialCodes(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);		
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ESD000002Message msgESD000002 = (ESD000002Message) msgHandle.initMessage("ESD000002", user.getH01USR(), "0002");
			initTransaction(userPO, user, "LC", "");
			msgESD000002.setH02OPE("0002");
			msgESD000002.setH02USR(user.getH01USR());
			msgESD000002.setE02ACC(userPO.getAccNum());
			msgESD000002.setH02PGM(req.getParameter("fcode"));
			msgESD000002.setH02SCR("01");
			msgHandle.sendMessage(msgESD000002);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			msgESD000002 = (ESD000002Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "msgESD000002", msgESD000002, null);
			switch (screen) {
				case 4006: PageToCall = "ELC0525_lc_special_codes_sb.jsp"; break;
				case 5006: PageToCall = "ELC0525_lc_special_codes.jsp"; break;
				default: PageToCall = "ELC0525_lc_special_codes_m.jsp"; break; 
			}
			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void requestStandbyCommission(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);		
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC040004Message msg040004 = (ELC040004Message) msgHandle.initMessage("ELC040004", user.getH01USR(), "0002");
			initTransaction(userPO, user, "LC", "NEW");
			msg040004.setH04SCRCOD("01");
			msg040004.setE04LCMACC(userPO.getAccNum());
			msg040004.setE04LCMPRO(userPO.getProdCode());
			msg040004.setE04LCMBNK(userPO.getBank());
			msgHandle.sendMessage(msg040004);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			msg040004 = (ELC040004Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "msg040004", msg040004, null);
			PageToCall = "ELC0525_lc_commissi_sb.jsp";
			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void requestMaintenanceCommission(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);		
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC051004Message msg051004 = (ELC051004Message) msgHandle.initMessage("ELC051004", user.getH01USR(), "0002");
			initTransaction(userPO, user, "LC", "MAINTENACE");
			msg051004.setH04SCRCOD("01");
			msg051004.setE04LCMACC(userPO.getAccNum());
			msg051004.setE04LCMPRO(userPO.getProdCode());
			msg051004.setE04LCMBNK(userPO.getBank());
			msgHandle.sendMessage(msg051004);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			msg051004 = (ELC051004Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "msg051004", msg051004, null);
			PageToCall = "ELC0525_lc_commissi_m.jsp";
			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void requestNewCommission(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);		
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC050004Message msg050004 = (ELC050004Message) msgHandle.initMessage("ELC050004", user.getH01USR(), "0002");
			initTransaction(userPO, user, "LC", "NEW");
			msg050004.setH04SCRCOD("01");
			msg050004.setE04LCMACC(userPO.getAccNum());
			msg050004.setE04LCMPRO(userPO.getProdCode());
			msg050004.setE04LCMBNK(userPO.getBank());
			msgHandle.sendMessage(msg050004);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			msg050004 = (ELC050004Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "msg050004", msg050004, null);
			PageToCall = "ELC0525_lc_commissi.jsp";
			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void requestSpecialInstruction(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);		
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ESD000005Message msgESD000005 = (ESD000005Message) msgHandle.initMessage("ESD000005", user.getH01USR(), "0002");
			initTransaction(userPO, user, "LC", "");
			msgESD000005.setH05TIM(getTimeStamp());
			msgESD000005.setH05OPE("0002");
			msgESD000005.setH05USR(user.getH01USR());
			msgESD000005.setE05ACC(userPO.getAccNum());
			msgESD000005.setH05PGM(req.getParameter("fcode"));
			msgESD000005.setH05SCR("01");
			msgESD000005.setE05ACD("40");
			msgHandle.sendMessage(msgESD000005);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			msgESD000005 = (ESD000005Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "msgESD000005", msgESD000005, null);
			switch (screen) {
				case 4004: PageToCall = "ELC0525_lc_special_inst_sb.jsp"; break;
				case 5004: PageToCall = "ELC0525_lc_special_inst.jsp"; break;
				default: PageToCall = "ELC0525_lc_special_inst_m.jsp"; break; 
			}
			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void requestDetailStandby(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);		
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC040002Message msg040002 = (ELC040002Message) msgHandle.initMessage("ELC040002", user.getH01USR(), "0002");
			initTransaction(userPO, user, "LC", "NEW");
			msg040002.setE02LCMACC(userPO.getAccNum());
			msgHandle.sendMessage(msg040002);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			msg040002 = (ELC040002Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "msg040002", msg040002, null);
			PageToCall = "ELC0525_lc_details_sb.jsp";
			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void requestMaintenanceDetailComercial(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);		
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC051002Message msg051002 = (ELC051002Message) msgHandle.initMessage("ELC051002", user.getH01USR(), "0004");
			initTransaction(userPO, user, "LC", "INQUIRY");
			msg051002.setE02LCMACC(userPO.getAccNum());
			msg051002.setH02FLGWK1("A");
			msgHandle.sendMessage(msg051002);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			msg051002 = (ELC051002Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "msg051002", msg051002, null);
			PageToCall = "ELC0525_lc_details_m.jsp";
			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void requestNewDetailComercial(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);		
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC050002Message msg050002 = (ELC050002Message) msgHandle.initMessage("ELC050002", user.getH01USR(), "0002");
			initTransaction(userPO, user, "LC", "NEW");
			msg050002.setE02LCMACC(userPO.getAccNum());
			msgHandle.sendMessage(msg050002);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			msg050002 = (ELC050002Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "msg050002", msg050002, null);
			PageToCall = "ELC0525_lc_details.jsp";
			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void requestMaintenanceDocument(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);		
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC051006Message msg051006 = (ELC051006Message) msgHandle.initMessage("ELC051006", user.getH01USR(), "0002");
			initTransaction(userPO, user, "LC", "MAINTENANCE");
			msg051006.setH06SCRCOD("01");
			msg051006.setE06LCMACC(userPO.getAccNum());
			msg051006.setE06LCMPRO(userPO.getProdCode());
			msg051006.setE06LCMBNK(userPO.getBank());
			msgHandle.sendMessage(msg051006);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			msg051006 = (ELC051006Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "msg051006", msg051006, null);
			PageToCall = "ELC0525_lc_documents_m.jsp";
			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void requestNewDocument(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);		
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC050006Message msg050006 = (ELC050006Message) msgHandle.initMessage("ELC050006", user.getH01USR(), "0002");
			initTransaction(userPO, user, "LC", "NEW");
			msg050006.setH06SCRCOD("01");
			msg050006.setE06LCMACC(userPO.getAccNum());
			msg050006.setE06LCMPRO(userPO.getProdCode());
			msg050006.setE06LCMBNK(userPO.getBank());
			msgHandle.sendMessage(msg050006);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			msg050006 = (ELC050006Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "msg050006", msg050006, null);
			PageToCall = "ELC0525_lc_documents.jsp";
			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void requestStandby(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);		
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC040001Message msg040001 = (ELC040001Message) msgHandle.initMessage("ELC040001", user.getH01USR(), "0002");
			initTransaction(userPO, user, "LC", "NEW");
			msg040001.setE01LCMACC(userPO.getAccNum());
			msgHandle.sendMessage(msg040001);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			msg040001 = (ELC040001Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "msg040001", msg040001, null);
			PageToCall = (userPO.getType().equals("R") ? "ELC0525_lc_opening_incoming_sb.jsp" : "ELC0525_lc_opening_outgoing_sb.jsp");
			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void requestMaintenanceComercial(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);		
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC051001Message msg051001 = (ELC051001Message) msgHandle.initMessage("ELC051001", user.getH01USR(), "0004");
			initTransaction(userPO, user, "LC", "INQUIRY");
			msg051001.setE01LCMACC(userPO.getAccNum());
			msg051001.setH01FLGWK1("A");
			msgHandle.sendMessage(msg051001);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			msg051001 = (ELC051001Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "msg051001", msg051001, null);
			PageToCall = (userPO.getType().equals("I") ? "ELC0525_lc_opening_export_m.jsp" : "ELC0525_lc_opening_import_m.jsp");
			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void requestNewComercial(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);		
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC050001Message msg050001 = (ELC050001Message) msgHandle.initMessage("ELC050001", user.getH01USR(), "0002");
			initTransaction(userPO, user, "LC", "NEW");
			msg050001.setE01LCMACC(userPO.getAccNum());
			msgHandle.sendMessage(msg050001);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			msg050001 = (ELC050001Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "msg050001", msg050001, null);
			PageToCall = (userPO.getType().equals("I") ? "ELC0525_lc_opening_export.jsp" : "ELC0525_lc_opening_import.jsp");
			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void requestLetterOfCredit(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);		
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			try {
				userPO.setIdentifier(req.getParameter("E01LCMACC").trim());
			} catch (Exception e) {
			}
			try {
				userPO.setAccNum(req.getParameter("E01LCMACC").trim());
			} catch (Exception e) {
			}
			try {
				userPO.setType(req.getParameter("E01LCMTYP").trim());
			} catch (Exception e) {
			}
			try {
				userPO.setPurpose(req.getParameter("E01LCMOPT").trim());
			} catch (Exception e) {
			}
		
			if (userPO.getType().equals("I") || userPO.getType().equals("O")) {
				/******************************************** COMMERCIAL LC ********************************************/
				if (userPO.getPurpose().equals("N")) {
					/********************************** NEW *************************************/
					ELC050001Message msg050001 = (ELC050001Message) msgHandle.initMessage("ELC050001", user.getH01USR(), "0004");
					initTransaction(userPO, user, "LC", "NEW");
					msg050001.setE01LCMACC(userPO.getAccNum());
					msgHandle.sendMessage(msg050001);
					ELEERRMessage msgError = msgHandle.receiveErrorMessage();
					msg050001 = (ELC050001Message) msgHandle.receiveMessage();
					putDataInSession(session, userPO, msgError, "msg050001", msg050001, null);
					PageToCall = (userPO.getType().equals("I") ? "ELC0525_lc_opening_export.jsp" : "ELC0525_lc_opening_import.jsp");
				} else {
					/********************************* MAINTENANCE ************************************/
					ELC051001Message msg051001 = (ELC051001Message) msgHandle.initMessage("ELC051001", user.getH01USR(), "0004");
					initTransaction(userPO, user, "LC", "MAINTENANCE");
					msg051001.setE01LCMACC(userPO.getAccNum());
					msg051001.setH01FLGWK1("A");
					msgHandle.sendMessage(msg051001);
					ELEERRMessage msgError = msgHandle.receiveErrorMessage();
					msg051001 = (ELC051001Message) msgHandle.receiveMessage();
					userPO.setAccOpt(msg051001.getE01LCMOPT());
					putDataInSession(session, userPO, msgError, "msg051001", msg051001, null);
					PageToCall = (userPO.getType().equals("I") ? "ELC0525_lc_opening_export_m.jsp" : "ELC0525_lc_opening_import_m.jsp");
				}
			} else {
				/********************************************* STANDBY LC *********************************************/
				ELC040001Message msg040001 = (ELC040001Message) msgHandle.initMessage("ELC040001", user.getH01USR(), "0004");
				initTransaction(userPO, user, "LC", "");
				msg040001.setE01LCMACC(userPO.getAccNum());
				msgHandle.sendMessage(msg040001);
				ELEERRMessage msgError = msgHandle.receiveErrorMessage();
				msg040001 = (ELC040001Message) msgHandle.receiveMessage();
				putDataInSession(session, userPO, msgError, "msg040001", msg040001, null);
				PageToCall = (userPO.getType().equals("R") ? "ELC0525_lc_opening_incoming_sb.jsp" : "ELC0525_lc_opening_outgoing_sb.jsp");
			}
			callPage(PageToCall, req, res);
			
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void requestDelete(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);		
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC052502Message msg052502 = (ELC052502Message) msgHandle.initMessage("ELC052502", user.getH01USR(), "0002");
			initTransaction(userPO, user, "LC", "DELETE");
			try {
				msg052502.setE02LCMACC(req.getParameter("E01LCMACC").trim());
			} catch (Exception e) {
				msg052502.setE02LCMACC(userPO.getAccNum());
			}
			msg052502.setE02ACTION("D");
			try {
				msg052502.setE02MSGTXT(req.getParameter("reason"));
			 	flexLog("Text: " + req.getParameter("reason"));
			}
			catch (Exception e) {}
			msgHandle.sendMessage(msg052502);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			if (isNotError) {
				requestList(mc, user, req, res, screen);
			} else {
				callPage("ELC0525_approval_letter_of_credit_list.jsp", req, res);
			}				
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void requestFromList(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);		
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC052502Message msg052502 = (ELC052502Message) msgHandle.initMessage("ELC052502", user.getH01USR(), "0002");
			initTransaction(userPO, user, "LC", "");
			try {
				msg052502.setE02LCMACC(req.getParameter("E01LCMACC").trim());
			} catch (Exception e) {
				msg052502.setE02LCMACC(userPO.getAccNum());
			}
			msg052502.setE02ACTION("A");
			try {
				msg052502.setE02MSGTXT(req.getParameter("reason").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			msgHandle.sendMessage(msg052502);
			
			ELEERRMessage msgError = null;
			MessageRecord msg = null;
			EDI001002Message msgImg = null;
			do {
				msg = msgHandle.receiveErrorMessage();
				if (msg.getFormatName().equals("EDI001002")) { //Update SQL Images
					msgImg = (EDI001002Message) msg;
				}
			} while (!msg.getFormatName().equals("ELEERR"));
			
			msgError = (ELEERRMessage) msg;
			
			session.setAttribute("error", msgError);
			boolean isNotError = msgError.getERRNUM().equals("0");
			if (isNotError) {
				if (msgImg != null) {
					//Update SQL Images
					JOApprovalRedirect action = new JOApprovalRedirect(req, res, msgImg.getE02DCIACD(), msgImg.getE02DCIACC());
					action.action(msgImg.getE02DCITYP(), msgImg.getH02FLGWK3(), "/servlet/datapro.eibs.products.JSELC0525?SCREEN=3");
				} else {
					requestList(mc, user, req, res, screen);
				}
			} else {
				callPage("ELC0525_approval_letter_of_credit_list.jsp", req, res);
			}				
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void rejectFromList(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);		
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC052502Message msg052502 = (ELC052502Message) msgHandle.initMessage("ELC052502", user.getH01USR(), "0002");
			initTransaction(userPO, user, "LC", "");
			try {
				msg052502.setE02LCMACC(req.getParameter("E01LCMACC").trim());
			} catch (Exception e) {
				msg052502.setE02LCMACC(userPO.getAccNum());
			}
			msg052502.setE02ACTION("R");
			try {
				msg052502.setE02MSGTXT(req.getParameter("reason").trim());
			 	flexLog("Text: " + req.getParameter("reason"));
			}
			catch (Exception e) {}
			msgHandle.sendMessage(msg052502);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			if (isNotError) {
				requestList(mc, user, req, res, screen);
			} else {
				callPage("ELC0525_approval_letter_of_credit_list.jsp", req, res);
			}				
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void requestMessageSwift(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);		
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			EPR040001Message msg040001 = (EPR040001Message) msgHandle.initMessage("EPR040001", user.getH01USR(), "0002");
			initTransaction(userPO, user, "LC", "");
			try {
				msg040001.setE01SWOACC(req.getParameter("E01LCMACC").trim());
			} catch (Exception e) {
				msg040001.setE01SWOACC(userPO.getAccNum());
			}
			msgHandle.sendMessage(msg040001);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			if (isNotError) {
				requestList(mc, user, req, res, screen);
			}				
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void requestList(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);		
		String PageToCall = "";
		
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC052501Message msg052501 = (ELC052501Message) msgHandle.initMessage("ELC052501", user.getH01USR(), "0015");
			initTransaction(userPO, user, "LC", "");
			msg052501.setH01SCRCOD("01");
			
			setMessageField(msg052501, "E01LCMNAP", req.getParameter("nivAp"));			
			
		 	//msg052501.setE01LCMNAP(nivAp);
			msgHandle.sendMessage(msg052501);
			JBObjList jbList = msgHandle.receiveMessageList("H01FLGMAS", JSEIBSProp.getMaxIterations());
			ELEERRMessage msgError = new ELEERRMessage();
			if (jbList.isEmpty()) {
				PageToCall = "MISC_no_result.jsp";
			} else {
				putDataInSession(session, userPO, msgError, "msg052501", msg052501, jbList);
				PageToCall = "ELC0525_approval_letter_of_credit_list.jsp";
			}
			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	private void initTransaction(UserPos userPO, ESS0030DSMessage user, String optMenu, String purpose) {
		try {
			if (!optMenu.equals("")) userPO.setOption(optMenu);
			if (!purpose.equals("")) userPO.setPurpose(purpose);
			userPO.setID(user.getE01INT()); //Country Code
			
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}
		try {
		} catch (Exception ex) {
			flexLog("Error getting userPO from session: " + ex);
		}
	}
	
	public void callPage(String page, HttpServletRequest req, HttpServletResponse res) {
		try {
			super.callPage(LangPath + page, req, res);
		} catch (Exception e) {
			flexLog("Exception calling page " + e.toString() + e.getMessage());
		}
		return; 
	}
	
	private void putDataInSession(HttpSession session, UserPos userPO, ELEERRMessage msgError, String msg_name, MessageRecord msg, JBObjList jbList) {
		try {
			flexLog("Putting java beans into the session");

			session.setAttribute("error", msgError);
			if (msg.getFormatName().equals("ELC040001")) {
				userPO.setHeader2(((ELC040001Message) msg).getE01DSCPRO());
				userPO.setHeader14(((ELC040001Message) msg).getE01DSCPRO());
				userPO.setBank(((ELC040001Message) msg).getE01LCMBNK());
				userPO.setProdCode(((ELC040001Message) msg).getE01LCMPRO());
			} else {
				if (msg.getFormatName().equals("ELC050001")) {
					userPO.setHeader2(((ELC050001Message) msg).getE01DSCPRO());
					userPO.setHeader14(((ELC050001Message) msg).getE01DSCPRO());
					userPO.setBank(((ELC050001Message) msg).getE01LCMBNK());
					userPO.setProdCode(((ELC050001Message) msg).getE01LCMPRO());
				} else {
					if (msg.getFormatName().equals("ELC051001")) {
						userPO.setHeader2(((ELC051001Message) msg).getE01DSCPRO());
						userPO.setHeader14(((ELC051001Message) msg).getE01DSCPRO());
						userPO.setBank(((ELC051001Message) msg).getE01LCMBNK());
						userPO.setProdCode(((ELC051001Message) msg).getE01LCMPRO());
					}	
				}
			}
			session.setAttribute("userPO", userPO);
			if (msg != null) session.setAttribute(msg_name, msg);
			if (jbList != null) session.setAttribute("jbList", jbList);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error at putBeansInSession(): " + e);
			throw new RuntimeException("Socket Communication Error");
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void requestViewTransactions(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);		
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC050009Message msg = (ELC050009Message) msgHandle.initMessage("ELC050009", user.getH01USR(), "");
			msg.setH09SCRCOD("01");
			msg.setE09LCMACC(userPO.getIdentifier());
			msgHandle.sendMessage(msg);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			msg = (ELC050009Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "msg", msg, null);
			PageToCall = "ELC0525_view_lc_open_trans.jsp";
			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}	
	
}
