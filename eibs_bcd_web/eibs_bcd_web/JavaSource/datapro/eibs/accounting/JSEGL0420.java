package datapro.eibs.accounting;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: erodriguez
 */
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EGL042001Message;
import datapro.eibs.beans.EGL042002Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;

public class JSEGL0420 extends JSEIBSServlet {

	// GL Statement options
	protected static final int R_LIST = 1;
	protected static final int R_PRINT = 3;
	protected static final int R_EXCEL = 5;

	// entering options
	protected static final int R_SELECTION = 100;
	protected static final int A_SELECTION = 200;
	protected static final int R_COMEBACK  = 300;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen) {
		case R_LIST :
			procReqList(user, req, res, session);
			break;
		case R_PRINT :
			procReqPrintList(user, req, res, session);
			break;
			// Entering Options
		case R_SELECTION :
			procReqSelection(user, req, res, session);
			break;
		case A_SELECTION :
			procActionSelection(user, req, res, session);
			break;
		case R_COMEBACK :
			forward("EGL0420_st_selection.jsp", req, res);
			break;
		case R_EXCEL :
			procReqExcelList(user, req, res, session);
			break;
		default :
			forward(devPage, req, res);
			break;
		}
	}

	private void procReqExcelList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) {
		// TODO Auto-generated method stub
		
	}

	private void procActionSelection(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		try {
			userPO.setBank(req.getParameter("E01TRABNK").trim());
		} catch (Exception e) {
		}
		try {
			userPO.setBranch(req.getParameter("E01TRABRN").trim());
		} catch (Exception e) {
		}
		try {
			userPO.setCurrency(req.getParameter("E01TRACCY").toUpperCase());
		} catch (Exception e) {
		}
		try {
			userPO.setAccNum(req.getParameter("E01TRAGLN").trim());
		} catch (Exception e) {
		}
		try {
			userPO.setHeader7(req.getParameter("E01HISCYC").trim());
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			userPO.setHeader8(req.getParameter("E01VALBTH").trim());
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			userPO.setHeader9(req.getParameter("E01FRDTE1").trim());
			userPO.setHeader10(req.getParameter("E01FRDTE2").trim());
			userPO.setHeader11(req.getParameter("E01FRDTE3").trim());
		} catch (Exception e) {
			userPO.setHeader9("");
			userPO.setHeader10("");
			userPO.setHeader11("");
		}
		try {
			userPO.setHeader12(req.getParameter("E01TODTE1").trim());
			userPO.setHeader13(req.getParameter("E01TODTE2").trim());
			userPO.setHeader14(req.getParameter("E01TODTE3").trim());
		} catch (Exception e) {
			userPO.setHeader12("");
			userPO.setHeader13("");
			userPO.setHeader14("");
		}
		try {
			userPO.setHeader15(req.getParameter("E01FRREFN").trim());
		} catch (Exception e) {
		}
		try {
			userPO.setHeader16(req.getParameter("E01TOREFN").trim());
		} catch (Exception e) {
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

	private void procReqSelection(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("GL");
		userPO.setPurpose("STATEMENT");
		session.setAttribute("userPO", userPO);
		
		forward("EGL0420_st_selection.jsp", req, res);
	}

	private void procReqPrintList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		int startPos = 0;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EGL0420", req);
			EGL042001Message msgSearch = (EGL042001Message) mp.getMessageRecord("EGL042001");
			msgSearch.setH01USERID(user.getH01USR());
			msgSearch.setH01PROGRM("EGL0420");
			msgSearch.setH01TIMSYS(getTimeStamp());
			msgSearch.setH01SCRCOD("01");
			msgSearch.setH01OPECOD("0004");
			msgSearch.setH01FLGWK1("P");

			try {
				startPos = Integer.parseInt(req.getParameter("Pos"));
				msgSearch.setE01NUMREC("" + startPos);
			} catch (Exception e) {
			}

			msgSearch.setE01TRABNK(userPO.getBank());
			msgSearch.setE01TRABRN(userPO.getBranch());
			msgSearch.setE01TRACCY(userPO.getCurrency());
			msgSearch.setE01TRAGLN(userPO.getAccNum());
			msgSearch.setE01HISCYC(userPO.getHeader7());
			msgSearch.setE01VALBTH(userPO.getHeader8());
			msgSearch.setE01FRDTEM(userPO.getHeader9());
			msgSearch.setE01FRDTED(userPO.getHeader10());
			msgSearch.setE01FRDTEY(userPO.getHeader11());
			msgSearch.setE01TODTEM(userPO.getHeader12());
			msgSearch.setE01TODTED(userPO.getHeader13());
			msgSearch.setE01TODTEY(userPO.getHeader14());
			msgSearch.setE01FRREFN(userPO.getHeader15());
			msgSearch.setE01TOREFN(userPO.getHeader16());
			msgSearch.setE01FRAMNT(userPO.getHeader17());
			msgSearch.setE01TOAMNT(userPO.getHeader18());

			mp.sendMessage(msgSearch);
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE", "E01NUMREC");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "EGL0420_st_selection.jsp";
			} else {
				boolean firstTime = true;
				StringBuffer myRow = null;
				String strDebit = "";
				String strCredit = "";
				BigDecimal debit = new BigDecimal("0.00");
				BigDecimal credit = new BigDecimal("0.00");
				int countDebit = 0;
				int countCredit = 0;
				JBList beanList = new JBList();
				Iterator iterator = list.iterator();
				while (iterator.hasNext()) {
					MessageRecord msg = (MessageRecord) iterator.next();
					if (msg.getFormatName().equals("EGL042002")) {
						session.setAttribute("stGLBal", msg);
					} else if (msg.getFormatName().equals("EGL042001")) {
						EGL042001Message msgList = (EGL042001Message) msg;
						if (firstTime) {
							firstTime = false;
							if (startPos == 0) {
								userPO.setHeader5(msgList.getE01BEGBAL());
							}
							userPO.setHeader21(msgList.getE01ENDBAL());
							if (msgList.getE01VALBTH().equals("V")) {
								pageName = "EGL0420_st_list_print_fv.jsp";
							} else if (msgList.getE01VALBTH().equals("B")) {
								pageName = "EGL0420_st_list_print_fp.jsp";
							} else {
								pageName = devPage;
							}
						}
						strDebit = "&nbsp;";
						strCredit = "&nbsp;";

						if ("0".equals(msgList.getE01TRADCC())) {
							debit =
								debit.add(msgList.getBigDecimalE01TRAAMT());
							strDebit =
								Util.fcolorCCY(msgList.getE01TRAAMT());
							countDebit++;
						} else if ("5".equals(msgList.getE01TRADCC())) {
							credit =
								credit.add(
									msgList.getBigDecimalE01TRAAMT());
							strCredit =
								Util.fcolorCCY(msgList.getE01TRAAMT());
							countCredit++;
						}

						myRow = new StringBuffer("<TR>");
						myRow.append("<TD NOWRAP ALIGN=\"CENTER\">"
							+ Util.formatCustomDate(user.getE01DTF(),
									msgList.getBigDecimalE01DATE1M().intValue(),
									msgList.getBigDecimalE01DATE1D().intValue(),
									msgList.getBigDecimalE01DATE1Y().intValue())
							+ "</TD>");
						myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">"
							+ Util.formatCell(msgList.getE01TRAACC())
							+ "</TD>");
						if (msgList.getE01NUMNAR().equals("0")) {
							myRow.append("<TD NOWRAP>"
								+ Util.formatCell(msgList.getE01TRANAR())
								+ "</TD>");
						} else {
							if (msgList
								.getE01NUMNAR()
								.trim()
								.equals("1")) {
								myRow.append("<TD NOWRAP>"
									+ Util.formatCell(msgList.getE01TRANAR())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA1())
									+ "</TD>");
							} else if (
								msgList.getE01NUMNAR().trim().equals(
									"2")) {
								myRow.append("<TD NOWRAP>"
									+ Util.formatCell(msgList.getE01TRANAR())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA1())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA2())
									+ "</TD>");
							} else if (
								msgList.getE01NUMNAR().trim().equals(
									"3")) {
								myRow.append("<TD NOWRAP>"
									+ Util.formatCell(msgList.getE01TRANAR())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA1())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA2())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA3())
									+ "</TD>");
							} else if (
								msgList.getE01NUMNAR().trim().equals(
									"4")) {
								myRow.append("<TD NOWRAP>"
									+ Util.formatCell(msgList.getE01TRANAR())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA1())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA2())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA3())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA4())
									+ "</TD>");
							} else if (
								msgList.getE01NUMNAR().trim().equals(
									"5")) {
								myRow.append("<TD NOWRAP>"
									+ Util.formatCell(msgList.getE01TRANAR())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA1())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA2())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA3())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA4())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA5())
									+ "</TD>");
							} else if (
								msgList.getE01NUMNAR().trim().equals(
									"6")) {
								myRow.append("<TD NOWRAP>"
									+ Util.formatCell(msgList.getE01TRANAR())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA1())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA2())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA3())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA4())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA5())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA6())
									+ "</TD>");
							} else if (
								msgList.getE01NUMNAR().trim().equals(
									"7")) {
								myRow.append("<TD NOWRAP>"
									+ Util.formatCell(msgList.getE01TRANAR())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA1())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA2())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA3())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA4())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA5())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA6())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA7())
									+ "</TD>");
							} else if (
								msgList.getE01NUMNAR().trim().equals(
									"8")) {
								myRow.append("<TD NOWRAP>"
									+ Util.formatCell(msgList.getE01TRANAR())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA1())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA2())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA3())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA4())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA5())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA6())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA7())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA8())
									+ "</TD>");
							} else if (
								msgList.getE01NUMNAR().trim().equals(
									"9")) {
								myRow.append("<TD NOWRAP>"
									+ Util.formatCell(msgList.getE01TRANAR())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA1())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA2())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA3())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA4())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA5())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA6())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA7())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA8())
									+ "<BR>"
									+ Util.formatCell(msgList.getE01TRANA9())
									+ "</TD>");
							}
						}

						myRow.append("<TD NOWRAP ALIGN=RIGHT>"
							+ strDebit
							+ "</TD>");
						myRow.append("<TD NOWRAP ALIGN=RIGHT>"
							+ strCredit
							+ "</TD>");
						myRow.append("<TD NOWRAP ALIGN=RIGHT>"
							+ Util.fcolorCCY(msgList.getE01ENDBAL())
							+ "</TD>");
						myRow.append("</TR>");
						beanList.addRow("", myRow.toString());
					}
				}
				
				beanList.setFirstRec(list.getFirstRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				beanList.setLastRec(list.getLastRec());
				
				userPO.setHeader19(Util.fcolorCCY(debit.toString()));
				userPO.setHeader20(Util.fcolorCCY(credit.toString()));
				userPO.setHeader22(countDebit + "");
				userPO.setHeader23(countCredit + "");
				
				session.setAttribute("glList", beanList);
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
		int startPos = 0;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EGL0420", req);
			EGL042001Message msgSearch = (EGL042001Message) mp.getMessageRecord("EGL042001");
			msgSearch.setH01USERID(user.getH01USR());
			msgSearch.setH01PROGRM("EGL0420");
			msgSearch.setH01TIMSYS(getTimeStamp());
			msgSearch.setH01SCRCOD("01");
			msgSearch.setH01OPECOD("0004");

			try {
				startPos = Integer.parseInt(req.getParameter("Pos"));
				msgSearch.setE01NUMREC("" + startPos);
			} catch (Exception e) {
			}

			msgSearch.setE01TRABNK(userPO.getBank());
			msgSearch.setE01TRABRN(userPO.getBranch());
			msgSearch.setE01TRACCY(userPO.getCurrency());
			msgSearch.setE01TRAGLN(userPO.getAccNum());
			msgSearch.setE01HISCYC(userPO.getHeader7());
			msgSearch.setE01VALBTH(userPO.getHeader8());
			msgSearch.setE01FRDTEM(userPO.getHeader9());
			msgSearch.setE01FRDTED(userPO.getHeader10());
			msgSearch.setE01FRDTEY(userPO.getHeader11());
			msgSearch.setE01TODTEM(userPO.getHeader12());
			msgSearch.setE01TODTED(userPO.getHeader13());
			msgSearch.setE01TODTEY(userPO.getHeader14());
			msgSearch.setE01FRREFN(userPO.getHeader15());
			msgSearch.setE01TOREFN(userPO.getHeader16());
			msgSearch.setE01FRAMNT(userPO.getHeader17());
			msgSearch.setE01TOAMNT(userPO.getHeader18());

			mp.sendMessage(msgSearch);
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE", "E01NUMREC");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "EGL0420_st_selection.jsp";
			} else {
				boolean firstTime = true;
				StringBuffer myRow = null;
				String strDebit = "";
				String strCredit = "";
				BigDecimal debit = new BigDecimal("0.00");
				BigDecimal credit = new BigDecimal("0.00");
				String DT1 = "";
				String DT2 = "";
				String DT3 = "";
				JBList beanList = new JBList();
				Iterator iterator = list.iterator();
				while (iterator.hasNext()) {
					MessageRecord msg = (MessageRecord) iterator.next();
					if (msg.getFormatName().equals("EGL042002")) {
						EGL042002Message msgHeader = (EGL042002Message) msg;
						session.setAttribute("stGLBal", msgHeader);
					} else if (msg.getFormatName().equals("EGL042001")) {
						EGL042001Message msgList = (EGL042001Message) msg;
						if (firstTime) {
							firstTime = false;
							if (startPos == 0) {
								userPO.setHeader5(msgList.getE01BEGBAL());
							}
						}
						strDebit = "&nbsp;";
						strCredit = "&nbsp;";
						if ("0".equals(msgList.getE01TRADCC())) {
							debit =
								debit.add(msgList.getBigDecimalE01TRAAMT());
							strDebit =
								Util.fcolorCCY(msgList.getE01TRAAMT());
						} else if ("5".equals(msgList.getE01TRADCC())) {
							credit =
								credit.add(
									msgList.getBigDecimalE01TRAAMT());
							strCredit =
								Util.fcolorCCY(msgList.getE01TRAAMT());
						}

						String Future = "";

						if (msgList.getE01TRACNU().equals("1")) {
							Future = "<Font Color='BLACK'>" + "Future"
									+ "</Font>";
						} else {
							Future = "";
						}
						
						myRow = new StringBuffer("<TR>");
						myRow.append("<TD NOWRAP ALIGN=\"CENTER\">"
							+ datapro.eibs.master.Util.formatCustomDate(user.getE01DTF(),msgList.getBigDecimalE01DATE1M().intValue(),msgList.getBigDecimalE01DATE1D().intValue(),msgList.getBigDecimalE01DATE1Y().intValue())  + "</TD>");
						myRow.append("<TD NOWRAP ALIGN=\"CENTER\">"
								+ Util.formatCell(Future) + "</TD>");
						myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">"
							+ Util.formatCell(msgList.getE01TRAACC())
							+ "</TD>");
						myRow.append("<TD NOWRAP ALIGN=\"CENTER\">"
							+ Util.formatCell(msgList.getE01TRACDE())
							+ "</TD>");
						if (msgList.getE01TRADRR().equals("0")) {
							myRow.append("<TD NOWRAP>"
								+ Util.formatCell(msgList.getE01TRANAR())
								+ "</TD>");
						} else {
							myRow.append("<TD NOWRAP><A HREF=\"javascript:GetStatDesc('"
								+ msgList.getE01TRADRR()
								+ "','"
								+ msgList.getE01TRANAR()
								+ "','"
								+ datapro.eibs.master.Util.formatCustomDate(user.getE01DTF(),msgList.getBigDecimalE01DATE1M().intValue(),msgList.getBigDecimalE01DATE1D().intValue(),msgList.getBigDecimalE01DATE1Y().intValue())  
								
								+ "','"
								+ Util.formatCell(msgList.getE01TRACDE())
								+ "')\">"
								+ Util.formatCell(msgList.getE01TRANAR())
								+ "</A></TD>");
						}
						myRow.append("<TD NOWRAP ALIGN=RIGHT>"
							+ strDebit
							+ "</TD>");
						myRow.append("<TD NOWRAP ALIGN=RIGHT>"
							+ strCredit
							+ "</TD>");
						myRow.append("<TD NOWRAP ALIGN=RIGHT>"
							+ Util.fcolorCCY(msgList.getE01ENDBAL())
							+ "</TD>");
						
						DT1 = (userPO.getHeader8().equals("B")) ? msgList
								.getE01DATE1M() : msgList.getE01DATE2M();
						DT2 = (userPO.getHeader8().equals("B")) ? msgList
								.getE01DATE1D() : msgList.getE01DATE2D();
						DT3 = (userPO.getHeader8().equals("B")) ? msgList
								.getE01DATE1Y() : msgList.getE01DATE2Y();

						myRow.append("<TD NOWRAP ALIGN=CENTER><A HREF=\"javascript:GetBatchDet('"
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
								+ Util.formatCell(msgList
										.getE01TRABTH())
								+ "</A></TD>");					
				

						
						myRow.append("<TD NOWRAP ALIGN=CENTER>"
							+ datapro.eibs.master.Util.formatCustomDate(user.getE01DTF(),msgList.getBigDecimalE01DATE2M().intValue(),msgList.getBigDecimalE01DATE2D().intValue(),msgList.getBigDecimalE01DATE2Y().intValue())
							
							+ "</TD>");
						myRow.append("<TD NOWRAP ALIGN=CENTER>"
							+ Util.getTimeFromTimestamp(msgList.getE01TRATMS())
							+ "</TD>");
						myRow.append("<TD NOWRAP>"
							+ Util.formatCell(msgList.getE01TRAUSA())
							+ "</TD>");
						myRow.append("<TD NOWRAP ALIGN=CENTER>"
							+ Util.formatCell(msgList.getE01TRAOBK())
							+ "</TD>");
						myRow.append("<TD NOWRAP ALIGN=CENTER>"
							+ Util.formatCell(msgList.getE01TRAOBR())
							+ "</TD>");
						myRow.append("</TR>");
						beanList.addRow("", myRow.toString());
					}
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				beanList.setLastRec(list.getLastRec());
				
				userPO.setHeader19(Util.fcolorCCY(debit.toString()));
				userPO.setHeader20(Util.fcolorCCY(credit.toString()));
				
				session.setAttribute("glList", beanList);
				
				if ("V".equals(userPO.getHeader8())) {
					pageName = "EGL0420_st_list_fv.jsp";
				} else if ("B".equals(userPO.getHeader8())) {
					pageName = "EGL0420_st_list_fp.jsp";
				} else {
					pageName = devPage;
				}
			}

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

}