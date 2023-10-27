package datapro.eibs.client;

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

import com.datapro.exception.ServiceLocatorException;
import datapro.eibs.beans.*;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;

import datapro.eibs.sockets.*;

public class JSEDL0300L extends datapro.eibs.master.SuperServlet {

	// CIF options
	protected static final int R_LIST = 1;
	protected static final int R_SEARCH = 2;
	protected static final int A_SEARCH = 3;
	protected static final int R_PRINT = 4;
	protected static final int R_DESC = 5;
	protected static final int R_IN_AN = 6;

	// entering options
	protected static final int R_ENTER = 100;
	protected static final int A_ENTER = 200;

	protected String LangPath = "S";

	/**
	 * JSECLI001 constructor comment.
	 */
	public JSEDL0300L() {
		super();
	}
	/**
	 * This method was created by Orestes Garcia.
	 */
	public void destroy() {


	}
	/**
	 * This method was created by Orestes Garcia.
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procActionSearch(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		UserPos userPO = null;

		userPO = getUserPos(req);

		userPO.setHeader8(Util.getReqParameter("E01VALBTH", req, "B"));
		userPO.setHeader9(Util.getReqParameter("E01FRDTEM", req, "0"));
		userPO.setHeader10(Util.getReqParameter("E01FRDTED", req, "0"));
		userPO.setHeader11(Util.getReqParameter("E01FRDTEY", req, "0"));

		userPO.setHeader12(Util.getReqParameter("E01TODTEM", req, "0"));
		userPO.setHeader13(Util.getReqParameter("E01TODTED", req, "0"));
		userPO.setHeader14(Util.getReqParameter("E01TODTEY", req, "0"));

		userPO.setHeader17(Util.getReqParameter("E01FRAMNT", req, "0"));
		userPO.setHeader18(Util.getReqParameter("E01TOAMNT", req, "0"));

		ses.setAttribute("userPO", userPO);

		procReqList(mc, user, req, res, ses);
	}
	/**
	 * This method was created in VisualAge.
	 * by David Mavilla.
	 * on 5/17/00.
	 */
	protected void procActionSTEnterSearch(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		EDL016001Message msgRT = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		try {
			msgError = new datapro.eibs.beans.ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		userPO = getUserPos(req);

		// Send Initial data
		try {
			msgRT = (EDL016001Message) mc.getMessageRecord("EDL016001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDL0160");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0002");
			msgRT.setE01DEAACD("10");
			try {
				msgRT.setE01DEAACC(req.getParameter("E01DEAACC"));
			} catch (Exception e) {
				msgRT.setE01DEAACC(userPO.getIdentifier());
			}

			msgRT.send();
			msgRT.destroy();
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		try {
			newmessage = mc.receiveMessage();

			if (newmessage.getFormatName().equals("ELEERR")) {
				msgError = (ELEERRMessage) newmessage;
				showERROR(msgError);

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);

				try {
					flexLog(
						"About to call Page: "
							+ LangPath
							+ "EDL0160_ln_enter_stat.jsp");
					callPage(LangPath + "EDL0160_ln_enter_stat.jsp", req, res);
				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}
			} else if (newmessage.getFormatName().equals("EDL016001")) {
				try {
					msgRT = new datapro.eibs.beans.EDL016001Message();
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				msgRT = (EDL016001Message) newmessage;
								
				userPO.setAccNum(msgRT.getE01DEAACC());
				userPO.setType(msgRT.getE01DEATYP());
				userPO.setProdCode(msgRT.getE01DEAPRO());
				userPO.setCusNum(msgRT.getE01DEACUN());
				userPO.setCusName(msgRT.getE01CUSNA1());
				userPO.setIdentifier(msgRT.getE01DEAACC());
				userPO.setHeader1(msgRT.getE01DEAPRO());
				userPO.setHeader2(msgRT.getE01DEACUN());
				userPO.setHeader3(msgRT.getE01CUSNA1());
				userPO.setCurrency(msgRT.getE01DEACCY());
				userPO.setOfficer(
					msgRT.getE01DEAOFC() + " - " + msgRT.getE01DSCOFC());

				flexLog("Putting java beans into the session");
				ses.setAttribute("userPO", userPO);

				flexLog("Calling Request");
				procReqSearch(user, req, res, ses);

			} else
				flexLog("Message " + newmessage.getFormatName() + " received.");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}
	/**
	 * This method was created in VisualAge.
	 */
	@SuppressWarnings("unchecked")
	protected void procReqList(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		ELEERRMessage msgError = null;
		EDL030001Message msgSearch = null;
		EDL030001Message msgList = null;
		EDL030002Message msgHeader = null;
		JBObjList objList = null;
		JBList beanList = null;
		ESS0030DSMessage msgUser = null;
		msgUser = (ESS0030DSMessage) ses.getAttribute("currUser");
		UserPos userPO = null;
		userPO = getUserPos(req);

		MessageProcessor mp = null;

		int posi = 0;
		// Send Initial data
		try {
			flexLog("Send Initial Data");
			mp = getMessageProcessor("EDL0300", req);
			
			msgSearch = (EDL030001Message) mp.getMessageRecord("EDL030001");
			msgSearch.setH01USERID(user.getH01USR());
			msgSearch.setH01PROGRM("EDL0300");
			msgSearch.setH01TIMSYS(getTimeStamp());
			msgSearch.setH01SCRCOD("01");
			msgSearch.setH01OPECOD("0004");
			msgSearch.setE01NUMREC(Util.getReqParameter("Pos", req, "0"));
			msgSearch.setE01NUMACC(userPO.getIdentifier());
			msgSearch.setE01VALBTH(userPO.getHeader8());
			msgSearch.setE01FRDTEM(userPO.getHeader9());
			msgSearch.setE01FRDTED(userPO.getHeader10());
			msgSearch.setE01FRDTEY(userPO.getHeader11());
			msgSearch.setE01TODTEM(userPO.getHeader12());
			msgSearch.setE01TODTED(userPO.getHeader13());
			msgSearch.setE01TODTEY(userPO.getHeader14());
			msgSearch.setE01FRAMNT(userPO.getHeader17());
			msgSearch.setE01TOAMNT(userPO.getHeader18());

			mp.sendMessage(msgSearch);

		// Receive Message
			
			newmessage = mp.receiveMessageRecord();

			if (newmessage.getFormatName().equals("ELEERR")) {

				msgError = (ELEERRMessage) newmessage;

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);

				try {
					flexLog(
						"About to call Page: "
							+ LangPath
							+ "EDL0160_ln_selection.jsp");
					callPage(LangPath + "EDL0160_ln_selection.jsp", req, res);

				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}

			} else if (newmessage.getFormatName().equals("EDL030002")) {

				msgHeader = (EDL030002Message) newmessage;

				flexLog("Putting java beans into the session");
				ses.setAttribute("stBalances", msgHeader);
				
				objList = mp.receiveMessageRecordList("E01INDOPE");
				
				if(userPO.getHeader8().equals("B")){
					objList = Util.sortByDate(objList, user.getE01DTF(), "E01DATE11", "E01DATE12", "E01DATE13", "E01TRAACR");
					
				} else {
					objList = Util.sortByDate(objList, user.getE01DTF(), "E01DATE21", "E01DATE22", "E01DATE23", "E01TRAACR");
				}
				
				
				try {
					beanList = new datapro.eibs.beans.JBList();
					objList.initRow();
					
					boolean firstTime = true;
					String marker = "";
					String myFlag = "";
					StringBuffer myRow = null;
					String chk = "";

					String strPrincipal = "";
					String strInterest = "";
					String strMora = "";
					String strOther = "";
					String trLType = "";
					String trIType = "";
					String trOType = "";
					String trPType = "";
					String trTime = "";

					String DT1 = "";
					String DT2 = "";
					String DT3 = "";

					java.math.BigDecimal principal = new java.math.BigDecimal("0");
					java.math.BigDecimal interest = new java.math.BigDecimal("0");
					java.math.BigDecimal mora = new java.math.BigDecimal("0");
					java.math.BigDecimal other = new java.math.BigDecimal("0");

					while (objList.getNextRow()) {

						msgList = (EDL030001Message) objList.getRecord();

						if (firstTime) {
							firstTime = false;
							beanList.setFirstRec(Integer.parseInt(msgList.getE01NUMREC()));
							chk = "checked";
						} else {
							chk = "";
						}

							strPrincipal = "&nbsp;";
							strInterest = "&nbsp;";
							strMora = "&nbsp;";
							strOther = "&nbsp;";
							trPType = "&nbsp;";
							trIType = "&nbsp;";
							trOType = "&nbsp;";
							trLType = "&nbsp;";
							trTime = msgList.getE01TRATMS().substring(11, 19);

							if (msgList.getE01TRAAPC().equals("P")) {
								if (msgList.getE01TRADCC().equals("0")) {
									strPrincipal =
										Util.fcolorCCY(msgList.getE01TRAAMT());
									principal =
										principal.subtract(
											msgList.getBigDecimalE01TRAAMT());
									trOType = "&nbsp;";
									trIType = "&nbsp;";
									trPType = "&nbsp;";
									trLType = "&nbsp;";

								} else if ( msgList.getE01TRADCC().equals("5")) {
									strPrincipal =
										"  "
											+ Util.fcolorCCY(
												msgList.getE01TRAAMT());
									trPType = "CR";
									trIType = "&nbsp;";
									trOType = "&nbsp;";
									trLType = "&nbsp;";

									principal =
										principal.add(
											msgList.getBigDecimalE01TRAAMT());
								}
								strInterest = "&nbsp;";
								strMora = "&nbsp;";
								strOther = "&nbsp;";

							} else if (msgList.getE01TRAAPC().equals("I")) {
								if (msgList.getE01TRADCC().equals("0")) {
									strInterest =
										Util.fcolorCCY(msgList.getE01TRAAMT());
									interest =
										interest.subtract(
											msgList.getBigDecimalE01TRAAMT());
									trOType = "&nbsp;";
									trIType = "&nbsp;";
									trPType = "&nbsp;";
									trLType = "&nbsp;";

								} else if (
									msgList.getE01TRADCC().equals("5")) {
									strInterest =
										"  "
											+ Util.fcolorCCY(
												msgList.getE01TRAAMT());
									interest =
										interest.add(
											msgList.getBigDecimalE01TRAAMT());
									trIType = "CR";
									trPType = "&nbsp;";
									trOType = "&nbsp;";
									trLType = "&nbsp;";

								}
								strPrincipal = "&nbsp;";
								strMora = "&nbsp;";
								strOther = "&nbsp;";

							} else if (msgList.getE01TRAAPC().equals("L")) {
								if (msgList.getE01TRADCC().equals("0")) {
									strMora =
										Util.fcolorCCY(msgList.getE01TRAAMT());
									mora =
										mora.subtract(
											msgList.getBigDecimalE01TRAAMT());
									trOType = "&nbsp;";
									trIType = "&nbsp;";
									trPType = "&nbsp;";
									trLType = "&nbsp;";

								} else if (
									msgList.getE01TRADCC().equals("5")) {
									strMora =
										"  "
											+ Util.fcolorCCY(
												msgList.getE01TRAAMT());
									mora =
										mora.add(
											msgList.getBigDecimalE01TRAAMT());
									trLType = "CR";
									trIType = "&nbsp;";
									trOType = "&nbsp;";
									trPType = "&nbsp;";

								}
								strPrincipal = "&nbsp;";
								strInterest = "&nbsp;";
								strOther = "&nbsp;";

							} else if (msgList.getE01TRAAPC().equals("O")) {
								if (msgList.getE01TRADCC().equals("0")) {
									strOther =
										Util.fcolorCCY(msgList.getE01TRAAMT());
									other =
										other.subtract(
											msgList.getBigDecimalE01TRAAMT());
									trOType = "&nbsp;";
									trIType = "&nbsp;";
									trPType = "&nbsp;";
									trLType = "&nbsp;";

								} else if (
									msgList.getE01TRADCC().equals("5")) {
									strOther =
										"  "
											+ Util.fcolorCCY(
												msgList.getE01TRAAMT());
									other =
										other.add(
											msgList.getBigDecimalE01TRAAMT());
									trOType = "CR";
									trIType = "&nbsp;";
									trPType = "&nbsp;";
									trLType = "&nbsp;";

								}
								strPrincipal = "&nbsp;";
								strInterest = "&nbsp;";
								strMora = "&nbsp;";
							}

							DT1 =
								(userPO.getHeader8().equals("B"))
									? msgList.getE01DATE11()
									: msgList.getE01DATE21();
							DT2 =
								(userPO.getHeader8().equals("B"))
									? msgList.getE01DATE12()
									: msgList.getE01DATE22();
							DT3 =
								(userPO.getHeader8().equals("B"))
									? msgList.getE01DATE13()
									: msgList.getE01DATE23();

							myRow = new StringBuffer("<TR>");
							if (userPO.getHeader8().equals("B")) {
								myRow.append(
									"<TD NOWRAP ALIGN=\"CENTER\" width=\"6%\"><A HREF=\"javascript:GetBatchDet('"
										+ msgList.getE01DATE11()
										+ "','"
										+ msgList.getE01DATE12()
										+ "','"
										+ msgList.getE01DATE13()
										+ "','"
										+ msgList.getE01TRABTH()
										+ "','"
										+ msgList.getE01TRAACR()
										+ "')\">"
										+ datapro.eibs.master.Util.formatCustomDate(msgUser.getE01DTF(),
                                                                                    msgList.getBigDecimalE01DATE11().intValue(),
                                                                                    msgList.getBigDecimalE01DATE12().intValue(),
                                                                                    msgList.getBigDecimalE01DATE13().intValue())
										+ "</A></TD>");
							} else {
								myRow.append(
										"<TD NOWRAP ALIGN=\"CENTER\" width=\"6%\"><A HREF=\"javascript:GetBatchDet('"
												+ msgList.getE01DATE11()
												+ "','"
												+ msgList.getE01DATE12()
												+ "','"
												+ msgList.getE01DATE13() 
												+ "','"
												+ msgList.getE01TRABTH()
												+ "','"
												+ msgList.getE01TRAACR()
												+ "')\">"
												+ datapro.eibs.master.Util.formatCustomDate(msgUser.getE01DTF(),
                                                                                    msgList.getBigDecimalE01DATE11().intValue(),
                                                                                    msgList.getBigDecimalE01DATE12().intValue(),
                                                                                    msgList.getBigDecimalE01DATE13().intValue())
										+ "</TD>");
							}
							myRow.append(
								"<TD NOWRAP ALIGN=\"CENTER\" width=\"3%\">"
									+ Util.formatCell(msgList.getE01TRACDE())
									+ "</TD>");
							if (msgList.getE01TRADRR().equals("0")) {
								myRow.append(
									"<TD NOWRAP ALIGN=\"LEFT\" width=\"22%\">"
										+ Util.formatCell(msgList.getE01TRANAR())
										+ "</TD>");
							} else {
								myRow.append(
									"<TD NOWRAP ALIGN=\"LEFT\" width=\"22%\"><A HREF=\"javascript:GetStatDesc('"
										+ msgList.getE01TRADRR()
										+ "','"
										+ msgList.getE01TRANAR()
										+ "','"
     									+ datapro.eibs.master.Util.formatCustomDate(msgUser.getE01DTF(),
                                                                                    msgList.getBigDecimalE01DATE11().intValue(),
                                                                                    msgList.getBigDecimalE01DATE12().intValue(),
                                                                                    msgList.getBigDecimalE01DATE13().intValue())
										+ "','"
										+ Util.formatCell(msgList.getE01TRACDE())
										+ "')\">"
										+ Util.formatCell(msgList.getE01TRANAR())
										+ "</A></TD>");
							}
							myRow.append(
									"<TD NOWRAP ALIGN=\"RIGHT\" width=\"9%\">"
										+ Util.formatCell(strPrincipal)
										+ "</TD>");
								myRow.append(
									"<TD NOWRAP ALIGN=\"LEFT\" width=\"1%\">"
										+ Util.formatCell(trPType)
										+ "</TD>");
								myRow.append(
									"<TD NOWRAP ALIGN=\"RIGHT\" width=\"9%\">"
										+ Util.formatCell(strInterest)
										+ "</TD>");
								myRow.append(
									"<TD NOWRAP ALIGN=\"LEFT\" width=\"1%\">"
										+ Util.formatCell(trIType)
										+ "</TD>");
								myRow.append(
									"<TD NOWRAP ALIGN=\"RIGHT\" width=\"9%\">"
										+ Util.formatCell(strMora)
										+ "</TD>");
								myRow.append(
									"<TD NOWRAP ALIGN=\"LEFT\" width=\"1%\">"
										+ Util.formatCell(trLType)
										+ "</TD>");
							myRow.append(
								"<TD NOWRAP ALIGN=\"RIGHT\" width=\"9%\">"
									+ Util.formatCell(strOther)
									+ "</TD>");
							myRow.append(
									"<TD NOWRAP ALIGN=\"LEFT\" width=\"1%\">"
										+ Util.formatCell(trOType)
										+ "</TD>");
							myRow.append(
								"<TD NOWRAP ALIGN=\"CENTER\" width=\"3%\"><A HREF=\"javascript:GetBatchDet('"
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
							if (userPO.getHeader8().equals("V")) {
								myRow.append(
									"<TD NOWRAP ALIGN=\"CENTER\" width=\"6%\"><A HREF=\"javascript:GetBatchDet('"
										+ msgList.getE01DATE21()
										+ "','"
										+ msgList.getE01DATE22()
										+ "','"
										+ msgList.getE01DATE23()
										+ "','"
										+ msgList.getE01TRABTH()
										+ "','"
										+ msgList.getE01TRAACR()
										+ "')\">"
     									+ datapro.eibs.master.Util.formatCustomDate(msgUser.getE01DTF(),
                                                                                    msgList.getBigDecimalE01DATE21().intValue(),
                                                                                    msgList.getBigDecimalE01DATE22().intValue(),
                                                                                    msgList.getBigDecimalE01DATE23().intValue())
										+ "</A></TD>");
							} else {
								myRow.append(
									"<TD NOWRAP ALIGN=\"CENTER\" width=\"6%\">"
     									+ datapro.eibs.master.Util.formatCustomDate(msgUser.getE01DTF(),
                                                                                    msgList.getBigDecimalE01DATE21().intValue(),
                                                                                    msgList.getBigDecimalE01DATE22().intValue(),
                                                                                    msgList.getBigDecimalE01DATE23().intValue())
										+ "</TD>");
							}
							myRow.append(
								"<TD NOWRAP ALIGN=\"CENTER\" width=\"5%\">"
									+ trTime
									+ "</TD>");
							myRow.append(
								"<TD NOWRAP ALIGN=\"CENTER\" width=\"8%\">"
									+ Util.formatCell(msgList.getE01TRAUSA())
									+ "</TD>");
							myRow.append(
								"<TD NOWRAP ALIGN=\"CENTER\" width=\"3%\">"
									+ Util.formatCell(msgList.getE01TRAOBK())
									+ "</TD>");
							myRow.append(
								"<TD NOWRAP ALIGN=\"CENTER\" width=\"3%\">"
									+ Util.formatCell(msgList.getE01TRAOBR())
									+ "</TD>");
							myRow.append("</TR>");
							beanList.addRow(myFlag, myRow.toString());

					}


					userPO.setHeader19(Util.fcolorCCY(principal.toString()));
					userPO.setHeader20(Util.fcolorCCY(interest.toString()));
					userPO.setHeader21(Util.fcolorCCY(mora.toString()));

					flexLog("Putting java beans into the session");
					ses.setAttribute("cifList", beanList);
					ses.setAttribute("userPO", userPO);

					try {
						flexLog(
							"About to call Page: "
								+ LangPath
								+ "EDL0160_ln_list_fp.jsp");
						callPage(LangPath + "EDL0160_ln_list_fp.jsp", req, res);
					} catch (Exception e) {
						flexLog("Exception calling page " + e);
					}

				}catch(Exception e){
					e.printStackTrace();
					flexLog("Error: " + e);
					throw new RuntimeException("Socket Communication Error");					
				}
			}
			
		} catch (Exception e){
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");				
			
		} finally  {
			if (mp != null)
				mp.close();
		}

	}
	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqPrintList(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageRecord newmessage = null;
		ELEERRMessage msgError = null;
		EDL030001Message msgSearch = null;
		EDL030001Message msgList = null;
		EDL030002Message msgHeader = null;
		JBList beanList = null;
		ESS0030DSMessage msgUser = null;
		msgUser = (ESS0030DSMessage) ses.getAttribute("currUser");
		UserPos userPO = null;
		userPO = getUserPos(req);

		int posi = 0;
		// Send Initial data
		try {
			flexLog("Send Initial Data");
			msgSearch = (EDL030001Message) mc.getMessageRecord("EDL030001");
			msgSearch.setH01USERID(user.getH01USR());
			msgSearch.setH01PROGRM("EDL0300");
			msgSearch.setH01TIMSYS(getTimeStamp());
			msgSearch.setH01SCRCOD("01");
			msgSearch.setH01OPECOD("0004");
			msgSearch.setH01FLGWK1("P");
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

				msgSearch.setE01VALBTH(userPO.getHeader8());

				try {
					msgSearch.setE01FRDTEM(userPO.getHeader9());
					msgSearch.setE01FRDTED(userPO.getHeader10());
					msgSearch.setE01FRDTEY(userPO.getHeader11());
				} catch (Exception e) {
					flexLog("DATE 1");
				}
				try {
					msgSearch.setE01TODTEM(userPO.getHeader12());
					msgSearch.setE01TODTED(userPO.getHeader13());
					msgSearch.setE01TODTEY(userPO.getHeader14());
				} catch (Exception e) {
					flexLog("DATE 2");
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
							+ "EDL0160_ln_selection.jsp");
					callPage(LangPath + "EDL0160_ln_selection.jsp", req, res);

				} catch (Exception e) {
					flexLog("Exception calling page " + e);
				}

			} else if (newmessage.getFormatName().equals("EDL030002")) {
				try {
					msgHeader = new datapro.eibs.beans.EDL030002Message();
				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				msgHeader = (EDL030002Message) newmessage;

				flexLog("Putting java beans into the session");
				ses.setAttribute("stBalances", msgHeader);

				newmessage = mc.receiveMessage();

				if (newmessage.getFormatName().equals("EDL030001")) {

					try {
						beanList = new datapro.eibs.beans.JBList();
					} catch (Exception ex) {
						flexLog("Error: " + ex);
					}

					boolean firstTime = true;
					String marker = "";
					String myFlag = "";
					StringBuffer myRow = null;
					String chk = "";

					String strPrincipal = "";
					String strInterest = "";
					String strMora = "";
					String strOther = "";
					String trIType = "";
					String trPType = "";
					String trOType = "";
					String trLType = "";

					java.math.BigDecimal principal =
						new java.math.BigDecimal("0");
					java.math.BigDecimal interest = new java.math.BigDecimal("0");
					java.math.BigDecimal mora = new java.math.BigDecimal("0");
					java.math.BigDecimal other = new java.math.BigDecimal("0");

					while (true) {

						msgList = (EDL030001Message) newmessage;

						marker = msgList.getE01INDOPE();

						if (marker.equals("*")) {
							beanList.setShowNext(false);
							break;
						} else {
							if (firstTime) {
								firstTime = false;
								beanList.setFirstRec(
									Integer.parseInt(msgList.getE01NUMREC()));
								chk = "checked";
							} else {
								chk = "";
							}
							
							strPrincipal = "&nbsp;";
							strInterest = "&nbsp;";
							strMora = "&nbsp;";
							strOther = "&nbsp;";
							trPType = "&nbsp;";
							trIType = "&nbsp;";
							trOType = "&nbsp;";
							trLType = "&nbsp;";						
							
						   if (msgList.getE01DEACLS().equals("1")){ //Activos
								if (msgList.getE01TRAAPC().equals("P")) {
									if (msgList.getE01TRADCC().equals("0")) {
										strPrincipal =
											Util.fcolorCCY(msgList.getE01TRAAMT());
										principal =
											principal.add(
												msgList.getBigDecimalE01TRAAMT());
										trOType = "&nbsp;";
										trIType = "&nbsp;";
										trPType = "&nbsp;";
										trLType = "&nbsp;";

									} else if (
										msgList.getE01TRADCC().equals("5")) {
										strPrincipal =
											"  "
												+ Util.fcolorCCY(
													msgList.getE01TRAAMT());
										trPType = "CR";
										trIType = "&nbsp;";
										trOType = "&nbsp;";
										trLType = "&nbsp;";

										principal =
											principal.subtract(
												msgList.getBigDecimalE01TRAAMT());
									}
									strInterest = "&nbsp;";
									strMora = "&nbsp;";
									strOther = "&nbsp;";

								} else if (msgList.getE01TRAAPC().equals("I")) {
									if (msgList.getE01TRADCC().equals("0")) {
										strInterest =
											Util.fcolorCCY(msgList.getE01TRAAMT());
										interest =
											interest.subtract(
												msgList.getBigDecimalE01TRAAMT());
										trOType = "&nbsp;";
										trIType = "&nbsp;";
										trPType = "&nbsp;";
										trLType = "&nbsp;";

									} else if (
										msgList.getE01TRADCC().equals("5")) {
										strInterest =
											"  "
												+ Util.fcolorCCY(
													msgList.getE01TRAAMT());
										interest =
											interest.add(
												msgList.getBigDecimalE01TRAAMT());
										trIType = "CR";
										trPType = "&nbsp;";
										trOType = "&nbsp;";
										trLType = "&nbsp;";

									}
									strPrincipal = "&nbsp;";
									strMora = "&nbsp;";
									strOther = "&nbsp;";

								} else if (msgList.getE01TRAAPC().equals("L")) {
									if (msgList.getE01TRADCC().equals("0")) {
										strMora =
											Util.fcolorCCY(msgList.getE01TRAAMT());
										mora =
											mora.add(
												msgList.getBigDecimalE01TRAAMT());
										trOType = "&nbsp;";
										trIType = "&nbsp;";
										trPType = "&nbsp;";
										trLType = "&nbsp;";

									} else if (
										msgList.getE01TRADCC().equals("5")) {
										strMora =
											"  "
												+ Util.fcolorCCY(
													msgList.getE01TRAAMT());
										mora =
											mora.subtract(
												msgList.getBigDecimalE01TRAAMT());
										trLType = "CR";
										trIType = "&nbsp;";
										trOType = "&nbsp;";
										trPType = "&nbsp;";

									}
									strPrincipal = "&nbsp;";
									strInterest = "&nbsp;";
									strOther = "&nbsp;";

								} else if (msgList.getE01TRAAPC().equals("O")) {
									if (msgList.getE01TRADCC().equals("0")) {
										strOther =
											Util.fcolorCCY(msgList.getE01TRAAMT());
										other =
											other.add(
												msgList.getBigDecimalE01TRAAMT());
										trOType = "&nbsp;";
										trIType = "&nbsp;";
										trPType = "&nbsp;";
										trLType = "&nbsp;";

									} else if (
										msgList.getE01TRADCC().equals("5")) {
										strOther =
											"  "
												+ Util.fcolorCCY(
													msgList.getE01TRAAMT());
										other =
											other.subtract(
												msgList.getBigDecimalE01TRAAMT());
										trOType = "CR";
										trIType = "&nbsp;";
										trPType = "&nbsp;";
										trLType = "&nbsp;";

									}
									strPrincipal = "&nbsp;";
									strInterest = "&nbsp;";
									strMora = "&nbsp;";
								}
						   
						   } else { //Pasivos
							   						   
							if (msgList.getE01TRAAPC().equals("P")) {
								if (msgList.getE01TRADCC().equals("0")) {
									strPrincipal =
										Util.fcolorCCY(msgList.getE01TRAAMT());
									principal =
										principal.subtract(
											msgList.getBigDecimalE01TRAAMT());
									trOType = "&nbsp;";
									trIType = "&nbsp;";
									trPType = "&nbsp;";
									trLType = "&nbsp;";

								} else if (
									msgList.getE01TRADCC().equals("5")) {
									strPrincipal =
										"  "
											+ Util.fcolorCCY(
												msgList.getE01TRAAMT());
									trPType = "CR";
									trIType = "&nbsp;";
									trOType = "&nbsp;";
									trLType = "&nbsp;";

									principal =
										principal.add(
											msgList.getBigDecimalE01TRAAMT());
								}
								strInterest = "&nbsp;";
								strMora = "&nbsp;";
								strOther = "&nbsp;";

							} else if (msgList.getE01TRAAPC().equals("I")) {
								if (msgList.getE01TRADCC().equals("0")) {
									strInterest =
										Util.fcolorCCY(msgList.getE01TRAAMT());
									interest =
										interest.add(
											msgList.getBigDecimalE01TRAAMT());
									trOType = "&nbsp;";
									trIType = "&nbsp;";
									trPType = "&nbsp;";
									trLType = "&nbsp;";

								} else if (
									msgList.getE01TRADCC().equals("5")) {
									strInterest =
										"  "
											+ Util.fcolorCCY(
												msgList.getE01TRAAMT());
									interest =
										interest.subtract(
											msgList.getBigDecimalE01TRAAMT());
									trIType = "CR";
									trPType = "&nbsp;";
									trOType = "&nbsp;";
									trLType = "&nbsp;";

								}
								strPrincipal = "&nbsp;";
								strMora = "&nbsp;";
								strOther = "&nbsp;";

							} else if (msgList.getE01TRAAPC().equals("L")) {
								if (msgList.getE01TRADCC().equals("0")) {
									strMora =
										Util.fcolorCCY(msgList.getE01TRAAMT());
									mora =
										mora.subtract(
											msgList.getBigDecimalE01TRAAMT());
									trOType = "&nbsp;";
									trIType = "&nbsp;";
									trPType = "&nbsp;";
									trLType = "&nbsp;";

								} else if (
									msgList.getE01TRADCC().equals("5")) {
									strMora =
										"  "
											+ Util.fcolorCCY(
												msgList.getE01TRAAMT());
									mora =
										mora.add(
											msgList.getBigDecimalE01TRAAMT());
									trLType = "CR";
									trIType = "&nbsp;";
									trOType = "&nbsp;";
									trPType = "&nbsp;";

								}
								strPrincipal = "&nbsp;";
								strInterest = "&nbsp;";
								strOther = "&nbsp;";

							} else if (msgList.getE01TRAAPC().equals("O")) {
								if (msgList.getE01TRADCC().equals("0")) {
									strOther =
										Util.fcolorCCY(msgList.getE01TRAAMT());
									other =
										other.subtract(
											msgList.getBigDecimalE01TRAAMT());
									trOType = "&nbsp;";
									trIType = "&nbsp;";
									trPType = "&nbsp;";
									trLType = "&nbsp;";

								} else if (
									msgList.getE01TRADCC().equals("5")) {
									strOther =
										"  "
											+ Util.fcolorCCY(
												msgList.getE01TRAAMT());
									other =
										other.add(
											msgList.getBigDecimalE01TRAAMT());
									trOType = "CR";
									trIType = "&nbsp;";
									trPType = "&nbsp;";
									trLType = "&nbsp;";

								}
								strPrincipal = "&nbsp;";
								strInterest = "&nbsp;";
								strMora = "&nbsp;";
							}
							
						   }

							myRow = new StringBuffer("<TR>");
							myRow.append(
								"<TD NOWRAP ALIGN=\"CENTER\">"
									+ datapro.eibs.master.Util.formatCustomDate(msgUser.getE01DTF(),
																			msgList.getBigDecimalE01DATE11().intValue(),
																			msgList.getBigDecimalE01DATE12().intValue(),
																			msgList.getBigDecimalE01DATE13().intValue())	
									+ "</TD>");
							myRow.append(
								"<TD NOWRAP ALIGN=CENTER>"
									+ datapro.eibs.master.Util.formatCustomDate(msgUser.getE01DTF(),
																			msgList.getBigDecimalE01DATE21().intValue(),
																			msgList.getBigDecimalE01DATE22().intValue(),
																			msgList.getBigDecimalE01DATE23().intValue())	
									+ "</TD>");
							myRow.append(
								"<TD NOWRAP ALIGN=\"CENTER\">"
									+ Util.formatCell(msgList.getE01TRACDE())
									+ "</TD>");
							if (msgList.getE01NUMNAR().equals("0")) {
								myRow.append(
									"<TD>"
										+ Util.formatCell(msgList.getE01TRANAR())
										+ "</TD>");
							} else {
								if (msgList
									.getE01NUMNAR()
									.trim()
									.equals("1")) {
									myRow.append(
										"<TD NOWRAP>"
											+ Util.formatCell(
												msgList.getE01TRANAR())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA1())
											+ "</TD>");
								} else if (
									msgList.getE01NUMNAR().trim().equals(
										"2")) {
									myRow.append(
										"<TD NOWRAP>"
											+ Util.formatCell(
												msgList.getE01TRANAR())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA1())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA2())
											+ "</TD>");
								} else if (
									msgList.getE01NUMNAR().trim().equals(
										"3")) {
									myRow.append(
										"<TD NOWRAP>"
											+ Util.formatCell(
												msgList.getE01TRANAR())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA1())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA2())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA3())
											+ "</TD>");
								} else if (
									msgList.getE01NUMNAR().trim().equals(
										"4")) {
									myRow.append(
										"<TD NOWRAP>"
											+ Util.formatCell(
												msgList.getE01TRANAR())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA1())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA2())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA3())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA4())
											+ "</TD>");
								} else if (
									msgList.getE01NUMNAR().trim().equals(
										"5")) {
									myRow.append(
										"<TD NOWRAP>"
											+ Util.formatCell(
												msgList.getE01TRANAR())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA1())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA2())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA3())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA4())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA5())
											+ "</TD>");
								} else if (
									msgList.getE01NUMNAR().trim().equals(
										"6")) {
									myRow.append(
										"<TD NOWRAP>"
											+ Util.formatCell(
												msgList.getE01TRANAR())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA1())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA2())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA3())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA4())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA5())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA6())
											+ "</TD>");
								} else if (
									msgList.getE01NUMNAR().trim().equals(
										"7")) {
									myRow.append(
										"<TD NOWRAP>"
											+ Util.formatCell(
												msgList.getE01TRANAR())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA1())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA2())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA3())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA4())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA5())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA6())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA7())
											+ "</TD>");
								} else if (
									msgList.getE01NUMNAR().trim().equals(
										"8")) {
									myRow.append(
										"<TD NOWRAP>"
											+ Util.formatCell(
												msgList.getE01TRANAR())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA1())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA2())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA3())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA4())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA5())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA6())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA7())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA8())
											+ "</TD>");
								} else if (
									msgList.getE01NUMNAR().trim().equals(
										"9")) {
									myRow.append(
										"<TD NOWRAP>"
											+ Util.formatCell(
												msgList.getE01TRANAR())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA1())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA2())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA3())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA4())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA5())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA6())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA7())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA8())
											+ "<BR>"
											+ Util.formatCell(
												msgList.getE01TRANA9())
											+ "</TD>");
								}
							}
							myRow.append(
								"<TD NOWRAP ALIGN=RIGHT>"
									+ Util.formatCell(strPrincipal)
									+ "</TD>");
							myRow.append(
								"<TD NOWRAP ALIGN=RIGHT>"
									+ Util.formatCell(trPType)
									+ "</TD>");
							myRow.append(
								"<TD NOWRAP ALIGN=RIGHT>"
									+ Util.formatCell(strInterest)
									+ "</TD>");
							myRow.append(
								"<TD NOWRAP ALIGN=RIGHT>"
									+ Util.formatCell(trIType)
									+ "</TD>");
							myRow.append(
								"<TD NOWRAP ALIGN=RIGHT>"
									+ Util.formatCell(strMora)
									+ "</TD>");
							myRow.append(
								"<TD NOWRAP ALIGN=RIGHT>"
									+ Util.formatCell(trLType)
									+ "</TD>");
							myRow.append(
								"<TD NOWRAP ALIGN=RIGHT>"
									+ Util.formatCell(msgList.getE01TRABTH())
									+ "</TD>");
							myRow.append("</TR>");
							beanList.addRow(myFlag, myRow.toString());

							if (marker.equals("+")) {
								beanList.setShowNext(true);
								break;
							}
						}

						newmessage = mc.receiveMessage();
					}

					userPO.setHeader19(Util.fcolorCCY(principal.toString()));
					userPO.setHeader20(Util.fcolorCCY(interest.toString()));
					userPO.setHeader21(Util.fcolorCCY(mora.toString()));

					flexLog("Putting java beans into the session");
					ses.setAttribute("cifList", beanList);
					ses.setAttribute("userPO", userPO);

					try {

						flexLog(
							"About to call Page: "
								+ LangPath
								+ "EDL0160_ln_list_print_fp.jsp");
						callPage(
							LangPath + "EDL0160_ln_list_print_fp.jsp",
							req,
							res);

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
	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqSearch(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		try {
			flexLog(
				"About to call Page: " + LangPath + "EDL0160_ln_selection.jsp");
			callPage(LangPath + "EDL0160_ln_selection.jsp", req, res);
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Exception calling page " + e);
		}

	}
	/**
	 * This method was created in VisualAge.
	 * by David Mavilla.
	 * on 5/17/00.
	 */
	protected void procReqSTEnterSearch(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

			ELEERRMessage msgError = null;
			UserPos userPO = null;

			try {

				msgError = new datapro.eibs.beans.ELEERRMessage();				
				userPO = new datapro.eibs.beans.UserPos();
				String opt="LN";
				String prd="10";
			
				userPO.setOption(opt);
				userPO.setPurpose("STATEMENT");
				userPO.setRedirect("/servlet/datapro.eibs.client.JSEDL0300L?SCREEN=200");
				userPO.setProdCode(prd);
				//Others Parameters
				userPO.setHeader1("E01DEAACC");
				userPO.setHeader2("H01FLGWK2");
				//msgCD = new EDL013001Message();
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
				//ses.setAttribute("cdMant", msgCD);

			} catch (Exception ex) {
				flexLog("Error: " + ex);
			}

			try {
				flexLog("About to call Page: " + LangPath + "GENERIC_account_enter.jsp");
				callPage(LangPath + "GENERIC_account_enter.jsp", req, res);
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

			int screen = R_SEARCH;

			try {

				msgUser =
					(datapro.eibs.beans.ESS0030DSMessage) session.getAttribute(
						"currUser");

				// Here we should get the path from the user profile
				LangPath = super.rootPath + msgUser.getE01LAN() + "/";

				try {
					flexLog("Opennig Socket Connection");
					mc = new MessageContext(super.getMessageHandler("EDL0300", req));

					try {
						screen = Integer.parseInt(req.getParameter("SCREEN"));
					} catch (Exception e) {
						flexLog("Screen set to default value");
					}

					switch (screen) {
						case R_SEARCH :
							procReqSearch(msgUser, req, res, session);
							break;
						case A_SEARCH :
							procActionSearch(mc, msgUser, req, res, session);
							break;
						case R_LIST :
							procReqList(mc, msgUser, req, res, session);
							break;
						case R_PRINT :
							procReqPrintList(mc, msgUser, req, res, session);
							break;
							//entering options
						case R_ENTER :
							procReqSTEnterSearch(msgUser, req, res, session);
							break;
						case A_ENTER :
							procActionSTEnterSearch(
								mc,
								msgUser,
								req,
								res,
								session);
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
	
	private MessageProcessor getMessageProcessor(String targetProgram, HttpServletRequest request) 
			throws IOException {
			try {
				return new MessageProcessor(
					getMessageHandler(targetProgram, request));
			} catch (ServiceLocatorException e) {
				throw new IOException(e.getMessage());
			}
		}
	
}