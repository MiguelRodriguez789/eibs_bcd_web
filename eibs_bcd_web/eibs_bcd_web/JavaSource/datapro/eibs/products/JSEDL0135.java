package datapro.eibs.products;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: David Mavilla
 */
import java.io.*;
import java.net.*;
import java.beans.Beans;
import javax.servlet.*;
import javax.servlet.http.*;

import javax.servlet.ServletException;

import datapro.eibs.beans.*;
import datapro.eibs.master.MessageProcessor;

import datapro.eibs.sockets.*;

@SuppressWarnings("serial")
public class JSEDL0135 extends datapro.eibs.master.SuperServlet  {

	protected static final int R_CHG_STATUS = 1;
	protected static final int A_CHG_STATUS = 2;
	// entering options
	protected static final int R_ENTER = 100;
	protected static final int A_ENTER = 200;
	protected static final int R_INQ_CHG_STATUS = 300;
	protected static final int R_DLSTS_LIST = 400;
	protected static final int R_DLSTS_REASON = 450;
	protected static final int A_DLSTS_LIST = 500;

	protected String LangPath = "S";

	public JSEDL0135() {
		super();
	}

	public void destroy() {
		flexLog("free resources used by JSEDL0135");
	}

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}
	
	protected void procActionEnterChgSts(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		try {
			try {
				userPO.setIdentifier(req.getParameter("E01DEAACC"));
			} catch (Exception e) {
			}
			try {
				userPO.setOption(req.getParameter("E01FLGOPE"));
			} catch (Exception e) {
			}

			flexLog("Putting java beans into the session");
			ses.setAttribute("userPO", userPO);

			procReqChgStatus(mc, user, req, res, ses);

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procActionChgStatus(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDL013501Message msgLN = null;
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
			msgLN = (EDL013501Message) ses.getAttribute("lnChgSts");
			msgLN.setH01USERID(user.getH01USR());
			msgLN.setH01PROGRM("EDL0135");
			msgLN.setH01TIMSYS(getTimeStamp());
			msgLN.setH01SCRCOD("01");
			msgLN.setH01OPECOD("0005");

			// all the fields here
			java.util.Enumeration enu = msgLN.fieldEnumeration();
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

			//msgLN.send();
			mc.sendMessage(msgLN);
			msgLN.destroy();

			flexLog("EDL013501 Message Sent");
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

			if (newmessage.getFormatName().equals("EDL013501")) {
				try {
					msgLN = new datapro.eibs.beans.EDL013501Message();
					flexLog("EDL013501 Message Received");
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				if (!IsNotError)
					msgLN = (EDL013501Message) newmessage;

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("lnChgSts", msgLN);

				if (IsNotError) { // There are no errors

					try {
						flexLog(
							"About to call Page: "
								+ LangPath
								+ "EDL0135_ln_enter_chg_status.jsp");
						callPage(
							LangPath + "EDL0135_ln_enter_chg_status.jsp",
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
								+ "EDL0135_ln_enter_chg_status.jsp");
						callPage(
							LangPath + "EDL0135_ln_chg_status.jsp",
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
	protected void procReqEnterChgSts(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		EDL013501Message msgLN = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;


		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
			msgLN = new datapro.eibs.beans.EDL013501Message();
			userPO = new datapro.eibs.beans.UserPos();
			userPO.setOption("LN_STATUS");
			userPO.setAccOpt(req.getParameter("OPTION") == null ? "" : req.getParameter("OPTION").trim());
			userPO.setPurpose("MAINTENANCE");
			ses.setAttribute("error", msgError);
			ses.setAttribute("userPO", userPO);
			ses.setAttribute("lnChgSts", msgLN);
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		try {
			flexLog(
				"About to call Page: "
					+ LangPath
					+ "EDL0135_ln_enter_chg_status.jsp");
			callPage(LangPath + "EDL0135_ln_enter_chg_status.jsp", req, res);
		} catch (Exception e) {
			flexLog("Exception calling page " + e);
		}

	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqChgStatus(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDL013501Message msgLN = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send Initial data
		try {
			msgLN = (EDL013501Message) mc.getMessageRecord("EDL013501");
			msgLN.setH01USERID(user.getH01USR());
			msgLN.setH01PROGRM("EDL0135");
			msgLN.setH01TIMSYS(getTimeStamp());
			msgLN.setH01SCRCOD("01");
			msgLN.setH01OPECOD("0002");
			// Get Parameters here		
			try {
				msgLN.setE01DEAACC(userPO.getIdentifier());
			} catch (Exception e) {
			}
			try {
				msgLN.setE01FLGOPE(userPO.getOption());
			} catch (Exception e) {
			}
			msgLN.send();
			msgLN.destroy();

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		flexLog("Initializing java beans into the session");
		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
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

			if (newmessage.getFormatName().equals("EDL013501")) {
				try {
					msgLN = new datapro.eibs.beans.EDL013501Message();
					flexLog("EDL013501 Message Received");
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				msgLN = (EDL013501Message) newmessage;

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("lnChgSts", msgLN);

				if (IsNotError) { // There are no errors
					try {
						flexLog(
							"About to call Page: "
								+ LangPath
								+ "EDL0135_ln_chg_status.jsp");
						callPage(
							LangPath + "EDL0135_ln_chg_status.jsp",
							req,
							res);
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				} else {
					try {
						flexLog(
							"About to call Page: "
								+ LangPath
								+ "EDL0135_ln_enter_chg_status.jsp");
						callPage(
							LangPath + "EDL0135_ln_enter_chg_status.jsp",
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
	protected void procReqInqChgStatus(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDL013501Message msgLN = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send Initial data
		try {
			msgLN = (EDL013501Message) mc.getMessageRecord("EDL013501");
			msgLN.setH01USERID(user.getH01USR());
			msgLN.setH01PROGRM("EDL0135");
			msgLN.setH01TIMSYS(getTimeStamp());
			msgLN.setH01SCRCOD("01");
			msgLN.setH01OPECOD("0004");
			// Get Parameters here		
			try {
				msgLN.setE01DEAACC(req.getParameter("E01DEAACC"));
			} catch (Exception e) {
			}

			msgLN.send();
			msgLN.destroy();

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		flexLog("Initializing java beans into the session");
		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
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

			if (newmessage.getFormatName().equals("EDL013501")) {
				try {
					msgLN = new datapro.eibs.beans.EDL013501Message();
					flexLog("EDL013501 Message Received");
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				msgLN = (EDL013501Message) newmessage;

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("lnChgSts", msgLN);

				if (IsNotError) { // There are no errors
					try {
						flexLog(
							"About to call Page: "
								+ LangPath
								+ "EDL0135_ln_inq_chg_status.jsp");
						callPage(
							LangPath + "EDL0135_ln_inq_chg_status.jsp",
							req,
							res);
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				} else {
					try {
						flexLog(
							"About to call Page: "
								+ LangPath
								+ "error_viewer.jsp");
						callPage(LangPath + "error_viewer", req, res);
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
	

	private void procReqReason(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
	throws ServletException, IOException {

	MessageProcessor mp = null;
	UserPos userPO = null;
	
	try {
		mp = new MessageProcessor(mc);
		EDL013503Message msgEvent = (EDL013503Message) mp.getMessageRecord("EDL013503");
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		// Fill Initial data
		msgEvent.setH03USERID(user.getH01USR());
		msgEvent.setH03OPECOD("0015");
		msgEvent.setH03TIMSYS(getTimeStamp());
		msgEvent.setE03DEAACC(userPO.getIdentifier());
		msgEvent.setE03DLSREM(req.getParameter("MSG").replaceAll("_", " "));
		msgEvent.setE03DSCEVN(req.getParameter("DSCCAU").replaceAll("_", " "));
		msgEvent.setE03DLSEVN(req.getParameter("CAU"));
		msgEvent.setE03DSCUS2(req.getParameter("DSC").replaceAll("_", " "));
		msgEvent.setE03DLSUS2(req.getParameter("MTV"));

		ses.setAttribute("userPO", userPO);
		ses.setAttribute("RecData", msgEvent);
		
		String bPage = "EDL0135_evento_reason.jsp";
		callPage(LangPath + bPage, req, res);
		return;
		
	} finally {
		if (mp != null)
			mp.close();
	}
}
	
	
	
	/**
	 * procActionTablaDLSTSList	  
	 * @param user
	 * @param req
	 * @param res
	 * @param session
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void procActionTablaDLSTSList(MessageContext mc, ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session, String option)
			throws ServletException, IOException {

		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);
		
		try {
			mp = new MessageProcessor(mc);

			EDL013503Message loans = (EDL013503Message) mp.getMessageRecord("EDL013503");
			loans.setH03USERID(user.getH01USR());
			loans.setH03OPECOD("0015");
			loans.setH03TIMSYS(getTimeStamp());
			loans.setE03DEAACC(userPO.isCustomer() ? userPO.getCusNum() : userPO.getIdentifier());
			loans.setH03FLGWK2(req.getParameter("TYPE") == null ? "" : req.getParameter("TYPE"));
			loans.setE03DLSDTD(req.getParameter("JBDD") == null ? "0" : req.getParameter("JBDD"));
			loans.setE03DLSDTM(req.getParameter("JBDM") == null ? "0" : req.getParameter("JBDM"));
			loans.setE03DLSDTY(req.getParameter("JBDY") == null ? "0" : req.getParameter("JBDY"));
			userPO.setHeader1(loans.getE03DLSDTD());
			userPO.setHeader2(loans.getE03DLSDTM());
			userPO.setHeader3(loans.getE03DLSDTY());
			loans.setH03FLGWK2(userPO.isCustomer() ? "C" : "");
			
			//Sends message
			mp.sendMessage(loans);

			loans = (EDL013503Message) mp.receiveMessageRecord();
			//Receive insurance  list
			JBObjList list = mp.receiveMessageRecordList("H03FLGMAS");
 
			session.setAttribute("userPO", userPO);
			session.setAttribute("loans", loans);
			session.setAttribute("EDL013503List", list);
			
			try {
				if (loans.getE03DEAACD().equals("10")){
					callPage(LangPath + "EDL0135_ln_chg_status_list.jsp", req, res);
				} else if (loans.getE03DEAACD().equals("C1")){
					callPage(LangPath + "EDL0135_cl_chg_status_list.jsp", req, res);
				} else {
					callPage(LangPath + "EDL0135_rt_chg_status_list.jsp", req, res);
				}
			} catch (Exception e) {
				flexLog("Exception calling page " + e);
			}

		} finally {
			if (mp != null)
				mp.close();
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
					flexLog("Opennig Socket Connection ");
					mc = new MessageContext(super.getMessageHandler("EDL0135", req));

					try {
						screen = Integer.parseInt(req.getParameter("SCREEN"));
					} catch (Exception e) {
						flexLog("Screen set to default value");
					}

					switch (screen) {
						case R_CHG_STATUS :
							procReqChgStatus(mc, msgUser, req, res, session);
							break;
						case A_CHG_STATUS :
							procActionChgStatus(mc, msgUser, req, res, session);
							break;
						case R_ENTER :
							procReqEnterChgSts(msgUser, req, res, session);
							break;
						case A_ENTER :
							procActionEnterChgSts(mc, msgUser, req, res, session);
							break;
						case R_INQ_CHG_STATUS :
							procReqInqChgStatus(mc, msgUser, req, res, session);
							break;
						case A_DLSTS_LIST:
							procActionTablaDLSTSList(mc, msgUser, req, res, session, null);
							break;
						case R_DLSTS_REASON:
							procReqReason(mc, msgUser, req, res, session);
							break;
						default :
							res.sendRedirect(super.srctx + LangPath + super.devPage);
							break;
					}

				} catch (Exception e) {
					e.printStackTrace();
					flexLog("Socket not Open(" + mc.toString() + "). Error: " + e);
					res.sendRedirect(super.srctx + LangPath + super.sckNotOpenPage);
					//return;
				} finally {
					try {
						mc.close();						
					} catch (Exception e2) {
					}
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