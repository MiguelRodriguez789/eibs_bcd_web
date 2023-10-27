package datapro.eibs.products;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: Rommel Gonzalez
 */
import java.io.*;
import java.net.*;
import java.beans.Beans;
import javax.servlet.*;
import javax.servlet.http.*;
import datapro.eibs.beans.*;

import datapro.eibs.master.Util;

import datapro.eibs.sockets.*;

public class JSEDL0517 extends datapro.eibs.master.SuperServlet {

	protected static final int A_provis = 2;

	// entering options
	protected static final int R_ENTER = 100;
	protected static final int A_ENTER = 200;
	protected static final int B_ENTER = 300;

	protected String LangPath = "S";

	/**
	 * JSEDL0517 constructor comment.
	 */
	public JSEDL0517() {
		super();
	}
	/**
	 * This method was created by Rommel Gonzalez.
	 */
	public void destroy() {

		flexLog("free resources used by JSEDL0517");

	}
	/**
	 * This method was created by Rommel Gonzalez.
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}
	/**
	 * This method was created in VisualAge.
	 * by Rommel Gonzalez.
	 * on 5/17/00.
	 */
	protected void procActionEnterMaint(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDL051701Message msgProvi = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send Initial data
		try {
			msgProvi = (EDL051701Message) mc.getMessageRecord("EDL051701");
			msgProvi.setH01USERID(user.getH01USR());
			msgProvi.setH01PROGRM("EDL0517");
			msgProvi.setH01TIMSYS(getTimeStamp());
			msgProvi.setH01OPECOD("0002");
			msgProvi.setH01SCRCOD("01");
			
			try {
				msgProvi.setE01DEAACC(req.getParameter("E01DEAACC"));
			} catch (Exception e) {
				msgProvi.setE01DEAACC("0");
			}
			
			msgProvi.send();
			msgProvi.destroy();
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

			if (newmessage.getFormatName().equals("EDL051701")) {
				try {
					msgProvi = new datapro.eibs.beans.EDL051701Message();
					flexLog("EDL051701 Message Received");
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				msgProvi = (EDL051701Message) newmessage;

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("provis", msgProvi);
				ses.setAttribute("userPO", userPO);

				if (IsNotError) { // There are no errors
					try {
						flexLog(
							"About to call Page: "
								+ LangPath
								+ "EDL0517_ln_provision_adicional.jsp");
						callPage(
							LangPath + "EDL0517_ln_provision_adicional.jsp",
							req,
							res);
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				} else { // There are errors
					try {
						flexLog(
							"About to call Page: /pages/"
								+ LangPath
								+ "EDL0517_ln_provision_adicional_enter.jsp");
						callPage(
							LangPath + "EDL0517_ln_provision_adicional_enter.jsp",
							req,
							res);
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}

			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}

	/**
	 * This method was created in VisualAge.
	 */
	protected void procActionprovis(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDL051701Message msgProvi = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send Initial data
		try {
			flexLog("Send Initial Data");
			//msgProvi = (EDL051701Message)mc.getMessageRecord("EDL051701");
			msgProvi = (EDL051701Message) ses.getAttribute("provis");
			msgProvi.setH01USERID(user.getH01USR());
			msgProvi.setH01PROGRM("EDL0517");
			msgProvi.setH01TIMSYS(getTimeStamp());
			msgProvi.setH01OPECOD("0005");
			msgProvi.setH01SCRCOD("01");
			// all the fields here
			java.util.Enumeration enu = msgProvi.fieldEnumeration();
			MessageField field = null;
			String value = null;
			while (enu.hasMoreElements()) {
				field = (MessageField) enu.nextElement();
				try {
					value = req.getParameter(field.getTag()).toUpperCase();
					if (value != null) {
						field.setString(value);
					}
				} catch (Exception e) {
				}
			}

			mc.sendMessage(msgProvi); //msgProvi.send();	
			msgProvi.destroy();
			flexLog("EDL051701 Message Sent");
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

			if (newmessage.getFormatName().equals("EDL051701")) {
				try {
					msgProvi = new datapro.eibs.beans.EDL051701Message();
					flexLog("EDL051701 Message Received");
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				msgProvi = (EDL051701Message) newmessage;

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("provis", msgProvi);
				//ses.setAttribute("userPO", userPO);

				if (IsNotError) { // There are no errors
					try {
						flexLog(
							"About to call Page: "
								+ LangPath
								+ "EDL0517_ln_provision_adicional_enter.jsp");
						callPage(
							LangPath + "EDL0517_ln_provision_adicional_enter.jsp",
							req,
							res);
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
					
				} else { // There are errors
					try {
						flexLog(
							"About to call Page: "
								+ LangPath
								+ "EDL0517_ln_provision_adicional.jsp");
						callPage(
							LangPath + "EDL0517_ln_provision_adicional.jsp",
							req,
							res);
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}
	/**
	 * This method was created in VisualAge.
	 * by Rommel Gonzalez.
	 * on 5/17/00.
	 */	
	protected void procActionEnterMaintB(
			MessageContext mc,
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

			MessageRecord newmessage = null;
			EDL051701Message msgProvi = null;
			ELEERRMessage msgError = null;
			UserPos userPO = null;
			boolean IsNotError = false;

			try {
				msgError = new datapro.eibs.beans.ELEERRMessage();
			} catch (Exception ex) {
				flexLog("Error: " + ex);
			}

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

			// Send Initial data
			try {
				msgProvi = (EDL051701Message) mc.getMessageRecord("EDL051701");
				msgProvi.setH01USERID(user.getH01USR());
				msgProvi.setH01PROGRM("EDL0517");
				msgProvi.setH01TIMSYS(getTimeStamp());
				msgProvi.setH01OPECOD("0002");
				msgProvi.setH01SCRCOD("01");
				
				try {
					msgProvi.setE01DEAACC(req.getParameter("E01DEAACC"));
				} catch (Exception e) {
					msgProvi.setE01DEAACC("0");
				}
				
				msgProvi.send();
				msgProvi.destroy();
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

				if (newmessage.getFormatName().equals("EDL051701")) {
					try {
						msgProvi = new datapro.eibs.beans.EDL051701Message();
						flexLog("EDL051701 Message Received");
					} catch (Exception ex) {
						flexLog("Error: " + ex);
					}

					msgProvi = (EDL051701Message) newmessage;

					flexLog("Putting java beans into the session");
					ses.setAttribute("error", msgError);
					ses.setAttribute("provis", msgProvi);
					ses.setAttribute("userPO", userPO);

					if (IsNotError) { // There are no errors
						try {
							flexLog(
								"About to call Page: "
									+ LangPath
									+ "EDL0517_ln_provision_adicional_consul.jsp");
							callPage(
								LangPath + "EDL0517_ln_provision_adicional_consul.jsp",
								req,
								res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					} else { // There are errors
						try {
							flexLog(
								"About to call Page: /pages/"
									+ LangPath
									+ "EDL0517_ln_provision_adicional_enter.jsp");
							callPage(
								LangPath + "EDL0517_ln_provision_adicional_enter.jsp",
								req,
								res);
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					}

				} else
					flexLog("Message " + newmessage.getFormatName() + " received.");

			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				throw new RuntimeException("Socket Communication Error");
			}

		}
	/**
	 * This method was created in VisualAge.
	 * by Rommel Gonzalez.
	 * on 5/17/00.
	 */
	protected void procReqEnterMaint(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		EDL051701Message msgProvi = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;

		try {

			msgProvi = new datapro.eibs.beans.EDL051701Message();
			msgError = new datapro.eibs.beans.ELEERRMessage();
			userPO = new datapro.eibs.beans.UserPos();
			userPO.setOption("PROVI_ADI");	
			userPO.setPurpose("MAINTENANCE");
			ses.setAttribute("provis", msgProvi);
			ses.setAttribute("error", msgError);
			ses.setAttribute("userPO", userPO);

		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}
		try {
			flexLog(
				"About to call Page: "
					+ LangPath
					+ "EDL0517_ln_provision_adicional_enter.jsp");
			callPage(LangPath + "EDL0517_ln_provision_adicional_enter.jsp", req, res);
		} catch (Exception e) {
			flexLog("Exception calling page " + e);
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

			int screen = R_ENTER;

			try {

				msgUser =
					(datapro.eibs.beans.ESS0030DSMessage) session.getAttribute(
						"currUser");

				// Here we should get the path from the user profile
				LangPath = super.rootPath + msgUser.getE01LAN() + "/";

				try {
					flexLog("Opennig Socket Connection");
					mc = new MessageContext(super.getMessageHandler("EDL0517", req));

					try {
						screen = Integer.parseInt(req.getParameter("SCREEN"));
					} catch (Exception e) {
						flexLog("Screen set to default value");
					}

					switch (screen) {

						//req. options
						case R_ENTER :
							procReqEnterMaint(msgUser, req, res, session);
							break;
						
							//action options
						case A_ENTER :
							procActionEnterMaint(
								mc,
								msgUser,
								req,
								res,
								session);
							break;
						case B_ENTER :
							procActionEnterMaintB(
								mc,
								msgUser,
								req,
								res,
								session);
							break;							
						case A_provis :
							procActionprovis(mc, msgUser, req, res, session);
							break;
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