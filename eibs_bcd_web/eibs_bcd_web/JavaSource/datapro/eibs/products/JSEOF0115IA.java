package datapro.eibs.products;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: David Mavilla
 */
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EOF011501Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0120DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;

public class JSEOF0115IA extends JSEIBSServlet {

	// certificate of deposit
	
	protected static final int R_BASIC		    = 1;
	protected static final int A_BASIC		    = 2;
	protected static final int R_LIST_HELP		= 3;
	protected static final int R_LIST_LEDGER		= 5;
	protected static final int R_LIST_PRINT		= 7;
	


	// entering options
	protected static final int R_LIST_NEW		    = 100;
	protected static final int R_ENTER_MAINT		= 300;

	protected static final int A_LIST_NEW		    = 200;
	protected static final int A_ENTER_MAINT		= 400;
	protected static final int A_INQUIRY			= 500;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen) {
		// BEGIN Off. Chk
		// Request
		case R_BASIC :
			break;	
		
		case R_LIST_LEDGER :
			procReqListLedger(user, req, res, session);
			break;	
			
		// END Off. Check

		// BEGIN Entering
		// Request
		case R_ENTER_MAINT : 
			procReqEnterMaint(user, req, res, session);
			break;
		case R_LIST_PRINT : 
			procReqPrint(user, req, res, session);
			break;	
			
		
		// Action 
		case A_ENTER_MAINT : 
			procActionEnterMaint(user, req, res, session);
			break;
		case A_INQUIRY : 
			procActionInquiry(user, req, res, session);
			break;
		
			
		// END Entering

		default :
			forward(devPage, req, res);
			break;
		}
	}

	private void procActionInquiry(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EOF0115", req);
			EOF011501Message msgOffChk = (EOF011501Message) mp.getMessageRecord("EOF011501");
		 	msgOffChk.setH01USERID(user.getH01USR());
		 	msgOffChk.setH01PROGRM("EOF0115");
		 	msgOffChk.setH01TIMSYS(getTimeStamp());
		 	msgOffChk.setH01SCRCOD("01");
		 	msgOffChk.setH01OPECOD("0002");
		 	msgOffChk.setH01FLGWK1("I");
			
			try {
				msgOffChk.setE01OFMCKN(userPO.getIdentifier().trim());
			} catch (Exception e)	{
				msgOffChk.setE01OFMCKN("0");
			}
			try {
				msgOffChk.setE01OFMCCY(userPO.getCurrency().trim());
			} catch (Exception e){
				msgOffChk.setE01OFMCCY("");
			}

			mp.sendMessage(msgOffChk);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE", "E01NUMREC");

			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				JBList beanList = new JBList();
				if (!list.isEmpty()) {
					StringBuffer myRow = null;
					String strDebit = "";
					String strCredit = "";
					BigDecimal debit = new BigDecimal("0.00");
					BigDecimal credit = new BigDecimal("0.00");
					Iterator iterator = list.iterator();
					while (iterator.hasNext()) {
						MessageRecord msg = (MessageRecord) iterator.next();
						if (msg.getFormatName().equals("EOF011501")) {
							userPO.setOption(msgOffChk.getE01SELTIP());
							userPO.setIdentifier(msgOffChk.getE01OFMCKN());
							userPO.setCurrency(msgOffChk.getE01OFMCCY());
							userPO.setHeader5(msgOffChk.getE01OFMEMM());
							userPO.setHeader6(msgOffChk.getE01OFMEMD());
							userPO.setHeader7(msgOffChk.getE01OFMEMY());
							userPO.setHeader8(msgOffChk.getE01OFMAMT());
							userPO.setHeader9(msgOffChk.getE01OFMBNF());
							userPO.setHeader10(msgOffChk.getE01OFMBN1());
							userPO.setHeader11(msgOffChk.getE01LETAMT());
							userPO.setHeader12(msgOffChk.getE01OFMCO1());
							userPO.setHeader13(msgOffChk.getE01OFMCO2());
							userPO.setHeader14(msgOffChk.getE01OFMCO3());
							userPO.setHeader19("2");
							userPO.setHeader20(msgOffChk.getE01OFMBTH());
							userPO.setHeader21(user.getE01DTF());
							userPO.setHeader22(user.getE01LAN());
							
							session.setAttribute("offBasic", msgOffChk);
						} else if (msg.getFormatName().equals("EWD0120DS")) {
							EWD0120DSMessage msgList = (EWD0120DSMessage) msg;
							if (msgList.getE01WRKDCC().equals("D")) {
								debit = debit.add(msgList.getBigDecimalE01WRKAMT());
								strDebit = Util.fcolorCCY(msgList.getE01WRKAMT());
								strCredit = "&nbsp;";
							} else if (msgList.getE01WRKDCC().equals("C")) {
								credit = credit.add(msgList.getBigDecimalE01WRKAMT());
								strDebit = "&nbsp;";
								strCredit = Util.fcolorCCY(msgList.getE01WRKAMT());
							}
							 if(msgList.getE01WRKDCC().equals("T")){
	                             strDebit = Util.fcolorCCY(msgList.getE01WRKTDB());
	                             strCredit = Util.fcolorCCY(msgList.getE01WRKTDC());
	                         }
							if(!msgList.getE01WRKDCC().equals("T")){
								myRow = new StringBuffer("<TR>");
								myRow.append("<TD NOWRAP ALIGN=center>" + Util.formatCell(msgList.getE01WRKBNK()) + "</TD>");
								myRow.append("<TD NOWRAP ALIGN=center>" + Util.formatCell(msgList.getE01WRKBRN()) + "</TD>");
								myRow.append("<TD NOWRAP ALIGN=center>" + Util.formatCell(msgList.getE01WRKCCY()) + "</TD>");
								myRow.append("<TD NOWRAP ALIGN=left>" + Util.formatCell(msgList.getE01WRKGLN()) + "</TD>");
								myRow.append("<TD NOWRAP ALIGN=RIGHT>" + Util.formatCell(msgList.getE01WRKACC()) + "</TD>");
								myRow.append("<TD NOWRAP ALIGN=RIGHT>" + Util.formatCell(msgList.getE01WRKCCN()) + "</TD>");
								myRow.append("<TD NOWRAP ALIGN=center>" + Util.formatCell(msgList.getE01WRKCDE()) + "</TD>");
								myRow.append("<TD NOWRAP ALIGN=left>" + Util.formatCell(msgList.getE01WRKTDS()) + "</TD>");					
								myRow.append("<TD NOWRAP ALIGN=RIGHT>" + strDebit + "</TD>");
								myRow.append("<TD NOWRAP ALIGN=RIGHT>" + strCredit + "</TD>");										
								myRow.append("</TR>");
							
							 }else{
	                             myRow = new StringBuffer("<TR>");
	                             myRow.append("<TH NOWRAP ALIGN=center>"
											+ "" + "</TH>");
									myRow.append("<TH NOWRAP ALIGN=center>"
											+ "" + "</TH>");
									myRow.append("<TH NOWRAP ALIGN=center>"
											+ "" + "</TH>");
									myRow.append("<TH NOWRAP ALIGN=left>"
											+ "" + "</TH>");
									myRow.append("<TH NOWRAP ALIGN=RIGHT>"
											+ "" + "</TH>");
									myRow.append("<TH NOWRAP ALIGN=RIGHT>"
											+ "" + "</TH>");
									myRow.append("<TH NOWRAP ALIGN=center>"
											+ "" + "</TH>");
									myRow.append("<TH NOWRAP ALIGN=left>"
											+ Util.formatCell(msgList
													.getE01WRKTDS()) + "</TH>");
									myRow.append("<TH NOWRAP ALIGN=RIGHT>"
											+ strDebit + "</TH>");
									myRow.append("<TH NOWRAP ALIGN=RIGHT>"
											+ strCredit + "</TH>");										
	                             myRow.append("</TR>");
	                         }
							beanList.addRow("", myRow.toString());
						}
					}
					beanList.setFirstRec(list.getFirstRec());
					beanList.setLastRec(list.getLastRec());
					beanList.setShowPrev(list.getShowPrev());
					beanList.setShowNext(list.getShowNext());
				}
				session.setAttribute("ledList", beanList);
				pageName = "EOF0115_of_chk_cont.jsp";
			}
			
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EOF0115", req);
			EOF011501Message msgOffChk = (EOF011501Message) mp.getMessageRecord("EOF011501");
			msgOffChk.setH01USERID(user.getH01USR());
			msgOffChk.setH01PROGRM("EOF0115");
			msgOffChk.setH01TIMSYS(getTimeStamp());
			msgOffChk.setH01SCRCOD("01");
			msgOffChk.setH01OPECOD("0002");
			msgOffChk.setH01FLGWK1("I");
			try {
				msgOffChk.setE01OFMCKN(req.getParameter("ACCNUM").trim());
			} catch (Exception e)	{
				msgOffChk.setE01OFMCKN("0");
			}
			try {
				msgOffChk.setE01OFMCCY(req.getParameter("Currency").toUpperCase());
			} catch (Exception e){
				msgOffChk.setE01OFMCCY("");
			}

			mp.sendMessage(msgOffChk);
			procReqListLedger(user, req, res, session);
			
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqPrint(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos userPO = getUserPos(req);
		res.sendRedirect(srctx + "/servlet/datapro.eibs.reports.JSEFRM000?SCREEN=3&E01OFMCKN=" + userPO.getIdentifier() + "&E01OFMCCY=" + userPO.getCurrency());
	}

	private void procReqEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setOption("OCK");
		userPO.setPurpose("MAINTENANCE");
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		
		forward("EOF0115_of_chk_enter_maint.jsp", req, res);
	}

	private void procReqListLedger(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EOF0115", req);
			EOF011501Message msgOffChk = (EOF011501Message) mp.getMessageRecord("EOF011501");
			msgOffChk.setH01USERID(user.getH01USR());
		 	msgOffChk.setH01PROGRM("EOF0115");
		 	msgOffChk.setH01TIMSYS(getTimeStamp());
		 	msgOffChk.setH01SCRCOD("01");
		 	msgOffChk.setH01OPECOD("0005");
		 	
		 	setMessageRecord(req, msgOffChk);

			mp.sendMessage(msgOffChk);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE", "E01NUMREC");

			if (mp.hasError(msgError)) {
				pageName = "EOF0115_of_chk_basic.jsp";
			} else {
				JBList beanList = new JBList();
				if (!list.isEmpty()) {
					StringBuffer myRow = null;
					String strDebit = "";
					String strCredit = "";
					BigDecimal debit = new BigDecimal("0.00");
					BigDecimal credit = new BigDecimal("0.00");
					Iterator iterator = list.iterator();
					while (iterator.hasNext()) {
						MessageRecord msg = (MessageRecord) iterator.next();
						if (msg.getFormatName().equals("EOF011501")) {
							userPO.setOption(msgOffChk.getE01SELTIP());
							userPO.setIdentifier(msgOffChk.getE01OFMCKN());
							userPO.setCurrency(msgOffChk.getE01OFMCCY());
							userPO.setHeader5(msgOffChk.getE01OFMEMM());
							userPO.setHeader6(msgOffChk.getE01OFMEMD());
							userPO.setHeader7(msgOffChk.getE01OFMEMY());
							userPO.setHeader8(msgOffChk.getE01OFMAMT());
							userPO.setHeader9(msgOffChk.getE01OFMBNF());
							userPO.setHeader10(msgOffChk.getE01OFMBN1());
							userPO.setHeader11(msgOffChk.getE01LETAMT());
							userPO.setHeader12(msgOffChk.getE01OFMCO1());
							userPO.setHeader13(msgOffChk.getE01OFMCO2());
							userPO.setHeader14(msgOffChk.getE01OFMCO3());
							userPO.setHeader19("2");
							userPO.setHeader20(msgOffChk.getE01OFMBTH());
							userPO.setHeader21(user.getE01DTF());
							userPO.setHeader22(user.getE01LAN());
							
							session.setAttribute("offBasic", msgOffChk);
						} else if (msg.getFormatName().equals("EWD0120DS")) {
							EWD0120DSMessage msgList = (EWD0120DSMessage) msg;
							if (msgList.getE01WRKDCC().equals("D")) {
								debit = debit.add(msgList.getBigDecimalE01WRKAMT());
								strDebit = Util.fcolorCCY(msgList.getE01WRKAMT());
								strCredit = "&nbsp;";
							} else if (msgList.getE01WRKDCC().equals("C")) {
								credit = credit.add(msgList.getBigDecimalE01WRKAMT());
								strDebit = "&nbsp;";
								strCredit = Util.fcolorCCY(msgList.getE01WRKAMT());
							}
							myRow = new StringBuffer("<TR>");
							myRow.append("<TD NOWRAP ALIGN=center>" + Util.formatCell(msgList.getE01WRKBNK()) + "</TD>");
							myRow.append("<TD NOWRAP ALIGN=center>" + Util.formatCell(msgList.getE01WRKBRN()) + "</TD>");
							myRow.append("<TD NOWRAP ALIGN=center>" + Util.formatCell(msgList.getE01WRKCCY()) + "</TD>");
							myRow.append("<TD NOWRAP ALIGN=left>" + Util.formatCell(msgList.getE01WRKGLN()) + "</TD>");
							myRow.append("<TD NOWRAP ALIGN=RIGHT>" + Util.formatCell(msgList.getE01WRKACC()) + "</TD>");
							myRow.append("<TD NOWRAP ALIGN=RIGHT>" + Util.formatCell(msgList.getE01WRKCCN()) + "</TD>");
							myRow.append("<TD NOWRAP ALIGN=center>" + Util.formatCell(msgList.getE01WRKCDE()) + "</TD>");
							myRow.append("<TD NOWRAP ALIGN=left>" + Util.formatCell(msgList.getE01WRKTDS()) + "</TD>");					
							myRow.append("<TD NOWRAP ALIGN=RIGHT>" + strDebit + "</TD>");
							myRow.append("<TD NOWRAP ALIGN=RIGHT>" + strCredit + "</TD>");										
							myRow.append("</TR>");
							beanList.addRow("", myRow.toString());
						}
					}
					beanList.setFirstRec(list.getFirstRec());
					beanList.setLastRec(list.getLastRec());
					beanList.setShowPrev(list.getShowPrev());
					beanList.setShowNext(list.getShowNext());
				}
				session.setAttribute("ledList", beanList);
				pageName = "EOF0115_of_chk_cont.jsp";
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