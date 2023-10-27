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

import datapro.eibs.beans.ELC051001Message;
import datapro.eibs.beans.ELC051002Message;
import datapro.eibs.beans.ELC051003Message;
import datapro.eibs.beans.ELC051004Message;
import datapro.eibs.beans.ELC051005Message;
import datapro.eibs.beans.ELC051006Message;
import datapro.eibs.beans.ELC051011Message;
import datapro.eibs.beans.ELEERRMessage;
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
 * Comercial Letter Of Credit Maintenance
 */
public class JSELC0510 extends SuperServlet {

	String LangPath = "s/";
	
	private static final int R_NEW = 1;
	private static final int A_NEW = 2;
	private static final int R_OPENING_MAINT = 3;
	private static final int A_OPENING_MAINT = 4;
	private static final int R_DETAILS_MAINT = 5;
	private static final int A_DETAILS_MAINT = 6;
	private static final int R_COMMISSI = 7;
	private static final int A_COMMISSI = 8;

	private static final int R_SPECIAL_INST = 103;
	private static final int A_SPECIAL_INST = 104;
	
	private static final int R_TRANSFER_LIST = 105;
	private static final int R_TRANSFER = 106;
	private static final int A_TRANSFER = 107;
	private static final int R_TRANSFER_COMMISSION = 108;
	private static final int A_TRANSFER_COMMISSION = 109;
	
	private static final int R_ASSIGNMENT_LIST = 110;
	private static final int R_ASSIGNMENT = 111;
	private static final int A_ASSIGNMENT = 112;
	private static final int R_ASSIGNMENT_COMMISSION = 113;
	private static final int A_ASSIGNMENT_COMMISSION = 114;
	
	private static final int R_ENTER_MAINT = 200;
	private static final int R_SPECIAL_CODES_MAINT = 201;
	private static final int A_SPECIAL_CODES_MAINT = 202;

	private static final int R_DOCUMENTS_REQ = 601;
	private static final int A_DOCUMENTS_REQ = 602;
	
	private static final int R_COMM_COLLAT_REQ = 701;
	private static final int A_COMM_COLLAT_REQ = 702;	
	
	public JSELC0510() {
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
				 mc = new MessageContext(super.getMessageHandler("ELC0510", req));
						
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
						// New
					case R_NEW :
						procReqNew(mc, user, req, res, screen);
						break;
					case A_NEW :
						procActionNew(mc, user, req, res, screen);
						break;
						// OPENING MAINTENANCE
					case R_OPENING_MAINT :
						procReqBasicInformation(mc, user, req, res, screen);
						break;
					case A_OPENING_MAINT :
						procActionOpening(mc, user, req, res, screen);
						break;
						// DETAILS MAINTENANCE
					case R_DETAILS_MAINT :
						procReqCreditCondition(mc, user, req, res, screen);
						break;
					case A_DETAILS_MAINT :
						proActionDetails(mc, user, req, res, screen);
						break;
						// COMMISSIONS
					case R_COMMISSI :
						procReqCommission(mc, user, req, res, screen);
						break;
					case A_COMMISSI :
						procActionCommission(mc, user, req, res, screen);
						break;
						// SPECIAL INSTRUCTIONS
					case R_SPECIAL_INST :
						procReqSpecialInst(mc, user, req, res, screen);
						break;
					case A_SPECIAL_INST :
						procActionSpecialInst(mc, user, req, res, screen);
						break;
						// DOCUMENTS
					case R_DOCUMENTS_REQ :
						reqDocuments(mc, user, req, res, screen);
						break;
					case A_DOCUMENTS_REQ :
						procDocuments(mc, user, req, res, screen);
						break;
						// COLLATERALS
					case R_COMM_COLLAT_REQ :
						reqCollaterals(mc, user, req, res, screen);
						break;
					case A_COMM_COLLAT_REQ :
						procCollaterals(mc, user, req, res, screen);
						break;						
						// TRANSFER
					case R_TRANSFER_LIST :
						procReqTransferList(mc, user, req, res, screen);
						break;
					case R_TRANSFER :
						procReqTransfer(mc, user, req, res, screen);
						break;
					case R_TRANSFER_COMMISSION :
						procReqTransferCommission(mc, user, req, res, screen);
						break;
					case A_TRANSFER :
					case A_TRANSFER_COMMISSION :
						procActionTransfer(mc, user, req, res, screen);
						break;
						// SPECIAL CODES
					case R_SPECIAL_CODES_MAINT :
						procReqSpecialCodes(mc, user, req, res, screen);
						break;
					case A_SPECIAL_CODES_MAINT :
						procActionSpecialCodes(mc, user, req, res, screen);
						break;
						// this will handle all requests made from option menu
					case 50 :
						procRecOptionMenu(mc, user, req, res, screen);
						break;
					case 2000 :
						procActionOptionMenu(mc, user, req, res, screen);
						break;
					case 1111 :
						procRecClausula(mc, user, req, res, screen);
						break;
						
						// ASSIGNMENT
					case R_ASSIGNMENT_LIST :
						procReqAssignmentList(mc, user, req, res, screen);
						break;
					case R_ASSIGNMENT :
						procReqAssignment(mc, user, req, res, screen);
						break;
					case R_ASSIGNMENT_COMMISSION :
						procReqAssignmentCommission(mc, user, req, res, screen);
						break;
					case A_ASSIGNMENT :
						procActionAssignment(mc, user, req, res, screen);
						break;
					case A_ASSIGNMENT_COMMISSION :
						procActionAssignmentCommission(mc, user, req, res, screen);
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
				flexLog("Socket used by JSELC0510 closed.");
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
			ELC051005Message msg07 = (ELC051005Message) session.getAttribute("msgLC");
			msg07 = (ELC051005Message) msgHandle.initMessage(msg07, user.getH01USR(), "0008");
			initTransaction(userPO, user, "");
			msg07.setH05SCRCOD("01");
			msg07.setE05LCMACC(userPO.getIdentifier());
			msg07.setE05LCTNUM(userPO.getAccOpt());
			msg07.setH05FLGWK3("T");
			msgHandle.sendMessage(msg07);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg07 = (ELC051005Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, msg07, null);
			if (isNotError) {
				PageToCall = "ELC0510_lc_transfer_commissi.jsp";
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
	private void procRecClausula(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			initTransaction(userPO, user, "MAINTENANCE");
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC051003Message msg08 = (ELC051003Message) msgHandle.initMessage("ELC051003", user.getH01USR(), "0003");
			msg08.setH03SCRCOD("01");
			msg08.setE03LCDACC(userPO.getIdentifier());
			msg08.setE03LCDPRO(userPO.getHeader1());
			msg08.setE03LCDBNK(userPO.getBank());
			try {
				msg08.setE03CLSTXN(req.getParameter("ClauseCode").trim());
			} catch (Exception e) {
			}
			
			setMessageRecord(req, msg08);
			
			msgHandle.sendMessage(msg08);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg08 = (ELC051003Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, msg08, null);
			if (isNotError) {
				PageToCall = "ELC0510_lc_field_info_maint.jsp";
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
			ELC051003Message msg08 = (ELC051003Message) session.getAttribute("msgLC");
			msg08 = (ELC051003Message) msgHandle.initMessage(msg08, user.getH01USR(), "0005");
			initTransaction(userPO, user, "MAINTENANCE");
			msg08.setH03SCRCOD("01");
			msgHandle.setFieldsFromPage(req, msg08);
			msgHandle.sendMessage(msg08);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg08 = (ELC051003Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, msg08, null);
			if (isNotError) {
				procReqCreditCondition(mc, user, req, res, screen);
			} else {
				PageToCall = "ELC0510_lc_field_info_maint.jsp";
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
			ELC051003Message msg08 = (ELC051003Message) msgHandle.initMessage("ELC051003", user.getH01USR(), "0002");
			initTransaction(userPO, user, "MAINTENANCE");
			msg08.setH03SCRCOD("01");
			msg08.setE03LCDACC(userPO.getIdentifier());
			msg08.setE03LCDPRO(userPO.getHeader1());
			msg08.setE03LCDBNK(userPO.getBank());
			try {
				msg08.setE03LCDFCD(req.getParameter("CODE").trim());
			} catch (Exception e) {
			}
			msgHandle.sendMessage(msg08);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg08 = (ELC051003Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, msg08, null);
			if (isNotError) {
				PageToCall = "ELC0510_lc_field_info_maint.jsp";
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
			putDataInSession(session, userPO, msgError, msg03, null);
			if (isNotError) {
				procReqCreditCondition(mc, user, req, res, screen);
			} else {	
				PageToCall = "ESD0000_lc_codes_maint.jsp";
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
			putDataInSession(session, userPO, msgError, msg03, null);
			if (isNotError) {
				PageToCall = "ESD0000_lc_codes_maint.jsp";
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
	private void procActionTransfer(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC051005Message msg07 = (ELC051005Message) session.getAttribute("msgLC");
			String action = "";
			if (msg07.getH05OPECOD().equals("0001")) {
				action = "NEW";
			} else {
				action = "MAINTENANCE";
			}
			String opcode = "0005";
			if (screen == A_TRANSFER_COMMISSION) opcode = "0016";
			
			msg07 = (ELC051005Message) msgHandle.initMessage(msg07, user.getH01USR(), opcode);
			initTransaction(userPO, user, action);
			msg07.setE05LCMACC(userPO.getIdentifier());
			msg07.setH05FLGWK3("T");
			msgHandle.setFieldsFromPage(req, msg07);
			msgHandle.sendMessage(msg07);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg07 = (ELC051005Message) msgHandle.receiveMessage();
			putDataInSession(session,userPO, msgError,  msg07, null);
			if (isNotError) {
				procReqTransferList(mc, user, req, res, screen);
			} else {
				PageToCall = "ELC0510_lc_transfer.jsp";
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
	private void procReqTransfer(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			String opCode = "";
			try {
				opCode = req.getParameter("opCode");
				if (opCode == null) opCode = "0002";
			} catch (Exception e) {
				opCode = "0002";
			}
				
			ELC051005Message msg07 = (ELC051005Message) msgHandle.initMessage("ELC051005", user.getH01USR(), opCode);
			String action = "";
			if (opCode.equals("0001")) {
				action = "NEW";
			} else {
				action = "MAINTENANCE";
			}
			initTransaction(userPO, user, action);
			msg07.setH05SCRCOD("01");
			msg07.setH05FLGWK3("T");
			msg07.setE05LCMACC(userPO.getIdentifier());
			if (!action.equals("NEW")) {
				try {
					msg07.setE05LCTNUM(req.getParameter("E05LCTNUM"));
					userPO.setAccOpt(msg07.getE05LCTNUM());
				} catch (Exception e) {
					if (!userPO.getPurpose().equals("NEW"))
						msg07.setE05LCTNUM(userPO.getAccOpt());
				}
			}
			
			userPO.setAccOpt(msg07.getE05LCTNUM());
			msgHandle.sendMessage(msg07);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg07 = (ELC051005Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, msg07, null);
			if (isNotError) {
				PageToCall = "ELC0510_lc_transfer.jsp";
			} else {
				PageToCall = "ELC0510_lc_transfer_list.jsp";
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
	private void procReqTransferList(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		if(userPO == null){
			userPO = new UserPos();
		}
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC051005Message msg07 = (ELC051005Message) msgHandle.initMessage("ELC051005", user.getH01USR(), "0015");
			initTransaction(userPO, user, "");
			msg07.setH05SCRCOD("01");
			msg07.setH05FLGWK3("T");
			try {
				msg07.setE05LCMACC(req.getParameter("E05LCMACC"));
			} catch (Exception e) {
			}
			userPO.setIdentifier(msg07.getE05LCMACC());
			msgHandle.sendMessage(msg07);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			JBObjList jbList = msgHandle.receiveMessageList("H05FLGMAS", JSEIBSProp.getMaxIterations());
			if (isNotError) {
				PageToCall = "ELC0510_lc_transfer_list.jsp";
			} else {
				PageToCall = "ELC0510_lc_enter_transfer.jsp";
			}
			putDataInSession(session, userPO, msgError, msg07, jbList);
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
	private void procDocuments(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC051006Message msg06 = (ELC051006Message) msgHandle.initMessage("ELC051006", user.getH01USR(), "0005");
			initTransaction(userPO, user, "MAINTENANCE");
			msg06.setE06LCMACC(userPO.getIdentifier());
			msgHandle.setFieldsFromPage(req, msg06);
			msgHandle.sendMessage(msg06);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg06 = (ELC051006Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, msg06, null);
			if (isNotError) {
				procReqCreditCondition(mc, user, req, res, screen);
			} else {
				PageToCall = "ELC0510_lc_documents.jsp";
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
	private void reqDocuments(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC051006Message msg06 = (ELC051006Message) msgHandle.initMessage("ELC051006", user.getH01USR(), "0002");
			initTransaction(userPO, user, "MAINTENANCE");
			msg06.setE06LCMACC(userPO.getIdentifier());
			try {
				msg06.setH06SCRCOD(req.getParameter("H06SCRCOD"));
			} catch (Exception e) {
			}
			msgHandle.sendMessage(msg06);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg06 = (ELC051006Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, msg06, null);
			if (isNotError) {
				if (msg06.getH06SCRCOD().equals("A")) {
					PageToCall = "ELC0525_lc_documents.jsp";
				} else {
					PageToCall = "ELC0510_lc_documents.jsp";				
				}
			} else {
				if (msg06.getH06SCRCOD().equals("A")) {
					PageToCall = "ELC0525_lc_documents.jsp";
				} else {
					PageToCall = "ELC0510_lc_documents.jsp";				
				}
			}
			callPage(PageToCall, req, res);
		
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
	private void reqCollaterals(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC051011Message msg11 = (ELC051011Message) msgHandle.initMessage("ELC051011", user.getH01USR(), "0002");
			initTransaction(userPO, user, String.valueOf(screen), "MAINTENANCE");
			msg11.setE11LCMACC(userPO.getIdentifier());
			try {
				msg11.setH11SCRCOD(req.getParameter("H11SCRCOD"));
			} catch (Exception e) {
			}
			msgHandle.sendMessage(msg11);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg11 = (ELC051011Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, msg11, null);
			if (isNotError) {
				if (msg11.getH11SCRCOD().equals("A")) {
					PageToCall = "ELC0525_lc_collaterals.jsp";
				} else {
					PageToCall = "ELC0510_lc_collaterals.jsp";				
				}	
			} else {
				if (msg11.getH11SCRCOD().equals("A")) {
					PageToCall = "ELC0525_lc_collaterals.jsp";
				} else {
					PageToCall = "ELC0510_lc_collaterals.jsp";				
				}
			}
			callPage(PageToCall, req, res);
							
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
	private void procCollaterals(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC051011Message msg11 = (ELC051011Message) msgHandle.initMessage("ELC051011", user.getH01USR(), "0005");
			initTransaction(userPO, user, String.valueOf(screen), "MAINTENANCE");
			msg11.setE11LCMACC(userPO.getIdentifier());
			msgHandle.setFieldsFromPage(req, msg11);
			msgHandle.sendMessage(msg11);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg11 = (ELC051011Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, msg11, null);
			if (isNotError) {
				procReqCreditCondition(mc, user, req, res, screen);
			} else {
				PageToCall = "ELC0510_lc_collaterals.jsp";
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
			ESD000005Message msg05 = (ESD000005Message) session.getAttribute("msgLC");
			msg05 = (ESD000005Message) msgHandle.initMessage(msg05, user.getH01USR(), "0005");
			initTransaction(userPO, user, "MAINTENANCE");
			msg05.setH05USR(user.getH01USR());
			msg05.setH05PGM("ELC0510");
			msg05.setH05TIM(getTimeStamp());
			msg05.setH05SCR("01");
			msg05.setH05OPE("0005");
			msg05.setE05ACC(userPO.getIdentifier());
			//msg05.setE05TYP("3");
			msgHandle.setFieldsFromPage(req, msg05);
			msgHandle.sendMessage(msg05);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg05 = (ESD000005Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, msg05, null);
			if (isNotError) {
				procReqCreditCondition(mc, user, req, res, screen);
			} else {
				PageToCall = "ELC0510_lc_special_inst.jsp";
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
			initTransaction(userPO, user, "MAINTENANCE");
			msg05.setH05USR(user.getH01USR());
			msg05.setH05PGM("ELC0510");
			msg05.setH05TIM(getTimeStamp());
			msg05.setH05SCR("01");
			msg05.setH05OPE("0002");
			msg05.setE05ACC(userPO.getIdentifier());
			//msg05.setE05TYP("3");
			msgHandle.sendMessage(msg05);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg05 = (ESD000005Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, msg05, null);
			if (isNotError) {
				PageToCall = "ELC0510_lc_special_inst.jsp";
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
	private void procActionCommission(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC051004Message msg04 = (ELC051004Message) session.getAttribute("msgLC");
			msg04 = (ELC051004Message) msgHandle.initMessage(msg04, user.getH01USR(), "0005");
			initTransaction(userPO, user, "MANINTENANCE");
			msg04.setH04SCRCOD("01");
			msgHandle.setFieldsFromPage(req, msg04);
			msgHandle.sendMessage(msg04);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg04 = (ELC051004Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, msg04, null);
			if (isNotError) {
				procReqCreditCondition(mc, user, req, res, screen);
			} else {
				PageToCall = "ELC0510_lc_commissi.jsp";
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
			ELC051004Message msg04 = (ELC051004Message) msgHandle.initMessage("ELC051004", user.getH01USR(), "0002");
			initTransaction(userPO, user, "MANINTENANCE");
			msg04.setH04SCRCOD("01");
			msg04.setE04LCMBNK(userPO.getBank());
			msg04.setE04LCMACC(userPO.getIdentifier());
			msg04.setE04LCMPRO(userPO.getHeader1());
			msgHandle.sendMessage(msg04);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg04 = (ELC051004Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, msg04, null);
			if (isNotError) {
				PageToCall = "ELC0510_lc_commissi.jsp";
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
	private void proActionDetails(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "ELC0510_lc_details.jsp";
		if ("Y".equals(req.getParameter("E01DOMFLG"))){
			PageToCall = "ELC0510_lc_details_local.jsp"; 
		}
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC051002Message msg02 = (ELC051002Message) session.getAttribute("msgLC");
			msg02 = (ELC051002Message) msgHandle.initMessage(msg02, user.getH01USR(), "0005");
			initTransaction(userPO, user, "MAINTENANCE");
			msg02.setH02SCRCOD("01");
			if(req.getParameter("H02FLGWK1") == null){
				msg02.setH02FLGWK1("");
			}
			msgHandle.setFieldsFromPage(req, msg02);
			msgHandle.sendMessage(msg02);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg02 = (ELC051002Message) msgHandle.receiveMessage();
			userPO.setIdentifier(msg02.getE02LCMACC());
			userPO.setHeader11(msg02.getE02LCMORF());
			userPO.setHeader12(msg02.getE02LCMTRF());
			userPO.setHeader13(msg02.getE02LCMPRO());
			userPO.setHeader14(msg02.getE02DSCPRO());
			userPO.setHeader18("MENU");
			putDataInSession(session, userPO, msgError, msg02, null);
			if (isNotError && msg02.getH02FLGWK1().trim().equals("Y")) {
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
	private void procReqCreditCondition(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC051002Message msg02 = (ELC051002Message) msgHandle.initMessage("ELC051002", user.getH01USR(), "0002");
			initTransaction(userPO, user, "MAINTENANCE");
			msg02.setH02SCRCOD("01");
			msg02.setE02LCMAMF(userPO.getHeader7());
			try {
				msg02.setE02LCMACC(req.getParameter("E02LCMACC").toUpperCase());
			} catch (Exception e) {
				msg02.setE02LCMACC(userPO.getIdentifier());
			}
			userPO.setIdentifier(msg02.getE02LCMACC());
			msgHandle.sendMessage(msg02);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg02 = (ELC051002Message) msgHandle.receiveMessage();
			userPO.setHeader1(msg02.getE02LCMPRO());
			userPO.setIdentifier(msg02.getE02LCMACC());
			userPO.setBank(msg02.getE02LCMBNK());
			userPO.setHeader2(msg02.getE02DSCPRO());
			userPO.setHeader3(msg02.getE02LCMTRF());
			userPO.setAccNum(msg02.getE02LCMACC());
			putDataInSession(session, userPO, msgError, msg02, null);
			if (isNotError) {
				PageToCall = "ELC0510_lc_details.jsp";
				if ("Y".equals(req.getParameter("E01DOMFLG"))){
					PageToCall = "ELC0510_lc_details_local.jsp"; 
				}
				callPage(PageToCall, req, res);
			} else {
				PageToCall = "ELC0510_lc_enter_maint.jsp";
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
	private void procActionOpening(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC051001Message msg01 = (ELC051001Message) msgHandle.initMessage("ELC051001", user.getH01USR(), "0005");
			initTransaction(userPO, user, "MAINTENANCE");
			msg01.setH01SCRCOD("01");
			msg01.setE01LCMAMF(userPO.getHeader7());
			msgHandle.setFieldsFromPage(req, msg01);
			msgHandle.sendMessage(msg01);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg01 = (ELC051001Message) msgHandle.receiveMessage();
			userPO.setIdentifier(msg01.getE01LCMACC());
			userPO.setHeader11(msg01.getE01LCMORF());
			userPO.setHeader12(msg01.getE01LCMTRF());
			userPO.setHeader13(msg01.getE01LCMPRO());
			userPO.setHeader14(msg01.getE01DSCPRO());
			putDataInSession(session, userPO, msgError, msg01, null);
			if (isNotError) {
				procReqCreditCondition(mc, user, req, res, screen);
			} else {
				if (msg01.getE01LCMTYP().equals("O")) {
					PageToCall = "ELC0510_lc_opening_import.jsp";
				} else {
					PageToCall = "ELC0510_lc_opening_export.jsp";
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
	private void procReqBasicInformation(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC051001Message msg01 = (ELC051001Message) msgHandle.initMessage("ELC051001", user.getH01USR(), "0002");
			initTransaction(userPO, user, "MAINTENANCE");
			msg01.setH01SCRCOD("01");
			try {
				msg01.setE01LCMACC(req.getParameter("E01LCMACC").toUpperCase());
			} catch (Exception e) {
				msg01.setE01LCMACC(userPO.getIdentifier());
			}
			try {
				msg01.setE01LCMCUN("E01LCMCUN");
			} catch (Exception e) {
			}
			try {
				msg01.setE01LCMSWF(req.getParameter("E01LCMSWF").toUpperCase());
			} catch (Exception e) {
			}
			try {
				msg01.setE01LCMAMF(req.getParameter("E01LCMAMF"));
			} catch (Exception e) {
				msg01.setE01LCMAMF(userPO.getHeader7());
			}
			userPO.setHeader7(msg01.getE01LCMAMF());
			
			try {
				msg01.setH01FLGMAS(req.getParameter("H01FLGMAS"));
			} catch (Exception e) {
			}
			userPO.setIdentifier(msg01.getE01LCMACC());
			msgHandle.sendMessage(msg01);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg01 = (ELC051001Message) msgHandle.receiveMessage();
			userPO.setHeader1(msg01.getE01LCMPRO());
			userPO.setIdentifier(msg01.getE01LCMACC());
			userPO.setBank(msg01.getE01LCMBNK());
			userPO.setHeader2(msg01.getE01LCMORF());
			userPO.setHeader3(msg01.getE01LCMTRF());
			userPO.setHeader14(msg01.getE01DSCPRO());
			userPO.setCusType(msg01.getH01FLGWK3());
			userPO.setAccOpt(msg01.getE01LCMOPT());
			userPO.setCurrency(msg01.getE01LCMCCY());
			putDataInSession(session, userPO, msgError, msg01, null);
			if (isNotError) {
				if (msg01.getE01LCMOPT().equals("N")) {
					res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSELC0500?SCREEN=3");
				} else {
					if (msg01.getE01LCMTYP().equals("O")) {
						PageToCall = "ELC0510_lc_opening_import.jsp";
					} else {
						PageToCall = "ELC0510_lc_opening_export.jsp";
					}
					callPage(PageToCall, req, res);
				}			
			} else {
				PageToCall = "ELC0510_lc_enter_maint.jsp";
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
	private void procActionNew(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC051001Message msg01 = (ELC051001Message) session.getAttribute("msgLC");
			msg01 = (ELC051001Message) msgHandle.initMessage(msg01, user.getH01USR(), "0005");
			userPO.setCusNum(req.getParameter("E01LCMACC"));
			initTransaction(userPO, user, "NEW");
			msg01.setH01SCRCOD("01");
			msgHandle.setFieldsFromPage(req, msg01);
			msgHandle.sendMessage(msg01);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg01 = (ELC051001Message) msgHandle.receiveMessage();
			userPO.setIdentifier(msg01.getE01LCMACC());
			userPO.setBank(msg01.getE01LCMBNK());
			userPO.setHeader1(msg01.getE01LCMPRO());
			userPO.setHeader2(msg01.getE01DSCPRO());
			userPO.setAccNum(msg01.getE01LCMACC().trim());
			putDataInSession(session, userPO, msgError, msg01, null);
			if (isNotError) {
				PageToCall = "ELC0510_lc_details.jsp";
				if ("Y".equals(req.getParameter("E01DOMFLG"))){
					PageToCall = "ELC0510_lc_details_local.jsp"; 
				}
			} else {
				if (msg01.getE01LCMTYP().equals("O")) { //Import
					PageToCall = "ELC0510_lc_opening_import.jsp";
				} else { //Export
					PageToCall = "ELC0510_lc_opening_export.jsp";
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
	private void procReqNew(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		String PageToCall = "ESD0711_products_detail.jsp";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC051001Message msg01 = (ELC051001Message) msgHandle.initMessage("ELC051001", user.getH01USR(), "0001");
			initTransaction(userPO, user, "NEW");
			msg01.setH01SCRCOD("01");
			try {
				msg01.setE01LCMPRO(req.getParameter("E01LCMPRO"));
			} catch (Exception e) {
			}
			try {
				msg01.setE01LCMATY(req.getParameter("typecode"));
			} catch (Exception e) {
			}
			try {
				msg01.setE01LCMBNK(req.getParameter("bank"));
			} catch (Exception e) {
			}
			msgHandle.sendMessage(msg01);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg01 = (ELC051001Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, msg01, null);
			if (isNotError) {
				if (msg01.getE01LCMTYP().equals("O")) { //Import
					PageToCall = "ELC0510_lc_opening_import.jsp";
				} else { //Export
					PageToCall = "ELC0510_lc_opening_export.jsp";
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
		String PageToCall = "ELC0510_lc_enter_maint.jsp";
		initTransaction(userPO, user, "MAINTENANCE");
		userPO.setHeader18("NO_MENU");
		session.setAttribute("hideMaintMenu", "Y");
		userPO.setProdCode("CC");
		userPO.setOption("LC");
		putDataInSession(session, userPO, null, new ELC051001Message(), null);
		callPage(PageToCall, req, res);
	}
	
	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void procReqAssignmentList(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			UserPos userPO = getUserPos(req);
			if (userPO == null){
				userPO = new UserPos();
			}
			ELC051005Message msg07 = (ELC051005Message) msgHandle.initMessage("ELC051005", user.getH01USR(), "0015");
			
			initTransaction(userPO, user, "");
			
			msg07.setH05FLGWK3("A");
			msg07.setH05SCRCOD("01");
			try {
				msg07.setE05LCMACC(req.getParameter("E05LCMACC"));
			} catch (Exception e) {
				msg07.setE05LCMACC("0");
			}
			userPO.setIdentifier(msg07.getE05LCMACC());
			msgHandle.sendMessage(msg07);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			JBObjList jbList = msgHandle.receiveMessageList("H05FLGMAS", JSEIBSProp.getMaxIterations());
			if (isNotError) {
				PageToCall = "ELC0510_lc_assignment_list.jsp";
			} else {
				PageToCall = "ELC0510_lc_enter_transfer.jsp";
			}
			putDataInSession(session, userPO, msgError, msg07, jbList);
			callPage(PageToCall, req, res);			

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 */
	private void procReqAssignment(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			UserPos userPO = getUserPos(req);
			
			if (userPO == null)
				userPO = new UserPos();
			
			String opCode = "";
			String action = "";
			try {
				opCode = req.getParameter("opCode");
				if (opCode.equals("0001")) {
					action = "NEW";
				} else {
					action = "MAINTENANCE";
				}
			}
			catch (Exception e) {
				if (userPO.getPurpose().equals("NEW")) {
					opCode = "0001";
				} else {
					opCode = "0002";
				}
			}
			ELC051005Message msg07 = (ELC051005Message) msgHandle.initMessage("ELC051005", user.getH01USR(), opCode);
			initTransaction(userPO, user, action);
			msg07.setH05FLGWK3("A");
			msg07.setH05SCRCOD("01");
			
			try {
				msg07.setE05LCMACC(userPO.getIdentifier());
			} catch (Exception e) {
				msg07.setE05LCMACC("");
			}
			
			try {
				msg07.setE05LCTNUM(req.getParameter("E05LCTNUM"));
			} catch (Exception e) {
				if(!userPO.getPurpose().equals("NEW"))
					msg07.setE05LCTNUM(userPO.getAccOpt());
			}
			
			userPO.setAccOpt(msg07.getE05LCTNUM());
			msgHandle.sendMessage(msg07);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg07 = (ELC051005Message) msgHandle.receiveMessage();
			userPO.setAccOpt(msg07.getE05LCTNUM());
			putDataInSession(session, userPO, msgError, msg07, null);
			if (isNotError) {
				PageToCall = "ELC0510_lc_assignment.jsp";
			} else {
				PageToCall = "ELC0510_lc_assignment_list.jsp";
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
	 */
	private void procActionAssignment(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC051005Message msg07 = (ELC051005Message) session.getAttribute("msgLC");
			msg07 = (ELC051005Message) msgHandle.initMessage(msg07, user.getH01USR(), "0005");
			String action = "";
			if (msg07.getH05OPECOD().equals("0001")) {
				action = "NEW";
			} else {
				action = "MAINTENANCE";
			}
			UserPos userPO = getUserPos(req);
			userPO.setPurpose(action);
			userPO.setID(user.getE01INT()); //Country Code

			msg07.setH05FLGWK3("A");
			msg07.setE05LCMACC(userPO.getIdentifier());
			msgHandle.setFieldsFromPage(req, msg07);
			msgHandle.sendMessage(msg07);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg07 = (ELC051005Message) msgHandle.receiveMessage();

			putDataInSession(session, userPO, msgError, msg07, null);
			if (isNotError) {
				procReqAssignmentList(mc, user, req, res, screen);
			} else {
				PageToCall = "ELC0510_lc_assignment.jsp";
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
	 */
	private void procReqAssignmentCommission(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC051005Message msg07 = (ELC051005Message) session.getAttribute("msgLC");
			msg07 = (ELC051005Message) msgHandle.initMessage(msg07, user.getH01USR(), "0008");
			UserPos userPO = getUserPos(req);
			initTransaction(userPO, user, "");
			msg07.setH05SCRCOD("01");
			msg07.setH05FLGWK3("A");
			msg07.setE05LCMACC(userPO.getIdentifier());
			msg07.setE05LCTNUM(userPO.getAccOpt());
			msgHandle.sendMessage(msg07);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg07 = (ELC051005Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, msg07, null);
			if (isNotError) {
				PageToCall = "ELC0510_lc_assignment_commission.jsp";
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
	 */
	private void procActionAssignmentCommission(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC051005Message msg07 = (ELC051005Message) session.getAttribute("msgLC");
			msg07 = (ELC051005Message) msgHandle.initMessage(msg07, user.getH01USR(), "0016");
			String action = "";
			if (msg07.getH05OPECOD().equals("0001")) {
				action = "NEW";
			} else {
				action = "MAINTENANCE";
			}

			UserPos userPO = getUserPos(req);
			initTransaction(userPO, user, action);			
			
			msg07.setH05FLGWK3("A");
			msg07.setE05LCMACC(userPO.getIdentifier());
			msgHandle.setFieldsFromPage(req, msg07);
			msgHandle.sendMessage(msg07);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg07 = (ELC051005Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, msg07, null);
			if (isNotError) {
				procReqAssignmentList(mc, user, req, res, screen);
			} else {
				PageToCall = "ELC0510_lc_assignment.jsp";
				callPage(PageToCall, req, res);
			}
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}
	
	private void initTransaction(UserPos userPO, ESS0030DSMessage user, String purpose) {
		initTransaction(userPO, user, "", purpose);
	}
	private void initTransaction(UserPos userPO, ESS0030DSMessage user, String optMenu, String purpose) {
		if (!optMenu.equals("")) userPO.setOption(optMenu);
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
	
	private void putDataInSession(HttpSession session, UserPos userPO, ELEERRMessage msgError, MessageRecord msg, JBObjList jbList) {
		flexLog("Putting java beans into the session");

		if (msgError == null) {
			msgError = new ELEERRMessage(); 
		}
		session.setAttribute("error", msgError);
		session.setAttribute("userPO", userPO);
		if (msg != null) session.setAttribute("msgLC", msg);
		if (jbList != null) session.setAttribute("jbList", jbList);
	}

}
