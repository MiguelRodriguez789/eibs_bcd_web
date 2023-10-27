package datapro.eibs.misc; 

/**
 * Insert the type's description here.
 * Creation date: (30/11/09 05:39:13 PM)
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

public class JSECL0130 extends datapro.eibs.master.SuperServlet {

	protected static final int R_ENTER_INQUIRY	= 1;
	protected static final int A_ENTER_INQUIRY	= 2;
	protected static final int R_STATEMENT		= 3;
	protected static final int A_STATEMENT		= 4;
	protected static final int R_STATEMENT_LIST	= 5;
	
	protected String LangPath = "S";

	/**
	 * JSECL0130 constructor comment.
	 */
	public JSECL0130() {
		super();
	}
	/**
	 * This method was created by Gustavo Adolfo Villarroel.
	 */
	public void destroy() {

		flexLog("free resources used by JSECL0130");

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
	protected void procReqEnterInquiry(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
	
		ELEERRMessage msgError = null;
		UserPos userPO = null;
	
		try {
	
			msgError = new datapro.eibs.beans.ELEERRMessage();
			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO.setOption("");
			userPO.setPurpose("INQUIRY");
			userPO.setRedirect("/servlet/datapro.eibs.misc.JSECL0130?SCREEN=2");
			userPO.setProdCode("RT");
			
			ses.setAttribute("error", msgError);
			ses.setAttribute("userPO", userPO);
			
	
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}
	
		try {
			flexLog("About to call Page: " + LangPath + "ECL0130_account_enter.jsp");
			callPage(LangPath + "ECL0130_account_enter.jsp", req, res);
		} catch (Exception e) {
			flexLog("Exception calling page " + e);
		}
	
	
	}
	/**
	 * This method was created in VisualAge.
	 * 
	 */
	protected void procActionEnterInquiry(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
	
		MessageRecord newmessage = null;
		EDD009001Message msgRT = null;
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
			msgRT = (EDD009001Message) mc.getMessageRecord("EDD009001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("ECL0130");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0002");
			try {
				msgRT.setE01CTACCC(req.getParameter("E01CTACCC"));
				msgRT.setE01ACMACC(msgRT.getE01CTACCC().substring(10));
			} catch (Exception e) {
				msgRT.setE01CTACCC("0");
			}
	
			msgRT.send();
			msgRT.destroy();
			flexLog("EDD009001 Message Sent");
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
	
			if (newmessage.getFormatName().equals("EDD009001")) {
				try {
					msgRT = new datapro.eibs.beans.EDD009001Message();
					flexLog("EDD009001 Message Received");
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}
	
				msgRT = (EDD009001Message) newmessage;
	
				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("rtBalances", msgRT);
	
				if (IsNotError) { // There are no errors
					userPO.setAccNum(msgRT.getE01ACMACC());
					userPO.setIdentifier(msgRT.getE01ACMACC());
					userPO.setBank(msgRT.getE01ACMBNK());
					//userPO.setCusNum(msgRT.getE01ACMCUN());
					userPO.setCusNum(msgRT.getE01ACMCUN());
					userPO.setProdCode(msgRT.getE01ACMPRO());
					//userPO.setHeader2(msgRT.getE01ACMCCY());
					userPO.setCurrency(msgRT.getE01ACMCCY());
					userPO.setCusName(msgRT.getE01CUSNA1());
					userPO.setOfficer(msgRT.getE01ACMOFC() + " - " + msgRT.getE01DSCOFC());
					userPO.setCusType(msgRT.getH01FLGWK3());
					userPO.setHeader10(msgRT.getE01ACMATY());
			   	 	userPO.setHeader11(msgRT.getE01ACMACL());

			   	 	ses.setAttribute("userPO", userPO);
	
					try {
						flexLog("About to call Page: " + LangPath + "ECL0130_account_inq_balances.jsp");
						callPage(LangPath + "ECL0130_account_inq_balances.jsp", req, res);
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
				} else { // There are errors
					try {
						flexLog("About to call Page: " + LangPath + "ECL0130_account_enter.jsp");
						callPage(LangPath + "ECL0130_account_enter.jsp", req, res);
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
	// END PDF
	
	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqST(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
	
		try {
			flexLog(
				"About to call Page: " + LangPath + "ECL0130_account_st_selection.jsp");
			callPage(LangPath + "ECL0130_account_st_selection.jsp", req, res);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}
	
	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procActionST(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
	
		UserPos userPO = null;
	
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
	
		userPO.setHeader7(req.getParameter("E01HISCYC"));
		userPO.setHeader8("B");
	
		try {
			userPO.setHeader9(req.getParameter("E01FRDTE1"));
			userPO.setHeader10(req.getParameter("E01FRDTE2"));
			userPO.setHeader11(req.getParameter("E01FRDTE3"));
		} catch (Exception e) {
			flexLog("DATE 1");
		}
		try {
			userPO.setHeader12(req.getParameter("E01TODTE1"));
			userPO.setHeader13(req.getParameter("E01TODTE2"));
			userPO.setHeader14(req.getParameter("E01TODTE3"));
		} catch (Exception e) {
			flexLog("DATE 2");
		}
		try {
			userPO.setHeader15(req.getParameter("E01FRCHKN"));
		} catch (Exception e) {
			flexLog("E01FRCHKN");
		}
		try {
			userPO.setHeader16(req.getParameter("E01TOCHKN"));
		} catch (Exception e) {
			flexLog("E01TOCHKN");
		}
	
		try {
			userPO.setHeader17(req.getParameter("E01FRAMNT"));
		} catch (Exception e) {
			flexLog("E01FRAMNT");
		}
		try {
			userPO.setHeader18(req.getParameter("E01TOAMNT"));
		} catch (Exception e) {
			flexLog("E01TOAMNT");
		}
	
		ses.setAttribute("userPO", userPO);
	
		procReqSTList(mc, user, req, res, ses);
	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqSTList(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
	
		MessageRecord newmessage = null;
		ELEERRMessage msgError = null;
		ECIF03001Message msgSearch = null;
		ECIF03001Message msgList = null;
		ECIF03002Message msgHeader = null;
		JBList beanList = null;
		UserPos userPO = null;
	
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
	
		int posi = 0;
		// Send Initial data
		try {
			flexLog("Send Initial Data");
			msgSearch = (ECIF03001Message) mc.getMessageRecord("ECIF03001");
			msgSearch.setH01USERID(user.getH01USR());
			msgSearch.setH01PROGRM("ECL0130");
			msgSearch.setH01TIMSYS(getTimeStamp());
			msgSearch.setH01SCRCOD("01");
			msgSearch.setH01OPECOD("0004");
	
			try {
				try {
					posi = Integer.parseInt(req.getParameter("Pos"));
				} catch (Exception e) {
					posi = 0;
					flexLog("E01NUMPOS");
				}
	
				try {
					msgSearch.setE01NUMREC(req.getParameter("Pos"));
				} catch (Exception e) {
					msgSearch.setE01NUMREC("0");
					flexLog("E01NUMPOS");
				}
	
				try {
					msgSearch.setE01NUMACC(userPO.getIdentifier());
				} catch (Exception e) {
					flexLog("E01NUMACC");
				}
				msgSearch.setE01HISCYC(userPO.getHeader7());
				msgSearch.setE01VALBTH(userPO.getHeader8());
	
				try {
					msgSearch.setE01FRDTED(userPO.getHeader9());
					msgSearch.setE01FRDTEM(userPO.getHeader10());
					msgSearch.setE01FRDTEY(userPO.getHeader11());
				} catch (Exception e) {
					flexLog("DATE 1");
				}
				try {
					msgSearch.setE01TODTED(userPO.getHeader12());
					msgSearch.setE01TODTEM(userPO.getHeader13());
					msgSearch.setE01TODTEY(userPO.getHeader14());
				} catch (Exception e) {
					flexLog("DATE 2");
				}
				try {
					msgSearch.setE01FRCHKN(userPO.getHeader15());
				} catch (Exception e) {
					flexLog("E01FRCHKN");
				}
				try {
					msgSearch.setE01TOCHKN(userPO.getHeader16());
				} catch (Exception e) {
					flexLog("E01TOCHKN");
				}
	
				try {
					msgSearch.setE01FRAMNT(userPO.getHeader17());
				} catch (Exception e) {
					flexLog("E01FRAMNT");
				}
				try {
					msgSearch.setE01TOAMNT(userPO.getHeader18());
				} catch (Exception e) {
					flexLog("E01TOAMNT");
				}
	
			} catch (Exception e) {
				e.printStackTrace();
				flexLog("Input data error " + e);
			}
	
			msgSearch.send();
			msgSearch.destroy();
			flexLog("ECIF03001 Message Sent");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}
	
		// Receive Message
		try {
			newmessage = mc.receiveMessage();
	
			if (newmessage.getFormatName().equals("ELEERR")) {
	
				try {
					msgError = new datapro.eibs.beans.ELEERRMessage();
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}
	
				msgError = (ELEERRMessage) newmessage;
	
				// showERROR(msgError);
	
				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
	
				try {
					flexLog(
						"About to call Page: "
							+ LangPath
							+ "ECL0130_account_st_selection.jsp");
					callPage(LangPath + "ECL0130_account_st_selection.jsp", req, res);
	
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
	
			} else if (newmessage.getFormatName().equals("ECIF03002")) {
				try {
					msgHeader = new datapro.eibs.beans.ECIF03002Message();
				} catch (Exception ex) {
					flexLog("ECIF0302 Error: " + ex);
				}
	
				msgHeader = (ECIF03002Message) newmessage;
	
				flexLog("Putting java beans into the session");
				ses.setAttribute("stBalances", msgHeader);
	
				newmessage = mc.receiveMessage();
	
				if (newmessage.getFormatName().equals("ECIF03001")) {
	
					try {
						beanList = new datapro.eibs.beans.JBList();
					} catch (Exception ex) {
						flexLog("ECIF03001 Error: " + ex);
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
	
						msgList = (ECIF03001Message) newmessage;
	
						marker = msgList.getE01INDOPE();
	
						if (marker.equals("*")) {
							beanList.setShowNext(false);
							break;
						} else {
							if (firstTime) {
								firstTime = false;
								beanList.setFirstRec(
									Integer.parseInt(msgList.getE01NUMREC()));
								grpData = msgList.getE01ENDBAL();
								grpDate =
									Util.formatCustomDate(user.getE01DTF(),
										msgList.getE01DATE2M(),
										msgList.getE01DATE2D(),
										msgList.getE01DATE2Y());
								if (posi == 0) {
									userPO.setHeader5(msgList.getE01BEGBAL());
								}
								chk = "checked";
							} else {
								chk = "";
								grpData =
									grpData + "|" + msgList.getE01ENDBAL();
								grpDate =
									grpDate
										+ "|"
										+ Util.formatCustomDate(user.getE01DTF(),
											msgList.getE01DATE2M(),
											msgList.getE01DATE2D(),
											msgList.getE01DATE2Y());
	
							}
	
							if (msgList.getE01TRADCC().equals("0")) {
								debit =
									debit.add(msgList.getBigDecimalE01TRAAMT());
								strDebit =
									Util.fcolorCCY(msgList.getE01TRAAMT());
								strCredit = "&nbsp;";
							} else if (msgList.getE01TRADCC().equals("5")) {
								credit =
									credit.add(
										msgList.getBigDecimalE01TRAAMT());
								strDebit = "&nbsp;";
								strCredit =
									Util.fcolorCCY(msgList.getE01TRAAMT());
							}
	
							DT1 =
								(userPO.getHeader8().equals("B"))
									? msgList.getE01DATE1D()
									: msgList.getE01DATE2D();
							DT2 =
								(userPO.getHeader8().equals("B"))
									? msgList.getE01DATE1M()
									: msgList.getE01DATE2M();
							DT3 =
								(userPO.getHeader8().equals("B"))
									? msgList.getE01DATE1Y()
									: msgList.getE01DATE2Y();
	
							try {
								chknum =
									Util.addLeftChar(
										'0',
										6,
										msgList.getE01TRACKN());
								acnu =
									Util.addLeftChar(
										'0',
										9,
										msgList.getE01NUMACC());
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
										+ msgList.getE01TRAPDD()
										+ "','"
										+ msgList.getE01TRAPDM()
										+ "','"
										+ msgList.getE01TRAPDY()
										+ "','"
										+ msgList.getE01TRAAMT()
										+ "','"
										+ row
										+ "')\">"
										+ chknum
										+ "</A>";
							}
	
							myRow = new StringBuffer("<TR>");
							myRow.append(
								"<TD NOWRAP ALIGN=\"CENTER\">"
									+ Util.formatCustomDate( user.getE01DTF(),
										msgList.getE01DATE1M(),
										msgList.getE01DATE1D(),
										msgList.getE01DATE1Y())
									+ "</TD>");

							myRow.append(
							"<TD NOWRAP ALIGN=\"CENTER\">"
								+ Util.formatCustomDate(user.getE01DTF(),
									msgList.getE01TRAPDM(),
									msgList.getE01TRAPDD(),
									msgList.getE01TRAPDY())
								+ "</TD>");
	
							if (msgList.getE01TRACDE().equals("CK")
								|| msgList.getE01TRACDE().equals("K1")
								|| msgList.getE01TRACDE().equals("K5")) {
								myRow.append(
									"<TD NOWRAP ALIGN=\"RIGHT\">"
										+ checkgraph
										+ "</TD>");
							} else {
								myRow.append(
									"<TD NOWRAP ALIGN=\"RIGHT\"><a href=\"javascript:showTransfer('"
										+ msgList.getH01FLGWK3()
										+ Util.justifyRight(
											msgList.getE01TRACKN(),
											6)
										+ "')\">"
										+ msgList.getH01FLGWK3()
										+ " - "
										+ msgList.getE01TRACKN()
										+ "</a></TD>");
							}
	
							if (msgList.getE01TRACDE().equalsIgnoreCase("CK")
								|| msgList.getE01TRACDE().equalsIgnoreCase("OF")
								|| msgList.getE01TRACDE().equalsIgnoreCase(
									"DP")) {
								myRow.append(
									"<TD NOWRAP ALIGN=\"CENTER\">"
										+ checkgraph
										+ "</TD>");
							} else {
								myRow.append(
									"<TD NOWRAP ALIGN=\"CENTER\">"
										+ Util.formatCell(msgList.getE01TRACDE())
										+ "</TD>");
							}
							if (msgList.getE01TRADRR().equals("0")) {
								myRow.append(
									"<TD NOWRAP>"
										+ Util.formatCell(msgList.getE01TRANAR())
										+ "</TD>");
							} else {
								myRow.append(
									"<TD NOWRAP><A HREF=\"javascript:GetStatDesc('"
										+ msgList.getE01TRADRR()
										+ "','"
										+ msgList.getE01TRANAR()
										+ "','"
										+ Util.formatCustomDate( user.getE01DTF(),
											msgList.getE01DATE1M(),
											msgList.getE01DATE1D(),
											msgList.getE01DATE1Y())
										+ "','"
										+ Util.formatCell(msgList.getE01TRACDE())
										+ "')\">"
										+ Util.formatCell(msgList.getE01TRANAR())
										+ "</A></TD>");
							}
	
							myRow.append(
								"<TD NOWRAP ALIGN=RIGHT>" + strDebit + "</TD>");
							myRow.append(
								"<TD NOWRAP ALIGN=RIGHT>"
									+ strCredit
									+ "</TD>");
							myRow.append(
								"<TD NOWRAP ALIGN=RIGHT>"
									+ Util.fcolorCCY(msgList.getE01ENDBAL())
									+ "</TD>");
							myRow.append(
								"<TD NOWRAP ALIGN=CENTER><A HREF=\"javascript:GetBatchDet('"
									+ DT1
									+ "','"
									+ DT2
									+ "','"
									+ DT3
									+ "','"
									+ msgList.getE01TRABTH()
									+ "','"
									+ msgList.getE01TRAACR()
									+ "')\">"
									+ Util.formatCell(msgList.getE01TRABTH())
									+ "</A></TD>");

							myRow.append(
								"<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:GetBatchDet('"
									+ msgList.getE01DATE2D()
									+ "','"
									+ msgList.getE01DATE2M()
									+ "','"
									+ msgList.getE01DATE2Y()
									+ "','"
									+ msgList.getE01TRABTH()
									+ "','"
									+ msgList.getE01TRAACR()
									+ "')\">"
									+ Util.formatCustomDate( user.getE01DTF(),
										msgList.getE01DATE2M(),
										msgList.getE01DATE2D(),
										msgList.getE01DATE2Y())
									+ "</A></TD>");

							myRow.append(
								"<TD NOWRAP ALIGN=CENTER>"
									+ msgList.getE01TRATMS()
									+ "</TD>");
							myRow.append(
								"<TD NOWRAP>"
									+ Util.formatCell(msgList.getE01TRAUSA())
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
	
					try {
						flexLog("About to call Page: " + LangPath + "ECL0130_account_st_list.jsp");
						callPage(LangPath + "ECL0130_account_st_list.jsp", req, res);
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}
	
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

			int screen = R_ENTER_INQUIRY;

			try {

				msgUser =
					(datapro.eibs.beans.ESS0030DSMessage) session.getAttribute(
						"currUser");

				// Here we should get the path from the user profile
				LangPath = super.rootPath + msgUser.getE01LAN() + "/";

				try {
					flexLog("Opening Socket Connection");
					mc = new MessageContext(getMessageHandler("ECL0130", req));

					try {
						screen = Integer.parseInt(req.getParameter("SCREEN"));
					} catch (Exception e) {
						flexLog("Screen set to default value");
					}

					switch (screen) {
						case R_ENTER_INQUIRY :
							procReqEnterInquiry(msgUser, req, res, session);
							break;	
						case A_ENTER_INQUIRY :							
							procActionEnterInquiry(mc, msgUser, req, res, session);
							break;
						case R_STATEMENT :
							procReqST(msgUser, req, res, session);
							break;	
						case A_STATEMENT :							
							procActionST(mc, msgUser, req, res, session);
							break;
						case R_STATEMENT_LIST :
							procReqSTList(mc, msgUser, req, res, session);
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