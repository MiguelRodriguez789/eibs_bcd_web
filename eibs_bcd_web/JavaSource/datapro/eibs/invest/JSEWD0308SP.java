package datapro.eibs.invest;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: Orestes Garcia
 */
import java.io.*;
import java.net.*;
import java.beans.Beans;
import javax.servlet.*;
import javax.servlet.http.*;
import datapro.eibs.beans.*;

import datapro.eibs.master.Util;

import datapro.eibs.sockets.*;

public class JSEWD0308SP extends datapro.eibs.master.SuperServlet {

	// Limits Inquiry
	static final int R_LIST   = 1;
	static final int A_LIST   = 2;
	static final int R_I_LIST = 3;
	static final int R_ENTER_LIST 	  = 100;
	static final int R_ENTER_ADV_LIST = 300;
	static final int R_I_ENTER_LIST   = 500;
	private String LangPath = "S";

	/**
	 * JSECLI001 constructor comment.
	 */
	public JSEWD0308SP() {
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
	private void procReqList(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EWD0308DSMessage msgList = null;
		ELEERRMessage msgError = null;
		JBList beanList = null;
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
		String Nexte ="";
		// Send Initial data
		try {
			msgList = (EWD0308DSMessage) mc.getMessageRecord("EWD0308DS");
			
			try { //Next
					
				Nexte= req.getParameter("NEXTE");
				
			} catch (Exception e) {
				
			}
			
			try { //From Pos
					
				msgList.setRWDFRC(req.getParameter("Pos"));
				
			} catch (Exception e) {
				msgList.setRWDFRC("0");
				
			}
			try { //Code search
					
				msgList.setRWDTYP(req.getParameter("SEARCHC"));
				
			} catch (Exception e) {
				msgList.setRWDTYP("");
			}
			
			try { // Search By Symbol
				msgList.setSWDSYM(req.getParameter("SYMBOL").toUpperCase());
				
				
				
			} catch (Exception e) {
				msgList.setRWDTYP("");
			}

			try { // Search By ISIN/Serial
				msgList.setSWDNUM(req.getParameter("ISIN").toUpperCase());
				msgList.setSWDSER(req.getParameter("SERIAL").toUpperCase());
				
				
				
			} catch (Exception e) {
				msgList.setSWDNUM("");
			}

			try { // Search By CUSIP
				
				msgList.setSWDCUS(req.getParameter("CUSIP").toUpperCase());
				
				
				
			} catch (Exception e) {
				msgList.setSWDCUS("");
			}
				
			try { // Search By Description
				
				msgList.setSWDDSC(req.getParameter("DESCRIPTION").toUpperCase());
				
				 
				
			} catch (Exception e) {
				
			}
			
			try { // Search By Instrument Type
				msgList.setSWDPTY(req.getParameter("TYPE").toUpperCase());
			} catch (Exception e) {
				
			}

			try { // Search By Issuer
				msgList.setSWDENM(req.getParameter("ISSUER").toUpperCase());
				
				
				
			} catch (Exception e) {
				
			}
			
			try { // Search By Instrument Code
				msgList.setSWDIIC(req.getParameter("INSTCODE").toUpperCase());
				
				
				
			} catch (Exception e) {
				
			}
			
						
			try { // Search By Status
				msgList.setSWDSTS(req.getParameter("STATUS").toUpperCase());
			} catch (Exception e) {
				msgList.setSWDSTS("");
			}
			
			try { // Search By Date from 
				msgList.setSWDFR1(req.getParameter("DATEF1").toUpperCase());
				msgList.setSWDFR2(req.getParameter("DATEF2").toUpperCase());
				msgList.setSWDFR3(req.getParameter("DATEF3").toUpperCase());
				
				 
				
			} catch (Exception e) {
				
			}
			
			try { // Search By Date to 
				msgList.setSWDTO1(req.getParameter("DATET1").toUpperCase());
				msgList.setSWDTO1(req.getParameter("DATET2").toUpperCase());
				msgList.setSWDTO1(req.getParameter("DATET3").toUpperCase());
				
				
				
			} catch (Exception e) {
				
			}
			
			try { // List Preferential Instruments
				msgList.setSWDSTS(req.getParameter("STATUS").toUpperCase());
			} catch (Exception e) {
				
			}
			
			try { // Search By Coupon Rate
				
				msgList.setSWDRTE(req.getParameter("RATE").toUpperCase());				 
				
			} catch (Exception e) {
				
			}
			
			try { // Search By Maturity Date from 
				msgList.setSWDMF1(req.getParameter("DATEMF1").toUpperCase());
				msgList.setSWDMF2(req.getParameter("DATEMF2").toUpperCase());
				msgList.setSWDMF3(req.getParameter("DATEMF3").toUpperCase());

			} catch (Exception e) {
				
			}
			
			try { // Search By Date to 
				msgList.setSWDMT1(req.getParameter("DATEMT1").toUpperCase());
				msgList.setSWDMT2(req.getParameter("DATEMT2").toUpperCase());
				msgList.setSWDMT3(req.getParameter("DATEMT3").toUpperCase());

			} catch (Exception e) {
				
			}
			
			try { // Search By Country
				
				msgList.setSWDCTR(req.getParameter("COUNTRY").toUpperCase());				 
				
			} catch (Exception e) {
				
			}
			
			try { // Search By Currency
				
				msgList.setSWDCCY(req.getParameter("CURRENCY").toUpperCase());				 
				
			} catch (Exception e) {
				
			}
			
			
			msgList.send();
			msgList.destroy();
			flexLog("EWD0308DS Message Sent");
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
				beanList.setNoResult(true);

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("docList", beanList);
				ses.setAttribute("userPO", userPO);

				res.sendRedirect(super.srctx + "/servlet/datapro.eibs.invest.JSEWD0308SP?SCREEN=100");

			} else
				if (newmessage.getFormatName().equals("EWD0308DS")) {

					try {
						beanList =
							(datapro.eibs.beans.JBList) Beans.instantiate(
								getClass().getClassLoader(),
								"datapro.eibs.beans.JBList");
					} catch (Exception ex) {
						flexLog("Error: " + ex);
					}

					boolean firstTime = true;
					String marker = "";
					String myFlag = "";
					StringBuffer myRow = null;
					String chk = "";
					String TableTyp = "";
					//var for ofac status
					//var for Warning status
					String chkOfac = "";
					String chkWarn = "";
					int compar = 0;
					int indexRow = 0;
					while (true) {

						msgList = (EWD0308DSMessage) newmessage;

						marker = msgList.getSWDOPE();
						compar = Integer.parseInt(msgList.getSWDREC());
						
						if (firstTime) {
						firstTime = false;
						beanList.setFirstRec(
						Integer.parseInt(msgList.getSWDREC()));
									
						} 
						if (marker.equals("*")) {
						beanList.setShowNext(false);
						break;
						} else {
							
							myRow = new StringBuffer("<TR>");
							if(msgList.getSWDISIOPE().trim().equals("")){
							myRow.append("<TD NOWRAP  ALIGN=RIGHT><input type=\"radio\" name=\"index\" value=\""
								+ msgList.getSWDIIC()
								+ "\" "
								+ chk
								+ " onclick=\"getParams('"
								+ msgList.getSWDIIC()
								+ "')\"></TD>");
							} else
							{
							 myRow.append("<TD NOWRAP  ALIGN=RIGHT><img src=\"../images/maintenance.gif\" title=\"Pending\" align=\"absmiddle\" border=\"0\" ><input type=\"radio\" name=\"index\" value=\""
								+ msgList.getSWDIIC()
								+ "\" "
								+ chk
								+ " onclick=\"getParams('"
								+ msgList.getSWDIIC()
								+ "')\"></TD>");	
							}	

							myRow.append("<TD NOWRAP  ALIGN=CENTER><A HREF=\"javascript:showInstrumentInq('" + msgList.getSWDIIC() + "')\">" 
										+ msgList.getSWDIIC() 
										+ "</A></TD>");
							myRow.append("<TD NOWRAP  ALIGN=LEFT><A HREF=\"javascript:showInstrumentInq('" + msgList.getSWDIIC() + "')\">"
									   + msgList.getSWDDSC() + "</td>");
							myRow.append("<TD NOWRAP  ALIGN=CENTER><A HREF=\"javascript:showInstrumentInq('" + msgList.getSWDIIC() + "')\">"
									 + msgList.getSWDPTY() + "</A></TD>");
							myRow.append("<TD NOWRAP  ALIGN=CENTER><A HREF=\"javascript:showInstrumentInq('" + msgList.getSWDIIC() + "')\">"
									 + msgList.getSWDCCY() + "</A></TD>");
							myRow.append("<TD NOWRAP  ALIGN=CENTER><A HREF=\"javascript:showInstrumentInq('" + msgList.getSWDIIC() + "')\">"
									 + msgList.getSWDSYM() + "</A></TD>");
							myRow.append("<TD NOWRAP  ALIGN=CENTER><A HREF=\"javascript:showInstrumentInq('" + msgList.getSWDIIC() + "')\">"
									 + msgList.getSWDNUM() + "</A></TD>");							
							myRow.append("<TD NOWRAP  ALIGN=CENTER><A HREF=\"javascript:showInstrumentInq('" + msgList.getSWDIIC() + "')\">"
									 + msgList.getSWDCUS() + "</A></TD>");
							myRow.append("<TD NOWRAP  ALIGN=CENTER><A HREF=\"javascript:showInstrumentInq('" + msgList.getSWDIIC() + "')\">"
								     + msgList.getSWDSDS() + "</A></TD>");
							
							myRow.append("<TD NOWRAP  ALIGN=CENTER><A HREF=\"javascript:showInstrumentInq('" + msgList.getSWDIIC() + "')\">"
							         + Util.formatDate(msgList.getSWDSD1(),msgList.getSWDSD2(),msgList.getSWDSD3()) + "</A></td>");														
							myRow.append("</TR>");
							
							userPO.setHeader8(msgList.getSWDREC());
							 compar = Integer.parseInt(msgList.getSWDREC());
							
							beanList.addRow(myFlag, myRow.toString());
							indexRow++;
							
							if (marker.equals("+")) {
								beanList.setShowNext(true);
								break;
							}
						}
						newmessage = mc.receiveMessage();
					}

					flexLog("Putting java beans into the session");
					ses.setAttribute("EWD0308Help", beanList);
					ses.setAttribute("userPO", userPO);

					try {
						flexLog("About to call Page: " + LangPath + "EWD0308SP_sel_instruments.jsp");
						callPage(LangPath + "EWD0308SP_sel_instruments.jsp", req, res);
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}

				} else
					flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}

	private void procReqEnterSearch(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		try {
			flexLog("About to call Page: " + LangPath + "EIE0220_inv_split.jsp");
			//callPage(LangPath + "EIE0220_inv_enter_inst.jsp", req, res);
			callPage(LangPath + "EIE0220_inv_split.jsp", req, res);
		} catch (Exception e) {
			flexLog("Exception calling page " + e);
		}

	}
	private void procActionPos(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		int inptOPT = 0;

		inptOPT = Integer.parseInt(req.getParameter("opt"));

		String CODE = req.getParameter("CODE");

				
		switch (inptOPT) {
			case 2 : //Split
			    res.sendRedirect(super.srctx + 
					"/servlet/datapro.eibs.invest.JSEIE0220?SCREEN=400" + "&CODE=" + CODE );
				break;
				
			default :
				res.sendRedirect(super.srctx + 
					"/servlet/datapro.eibs.invest.JSEIE0220?SCREEN=400" + "&CODE=" + CODE);
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
					flexLog("Opennig Socket Connection");
					mc = new MessageContext(super.getMessageHandler("EWD0308", req));
				

				try {
					screen = Integer.parseInt(req.getParameter("SCREEN"));
				} catch (Exception e) {
					flexLog("Screen set to default value");
				}

				switch (screen) {
					// Requests
					case R_LIST :
						procReqList(mc, msgUser, req, res, session);
						break;
					case R_ENTER_LIST :
						procReqEnterSearch(mc, msgUser, req, res, session);
						break;
						// Actions
					case A_LIST :
						procActionPos(mc, msgUser, req, res, session);
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
	private void showERROR(ELEERRMessage m) {
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