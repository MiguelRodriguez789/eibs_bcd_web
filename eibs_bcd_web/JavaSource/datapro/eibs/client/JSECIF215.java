package datapro.eibs.client;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: Orestes Garcia
 */
import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ECIF21501Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.sockets.MessageContext;
import datapro.eibs.sockets.MessageRecord;

public class JSECIF215 extends datapro.eibs.master.SuperServlet {

	// CIF options
	protected static final int R_SEARCH = 1;
	protected static final int A_LIST = 4;
	protected String LangPath = "S";

	/**
	 * JSECLI001 constructor comment.
	 */
	public JSECIF215() {
		super();
	}

	/**
	 * This method was created by Orestes Garcia.
	 */
	public void destroy() {

		flexLog("free resources used by JSECIF215");

	}

	/**
	 * This method was created by Orestes Garcia.
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	/**
	 * This method was created by Orestes Garcia.
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 */
	protected void procActionList(MessageContext mc, ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses) {

		UserPos userPO = null;

		try {

			userPO = (UserPos) ses.getAttribute("userPO");

			int option = Integer.parseInt(req.getParameter("opt"));
			String clientNum = req.getParameter("E01CUN");

			userPO.setCusNum(clientNum);
			ses.setAttribute("userPO", userPO);

			switch (option) {
			case 20: // Coopeuch: Saldos y Deuda consolidada.
				procReqSaldDeudCons(mc, user, req, res, ses);
				break;
			default:
				res.sendRedirect(super.srctx + LangPath
						+ "Under_construction.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}

	protected void procReqSaldDeudCons(MessageContext mc,
			ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession ses) throws ServletException,
			IOException {

		MessageRecord newmessage = null;
		ECIF21501Message msgData = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		String opCode = "0001";

		// Send Initial data
		try {
			msgData = (ECIF21501Message) mc.getMessageRecord("ECIF21501");
			msgData.setH01USR(user.getH01USR());
			msgData.setH01PGM("ECIF215");
			msgData.setH01TIM(getTimeStamp());
			msgData.setH01WK1(userPO.getHeader8());
			msgData.setH01SCR("01");
			msgData.setH01OPE(opCode);

			msgData.setE01CUN(userPO.getCusNum() != null ? userPO.getCusNum()
					: "");

			msgData.send();
			msgData.destroy();

			flexLog("ECIF21501 Message Sent");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Data
		try {

			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("ELEERR")) {

				try {
					msgError = new datapro.eibs.beans.ELEERRMessage();
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				msgError = (ELEERRMessage) newmessage;

				// showERROR(msgError);

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);

				if (!msgError.getERRNUM().equals("0")) {
					try {
						flexLog("About to call Page: " + LangPath
								+ "ECIF010_cif_client_search.jsp");
						callPage(LangPath + "ECIF010_cif_client_search.jsp",
								req, res);

					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}
			}

			if (!newmessage.getFormatName().equals("ECIF21501")) {
				newmessage = mc.receiveMessage();
			}

			if (newmessage.getFormatName().equals("ECIF21501")) {

				try {
					msgData = new datapro.eibs.beans.ECIF21501Message();
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				msgData = (ECIF21501Message) newmessage;
				// showECIF01003(msgTotal);

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("cifData", msgData);

				try {
					flexLog("About to call Page: " + LangPath
							+ "ECIF215_cif_saldos_deuda_consolidada.jsp");
					callPage(LangPath
							+ "ECIF215_cif_saldos_deuda_consolidada.jsp", req,
							res);
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}

			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}

	public void service(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		MessageContext mc = null;

		ESS0030DSMessage msgUser = null;
		HttpSession session = null;

		session = (HttpSession) req.getSession(false);

		if (session == null) {
			try {
				res.setContentType("text/html");
				printLogInAgain(res.getWriter());
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Exception ocurred. Exception = " + e);
			}
		} else {

			int screen = R_SEARCH;

			try {

				msgUser = (datapro.eibs.beans.ESS0030DSMessage) session
						.getAttribute("currUser");

				// Here we should get the path from the user profile
				LangPath = super.rootPath + msgUser.getE01LAN() + "/";

				try {
					flexLog("Opennig Socket Connection");
					mc = new MessageContext(super.getMessageHandler("ECIF215",
							req));

					try {
						screen = Integer.parseInt(req.getParameter("SCREEN"));
					} catch (Exception e) {
						flexLog("Screen set to default value");
					}

					switch (screen) {
					// Requests
					case A_LIST:
						procActionList(mc, msgUser, req, res, session);
						break;
					default:
						res
								.sendRedirect(super.srctx + LangPath
										+ super.devPage);
						break;
					}
				} catch (Exception e) {
					e.printStackTrace();
					res.sendRedirect(super.srctx + LangPath
							+ super.sckNotOpenPage);
					// return;
				} finally {
					if (mc != null)
						mc.close();
				}

			} catch (Exception e) {
				flexLog("Error: " + e);
				res.sendRedirect(super.srctx + LangPath
						+ super.sckNotRespondPage);
			}

		}

	}

	protected void showERROR(ELEERRMessage m) {
		if (logType != NONE) {

			flexLog("ERROR received.");

			flexLog("ERROR number:" + m.getERRNUM());
			flexLog("ERR001 = " + m.getERNU01() + " desc: " + m.getERDS01());
			flexLog("ERR002 = " + m.getERNU02() + " desc: " + m.getERDS02());
			flexLog("ERR003 = " + m.getERNU03() + " desc: " + m.getERDS03());
			flexLog("ERR004 = " + m.getERNU04() + " desc: " + m.getERDS04());
			flexLog("ERR005 = " + m.getERNU05() + " desc: " + m.getERDS05());
			flexLog("ERR006 = " + m.getERNU06() + " desc: " + m.getERDS06());
			flexLog("ERR007 = " + m.getERNU07() + " desc: " + m.getERDS07());
			flexLog("ERR008 = " + m.getERNU08() + " desc: " + m.getERDS08());
			flexLog("ERR009 = " + m.getERNU09() + " desc: " + m.getERDS09());
			flexLog("ERR010 = " + m.getERNU10() + " desc: " + m.getERDS10());

		}
	}
}