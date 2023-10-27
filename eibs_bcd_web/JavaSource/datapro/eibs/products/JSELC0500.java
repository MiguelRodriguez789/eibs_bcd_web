/*
 * Created on Apr 8, 2008
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

import datapro.eibs.beans.ELC050001Message;
import datapro.eibs.beans.ELC050002Message;
import datapro.eibs.beans.ELC050003Message;
import datapro.eibs.beans.ELC050004Message;
import datapro.eibs.beans.ELC050006Message;
import datapro.eibs.beans.ELC050011Message;
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
public class JSELC0500 extends SuperServlet {

	String LangPath = "s/";
	
	private static final int R_OPENING_NEW = 1;
	private static final int A_OPENING_NEW = 2;
	private static final int R_OPENING_MAINT = 3;
	private static final int A_OPENING_MAINT = 4;
	private static final int R_DETAILS = 5;
	private static final int A_DETAILS = 6;
	private static final int R_COMMISSI = 7;
	private static final int A_COMMISSI = 8;

	private static final int R_ENTER_MAINT = 200;
	
	private static final int R_LC_CLONING = 100;
	private static final int A_LC_CLONING = 110;
	
	private static final int R_SPECIAL_CODES = 101;
	private static final int A_SPECIAL_CODES = 102;
	private static final int R_SPECIAL_CODES_MAINT = 201;
	private static final int A_SPECIAL_CODES_MAINT = 202;
	private static final int R_SPECIAL_INST = 103;
	private static final int A_SPECIAL_INST = 104;

	private static final int R_DOCUMENTS_REQ = 601;
	private static final int A_DOCUMENTS_REQ = 602;

	private static final int R_COMM_COLLAT_REQ = 701;
	private static final int A_COMM_COLLAT_REQ = 702;	
	
	public JSELC0500() {
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
				 mc = new MessageContext(super.getMessageHandler("ELC0500", req));
						
				try {
					screen = Integer.parseInt(req.getParameter("SCREEN"));
					flexLog("Screen  Number: " + screen);
				} catch (Exception e) {
					flexLog("Screen set to default value");
				}
				
				String PageToCall = "";

				switch (screen) {
					case R_ENTER_MAINT :
						procReqEnterMaint(mc, user, req, res);
						break;
					case R_OPENING_NEW :
						procReqOpeningNew(mc, user, req, res);
						break;
					case A_OPENING_NEW :
						procActionOpeningNew(mc, user, req, res);
						break;
					case R_OPENING_MAINT :
						procReqOpeningMaint(mc, user, req, res);
						break;
					case A_OPENING_MAINT :
						procActionOpeningMaint(mc, user, req, res);
						break;
					case R_DETAILS :
						procReqDetails(mc, user, req, res);
						break;
					case A_DETAILS :
						procActionDetails(mc, user, req, res);
						break;
					case R_COMMISSI :
						procReqCommissi(mc, user, req, res);
						break;
					case A_COMMISSI :
						proActionCommissi(mc, user, req, res);
						break;
					case R_SPECIAL_CODES :
					case R_SPECIAL_CODES_MAINT :
						procReqSpecialCodes(mc, user, req, res);
						break;
					case A_SPECIAL_CODES :
					case A_SPECIAL_CODES_MAINT :
						procActionSpecialCodes(mc, user, req, res);
						break;
					case R_SPECIAL_INST :
						procReqSpecialInst(mc, user, req, res);
						break;
					case A_SPECIAL_INST :
						procActionSpecialInst(mc, user, req, res);
						break;
					case R_DOCUMENTS_REQ :
						reqDocuments(mc, user, req, res);
						break;
					case A_DOCUMENTS_REQ :
						procDocuments(mc, user, req, res);
						break;
						// COLLATERALS
					case R_COMM_COLLAT_REQ :
						reqCollaterals(mc, user, req, res);
						break;
					case A_COMM_COLLAT_REQ :
						procCollaterals(mc, user, req, res);
						break;												
					case 50 : // this will handle all requests made from option menu
						procRecOptionMenu(mc, user, req, res);
						break;
					case 2000 :
						procActionOptionMenu(mc, user, req, res);
						break;
					case 1111 :
						procRecClausula(mc, user, req, res);
						break;
					case R_LC_CLONING :
						procReqEnterLCCloning(mc, user, req, res);
						break;
					case A_LC_CLONING :
						procActLCCloning(mc, user, req, res);
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
				flexLog("Socket used by JSELC0500 closed.");
			}
		}	
	}
		
	/**
	 * @param req
	 * @param res
	 * @param screen
	 */
	private void procReqEnterLCCloning(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res) {
		String PageToCall = "ELC0500_lc_enter_cloning.jsp";
		callPage(PageToCall, req, res);
	}
	
	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void procActLCCloning(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC050001Message msg01 = (ELC050001Message) msgHandle.initMessage("ELC050001", user.getH01USR(), "0001");
			initTransaction(userPO, user, "NEW");
			msg01.setH01SCRCOD("01");

			msg01.setH01FLGWK3("1");
			try {
				msg01.setE01CPYNUM(req.getParameter("E01CPYNUM").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}

			msgHandle.sendMessage(msg01);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg01 = (ELC050001Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "msgLC", msg01);
			if (isNotError) {
				if (msg01.getE01LCMTYP().equals("O")) { //Import
					PageToCall = "ELC0500_lc_opening_import.jsp";
				} else { //Export
					PageToCall = "ELC0500_lc_opening_export.jsp";
				}
			} else {
				PageToCall = "ELC0500_lc_enter_cloning.jsp";
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
	private void procRecClausula(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			initTransaction(userPO, user, "MAINTENANCE");
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC050003Message msg07 = (ELC050003Message) msgHandle.initMessage("ELC050003", user.getH01USR(), "0003");
			msg07.setH03SCRCOD("01");
			msg07.setE03LCDACC(userPO.getIdentifier());
			msg07.setE03LCDPRO(userPO.getHeader1());
			msg07.setE03LCDBNK(userPO.getBank());
			try {
				msg07.setE03CLSTXN(req.getParameter("ClauseCode").trim());
			} catch (Exception e) {
			}
			
			setMessageRecord(req, msg07);
			
			msgHandle.sendMessage(msg07);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg07 = (ELC050003Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "msgLC", msg07);
			if (isNotError) {
				PageToCall = "ELC0500_lc_field_info.jsp";
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
	private void procActionOptionMenu(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC050003Message msg07 = (ELC050003Message) session.getAttribute("msgLC");
			msg07 = (ELC050003Message) msgHandle.initMessage(msg07, user.getH01USR(), "0005");
			initTransaction(userPO, user, "MAINTENANCE");
			msg07.setH03SCRCOD("01");
			msgHandle.setFieldsFromPage(req, msg07);
			msgHandle.sendMessage(msg07);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg07 = (ELC050003Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "msgLC", msg07);
			if (isNotError) {
				procReqDetails(mc, user, req, res);
			} else {
				PageToCall = "ELC0500_lc_field_info.jsp";
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
	private void procRecOptionMenu(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC050003Message msg07 = (ELC050003Message) msgHandle.initMessage("ELC050003", user.getH01USR(), "0002");
			initTransaction(userPO, user, "MAINTENANCE");
			msg07.setH03SCRCOD("01");
			msg07.setE03LCDACC(userPO.getIdentifier());
			msg07.setE03LCDPRO(userPO.getHeader1());
			msg07.setE03LCDBNK(userPO.getBank());
			try {
				msg07.setE03LCDFCD(req.getParameter("CODE").trim());
			} catch (Exception e) {
			}
			msgHandle.sendMessage(msg07);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg07 = (ELC050003Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "msgLC", msg07);
			if (isNotError) {
				PageToCall = "ELC0500_lc_field_info.jsp";
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
	private void procDocuments(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC050006Message msg06 = (ELC050006Message) msgHandle.initMessage("ELC050006", user.getH01USR(), "0005");
			initTransaction(userPO, user, "MAINTENANCE");
			msg06.setE06LCMACC(userPO.getIdentifier());
			msgHandle.setFieldsFromPage(req, msg06);
			msgHandle.sendMessage(msg06);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg06 = (ELC050006Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "msgLC", msg06);
			if (isNotError) {
				procReqDetails(mc, user, req, res);
			} else {
				PageToCall = "ELC0500_lc_documents.jsp";
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
	private void reqDocuments(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC050006Message msg06 = (ELC050006Message) msgHandle.initMessage("ELC050006", user.getH01USR(), "0002");
			initTransaction(userPO, user, "MAINTENANCE");
			msg06.setE06LCMACC(userPO.getIdentifier());
			try {
				msg06.setH06SCRCOD(req.getParameter("H06SCRCOD").trim());
			} catch (Exception e) {
			}
			msgHandle.sendMessage(msg06);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg06 = (ELC050006Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "msgLC", msg06);
			if (isNotError) {
				PageToCall = "ELC0500_lc_documents.jsp";
				callPage(PageToCall, req, res);
			}
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	/**
	 * LC L.C.
	 * 
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void reqCollaterals(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC050011Message msg11 = (ELC050011Message) msgHandle.initMessage("ELC050011", user.getH01USR(), "0002");
			initTransaction(userPO, user, "MAINTENANCE");
			msg11.setE11LCMACC(userPO.getIdentifier());
			try {
				msg11.setH11SCRCOD(req.getParameter("H11SCRCOD").trim());
			} catch (Exception e) {
			}
			msgHandle.sendMessage(msg11);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg11 = (ELC050011Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "msgLC", msg11);
			if (isNotError) {
				PageToCall = "ELC0500_lc_collaterals.jsp";
				callPage(PageToCall, req, res);
			}
		
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
	private void procCollaterals(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC050011Message msg11 = (ELC050011Message) msgHandle.initMessage("ELC050011", user.getH01USR(), "0005");
			initTransaction(userPO, user, "MAINTENANCE");
			msg11.setE11LCMACC(userPO.getIdentifier());
			msgHandle.setFieldsFromPage(req, msg11);
			msgHandle.sendMessage(msg11);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg11 = (ELC050011Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "msgLC", msg11);
			if (isNotError) {
				procReqDetails(mc, user, req, res);
			} else {
				PageToCall = "ELC0500_lc_collaterals.jsp";
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
	private void procActionSpecialInst(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ESD000005Message msg05 = (ESD000005Message) session.getAttribute("msgLC");
			msg05 = (ESD000005Message) msgHandle.initMessage(msg05, user.getH01USR(), "0005");
			initTransaction(userPO, user, "MAINTENANCE");
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
			putDataInSession(session, userPO, msgError, "msgLC", msg05);
			if (isNotError) {
				procReqDetails(mc, user, req, res);
			} else {
				PageToCall = "ELC0500_lc_special_inst.jsp";
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
	private void procReqSpecialInst(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ESD000005Message msg05 = (ESD000005Message) msgHandle.initMessage("ESD000005", user.getH01USR(), "0002");
			initTransaction(userPO, user, "MAINTENANCE");
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
			putDataInSession(session, userPO, msgError, "msgLC", msg05);
			if (isNotError) {
				PageToCall = "ELC0500_lc_special_inst.jsp";
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
	private void procActionSpecialCodes(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ESD000002Message msg03 = (ESD000002Message) msgHandle.initMessage("ESD000002", user.getH01USR(), "0005");
			initTransaction(userPO, user, "MAINTENANCE");
			msg03.setH02USR(user.getH01USR());
			msg03.setH02PGM("ELC0400");
			msg03.setH02TIM(getTimeStamp());
			msg03.setH02SCR("01");
			msg03.setH02OPE("0005");
			msgHandle.setFieldsFromPage(req, msg03);
			msgHandle.sendMessage(msg03);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg03 = (ESD000002Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "lcCodes", msg03);
			if (isNotError) {
				procReqDetails(mc, user, req, res);
			} else {	
				PageToCall = "ESD0000_lc_codes.jsp";
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
	private void procReqSpecialCodes(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ESD000002Message msg03 = (ESD000002Message) msgHandle.initMessage("ESD000002", user.getH01USR(), "0001");
			initTransaction(userPO, user, "MAINTENANCE");
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
			putDataInSession(session, userPO, msgError, "lcCodes", msg03);
			if (isNotError) {
				PageToCall = "ESD0000_lc_codes.jsp";
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
	private void proActionCommissi(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC050004Message msg04 = (ELC050004Message) session.getAttribute("msgLC");
			msg04 = (ELC050004Message) msgHandle.initMessage(msg04, user.getH01USR(), "0005");
			initTransaction(userPO, user, "MAINTENANCE");
			msg04.setH04SCRCOD("01");
			msgHandle.setFieldsFromPage(req, msg04);
			msgHandle.sendMessage(msg04);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg04 = (ELC050004Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "msgLC", msg04);
			if (isNotError) {
				procReqDetails(mc, user, req, res);
			} else {
				PageToCall = "ELC0500_lc_commissi.jsp";
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
	private void procReqCommissi(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC050004Message msg04 = (ELC050004Message) msgHandle.initMessage("ELC050004", user.getH01USR(), "0002");
			initTransaction(userPO, user, "MAINTENANCE");
			msg04.setH04SCRCOD("01");
			msg04.setE04LCMBNK(userPO.getBank());
			msg04.setE04LCMACC(userPO.getIdentifier());
			msg04.setE04LCMPRO(userPO.getHeader1());
			msgHandle.sendMessage(msg04);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg04 = (ELC050004Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "msgLC", msg04);
			if (isNotError) {
				PageToCall = "ELC0500_lc_commissi.jsp";
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
	private void procActionDetails(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC050002Message msg02 = (ELC050002Message) session.getAttribute("msgLC");
			msg02 = (ELC050002Message) msgHandle.initMessage(msg02, user.getH01USR(), "0005");
			initTransaction(userPO, user, "MAINTENANCE");
			msg02.setH02SCRCOD("01");
			msgHandle.setFieldsFromPage(req, msg02);
			if (req.getParameter("H02FLGWK1") == null) {
				msg02.setH02FLGWK1("");
			}
			boolean isFinal = msg02.getH02FLGWK1().equals("Y");
			msgHandle.sendMessage(msg02);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg02 = (ELC050002Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "msgLC", msg02);
			if (isNotError && isFinal) {
				res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSESD0711?TYPE=LC");
			} else {
				PageToCall = "ELC0500_lc_details.jsp";
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
	private void procReqDetails(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC050002Message msg02 = (ELC050002Message) msgHandle.initMessage("ELC050002", user.getH01USR(), "0002");
			initTransaction(userPO, user, "MAINTENANCE");
			msg02.setH02SCRCOD("01");
			msg02.setE02LCMACC(userPO.getIdentifier());
			msgHandle.sendMessage(msg02);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg02 = (ELC050002Message) msgHandle.receiveMessage();
			if (isNotError) {
				putDataInSession(session, userPO, msgError, "msgLC", msg02);
				PageToCall = "ELC0500_lc_details.jsp";
			} else {
				if (msg02.getE02LCMTYP().equals("O")) {
					PageToCall = "ELC0500_lc_opening_import.jsp";
				} else {
					PageToCall = "ELC0500_lc_opening_export.jsp";
				}
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
	private void procActionOpeningMaint(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC050001Message msg01 = (ELC050001Message) session.getAttribute("msgLC");
			msg01 = (ELC050001Message) msgHandle.initMessage(msg01, user.getH01USR(), "0005");
			initTransaction(userPO, user, "MAINTENANCE");
			msg01.setH01SCRCOD("01");
			msgHandle.setFieldsFromPage(req, msg01);
			msgHandle.sendMessage(msg01);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg01 = (ELC050001Message) msgHandle.receiveMessage();
			userPO.setIdentifier(msg01.getE01LCMACC());
			putDataInSession(session, userPO, msgError, "msgLC", msg01);
			if (isNotError) {
				PageToCall = "ELC0500_lc_details.jsp";
			} else {
				if (msg01.getE01LCMTYP().equals("O")) {
					PageToCall = "ELC0500_lc_opening_import.jsp";
				} else {
					PageToCall = "ELC0500_lc_opening_export.jsp";
				}		
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
	private void procReqOpeningMaint(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC050001Message msg01 = (ELC050001Message) msgHandle.initMessage("ELC050001", user.getH01USR(), "0002");
			initTransaction(userPO, user, "MAINTENANCE");
			msg01.setH01SCRCOD("01");
			try {
				msg01.setE01LCMACC(req.getParameter("E01LCMACC").toUpperCase());
			} catch (Exception e) {
				msg01.setE01LCMACC(userPO.getIdentifier());
			}
			userPO.setIdentifier(msg01.getE01LCMACC());
			msgHandle.sendMessage(msg01);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg01 = (ELC050001Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "msgLC", msg01);
			if (isNotError) {
				if (msg01.getE01LCMTYP().equals("O")) {
					PageToCall = "ELC0500_lc_opening_import.jsp";
				} else {
					PageToCall = "ELC0500_lc_opening_export.jsp";
				}		
			} else {
				//OJO
				PageToCall = "ELC0510_lc_enter_maint.jsp";
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
	private void procActionOpeningNew(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC050001Message msg01 = (ELC050001Message) session.getAttribute("msgLC");
			msg01 = (ELC050001Message) msgHandle.initMessage(msg01, user.getH01USR(), "0005");
			try {
				userPO.setCusNum(req.getParameter("E01LCMACC").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			initTransaction(userPO, user, "NEW");
			msg01.setH01SCRCOD("01");
			msgHandle.setFieldsFromPage(req, msg01);
			msgHandle.sendMessage(msg01);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg01 = (ELC050001Message) msgHandle.receiveMessage();
			userPO.setIdentifier(msg01.getE01LCMACC());
			userPO.setBank(msg01.getE01LCMBNK());
			userPO.setHeader1(msg01.getE01LCMPRO());
			userPO.setHeader2(msg01.getE01DSCPRO());
			userPO.setAccNum(msg01.getE01LCMACC().trim());
			putDataInSession(session, userPO, msgError, "msgLC", msg01);
			if (isNotError) {
				procReqDetails(mc, user, req, res);
			} else {
				if (msg01.getE01LCMTYP().equals("O")) { //Import
					PageToCall = "ELC0500_lc_opening_import.jsp";
				} else { //Export
					PageToCall = "ELC0500_lc_opening_export.jsp";
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
	private void procReqOpeningNew(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "ESD0711_products_detail.jsp";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC050001Message msg01 = (ELC050001Message) msgHandle.initMessage("ELC050001", user.getH01USR(), "0001");
			initTransaction(userPO, user, "NEW");
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
			msg01 = (ELC050001Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "msgLC", msg01);
			if (isNotError) {
				if (msg01.getE01LCMTYP().equals("O")) { //Import
					PageToCall = "ELC0500_lc_opening_import.jsp";
				} else { //Export
					PageToCall = "ELC0500_lc_opening_export.jsp";
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
	private void procReqEnterMaint(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "ELC0500_lc_enter_maint.jsp";
		initTransaction(userPO, user, "MAINTENANCE");
		userPO.setHeader18("NO_MENU");
		userPO.setProdCode("CC");
		userPO.setOption("LC");
		userPO.setSource("JSELC0500");
		putDataInSession(session, userPO, null, "msgLC", new ELC050001Message());
		callPage(PageToCall, req, res);
	}

	private void initTransaction(UserPos userPO, ESS0030DSMessage user, String purpose) {
		//if (!optMenu.equals("")) userPO.setOption(optMenu);
		userPO.setOption("LC");
		if (!purpose.equals("")) userPO.setPurpose(purpose);
		userPO.setID(user.getE01INT()); //Country Code
	}
	
	public void callPage(String page, HttpServletRequest req, HttpServletResponse res) {
		try {
			super.callPage(LangPath + page, req, res);
		} catch (Exception e) {
			flexLog("Exception calling page " + e.toString() + e.getMessage());
		}
		return; 
	}
	
	private void putDataInSession(HttpSession session, UserPos userPO, ELEERRMessage msgError, String name, MessageRecord msg) {
		
		flexLog("Putting java beans into the session");

		if (msgError == null) {
			msgError = new ELEERRMessage(); 
		}
		session.setAttribute("error", msgError);
		session.setAttribute("userPO", userPO);
		if (msg != null) session.setAttribute(name, msg);
	}

}
