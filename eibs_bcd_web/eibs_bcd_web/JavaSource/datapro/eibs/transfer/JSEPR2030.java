package datapro.eibs.transfer;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: Orestes Garcia
 */
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDD009001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EPR200001Message;
import datapro.eibs.beans.EPR203001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;

public class JSEPR2030 extends JSEIBSServlet {

	// CIF options
	protected static final int R_LIST 	= 1;
	protected static final int R_SEARCH = 2;
	protected static final int A_SEARCH = 3;
	protected static final int R_PRINT 	= 4;
	protected static final int R_DESC 	= 5;

	// entering options
	protected static final int R_ENTER 	= 100;
	protected static final int A_ENTER 	= 200;
	
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
			//entering options
		default :
			forward(devPage, req, res);
			break;
		}
	}

	private void procReqList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPR2030", req);
			EPR203001Message msgSearch = (EPR203001Message) mp.getMessageRecord("EPR203001");
			msgSearch.setH01USERID(user.getH01USR());
			msgSearch.setH01PROGRM("EPR2030");
			msgSearch.setH01TIMSYS(getTimeStamp());
			msgSearch.setH01SCRCOD("01");
			msgSearch.setH01OPECOD("0004");
			int posi = 0;
			try {
				posi = Integer.parseInt(req.getParameter("Pos"));
			} catch (Exception e) {
				posi = 0;
			}
			msgSearch.setE01NUMREC("" + posi);
			msgSearch.setE01NUMACC(userPO.getIdentifier());
			msgSearch.setE01HISCYC(userPO.getHeader7());
			msgSearch.setE01VALBTH(userPO.getHeader8());
			msgSearch.setE01FRDTE1(userPO.getHeader9());
			msgSearch.setE01FRDTE2(userPO.getHeader10());
			msgSearch.setE01FRDTE3(userPO.getHeader11());
			msgSearch.setE01TODTE1(userPO.getHeader12());
			msgSearch.setE01TODTE2(userPO.getHeader13());
			msgSearch.setE01TODTE3(userPO.getHeader14());
			msgSearch.setE01FRCHKN(userPO.getHeader15());
			msgSearch.setE01TOCHKN(userPO.getHeader16());
			msgSearch.setE01FRAMNT(userPO.getHeader17());
			msgSearch.setE01TOAMNT(userPO.getHeader18());

			mp.sendMessage(msgSearch);
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "EPR2030_st_selection.jsp";
			} else {
				JBList beanList = new JBList();
				boolean firstTime = true;
				StringBuffer myRow = null;
				String chk = "";
				String grpData = "";
				String grpDate = "";
				String strDebit = "";
				String strCredit = "";
				String chknum = "";
				String DT1 = "";
				String DT2 = "";
				String DT3 = "";
				int scr = 0;
				String acnu = "";
				String checkgraph = "";
				BigDecimal debit = new BigDecimal("0");
				BigDecimal credit = new BigDecimal("0");
				Iterator iterator = list.iterator();
				while (iterator.hasNext()) {
					EPR203001Message msgList = (EPR203001Message) iterator.next();
					if (firstTime) {
						firstTime = false;
						beanList.setFirstRec(
							Integer.parseInt(msgList.getE01NUMREC()));
						grpData = msgList.getE01ENDBAL();
						grpDate =
							Util.formatDate(
								msgList.getE01DATE21(),
								msgList.getE01DATE22(),
								msgList.getE01DATE23());
						if (posi == 0) {
							userPO.setHeader5(msgList.getE01BEGBAL());
						}
						if (msgList.getE01VALBTH().equals("V")) {
							pageName = "EPR2030_st_list_fv.jsp";
						} else if (msgList.getE01VALBTH().equals("B")) {
							pageName = "EPR2030_st_list_fp.jsp";
						}
						chk = "checked";
					} else {
						chk = "";
						grpData =
							grpData + "|" + msgList.getE01ENDBAL();
						grpDate =
							grpDate
								+ "|"
								+ Util.formatDate(
									msgList.getE01DATE21(),
									msgList.getE01DATE22(),
									msgList.getE01DATE23());

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

					chknum = Util.addLeftChar('0', 6, msgList.getE01TRACKN());
					acnu = Util.addLeftChar('0', 9, msgList.getE01NUMACC());

					if (chknum.equals("000000")) {
						checkgraph = "";
					} else {
						checkgraph =
								"<A HREF=\"javascript:showCheckImage('"
									+ acnu
									+ "','"
									+ chknum
									+ "')\">"
									+ chknum
									+ "</A>";
					}
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
								+ Util.formatDate(
									msgList.getE01DATE11(),
									msgList.getE01DATE12(),
									msgList.getE01DATE13())
								+ "</A></TD>");
					} else {
						myRow.append(
							"<TD NOWRAP ALIGN=\"CENTER\">"
								+ Util.formatDate(
									msgList.getE01DATE11(),
									msgList.getE01DATE12(),
									msgList.getE01DATE13())
								+ "</TD>");
					}
					myRow.append(
						"<TD NOWRAP ALIGN=\"CENTER\">"
							+ Util.formatDate(
								msgList.getE01TRAPD1(),
								msgList.getE01TRAPD2(),
								msgList.getE01TRAPD3())
							+ "</TD>");

					if (msgList.getE01TRACDE().equals("CK")
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
								+ Util.formatDate(
									msgList.getE01DATE11(),
									msgList.getE01DATE12(),
									msgList.getE01DATE13())
								+ "','"
								+ Util.formatCell(msgList.getE01TRACDE())
								+ "')\">"
								+ Util.formatCell(msgList.getE01TRANAR())
								+ "</A></TD>");
					}

					myRow.append(
						"<TD NOWRAP ALIGN=RIGHT>"
							+ strCredit
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
					if (userPO.getHeader8().equals("V")) {
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
								+ Util.formatDate(
									msgList.getE01DATE21(),
									msgList.getE01DATE22(),
									msgList.getE01DATE23())
								+ "</A></TD>");
					} else {
						myRow.append(
							"<TD NOWRAP ALIGN=CENTER>"
								+ Util.formatDate(
									msgList.getE01DATE21(),
									msgList.getE01DATE22(),
									msgList.getE01DATE23())
								+ "</TD>");
					}
					
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setShowPrev(list.getShowPrev());
				beanList.setShowNext(list.getShowNext());
				
				userPO.setHeader19(Util.fcolorCCY(debit.toString()));
				userPO.setHeader20(Util.fcolorCCY(credit.toString()));
				userPO.setHeader21(grpData);
				userPO.setHeader22(grpDate);
				
				session.setAttribute("cifList", beanList);
			}
			
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
			// TODO: handle exception
		}
		try {
			userPO.setHeader12(req.getParameter("E01TODTE1").trim());
			userPO.setHeader13(req.getParameter("E01TODTE2").trim());
			userPO.setHeader14(req.getParameter("E01TODTE3").trim());
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			userPO.setHeader15(req.getParameter("E01FRCHKN").trim());
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			userPO.setHeader16(req.getParameter("E01TOCHKN").trim());
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			userPO.setHeader17(req.getParameter("E01FRAMNT").trim());
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			userPO.setHeader18(req.getParameter("E01TOAMNT").trim());
		} catch (Exception e) {
			// TODO: handle exception
		}

		procReqList(user, req, res, session);
	}

	private void procReqSearch(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			int row = Integer.parseInt(req.getParameter("ROW"));
			JBObjList prList = (JBObjList) session.getAttribute("prList");
			EPR200001Message prBasic = (EPR200001Message) prList.get(row);
			userPO.setIdentifier(prBasic.getE01PRPCAC());
			
			mp = getMessageProcessor("EDD0090", req);
			EDD009001Message msgRT = (EDD009001Message) mp.getMessageRecord("EDD009001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDD0090");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0002");			
			msgRT.setE01ACMACC(userPO.getIdentifier());

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgRT = (EDD009001Message) mp.receiveMessageRecord("EDD009001");

			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				userPO.setIdentifier(msgRT.getE01ACMACC());
				userPO.setHeader1(msgRT.getE01ACMPRO());
				userPO.setCusNum(msgRT.getE01ACMCUN());
				userPO.setHeader2(msgRT.getE01ACMCUN());
				userPO.setHeader3(msgRT.getE01CUSNA1());
				userPO.setCurrency(msgRT.getE01ACMCCY());
				userPO.setOfficer(msgRT.getE01ACMOFC() + " - " + msgRT.getE01DSCOFC());
				pageName = "EPR2030_st_selection.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

}