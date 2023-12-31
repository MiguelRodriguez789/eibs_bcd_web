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

public class JSEWD0315A extends datapro.eibs.master.SuperServlet {

	// Limits Inquiry
	protected static final int R_LIST   = 1;
	protected static final int A_LIST   = 2;
	protected static final int R_I_LIST = 3;
	protected static final int R_ENTER_LIST 	  = 100;
	protected static final int R_ENTER_ADV_LIST = 300;
	protected static final int R_I_ENTER_LIST   = 500;
	protected String LangPath = "S";

	/**
	 * JSECLI001 constructor comment.
	 */
	public JSEWD0315A() {
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
	protected void procReqList(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EWD0315DSMessage msgList = null;
		ELEERRMessage msgError = null;
		JBList beanList = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		try {
			msgError = new ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send Initial data
		try {
			msgList = (EWD0315DSMessage) mc.getMessageRecord("EWD0315DS");
			
			try { //From Pos
					
				msgList.setRWDFRC(req.getParameter("Pos"));
				
			} catch (Exception e) {
				
			}
			
			msgList.setRWDTYP("2");
			
			msgList.send();
			msgList.destroy();
			flexLog("EWD0315DS Message Sent");
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
					msgError = new ELEERRMessage();
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

				res.sendRedirect(super.srctx + "/servlet/datapro.eibs.invest.JSEWD0315A?SCREEN=100");

			} else
				if (newmessage.getFormatName().equals("EWD0315DS")) {

					try {
						beanList = new JBList();
					} catch (Exception ex) {
						flexLog("Error: " + ex);
					}

					boolean firstTime;
					String marker = "";
					String myFlag = "";
					StringBuffer myRow = null;
					String chk = "";
					String TableTyp = "";
					//var for ofac status
					//var for Warning status
					String chkOfac = "";
					String chkWarn = "";
					
					int indexRow = 0;
					while (true) {

						msgList = (EWD0315DSMessage) newmessage;

						marker = msgList.getSWDOPE();

						if (marker.equals("*")) {
							beanList.setShowNext(false);
							 userPO.setHeader10(msgList.getSWDFR1());	    //From Date
							 userPO.setHeader11(msgList.getSWDFR2());
							 userPO.setHeader12(msgList.getSWDFR3());
							 userPO.setHeader13(msgList.getSWDTO1());	    //To Date
							 userPO.setHeader14(msgList.getSWDTO2());
							 userPO.setHeader15(msgList.getSWDTO3());
							 userPO.setHeader16(msgList.getSWDREC());
							 userPO.setHeader20(Util.fcolorCCY(msgList.getSWDAMT())); //Total Projected Amount
							 userPO.setHeader21(Util.fcolorCCY(msgList.getSWDCOM())); //Total Commission Amount
							 userPO.setHeader22(Util.fcolorCCY(msgList.getSWDPAM())); //Total Pay Amount
							 
							break;
						} else {
							
							
							
														
							myRow = new StringBuffer("<TR>");
							myRow.append("<TD NOWRAP  ALIGN=CENTER><input type=\"radio\" name=\"index\" value=\""
								+ msgList.getSWDIIC()
								+ "\" "
								+ chk
								+ " onclick=\"getParams('"
								+ msgList.getSWDIIC()
								+ "', '"
								+ msgList.getSWDNUM()
								+ "', '"
								+ " "
								+ "', '"
								+ msgList.getSWDCNM()
								+ "', '"
								+ msgList.getSWDTYP()
								+ "', '"
								+ msgList.getSWDPM1()
								+ "', '"
								+ msgList.getSWDPM2()
								+ "', '"
								+ msgList.getSWDPM3()
								+ "', '"
								+ msgList.getSWDCUC()
								+ "', '"
								+ msgList.getSWDCUN()
								+ "', '"
								+ msgList.getSWDDAM()
								+ "', '"
								+ msgList.getSWDCOM()
								+ "', '"
								+ msgList.getSWDAMT()
								+ "', '"
								+ msgList.getSWDPAM()
								+ "', '"
								+ msgList.getSWDRCD()
								+ "')\"></TD>");
								
							    myRow.append("<TD NOWRAP  ALIGN=CENTER><A HREF=\"javascript:showInqApprovalCoupon('"
								+ msgList.getSWDIIC()
								+ "', '"
								+ msgList.getSWDNUM()
								+ "', '"
								+ ""
								+ "', '"
								+ msgList.getSWDCNM()
								+ "', '"
								+ msgList.getSWDTYP()
								+ "', '"
								+ msgList.getSWDPM1()
								+ "', '"
								+ msgList.getSWDPM2()
								+ "', '"
								+ msgList.getSWDPM3()
								+ "', '"
								+ msgList.getSWDCUC()
								+ "', '"
								+ msgList.getSWDCUN()
								+ "', '"
								+ msgList.getSWDDAM()
								+ "', '"
								+ msgList.getSWDCOM()
								+ "', '"
								+ msgList.getSWDAMT()
								+ "', '"
								+ msgList.getSWDPAM()
								+ "', '"
								+ msgList.getSWDRCD()
								+ "')\">" 
								+  msgList.getSWDIDS() 
								+"</A></td>");
								
									
							myRow.append("<TD NOWRAP  ALIGN=CENTER><A HREF=\"javascript:showInqApprovalCoupon('"
								+ msgList.getSWDIIC()
								+ "', '"
								+ msgList.getSWDNUM()
								+ "', '"
								+ ""
								+ "', '"
								+ msgList.getSWDCNM()
								+ "', '"
								+ msgList.getSWDTYP()
								+ "', '"
								+ msgList.getSWDPM1()
								+ "', '"
								+ msgList.getSWDPM2()
								+ "', '"
								+ msgList.getSWDPM3()
								+ "', '"
								+ msgList.getSWDCUC()
								+ "', '"
								+ msgList.getSWDCUN()
								+ "', '"
								+ msgList.getSWDDAM()
								+ "', '"
								+ msgList.getSWDCOM()
								+ "', '"
								+ msgList.getSWDAMT()
								+ "', '"
								+ msgList.getSWDPAM()
								+ "', '"
								+ msgList.getSWDRCD()
								+ "')\">" 
							      + msgList.getSWDCCY()
							      + "</A></td>");
							
							
							myRow.append("<TD NOWRAP  ALIGN=CENTER><A HREF=\"javascript:showInqApprovalCoupon('"
								+ msgList.getSWDIIC()
								+ "', '"
								+ msgList.getSWDNUM()
								+ "', '"
								+ ""
								+ "', '"
								+ msgList.getSWDCNM()
								+ "', '"
								+ msgList.getSWDTYP()
								+ "', '"
								+ msgList.getSWDPM1()
								+ "', '"
								+ msgList.getSWDPM2()
								+ "', '"
								+ msgList.getSWDPM3()
								+ "', '"
								+ msgList.getSWDCUC()
								+ "', '"
								+ msgList.getSWDCUN()
								+ "', '"
								+ msgList.getSWDDAM()
								+ "', '"
								+ msgList.getSWDCOM()
								+ "', '"
								+ msgList.getSWDAMT()
								+ "', '"
								+ msgList.getSWDPAM()
								+ "', '"
								+ msgList.getSWDRCD()
								+ "')\">" 
							      + msgList.getSWDISI() 
							      + "</A></td>");
							      
							      
							      
							myRow.append("<TD NOWRAP  ALIGN=CENTER><A HREF=\"javascript:showInqApprovalCoupon('"
								+ msgList.getSWDIIC()
								+ "', '"
								+ msgList.getSWDNUM()
								+ "', '"
								+ ""
								+ "', '"
								+ msgList.getSWDCNM()
								+ "', '"
								+ msgList.getSWDTYP()
								+ "', '"
								+ msgList.getSWDPM1()
								+ "', '"
								+ msgList.getSWDPM2()
								+ "', '"
								+ msgList.getSWDPM3()
								+ "', '"
								+ msgList.getSWDCUC()
								+ "', '"
								+ msgList.getSWDCUN()
								+ "', '"
								+ msgList.getSWDDAM()
								+ "', '"
								+ msgList.getSWDCOM()
								+ "', '"
								+ msgList.getSWDAMT()
								+ "', '"
								+ msgList.getSWDPAM()
								+ "', '"
								+ msgList.getSWDRCD()
								+ "')\">" 
								  + msgList.getSWDNME()
								  + "</A></td>");
								  
								  
								  
							myRow.append("<TD NOWRAP  ALIGN=CENTER><A HREF=\"javascript:showInqApprovalCoupon('"
								+ msgList.getSWDIIC()
								+ "', '"
								+ msgList.getSWDNUM()
								+ "', '"
								+ ""
								+ "', '"
								+ msgList.getSWDCNM()
								+ "', '"
								+ msgList.getSWDTYP()
								+ "', '"
								+ msgList.getSWDPM1()
								+ "', '"
								+ msgList.getSWDPM2()
								+ "', '"
								+ msgList.getSWDPM3()
								+ "', '"
								+ msgList.getSWDCUC()
								+ "', '"
								+ msgList.getSWDCUN()
								+ "', '"
								+ msgList.getSWDDAM()
								+ "', '"
								+ msgList.getSWDCOM()
								+ "', '"
								+ msgList.getSWDAMT()
								+ "', '"
								+ msgList.getSWDPAM()
								+ "', '"
								+ msgList.getSWDRCD()
								+ "')\">" 
								  + msgList.getSWDCNM() 
								  + "</A></td>");
								  
								  
								  
							myRow.append("<TD NOWRAP  ALIGN=CENTER><A HREF=\"javascript:showInqApprovalCoupon('"
								+ msgList.getSWDIIC()
								+ "', '"
								+ msgList.getSWDNUM()
								+ "', '"
								+ ""
								+ "', '"
								+ msgList.getSWDCNM()
								+ "', '"
								+ msgList.getSWDTYP()
								+ "', '"
								+ msgList.getSWDPM1()
								+ "', '"
								+ msgList.getSWDPM2()
								+ "', '"
								+ msgList.getSWDPM3()
								+ "', '"
								+ msgList.getSWDCUC()
								+ "', '"
								+ msgList.getSWDCUN()
								+ "', '"
								+ msgList.getSWDDAM()
								+ "', '"
								+ msgList.getSWDCOM()
								+ "', '"
								+ msgList.getSWDAMT()
								+ "', '"
								+ msgList.getSWDPAM()
								+ "', '"
								+ msgList.getSWDRCD()
								+ "')\">" 
								  + msgList.getSWDPDS() 
								  + "</A></td>");
								  
								  
							myRow.append("<TD NOWRAP  ALIGN=CENTER><A HREF=\"javascript:showInqApprovalCoupon('"
								+ msgList.getSWDIIC()
								+ "', '"
								+ msgList.getSWDNUM()
								+ "', '"
								+ ""
								+ "', '"
								+ msgList.getSWDCNM()
								+ "', '"
								+ msgList.getSWDTYP()
								+ "', '"
								+ msgList.getSWDPM1()
								+ "', '"
								+ msgList.getSWDPM2()
								+ "', '"
								+ msgList.getSWDPM3()
								+ "', '"
								+ msgList.getSWDCUC()
								+ "', '"
								+ msgList.getSWDCUN()
								+ "', '"
								+ msgList.getSWDDAM()
								+ "', '"
								+ msgList.getSWDCOM()
								+ "', '"
								+ msgList.getSWDAMT()
								+ "', '"
								+ msgList.getSWDPAM()
								+ "', '"
								+ msgList.getSWDRCD()
								+ "')\">"
								  + Util.formatDate(msgList.getSWDPM1(),msgList.getSWDPM2(),msgList.getSWDPM3()) 
								  + "</A></td>");
								  
								  														
							myRow.append("<TD NOWRAP  ALIGN=CENTER><A HREF=\"javascript:showInqApprovalCoupon('"
								+ msgList.getSWDIIC()
								+ "', '"
								+ msgList.getSWDNUM()
								+ "', '"
								+ ""
								+ "', '"
								+ msgList.getSWDCNM()
								+ "', '"
								+ msgList.getSWDTYP()
								+ "', '"
								+ msgList.getSWDPM1()
								+ "', '"
								+ msgList.getSWDPM2()
								+ "', '"
								+ msgList.getSWDPM3()
								+ "', '"
								+ msgList.getSWDCUC()
								+ "', '"
								+ msgList.getSWDCUN()
								+ "', '"
								+ msgList.getSWDDAM()
								+ "', '"
								+ msgList.getSWDCOM()
								+ "', '"
								+ msgList.getSWDAMT()
								+ "', '"
								+ msgList.getSWDPAM()
								+ "', '"
								+ msgList.getSWDRCD()
								+ "')\">" 
								  + Util.fcolorCCY(msgList.getSWDDAM())
								  + "</A></td>");
								  
								  
							myRow.append("<TD NOWRAP  ALIGN=CENTER><A HREF=\"javascript:showInqApprovalCoupon('"
								+ msgList.getSWDIIC()
								+ "', '"
								+ msgList.getSWDNUM()
								+ "', '"
								+ ""
								+ "', '"
								+ msgList.getSWDCNM()
								+ "', '"
								+ msgList.getSWDTYP()
								+ "', '"
								+ msgList.getSWDPM1()
								+ "', '"
								+ msgList.getSWDPM2()
								+ "', '"
								+ msgList.getSWDPM3()
								+ "', '"
								+ msgList.getSWDCUC()
								+ "', '"
								+ msgList.getSWDCUN()
								+ "', '"
								+ msgList.getSWDDAM()
								+ "', '"
								+ msgList.getSWDCOM()
								+ "', '"
								+ msgList.getSWDAMT()
								+ "', '"
								+ msgList.getSWDPAM()
								+ "', '"
								+ msgList.getSWDRCD()
								+ "')\">" 
							      + Util.fcolorCCY(msgList.getSWDCOM()) 
							      + "</A></td>");
							      					      
							      
							myRow.append("<TD NOWRAP  ALIGN=CENTER><A HREF=\"javascript:showInqApprovalCoupon('"
								+ msgList.getSWDIIC()
								+ "', '"
								+ msgList.getSWDNUM()
								+ "', '"
								+ ""
								+ "', '"
								+ msgList.getSWDCNM()
								+ "', '"
								+ msgList.getSWDTYP()
								+ "', '"
								+ msgList.getSWDPM1()
								+ "', '"
								+ msgList.getSWDPM2()
								+ "', '"
								+ msgList.getSWDPM3()
								+ "', '"
								+ msgList.getSWDCUC()
								+ "', '"
								+ msgList.getSWDCUN()
								+ "', '"
								+ msgList.getSWDDAM()
								+ "', '"
								+ msgList.getSWDCOM()
								+ "', '"
								+ msgList.getSWDAMT()
								+ "', '"
								+ msgList.getSWDPAM()
								+ "', '"
								+ msgList.getSWDRCD()
								+ "')\">" 
								  + msgList.getSWDADS() 
								  + "</A></td>");
								  
								  
							myRow.append("</TR>");


							 userPO.setIdentifier(msgList.getSWDIIC());     //Internal Instrument Code
							 userPO.setHeader1(msgList.getSWDIDS());	    //Instrument Description
							 userPO.setHeader2(msgList.getSWDCCY());	    //Instrument Currency
							 userPO.setHeader3(msgList.getSWDISI());	    //Instrument ISIN

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
					ses.setAttribute("EWD0315Help", beanList);
					ses.setAttribute("userPO", userPO);

					try {
						flexLog("About to call Page: " + LangPath + "EWD0315A_app_list.jsp");
						callPage(LangPath + "EWD0315A_app_list.jsp", req, res);
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

	protected void procReqEnterSearch(MessageContext mc, ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession ses)
		throws ServletException, IOException {

		try {
			flexLog("About to call Page: " + LangPath + "EIE0210_inv_enter_coupon.jsp");
			callPage(LangPath + "EIE0210_inv_enter_coupon.jsp", req, res);
		} catch (Exception e) {
			flexLog("Exception calling page " + e);
		}

	}

	protected void procActionPos(
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

		String CODE     = req.getParameter("CODE");
		String ORDERNUM = req.getParameter("ORDERNUM");
		String CUSTOMER = "";
		String CUSTODIAN = "";
		String PAYTYPE = req.getParameter("PAYTYPE");
		String PDATE1 = req.getParameter("PDATE1");
		String PDATE2 = req.getParameter("PDATE2");
		String PDATE3 = req.getParameter("PDATE3");
		String CUSTODIANCOD = req.getParameter("CUSTODIANCOD");
		String CUSTOMERCOD = req.getParameter("CUSTOMERCOD");
		String DELAMOUNT = req.getParameter("DELAMOUNT");
		String COMAMOUNT = req.getParameter("COMAMOUNT");
		String PROJAMOUNT = req.getParameter("PROJAMOUNT");
		String PAIDAMOUNT = req.getParameter("PAIDAMOUNT");
		String RCD = req.getParameter("RCD");
		String ACTION = req.getParameter("ACTION");
				
		switch (inptOPT) {
			
			
			case 2 : //Inquiry
			    res.sendRedirect(super.srctx + 
					"/servlet/datapro.eibs.invest.JSEIE0210A?SCREEN=400" + "&CODE=" + CODE
					+ "&ORDERNUM=" + ORDERNUM + "&CUSTOMER=" + CUSTOMER + "&CUSTODIAN=" + CUSTODIAN
					+ "&PAYTYPE=" + PAYTYPE + "&PDATE1=" + PDATE1 + "&PDATE2=" + PDATE2 + "&PDATE3=" + PDATE3
					+ "&CUSTODIANCOD=" + CUSTODIANCOD + "&CUSTOMERCOD=" + CUSTOMERCOD
					+ "&DELAMOUNT=" + DELAMOUNT + "&COMAMOUNT=" + COMAMOUNT 
					+ "&PROJAMOUNT=" + PROJAMOUNT + "&PAIDAMOUNT=" + PAIDAMOUNT
					+ "&RCD=" + RCD);
				break;
			case 3 : //Action
			    res.sendRedirect(super.srctx + 
					"/servlet/datapro.eibs.invest.JSEIE0210A?SCREEN=600" + "&CODE=" + CODE
					+ "&ORDERNUM=" + ORDERNUM + "&CUSTOMER=" + CUSTOMER + "&CUSTODIAN=" + CUSTODIAN
					+ "&PAYTYPE=" + PAYTYPE + "&PDATE1=" + PDATE1 + "&PDATE2=" + PDATE2 + "&PDATE3=" + PDATE3
					+ "&CUSTODIANCOD=" + CUSTODIANCOD + "&CUSTOMERCOD=" + CUSTOMERCOD
					+ "&DELAMOUNT=" + DELAMOUNT + "&COMAMOUNT=" + COMAMOUNT 
					+ "&PROJAMOUNT=" + PROJAMOUNT + "&PAIDAMOUNT=" + PAIDAMOUNT
					+ "&RCD=" + RCD + "&ACTION=" + ACTION);
				break;
			default :
				res.sendRedirect(super.srctx + 
					"/servlet/datapro.eibs.invest.JSEWD0315?SCREEN=100");
		}
	}

	/**
 * This method was created in VisualAge.
 */
protected void procReqPassword(HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

	UserPos	userPO = null;

	try {
		//mod emat 01/24/2002
		//send draft parameter
		String typCode ="";
		flexLog("typCode: " + req.getParameter("typCode"));
		if (req.getParameter("typCode") != null) {
			typCode = req.getParameter("typCode");
		}

		userPO = (datapro.eibs.beans.UserPos)ses.getAttribute("userPO");
		userPO.setRedirect("/servlet/datapro.eibs.invest.JSEWD0315A?SCREEN=1");
		ses.setAttribute("userPO", userPO);
		res.sendRedirect(super.srctx + "/servlet/datapro.eibs.menu.JSESS0030?SCREEN=7");

	}
	catch (Exception e)	{
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
					flexLog("Opennig Socket Connection");
					mc = new MessageContext(super.getMessageHandler("EWD0315", req));
				

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
					return;
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