package datapro.eibs.client;

/** Grupos Economicos **/

import java.io.*;
import java.net.*;
import java.beans.Beans;
import javax.servlet.*;
import javax.servlet.http.*;
import datapro.eibs.beans.*;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.*;

public class JSECIF012 extends datapro.eibs.master.SuperServlet {

protected static final int R_GROUPS_LIST 	= 100;

protected static final int R_ACCOUNT		= 1;

protected String LangPath = "S";

/** Constructor **/
	
public JSECIF012() {
	super();
}

/** Free resources **/
public void destroy() {
	flexLog("free resources used by JSECIF012");
}
	
/** Initiate **/
	
public void init(ServletConfig config) throws ServletException {
	super.init(config);
}


protected void procReqGroupsList(
	MessageContext mc,
	ESS0030DSMessage user,
	HttpServletRequest req,
	HttpServletResponse res,
	HttpSession ses)
	throws ServletException, IOException {

	MessageRecord newmessage = null;
	ECIF01201Message msgList = null;
	ELEERRMessage msgError = null;
	UserPos userPO = null;
	boolean IsNotError = false;

	try {
		msgError =
			(datapro.eibs.beans.ELEERRMessage) Beans.instantiate(
				getClass().getClassLoader(),
				"datapro.eibs.beans.ELEERRMessage");
	} catch (Exception ex) {
		flexLog("Error: " + ex);
	}

	userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

	// Send Initial data
	try {
		msgList = (ECIF01201Message) mc.getMessageRecord("ECIF01201");
		msgList.setH01USERID(user.getH01USR());
		msgList.setH01PROGRM("ECIF012");
		msgList.setH01TIMSYS(getTimeStamp());
		msgList.setH01SCRCOD("01");
		msgList.setH01OPECOD("0015");
		msgList.send();
		msgList.destroy();
		flexLog("ECIF01201 Message Sent");
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
				msgError =
					(datapro.eibs.beans.ELEERRMessage) Beans.instantiate(
						getClass().getClassLoader(),
						"datapro.eibs.beans.ELEERRMessage");
			} catch (Exception ex) {
				flexLog("Error: " + ex);
			}

			msgError = (ELEERRMessage) newmessage;

			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("userPO", userPO);

		}
	} catch (Exception e) {
		e.printStackTrace();
		flexLog("Error: " + e + newmessage);
		throw new RuntimeException("Socket Communication Error Receiving");
	}

	try {
		newmessage = mc.receiveMessage();

		if (newmessage.getFormatName().equals("ECIF01201")) {

			JBObjList beanList = new JBObjList();

			boolean firstTime = true;
			String marker = "";
			String myFlag = "";
			StringBuffer myRow = null;
			String chk = "";
			String TableTyp = "";
			String chkOfac = "";
			String chkWarn = "";
			int compar = 0;
			int indexRow = 0;
			while (true) {

				msgList = (ECIF01201Message) newmessage;
				
				marker = msgList.getE01CNOOPE();

				if (firstTime) {
					firstTime = false;
					chk = "checked";
				} else {
					chk = "";
				}

				if (marker.equals("*")) {
					beanList.setShowNext(false);
					break;
				} else {

					beanList.addRow(msgList);

					if (marker.equals("+")) {
						beanList.setShowNext(true);

						break;
					}
				}
				newmessage = mc.receiveMessage();
			}

			flexLog("Putting java beans into the session");
			ses.setAttribute("ECIF01201Help", beanList);
			ses.setAttribute("userPO", userPO);

			try {
				flexLog(
					"About to call Page: " + LangPath + "ECIF012_groups_enter_list.jsp");
				callPage(
					LangPath + "ECIF012_groups_enter_list.jsp",	req, res);
			} catch (Exception e) {
				flexLog("Exception calling page " + e);
			}

		} else
			flexLog("Message " + newmessage.getFormatName() + " received.");

	} catch (Exception e) {
		e.printStackTrace();
		flexLog("Error: " + e);
		throw new RuntimeException("Socket Communication Data Receiving");
	}

}

/**
 * This method was created in VisualAge.
 */
protected void procReqAcc(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

	MessageRecord newmessage = null;
	ELEERRMessage msgError = null;
	JBList beanList = null;
	UserPos	userPO = null;	
	boolean IsNotError = false;

	try {
		msgError = new datapro.eibs.beans.ELEERRMessage();
	  	} 
	catch (Exception ex) {
		flexLog("Error: " + ex); 
  	}

	userPO = (datapro.eibs.beans.UserPos)ses.getAttribute("userPO");
	
	userPO.setCusNum(req.getParameter("customer"));
	String appCode = req.getParameter("appCode");
	String flag = req.getParameter("flag");

	ses.setAttribute("userPO", userPO);

	res.sendRedirect(super.srctx + "/servlet/datapro.eibs.client.JSECIF010?SCREEN=9&appCode=" + appCode + "&flag=" + flag);

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

		int screen = R_GROUPS_LIST;

		try {

			msgUser =
				(datapro.eibs.beans.ESS0030DSMessage) session.getAttribute(
					"currUser");

			// Here we should get the path from the user profile
			LangPath = super.rootPath + msgUser.getE01LAN() + "/";

			try {
				flexLog("Opennig Socket Connection");
				mc = new MessageContext(super.getMessageHandler("ECIF012", req));

				try {
					screen = Integer.parseInt(req.getParameter("SCREEN"));
				} catch (Exception e) {
					flexLog("Screen set to default value");
				}

				switch (screen) {

					case R_GROUPS_LIST :
						procReqGroupsList(mc, msgUser, req, res, session);
						break;
					case R_ACCOUNT :
						procReqAcc(mc, msgUser, req, res, session);
						break;
					default :
						res.sendRedirect(
							super.srctx + LangPath + super.devPage);
						break;
				}

			} catch (Exception e) {
				e.printStackTrace();
				int sck = getInitSocket(req) + 1;
				flexLog("Socket not Open(Port " + sck + "). Error: " + e);
				res.sendRedirect(
					super.srctx + LangPath + super.sckNotOpenPage);
				//return;
			} finally {
				mc.close();
			}
		} catch (Exception e) {
			flexLog("Error: " + e);
			res.sendRedirect(
				super.srctx + LangPath + super.sckNotRespondPage);
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
