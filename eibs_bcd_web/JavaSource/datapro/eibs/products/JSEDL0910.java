package datapro.eibs.products;

import java.io.*;
import java.net.*;
import java.beans.Beans;
import javax.servlet.*;
import javax.servlet.http.*;

import datapro.eibs.beans.*;

import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.*;

public class JSEDL0910 extends datapro.eibs.master.SuperServlet {

	// certificate of deposit 
	protected static final int R_RENEWAL       = 1;
	protected static final int A_RENEWAL       = 2;	
	protected static final int R_MODIFIC       = 3;
	protected static final int A_MODIFIC       = 4;	
	// entering options
	protected static final int R_ENTER_RENEWAL = 100;	
	protected static final int R_ENTER_MODIFIC = 101;	
	protected static final int A_ENTER_RENEWAL = 200;
	protected static final int A_ENTER_MODIFIC = 201;
	
	protected static final int A_CHG_PAYMENT   = 700;
	
	protected String LangPath = "S";

	public JSEDL0910() {
		super();
	}

	public void destroy() {
		flexLog("free resources used by JSEDL0910");
	}

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			 
		MessageContext mc = null;
		ESS0030DSMessage msgUser = null;
		HttpSession session = null;
	
		session = (HttpSession)req.getSession(false); 
		
		if (session == null) {
			try {
				res.setContentType("text/html");
				printLogInAgain(res.getWriter());
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Exception ocurred. Exception = " + e);
			}
		} else {
			int screen = R_ENTER_RENEWAL;
			try {
				msgUser = (datapro.eibs.beans.ESS0030DSMessage)session.getAttribute("currUser");
				// Here we should get the path from the user profile
				LangPath = super.rootPath + msgUser.getE01LAN() + "/";
				try {
					flexLog("Opennig Socket Connection ");
					mc = new MessageContext(super.getMessageHandler("EDL0910", req));
					try {
						screen = Integer.parseInt(req.getParameter("SCREEN"));
					} catch (Exception e) {
						flexLog("Screen set to default value");
					}
					switch (screen) {						
						// Request
						case R_ENTER_RENEWAL : 
						case R_ENTER_MODIFIC : 
							procReqEnter(msgUser, req, res, session, screen);
							break;				
						// Action 
						case A_ENTER_RENEWAL : 
						case A_ENTER_MODIFIC : 
							procActionEnter(mc, msgUser, req, res, session, screen);
							break;
						case A_RENEWAL :
						case A_MODIFIC :
							procAction(mc, msgUser, req, res, session);
							break;	
						case A_CHG_PAYMENT:
							procChangePayment(mc, msgUser, req, res, session);
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
				} finally {
					mc.close();
				}
			} catch (Exception e) {
				flexLog("Error: " + e);
				res.sendRedirect(super.srctx + LangPath + super.sckNotRespondPage);
			}
		}
	}

	protected void procReqEnter(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses, int screen)
		throws ServletException, IOException {
 
		ELEERRMessage msgError = null;
		UserPos	userPO = null;
		String accOpt = "";
		
		//screen 100:Reestructuracion 101:Modificacion
		//accOpt   R:Reestructuracion   M:Modificacion
		accOpt = screen != 101 ? "R" : "M";
		
		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
			userPO = new datapro.eibs.beans.UserPos();
			userPO.setOption("LN");
			userPO.setAccOpt(accOpt);
			userPO.setPurpose("MAINTENANCE");
			ses.setAttribute("error", msgError);
			ses.setAttribute("userPO", userPO);
		} catch (Exception ex) {
			flexLog("Error: " + ex); 
		}

		try {
			flexLog("About to call Page: " + LangPath + "EDL0910_ln_enter_renewal.jsp");
			callPage(LangPath + "EDL0910_ln_enter_renewal.jsp?accOpt="+accOpt, req, res);	
		} catch (Exception e) {
			flexLog("Exception calling page " + e);
		}
	}

	protected void procActionEnter(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses, int screen)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDL091001Message msgLN = null;
		ELEERRMessage msgError = null;
		UserPos	userPO = null;	
		boolean IsNotError = false;
		String opcode = "";
		String accOpt = "";
		userPO = getUserPos(req);

		//screen =  200:Reestructuracion  201:Modificacion
		//opcode = 0002:Reestructuracion 0003:Modificacion
		//accOpt =    R:Reestructuracion    M:Modificacion
		opcode = screen != 201 ? "0002" : "0003";
		accOpt = screen != 201 ? "R" : "M";

		//Needed For Plan de Pagos, JSPAYMENT PLAN used in ln-paymentplan.jsp	
		ses.setAttribute("messageName","lnRenew");
		
		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex); 
		}

		// Send Initial data
		try {
			flexLog("Sending header");
			msgLN = (EDL091001Message)mc.getMessageRecord("EDL091001");
			msgLN.setH01USERID(user.getH01USR());
			msgLN.setH01PROGRM("EDL0150");
			msgLN.setH01TIMSYS(getTimeStamp());
			msgLN.setH01SCRCOD("01");
			msgLN.setH01OPECOD(opcode);
			flexLog("Header has been sended");
			try {
				if (req.getParameter("E01DEAACC") != null) {
					msgLN.setE01DEAACC(req.getParameter("E01DEAACC"));
					flexLog("Product Sent");
				}
			} catch (Exception e)	{
				msgLN.setE01DEAACC("0");
				flexLog(" error " + e);
				flexLog(" Error Sent");
			}
			msgLN.send();	
			msgLN.destroy();
			flexLog("EDL091001 Message Sent");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}
			
		// Receive Error Message
		try {
			newmessage = mc.receiveMessage();
			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage)newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				showERROR(msgError);
			} else flexLog("Message " + newmessage.getFormatName() + " received.");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}	
		
		// Receive Data
		try {
			newmessage = mc.receiveMessage();
			if (newmessage.getFormatName().equals("EDL091001")) {
				try {
					msgLN = new datapro.eibs.beans.EDL091001Message();
					flexLog("EDL091001 Message Received");
				} catch (Exception ex) {
					flexLog("Error: " + ex); 
				}
				msgLN = (EDL091001Message)newmessage;
				userPO.setIdentifier(msgLN.getE01DEAACC());
				userPO.setCurrency(msgLN.getE01DEACCY());
				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("lnRenew", msgLN);
				if (IsNotError) {  // There are no errors
					try {
						flexLog("About to call Page: " + LangPath + "EDL0910_ln_renewal.jsp?accOpt="+accOpt);
						res.sendRedirect(super.srctx + LangPath + "EDL0910_ln_renewal.jsp?accOpt="+accOpt);	
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				} else {  // There are errors
					try {
						flexLog("About to call Page: " + LangPath + "EDL0910_ln_enter_renewal.jsp?accOpt="+accOpt);
						callPage(LangPath + "EDL0910_ln_enter_renewal.jsp?accOpt="+accOpt, req, res);	
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				}
			} else flexLog("Message " + newmessage.getFormatName() + " received.");
 		} catch (Exception e)	{
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}	
	}

	protected void procAction(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDL091001Message msgLN = null;
		ELEERRMessage msgError = null;
		UserPos	userPO = null;	
		boolean IsNotError = false;
		int screen = R_ENTER_RENEWAL;
		String accOpt = "";
		String opcode = "0005";
		String recalc = "";
		String flgfve = "";
		
		// accOpt R:Reestructuracion M:Modificacion
		userPO = getUserPos(req);
		accOpt = userPO.getAccOpt().trim();
		if (accOpt.equals("M")) {
			opcode = "0006";
			screen = R_ENTER_MODIFIC;
		}

		recalc = req.getParameter("H01FLGWK1") == null ? "X" : req.getParameter("H01FLGWK1").trim();
		flgfve = req.getParameter("E01FLGFVE") == null ? "Y" : req.getParameter("E01FLGFVE").trim();

		//Needed For Plan de Pagos, JSPAYMENT PLAN used in ln-paymentplan.jsp	
		ses.setAttribute("messageName","lnRenew");
	
		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex); 
		}
	
		// Send Initial data
		try {
			flexLog("Send Initial Data");
			msgLN = (EDL091001Message)ses.getAttribute("lnRenew");
			msgLN.setH01USERID(user.getH01USR());
			msgLN.setH01PROGRM("EDL0910");
			msgLN.setH01TIMSYS(getTimeStamp());
			msgLN.setH01SCRCOD("01");
			msgLN.setH01OPECOD(opcode);		
			// all the fields here
			java.util.Enumeration enu = msgLN.fieldEnumeration();
			MessageField field = null;
			String value = null;
			while (enu.hasMoreElements()) {
				field = (MessageField)enu.nextElement();
				try {
					value = req.getParameter(field.getTag()).toUpperCase();
					if (value != null) {
						field.setString(value);
					}
				} catch (Exception e) {
				}	
			}
			mc.sendMessage(msgLN); //msgLN.send();	
			msgLN.destroy();
			flexLog("EDL091001 Message Sent");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}
			
		// Receive Error Message
		try {
			newmessage = mc.receiveMessage();
			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage)newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				showERROR(msgError);
			} else flexLog("Message " + newmessage.getFormatName() + " received.");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
				throw new RuntimeException("Socket Communication Error");
		}
			
		// Receive Data
		try {
			newmessage = mc.receiveMessage();
			if (newmessage.getFormatName().equals("EDL091001")) { 
				try {
					msgLN = new datapro.eibs.beans.EDL091001Message();
					flexLog("EDL091001 Message Received");
				} catch (Exception ex) {
					flexLog("Error: " + ex); 
				}
				msgLN = (EDL091001Message)newmessage;
				//userPO.setIdentifier(msgLN.getE01DEAACC());
				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("lnRenew", msgLN);
				ses.setAttribute("userPO", userPO);
				
				if (IsNotError && !recalc.equals("X") && !flgfve.equals("Y")) {  // There are no errors
					try {
						flexLog("About to call Page: " + LangPath + "/servlet/datapro.eibs.products.JSEDL0910?SCREEN="+screen);
						res.sendRedirect(super.srctx+"/servlet/datapro.eibs.products.JSEDL0910?SCREEN="+screen);
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				} else {
					flexLog("About to call Page: " + LangPath + "EDL0910_ln_renewal.jsp?accOpt="+accOpt);
					res.sendRedirect(super.srctx + LangPath + "EDL0910_ln_renewal.jsp?accOpt="+accOpt);	
				}
				
//				if (IsNotError || !msgLN.getH01FLGWK1().equals("Y")) {  // There are no errors
//					if (recalc.equals("X") ) {
//						try {
//							flexLog("About to call Page: " + LangPath + "EDL0910_ln_renewal.jsp?accOpt="+accOpt);
//							callPage(LangPath + "EDL0910_ln_renewal.jsp?accOpt="+accOpt, req, res);	
//						} catch (Exception e) {
//							flexLog("Exception calling page " + e);
//						}
//					} else {
//						try {
//							flexLog("About to call Page: " + LangPath + "/datapro.eibs.products.JSEDL0910?SCREEN="+screen);
//							//res.sendRedirect(super.srctx + LangPath + "EDL0910_ln_renewal.jsp?accOpt="+accOpt);
//							res.sendRedirect(super.srctx+"/datapro.eibs.products.JSEDL0910?SCREEN="+screen);
//						} catch (Exception e) {
//							flexLog("Exception calling page " + e);
//						}
//					}
//				} else {
//					try {
//						flexLog("About to call Page: " + LangPath + "EDL0910_ln_renewal.jsp?accOpt="+accOpt);
//						res.sendRedirect(super.srctx + LangPath + "EDL0910_ln_renewal.jsp?accOpt="+accOpt);	
//					} catch (Exception e) {
//						flexLog("Exception calling page " + e);
//					}
//				}
				
			} else flexLog("Message " + newmessage.getFormatName() + " received.");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}	
	}

	private void procChangePayment(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req); 
		
		try {
			EDL091001Message msgData = new EDL091001Message();	
			setMessageRecord(req, msgData);
			if(msgData.getE01FLGFPG().equals("2")){ 
				msgData.setE01DEAIPD("SC2");
				msgData.setE01DEAPPD("SC2");
			} else if (msgData.getE01FLGFPG().equals("3")){  
				msgData.setE01DEAIPD("SC3");
				msgData.setE01DEAPPD("SC3");
			} else if (msgData.getE01FLGFPG().equals("1")){  
				msgData.setE01DEAIPD("SC1");
				msgData.setE01DEAPPD("SC1");
			} else {
				msgData.setE01DEAIPD("30");
				msgData.setE01DEAPPD("30");
			} 
			session.setAttribute("userPO", userPO);
			session.setAttribute("lnRenew", msgData);
			try {	
				flexLog("About to call Page: " + LangPath + "EDL0910_ln_renewal.jsp");
				callPage(LangPath + "EDL0910_ln_renewal.jsp", req, res);	
				return;
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e){
			e.printStackTrace();
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