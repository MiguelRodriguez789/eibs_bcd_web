package datapro.eibs.misc;

/**
 * Insert the type's description here.
 * Creation date: (5/12/09 10:20:11 AM)
 * @author: Gustavo Adolfo Villarroel
 */
import java.beans.Beans;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Calendar;
import java.util.Enumeration;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.*;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageContext;
import datapro.eibs.sockets.MessageField;
import datapro.eibs.sockets.MessageRecord;

public class JSECL0220 extends datapro.eibs.master.SuperServlet {
 
	static final int R_LIST 			= 1;
	static final int A_LIST 			= 2;
	static final int R_DETAIL			= 3;
	static final int A_DETAIL			= 4;
	
	static final int R_HISTORY			= 5;

	protected String LangPath = "S";

	/**
	 * JSECL0220 constructor comment.
	 */
	public JSECL0220() {
		super();
	}
	/**
	 * This method was created by Gustavo Adolfo Villarroel.
	 */
	public void destroy() {

		flexLog("free resources used by JSECL0220");

	}
	/**
	 * This method was created by Gustavo Adolfo Villarroel.
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	protected void procReqList(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		ECL022001Message msgList = null;
		JBObjList appList = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send Initial data
		try {
			msgList = (ECL022001Message) mc.getMessageRecord("ECL022001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ECL0220");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0015");
			
			try {
				msgList.setE01NUMREG(req.getParameter("Pos"));
			}
			catch (Exception ex) {
				msgList.setE01NUMREG("0");
			}
			
			msgList.send();
			msgList.destroy();
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

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
			}
			else if (newmessage.getFormatName().equals("ECL022001")) {
				appList = new JBObjList();
				boolean firstTime = true;
				String marker = "";

				while (true) {
					msgList = (ECL022001Message) newmessage;
					marker = msgList.getH01FLGMAS();

					if (marker.equals("*")) {
							appList.setShowNext(false);
							break;
					} else {
						appList.addRow(msgList);
						if (firstTime) {
							firstTime = false;
							appList.setFirstRec(Integer.parseInt(msgList.getE01NUMREG()));
						}
						if (marker.equals("+")) {
							appList.setShowNext(true);
							break;
						}
					}
					newmessage = mc.receiveMessage();
				}

				flexLog("Putting java beans into the session");
				ses.setAttribute("appList", appList);
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);

			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");
			
			try {
				flexLog("About to call Page: " + LangPath + "ECL0220_direct_debiting_assertion_list.jsp");
				callPage(LangPath + "ECL0220_direct_debiting_assertion_list.jsp", req, res);
			} catch (Exception e) {
				flexLog("Exception calling page " + e);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}
	}

	protected void procActionList(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		ESS0030DSMessage msgUser = null;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		try {
			int option = Integer.parseInt(req.getParameter("opt"));

			/*
			switch (option) {
				case 1 : // New
					procReqNew(mc, user, req, res, ses);
					break;
				case 2 : // Maintenance
					procReqMaintenance(mc, user, req, res, ses);
					break;
				case 3 : // Reception
					procReqReception(mc, user, req, res, ses);
					break;
				case 4 : // Delete
					procReqDelete(mc, user, req, res, ses);
					break;
				case 5 : // Inquiry
					procReqInquiry(mc, user, req, res, ses);
					break;
				case 6 : // validate
					procReqValidate(mc, user, req, res, ses);
					break;
				case 101 : // Status Change
					procReqChangeStatus(mc, user, req, res, ses);
					break;
			}
			*/

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}
	protected void procReqDetail(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
	
		MessageRecord newmessage = null;
		ECL022001Message msgDetail = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		JBObjList appList = null;
		boolean IsNotError = false;
	
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		appList = (JBObjList) ses.getAttribute("appList");
		
		int row = -1;
		try {
			row = Integer.parseInt(req.getParameter("ROW"));
		} catch (Exception e) {
		}
		appList.setCurrentRow(row);
	
		// Send Initial data
		try {
			flexLog("Send Initial Data");
			msgDetail = (ECL022001Message) appList.getRecord();
			
			flexLog("Putting java beans into the session");
			ses.setAttribute("msgDetail", msgDetail);
			ses.setAttribute("userPO", userPO);
	
			try {
				flexLog("About to call Page: " + LangPath + "ECL0220_direct_debiting_assertion_detail.jsp");
				callPage(LangPath + "ECL0220_direct_debiting_assertion_detail.jsp", req, res);
			} catch (Exception e) {
				flexLog("Exception calling page " + e);
			}
	
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}
	
	}
	protected void procActionDetail(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
	
		MessageRecord newmessage = null;
		ECL022001Message msgCD = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;
	
		// Send Initial data
		try {
			flexLog("Send Initial Data");
			msgCD = (ECL022001Message) mc.getMessageRecord("ECL022001");
			msgCD.setH01USERID(user.getH01USR());
			msgCD.setH01PROGRM("ECL0220");
			msgCD.setH01TIMSYS(getTimeStamp());
			msgCD.setH01SCRCOD("01");
			msgCD.setH01OPECOD("0005");
	
			// all the fields here
			java.util.Enumeration enu = msgCD.fieldEnumeration();
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
	
			//msgRT.send();
			mc.sendMessage(msgCD);
			msgCD.destroy();
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
	
			if (newmessage.getFormatName().equals("ECL022001")) {
				msgCD = (ECL022001Message) newmessage;
	
				if (IsNotError) { // There are no errors
					try {
						res.setContentType("text/html");
						PrintWriter out = res.getWriter();
						out.println("<HTML>");
						out.println("<HEAD>");
						out.println("<TITLE>Close</TITLE>");
						out.println("</HEAD>");
						out.println("<BODY>");
						out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
						out.println("		top.opener.document.location = '" + super.srctx + "/servlet/datapro.eibs.misc.JSECL0220?SCREEN=1'");
						//out.println("		top.opener.document.forms[0].submit();");
						out.println("		top.close();");
						out.println("</SCRIPT>");
						out.println("<P>Close it!!!</P>");
						out.println("</BODY>");
						out.println("</HTML>");
						out.close();
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				} else { // There are errors
					flexLog("Putting java beans into the session");
					ses.setAttribute("error", msgError);
					ses.setAttribute("msgDetail", msgCD);
					ses.setAttribute("userPO", userPO);
	
					try {
						flexLog("About to call Page: " + LangPath + "ECL0220_direct_debiting_assertion_detail.jsp");
						callPage(LangPath + "ECL0220_direct_debiting_assertion_detail.jsp", req, res);
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
	protected void procReqHistory(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
	
		MessageRecord newmessage = null;
		ECL022001Message msgDetail = null;
		ECL022002Message msgHist = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		JBObjList appList = null;
		boolean IsNotError = false;
		int option;
	
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		appList = (JBObjList) ses.getAttribute("appList");
		
		int row = -1;
		try {
			row = Integer.parseInt(req.getParameter("ROW"));
		} catch (Exception e) {
		}
		appList.setCurrentRow(row);
	
		msgDetail = (ECL022001Message) appList.getRecord();

		// Send Initial data
		try {
			flexLog("Send Initial Data");
			msgHist = (ECL022002Message) mc.getMessageRecord("ECL022002");
			msgHist.setH02USERID(user.getH01USR());
			msgHist.setH02PROGRM("ECL0220");
			msgHist.setH02TIMSYS(getTimeStamp());
			msgHist.setH02SCRCOD("01");
			msgHist.setH02OPECOD("0015");
	
			// all the fields here
			msgHist.setE02LOGEMP(msgDetail.getE01CLIRIF());
			msgHist.setE02LOGCON(msgDetail.getE01CLICON());
			msgHist.setE02LOGIDE(msgDetail.getE01CLIIDE());
	
			msgHist.send();
			msgHist.destroy();
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
			}
			else if (newmessage.getFormatName().equals("ECL022002")) {
				appList = new JBObjList();
				boolean firstTime = true;
				String marker = "";

				while (true) {
					msgHist = (ECL022002Message) newmessage;
					marker = msgHist.getH02FLGMAS();

					if (marker.equals("*")) {
						appList.setShowNext(false);
						break;
					} else {
						appList.addRow(msgHist);
						if (firstTime) {
							firstTime = false;
						}
						if (marker.equals("+")) {
							appList.setShowNext(true);
							break;
						}
					}
					newmessage = mc.receiveMessage();
				}

				flexLog("Putting java beans into the session");
				ses.setAttribute("msgDetail", msgDetail);
				ses.setAttribute("appList", appList);
				ses.setAttribute("userPO", userPO);
		
			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

			try {
				flexLog("About to call Page: " + LangPath + "ECL0220_direct_debiting_assertion_history.jsp");
				callPage(LangPath + "ECL0220_direct_debiting_assertion_history.jsp", req, res);
			} catch (Exception e) {
				flexLog("Exception calling page " + e);
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

			int screen = R_LIST;

			try {

				msgUser = (datapro.eibs.beans.ESS0030DSMessage) session.getAttribute("currUser");

				// Here we should get the path from the user profile
				LangPath = super.rootPath + msgUser.getE01LAN() + "/";

				try {
					flexLog("Opening Socket Connection");
					mc = new MessageContext(getMessageHandler("ECL0220", req));

				try {
					screen = Integer.parseInt(req.getParameter("SCREEN"));
				} catch (Exception e) {
					flexLog("Screen set to default value");
				}

				switch (screen) {
					case R_LIST :
						procReqList(mc, msgUser, req, res, session);
						break;
					case A_LIST :					    
						procActionList(mc, msgUser, req, res, session);
						break;
					case R_DETAIL :
						procReqDetail(mc, msgUser, req, res, session);
						break;
					case A_DETAIL :
						procActionDetail(mc, msgUser, req, res, session);
						break;
						
					case R_HISTORY :
						procReqHistory(mc, msgUser, req, res, session);
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