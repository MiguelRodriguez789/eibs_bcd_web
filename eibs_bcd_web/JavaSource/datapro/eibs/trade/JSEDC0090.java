package datapro.eibs.trade;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.generic.tool.Util;

import datapro.eibs.beans.EDC009001Message;
import datapro.eibs.beans.EDC010001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD000002Message;
import datapro.eibs.beans.ESD000005Message;
import datapro.eibs.beans.ESD071105Message;
import datapro.eibs.beans.ESD0715DSMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.MessageContext;
import datapro.eibs.sockets.MessageContextHandler;
import datapro.eibs.sockets.MessageRecord;

/**
 * @version 	1.0
 * @author	erodriguez
 */
public class JSEDC0090 extends SuperServlet {

	String LangPath = "s/";
	
	protected static final int R_BASIC_INQ = 1;
	protected static final int R_CODES_INQ = 3;
	protected static final int R_STATEMENT = 5;
	protected static final int A_STATEMENT = 6;
	protected static final int R_SPECIAL_INST_INQ = 7;
	protected static final int R_PRODUCTS = 9;
	protected static final int R_RATE_TB = 11;
	protected static final int R_GUARANTEE = 13;
	protected static final int R_DOCUMENT = 15;

	// entering options
	protected static final int R_ENTER_INQUIRY = 100;
	protected static final int A_ENTER_INQUIRY = 200;
	protected static final int R_LIST			= 210;
	
	public JSEDC0090() {
		super();
	}
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}
	
	public void destroy() {
		try {
			flexLog("free resources used by JSEDC0100");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
		}
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
				mc = new MessageContext(super.getMessageHandler("EDC0090", req));
						
				try {
					screen = Integer.parseInt(req.getParameter("SCREEN"));
					flexLog("Screen  Number: " + screen);
				} catch (Exception e) {
					flexLog("Screen set to default value");
				}
				
				String PageToCall = "";

				switch (screen)	{
					case R_BASIC_INQ :
						procReqInqBasic(mc, user, req, res, screen);
						break;
					case R_CODES_INQ :
						procReqSpecialCodesInq(mc, user, req, res, screen);
						break;
					case R_SPECIAL_INST_INQ :
						procReqEspInstInq(mc, user, req, res, screen);
						break;
					case R_PRODUCTS :
						procReqProductLC(mc, user, req, res, screen);
						break;
					case R_RATE_TB :
						procReqInqTable(mc, user, req, res, screen);
						break;
					case R_ENTER_INQUIRY :
						procReqEnterInquiry(req, res, screen);
						break;
					case A_ENTER_INQUIRY :
						procActionEnterInquiry(mc, user, req, res, screen);
						break;
					case R_LIST :
						procReqList(mc, user, req, res, session);
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
				flexLog("Socket used by JSEDC0100 closed.");
			}
		}	
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 */
	private void procReqEspInstInq(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ESD000005Message msg = (ESD000005Message) msgHandle.initMessage("ESD000005", user.getH01USR(), "0004");
			initTransaction(userPO, "DV", "INQUIRY");
			msg.setH05USR(user.getH01USR());
			msg.setH05PGM("EDL0130");
			msg.setH05TIM(getTimeStamp());
			msg.setH05SCR("01");
			msg.setH05OPE("0004");
			msg.setE05ACC(userPO.getIdentifier());
			msg.setE05ACD(userPO.getApplicationCode());
			msgHandle.sendMessage(msg);
			MessageRecord message = msgHandle.receiveMessage();
			
			String PageToCall = "MISC_not_available.jsp";

			if (message.getFormatName().equals("ELEERR")) {
				ELEERRMessage msgError = (ELEERRMessage) message;
				session.setAttribute("error", msgError);
				EDC010001Message collBasic = (EDC010001Message) session.getAttribute("collBasic");
				if (userPO.getHeader21().equals("D")) {
					if (collBasic.getE01DCMTYP().equals("I")) {
						PageToCall = "EDC0100_coll_doc_inq_basic_incoming.jsp";
					} else {
						PageToCall = "EDC0100_coll_doc_inq_basic_outgoing.jsp";
					}
				} else {	
					if (collBasic.getE01DCMTYP().equals("I")) {
						PageToCall = "EDC0100_coll_simp_inq_basic_incoming.jsp";
					} else {
						PageToCall = "EDC0100_coll_simp_inq_basic_outgoing.jsp";
					}
				}
			} else {
				if (message.getFormatName().equals("ESD000005")) {
					msg = (ESD000005Message) message;
					PageToCall = "EDC0100_coll_inq_special_inst.jsp";
				}	
			}		
			putDataInSession(userPO, session, "collInst", msg);
			callPage(PageToCall, req, res);
		
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	private void procReqList(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = new MessageProcessor(mc);
			EDC009001Message msg = (EDC009001Message) mp.getMessageRecord("EDC009001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDC0100");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0015");
			
			setMessageRecord(req, msg);

			mp.sendMessage(msg);
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "EDC0090_dc_enter_inquiry.jsp";
			} else {
				pageName = "EDC0090_dc_inquiry_list.jsp";
			}

			session.setAttribute("jbList", list);

			callPage(pageName, req, res);

		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 */
	private void procActionEnterInquiry(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			EDC009001Message msg = (EDC009001Message) msgHandle.initMessage("EDC009001", user.getH01USR(), "0004");
			initTransaction(userPO, "DV", "INQUIRY");
			msg.setH01SCRCOD("01");
			try {
				msg.setE01DCMACC(req.getParameter("E01DCMACC"));
			} catch (Exception e)	{
				msg.setE01DCMACC("0");
			}
			msgHandle.sendMessage(msg);
			MessageRecord message = msgHandle.receiveMessage();
			
			String PageToCall = "MISC_not_available.jsp";

			if (message.getFormatName().equals("ELEERR")) {
				ELEERRMessage msgError = (ELEERRMessage) message;
				session.setAttribute("error", msgError);
				PageToCall = "EDC0090_dc_enter_inquiry.jsp";
			} else {
				if (message.getFormatName().equals("EDC009001")) {
					msg = (EDC009001Message) message;
					userPO.setIdentifier(msg.getE01DCMACC());
					userPO.setApplicationCode(msg.getE01DCMACD());
					userPO.setBank(msg.getE01DCMBNK());
					userPO.setHeader1(msg.getE01DCMPRO());
/*					userPO.setHeader2(msg.getE01DCMCUN());
					userPO.setHeader3(msg.getE01CUSNA1());*/
					userPO.setCurrency(msg.getE01DCMCCY());
					userPO.setHeader21(msg.getE01DCMSTY());
					/*userPO.setHeader22(msg.getE01DCMTAR());*/
					userPO.setHeader23(msg.getE01DCMATY());
					/*userPO.setOfficer(msg.getE01DCMOFC() + " - " + msg.getE01DSCOFC());*/
			
					EDC010001Message collBasic = (EDC010001Message) session.getAttribute("collBasic");
					if (userPO.getHeader21().equals("D")) {
						if (collBasic.getE01DCMTYP().equals("I")) {
							PageToCall = "EDC0100_coll_doc_inq_basic_incoming.jsp";
						} else {
							PageToCall = "EDC0100_coll_doc_inq_basic_outgoing.jsp";
						}
					} else {	
						if (collBasic.getE01DCMTYP().equals("I")) {
							PageToCall = "EDC0100_coll_simp_inq_basic_incoming.jsp";
						} else {
							PageToCall = "EDC0100_coll_simp_inq_basic_outgoing.jsp";
						}
					} 
				}	
			}		
			putDataInSession(userPO, session, "collBasic", msg);
			callPage(PageToCall, req, res);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new IOException(e.getMessage());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
			throw new IOException(e.getMessage());
		} catch (InstantiationException e) {
			e.printStackTrace();
			throw new IOException(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			throw new IOException(e.getMessage());
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 */
	private void procReqEnterInquiry(HttpServletRequest req, HttpServletResponse res, int screen) throws IOException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		
		initTransaction(userPO, "DV", "INQUIRY");
		putDataInSession(userPO, session, "", null);
		String PageToCall = "EDC0090_dc_enter_inquiry.jsp";
		callPage(PageToCall, req, res);
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 */
	private void procReqInqTable(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ESD0715DSMessage msg = (ESD0715DSMessage) msgHandle.initMessage("ESD0715DS", user.getH01USR(), "0004");
			initTransaction(userPO, "DV", "INQUIRY");
			msg.setE01SELBNK(userPO.getBank());
			msg.setE01SELTLN(Util.justifyRight(userPO.getHeader22(), 2));
			msg.setE01SELTYP(userPO.getHeader23());
			msgHandle.sendMessage(msg);
			MessageRecord message = msgHandle.receiveMessage();
			
			String PageToCall = "MISC_not_available.jsp";

			if (message.getFormatName().equals("ELEERR")) {
				ELEERRMessage msgError = (ELEERRMessage) message;
				session.setAttribute("error", msgError);
				EDC010001Message collBasic = (EDC010001Message) session.getAttribute("collBasic");
				if (userPO.getHeader21().equals("D")) {
					if (collBasic.getE01DCMTYP().equals("I")) {
						PageToCall = "EDC0100_coll_doc_inq_basic_incoming.jsp";
					} else {
						PageToCall = "EDC0100_coll_doc_inq_basic_outgoing.jsp";
					}
				} else {	
					if (collBasic.getE01DCMTYP().equals("I")) {
						PageToCall = "EDC0100_coll_simp_inq_basic_incoming.jsp";
					} else {
						PageToCall = "EDC0100_coll_simp_inq_basic_outgoing.jsp";
					}
				}
			} else {
				if (message.getFormatName().equals("ESD0715DS")) {
					msg = (ESD0715DSMessage) message;
					PageToCall = "EDC0100_coll_inq_fee_tab.jsp";
				}	
			}		
			putDataInSession(userPO, session, "colProdInq", msg);
			callPage(PageToCall, req, res);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new IOException(e.getMessage());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
			throw new IOException(e.getMessage());
		} catch (InstantiationException e) {
			e.printStackTrace();
			throw new IOException(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			throw new IOException(e.getMessage());
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 */
	private void procReqProductLC(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ESD071105Message msg = (ESD071105Message) msgHandle.initMessage("ESD071105", user.getH01USR(), "0004");
			initTransaction(userPO, "DV", "INQUIRY");
			msg.setE05APCCDE(userPO.getHeader1());
			msg.setE05APCBNK(userPO.getBank());
			msgHandle.sendMessage(msg);
			MessageRecord message = msgHandle.receiveMessage();
			
			String PageToCall = "MISC_not_available.jsp";

			if (message.getFormatName().equals("ELEERR")) {
				ELEERRMessage msgError = (ELEERRMessage) message;
				session.setAttribute("error", msgError);
				EDC010001Message collBasic = (EDC010001Message) session.getAttribute("collBasic");
				if (userPO.getHeader21().equals("D")) {
					if (collBasic.getE01DCMTYP().equals("I")) {
						PageToCall = "EDC0100_coll_doc_inq_basic_incoming.jsp";
					} else {
						PageToCall = "EDC0100_coll_doc_inq_basic_outgoing.jsp";
					}
				} else {	
					if (collBasic.getE01DCMTYP().equals("I")) {
						PageToCall = "EDC0100_coll_simp_inq_basic_incoming.jsp";
					} else {
						PageToCall = "EDC0100_coll_simp_inq_basic_outgoing.jsp";
					}
				}
			} else {
				if (message.getFormatName().equals("ESD071105")) {
					msg = (ESD071105Message) message;
					PageToCall = "EDC0100_coll_inq_products.jsp";
				}	
			}		
			putDataInSession(userPO, session, "colProdInq", msg);
			callPage(PageToCall, req, res);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new IOException(e.getMessage());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
			throw new IOException(e.getMessage());
		} catch (InstantiationException e) {
			e.printStackTrace();
			throw new IOException(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			throw new IOException(e.getMessage());
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 */
	private void procReqSpecialCodesInq(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ESD000002Message msg = (ESD000002Message) msgHandle.initMessage("ESD000002", user.getH01USR(), "0004");
			initTransaction(userPO, "DV", "INQUIRY");
			msg.setH02USR(user.getH01USR());
			msg.setH02PGM("ESD0000");
			msg.setH02TIM(getTimeStamp());
			msg.setH02SCR("01");
			msg.setH02OPE("0004");
			msg.setE02ACC(userPO.getIdentifier());
			msgHandle.sendMessage(msg);
			
			MessageRecord message = msgHandle.receiveMessage();
			
			String PageToCall = "MISC_not_available.jsp";

			if (message.getFormatName().equals("ELEERR")) {
				ELEERRMessage msgError = (ELEERRMessage) message;
				session.setAttribute("error", msgError);
				EDC010001Message collBasic = (EDC010001Message) session.getAttribute("collBasic");
				if (userPO.getHeader21().equals("D")) {
					if (collBasic.getE01DCMTYP().equals("I")) {
						PageToCall = "EDC0100_coll_doc_inq_basic_incoming.jsp";
					} else {
						PageToCall = "EDC0100_coll_doc_inq_basic_outgoing.jsp";
					}
				} else {	
					if (collBasic.getE01DCMTYP().equals("I")) {
						PageToCall = "EDC0100_coll_simp_inq_basic_incoming.jsp";
					} else {
						PageToCall = "EDC0100_coll_simp_inq_basic_outgoing.jsp";
					}
				}
			} else {
				if (message.getFormatName().equals("ESD000002")) {
					msg = (ESD000002Message) message;
					PageToCall = "EDC0100_coll_inq_codes.jsp";
				}	
			}		
			putDataInSession(userPO, session, "collCodes", msg);
			callPage(PageToCall, req, res);
		
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new IOException(e.getMessage());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
			throw new IOException(e.getMessage());
		} catch (InstantiationException e) {
			e.printStackTrace();
			throw new IOException(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			throw new IOException(e.getMessage());
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 */
	private void procReqInqBasic(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = getUserPos(req);
		
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			EDC010001Message msg = (EDC010001Message) msgHandle.initMessage("EDC010001", user.getH01USR(), "0004");
			initTransaction(userPO, "DV", "INQUIRY");
			msg.setH01SCRCOD("01");
			msg.setE01DCMACC(userPO.getIdentifier());
			msgHandle.sendMessage(msg);
			MessageRecord message = msgHandle.receiveMessage();
			
			String PageToCall = "MISC_not_available.jsp";

			if (message.getFormatName().equals("ELEERR")) {
				ELEERRMessage msgError = (ELEERRMessage) message;
				session.setAttribute("error", msgError);
				PageToCall = "EDC0100_coll_enter_inquiry.jsp";
			} else {
				if (message.getFormatName().equals("EDC010001")) {
					msg = (EDC010001Message) message;
					if (msg.getE01DCMTYP().equals("I")) {
						PageToCall = "EDC0100_coll_doc_inq_basic_incoming.jsp";
					} else {
						PageToCall = "EDC0100_coll_doc_inq_basic_outgoing.jsp";
					}
					userPO.setIdentifier(msg.getE01DCMACC());
					userPO.setBank(msg.getE01DCMBNK());
					userPO.setHeader1(msg.getE01DCMPRO());
					userPO.setHeader2(msg.getE01DCMCUN());
					userPO.setHeader3(msg.getE01CUSNA1());
					userPO.setCurrency(msg.getE01DCMCCY());
					userPO.setHeader21(msg.getE01DCMSTY());
					userPO.setHeader22(msg.getE01DCMTAR());
					userPO.setHeader23(msg.getE01DCMATY());
				}	
			}		
			putDataInSession(userPO, session, "collBasic", msg);
			callPage(PageToCall, req, res);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new IOException(e.getMessage());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
			throw new IOException(e.getMessage());
		} catch (InstantiationException e) {
			e.printStackTrace();
			throw new IOException(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			throw new IOException(e.getMessage());
		}
	}

	private void initTransaction(UserPos userPO,  String optMenu, String purpose) {
		try {
			userPO.setOption(optMenu);
			userPO.setPurpose(purpose);
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
	
	private void putDataInSession(UserPos userPO, HttpSession session, String msg_name, MessageRecord msg) {
		try {
			flexLog("Putting java beans into the session");

			session.setAttribute("userPO", userPO);
			if (msg != null) session.setAttribute(msg_name, msg);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error at putBeansInSession(): " + e);
			throw new RuntimeException("Socket Communication Error");
		}
	}

}
