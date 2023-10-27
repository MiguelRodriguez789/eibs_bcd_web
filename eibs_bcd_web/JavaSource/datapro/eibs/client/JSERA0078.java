package datapro.eibs.client;

/**
* Insert the type's description here.
* Creation date: (1/19/00 6:08:55 PM)
*/

import java.io.*;
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
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ERA005000Message;
import datapro.eibs.beans.ERA005501Message;
import datapro.eibs.beans.ERA006001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBListRec;
import datapro.eibs.beans.JBObjList;

public class JSERA0078 extends datapro.eibs.master.SuperServlet {
	
	protected static final int REQ_R = 102;
	// entering options
	protected static final int R_ENTER = 100;
	protected String LangPath = "S";
	/**
	 * JSECLI001 constructor comment.
	 */
	public JSERA0078() {
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


	private void procActionV(
				ESS0030DSMessage user, HttpServletRequest req,
				HttpServletResponse res, HttpSession session) throws IOException {

		boolean IsNotError = false;
		MessageRecord newmessage = null;
		ERA007801Message msgHdr = null;

		String ref = req.getParameter("E01ROCREF") == null || req.getParameter("E01ROCREF").equals("") ? "" : req.getParameter("E01ROCREF").trim();
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ERA0078", req);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		ERA007801Message msgL = (ERA007801Message) mp.getMessageRecord("ERA007801");
		msgL.setH01USERID(user.getH01USR());
		msgL.setH01PROGRM("ERA0078");
		msgL.setH01TIMSYS(getTimeStamp());
		msgL.setH01SCRCOD("01");
		msgL.setH01OPECOD("0015");
		msgL.setE01ROCREF(ref);

		mp.sendMessage(msgL);

		ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
		JBObjList list = mp.receiveMessageRecordList("E01OPECDE");
		
		if (mp.hasError(msgError)) {
			session.setAttribute("error", msgError);
		} else {
			int colNumAcc = 6;
			String myGrpAcc[] = new String[colNumAcc];
			JBListRec gcodeList = new JBListRec();
			gcodeList.init(colNumAcc);
			Iterator iterator = list.iterator();
			while (iterator.hasNext()) {
				msgL = (ERA007801Message) iterator.next();
				if (msgL.getE01TIPREG().equals("0") ) {
					msgHdr = msgL;
				}else{
					myGrpAcc[0] = msgL.getE01ROCREF();
					myGrpAcc[1] = msgL.getE01ROCSEQ();
					myGrpAcc[2] = msgL.getE01ROCSQA();
					myGrpAcc[3] = msgL.getE01TIPREG();
					myGrpAcc[4] = msgL.getE01CLSREG();
					myGrpAcc[5] = msgL.getE01ROCDTA();

					gcodeList.addRow("", myGrpAcc);
				}
			}
			session.setAttribute("listRec", gcodeList);
			session.setAttribute("gaDetail", msgHdr);
		}			

		session.setAttribute("error", msgError);

			try {
				flexLog("About to call Page: " + LangPath
						+ "ERA0078_ga_detail_inq_FNG.jsp.jsp");
				callPage(LangPath + "ERA0078_ga_detail_inq_FNG.jsp", req, res);
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
				mc = new MessageContext(super.getMessageHandler("ERA0078", req));
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
				case REQ_R :
					procActionV(msgUser, req, res, session);
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
	
}