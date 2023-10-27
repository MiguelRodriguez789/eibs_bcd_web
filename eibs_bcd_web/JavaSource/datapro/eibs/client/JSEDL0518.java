package datapro.eibs.client;

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

public class JSEDL0518 extends datapro.eibs.master.SuperServlet {

	protected static final int A_CLASIF = 2;

	// entering options
	protected static final int R_ENTER   = 100;
	protected static final int A_ENTER   = 200;
	protected static final int R_ENTER_C = 300;	
	protected static final int A_ENTER_C = 400;
	protected String LangPath = "S";

	/**
	 * JSEDL0518 constructor comment.
	 */
	public JSEDL0518() {
		super();
	}
	/**
	 * This method was created by Rommel Gonzalez.
	 */
	public void destroy() {

		flexLog("free resources used by JSEDL0518");

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
		EDL051801Message msgClasif = null;
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
			msgClasif = (EDL051801Message) mc.getMessageRecord("EDL051801");
			msgClasif.setH01USERID(user.getH01USR());
			msgClasif.setH01PROGRM("EDL0518");
			msgClasif.setH01TIMSYS(getTimeStamp());
			msgClasif.setH01OPECOD("0002");
			
			if (userPO.getOption().equals("ADICIO")){
				msgClasif.setH01SCRCOD("01");
			} 
			if (userPO.getOption().equals("PAPELE")){
				msgClasif.setH01SCRCOD("02");
			}
			if (userPO.getOption().equals("REESTR")){
				msgClasif.setH01SCRCOD("03");
			}
			if (userPO.getOption().equals("OTORGA")){
				msgClasif.setH01SCRCOD("04");
			}
			if (userPO.getOption().equals("EVALUA")){
				msgClasif.setH01SCRCOD("05");
			}
			if (userPO.getOption().equals("ESCORE")){
				msgClasif.setH01SCRCOD("06");
			}
			if (userPO.getOption().equals("EXCEPC")){
				msgClasif.setH01SCRCOD("07");
			}
			try {
				msgClasif.setE01CUSCUN(req.getParameter("E01CUSCUN"));
			} catch (Exception e) {
				msgClasif.setE01CUSCUN("0");
			}
			try {
				msgClasif.setE01CUSIDN(req.getParameter("E01CUSIDN"));
			} catch (Exception e) {
				msgClasif.setE01CUSIDN("0");
			}
			try {
				msgClasif.setE01DLCMOD(req.getParameter("E01DLCMOD"));
			} catch (Exception e) {
				msgClasif.setE01DLCMOD(" ");
			}
			msgClasif.send();
			msgClasif.destroy();
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

			if (newmessage.getFormatName().equals("EDL051801")) {
				try {
					msgClasif = new datapro.eibs.beans.EDL051801Message();
					flexLog("EDL051801 Message Received");
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				msgClasif = (EDL051801Message) newmessage;

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("clasif", msgClasif);
				ses.setAttribute("userPO", userPO);

				if (IsNotError) { // There are no errors
					try {
						flexLog(
							"About to call Page: "
								+ LangPath
								+ "EDL0518_client_clasif.jsp");
						callPage(
							LangPath + "EDL0518_client_clasif.jsp",
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
								+ "EDL0518_client_clasif_enter.jsp");
						callPage(
							LangPath + "EDL0518_client_clasif_enter.jsp",
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
	protected void procActionEnterConsu(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDL051802Message msgClasifC = null;
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
			msgClasifC = (EDL051802Message) mc.getMessageRecord("EDL051802");
			msgClasifC.setH02USERID(user.getH01USR());
			msgClasifC.setH02PROGRM("EDL0518");
			msgClasifC.setH02TIMSYS(getTimeStamp());
			msgClasifC.setH02OPECOD("0001");
			
			try {
				msgClasifC.setE02CUSCUN(req.getParameter("E02CUSCUN"));
			} catch (Exception e) {
				msgClasifC.setE02CUSCUN("0");
			}
			msgClasifC.send();
			msgClasifC.destroy();
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

			if (newmessage.getFormatName().equals("EDL051802")) {
				try {
					msgClasifC = new datapro.eibs.beans.EDL051802Message();
					flexLog("EDL051802 Message Received");
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				msgClasifC = (EDL051802Message) newmessage;

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("clasif", msgClasifC);
				ses.setAttribute("userPO", userPO);

				if (IsNotError) { // There are no errors
					try {
						flexLog(
							"About to call Page: "
								+ LangPath
								+ "EDL0518_client_consul_clasif.jsp");
						callPage(
							LangPath + "EDL0518_client_consul_clasif.jsp",
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
								+ "EDL0518_client_clasif_consul_enter.jsp");
						callPage(
							LangPath + "EDL0518_client_clasif_consul_enter.jsp",
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
	protected void procActionClasif(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDL051801Message msgClasif = null;
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
			//msgClasif = (EDL051801Message)mc.getMessageRecord("EDL051801");
			msgClasif = (EDL051801Message) ses.getAttribute("clasif");
			msgClasif.setH01USERID(user.getH01USR());
			msgClasif.setH01PROGRM("EDL0518");
			msgClasif.setH01TIMSYS(getTimeStamp());
			msgClasif.setH01OPECOD("0005");
			
			if (userPO.getOption().equals("ADICIO")){
				msgClasif.setH01SCRCOD("01");
			} 
			if (userPO.getOption().equals("PAPELE")){
				msgClasif.setH01SCRCOD("02");
			}
			if (userPO.getOption().equals("REESTR")){
				msgClasif.setH01SCRCOD("03");
			}
			if (userPO.getOption().equals("OTORGA")){
				msgClasif.setH01SCRCOD("04");
			}
			if (userPO.getOption().equals("EVALUA")){
				msgClasif.setH01SCRCOD("05");
			}
			if (userPO.getOption().equals("ESCORE")){
				msgClasif.setH01SCRCOD("06");
			}
			if (userPO.getOption().equals("EXCEPC")){
				msgClasif.setH01SCRCOD("07");
			}
			// all the fields here
			java.util.Enumeration enu = msgClasif.fieldEnumeration();
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

			mc.sendMessage(msgClasif); //msgClasif.send();	
			msgClasif.destroy();
			flexLog("EDL051801 Message Sent");
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

			if (newmessage.getFormatName().equals("EDL051801")) {
				try {
					msgClasif = new datapro.eibs.beans.EDL051801Message();
					flexLog("EDL051801 Message Received");
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				msgClasif = (EDL051801Message) newmessage;

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("clasif", msgClasif);
				//ses.setAttribute("userPO", userPO);

				if (IsNotError) { // There are no errors
					try {
						flexLog(
							"About to call Page: "
								+ LangPath
								+ "EDL0518_client_clasif_enter.jsp");
						callPage(
							LangPath + "EDL0518_client_clasif_enter.jsp",
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
								+ "EDL0518_client_clasif.jsp");
						callPage(
							LangPath + "EDL0518_client_clasif.jsp",
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

		EDL051801Message msgClasif = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;

		try {

			msgClasif = new datapro.eibs.beans.EDL051801Message();
			msgError = new datapro.eibs.beans.ELEERRMessage();
			userPO = new datapro.eibs.beans.UserPos();
			msgClasif.setH01SCRCOD((req.getParameter("OPT") == null ? "01" : req.getParameter("OPT")));
			
			if (msgClasif.getH01SCRCOD().equals("01")) {
				userPO.setOption("ADICIO");	
			} 
			if (msgClasif.getH01SCRCOD().equals("02")) {
				userPO.setOption("PAPELE");
			}
			if (msgClasif.getH01SCRCOD().equals("03")) {
				userPO.setOption("REESTR");
			}			
			if (msgClasif.getH01SCRCOD().equals("04")) {
				userPO.setOption("OTORGA");
			}						
			if (msgClasif.getH01SCRCOD().equals("05")) {
				userPO.setOption("EVALUA");
			}						
			if (msgClasif.getH01SCRCOD().equals("06")) {
				userPO.setOption("ESCORE");
			}							
			if (msgClasif.getH01SCRCOD().equals("07")) {
				userPO.setOption("EXCEPC");
			}										
			userPO.setPurpose("MAINTENANCE");
			ses.setAttribute("clasif", msgClasif);
			ses.setAttribute("error", msgError);
			ses.setAttribute("userPO", userPO);

		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}
		try {
			flexLog(
				"About to call Page: "
					+ LangPath
					+ "EDL0518_client_clasif_enter.jsp");
			callPage(LangPath + "EDL0518_client_clasif_enter.jsp", req, res);
		} catch (Exception e) {
			flexLog("Exception calling page " + e);
		}

	}
	/**
	 * This method was created in VisualAge.
	 * by Rommel Gonzalez.
	 * on 5/17/00.
	 */
	protected void procReqEnterConsu(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		EDL051802Message msgClasifC = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;

		try {

			msgClasifC = new datapro.eibs.beans.EDL051802Message();
			msgError = new datapro.eibs.beans.ELEERRMessage();
			userPO = new datapro.eibs.beans.UserPos();
				userPO.setPurpose("MAINTENANCE");
			ses.setAttribute("clasif", msgClasifC);
			ses.setAttribute("error", msgError);
			ses.setAttribute("userPO", userPO);

		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}
		try {
			flexLog(
				"About to call Page: "
					+ LangPath
					+ "EDL0518_client_clasif_consul_enter.jsp");
			callPage(LangPath + "EDL0518_client_clasif_consul_enter.jsp", req, res);
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
					mc = new MessageContext(super.getMessageHandler("EDL0518", req));

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
						case R_ENTER_C :
							procReqEnterConsu(msgUser, req, res, session);
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
						case A_ENTER_C :
							procActionEnterConsu(
								mc,
								msgUser,
								req,
								res,
								session);
							break;							
						case A_CLASIF :
							procActionClasif(mc, msgUser, req, res, session);
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