package datapro.eibs.client;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: erodriguez
 */
import java.io.*;
import java.math.BigDecimal;
import java.net.*;
import java.util.Iterator;
import java.beans.Beans;

import javax.servlet.*;
import javax.servlet.http.*;

import datapro.eibs.beans.*;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.*;

public class JSEDL0300 extends JSEIBSServlet {

	// CIF options
	protected static final int R_LIST = 1;
	protected static final int R_SEARCH = 2;
	protected static final int A_SEARCH = 3;
	protected static final int R_PRINT = 4;
	protected static final int R_DESC = 5;
	protected static final int R_IN_AN = 6;

	// entering options
	protected static final int R_ENTER = 100;
	protected static final int R_ENTER_BONO = 101;
	protected static final int R_ENTER_ACC = 300;
	protected static final int A_ENTER = 200;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen) {
		case R_SEARCH :
			procReqSearch(user, req, res, session);
			break;
		case A_SEARCH :
			procActionSearch(user, req, res, session);
			break;
		case R_LIST :
			procReqList(user, req, res, session);
			break;
		case R_PRINT :
			procReqPrintList(user, req, res, session);
			break;
		case R_IN_AN :
			procReqAnInt(user, req, res, session);
			break;
			//entering options
		case R_ENTER :
			procReqSTEnterSearch(user, req, res, session);
			break;
		case R_ENTER_BONO :
			procReqSTEnterSearchBono(user, req, res, session);
			break;
		case R_ENTER_ACC :
			procReqSTEnterSearchAcc(user, req, res, session);
			break;
		case A_ENTER :
			procActionSTEnterSearch(user, req, res, session);
			break;
		default :
			forward(devPage, req, res);
			break;
		}
	}

	private void procActionSTEnterSearch(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";

		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0160", req);
			EDL016001Message msgRT = (EDL016001Message) mp.getMessageRecord("EDL016001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDL0160");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0002");
			try {
				msgRT.setE01DEAACC(req.getParameter("E01DEAACC").trim());
			} catch (Exception e) {
				msgRT.setE01DEAACC(userPO.getIdentifier());
			}

			mp.sendMessage(msgRT);
			MessageRecord msg = mp.receiveMessageRecord();

			if (mp.hasError(msg)) {
				msgError = (ELEERRMessage) msg;
				pageName = "EDL0300_st_enter_stat.jsp";
			} else {
				msgError = new ELEERRMessage();
				msgRT = (EDL016001Message) msg;
				userPO.setIdentifier(msgRT.getE01DEAACC());
				userPO.setHeader1(msgRT.getE01DEAPRO());
				userPO.setProdCode(msgRT.getE01DEAPRO());
				userPO.setHeader2(msgRT.getE01DEACUN());
				userPO.setCusNum(msgRT.getE01DEACUN());
				userPO.setHeader3(msgRT.getE01CUSNA1());
				userPO.setCusName(msgRT.getE01CUSNA1());
				userPO.setCurrency(msgRT.getE01DEACCY());
				userPO.setOfficer(msgRT.getE01DEAOFC() + " - " + msgRT.getE01DSCOFC());
				userPO.setType(msgRT.getE01DEATYP());
				pageName = "EDL0300_st_selection.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqSTEnterSearchAcc(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("RT");
		userPO.setPurpose("STATEMENT");

		session.setAttribute("userPO", userPO);
		forward("EDL0300_st_enter_stat_acc.jsp", req, res);
	}

	private void procReqSTEnterSearchBono(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("12");
		userPO.setPurpose("STATEMENT");
		userPO.setRedirect("/servlet/datapro.eibs.client.JSEDL0300?SCREEN=200");
		userPO.setProdCode("12");
		//Others Parameters
		userPO.setHeader1("E01DEAACC");
		userPO.setHeader2("H01FLGWK2");
		
		session.setAttribute("userPO", userPO);
		forward("GENERIC_account_enter.jsp", req, res);
	}

	private void procReqSTEnterSearch(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("CD");
		userPO.setPurpose("STATEMENT");
		userPO.setRedirect("/servlet/datapro.eibs.client.JSEDL0300?SCREEN=200");
		userPO.setProdCode("11");
		//Others Parameters
		userPO.setHeader1("E01DEAACC");
		userPO.setHeader2("H01FLGWK2");
		
		session.setAttribute("userPO", userPO);
		forward("GENERIC_account_enter.jsp", req, res);
	}

	private void procReqAnInt(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0300", req);
			EDL030003Message msgSearch = (EDL030003Message) mp.getMessageRecord("EDL030003");
			msgSearch.setH03USERID(user.getH01USR());
			msgSearch.setH03PROGRM("EDL0300");
			msgSearch.setH03TIMSYS(getTimeStamp());
			msgSearch.setH03SCRCOD("01");
			msgSearch.setH03OPECOD("0004");
			msgSearch.setE03NUMACC(userPO.getIdentifier());

			mp.sendMessage(msgSearch);

			MessageRecord newmessage = mp.receiveMessageRecord();
			ELEERRMessage msgError = new ELEERRMessage();
			if (mp.hasError(newmessage)) {
				msgError = (ELEERRMessage) newmessage;
			}

			//ELEERRMessage msgError = (ELEERRMessage) mp
			//		.receiveMessageRecord("ELEERR");
			JBObjList list = mp.receiveMessageRecordList("E03INDOPE");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				StringBuffer myRow = null;
				BigDecimal days = new BigDecimal("0.00");
				BigDecimal interest = new BigDecimal("0.00");
				JBList beanList = new JBList();
				Iterator iterator = list.iterator();
				while (iterator.hasNext()) {
					MessageRecord msg = (MessageRecord) iterator.next();
					  //EDL030003Message msgList = (EDL030003Message) iterator.next();
				      if (msg.getFormatName().equals("EDL030003")) {
				    	  EDL030003Message msgList = (EDL030003Message) msg;
					interest =
							interest.add(msgList.getBigDecimalE03INTAMN());
						days = days.add(msgList.getBigDecimalE03NUMDYS());

						myRow = new StringBuffer("<TR>");
						myRow.append(
							"<TD NOWRAP ALIGN=\"CENTER\">"
								+ Util.formatCustomDate(user.getE01DTF(),
																		msgList.getBigDecimalE03INIDTM().intValue(),
																		msgList.getBigDecimalE03INIDTD().intValue(),
																		msgList.getBigDecimalE03INIDTY().intValue())	
								+ "</TD>");
						myRow.append(
							"<TD NOWRAP ALIGN=CENTER>"
								+ Util.formatCustomDate(user.getE01DTF(),
																		msgList.getBigDecimalE03ENDDTM().intValue(),
																		msgList.getBigDecimalE03ENDDTD().intValue(),
																		msgList.getBigDecimalE03ENDDTY().intValue())	

								+ "</TD>");
						myRow.append(
							"<TD NOWRAP ALIGN=\"CENTER\">"
								+ Util.formatCell(msgList.getE03TRACDE())
								+ "</TD>");
						myRow.append(
							"<TD NOWRAP ALIGN=RIGHT>"
								+ Util.fcolorCCY(msgList.getE03PRIAMN())
								+ "</TD>");
						myRow.append(
							"<TD NOWRAP ALIGN=RIGHT>"
								+ Util.fcolorCCY(msgList.getE03INTRTE())
								+ "</TD>");
						myRow.append(
							"<TD NOWRAP ALIGN=RIGHT>"
								+ Util.formatCell(msgList.getE03NUMDYS())
								+ "</TD>");
						myRow.append(
							"<TD NOWRAP ALIGN=RIGHT>"
								+ Util.fcolorCCY(msgList.getE03INTAMN())
								+ "</TD>");
						myRow.append("</TR>");
						beanList.addRow("", myRow.toString());
				}
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				beanList.setLastRec(list.getLastRec());
				
				userPO.setHeader19(days.toString());
				userPO.setHeader20(Util.fcolorCCY(interest.toString()));
				
				session.setAttribute("cifList", beanList);
				
				pageName = "EDL0300_cd_int_an.jsp";
			}

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqPrintList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0300", req);
			EDL030001Message msgSearch = (EDL030001Message) mp.getMessageRecord("EDL030001");
			msgSearch.setH01USERID(user.getH01USR());
			msgSearch.setH01PROGRM("EDL0300");
			msgSearch.setH01TIMSYS(getTimeStamp());
			msgSearch.setH01SCRCOD("01");
			msgSearch.setH01OPECOD("0004");
			msgSearch.setH01FLGWK1("P");
			msgSearch.setE01NUMREC("0");
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
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "EDL0300_st_list_fp.jsp";
			} else {
				StringBuffer myRow = null;
				String trOType = "";
				String trIType = "";
				String trPType = "";
				String trLType = "";
				String strPrincipal = "";
				String strInterest = "";
				String strMora = "";
				String strOther = "";
				BigDecimal principal = new BigDecimal("0.00");
				BigDecimal interest = new BigDecimal("0.00");
				BigDecimal mora = new BigDecimal("0.00");
				BigDecimal other = new BigDecimal("0.00");
				JBList beanList = new JBList();
				Iterator iterator = list.iterator();
				while (iterator.hasNext()) {
					MessageRecord msg = (MessageRecord) iterator.next();
					if (msg.getFormatName().equals("EDL030002")) {
						session.setAttribute("stBalances", msg);
					} else if (msg.getFormatName().equals("EDL030001")) {
						EDL030001Message msgList = (EDL030001Message) msg;
						
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

						myRow = new StringBuffer("<TR>");
						myRow.append(
							"<TD NOWRAP ALIGN=\"CENTER\">"
								+ Util.formatCustomDate(user.getE01DTF(),
																		msgList.getBigDecimalE01DATE11().intValue(),
																		msgList.getBigDecimalE01DATE12().intValue(),
																		msgList.getBigDecimalE01DATE13().intValue())	
								+ "</TD>");
						myRow.append(
							"<TD NOWRAP ALIGN=CENTER>"
								+ Util.formatCustomDate(user.getE01DTF(),
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
							"<TD NOWRAP ALIGN=LEFT>"
								+ Util.formatCell(trPType)
								+ "</TD>");
						myRow.append(
							"<TD NOWRAP ALIGN=RIGHT>"
								+ Util.formatCell(strInterest)
								+ "</TD>");
						myRow.append(
							"<TD NOWRAP ALIGN=LEFT>"
								+ Util.formatCell(trIType)
								+ "</TD>");
						myRow.append(
							"<TD NOWRAP ALIGN=RIGHT>"
								+ Util.formatCell(msgList.getE01TRABTH())
								+ "</TD>");
						myRow.append(
							"<TD NOWRAP ALIGN=RIGHT>"
								+ Util.formatCell(msgList.getE01TRAACR())
								+ "</TD>");
						myRow.append("</TR>");
						beanList.addRow("", myRow.toString());
					}
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				beanList.setLastRec(list.getLastRec());
				
				userPO.setHeader19(Util.fcolorCCY(principal.toString()));
				userPO.setHeader20(Util.fcolorCCY(interest.toString()));
				
				session.setAttribute("cifList", beanList);
				
				pageName = "EDL0300_st_list_print_fp.jsp";
			}

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0300", req);
			EDL030001Message msgSearch = (EDL030001Message) mp.getMessageRecord("EDL030001");
			msgSearch.setH01USERID(user.getH01USR());
			msgSearch.setH01PROGRM("EDL0300");
			msgSearch.setH01TIMSYS(getTimeStamp());
			msgSearch.setH01SCRCOD("01");
			msgSearch.setH01OPECOD("0004");
			try {
				int posi = Integer.parseInt(req.getParameter("Pos"));
				msgSearch.setE01NUMREC("" + posi);
			} catch (Exception e) {
				msgSearch.setE01NUMREC("0");
			}
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
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE", "E01NUMREC");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "EDL0300_st_selection.jsp";
			} else {
				StringBuffer myRow = null;
				String strPrincipal = "";
				String strInterest = "";
				String strMora = "";
				String strOther = "";
				String trIType = "";
				String trPType = "";
				String trLType = "";
				String trOType = "";
				BigDecimal principal = new BigDecimal("0.00");
				BigDecimal interest = new BigDecimal("0.00");
				BigDecimal mora = new BigDecimal("0.00");
				BigDecimal other = new BigDecimal("0.00");
				String DT1 = "";
				String DT2 = "";
				String DT3 = "";
				JBList beanList = new JBList();
				Iterator iterator = list.iterator();
				while (iterator.hasNext()) {
					MessageRecord msg = (MessageRecord) iterator.next();
					if (msg.getFormatName().equals("EDL030002")) {
						session.setAttribute("stBalances", msg);
					} else if (msg.getFormatName().equals("EDL030001")) {
						EDL030001Message msgList = (EDL030001Message) msg;
						
						strPrincipal = "&nbsp;";
						strInterest = "&nbsp;";
						strMora = "&nbsp;";
						strOther = "&nbsp;";
						trOType = "&nbsp;";
						trIType = "&nbsp;";
						trPType = "&nbsp;";
						trLType = "&nbsp;";

						if (msgList.getE01TRAAPC().equals("P")) {
							if (msgList.getE01TRADCC().equals("0")) {
								strPrincipal =
									Util.fcolorCCY(msgList.getE01TRAAMT());
								principal =
									principal.subtract(
										msgList.getBigDecimalE01TRAAMT());

							} else if (
								msgList.getE01TRADCC().equals("5")) {
								strPrincipal =
									"  "
										+ Util.fcolorCCY(
											msgList.getE01TRAAMT());
								trPType = "CR";

								principal =
									principal.add(
										msgList.getBigDecimalE01TRAAMT());
							}

						} else if (msgList.getE01TRAAPC().equals("I")) {
							if (msgList.getE01TRADCC().equals("0")) {
								strInterest =
									Util.fcolorCCY(msgList.getE01TRAAMT());
								interest =
									interest.subtract(
										msgList.getBigDecimalE01TRAAMT());

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

							}

						} else if (msgList.getE01TRAAPC().equals("L")) {
							if (msgList.getE01TRADCC().equals("0")) {
								strMora =
									Util.fcolorCCY(msgList.getE01TRAAMT());
								mora =
									mora.subtract(
										msgList.getBigDecimalE01TRAAMT());

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

							}

						} else if (msgList.getE01TRAAPC().equals("O")) {
							if (msgList.getE01TRADCC().equals("0")) {
								strOther =
									Util.fcolorCCY(msgList.getE01TRAAMT());
								other =
									other.subtract(
										msgList.getBigDecimalE01TRAAMT());

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

							}
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
								"<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:GetBatchDet('"
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
									+ datapro.eibs.master.Util.formatCustomDate(user.getE01DTF(),
                                                                               msgList.getBigDecimalE01DATE11().intValue(),
                                                                               msgList.getBigDecimalE01DATE12().intValue(),
                                                                               msgList.getBigDecimalE01DATE13().intValue())
									+ "</A></TD>");
							myRow.append(
								"<TD NOWRAP ALIGN=CENTER>"
									+ Util.formatCustomDate(user.getE01DTF(),
                                                                                msgList.getBigDecimalE01DATE21().intValue(),
                                                                                msgList.getBigDecimalE01DATE22().intValue(),
                                                                                msgList.getBigDecimalE01DATE23().intValue())
									+ "</TD>");
						} else {
							myRow.append(
								"<TD NOWRAP ALIGN=\"CENTER\">"
									+ Util.formatCustomDate(user.getE01DTF(),
                                                                                msgList.getBigDecimalE01DATE11().intValue(),
                                                                                msgList.getBigDecimalE01DATE12().intValue(),
                                                                                msgList.getBigDecimalE01DATE13().intValue())
									+ "</TD>");
							myRow.append(
								"<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:GetBatchDet('"
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
									+ Util.formatCustomDate(user.getE01DTF(),
                                                                                msgList.getBigDecimalE01DATE21().intValue(),
                                                                                msgList.getBigDecimalE01DATE22().intValue(),
                                                                                msgList.getBigDecimalE01DATE23().intValue())
									+ "</A></TD>");
						}
						myRow.append(
							"<TD NOWRAP ALIGN=\"CENTER\">"
								+ Util.formatCustomDate(user.getE01DTF(),
                                                                            msgList.getBigDecimalE01TRAPDM().intValue(),
                                                                            msgList.getBigDecimalE01TRAPDD().intValue(),
                                                                            msgList.getBigDecimalE01TRAPDY().intValue())
								+ "</TD>");
						myRow.append(
							"<TD NOWRAP ALIGN=\"CENTER\">"
								+ Util.formatCell(msgList.getE01TRACDE())
								+ "</TD>");
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
									    + Util.formatCustomDate(user.getE01DTF(),
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
							"<TD NOWRAP ALIGN=RIGHT>"
								+ Util.formatCell(strPrincipal)
								+ "</TD>");
						myRow.append(
							"<TD NOWRAP ALIGN=LEFT>"
								+ Util.formatCell(trPType)
								+ "</TD>");
						myRow.append(
							"<TD NOWRAP ALIGN=RIGHT>"
								+ Util.formatCell(strInterest)
								+ "</TD>");
						myRow.append(
							"<TD NOWRAP ALIGN=LEFT>"
								+ Util.formatCell(trIType)
								+ "</TD>");
						myRow.append(
							"<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:GetBatchDet('"
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
							"<TD NOWRAP ALIGN=CENTER>"
								+ msgList.getE01TRATMS()
								+ "</TD>");
						myRow.append(
							"<TD NOWRAP>"
								+ Util.formatCell(msgList.getE01TRAUSA())
								+ "</TD>");
						myRow.append(
							"<TD NOWRAP ALIGN=CENTER>"
								+ Util.formatCell(msgList.getE01TRAOBK())
								+ "</TD>");
						myRow.append(
							"<TD NOWRAP ALIGN=CENTER>"
								+ Util.formatCell(msgList.getE01TRAOBR())
								+ "</TD>");
						//myRow.append("<TD NOWRAP ALIGN=CENTER>" + Util.formatCell(msgList.getE01TRAACR()) + "</TD>");
						myRow.append("</TR>");
						beanList.addRow("", myRow.toString());
					}
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				beanList.setLastRec(list.getLastRec());
				
				userPO.setHeader19(Util.fcolorCCY(principal.toString()));
				userPO.setHeader20(Util.fcolorCCY(interest.toString()));
				
				session.setAttribute("cifList", beanList);
				
				pageName = "EDL0300_st_list_fp.jsp";
			}

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionSearch(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		try {
			userPO.setHeader8(req.getParameter("E01VALBTH").trim());
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			userPO.setHeader9(req.getParameter("E01FRDTEM").trim());
			userPO.setHeader10(req.getParameter("E01FRDTED").trim());
			userPO.setHeader11(req.getParameter("E01FRDTEY").trim());
		} catch (Exception e) {
			userPO.setHeader9("");
			userPO.setHeader10("");
			userPO.setHeader11("");
		}
		try {
			userPO.setHeader12(req.getParameter("E01TODTEM").trim());
			userPO.setHeader13(req.getParameter("E01TODTED").trim());
			userPO.setHeader14(req.getParameter("E01TODTEY").trim());
		} catch (Exception e) {
			userPO.setHeader12("");
			userPO.setHeader13("");
			userPO.setHeader14("");
		}
		try {
			userPO.setHeader17(req.getParameter("E01FRAMNT").trim());
		} catch (Exception e) {
		}
		try {
			userPO.setHeader18(req.getParameter("E01TOAMNT").trim());
		} catch (Exception e) {
		}

		session.setAttribute("userPO", userPO);

		procReqList(user, req, res, session);
	}

	private void procReqSearch(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		forward("EDL0300_st_selection.jsp", req, res);
	}	

}

	
	