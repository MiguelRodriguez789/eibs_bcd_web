package datapro.eibs.misc; 

/**
 * Insert the type's description here.
 * Creation date: (22/7/09 12:04:18 PM)
 * @author: Gustavo Adolfo Villarroel
 */
import java.io.*;
import java.net.*;
import java.beans.Beans;
import javax.servlet.*;
import javax.servlet.http.*;
import datapro.eibs.beans.*;

import datapro.eibs.master.Util;

import datapro.eibs.sockets.*;

public class JSECL0200 extends datapro.eibs.master.SuperServlet {

	protected static final int R_CHB_INQ		= 1;
	protected static final int A_CHB_INQ		= 2;
	
	protected String LangPath = "S";

	/**
	 * JSECL0200 constructor comment.
	 */
	public JSECL0200() {
		super();
	}
	/**
	 * This method was created by Gustavo Adolfo Villarroel.
	 */
	public void destroy() {

		flexLog("free resources used by JSECL0200");

	}
	/**
	 * This method was created by Gustavo Adolfo Villarroel.
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqCheckbooksInq(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
		
		ECL0200DSMessage msgChb = null;
		UserPos userPO = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		ses.setAttribute("userPO", userPO);
		
		try { 
			flexLog("About to call Page: " + LangPath + "ECL0200_chb_inq_enter.jsp");
			callPage(LangPath + "ECL0200_chb_inq_enter.jsp", req, res);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}

	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procActionCheckbooksInq(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		ELEERRMessage msgError = null;
		ECL0200DSMessage msgChb = null;
		
		JBObjList beanList = null;
		UserPos userPO = null;
		boolean IsNotError = true;
		String opecode = "";

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send Initial data
		try {
			flexLog("Send Initial Data");
			msgChb = (ECL0200DSMessage) mc.getMessageRecord("ECL0200DS");
			msgChb.setH01USERID(user.getH01USR());
			msgChb.setH01PROGRM("ECL0200");
			msgChb.setH01TIMSYS(getTimeStamp());
			msgChb.setH01SCRCOD("01");
			msgChb.setH01OPECOD("0004");

			// all the fields here
			java.util.Enumeration enu = msgChb.fieldEnumeration();
			MessageField field = null;
			String value = null;
			while (enu.hasMoreElements()) {
				field = (MessageField) enu.nextElement();
				try {
					value = req.getParameter(field.getTag()).toUpperCase();
					if (value != null) {
						field.setString(value);
					}
				} catch (Exception e) {}
			}
			
			msgChb.send();
			msgChb.destroy();
			flexLog("ECL0200DS Message Sent");
		
			// Receive Error
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage)newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				showERROR(msgError);
			}
			else if (newmessage.getFormatName().equals("ECL0200DS")) {
				beanList = new JBObjList();
				boolean firstTime = true;
				String marker = "";
	
				while (true) {
					msgChb = (ECL0200DSMessage) newmessage;
					marker = msgChb.getH01FLGMAS();
	
					if (marker.equals("*")) {
						beanList.setShowNext(false);
						break;
					}
					else {
						beanList.addRow(msgChb);
						if (firstTime) {
							firstTime = false;
						}
						if (marker.equals("+")) {
							beanList.setShowNext(true);
							break;
						}
					}
					newmessage = mc.receiveMessage();
				}
	
			}
			else
				flexLog("Message " + newmessage.getFormatName() + " received.");
			
			flexLog("Putting java beans into the session");
			ses.setAttribute("chbList", beanList);
			ses.setAttribute("userPO", userPO);
			ses.setAttribute("error", msgError);
				
			if (IsNotError) {
				try {
					flexLog("About to call Page: " + LangPath + "ECL0200_chb_inq.jsp");
					callPage(LangPath + "ECL0200_chb_inq.jsp", req, res);						
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			}
			else {
				try {
					flexLog("About to call Page: " + LangPath + "ECL0200_chb_inq_enter.jsp");
					callPage(LangPath + "ECL0200_chb_inq_enter.jsp", req, res);						
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			}
				
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

			int screen = R_CHB_INQ;

			try {

				msgUser =
					(datapro.eibs.beans.ESS0030DSMessage) session.getAttribute(
						"currUser");

				// Here we should get the path from the user profile
				LangPath = super.rootPath + msgUser.getE01LAN() + "/";

				try {
					flexLog("Opening Socket Connection");
					mc = new MessageContext(getMessageHandler("ECL0200", req));

					try {
						screen = Integer.parseInt(req.getParameter("SCREEN"));
					} catch (Exception e) {
						flexLog("Screen set to default value");
					}

					switch (screen) {
						case R_CHB_INQ :							
							procReqCheckbooksInq(mc, msgUser, req, res, session);
							break;	
						case A_CHB_INQ :							
							procActionCheckbooksInq(mc, msgUser, req, res, session);
							break;	
						default :
							res.sendRedirect(super.srctx + LangPath + super.devPage);
							break;
					}
				} catch (Exception e) {
			   		e.printStackTrace();
			   		flexLog("Error: " + e);
			   		res.sendRedirect(super.srctx +LangPath + super.sckNotOpenPage);
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