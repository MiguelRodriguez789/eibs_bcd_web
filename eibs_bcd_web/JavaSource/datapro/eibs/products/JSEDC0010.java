package datapro.eibs.products;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.Socket;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDC001001Message;
import datapro.eibs.beans.EDC001002Message;
import datapro.eibs.beans.EDC001005Message;
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


public class JSEDC0010 extends SuperServlet {

    String LangPath = "s/";

	// DC 
    protected static final int R_OPENING = 1;
    protected static final int A_OPENING = 2;
    protected static final int R_OPENING_MAINT = 3;
    protected static final int A_OPENING_MAINT = 4;

    protected static final int R_COMMISSIONS = 5;
    protected static final int A_COMMISSIONS = 6;
    protected static final int R_SPECIAL_CODES = 7;
    protected static final int A_SPECIAL_CODES = 8;
    protected static final int R_SPECIAL_INST = 9;
    protected static final int A_SPECIAL_INST = 10;

	protected static final int R_OPTION_MENU = 50;
	protected static final int A_OPTION_MENU = 51;	

    protected static final int R_ENTER_MAINT = 100;

	protected static final int R_CLAUSULA = 1111;
	
    public JSEDC0010() {
		super();
	}

    @Override
    public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

    @Override
    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
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
			LangPath = SuperServlet.rootPath + user.getE01LAN() + "/";

			MessageContext mc = null;
			try {
				mc = new MessageContext(super.getMessageHandler("EDC0010", req));

				try {
						screen = Integer.parseInt(req.getParameter("SCREEN"));
						flexLog("Screen  Number: " + screen);
				} catch (Exception e) {
						flexLog("Screen set to default value");
				}

				String PageToCall = "";

				switch (screen)	{
					case R_OPENING :
						procReqOpening(mc, user, req, res, screen);
						break;
					case A_OPENING :
						procActionOpening(mc, user, req, res, screen);
						break;
					case R_OPENING_MAINT :
						procReqOpeningMaint(mc, user, req, res, screen);
						break;
					case A_OPENING_MAINT :
						procActionOpeningMaint(mc, user, req, res, screen);
						break;
					case R_COMMISSIONS :
						procReqCommissions(mc, user, req, res, screen);
						break;
					case A_COMMISSIONS :
						procActionCommissions(mc, user, req, res, screen);
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
					case R_ENTER_MAINT :
						procReqEnterMaint(req, res, screen);
						break;
    				case R_OPTION_MENU: // this will handle all requests made from option menu
    					procRecOptionMenu(mc, user, req, res, screen);
    					break;
    				case A_OPTION_MENU: // this will handle all requests made from option menu
    					procActionOptionMenu(mc, user, req, res, screen);
    					break;					
    				case R_CLAUSULA:
    					procRecClausula(mc, user, req, res, screen);
    					break;
						default :
						PageToCall = "MISC_not_available.jsp";
						callPage(PageToCall, req, res);
						break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				res.sendRedirect(SuperServlet.srctx + LangPath + SuperServlet.sckNotRespondPage);
			} finally {
				if (mc != null) {
						mc.close();
				}
				flexLog("Socket used by JSEDC0010 closed.");
			}
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
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			EDC001005Message msg = (EDC001005Message) mc.getMessageRecord("EDC001005");
			userPO.setPurpose("MAINTENANCE");
			userPO.setID(user.getE01INT()); 
			msg.setH05USERID(user.getH01USR());
			msg.setH05OPECOD("0003");
			msg.setH05SCRCOD("01");
			msg.setE05LCDACC(userPO.getIdentifier());
			msg.setE05LCDPRO(userPO.getHeader1());
			msg.setE05LCDBNK(userPO.getBank());
			try {
				msg.setE05LCDFCD(req.getParameter("E05LCDFCD"));
			} catch (Exception e) {
			}
			try {
				msg.setE05CLSTXN(req.getParameter("E05CLSTXN"));
			} catch (Exception e) {
			}
			if (msg.getE05CLSTXN().equals("0")) {
				try {
					msg.setE05CLSTXN(req.getParameter("ClauseCode"));
				} catch (Exception e) {
				}				
			}
			msgHandle.sendMessage(msg);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg = (EDC001005Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "msg", msg);
			if (isNotError) {
				PageToCall = "EDC0010_dc_field_info.jsp";
				callPage(PageToCall, req, res);
			}
		
		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> " + e.getMessage());
		}
	}	
	
	protected void redirect(String servletName, HttpServletResponse res) throws IOException {
		flexLog("Redirect to servlet: " + servletName);
		if (servletName.indexOf("/servlet/") == -1) {
			res.sendRedirect(srctx + "/servlet/" + servletName);
		} else {
			res.sendRedirect(srctx + servletName);	
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
			EDC001005Message msg = (EDC001005Message) session.getAttribute("msg");
			msg = (EDC001005Message) msgHandle.initMessage(msg, user.getH01USR(), "0005");
			userPO.setID(user.getE01INT()); // Country Code
			msg.setH05SCRCOD("01");
			msgHandle.setFieldsFromPage(req, msg);
			msgHandle.sendMessage(msg);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg = (EDC001005Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "msg", msg);
			if (isNotError) {
				redirect("datapro.eibs.products.JSEDC0010?SCREEN=3&E01DCMPRO=" + msg.getE05LCDPRO() + "&E01DCMBNK=" + msg.getE05LCDBNK() + "&E01DCMACC=" + msg.getE05LCDACC(), res);
			} else {
				PageToCall = "EDC0010_dc_field_info.jsp";
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
	private void procRecOptionMenu(MessageContext mc, ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, int screen)
			throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = (datapro.eibs.beans.UserPos) session
				.getAttribute("userPO");
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			EDC001005Message msg = (EDC001005Message) msgHandle.initMessage(
					"EDC001005", user.getH01USR(), "0002");
			userPO.setID(user.getE01INT()); // Country Code
			msg.setH05SCRCOD("01");
			msg.setE05LCDACC(userPO.getIdentifier());
			msg.setE05LCDPRO(userPO.getHeader1());
			msg.setE05LCDBNK(userPO.getBank());
			try {
				msg.setE05LCDFCD(req.getParameter("CODE"));
			} catch (Exception e) {
			}
			msgHandle.sendMessage(msg);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg = (EDC001005Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, "msg", msg);
			if (isNotError) {
				PageToCall = "EDC0010_dc_field_info.jsp";
				callPage(PageToCall, req, res);
			}

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage());
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 */
	private void procReqEnterMaint(HttpServletRequest req, HttpServletResponse res, int screen) throws IOException {
		HttpSession session = req.getSession(false);
		UserPos userPO = getUserPos(req);
		initTransaction(userPO, String.valueOf(screen), "MAINTENANCE", "");
		putDataInSession(session, userPO, null, "dcNew", null);
		String PageToCall = "EDC0010_dc_enter_maint.jsp";
		callPage(PageToCall, req, res);
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void procActionSpecialInst(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = req.getSession(false);
		UserPos userPO = getUserPos(req);

		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ESD000005Message msg = (ESD000005Message) session.getAttribute("dcInst");
			msg = (ESD000005Message) msgHandle.initMessage(msg, user.getH01USR(), "0005");
			msg.setH05USR(user.getH01USR());
			msg.setH05PGM("EDC0010");
			msg.setH05TIM(SuperServlet.getTimeStamp());
			msg.setH05SCR("01");
			msg.setH05OPE("0005");
			msg.setE05ACC(userPO.getIdentifier());
//			msg.setE05ACD("4");
			initTransaction(userPO, String.valueOf(screen), "MAINTENANCE", "");
			msgHandle.setFieldsFromPage(req, msg);
			msgHandle.sendMessage(msg);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg = (ESD000005Message) msgHandle.receiveMessage();
			if (isNotError) {
				procReqOpeningMaint(mc, user, req, res, screen);
			} else {
				String PageToCall = "EDC0010_dc_special_inst.jsp";
				putDataInSession(session, userPO, msgError, "dcInst", msg);	
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
		HttpSession session = req.getSession(false);
		UserPos userPO = getUserPos(req);

		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ESD000005Message msg = (ESD000005Message) msgHandle.initMessage("ESD000005", user.getH01USR(), "0002");
			msg.setH05USR(user.getH01USR());
			msg.setH05PGM("EDC0010");
			msg.setH05TIM(SuperServlet.getTimeStamp());
			msg.setH05SCR("01");
			msg.setH05OPE("0002");
			msg.setE05ACC(userPO.getIdentifier());
//			msg.setE05ACD("4");
			initTransaction(userPO, String.valueOf(screen), "MAINTENANCE", "");
			msgHandle.sendMessage(msg);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			msg = (ESD000005Message) msgHandle.receiveMessage();
			String PageToCall = "EDC0010_dc_special_inst.jsp";
			putDataInSession(session, userPO, msgError, "dcInst", msg);	
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
	private void procActionSpecialCodes(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = req.getSession(false);
		UserPos userPO = getUserPos(req);

		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ESD000002Message msg = (ESD000002Message) msgHandle.initMessage("ESD000002", user.getH01USR(), "0005");
			msg.setH02USR(user.getH01USR());
			msg.setH02PGM("EDC0010");
			msg.setH02TIM(SuperServlet.getTimeStamp());
			msg.setH02SCR("01");
			msg.setH02OPE("0005");
			initTransaction(userPO, String.valueOf(screen), "MAINTENANCE", "");
			msgHandle.setFieldsFromPage(req, msg);
			msgHandle.sendMessage(msg);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg = (ESD000002Message) msgHandle.receiveMessage();
			if (isNotError) {
				procReqOpeningMaint(mc, user, req, res, screen);
			} else {
				String PageToCall = "EDC0010_dc_codes.jsp";
				putDataInSession(session, userPO, msgError, "dcCodes", msg);	
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
		HttpSession session = req.getSession(false);
		UserPos userPO = getUserPos(req);

		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ESD000002Message msg = (ESD000002Message) msgHandle.initMessage("ESD000002", user.getH01USR(), "0002");
			msg.setH02USR(user.getH01USR());
			msg.setH02PGM("EDC0010");
			msg.setH02TIM(SuperServlet.getTimeStamp());
			msg.setH02SCR("01");
			msg.setH02OPE("0002");
			msg.setE02ACC(userPO.getIdentifier());
			initTransaction(userPO, String.valueOf(screen), "MAINTENANCE", "");
			msgHandle.sendMessage(msg);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			msg = (ESD000002Message) msgHandle.receiveMessage();
			String PageToCall = "EDC0010_dc_codes.jsp";
			putDataInSession(session, userPO, msgError, "dcCodes", msg);	
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
	private void procActionCommissions(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = req.getSession(false);
		UserPos userPO = getUserPos(req);

		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			EDC001002Message msg = (EDC001002Message) msgHandle.initMessage("EDC001002", user.getH01USR(), "0005");
			initTransaction(userPO, String.valueOf(screen), "MAINTENANCE", "");
			userPO.setCusNum(req.getParameter("E01DCMCUN"));
			msg.setH02SCRCOD("01");
			msgHandle.setFieldsFromPage(req, msg);
			msgHandle.sendMessage(msg);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg = (EDC001002Message) msgHandle.receiveMessage();
			if (isNotError) {
				procReqOpeningMaint(mc, user, req, res, screen);
			} else {
				String PageToCall = "EDC0010_dc_commissions.jsp";
				putDataInSession(session, userPO, msgError, "dcNew2", msg);	
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
	private void procReqCommissions(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = req.getSession(false);
		UserPos userPO = getUserPos(req);

		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			EDC001002Message msg = (EDC001002Message) msgHandle.initMessage("EDC001002", user.getH01USR(), "0002");
			msg.setH02SCRCOD("01");
			msg.setE02DCMBNK(userPO.getBank());
			try {
			    msg.setE02DCMACC(userPO.getIdentifier());
			    msg.setE02DCMPRO(userPO.getHeader1());
			} catch (Exception e) {
			}
			initTransaction(userPO, String.valueOf(screen), "MAINTENANCE", "");
			msgHandle.sendMessage(msg);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			msg = (EDC001002Message) msgHandle.receiveMessage();
			String PageToCall = "EDC0010_dc_commissions.jsp";
			putDataInSession(session, userPO, msgError, "dcNew2", msg);	
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
		HttpSession session = req.getSession(false);
		UserPos userPO = getUserPos(req);

		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			EDC001001Message msg = (EDC001001Message) session.getAttribute("dcNew");
			msg = (EDC001001Message) msgHandle.initMessage(msg, user.getH01USR(), "0005");
			initTransaction(userPO, String.valueOf(screen), "MAINTENANCE", "");
			userPO.setCusNum(req.getParameter("E01DCMCUN"));
			msg.setH01SCRCOD("01");
			msgHandle.setFieldsFromPage(req, msg);
			msgHandle.sendMessage(msg);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			msg = (EDC001001Message) msgHandle.receiveMessage();
			String PageToCall = "EDC0010_dc_opening.jsp";
			if (msg.getE01DCMTYP().equals("I")) {
				PageToCall = "EDC0010_dc_opening_incoming.jsp";
			} else {
				PageToCall = "EDC0010_dc_opening_outgoing.jsp";
			}
			putDataInSession(session, userPO, msgError, "dcNew", msg);	
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
	private void procReqOpeningMaint(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = req.getSession(false);
		UserPos userPO = getUserPos(req);

		try {
			String PageToCall = "EDC0010_dc_enter_maint.jsp";
			if ((req.getParameter("E01DCMACC") != null)
						|| ((userPO.getIdentifier() != null) && !userPO.getIdentifier().equals(""))) {
				String opCode = "";
				if (req.getParameter("H01OPECOD") == null) {
						opCode = "0002";
				} else {
						opCode = req.getParameter("H01OPECOD");
				}
				MessageContextHandler msgHandle = new MessageContextHandler(mc);
				EDC001001Message msg = (EDC001001Message) msgHandle.initMessage("EDC001001", user.getH01USR(), opCode);
				msg.setH01SCRCOD("01");
				try {
						msg.setE01DCMACC(req.getParameter("E01DCMACC").toUpperCase());
				} catch (Exception e) {
						msg.setE01DCMACC(userPO.getIdentifier());
				}
				initTransaction(userPO, String.valueOf(screen), "MAINTENANCE", msg.getE01DCMACC());
				msgHandle.sendMessage(msg);
				ELEERRMessage msgError = msgHandle.receiveErrorMessage();
				boolean isNotError = msgError.getERRNUM().equals("0");
				msg = (EDC001001Message) msgHandle.receiveMessage();
				if (isNotError) {
						boolean firstScreen = ((msgError.getBigDecimalERDR01().intValue() == 14) || (msgError
							.getBigDecimalERDR01().intValue() == 223));
						if (!firstScreen) {
						if (msg.getE01DCMTYP().equals("I")) {
							PageToCall = "EDC0010_dc_opening_incoming.jsp";
						} else {
							PageToCall = "EDC0010_dc_opening_outgoing.jsp";
						}
					}
				}
				userPO.setHeader1(msg.getE01DCMPRO());
				userPO.setIdentifier(msg.getE01DCMACC());
				userPO.setAccNum(msg.getE01DCMACC());
				userPO.setBank(msg.getE01DCMBNK());
				putDataInSession(session, userPO, msgError, "dcNew", msg);
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
	private void procActionOpening(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = req.getSession(false);
		UserPos userPO = getUserPos(req);

		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			EDC001001Message msg = (EDC001001Message) session.getAttribute("dcNew");
			msg = (EDC001001Message) msgHandle.initMessage(msg, user.getH01USR(), "0005");
			initTransaction(userPO, String.valueOf(screen), "MAINTENANCE", "");
			userPO.setCusNum(req.getParameter("E01DCMCUN"));
			msg.setH01SCRCOD("01");
			msgHandle.setFieldsFromPage(req, msg);
			msgHandle.sendMessage(msg);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg = (EDC001001Message) msgHandle.receiveMessage();
			String PageToCall = "MISC_not_available.jsp";
			if (isNotError) {
				userPO.setIdentifier(msg.getE01DCMACC());
				userPO.setAccNum(msg.getE01DCMACC());
			}	
			// PageToCall = "EDC0010_dc_opening.jsp";
			if (msg.getE01DCMTYP().equals("I")) {
				PageToCall = "EDC0010_dc_opening_incoming.jsp";
			} else {
				PageToCall = "EDC0010_dc_opening_outgoing.jsp";
			}
			putDataInSession(session, userPO, msgError, "dcNew", msg);	
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
	private void procReqOpening(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = req.getSession(false);
		UserPos userPO = getUserPos(req);

		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			EDC001001Message msg = (EDC001001Message) msgHandle.initMessage("EDC001001", user.getH01USR(), "0001");
			initTransaction(userPO, String.valueOf(screen), "NEW", "");
			msg.setH01SCRCOD("01");
			try {
				msg.setE01DCMPRO(req.getParameter("E01DCMPRO"));
			} catch (Exception e) {
			}
			try {
				msg.setE01DCMBNK(req.getParameter("bank"));
			} catch (Exception e) {
			}
			msgHandle.sendMessage(msg);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg = (EDC001001Message) msgHandle.receiveMessage();
			String PageToCall = "MISC_not_available.jsp";
			putDataInSession(session, userPO, msgError, "dcNew", msg);	
			if (isNotError) {
				// PageToCall = "EDC0010_dc_opening.jsp";
				if (msg.getE01DCMTYP().equals("I")) {
						PageToCall = "EDC0010_dc_opening_incoming.jsp";
				} else {
						PageToCall = "EDC0010_dc_opening_outgoing.jsp";
				}
				callPage(PageToCall, req, res);
			} else {
				flexLog("About to call Page: " + LangPath + "ESD0711_products_detail.jsp");
				String firstLink =
						SuperServlet.webAppPath
						+ LangPath
						+ "ESD0711_products_detail.jsp?appcode="
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

	private void initTransaction(UserPos userPO, String optMenu, String purpose, String number) {
		userPO.setOption(optMenu);
		userPO.setPurpose(purpose);
		if (!number.equals("")) {
			userPO.setIdentifier(number);
			userPO.setAccNum(number);
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

	private void putDataInSession(HttpSession session, UserPos userPO, ELEERRMessage msgError, String msg_name, MessageRecord msg) {
		flexLog("Putting java beans into the session");

		if (msgError == null) {
			msgError = new ELEERRMessage(); 
		}
		session.setAttribute("error", msgError);
		session.setAttribute("userPO", userPO);
		if (msg != null) {
			session.setAttribute(msg_name, msg);
		}
	}

}