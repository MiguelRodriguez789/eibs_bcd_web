package datapro.eibs.misc; 

/**
 * Insert the type's description here.
 * Creation date: (8/9/09 11:46:12 AM)
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

public class JSECL0180 extends datapro.eibs.master.SuperServlet {

	protected static final int R_STATEMENT_REISSUE	= 1;
	protected static final int A_STATEMENT_REISSUE	= 2;
	
	protected String LangPath = "S";

	/**
	 * JSECL0180 constructor comment.
	 */
	public JSECL0180() {
		super();
	}
	/**
	 * This method was created by Gustavo Adolfo Villarroel.
	 */
	public void destroy() {

		flexLog("free resources used by JSECL0180");

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
	protected void procReqStatementReissue(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
		
		UserPos userPO = null;
		
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		ses.setAttribute("userPO", userPO);
		
		try { 
			flexLog("About to call Page: " + LangPath + "ECL0180_account_st_enter.jsp");
			callPage(LangPath + "ECL0180_account_st_enter.jsp", req, res);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}

	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procActionStatementReissue(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		ELEERRMessage msgError = null;
		ECL018001Message msgST = null;
		ECL018002Message msgDetail = null;
		JBList beanList = null;
		UserPos userPO = null;
		boolean IsNotError = true;
		String opecode = "";

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		
		// Send Initial data
		try {
			flexLog("Send Initial Data");
			msgST = (ECL018001Message) mc.getMessageRecord("ECL018001");
			msgST.setH01USERID(user.getH01USR());
			msgST.setH01PROGRM("ECL0180");
			msgST.setH01TIMSYS(getTimeStamp());
			msgST.setH01SCRCOD("01");
			msgST.setH01OPECOD("0004");

			// all the fields here
			java.util.Enumeration enu = msgST.fieldEnumeration();
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
			
			msgST.send();
			msgST.destroy();
			flexLog("ECL018001 Message Sent");
		
			// Receive Error Message
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage)newmessage;
				IsNotError = msgError.getERRNUM().equals("0");
				flexLog("IsNotError = " + IsNotError);
				showERROR(msgError);
			}
			
			ses.setAttribute("error", msgError);

			// Receive Data Message
			newmessage = mc.receiveMessage();
			
			if (newmessage.getFormatName().equals("ECL018001")) {

				try {
					msgST = new datapro.eibs.beans.ECL018001Message();
				} catch (Exception ex) {
					flexLog("ECL018001 Error: " + ex);
				}
	
				msgST = (ECL018001Message) newmessage;
				flexLog("ECL018001 Message Received");

				flexLog("Putting java beans into the session");
				ses.setAttribute("stBalances", msgST);
				
				if (IsNotError) {
					newmessage = mc.receiveMessage();
					
					try {
						beanList = new datapro.eibs.beans.JBList();
					} catch (Exception ex) {
						flexLog("ECL018002 Error: " + ex);
					}
		
					boolean firstTime = true;
					String marker = "";
					String myFlag = "";
					StringBuffer myRow = null;
					String chk = "";
					String grpData = "";
					String grpDate = "";
					String acnu = "";
					String checkgraph = "";
		
					String strDebit = "";
					String strCredit = "";
					String chknum = "";
					String DT1 = "";
					String DT2 = "";
					String DT3 = "";
					java.math.BigDecimal debit = new java.math.BigDecimal("0");
					java.math.BigDecimal credit = new java.math.BigDecimal("0");
					int row = 0;
					while (true) {
		
						msgDetail = (ECL018002Message) newmessage;
		
						marker = msgDetail.getE02STMEND();
		
						if (marker.equals("*")) {
							beanList.setShowNext(false);
							break;
						} else {
							if (firstTime) {
								firstTime = false;
								grpData = msgDetail.getE02STMEBL();
								grpDate =
									Util.formatCustomDate(user.getE01DTF(),
										msgDetail.getE02STMBDM(),
										msgDetail.getE02STMBDD(),
										msgDetail.getE02STMBDY());
								chk = "checked";
							} else {
								chk = "";
								grpData =
									grpData + "|" + msgDetail.getE02STMEBL();
								grpDate =
									grpDate
										+ "|"
										+ Util.formatCustomDate(user.getE01DTF(),
											msgDetail.getE02STMBDM(),
											msgDetail.getE02STMBDD(),
											msgDetail.getE02STMBDY());
		
							}
		
							if (msgDetail.getE02STMDCC().equals("0")) {
								debit =
									debit.add(msgDetail.getBigDecimalE02STMAMT());
								strDebit =
									Util.fcolorCCY(msgDetail.getE02STMAMT());
								strCredit = "&nbsp;";
							} else if (msgDetail.getE02STMDCC().equals("5")) {
								credit =
									credit.add(
										msgDetail.getBigDecimalE02STMAMT());
								strDebit = "&nbsp;";
								strCredit =
									Util.fcolorCCY(msgDetail.getE02STMAMT());
							}
		
							DT1 =
								(userPO.getHeader8().equals("B"))
									? msgDetail.getE02STMBDM()
									: msgDetail.getE02STMBDM();
							DT2 =
								(userPO.getHeader8().equals("B"))
									? msgDetail.getE02STMBDD()
									: msgDetail.getE02STMBDD();
							DT3 =
								(userPO.getHeader8().equals("B"))
									? msgDetail.getE02STMBDY()
									: msgDetail.getE02STMBDY();
		
							try {
								chknum =
									Util.addLeftChar(
										'0',
										6,
										msgDetail.getE02STMCKN());
								acnu =
									Util.addLeftChar(
										'0',
										9,
										msgDetail.getE02STMACC());
							} catch (Exception e) {
								flexLog("Exception calling page " + e);
							}
		
							if (chknum.equals("0")) {
								checkgraph = " ";
							} else {
		
								checkgraph =
									"<A HREF=\"javascript:showICheck('"
										+ acnu
										+ "','"
										+ chknum
										+ "','"
										+ msgDetail.getE02STMBDM()
										+ "','"
										+ msgDetail.getE02STMBDD()
										+ "','"
										+ msgDetail.getE02STMBDY()
										+ "','"
										+ msgDetail.getE02STMAMT()
										+ "','"
										+ row
										+ "')\">"
										+ chknum
										+ "</A>";
							}
		
							myRow = new StringBuffer("<TR>");
							if (userPO.getHeader8().equals("B")) {
								myRow.append(
									"<TD NOWRAP ALIGN=\"CENTER\">"
										+ Util.formatCustomDate(user.getE01DTF(),
											msgDetail.getE02STMBDM(),
											msgDetail.getE02STMBDD(),
											msgDetail.getE02STMBDY())
										+ "</TD>");
							} else {
								myRow.append(
									"<TD NOWRAP ALIGN=\"CENTER\">"
										+ Util.formatCustomDate(user.getE01DTF(),
											msgDetail.getE02STMVDM(),
											msgDetail.getE02STMVDD(),
											msgDetail.getE02STMVDY())
										+ "</TD>");
							}
							myRow.append(
								"<TD NOWRAP ALIGN=\"CENTER\">"
									+ Util.formatCustomDate( user.getE01DTF(),
										msgDetail.getE02STMBDM(),
										msgDetail.getE02STMBDD(),
										msgDetail.getE02STMBDY())
									+ "</TD>");
		
							if (msgDetail.getE02STMCDE().equals("CK")
								|| msgDetail.getE02STMCDE().equals("K1")
								|| msgDetail.getE02STMCDE().equals("K5")) {
								myRow.append(
									"<TD NOWRAP ALIGN=\"RIGHT\">"
										+ checkgraph
										+ "</TD>");
							} else {
								myRow.append(
									"<TD NOWRAP ALIGN=\"RIGHT\">"
										+ msgDetail.getH02FLGWK3()
										+ " - "
										+ msgDetail.getE02STMCKN()
										+ "</TD>");
							}
		
							if (msgDetail.getE02STMCDE().equalsIgnoreCase("CK")
								|| msgDetail.getE02STMCDE().equalsIgnoreCase("OF")
								|| msgDetail.getE02STMCDE().equalsIgnoreCase(
									"DP")) {
								myRow.append(
									"<TD NOWRAP ALIGN=\"CENTER\">"
										+ checkgraph
										+ "</TD>");
							} else {
								myRow.append(
									"<TD NOWRAP ALIGN=\"CENTER\">"
										+ Util.formatCell(msgDetail.getE02STMCDE())
										+ "</TD>");
							}
							if (msgDetail.getE02STMDRR().equals("0")) {
								myRow.append(
									"<TD NOWRAP>"
										+ Util.formatCell(msgDetail.getE02STMNAR())
										+ "</TD>");
							} else {
								myRow.append(
									"<TD NOWRAP>"
										+ Util.formatCell(msgDetail.getE02STMNAR())
										+ "</TD>");
							}
		
							myRow.append(
								"<TD NOWRAP ALIGN=RIGHT>" + strDebit + "</TD>");
							myRow.append(
								"<TD NOWRAP ALIGN=RIGHT>"
									+ strCredit
									+ "</TD>");
							myRow.append(
								"<TD NOWRAP ALIGN=RIGHT>"
									+ Util.fcolorCCY(msgDetail.getE02STMEBL())
									+ "</TD>");
							if (userPO.getHeader8().equals("V")) {
								myRow.append(
									"<TD NOWRAP ALIGN=\"CENTER\">"
										+ Util.formatCustomDate( user.getE01DTF(),
											msgDetail.getE02STMVDM(),
											msgDetail.getE02STMVDD(),
											msgDetail.getE02STMVDY())
										+ "</TD>");
							} else {
								myRow.append(
									"<TD NOWRAP ALIGN=CENTER>"
										+ Util.formatCustomDate( user.getE01DTF(),
											msgDetail.getE02STMBDM(),
											msgDetail.getE02STMBDD(),
											msgDetail.getE02STMBDY())
										+ "</TD>");
							}
							myRow.append(
								"<TD NOWRAP>"
									+ Util.formatCell(msgDetail.getE02STMUSR())
									+ "</TD>");
							myRow.append("</TR>");
							beanList.addRow(myFlag, myRow.toString());
							row++;
							if (marker.equals("+")) {
								beanList.setShowNext(true);
								break;
							}
						}
		
						newmessage = mc.receiveMessage();
					}
		
					userPO.setHeader19(Util.fcolorCCY(debit.toString()));
					userPO.setHeader20(Util.fcolorCCY(credit.toString()));
					userPO.setHeader21(grpData);
					userPO.setHeader22(grpDate);
		
					flexLog("Putting java beans into the session");
					ses.setAttribute("cifList", beanList);
				}
			}	
			
			if (IsNotError) {
				try {
					flexLog("About to call Page: " + LangPath + "ECL0180_account_st.jsp");
					callPage(LangPath + "ECL0180_account_st.jsp", req, res);						
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			}
			else {
				try {
					flexLog("About to call Page: " + LangPath + "ECL0180_account_st_enter.jsp");
					callPage(LangPath + "ECL0180_account_st_enter.jsp", req, res);						
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

			int screen = R_STATEMENT_REISSUE;

			try {

				msgUser =
					(datapro.eibs.beans.ESS0030DSMessage) session.getAttribute(
						"currUser");

				// Here we should get the path from the user profile
				LangPath = super.rootPath + msgUser.getE01LAN() + "/";

				try {
					flexLog("Opening Socket Connection");
					mc = new MessageContext(getMessageHandler("ECL0110", req));

					try {
						screen = Integer.parseInt(req.getParameter("SCREEN"));
					} catch (Exception e) {
						flexLog("Screen set to default value");
					}

					switch (screen) {
						case R_STATEMENT_REISSUE :
							procReqStatementReissue(mc, msgUser, req, res, session);
							break;	
						case A_STATEMENT_REISSUE :							
							procActionStatementReissue(mc, msgUser, req, res, session);
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