package datapro.eibs.params;

/**
 * Maintenance for Special User Codes (USFL1).
 * Creation date: (10/26/06 6:08:55 PM)
 * @author: Carlos Castillo
 */
import java.io.*;
import java.net.*;
import java.beans.Beans; 
import javax.servlet.*;
import javax.servlet.http.*;
import datapro.eibs.beans.*;
import datapro.eibs.sockets.*;

public class JSEUS0000 extends datapro.eibs.master.SuperServlet {

	
	protected static final int R_ENTER_LIST = 1;    	// Send List of Tables
	protected static final int A_ENTER_LIST = 2;		// Send Codes of a table
	protected static final int R_MAINTENANCE = 800;		// Request record for Maintenance (New/Update/Delete)
	protected static final int A_MAINTENANCE = 600;		// Submit for Update or Write
	
	private String LangPath = "S";

	/**
	 * 
	 */
	public JSEUS0000() {
		super();
	}
	/**
	 * 
	 */
	public void destroy() {

		flexLog("free resources used by JSEUS0000");

	}
	/**
	 * 
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

			int screen = R_ENTER_LIST;

			try {

				msgUser = (datapro.eibs.beans.ESS0030DSMessage) session.getAttribute("currUser");

				// Here we should get the path from the user profile
				LangPath = super.rootPath + msgUser.getE01LAN() + "/";

				try {
					flexLog("Opennig Socket Connection");
					mc = new MessageContext(super.getMessageHandler("EUS0000", req));
				

				try {
					screen = Integer.parseInt(req.getParameter("SCREEN"));
				} catch (Exception e) {
					flexLog("Screen set to default value");
				}

				switch (screen) {
					// Requests
					case R_ENTER_LIST :
						procReqEnterList( mc, msgUser, req, res, session);
						break;
					case A_ENTER_LIST :
						procActionEnterList( mc, msgUser, req, res, session);
						break;
					case R_MAINTENANCE :
						int inptOPT = 0;
						inptOPT = Integer.parseInt(req.getParameter("opt"));
						switch(inptOPT) {
							case 1: // New
								procReqNew(mc, msgUser, req, res, session);
								break;
							case 2: // Update
								procReqMaintenance(mc, msgUser, req, res, session);
								break;
							case 3: // Delete
								procActionDelete(mc, msgUser, req, res, session);
								break;
							default:
								res.sendRedirect(super.srctx + "/servlet/datapro.eibs.params.JSEUS0000?SCREEN=2");
								break;

						}
						break;
					case A_MAINTENANCE :
						procActionMaintenance(mc, msgUser, req, res, session);
						break;

					// END Entering
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
				}
				finally {
					mc.close();
				}

			} catch (Exception e) {
				flexLog("Error: " + e);
				res.sendRedirect(super.srctx + LangPath + super.sckNotRespondPage);
			}

		}

	}
	
	protected void procReqEnterList(
									MessageContext mc,
									ESS0030DSMessage user,
									HttpServletRequest req,
									HttpServletResponse res,
									HttpSession ses)
									throws ServletException, IOException {

	MessageRecord newmessage = null;
	EUS000001Message msgList = null;
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
		msgList = (EUS000001Message) mc.getMessageRecord("EUS000001");
		msgList.setH01USERID(user.getH01USR());
		msgList.setH01PROGRM("EUS0000");
		msgList.setH01TIMSYS(getTimeStamp());
		msgList.setH01SCRCOD("01");
		msgList.setH01OPECOD("0015");
		msgList.send();
		msgList.destroy();
		flexLog("EUS000001 Message Sent");
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

			// showERROR(msgError);
			//beanList.setNoResult(true);

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

		if (newmessage.getFormatName().equals("EUS000001")) {

			JBObjList beanList = new JBObjList();

			boolean firstTime = true;
			String marker = "";
			String myFlag = "";
			StringBuffer myRow = null;
			String chk = "";
			int compar = 0;
			int indexRow = 0;
			while (true) {

				msgList = (EUS000001Message) newmessage;

				marker = msgList.getE01USTOPE();

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
			ses.setAttribute("EUS000001Help", beanList);
			ses.setAttribute("userPO", userPO);

			try {
				flexLog("About to call Page: " + LangPath + "EUS0000_enter_list.jsp");
				callPage(LangPath + "EUS0000_enter_list.jsp", req, res);
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

	//
	//  Send Codes list of a table
	//
	protected void procActionEnterList(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EUS000002Message msgList = null;
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
			msgList = (EUS000002Message) mc.getMessageRecord("EUS000002");
			msgList.setH02USERID(user.getH01USR());
			msgList.setH02PROGRM("EUS0000");
			msgList.setH02TIMSYS(getTimeStamp());
			msgList.setH02SCRCOD("01");
			msgList.setH02OPECOD("0015");
			
			try{
				msgList.setE02US1RTY(req.getParameter("TABLECODE"));
			} catch (Exception e) {
				msgList.setE02US1RTY(userPO.getHeader6());
			}
			
			msgList.send();
			msgList.destroy();
			flexLog("EUS000002 Message Sent");
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

				// showERROR(msgError);
				//beanList.setNoResult(true);

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

			if (newmessage.getFormatName().equals("EUS000002")) {

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

					msgList = (EUS000002Message) newmessage;

					marker = msgList.getE02US1OPE();

					if (firstTime) {
						firstTime = false;
						chk = "checked";
						userPO.setHeader10(msgList.getE02USTDES());
						userPO.setHeader6(msgList.getE02US1RTY());
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
				ses.setAttribute("EUS000002Help", beanList);
				ses.setAttribute("userPO", userPO);

				try {
					flexLog("About to call Page: " + LangPath + "EUS0000_codes_list.jsp");
					callPage(LangPath + "EUS0000_codes_list.jsp", req, res);
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

	// 
	// Request Maintenance on USFL1
	//
	protected void procReqMaintenance(
			MessageContext mc,
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

			MessageRecord newmessage = null;
			EUS000002Message msgRT = null;
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
				msgRT = (EUS000002Message) mc.getMessageRecord("EUS000002");
				msgRT.setH02USERID(user.getH01USR());
				msgRT.setH02PROGRM("EUS0000");
				msgRT.setH02TIMSYS(getTimeStamp());
				msgRT.setH02OPECOD("1000");
				try{
					msgRT.setE02US1RTY(req.getParameter("TABLECODE"));
				}catch (Exception e) {
					msgRT.setE02US1RTY(userPO.getHeader6());
				}
				try{
					msgRT.setE02US1CDE(req.getParameter("REFCODE"));
				}catch (Exception e) {
					msgRT.setE02US1CDE(userPO.getHeader7());
				}
				
				// all the fields here
				java.util.Enumeration enu = msgRT.fieldEnumeration();
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
							
				mc.sendMessage(msgRT);
				msgRT.destroy();
				flexLog("EUS000002 Message Sent");
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

					if (newmessage.getFormatName().equals("EUS000002")) {
						try {
							msgRT = new EUS000002Message();
							flexLog("EUS000002 Message Received");
						} catch (Exception ex) {
							flexLog("Error: " + ex);
						}
						
						msgRT = (EUS000002Message) newmessage;
						flexLog("Putting java beans into the session");
						ses.setAttribute("error", msgError);
						ses.setAttribute("refCodes", msgRT);
						ses.setAttribute("userPO", userPO);
						userPO.setHeader7(msgRT.getE02US1CDE());

						if (IsNotError) { // There are no errors
							try {flexLog("About to call Page: " + LangPath + "EUS0000_usfl1_codes_details.jsp");
								callPage(LangPath + "EUS0000_usfl1_codes_details.jsp", req, res);
							} catch (Exception e) {
								flexLog("Exception calling page " + e);
							}
						} else { // There are errors
							res.sendRedirect(super.srctx
									+ "/servlet/datapro.eibs.params.JSEUS0000?SCREEN=2");
						}
					} else
						flexLog("Message " + newmessage.getFormatName() + " received.");

				} catch (Exception e) {
					e.printStackTrace();
					flexLog("Error: " + e);
					throw new RuntimeException("Socket Communication Error");
				}

			}

		
	// 
	// Write Maintenance on USFL1
	//
	protected void procActionMaintenance(
			MessageContext mc,
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

			MessageRecord newmessage = null;
			EUS000002Message msgRT = null;
			ELEERRMessage msgError = null;
			UserPos userPO = null;
			boolean IsNotError = false;
			int acctype = 0;

			try {
				msgError = new datapro.eibs.beans.ELEERRMessage();
			} catch (Exception ex) {
				flexLog("Error: " + ex);
			}

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

			// Send Initial data
			try {
				flexLog("Send Initial Data");
				msgRT = (EUS000002Message) ses.getAttribute("refCodes");
				msgRT.setH02USERID(user.getH01USR());
				msgRT.setH02PROGRM("EUS0000");
				msgRT.setH02TIMSYS(getTimeStamp());
				msgRT.setH02OPECOD("0005");
				if(userPO.getHeader7().equals("")){
					msgRT.setH02OPECOD("0001");
				}
				msgRT.setE02US1CDE(req.getParameter("E02US1CDE"));
				// all the fields here
				java.util.Enumeration enu = msgRT.fieldEnumeration();
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
							
				mc.sendMessage(msgRT);
				msgRT.destroy();
				flexLog("EUS000002 Message Sent");
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

				if (newmessage.getFormatName().equals("EUS000002")) {
					try {
						msgRT = new EUS000002Message();
						flexLog("EUS000002 Message Received");
					} catch (Exception ex) {
						flexLog("Error: " + ex);
					}

					msgRT = (EUS000002Message) newmessage;

					flexLog("Putting java beans into the session");
					ses.setAttribute("error", msgError);
					ses.setAttribute("refCodes", msgRT);
					ses.setAttribute("userPO", userPO);

					if (IsNotError) { // There are no errors
						res.sendRedirect(
							super.srctx
								+ "/servlet/datapro.eibs.params.JSEUS0000?SCREEN=2");
					} else { // There are errors
						String tablecode = userPO.getHeader6();

					    try {
							flexLog("About to call Page: " + LangPath + "EUS0000_usfl1_codes_details.jsp");
							callPage(LangPath + "EUS0000_usfl1_codes_details.jsp", req, res);
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

	//
	//  New Record for USFL1
	//
	protected void procReqNew(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses) throws ServletException, IOException {
			MessageRecord newmessage = null;
			ELEERRMessage msgError = null;
			EUS000002Message msgRT = null;
			UserPos userPO = null;
			boolean IsNotError = false;
			try {
				msgError = new ELEERRMessage();
			}
			catch(Exception ex) {
				flexLog("Error: " + ex);
			}
			userPO = (UserPos)ses.getAttribute("userPO");
			msgRT = new EUS000002Message();
			msgRT.setE02US1RTY(userPO.getHeader6());
			msgRT.setE02US1CDE("");
			ses.setAttribute("refCodes", msgRT);
			userPO.setHeader7(msgRT.getE02US1CDE());
			try {
				flexLog("About to call Page: " + LangPath + "EUS0000_usfl1_codes_details.jsp");
				callPage(LangPath + "EUS0000_usfl1_codes_details.jsp", req, res);
			}
			catch(Exception e) {
				flexLog("Exception calling page " + e);
			}
		}

		//
		//  Delete Record from USFL1
		//
		protected void procActionDelete(
			MessageContext mc,
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {
	
			MessageRecord newmessage = null;
			EUS000002Message msgRT = null;
			ELEERRMessage msgError = null;
			UserPos userPO = null;
			boolean IsNotError = false;
			int acctype = 0;
	
			try {
				msgError = new datapro.eibs.beans.ELEERRMessage();
			} catch (Exception ex) {
				flexLog("Error: " + ex);
			}
	
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
			try {
						JBObjList bl = (JBObjList) ses.getAttribute("EUS000002Help");
						int idx = Integer.parseInt(req.getParameter("CURRCODE"));
						bl.setCurrentRow(idx);
	
				msgRT = (EUS000002Message) bl.getRecord();
			
				
	
					} catch (Exception e) {
						e.printStackTrace();
						flexLog("Error: " + e);
						throw new RuntimeException("Socket Communication Error");
					}		
	
			// Send Initial data
			try {
				flexLog("Send Initial Data");
				msgRT.setH02USERID(user.getH01USR());
				msgRT.setH02PROGRM("EUS0000");
				msgRT.setH02TIMSYS(getTimeStamp());
				msgRT.setH02OPECOD("0009");
				// all the fields here
				java.util.Enumeration enu = msgRT.fieldEnumeration();
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
	
				mc.sendMessage(msgRT);
				msgRT.destroy();
				flexLog("EUS000002 Message Sent");
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
	
				res.sendRedirect(super.srctx
								+ "/servlet/datapro.eibs.params.JSEUS0000?SCREEN=2");
	
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				throw new RuntimeException("Socket Communication Error");
			}
	
	
		}


	//
	//  Show errors
	//
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