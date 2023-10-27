package datapro.eibs.forex;

/**
 * Treasury MMK Deals Inquiry.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: David Mavilla
 */
import java.io.*;
import java.net.*;
import java.beans.Beans;
import javax.servlet.*;
import javax.servlet.http.*;
import datapro.eibs.beans.*;

import datapro.eibs.sockets.*;

public class JSEDL0120I extends datapro.eibs.master.SuperServlet {

		protected String LangPath = "S";

	/**
	 * Constructor
	*/
	public JSEDL0120I() {
		super();
	}

	/**
	 * This method was created by Orestes Garcia.
	 */
	public void destroy() {

		flexLog("free resources used by JSEDL0120I");

	}
	/**
	 * This method was created by David Mavilla.
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	protected void procActionInqDeal(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDL0120DSMessage msgDeal = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		try {
			msgError = new ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		String opCode = null;
		String ACD= req.getParameter("ACD");

		// Send Initial data
		try {
			msgDeal = (EDL0120DSMessage) mc.getMessageRecord("EDL0120DS");
			msgDeal.setH01USERID(user.getH01USR());
			msgDeal.setH01PROGRM("EFE0120P");
			msgDeal.setH01TIMSYS(getTimeStamp());
			msgDeal.setH01SCRCOD("01");
			msgDeal.setH01OPECOD("0002");

			try {
				if (req.getParameter("E01DLSREF") != null)
					msgDeal.setE01DLSREF(req.getParameter("E01DLSREF"));
			} catch (Exception e) {
				msgDeal.setE01DLSREF("0");
			}
			try {
				if (req.getParameter("E01DLSDID") != null)
					msgDeal.setE01DLSDID(req.getParameter("E01DLSDID"));
			} catch (Exception e) {
				msgDeal.setE01DLSDID("");
			}

			msgDeal.send();
			msgDeal.destroy();
			flexLog("EDL0120DS Message Sent");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Error Message
		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				showERROR(msgError);
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Data
		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("EDL0120DS")) {
				try {
					msgDeal = new EDL0120DSMessage();
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				msgDeal = (EDL0120DSMessage) newmessage;
				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("deal", msgDeal);

				if (IsNotError) { // There are no errors
					if (ACD.equals("10")) {
						try {
							flexLog(
								"About to call Page: " + LangPath + "EDL0120I_fe_loans.jsp");
							callPage(LangPath + "EDL0120I_fe_loans.jsp", req, res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					} else if (ACD.equals("11") || ACD.equals("TDP")) {
						try {
							flexLog("About to call Page: " + LangPath + "EDL0120I_fe_deposits.jsp");
							callPage(LangPath + "EDL0120I_fe_deposits.jsp", req, res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					} else if (ACD.equals("12") || ACD.equals("CDP")) {
						try {
							flexLog("About to call Page: " + LangPath + "EDL0120I_fe_cds.jsp");
							callPage(LangPath + "EDL0120I_fe_cds.jsp", req, res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					} else if (ACD.equals("15") || ACD.equals("FFP")) {
						try {
							flexLog("About to call Page: " + LangPath + "EDL0120I_fe_ffs.jsp");
							callPage(LangPath + "EDL0120I_fe_ffs.jsp", req, res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					} else if (ACD.equals("TPS") || ACD.equals("TPP")) {
						try {
							flexLog("About to call Page: " + LangPath + "EDL0120I_fe_tps.jsp");
							callPage(LangPath + "EDL0120I_fe_tps.jsp", req, res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					} else if (ACD.equals("14") || ACD.equals("ACS")) {
						try {
							flexLog("About to call Page: " + LangPath + "EDL0120I_fe_acc.jsp");
							callPage(LangPath + "EDL0120I_fe_acc.jsp", req, res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					} else if (
						ACD.equals("13") || ACD.equals("PLP")) {
						try {
							flexLog("About to call Page: " + LangPath + "EDL0120I_fe_cp.jsp");
							callPage(LangPath + "EDL0120I_fe_cp.jsp", req, res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					}

				} else { // There are errors
					res.sendRedirect(super.srctx + 
						"/servlet/datapro.eibs.forex.JSEFE0000?SCREEN=100");
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

			int screen = 1;

			try {

				msgUser =
					(datapro.eibs.beans.ESS0030DSMessage) session.getAttribute(
						"currUser");

				// Here we should get the path from the user profile
				LangPath = super.rootPath + msgUser.getE01LAN() + "/";

				try {
					flexLog("Opening Socket Connection");
					mc = new MessageContext(super.getMessageHandler("EDL0120", req));

					try {
						screen = Integer.parseInt(req.getParameter("SCREEN"));
					} catch (Exception e) {
						flexLog("Screen set to default value");
					}

					switch (screen) {

						// Action 
						case 14 :
							procActionInqDeal(mc, msgUser, req, res, session);
							break;

							// 
						default :
							res.sendRedirect(super.srctx + LangPath + super.devPage);
							break;
					}
				} catch (Exception e) {
					e.printStackTrace();
					int sck = getInitSocket(req) + 1;
					flexLog("Socket not Open(Port " + sck + "). Error: " + e);
					res.sendRedirect(super.srctx + LangPath + super.sckNotOpenPage);
					//return;
				} finally {
					mc.close();
				}
			} catch (Exception e) {
				flexLog("Error: " + e);
				res.sendRedirect(super.srctx + LangPath + super.sckNotRespondPage);
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