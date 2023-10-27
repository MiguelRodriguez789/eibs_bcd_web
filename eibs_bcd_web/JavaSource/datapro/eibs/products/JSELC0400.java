/*
 * Created on Apr 7, 2008
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package datapro.eibs.products;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELC040001Message;
import datapro.eibs.beans.ELC040002Message;
import datapro.eibs.beans.ELC040003Message;
import datapro.eibs.beans.ELC040004Message;
import datapro.eibs.beans.ELC040011Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD000002Message;
import datapro.eibs.beans.ESD000005Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
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
public class JSELC0400 extends SuperServlet {

	String LangPath = "s/";
	
	protected static final int R_OPENING_NEW = 1;
	protected static final int A_OPENING_NEW = 2;
	protected static final int R_OPENING_MAINT = 3;
	protected static final int A_OPENING_MAINT = 4;
	protected static final int R_DETAILS = 5;
	protected static final int A_DETAILS = 6;
	protected static final int R_COMMISSI = 7;
	protected static final int A_COMMISSI = 8;
	
	private static final int R_LC_CLONING = 100;
	private static final int A_LC_CLONING = 110;

	protected static final int R_ENTER_MAINT = 200;
	protected static final int R_SPECIAL_CODES = 101;
	protected static final int A_SPECIAL_CODES = 102;
	protected static final int R_SPECIAL_INST = 103;
	protected static final int A_SPECIAL_INST = 104;
	protected static final int R_FIELDS = 50;
	protected static final int A_FIELDS = 2000;

	private static final int R_COMM_COLLAT_REQ = 701;
	private static final int A_COMM_COLLAT_REQ = 702;	
	
	public JSELC0400() {
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
				mc = new MessageContext(super.getMessageHandler("ELC0400", req));
						
				try {
					screen = Integer.parseInt(req.getParameter("SCREEN"));
					flexLog("Screen  Number: " + screen);
				} catch (Exception e) {
					flexLog("Screen set to default value");
				}
				
				String PageToCall = "";

				switch (screen) {
					case R_ENTER_MAINT :
						procReqEnterMaint(mc, user, req, res, screen);
						break;
					case R_OPENING_NEW :
						procReqOpeningNew(mc, user, req, res, screen);
						break;
					case A_OPENING_NEW :
						procActionOpeningNew(mc, user, req, res, screen);
						break;
					case R_OPENING_MAINT :
						procReqOpeningMaint(mc, user, req, res, screen);
						break;
					case A_OPENING_MAINT :
						procActionOpeningMaint(mc, user, req, res, screen);
						break;
					case R_DETAILS :
						procReqDetails(mc, user, req, res, screen);
						break;
					case A_DETAILS :
						procActionDetails(mc, user, req, res, screen);
						break;
					case R_COMMISSI :
						procReqCommission(mc, user, req, res, screen);
						break;
					case A_COMMISSI :
						proActionCommission(mc, user, req, res, screen);
						break;
					case R_SPECIAL_CODES :
						procReqSpecialCodes(mc, user, req, res, screen);
						break;
					case A_SPECIAL_CODES :
						procActionSpecialCodes(mc, user, req, res, screen);
						break;
					case R_SPECIAL_INST :
						procReqSpecialInst(mc, user, req, res, screen);
						break;
					case A_SPECIAL_INST :
						procActionSpecialInst(mc, user, req, res, screen);
						break;
					case R_FIELDS :
						procRecOptionMenu(mc, user, req, res, screen);
						break;
					case A_FIELDS :
						procActionOptionMenu(mc, user, req, res, screen);
						break;
						// COLLATERALS
					case R_COMM_COLLAT_REQ :
						reqCollaterals(mc, user, req, res, screen);
						break;
					case A_COMM_COLLAT_REQ :
						procCollaterals(mc, user, req, res, screen);
						break;												
					case 1111 :
						procActionClausula(mc, user, req, res, screen);
						break;
					case R_LC_CLONING :
						procReqEnterLCCloning(mc, user, req, res, screen);
						break;
					case A_LC_CLONING :
						procActLCCloning(mc, user, req, res, screen);
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
				flexLog("Socket used by JSELC0400 closed.");
			}
		}	
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 */
	private void procReqEnterLCCloning(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) {
		String PageToCall = "ELC0400_lc_enter_cloning.jsp";
		callPage(PageToCall, req, res);
	}
	
	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void procActLCCloning(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "ELC0400_sb_opening_incoming.jsp";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC040001Message msg01 = (ELC040001Message) msgHandle.initMessage("ELC040001", user.getH01USR(), "0001");
			initTransaction(userPO, user, String.valueOf(screen), "NEW", "0001");
			msg01.setH01SCRCOD("01");

			msg01.setH01FLGWK3("1");

			try {
				msg01.setE01CPYNUM(req.getParameter("E01CPYNUM").trim());
			} catch (Exception e) {
			}
			
			msgHandle.sendMessage(msg01);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg01 = (ELC040001Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, msg01);
			if (isNotError) {
				if (msg01.getE01LCMTYP().equals("R")) {
					PageToCall = "ELC0400_sb_opening_incoming.jsp";
				} else {
					PageToCall = "ELC0400_sb_opening_outgoing.jsp";
				}
				callPage(PageToCall, req, res);
			} else {
				callPage("ELC0400_lc_enter_cloning.jsp", req, res);
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
	private void procActionClausula(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC040003Message msg06 = (ELC040003Message) msgHandle.initMessage("ELC040003", user.getH01USR(), "0003");
			msg06.setH03SCRCOD("01");
			initTransaction(userPO, user, String.valueOf(screen), "", "");
			
			setMessageRecord(req, msg06);
			
			try {
				msg06.setE03LCDFCD(req.getParameter("E01CLSCDE").trim());
			} catch (Exception e) {
			}
			try {
				msg06.setE03CLSTXN(req.getParameter("ClauseCode").trim());
			} catch (Exception e) {
			}
			msg06.setE03LCDACC(userPO.getIdentifier());
			msg06.setE03LCDPRO(userPO.getHeader1());
			msg06.setE03LCDBNK(userPO.getBank());
			msgHandle.sendMessage(msg06);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg06 = (ELC040003Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, msg06);
			if (isNotError) {
				PageToCall = "ELC0400_sb_field_info.jsp";
				callPage(PageToCall, req, res);
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
	private void procActionOptionMenu(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC040003Message msg06 = (ELC040003Message) session.getAttribute("msg");	
		
			msg06 = (ELC040003Message) msgHandle.initMessage(msg06, user.getH01USR(), "0005");
			initTransaction(userPO, user, String.valueOf(screen), "", "");
			msgHandle.setFieldsFromPage(req, msg06);
			msgHandle.sendMessage(msg06);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg06 = (ELC040003Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, msg06);
			if (isNotError) {
				procReqDetails(mc, user, req, res, screen);
			} else {
				PageToCall = "ELC0400_sb_field_info.jsp";
				callPage(PageToCall, req, res);
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
	private void procRecOptionMenu(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC040003Message msg06 = (ELC040003Message) msgHandle.initMessage("ELC040003", user.getH01USR(), "0002");
			initTransaction(userPO, user, String.valueOf(screen), "", "");
			msg06.setE03LCDACC(userPO.getIdentifier());
			msg06.setE03LCDPRO(userPO.getHeader1());
			msg06.setE03LCDBNK(userPO.getBank());
			try {
				msg06.setE03LCDFCD(req.getParameter("CODE").trim());
			} catch (Exception e) {
			}
			msgHandle.sendMessage(msg06);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg06 = (ELC040003Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, msg06);
			if (isNotError) {
				PageToCall = "ELC0400_sb_field_info.jsp";
				callPage(PageToCall, req, res);
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
	private void procActionSpecialInst(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ESD000005Message msg05 = (ESD000005Message) session.getAttribute("msg");	
			msg05 = (ESD000005Message) msgHandle.initMessage(msg05, user.getH01USR(), "0005");
			initTransaction(userPO, user, String.valueOf(screen), "", "");
			msg05.setH05USR(user.getH01USR());
			msg05.setH05PGM("ELC0400");
			msg05.setH05TIM(getTimeStamp());
			msg05.setH05SCR("01");
			msg05.setH05OPE("0005");
			msg05.setE05ACC(userPO.getIdentifier());
			msg05.setE05ACD("40");
			msgHandle.setFieldsFromPage(req, msg05);
			msgHandle.sendMessage(msg05);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg05 = (ESD000005Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, msg05);
			if (isNotError) {
				procReqDetails(mc, user, req, res, screen);
			} else {
				PageToCall = "ELC0400_sb_special_inst.jsp";
				callPage(PageToCall, req, res);
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
	private void procReqSpecialInst(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ESD000005Message msg05 = (ESD000005Message) msgHandle.initMessage("ESD000005", user.getH01USR(), "0002");
			initTransaction(userPO, user, String.valueOf(screen), "", "");
			msg05.setH05USR(user.getH01USR());
			msg05.setH05PGM("ELC0400");
			msg05.setH05TIM(getTimeStamp());
			msg05.setH05SCR("01");
			msg05.setH05OPE("0002");
			msg05.setE05ACC(userPO.getIdentifier());
			msg05.setE05ACD("40");
			msgHandle.sendMessage(msg05);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg05 = (ESD000005Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, msg05);
			if (isNotError) {
				PageToCall = "ELC0400_sb_special_inst.jsp";
				callPage(PageToCall, req, res);
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
	private void procActionSpecialCodes(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ESD000002Message msg03 = (ESD000002Message) msgHandle.initMessage("ESD000002", user.getH01USR(), "0005");
			initTransaction(userPO, user, String.valueOf(screen), "", "");
			msg03.setH02USR(user.getH01USR());
			msg03.setH02PGM("ELC0400");
			msg03.setH02TIM(getTimeStamp());
			msg03.setH02SCR("01");
			msg03.setH02OPE("0005");
			msg03.setH02SCR("01");
			msgHandle.setFieldsFromPage(req, msg03);
			msgHandle.sendMessage(msg03);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg03 = (ESD000002Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, msg03);
			if (isNotError) {
				procReqDetails(mc, user, req, res, screen);
			} else {	
				PageToCall = "ESD0000_sb_codes.jsp";
				callPage(PageToCall, req, res);
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
	private void procReqSpecialCodes(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ESD000002Message msg03 = (ESD000002Message) msgHandle.initMessage("ESD000002", user.getH01USR(), "0001");
			initTransaction(userPO, user, String.valueOf(screen), "", "");
			msg03.setH02USR(user.getH01USR());
			msg03.setH02PGM("ELC0500");
			msg03.setH02TIM(getTimeStamp());
			msg03.setH02SCR("01");
			msg03.setH02OPE("0001");
			msg03.setE02ACC(userPO.getIdentifier());
			msgHandle.sendMessage(msg03);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg03 = (ESD000002Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, msg03);
			if (isNotError) {
				PageToCall = "ESD0000_sb_codes.jsp";
				callPage(PageToCall, req, res);
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
	private void proActionCommission(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC040004Message msg04 = (ELC040004Message) session.getAttribute("msg");
			msg04 = (ELC040004Message) msgHandle.initMessage(msg04, user.getH01USR(), "0005");
			initTransaction(userPO, user, String.valueOf(screen), "", "");
			msg04.setH04SCRCOD("01");
			msgHandle.setFieldsFromPage(req, msg04);
			msgHandle.sendMessage(msg04);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg04 = (ELC040004Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, msg04);
			if (isNotError) {
				procReqDetails(mc, user, req, res, screen);
			} else {
				if (userPO.getOption().equals("NEW")) {
					PageToCall = "ELC0400_sb_commissi.jsp";
				} else {
					PageToCall = "ELC0400_sb_comm_mto.jsp";
				}
				callPage(PageToCall, req, res);
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
	private void procReqCommission(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC040004Message msg04 = (ELC040004Message) msgHandle.initMessage("ELC040004", user.getH01USR(), "0002");
			initTransaction(userPO, user, String.valueOf(screen), "", "");
			msg04.setH04SCRCOD("01");
			msg04.setE04LCMBNK(userPO.getBank());
			try {
				msg04.setE04LCMACC(userPO.getIdentifier());
				msg04.setE04LCMPRO(userPO.getHeader1());
			} catch (Exception e) {
			}
			msgHandle.sendMessage(msg04);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg04 = (ELC040004Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, msg04);
			if (isNotError) {
				if (msg04.getE04LCMOPT().equals("N")) {
					PageToCall = "ELC0400_sb_commissi.jsp";
				} else {
					PageToCall = "ELC0400_sb_comm_mto.jsp";
				}
				callPage(PageToCall, req, res);
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
	private void procActionDetails(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC040002Message msg02 = (ELC040002Message) session.getAttribute("msg");
			msg02 = (ELC040002Message) msgHandle.initMessage(msg02, user.getH01USR(), "0005");
			initTransaction(userPO, user, String.valueOf(screen), "MAINTENANCE", "");
			msg02.setH02SCRCOD("01");
			if(req.getParameter("H02FLGWK1") == null) {
				msg02.setH02FLGWK1("");
			}
			msgHandle.setFieldsFromPage(req, msg02);
			msgHandle.sendMessage(msg02);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg02 = (ELC040002Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, msg02);
			if (isNotError && msg02.getH02FLGWK1().trim().equals("Y")) {
				if (!userPO.getRedirect().equals("0001")) {
					PageToCall = "ELC0400_sb_enter_maint.jsp";
					callPage(PageToCall, req, res);
				} else {
					flexLog("About to call: " + "/servlet/datapro.eibs.products.JSESD0711?TYPE=SB");
					res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSESD0711?TYPE=SB");
				}
			} else {
				PageToCall = "ELC0400_sb_details.jsp";
				callPage(PageToCall, req, res);
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
	private void procReqOpeningMaint(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC040001Message msg01 = (ELC040001Message) msgHandle.initMessage("ELC040001", user.getH01USR(), "0002");
			initTransaction(userPO, user, String.valueOf(screen), "MAINTENANCE", "");
			msg01.setH01SCRCOD("01");
			try {
				msg01.setE01LCMACC(req.getParameter("E01LCMACC").toUpperCase());
			} catch (Exception e) {
				msg01.setE01LCMACC(userPO.getIdentifier());
			}
			if (userPO.getHeader7().equals("Y")) {
				msg01.setE01LCMAMF(userPO.getHeader7());
			} else {
				try {
					msg01.setE01LCMAMF(req.getParameter("E01LCMAMF").trim());
					userPO.setHeader7(msg01.getE01LCMAMF());
				} catch (Exception e) {
				}
			}
			userPO.setIdentifier(msg01.getE01LCMACC());
			msgHandle.sendMessage(msg01);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg01 = (ELC040001Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, msg01);
			if (isNotError) {
				if (msg01.getE01LCMTYP().equals("R")) {
					PageToCall = "ELC0400_sb_opening_incoming.jsp";
				} else {
					PageToCall = "ELC0400_sb_opening_outgoing.jsp";
				}		
			} else {
				PageToCall = "ELC0400_sb_enter_maint.jsp";
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
	private void procActionOpeningMaint(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC040001Message msg01 = (ELC040001Message) session.getAttribute("msg");
			msg01 = (ELC040001Message) msgHandle.initMessage(msg01, user.getH01USR(), "0005");
			initTransaction(userPO, user, String.valueOf(screen), "MAINTENANCE", "");
			msg01.setH01SCRCOD("01");
			msgHandle.setFieldsFromPage(req, msg01);
			msgHandle.sendMessage(msg01);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg01 = (ELC040001Message) msgHandle.receiveMessage();
			userPO.setIdentifier(msg01.getE01LCMACC());
			putDataInSession(session, userPO, msgError, msg01);
			if (isNotError) {
				PageToCall = "ELC0400_sb_details.jsp";
				callPage(PageToCall, req, res);
			} else {
				if (msg01.getE01LCMTYP().equals("R")) {
					PageToCall = "ELC0400_sb_opening_incoming.jsp";
				} else {
					PageToCall = "ELC0400_sb_opening_outgoing.jsp";
				}		
				callPage(PageToCall, req, res);
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
	private void procActionOpeningNew(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC040001Message msg01 = (ELC040001Message) session.getAttribute("msg");
			msg01 = (ELC040001Message) msgHandle.initMessage(msg01, user.getH01USR(), "0005");
			try {
				userPO.setCusNum(req.getParameter("E01LCMACC").trim());
			} catch (Exception e) {
			}
			initTransaction(userPO, user, String.valueOf(screen), "NEW", "0001");
			msg01.setH01SCRCOD("01");
			msgHandle.setFieldsFromPage(req, msg01);
			msgHandle.sendMessage(msg01);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg01 = (ELC040001Message) msgHandle.receiveMessage();
			userPO.setIdentifier(msg01.getE01LCMACC());
			userPO.setBank(msg01.getE01LCMBNK());
			userPO.setHeader1(msg01.getE01LCMPRO());
			userPO.setHeader2(msg01.getE01DSCPRO());
			userPO.setAccNum(msg01.getE01LCMACC().trim());
			putDataInSession(session, userPO, msgError, msg01);
			if (isNotError) {
				procReqDetails(mc, user, req, res, screen);
			} else {
				if (msg01.getE01LCMTYP().equals("R")) {
					PageToCall = "ELC0400_sb_opening_incoming.jsp";
				} else {
					PageToCall = "ELC0400_sb_opening_outgoing.jsp";
				}		
				callPage(PageToCall, req, res);
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
	private void procReqDetails(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC040002Message msg02 = (ELC040002Message) msgHandle.initMessage("ELC040002", user.getH01USR(), "0002");
			initTransaction(userPO, user, String.valueOf(screen), "", "");
			msg02.setH02SCRCOD("01");
			msg02.setE02LCMACC(userPO.getIdentifier());
			msg02.setE02LCMAMF(userPO.getHeader7());
			msgHandle.sendMessage(msg02);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg02 = (ELC040002Message) msgHandle.receiveMessage();
			if (isNotError) {
				putDataInSession(session, userPO, msgError, msg02);
				PageToCall = "ELC0400_sb_details.jsp";
				callPage(PageToCall, req, res);
			} else {
				if (msg02.getE02LCMTYP().equals("R")) {
					PageToCall = "ELC0400_sb_opening_incoming.jsp";
				} else {
					PageToCall = "ELC0400_sb_opening_outgoing.jsp";
				}
				callPage(PageToCall, req, res);
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
	private void procReqOpeningNew(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "ESD0711_products_detail.jsp";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC040001Message msg01 = (ELC040001Message) msgHandle.initMessage("ELC040001", user.getH01USR(), "0001");
			initTransaction(userPO, user, String.valueOf(screen), "NEW", "0001");
			msg01.setH01SCRCOD("01");
			try {
				msg01.setE01LCMPRO(req.getParameter("E01LCMPRO").trim());
			} catch (Exception e) {
			}
			try {
				msg01.setE01LCMATY(req.getParameter("typecode").trim());
			} catch (Exception e) {
			}
			try {
				msg01.setE01LCMBNK(req.getParameter("bank").trim());
			} catch (Exception e) {
			}
			msgHandle.sendMessage(msg01);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg01 = (ELC040001Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, msg01);
			if (isNotError) {
				if (msg01.getE01LCMTYP().equals("R")) {
					PageToCall = "ELC0400_sb_opening_incoming.jsp";
				} else {
					PageToCall = "ELC0400_sb_opening_outgoing.jsp";
				}
				callPage(PageToCall, req, res);
			} else {
				flexLog("About to call Page4: " + LangPath + PageToCall);
				String firstLink =
						webAppPath
						+ LangPath
						+ PageToCall
						+ "?appcode="
						+ req.getParameter("appcode").trim()
						+ "&typecode="
						+ req.getParameter("typecode").trim()
						+ "&generic="
						+ req.getParameter("generic").trim()
						+ "&title="
						+ req.getParameter("title").trim()
						+ "&bank="
						+ req.getParameter("bank").trim();
				res.setContentType("text/html");
				PrintWriter out = res.getWriter();
				printProdFrame(out, firstLink, LangPath);
			}
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 */
	private void procReqEnterMaint(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "ELC0400_sb_enter_maint.jsp";
		initTransaction(userPO, user, String.valueOf(screen), "MAINTENANCE", "");
		userPO.setHeader7("");	//Clear Amendment Flag
		putDataInSession(session, userPO, null, null);
		callPage(PageToCall, req, res);
	}
					
	private void initTransaction(UserPos userPO, ESS0030DSMessage user, String optMenu, String purpose, String opeCode) {
		if (!optMenu.equals("")) userPO.setOption(optMenu);
		if (!purpose.equals("")) userPO.setPurpose(purpose);
		userPO.setID(user.getE01INT());
		if (!opeCode.equals("")) userPO.setRedirect(opeCode);
	}
	
	public void callPage(String page, HttpServletRequest req, HttpServletResponse res) {
		try {
			super.callPage(LangPath + page, req, res);
		} catch (Exception e) {
			flexLog("Exception calling page " + e.toString() + e.getMessage());
		}
		return; 
	}
	
	private void putDataInSession(HttpSession session, UserPos userPO, ELEERRMessage msgError, MessageRecord msg) {
		flexLog("Putting java beans into the session");

		if (msgError == null) {
			msgError = new ELEERRMessage(); 
		}
		session.setAttribute("error", msgError);
		
		if (msg.getFormatName().equals("ELC040001")) {
			userPO.setHeader1(((ELC040001Message) msg).getE01LCMPRO());
			userPO.setHeader2(((ELC040001Message) msg).getE01DSCPRO());
			userPO.setBank(((ELC040001Message) msg).getE01LCMBNK());
		}
		session.setAttribute("userPO", userPO);
		if (msg != null) session.setAttribute("msg", msg);
	}

	/**
	 * LC L.C.
	 * 
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void reqCollaterals(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC040011Message msg11 = (ELC040011Message) msgHandle.initMessage("ELC040011", user.getH01USR(), "0002");
			initTransaction(userPO, user, String.valueOf(screen), "", "");
			msg11.setE11LCMACC(userPO.getIdentifier());
			try {
				msg11.setH11SCRCOD(req.getParameter("H11SCRCOD").trim());
			} catch (Exception e) {
			}
			msgHandle.sendMessage(msg11);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg11 = (ELC040011Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, msg11);
			callPage("ELC0400_sb_collaterals.jsp", req, res);
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}	

	/**
	 * LC L.C.
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void procCollaterals(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC040011Message msg11 = (ELC040011Message) msgHandle.initMessage("ELC040011", user.getH01USR(), "0005");
			initTransaction(userPO, user, String.valueOf(screen), "", "");
			msg11.setE11LCMACC(userPO.getIdentifier());
			msgHandle.setFieldsFromPage(req, msg11);
			msgHandle.sendMessage(msg11);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg11 = (ELC040011Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, msg11);
			if (isNotError) {
				procReqDetails(mc, user, req, res, screen);
			} else {
				PageToCall = "ELC0400_sb_collaterals.jsp";
				callPage(PageToCall, req, res);
			}
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}	

}
