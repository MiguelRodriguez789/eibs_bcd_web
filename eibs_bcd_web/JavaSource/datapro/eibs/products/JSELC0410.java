/*
 * Created on Apr 8, 2008
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package datapro.eibs.products;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELC040001Message;
import datapro.eibs.beans.ELC040002Message;
import datapro.eibs.beans.ELC041001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.MessageContext;
import datapro.eibs.sockets.MessageContextHandler;
import datapro.eibs.sockets.MessageField;
import datapro.eibs.sockets.MessageRecord;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 * StandBy Letter Of Credit Maintenance
 */
public class JSELC0410 extends SuperServlet {

	String LangPath = "s/";
	
	private static final int R_OPENING_MAINT = 3;
	private static final int A_OPENING_MAINT = 4;
	private static final int R_ENTER_MAINT = 200;
	
	protected static final int R_LIST 		= 1;
	protected static final int R_NEW 		= 11;
	protected static final int R_MAINT 		= 12;
	protected static final int A_DELETE 	= 14;
	protected static final int A_MAINT 		= 15;
	
	public JSELC0410() {
		super();
	}
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}
	
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = (HttpSession) req.getSession(false);
		if (session == null) {
			try {
				res.setContentType("text/html");
				super.printLogInAgain(res.getWriter());
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Exception ocurred. Exception = " + e);
			}
		} else {
			int screen = -1;

			ESS0030DSMessage  user = (datapro.eibs.beans.ESS0030DSMessage) session.getAttribute("currUser");
			// Here we should get the path from the user profile
			LangPath = rootPath + user.getE01LAN() + "/";
			
			MessageContext mc = null;
			try {
				mc = new MessageContext(super.getMessageHandler("ELC0400", req));
						
				try {
					screen = Integer.parseInt(req.getParameter("SCREEN"));
					flexLog("Screen  Number: " + screen);
				} catch (Exception e) {
					flexLog("Screen set to default value");
				}
				
				String PageToCall = "";

				switch (screen) {
					case R_ENTER_MAINT :
						procReqEnterMaint(req, res, screen);
						break;
					case R_OPENING_MAINT : // OPENING MAINTENANCE
						procReqOpeningMaint(mc, user, req, res, screen);
						break;
					case A_OPENING_MAINT :
						procActionOpeningMaint(mc, user, req, res, screen);
						break;
					case R_LIST :							
						procReqList(mc, user, req, res, session);
						break;
					case R_NEW:
						procReqNew(mc, user, req, res, session);
						break;	
					case R_MAINT :							
						procReqMaint(mc, user, req, res, session);
						break;								
					case A_DELETE :
						procActionDelete(mc,user, req, res, session);
						break;
					case A_MAINT :
						procActionMaint(mc,user, req, res, session);
						break;
					default :
						PageToCall = "MISC_not_available.jsp";
						callPage(PageToCall, req, res);
						break;
				}

			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				res.sendRedirect(srctx + LangPath + sckNotRespondPage);
			} finally {
				if (mc != null) mc.close();
				flexLog("Socket used by JSELC0410 closed.");
			}
		}	
	}

	protected void procReqList(
			MessageContext mc,
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

			MessageRecord newmessage = null;
			ELEERRMessage msgError = null;
			ELC041001Message msgSearch = null;
			ELC041001Message msgList = null;
			
			JBObjList beanList = null;
			UserPos userPO = null;
			boolean IsNotError = true;

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

			// Send Initial data
			try {
				flexLog("Send Initial Data");
				msgSearch = (ELC041001Message) mc.getMessageRecord("ELC041001");
				msgSearch.setH01USERID(user.getH01USR());
				msgSearch.setH01PROGRM("ELC0410");
				msgSearch.setH01TIMSYS(getTimeStamp());
				msgSearch.setH01SCRCOD("01");
				msgSearch.setH01OPECOD("0015");
			    	
				msgSearch.send();
				msgSearch.destroy();
				flexLog("ELC041001 Message Sent");
			
				// Receive Message
				newmessage = mc.receiveMessage();
				if (newmessage.getFormatName().equals("ELEERR")) {
					msgError = new ELEERRMessage();
					msgError = (ELEERRMessage)newmessage;
					IsNotError = msgError.getERRNUM().equals("0");
					flexLog("IsNotError = " + IsNotError);
					showERROR(msgError);
				} else {
					flexLog("Message " + newmessage.getFormatName() + " received.");				
				}			
					 
				newmessage = mc.receiveMessage();
				if (newmessage.getFormatName().equals("ELC041001")) {
					beanList = new JBObjList();
					String marker = "";

					while (true) {
						msgList = (ELC041001Message) newmessage;
						flexLog("ELC041001 Message Received");					
						marker = msgList.getE01INDOPE();

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
					ses.setAttribute("error", msgError);
					ses.setAttribute("msgList", beanList);
					ses.setAttribute("userPO", userPO);
					
					if (IsNotError) { // There are no errors
						try {
							flexLog("About to call Page: " + LangPath + "ELC0410_ite_rates_list.jsp");
							callPage("ELC0410_ite_rates_list.jsp", req, res);						
						} catch (Exception e) {
							flexLog("Exception calling page " + e);
						}
					} else { // There are errors
						flexLog("Error receiving the List");
					}
						
				} else {
					flexLog("Message " + newmessage.getFormatName() + " received.");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Error: " + e);
				throw new RuntimeException("Socket Communication Error");
			}

		}	
	protected void procReqNew(
			MessageContext mc,
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {
		
			ELC041001Message msgPart = new ELC041001Message();
			MessageRecord newmessage = null;
			boolean IsNotError = true;
			ELEERRMessage msgError = null;
			
			UserPos userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("NEW");
			ses.setAttribute("msgPart", msgPart);
			ses.setAttribute("userPO", userPO);
							try {
								flexLog("About to call Page: " + LangPath + "ELC0410_ite_rates_basic.jsp");
								callPage("ELC0410_ite_rates_basic.jsp", req, res);
							} catch (Exception e) {
								flexLog("Exception calling page " + e);
							}
		}
	protected void procReqMaint(
			MessageContext mc,
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

			MessageRecord newmessage = null;
			ELC041001Message msgPart = null;
			ELEERRMessage msgError = null;
			UserPos userPO = null;
			JBObjList beanList = null;
			boolean IsNotError = false;
			
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setPurpose("MAINTENANCE");

			// Send Initial data
			try {
				//Get the message from the row 
				ELC041001Message msgTemp = null;
				beanList = (JBObjList) ses.getAttribute("msgList");
				beanList.setCurrentRow(Integer.parseInt(req.getParameter("CURRENTROW")));
				msgTemp = (ELC041001Message) beanList.getRecord();

				//msgPart = (ELC041001Message) mc.getMessageRecord("ELC041001");
				//msgPart.setE01PRATCD(msgTemp.getE01PRATCD());
				msgPart = msgTemp;

				msgPart.setH01USERID(user.getH01USR());
				msgPart.setH01PROGRM("ELC0410");
				msgPart.setH01TIMSYS(getTimeStamp());
				msgPart.setH01SCRCOD("01");
				msgPart.setH01OPECOD("0002");

				mc.sendMessage(msgPart);
				//msgPart.send();
				msgPart.destroy();
				flexLog("ELC041001 Message Sent");

				// Receive Error Y Data
				// Error
					newmessage = mc.receiveMessage();
					if (newmessage.getFormatName().equals("ELEERR")) {
						msgError = new ELEERRMessage();
						msgError = (ELEERRMessage) newmessage;
						IsNotError = msgError.getERRNUM().equals("0");
						flexLog("IsNotError = " + IsNotError);
						showERROR(msgError);
					
					} else 
						flexLog("Message " + newmessage.getFormatName() + " received.");
		
				// Receive Data
					newmessage = mc.receiveMessage();
					if (newmessage.getFormatName().equals("ELC041001")) {
						msgPart = new datapro.eibs.beans.ELC041001Message();
						msgPart = (ELC041001Message) newmessage;
						flexLog("ELC041001 Message Received");
									
						flexLog("Putting java beans into the session");
						ses.setAttribute("error", msgError);
						ses.setAttribute("userPO", userPO);
						ses.setAttribute("msgPart", msgPart);
		
						if (IsNotError) { // There are no errors
							try {
								flexLog("About to call Page: " + LangPath + "ELC0410_ite_rates_basic.jsp");
								callPage("ELC0410_ite_rates_basic.jsp", req, res);
							} catch (Exception e) {
								flexLog("Exception calling page " + e);
							}
						} else { // There are errors
							try {
								flexLog("About to call Page: " + LangPath + "ELC0410_ite_rates_list.jsp");
								callPage("ELC0410_ite_rates_list.jsp", req, res);
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
	protected void procActionDelete(
			MessageContext mc,
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {
			
			JBObjList beanList = null;
			MessageRecord newmessage = null;
			ELC041001Message msgPart = null;
			boolean IsNotError = false;
			ELEERRMessage msgError = null;
			
			try {
				//Get the message from the row 
				ELC041001Message msgTemp = null;
				beanList = (JBObjList) ses.getAttribute("msgList");
				beanList.setCurrentRow(Integer.parseInt(req.getParameter("CURRENTROW")));
				msgTemp = (ELC041001Message) beanList.getRecord();
				
				msgPart = (ELC041001Message) mc.getMessageRecord("ELC041001");
				msgPart.setE01MXIFID(msgTemp.getE01MXIFID());
				msgPart.setE01MXIFIM(msgTemp.getE01MXIFIM());
				msgPart.setE01MXIFIY(msgTemp.getE01MXIFIY());
				
				msgPart.setH01USERID(user.getH01USR());
				msgPart.setH01PROGRM("ELC0410");
				msgPart.setH01TIMSYS(getTimeStamp());
				msgPart.setH01SCRCOD("01");
				msgPart.setH01OPECOD("0009");
			
				msgPart.send();
				msgPart.destroy();
				
				// Receive Error Message
				newmessage = mc.receiveMessage();
				if (newmessage.getFormatName().equals("ELEERR")) {
					msgError = (ELEERRMessage) newmessage;
					IsNotError = msgError.getERRNUM().equals("0");
					flexLog("IsNotError = " + IsNotError);
					showERROR(msgError);
						
					flexLog("Putting java beans into the session");
					ses.setAttribute("error", msgError);
					ses.setAttribute("msgPart", msgPart);
			
					if (IsNotError) {
						res.sendRedirect(super.srctx + "/servlet/datapro.eibs.products.JSELC0410?SCREEN=1");
					} else {
						try {
							flexLog("About to call Page: " + LangPath + "ELC0410_ite_rates_list.jsp");
							callPage("ELC0410_ite_rates_list.jsp", req, res);						
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
	protected void procActionMaint(
			MessageContext mc,
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {
		
			MessageRecord newmessage = null;
			ELC041001Message msgPart = null;
			ELEERRMessage msgError = null;
			UserPos userPO = null;
			boolean IsNotError = false;
			
			String opCode = "";
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			if (userPO.getPurpose().equals("NEW")) {
				opCode = "0001";
			} else {
				opCode = "0005";
			}		
			
			// Send Initial data
			try {
				flexLog("Send Initial Data");
				msgPart = (ELC041001Message)mc.getMessageRecord("ELC041001");
				msgPart.setH01USERID(user.getH01USR());
				msgPart.setH01PROGRM("EPR0320");
				msgPart.setH01TIMSYS(getTimeStamp());
				msgPart.setH01SCRCOD("01");
				msgPart.setH01OPECOD(opCode);
		
				// all the fields here
				java.util.Enumeration enu = msgPart.fieldEnumeration();
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
		
				msgPart.send();
				msgPart.destroy();
				flexLog("ELC041001 Message Sent");
		
			// Receive Error Message
				newmessage = mc.receiveMessage();
				if (newmessage.getFormatName().equals("ELEERR")) {
					msgError = new ELEERRMessage();
					msgError = (ELEERRMessage) newmessage;
					IsNotError = msgError.getERRNUM().equals("0");
					flexLog("IsNotError = " + IsNotError);
					showERROR(msgError);
				} else 
					flexLog("Message " + newmessage.getFormatName() + " received.");
		
			// Receive Data
				newmessage = mc.receiveMessage();
				if (newmessage.getFormatName().equals("ELC041001")) {
					msgPart = new datapro.eibs.beans.ELC041001Message();
					msgPart = (ELC041001Message) newmessage;
					flexLog("ELC041001 Message Received");
									
					flexLog("Putting java beans into the session");
					ses.setAttribute("error", msgError);
					ses.setAttribute("msgPart", msgPart);
					ses.setAttribute("userPO", userPO);
		
					if (IsNotError) { // There are no errors
							try {
								res.sendRedirect(super.srctx + 
									"/servlet/datapro.eibs.products.JSELC0410?SCREEN=1" );
							} catch (Exception e) {
								flexLog("Exception calling page " + e);
							}
					} else { // There are errors
							try {
								flexLog("About to call Page: " + LangPath + "ELC0410_ite_rates_basic.jsp");
								callPage("ELC0410_ite_rates_basic.jsp", req, res);
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
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void procActionOpeningMaint(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos  userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC040001Message msg = (ELC040001Message) session.getAttribute("msg");
			msg = (ELC040001Message) msgHandle.initMessage(msg, user.getH01USR(), "0005");
			initTransaction(userPO, String.valueOf(screen), "MAINTENANCE");
			msg.setH01SCRCOD("01");
			msgHandle.setFieldsFromPage(req, msg);
			msgHandle.sendMessage(msg);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg = (ELC040001Message) msgHandle.receiveMessage();
			userPO.setIdentifier(msg.getE01LCMACC());
			userPO.setHeader11(msg.getE01LCMORF());
			userPO.setHeader12(msg.getE01LCMTRF());
			userPO.setHeader13(msg.getE01LCMPRO());
			userPO.setHeader14(msg.getE01DSCPRO());
			putDataInSession(session, userPO, msgError, msg);
			if (isNotError) {
				procReqDetailsMaint(mc, user, req, res, screen);
			} else {
				PageToCall = "ELC0400_sb_basic_info.jsp";
				callPage(PageToCall, req, res);
			}		
		
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void procReqDetailsMaint(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos  userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC040002Message msg = (ELC040002Message) msgHandle.initMessage("ELC040002", user.getH01USR(), "0002");
			initTransaction(userPO, String.valueOf(screen), "MAINTENANCE");
			msg.setH02SCRCOD("01");
			msg.setE02LCMCUN("E01LCMCUN");
			try {
				msg.setE02LCMACC(req.getParameter("E02LCMACC").toUpperCase());
			} catch (Exception e) {
				msg.setE02LCMACC(userPO.getIdentifier());
			}
			userPO.setIdentifier(msg.getE02LCMACC());
			msgHandle.sendMessage(msg);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg = (ELC040002Message) msgHandle.receiveMessage();
			userPO.setHeader1(msg.getE02LCMPRO());
			userPO.setIdentifier(msg.getE02LCMACC());
			userPO.setBank(msg.getE02LCMBNK());
			userPO.setHeader2(msg.getE02DSCPRO());
			userPO.setHeader3(msg.getE02LCMTRF());
			userPO.setAccNum(msg.getE02LCMACC());
			putDataInSession(session, userPO, msgError, msg);
			if (isNotError) {
				PageToCall = "ELC0400_sb_details.jsp";
				callPage(PageToCall, req, res);
			} else {
				PageToCall = "ELC0400_sb_enter_maint.jsp";
				callPage(PageToCall, req, res);
			}	
		
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 * @throws ServletException 
	 */
	private void procReqOpeningMaint(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, int screen) throws IOException, ServletException {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos  userPO = getUserPos(req);
		String PageToCall = "";
		try {
			MessageContextHandler msgHandle = new MessageContextHandler(mc);
			ELC040001Message msg = (ELC040001Message) msgHandle.initMessage("ELC040001", user.getH01USR(), "0002");
			initTransaction(userPO, String.valueOf(screen), "MAINTENANCE");
			msg.setH01SCRCOD("01");
			try {
				msg.setE01LCMACC(req.getParameter("E01LCMACC").toUpperCase());
			} catch (Exception e) {
				msg.setE01LCMACC(userPO.getIdentifier());
			}
			try {
				msg.setE01LCMSWF(req.getParameter("E01LCMSWF").toUpperCase());
			} catch (Exception e) {
			}
			try {
				msg.setE01LCMAMF(req.getParameter("AMENDMENT").toUpperCase());
			} catch (Exception e) {
			}
			try {
				msg.setH01FLGMAS(req.getParameter("H01FLGMAS"));
			} catch (Exception e) {
			}
			userPO.setIdentifier(msg.getE01LCMACC());
			msgHandle.sendMessage(msg);
			ELEERRMessage msgError = msgHandle.receiveErrorMessage();
			boolean isNotError = msgError.getERRNUM().equals("0");
			msg = (ELC040001Message) msgHandle.receiveMessage();
			userPO.setHeader1(msg.getE01LCMPRO());
			userPO.setIdentifier(msg.getE01LCMACC());
			userPO.setBank(msg.getE01LCMBNK());
			userPO.setHeader2(msg.getE01DSCPRO());
			userPO.setHeader3(msg.getE01LCMTRF());
			userPO.setAccNum(msg.getE01LCMACC());
			putDataInSession(session, userPO, msgError, msg);
			if (isNotError) {
				PageToCall = "ELC0400_sb_basic_info.jsp";
				callPage(PageToCall, req, res);
			} else {
				PageToCall = "ELC0400_sb_enter_maint.jsp";
				callPage(PageToCall, req, res);
			}	
		
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

	/**
	 * @param req
	 * @param res
	 * @param screen
	 */
	private void procReqEnterMaint(HttpServletRequest req, HttpServletResponse res, int screen) {
		HttpSession session = (HttpSession) req.getSession(false);
		UserPos  userPO = getUserPos(req);
		String PageToCall = "ELC0400_sb_enter_maint.jsp";
		initTransaction(userPO, String.valueOf(screen), "MAINTENANCE");
		userPO.setHeader18("NO_MENU");
		userPO.setProdCode("CC");
		putDataInSession(session, userPO, null, new ELC040001Message());
		callPage(PageToCall, req, res);
	}
	
	private void initTransaction(UserPos  userPO, String optMenu, String purpose) {
		userPO.setOption(optMenu);
		userPO.setPurpose(purpose);
	}
	
	public void callPage(String page, HttpServletRequest req, HttpServletResponse res) {
		try {
			super.callPage(LangPath + page, req, res);
		} catch (Exception e) {
			flexLog("Exception calling page " + e.toString() + e.getMessage());
		}
		return; 
	}
	
	private void putDataInSession(HttpSession session, UserPos  userPO, ELEERRMessage msgError, MessageRecord msg) {
		try {
			flexLog("Putting java beans into the session");

			if (msgError == null) {
				msgError = new ELEERRMessage(); 
			}
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			if (msg != null) session.setAttribute("msg", msg);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error at putBeansInSession(): " + e);
			throw new RuntimeException("Socket Communication Error");
		}
	}
	protected void showERROR(ELEERRMessage m){
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
