package datapro.eibs.client;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.DataNavTotals;
import datapro.eibs.beans.EGL042001Message;
import datapro.eibs.beans.EGL042101Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;

public class JSEGL0421 extends JSEIBSServlet {

	// GL Statement options
	protected static final int R_LIST 				= 1;
	protected static final int R_PRINT 				= 3;
	// entering options
	protected static final int R_SELECTION			= 100;
	protected static final int A_SELECTION 			= 200;
	
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
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procActionSelection(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos	userPO = getUserPos(req);
		userPO.setBank(req.getParameter("E01TRABNK") == null ? "" : req.getParameter("E01TRABNK"));
		userPO.setBranch(req.getParameter("E01TRABRN") == null ? "" : req.getParameter("E01TRABRN"));
		userPO.setCurrency(req.getParameter("E01TRACCY") == null ? "" : req.getParameter("E01TRACCY").toUpperCase());
		userPO.setAccNum(req.getParameter("E01TRAGLN") == null ? "" : req.getParameter("E01TRAGLN"));
		userPO.setHeader7(req.getParameter("E01HISCYC") == null ? "" : req.getParameter("E01HISCYC"));
		userPO.setHeader8(req.getParameter("E01VALBTH") == null ? "" : req.getParameter("E01VALBTH"));
		userPO.setHeader9(req.getParameter("E01FRDTEM") == null ? "" : req.getParameter("E01FRDTEM"));
	 	userPO.setHeader10(req.getParameter("E01FRDTED") == null ? "" : req.getParameter("E01FRDTED"));
	 	userPO.setHeader11(req.getParameter("E01FRDTEY") == null ? "" : req.getParameter("E01FRDTEY"));
	 	userPO.setHeader12(req.getParameter("E01TODTEM") == null ? "" : req.getParameter("E01TODTEM"));
	 	userPO.setHeader13(req.getParameter("E01TODTED") == null ? "" : req.getParameter("E01TODTED"));
	 	userPO.setHeader14(req.getParameter("E01TODTEY") == null ? "" : req.getParameter("E01TODTEY"));
	 	userPO.setHeader15(req.getParameter("E01FRREFN") == null ? "" : req.getParameter("E01FRREFN"));
	 	userPO.setHeader16(req.getParameter("E01TOREFN") == null ? "" : req.getParameter("E01TOREFN"));
	 	userPO.setHeader17(req.getParameter("E01FRAMNT") == null ? "" : req.getParameter("E01FRAMNT"));
	 	userPO.setHeader18(req.getParameter("E01TOAMNT") == null ? "" : req.getParameter("E01TOAMNT"));

		session.setAttribute("userPO", userPO);
		
		procReqList(user, req, res, session);
	}

	private void procReqSelection(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("GL");
		userPO.setPurpose("STATEMENT");
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		
		forward("EGL0420_st_selection.jsp", req, res);
	}

	private void procReqPrintList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EGL0421", req);
			EGL042001Message msgSearch = (EGL042001Message) mp.getMessageRecord("EGL042001");
			msgSearch.setH01USERID(user.getH01USR());
		 	msgSearch.setH01PROGRM("EGL0420");
		 	msgSearch.setH01TIMSYS(getTimeStamp());
		 	msgSearch.setH01SCRCOD("01");
		 	msgSearch.setH01OPECOD("0004");
		 	msgSearch.setH01FLGWK1("P");
			try {
				msgSearch.setE01NUMREC(req.getParameter("Pos").trim());
			} catch (Exception e){
				msgSearch.setE01NUMREC("0");
			}
			
			try {
			 	msgSearch.setE01TRABNK(userPO.getBank());
			} catch (Exception e){
			 	msgSearch.setE01TRABNK("");
			}
			try {
			 	msgSearch.setE01TRABRN(userPO.getBranch());
			} catch (Exception e){
			 	msgSearch.setE01TRABRN("");
			}
			try {
			 	msgSearch.setE01TRACCY(userPO.getCurrency());
			} catch (Exception e){
			 	msgSearch.setE01TRACCY("");
			}
			try {
			 	msgSearch.setE01TRAGLN(userPO.getAccNum());
			} catch (Exception e) {
			 	msgSearch.setE01TRAGLN("");
			}
			try {
				msgSearch.setE01HISCYC(userPO.getHeader7());
			} catch (Exception e) {
				msgSearch.setE01HISCYC("");
			}
			try {
				msgSearch.setE01VALBTH(userPO.getHeader8());
			} catch (Exception e) {
				msgSearch.setE01VALBTH("");
			}
			try {
			 	msgSearch.setE01FRDTEM(userPO.getHeader9());
			 	msgSearch.setE01FRDTED(userPO.getHeader10());
			 	msgSearch.setE01FRDTEY(userPO.getHeader11());
			} catch (Exception e) {
			 	msgSearch.setE01FRDTEM("0");
			 	msgSearch.setE01FRDTED("0");
			 	msgSearch.setE01FRDTEY("0");
			}
			try {
			 	msgSearch.setE01TODTEM(userPO.getHeader12());
			 	msgSearch.setE01TODTED(userPO.getHeader13());
			 	msgSearch.setE01TODTEY(userPO.getHeader14());
			} catch (Exception e) {
			 	msgSearch.setE01TODTEM("0");
			 	msgSearch.setE01TODTED("0");
			 	msgSearch.setE01TODTEY("0");
			}
			try {
			 	msgSearch.setE01FRREFN(userPO.getHeader15());
			} catch (Exception e) {
			 	msgSearch.setE01FRREFN("");
			}
			try {
			 	msgSearch.setE01TOREFN(userPO.getHeader16());
			} catch (Exception e) {
			 	msgSearch.setE01TOREFN("");
			}
			try {
			 	msgSearch.setE01FRAMNT(userPO.getHeader17());
			} catch (Exception e) {
			 	msgSearch.setE01FRAMNT("");
			}
			try {
			 	msgSearch.setE01TOAMNT(userPO.getHeader18());
			} catch (Exception e) {
			 	msgSearch.setE01TOAMNT("");
			}
			
			mp.sendMessage(msgSearch);
			ELEERRMessage msgError = new ELEERRMessage();
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE", "E01NUMREC");
			
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
				pageName = "EGL0420_st_selection.jsp";
			} else {
				list.initRow();
				boolean firstTime = true;
				StringBuffer myRow = null;
				String strDebit = "";
				String strCredit = "";
				BigDecimal debit = new BigDecimal("0");
				BigDecimal credit = new BigDecimal("0");
				int countDebit = 0;
				int countCredit = 0;
				JBList beanList = new JBList();
				while (list.getNextRow()) {
					EGL042001Message msgList = (EGL042001Message) list.getRecord();
					if ("0".equals(msgList.getE01TRADCC())) {
						countDebit++;
						debit = debit.add(msgList.getBigDecimalE01TRAAMT());
						strDebit = Util.fcolorCCY(msgList.getE01TRAAMT());
						strCredit = "&nbsp;";
					} else if ("5".equals(msgList.getE01TRADCC())) {
						countCredit ++;
						credit = credit.add(msgList.getBigDecimalE01TRAAMT());
						strDebit = "&nbsp;";
						strCredit = Util.fcolorCCY(msgList.getE01TRAAMT());
					}
					if (firstTime) {
						firstTime = false;
						userPO.setHeader21(msgList.getE01ENDBAL());
						if ("V".equals(msgList.getE01VALBTH())) {
							pageName = "EGL0420_st_list_print_fv.jsp";
						} else if ("B".equals(msgList.getE01VALBTH())) {
							pageName = "EGL0420_st_list_print_fp.jsp";
						}
					}
					myRow = new StringBuffer("<TR>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\">" + Util.formatCustomDate(user.getE01DTF(),
																	  msgList.getBigDecimalE01DATE1M().intValue(),
																	  msgList.getBigDecimalE01DATE1D().intValue(),
																	  msgList.getBigDecimalE01DATE1Y().intValue()) + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=\"RIGHT\">" + Util.formatCell(msgList.getE01TRAACC()) + "</TD>");
					if (msgList.getE01NUMNAR().equals("0")) {
						myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01TRANAR()) + "</TD>");
					} else {
					    if (msgList.getE01NUMNAR().trim().equals("1")) {
					    	myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01TRANAR()) + "<BR>"+ Util.formatCell(msgList.getE01TRANA1()) + "</TD>");
					    } else if(msgList.getE01NUMNAR().trim().equals("2")) {
					    	myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01TRANAR()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA1()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA2()) + "</TD>");
						} else if(msgList.getE01NUMNAR().trim().equals("3")) {
						     myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01TRANAR()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA1()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA2()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA3()) + "</TD>");
						} else if(msgList.getE01NUMNAR().trim().equals("4")) {
						     myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01TRANAR()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA1()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA2()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA3()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA4()) + "</TD>");
						} else if(msgList.getE01NUMNAR().trim().equals("5")) {
						     myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01TRANAR()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA1()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA2()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA3()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA4()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA5()) + "</TD>");
						} else if(msgList.getE01NUMNAR().trim().equals("6")) {
						     myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01TRANAR()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA1()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA2()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA3()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA4()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA5()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA6()) + "</TD>");
						} else if(msgList.getE01NUMNAR().trim().equals("7")) {
						     myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01TRANAR()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA1()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA2()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA3()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA4()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA5()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA6()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA7()) + "</TD>");
						} else if(msgList.getE01NUMNAR().trim().equals("8")) {
						     myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01TRANAR()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA1()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA2()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA3()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA4()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA5()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA6()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA7()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA8()) + "</TD>");
						} else if(msgList.getE01NUMNAR().trim().equals("9")) {
						     myRow.append("<TD NOWRAP>" + Util.formatCell(msgList.getE01TRANAR()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA1()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA2()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA3()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA4()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA5()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA6()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA7()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA8()) + "<BR>"
							 + Util.formatCell(msgList.getE01TRANA9()) + "</TD>");
						}
					}
					myRow.append("<TD NOWRAP ALIGN=RIGHT>" + strDebit + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=RIGHT>" + strCredit + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=RIGHT>" + Util.fcolorCCY(msgList.getE01ENDBAL()) + "</TD>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				userPO.setHeader19(Util.fcolorCCY(debit.toString()));
				userPO.setHeader20(Util.fcolorCCY(credit.toString()));
				userPO.setHeader22(countDebit +"");
				userPO.setHeader23(countCredit + "");
				
				session.setAttribute("glList", beanList);
			}
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			
			forward(pageName, req, res);	
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procReqList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		
		DataNavTotals dataDC = null;
		if (req.getParameter("FlagMov") == null) { 
			dataDC = new DataNavTotals();
		} else {
			dataDC = (DataNavTotals) session.getAttribute("dataBTH");
			if ("0".equals(req.getParameter("FlagMov"))) {
				dataDC.setIndex(dataDC.getIndex() - 1);
			}
		}
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EGL0421", req);
			EGL042101Message msgSearch = (EGL042101Message) mp.getMessageRecord("EGL042101");
			msgSearch.setH01USERID(user.getH01USR());
		 	msgSearch.setH01PROGRM("EGL0421");
		 	msgSearch.setH01TIMSYS(getTimeStamp());
		 	msgSearch.setH01SCRCOD("01");
		 	msgSearch.setH01OPECOD("0004");
			try {
				msgSearch.setE01NUMREC(req.getParameter("Pos").trim());
			} catch (Exception e){
				msgSearch.setE01NUMREC("0");
			}
			
			try {
				msgSearch.setE01SELBTH(req.getParameter("BTH").trim());
			} catch (Exception e){
				msgSearch.setE01SELBTH("");
			}
			try {
			 	msgSearch.setE01SELDTM(req.getParameter("DT1").trim());
			 	msgSearch.setE01SELDTD(req.getParameter("DT2").trim());
			 	msgSearch.setE01SELDTY(req.getParameter("DT3").trim());
			} catch (Exception e){
			 	msgSearch.setE01SELDTM("0");
			 	msgSearch.setE01SELDTD("0");
			 	msgSearch.setE01SELDTY("0");
			}
			try {
				msgSearch.setE01SELACR(req.getParameter("ACR").trim());
			} catch (Exception e){
				msgSearch.setE01SELACR("");
			}
			
			mp.sendMessage(msgSearch);
			ELEERRMessage msgError = new ELEERRMessage();
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE", "E01NUMREC");
			
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
				pageName = "EGL0420_st_selection.jsp";
			} else {
				session.setAttribute("bthList", list);
				String params = "?Batch="+req.getParameter("BTH")
								+ "&Date1=" + req.getParameter("DT1")
								+ "&Date2=" + req.getParameter("DT2")
								+ "&Date3=" + req.getParameter("DT3")
								+ "&Ref=" + req.getParameter("ACR");	
				pageName = "EGL0421_batch_detail.jsp" + params;
			}
			String flagMovString = (req.getParameter("FlagMov")!= null ?req.getParameter("FlagMov"):"");
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("dataBTH", dataDC);
			req.setAttribute("FlagMov", flagMovString);
		
			forward(pageName, req, res);	
		} finally {
			if (mp != null)	mp.close();
		}
	}

}
