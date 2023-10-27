package datapro.eibs.client;

/**
* Insert the type's description here.
* Creation date: (1/19/00 6:08:55 PM)
*/

import java.io.*;
import java.math.BigDecimal;
import java.net.*;
import java.util.*;
import java.beans.Beans;
import javax.servlet.*;
import javax.servlet.http.*;

import com.datapro.exception.ServiceLocatorException;

import datapro.eibs.beans.*;
import datapro.eibs.sockets.*;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.beans.ERA007501Message;
import datapro.eibs.beans.ERA007501Message;
import datapro.eibs.beans.ERA006001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;

public class JSERA0075 extends datapro.eibs.master.SuperServlet {

	// entering options
	protected static final int R_ENTER = 100;
	// Mantenimiento Reserva
	protected static final int REQ_R = 102;
	protected static final int ACT_R = 202;
	protected String LangPath = "S";

	/**
	 * JSECLI001 constructor comment.
	 */
	public JSERA0075() {
		super();
	}
	
	/**
	 * This method was created by Orestes Garcia.
	 */
	public void destroy() {
		flexLog("free resources used by JSESD0080");

	}
	
	/**
	 * This method was created by Orestes Garcia.
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
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
				msgUser = (datapro.eibs.beans.ESS0030DSMessage) session.getAttribute("currUser");
				// Here we should get the path from the user profile
				LangPath = super.rootPath + msgUser.getE01LAN() + "/";
				try {
					flexLog("Opennig Socket Connection");
					mc = new MessageContext(super.getMessageHandler("ERA0011", req));
				} catch (Exception e) {
					e.printStackTrace();
					int sck = getInitSocket(req) + 1;
					flexLog("Socket not Open(Port " + sck + "). Error: " + e);
					res.sendRedirect(
					super.srctx + LangPath + super.sckNotOpenPage);
					return;
				}
				try {
					screen = Integer.parseInt(req.getParameter("SCREEN"));
				} catch (Exception e) {
					flexLog("Screen set to default value");
				}
				switch (screen) {
					//entering options
					case R_ENTER :
						procReqEnter(msgUser, req, res, session);
						break;
						//PRENDA VEHICULOS 'V'
					case REQ_R :
					case ACT_R :
						procActionR(msgUser, req, res, session);
						break;
					default :
						res.sendRedirect(
						super.srctx + LangPath + super.devPage);
						break;
				}
				try {
					mc.close();
				} catch (Exception e) {
					flexLog("Error: " + e);
				}
			} catch (Exception e) {
				flexLog("Error: " + e);
				res.sendRedirect(
				super.srctx + LangPath + super.sckNotRespondPage);
			}
		}
	}

	protected void procReqEnter(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses) throws ServletException, IOException {
		
		ELEERRMessage msgError = null;
		UserPos userPO = null;
	 	
		try {
			
			msgError = (datapro.eibs.beans.ELEERRMessage) Beans.instantiate(getClass().getClassLoader(), "datapro.eibs.beans.ELEERRMessage");
			userPO = (datapro.eibs.beans.UserPos) Beans.instantiate(getClass().getClassLoader(), "datapro.eibs.beans.UserPos");
			userPO.setPurpose("MAINTENANCE");
			
			try {
				userPO.setPurpose(req.getParameter("PURPOSE"));
			} catch (Exception e) {
			}
			
			MessageProcessor mp = null;
			try {
				mp = getMessageProcessor("ERA0075", req);
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				throw new RuntimeException("Socket Communication Error");
			}
			
			ERA007501Message msgL75 = (ERA007501Message) mp.getMessageRecord("ERA007501");

			ses.setAttribute("error", msgError);
			ses.setAttribute("userPO", userPO);
			ses.setAttribute("gaMant", msgL75);
			
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}
		
		// OPECOD
		// 0001 -> Menu = Creacion Reservas Fondos de Garantías
		// 0004 -> Menu = Mantenimiento / Consulta Reservas Fondos de Garantías
		// 0008 -> Aprueba reserva desde interface
		// 0009 -> Menu = Mantenimiento Administracion de Fondos de Garantías
		
		String opecode = req.getParameter("OPECOD") == null || req.getParameter("OPECOD").equals("") ? "0004" : req.getParameter("OPECOD").trim();
		if (opecode.equals("0004") || opecode.equals("0009")){
			try {
				flexLog("About to call Page: " + LangPath + "ERA0075_reserva_FNG_enter.jsp");
				callPage(LangPath + "ERA0075_reserva_FNG_enter.jsp?OPECOD=" + opecode, req, res);
			} catch (Exception e) {
				flexLog("Exception calling page " + e);
			}
		} else {
			try {
				flexLog("About to call Page: " + LangPath + "ERA0075_reserva_FNG_enter_ren.jsp");
				callPage(LangPath + "ERA0075_reserva_FNG_enter_ren.jsp", req, res);
			} catch (Exception e) {
				flexLog("Exception calling page " + e);
			}
			
		}
	}

	private void procActionR(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos userPO = null;
		MessageProcessor mp = null;
		boolean IsNotError = false;
		String page = "";
		
		userPO = getUserPos(req);

		String opecode = req.getParameter("OPECOD") == null || req.getParameter("OPECOD").equals("") ? "0004" : req.getParameter("OPECOD").trim();
		String refere = req.getParameter("E01RESNRE") == null || req.getParameter("E01RESNRE").equals("") ? "" : req.getParameter("E01RESNRE").trim();
		
		userPO.setPurpose(req.getParameter("PURPOSE") == null ? "" : req.getParameter("PURPOSE").trim());
		if (!req.getParameter("PURPOSE").equals("INQUIRY")) {
			userPO.setAccNum(req.getParameter("E01RESNRE") == null ? "" : req.getParameter("E01RESNRE").trim());
		}
		
		try {
			mp = getMessageProcessor("ERA0075", req);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		ERA007501Message msgL75 = (ERA007501Message) mp.getMessageRecord("ERA007501");
		msgL75.setH01USERID(user.getH01USR());
		msgL75.setH01PROGRM("ERA0075");
		msgL75.setH01TIMSYS(getTimeStamp());
		msgL75.setH01SCRCOD(req.getParameter("PURPOSE").equals("INQUIRY") ? "05" : "01");
		msgL75.setH01OPECOD(opecode);
		msgL75.setE01RESNRE(refere);
		msgL75.setE01RESCUN(req.getParameter("E01RESCUN") == null ? "0" : req.getParameter("E01RESCUN").trim());

        // all the fields here
		if (opecode.equals("0002")||opecode.equals("0004")||opecode.equals("0008")||opecode.equals("0010")) {
			try {
				// all the fields here
				java.util.Enumeration enu = msgL75.fieldEnumeration();
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
			} catch (Exception e) {
			}
		}
		
		mp.sendMessage(msgL75);
		ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
		msgL75 = (ERA007501Message) mp.receiveMessageRecord("ERA007501");
		userPO.setCusNum(msgL75.getE01RESCUN());
		userPO.setCusName(msgL75.getE01CUSNA1());

		if (msgL75.getE01RESEST().equals("N")) {
			userPO.setPurpose("NEW");
		}		
		
		IsNotError = msgError.getERRNUM().equals("0");
		session.setAttribute("error", msgError);
		session.setAttribute("userPO", userPO);
		session.setAttribute("gaDetail", msgL75);

		if (msgL75.getE01RESEST().equals("X")) { // end transaction
			if (opecode.equals("0002")||opecode.equals("0004")||opecode.equals("0010")) {
				page = "ERA0075_reserva_FNG_enter.jsp?OPECOD=" + opecode;
			} else {
				page = "ERA0075_reserva_FNG_enter.jsp";
			}
		} else {
			if (IsNotError) { // There are no errors
				if (opecode.equals("0007")) { // There are no errors
					page = "ERA0075_detail_reserva_FNG_ren.jsp.jsp";
				} else {
					page = "ERA0075_detail_reserva_FNG.jsp";
				}
			} else { // There are errors
				if (opecode.equals("0002")||opecode.equals("0004")||opecode.equals("0010")) { 
					page = "ERA0075_detail_reserva_FNG.jsp";
				} else {
					page =  "ERA0075_reserva_FNG_enter.jsp?OPECOD=" + opecode;
				}
			}
		}
		try {
			flexLog("About to call Page: " + LangPath + page);
			callPage(LangPath + page, req, res);
		} catch (Exception e) {
			flexLog("Exception calling page " + e);
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

	private MessageProcessor getMessageProcessor(String targetProgram,
			HttpServletRequest request) throws IOException {
		try {
			return new MessageProcessor(getMessageHandler(targetProgram,
					request));
		} catch (ServiceLocatorException e) {
			throw new IOException(e.getMessage());
		}
	}

	private ELEERRMessage setError(ELEERRMessage msg1, ELEERRMessage msg2) {
		int idx1 = Integer.parseInt(msg1.getERRNUM());
		if (idx1 < 10) {
			if (!msg2.getERRNUM().equals("0")) {
				int idx2 = Integer.parseInt(msg2.getERRNUM());
				for (int i = 1; i <= idx2; i++) {
					idx1++;
					if (idx1 < 11) {
						msg1.getField("ERNU" + Util.addLeftChar('0', 2, "" + idx1)).setString(msg2.getFieldString("ERNU" + Util.addLeftChar('0', 2, "" + i)));
						msg1.getField("ERDS" + Util.addLeftChar('0', 2, "" + idx1)).setString(msg2.getFieldString("ERDS" + Util.addLeftChar('0', 2, "" + i)));
						msg1.getField("ERDF" + Util.addLeftChar('0', 2, "" + idx1)).setString(msg2.getFieldString("ERDF" + Util.addLeftChar('0', 2, "" + i)));
						msg1.getField("ERDR" + Util.addLeftChar('0', 2, "" + idx1)).setString(msg2.getFieldString("ERDR" + Util.addLeftChar('0', 2, "" + i)));
						msg1.getField("ERWF" + Util.addLeftChar('0', 2, "" + idx1)).setString(msg2.getFieldString("ERWF" + Util.addLeftChar('0', 2, "" + i)));
					} else	{
						return msg1;
					}
				}
				msg1.setERRNUM(new BigDecimal(String.valueOf(idx1)));
			}
		}
		return msg1;
	}
	
}