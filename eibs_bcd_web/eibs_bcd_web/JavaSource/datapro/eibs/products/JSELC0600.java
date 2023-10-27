/*
 * Created on Apr 4, 2008
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

import datapro.eibs.beans.ELC060001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.MessageContext;
import datapro.eibs.sockets.MessageContextHandler;

/**
 * @author erodriguez
 * 
 *         To change the template for this generated type comment go to
 *         Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSELC0600 extends SuperServlet {

	String LangPath = "s/";

	private static final int STANDARD = 1;
	private static final int CUSTOMER = 5;
	private static final int CORRESPONDING_BANK = 35;

	public JSELC0600() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	public void service(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
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

			ESS0030DSMessage user = (datapro.eibs.beans.ESS0030DSMessage) session
					.getAttribute("currUser");
			// Here we should get the path from the user profile
			LangPath = SuperServlet.rootPath + user.getE01LAN() + "/";

			MessageContext mc = null;
			try {
				mc = new MessageContext(super.getMessageHandler("ELC0600", req));

				try {
					screen = Integer.parseInt(req.getParameter("SCREEN"));
					flexLog("Screen  Number: " + screen);
				} catch (Exception e) {
					flexLog("Screen set to default value");
				}

				String PageToCall = "";

				switch (screen) {
				/********************************************************
				 * CALL ENTER SCREEN (1ST PAGE, FROM MAIN MENU)
				 ********************************************************/
				case STANDARD: // by product
					PageToCall = "ELC0600_sc_prod_enter.jsp";
					callPage(PageToCall, req, res);
					break;
				case CUSTOMER: // by customer
					PageToCall = "ELC0600_sc_cust_enter.jsp";
					callPage(PageToCall, req, res);
					break;
				case CORRESPONDING_BANK: // by corresponding bank
					PageToCall = "ELC0600_sc_corresp_enter.jsp";
					callPage(PageToCall, req, res);
					break;
				}

				if ((screen == JSELC0600.STANDARD)
						|| (screen == JSELC0600.CUSTOMER)
						|| (screen == JSELC0600.CORRESPONDING_BANK)) {
					return;
				} else {
					/*
					 * SCREEN RULES
					 * ---------------------------------------------------------
					 * 1. 100-199 is for products 2. 200-299 is for customer 3.
					 * 300-399 is for corresponding bank
					 * 
					 * 4. **1 is for submitting enter screens 5. **2 is for
					 * submitting new on list screens 7. **4 is for submitting
					 * maint on list screens 6. **5 is for submitting delete on
					 * list screens 7. **6 is for submitting info pages
					 * ---------------------------------------------------------
					 * The next section uses these rules to set nextPage,
					 * prevPage, opCode, and other message flags.
					 */
					switch (screen % 100) {
					case 1: // Submit enter Page
						requestList(mc, user, req, res, screen);
						break;
					case 2: // submit NEW on list screens
						requestNew(mc, user, req, res, screen);
						break;
					case 3: // submit MAINT on list screens
						requestMaintenance(mc, user, req, res, screen);
						break;
					case 4: // submit DEL on list screens
						requestDelete(mc, user, req, res, screen);
						break;
					case 5: // submit basic page
						requestPage(mc, user, req, res, screen);
						break;
					case 6: // submit INQUIRY on list screens
						requestInquiry(mc, user, req, res, screen);
						break;
					default:
						PageToCall = "MISC_not_available.jsp";
						callPage(PageToCall, req, res);
						break;
					}
				}

			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				res.sendRedirect(SuperServlet.srctx + LangPath
						+ SuperServlet.sckNotRespondPage);
			} finally {
				if (mc != null)
					mc.close();
				flexLog("Socket used by JSELC0600 closed.");
			}
		}
	}

	protected void requestList(MessageContext mc, ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, int scr)
			throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = (datapro.eibs.beans.UserPos) session
				.getAttribute("userPO");

		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC060001Message msg = (ELC060001Message) msgHandle.initMessage(
					"ELC060001", user.getH01USR(), "0015");
			initTransaction(userPO, String.valueOf(scr), "", msg, scr);
			msgHandle.setFieldsFromPage(req, msg);
			userPO.setCusNum(msg.getE01RLCCUN());
			userPO.setType(msg.getE01RLCATY());
			msgHandle.sendMessage(msg);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			JBObjList jbList = null;
			if (isNotError) {
				jbList = msgHandle.receiveMessageList("E01INDOPE");
			}
			putDataInSession(session, userPO, msgError, msg, jbList);
			callPage(getPage(scr) + ((isNotError) ? "list.jsp" : "enter.jsp"),
					req, res);

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage());
		}
	}

	protected void requestNew(MessageContext mc, ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, int scr)
			throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = (datapro.eibs.beans.UserPos) session
				.getAttribute("userPO");

		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC060001Message msg = (ELC060001Message) msgHandle.initMessage(
					"ELC060001", user.getH01USR(), "0001");
			initTransaction(userPO, String.valueOf(scr), "NEW", msg, scr);
			msg.setE01RLCBNK(req.getParameter("NEWBNK"));
			msg.setE01RLCTAR(req.getParameter("NEWSTN"));
			if (userPO.getType() != null) {
				msg.setE01RLCATY(userPO.getType());
			}
			if (userPO.getCusNum() != null) {
				msg.setE01RLCCUN(userPO.getCusNum());
			}

			msgHandle.sendMessage(msg);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg = (ELC060001Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, msg, null);
			callPage(getPage(scr) + ((isNotError) ? "basic.jsp" : "list.jsp"),
					req, res);

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage());
		}
	}

	protected void requestMaintenance(MessageContext mc, ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, int scr)
			throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = (datapro.eibs.beans.UserPos) session
				.getAttribute("userPO");

		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC060001Message msg = (ELC060001Message) msgHandle.initMessage(
					"ELC060001", user.getH01USR(), "0002");
			initTransaction(userPO, String.valueOf(scr), "MAINT", msg, scr);
			setMessageField(msg, "E01RLCBNK", req.getParameter("BNK"));
			setMessageField(msg, "E01RLCTAR", req.getParameter("STN"));
			setMessageField(msg, "E01RLCATY", req.getParameter("ATY"));
			setMessageField(msg, "E01RLCCUN", req.getParameter("CUN"));
			msgHandle.sendMessage(msg);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg = (ELC060001Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, msg, null);
			callPage(getPage(scr) + ((isNotError) ? "basic.jsp" : "list.jsp"),
					req, res);

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage(), e);
		}
	}

	protected void requestDelete(MessageContext mc, ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, int scr)
			throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = (datapro.eibs.beans.UserPos) session
				.getAttribute("userPO");

		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC060001Message msg = (ELC060001Message) msgHandle.initMessage(
					"ELC060001", user.getH01USR(), "0009");
			initTransaction(userPO, String.valueOf(scr), "DELETE", msg, scr);
			setMessageField(msg, "E01RLCBNK", req.getParameter("BNK"));
			setMessageField(msg, "E01RLCTAR", req.getParameter("STN"));
			setMessageField(msg, "E01RLCATY", req.getParameter("ATY"));
			setMessageField(msg, "E01RLCCUN", req.getParameter("CUN"));
			msgHandle.sendMessage(msg);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			if (isNotError) {
				msg = (ELC060001Message) msgHandle.initMessage("ELC060001",
						user.getH01USR(), "0015");
				initTransaction(userPO, String.valueOf(scr), "", msg, scr);
				msg.setE01RLCBNK(req.getParameter("E01RLCBNK"));
				if (scr / 100 == 1) {
					msg.setE01RLCATY(req.getParameter("E01RLCATY"));
				} else {
					msg.setE01RLCCUN(req.getParameter("E01RLCCUN"));
				}
				msgHandle.sendMessage(msg);
				msgError = msgHandle.receiveErrorMessage();
				isNotError = msgError.getERRNUM().equals("0");
				JBObjList jbList = null;
				if (isNotError) {
					jbList = msgHandle.receiveMessageList("E01INDOPE");
				}
				putDataInSession(session, userPO, msgError, msg, jbList);
				callPage(getPage(scr)
						+ ((isNotError) ? "list.jsp" : "enter.jsp"), req, res);
			} else {
				putDataInSession(session, userPO, msgError, msg, null);
				callPage(getPage(scr) + "list.jsp", req, res);
			}

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage(), e);
		}
	}

	protected void requestPage(MessageContext mc, ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, int scr)
			throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = (datapro.eibs.beans.UserPos) session
				.getAttribute("userPO");

		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC060001Message msg = (ELC060001Message) msgHandle.initMessage(
					"ELC060001", user.getH01USR(), "0005");
			initTransaction(userPO, String.valueOf(scr), "", msg, scr);
			msgHandle.setFieldsFromPage(req, msg);
			String bank = msg.getE01RLCBNK();
			String id = "";
			if (scr / 100 == 1) {
				id = msg.getE01RLCATY();
			} else {
				id = msg.getE01RLCCUN();
			}
			msgHandle.sendMessage(msg);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg = (ELC060001Message) msgHandle.receiveMessage();
			if (isNotError) {
				msg = (ELC060001Message) msgHandle.initMessage("ELC060001",
						user.getH01USR(), "0015");
				initTransaction(userPO, String.valueOf(scr), "", msg, scr);
				msg.setE01RLCBNK(bank);
				if (scr / 100 == 1) {
					msg.setE01RLCATY(id);
				} else {
					msg.setE01RLCCUN(id);
				}
				msgHandle.sendMessage(msg);
				msgError = msgHandle.receiveErrorMessage();
				isNotError = msgError.getERRNUM().equals("0");
				JBObjList jbList = null;
				if (isNotError) {
					jbList = msgHandle.receiveMessageList("E01INDOPE");
				}
				putDataInSession(session, userPO, msgError, msg, jbList);
				callPage(getPage(scr) + "list.jsp", req, res);
			} else {
				putDataInSession(session, userPO, msgError, msg, null);
				callPage(getPage(scr) + "basic.jsp", req, res);
			}

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage(), e);
		}
	}

	protected void requestInquiry(MessageContext mc, ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, int scr)
			throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos userPO = (datapro.eibs.beans.UserPos) session
				.getAttribute("userPO");

		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC060001Message msg = (ELC060001Message) msgHandle.initMessage(
					"ELC060001", user.getH01USR(), "0004");
			initTransaction(userPO, String.valueOf(scr), "INQUIRY", msg, scr);
			setMessageField(msg, "E01RLCBNK", req.getParameter("BNK"));
			setMessageField(msg, "E01RLCTAR", req.getParameter("STN"));
			setMessageField(msg, "E01RLCATY", req.getParameter("ATY"));
			setMessageField(msg, "E01RLCCUN", req.getParameter("CUN"));
			msgHandle.sendMessage(msg);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg = (ELC060001Message) msgHandle.receiveMessage();
			putDataInSession(session, userPO, msgError, msg, null);
			callPage(getPage(scr)
					+ ((isNotError) ? "basic_inq.jsp" : "list.jsp"), req, res);

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage());
		}
	}

	private String getPage(int screen) {
		String result = "";
		int scr = screen / 100;

		switch (scr) {
		case 1:
			result = "ELC0600_sc_prod_";
			break;
		case 2:
			result = "ELC0600_sc_cust_";
			break;
		case 3:
			result = "ELC0600_sc_corresp_";
			break;
		default:
			result = "";
			break;
		}
		return result;
	}

	private void initTransaction(UserPos userPO, String optMenu,
			String purpose, ELC060001Message msg, int screen) {
		userPO.setOption(optMenu);
		userPO.setPurpose(purpose);
		int scr = screen / 100;
		switch (scr) {
		case 1: // BY PRODUCT
			msg.setH01FLGWK1("1");
			break;
		case 2: // BY CUSTOMER
			msg.setH01FLGWK1("2");
			break;
		case 3: // BY CORRESPONDENT BANK
			msg.setH01FLGWK1("2");
			msg.setH01FLGWK3("C");
			break;
		default:
			break;
		}
	}

	private void putDataInSession(HttpSession session, UserPos userPO,
			ELEERRMessage msgError, ELC060001Message msg, JBObjList jbList) {
		flexLog("Putting java beans into the session");

		if (msgError == null) {
			msgError = new ELEERRMessage();
		}
		session.setAttribute("error", msgError);
		session.setAttribute("userPO", userPO);
		if (msg != null) {
			session.setAttribute("msg01", msg);
		}
		if (jbList != null) {
			session.setAttribute("jbList", jbList);
		}
	}

	public void callPage(String page, HttpServletRequest req,
			HttpServletResponse res) {
		try {
			super.callPage(LangPath + page, req, res);
		} catch (Exception e) {
			flexLog("Exception calling page " + e.toString() + e.getMessage());
		}
		return;
	}

}
