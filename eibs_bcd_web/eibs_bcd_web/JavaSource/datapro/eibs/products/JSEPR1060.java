package datapro.eibs.products;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EPR010001Message;
import datapro.eibs.beans.EPR020001Message;
import datapro.eibs.beans.EPR106001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBListRec;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;

public class JSEPR1060 extends JSEIBSServlet {

	protected static final int A_MAINTENANCE = 4;
	protected static final int A_SEARCH = 5;
	protected static final int A_SEARCH_T = 10;
	protected static final int R_INQUIRY_MAINT = 3; 
	protected static final int R_SEARCH = 1;
	protected static final int R_LIST = 2;
	protected static final int R_LOGS = 7;
	protected static final int R_LIST_INCOMING = 9;
	protected static final int R_LIST_PAYMENT = 13;
	protected static final int R_LIST_OPENING_CD = 15;
	protected static final int R_LIST_OPENING_RT = 17;
	protected static final int R_LIST_OPENING_SV = 19;
	protected static final int R_LIST_OPENING_LN = 21;	
	protected static final int R_INCOMING = 11;	
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			// BEGIN PR
			// Request
			case R_SEARCH :
				procReqSearch(user, req, res, session);
				break;
			case R_INQUIRY_MAINT :
				procReqInqMaint(user, req, res, session);
				break;
			case R_INCOMING :
				procReqIncomingMaint(user, req, res, session);
				break;	
			case R_LIST :
				procReqList(user, req, res, session);
				break;
			case R_LIST_INCOMING :
				procReqListIncoming(user, req, res, session);
				break;	
			case R_LIST_PAYMENT :
				procReqListPayment(user, req, res, session);
				break;	
			case R_LIST_OPENING_CD :
				procReqListOpeningCD(user, req, res, session);
				break;	
			case R_LIST_OPENING_RT :
				procReqListOpeningRT(user, req, res, session);
				break;	
			case R_LIST_OPENING_LN :
				procReqListOpeningLN(user, req, res, session);
				break;	
			case R_LIST_OPENING_SV :
				procReqListOpeningSV(user, req, res, session);
				break;	
				
				// Action
			case A_SEARCH :
				procActionSearch(user, req, res, session);
				break;
			case A_SEARCH_T :
				procActionSearchT(user, req, res, session);
				break;
				
			case R_LOGS :
				procReqLogsInquiry(user, req, res, session);
				break;						
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procReqSearch(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setPurpose("INQUIRY");
		
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		
		forward("EPR1060_pr_inq_search.jsp", req, res);
	}

	private void procReqInqMaint(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPR1060", req);
			EPR010001Message msgPR = (EPR010001Message) mp.getMessageRecord("EPR010001");
			msgPR.setH01USERID(user.getH01USR());
			msgPR.setH01PROGRM("EPR0000");
			msgPR.setH01TIMSYS(getTimeStamp());
			msgPR.setH01SCRCOD("01");
			msgPR.setH01OPECOD("0004");
			try {
				userPO.setIdentifier(req.getParameter("REFNUM").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			msgPR.setE01PRINUM(userPO.getIdentifier());

			mp.sendMessage(msgPR);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgPR = (EPR010001Message) mp.receiveMessageRecord("EPR010001");

			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				userPO.setIdentifier(msgPR.getE01PRINUM());
				userPO.setPurpose("INQUIRY");
				userPO.setOption("PR");
				pageName = "EPR0000_pr_inq_maint.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("prMant", msgPR);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqIncomingMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPR1060", req);
			EPR010001Message msgPR = (EPR010001Message) mp.getMessageRecord("EPR010001");
			msgPR.setH01USERID(user.getH01USR());
			msgPR.setH01PROGRM("EPR0000");
			msgPR.setH01TIMSYS(getTimeStamp());
			msgPR.setH01SCRCOD("01");
			msgPR.setH01OPECOD("0004");
			try {
				userPO.setIdentifier(req.getParameter("REFNUM").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			msgPR.setE01PRINUM(userPO.getIdentifier());

			mp.sendMessage(msgPR);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgPR = (EPR010001Message) mp.receiveMessageRecord("EPR010001");

			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				userPO.setIdentifier(msgPR.getE01PRINUM());
				userPO.setPurpose("MAINTENANCE");
				userPO.setOption("PR");
				pageName = "EPR0101_pr_incoming_maint.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("prMant", msgPR);

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
			mp = getMessageProcessor("EPR1060", req);
			EPR106001Message msgList = (EPR106001Message) session.getAttribute("schBean");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01OPECOD("9999");
			msgList.setH01FLGWK2("I");
			try {
				msgList.setE01NUMREC(req.getParameter("Pos").trim());
			} catch (Exception ex) {
				msgList.setE01NUMREC("0");
			}

			mp.sendMessage(msgList);
			MessageRecord msg = mp.receiveMessageRecord();

			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				pageName = "EPR1060_pr_inq_search.jsp";
			} else if ("EPR010001".equals(msg.getFormatName())) {
				userPO.setIdentifier(req.getParameter("E01SCHNUM"));
				session.setAttribute("prMant", msg);
				pageName = "EPR0000_pr_inq_maint.jsp";
			} else {	
				if (((EPR106001Message)msg).getE01INDOPE().equals("*")) {
					pageName = "MISC_no_result.jsp";
				} else {
					JBObjList list = mp.receiveMessageRecordList("E01INDOPE", "E01NUMREC");
					list.add(0, msg);
					userPO.setPurpose("INQUIRY");
					JBList beanList = new JBList();
					StringBuffer myRow = null;
					String chk = "";
					String priNum = "";
					String warnImg = "";
					String ofacImg = "";
					int indexRow = 0;
					boolean firstTime = true;
					Iterator iterator = list.iterator();
					while (iterator.hasNext()) {
						msgList = (EPR106001Message) iterator.next();
						if (firstTime) {
							firstTime = false;
							chk = "checked";
						} else {
							chk = msgList.getE01WRTNUM().trim().equals(priNum) ? "checked" : "";
						}
						if (msgList.getH01FLGWK3().trim().equals("3")) {
							ofacImg = "<IMG border=\"0\" src=\"" + req.getContextPath() + "/images/warning_16.jpg\" title=\"OFAC Match List\" onClick=\"showOfac('" + msgList.getE01WRTNUM() + "')\">";
						} else {
							ofacImg = "";
						}

						myRow = new StringBuffer("<TR>");
						myRow.append("<TD NOWRAP ALIGN=\"CENTER\" width=\"5%\"><input type=\"radio\" name=\"PRINUM\" value=\""
							+ msgList.getE01WRTNUM()
							+ "\" "
							+ chk
							+ " onclick=\"showAddInfo('"
							+ msgList.getE01WRTNUM()
							+ "',"
							+ indexRow
							+ ")\"></TD>");
						myRow.append("<TD NOWRAP ALIGN=\"CENTER\" width=\"10%\"><A HREF=\"javascript:goAction('"
							+ msgList.getE01WRTNUM()
							+ "')\">"
							+ Util.formatCell(msgList.getE01WRTNUM())
							+ "</A>" + warnImg + ofacImg + "</TD>");
						myRow.append("<TD NOWRAP ALIGN=\"CENTER\" width=\"15%\"><A HREF=\"javascript:goAction('"
							+ msgList.getE01WRTNUM()
							+ "')\">"
							+ msgList.getE01WRTSRF()
							+ "</A></TD>");							
						myRow.append("<TD NOWRAP ALIGN=\"CENTER\" width=\"10%\"><A HREF=\"javascript:goAction('"
							+ msgList.getE01WRTNUM()
							+ "')\">"
							+ msgList.getE01WRTCCY()
							+ "</A></TD>");
						myRow.append("<TD NOWRAP ALIGN=\"RIGHT\" width=\"15%\"><A HREF=\"javascript:goAction('"
							+ msgList.getE01WRTNUM()
							+ "')\">"
							+ Util.fcolorCCY(msgList.getE01WRTAMT())
							+ "</A></TD>");
						myRow.append("<TD NOWRAP ALIGN=\"CENTER\" width=\"15%\"><A HREF=\"javascript:goAction('"
							+ msgList.getE01WRTNUM()
							+ "')\">"
							+ Util.formatCell(msgList.getE01WRTSTS())
							+ "</A></TD>");
						myRow.append("<TD NOWRAP ALIGN=\"CENTER\" width=\"15%\"><A HREF=\"javascript:goAction('"
							+ msgList.getE01WRTNUM()
							+ "')\">"
							+ Util.formatCustomDate("DMY", 
								msgList.getE01WRTPD1(),
								msgList.getE01WRTPD2(),
								msgList.getE01WRTPD3())
							+ "</A>");
						myRow.append("<TD NOWRAP ALIGN=\"CENTER\" width=\"15%\"><A HREF=\"javascript:goAction('"
							+ msgList.getE01WRTNUM()
							+ "')\">"
							+ Util.formatCell(msgList.getE01WRTTCD())
							+ "</A>");
							
						myRow.append("<INPUT TYPE=HIDDEN NAME=\"TXTDATA"
							+ indexRow
							+ "\" VALUE=\""
							+ Util.formatCell(msgList.getE01WRTDAC()) + "<br>");
						myRow.append(Util.formatCell(msgList.getE01WRTCAC()) + "<br>");
						myRow.append(Util.formatCell(msgList.getE01WRTBYO()) + "<br>");
						myRow.append(Util.formatCell(msgList.getE01WRTBNF()) + "<br>");
						myRow.append(Util.formatCell(msgList.getE01WRTBBK()) + "<br>");
						myRow.append(Util.formatCell(msgList.getE01WRTORI()) + "\"></TD>");
						myRow.append("</TR>");
						indexRow++;
						beanList.addRow("", myRow.toString());
					}
					beanList.setFirstRec(list.getFirstRec());
					beanList.setShowNext(list.getShowNext());
					beanList.setShowPrev(list.getFirstRec() > 2);
					
					session.setAttribute("appList", beanList);
					pageName = "EPR1060_pr_inq_list.jsp";
				}
			}

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqListIncoming(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPR1060", req);
			EPR106001Message msgList = (EPR106001Message) mp.getMessageRecord("EPR106001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01OPECOD("0000");
			msgList.setH01FLGWK2("R");
			try {
				msgList.setE01NUMREC(req.getParameter("Pos").trim());
			} catch (Exception ex) {
				msgList.setE01NUMREC("0");
			}

			mp.sendMessage(msgList);
			MessageRecord msg = mp.receiveMessageRecord();

			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				pageName = "EPR1060_pr_inq_search.jsp";
			} else if ("EPR010001".equals(msg.getFormatName())) {
				session.setAttribute("prMant", msg);
				pageName = "EPR0101_pr_incoming_maint.jsp";
			} else {	
				if (((EPR106001Message)msg).getE01INDOPE().equals("*")) {
					pageName = "MISC_no_result.jsp";
				} else {
					JBObjList list = mp.receiveMessageRecordList("E01INDOPE", "E01NUMREC");
					list.add(0, msg);
					userPO.setPurpose("INQUIRY");
					JBList beanList = new JBList();
					StringBuffer myRow = null;
					String chk = "";
					String priNum = "";
					String warnImg = "";
					String ofacImg = "";
					int indexRow = 0;
					boolean firstTime = true;
					Iterator iterator = list.iterator();
					while (iterator.hasNext()) {
						msgList = (EPR106001Message) iterator.next();
						if (firstTime) {
							firstTime = false;
							chk = "checked";
						} else {
							chk = msgList.getE01WRTNUM().trim().equals(priNum) ? "checked" : "";
						}
						if (msgList.getH01FLGWK3().trim().equals("3")) {
							ofacImg = "<IMG border=\"0\" src=\"" + req.getContextPath() + "/images/warning_16.jpg\" title=\"OFAC Match List\" onClick=\"showOfac('" + msgList.getE01WRTNUM() + "')\">";
						} else {
							ofacImg = "";
						}
	
						myRow = new StringBuffer("<TR>");
						myRow.append("<TD NOWRAP><input type=\"radio\" name=\"PRINUM\" value=\""
							+ msgList.getE01WRTNUM()
							+ "\" "
							+ chk
							+ " onclick=\"showAddInfo('"
							+ msgList.getE01WRTNUM()
							+ "',"
							+ indexRow
							+ ")\"></TD>");
						myRow.append("<TD NOWRAP ALIGN=\"LEFT\"><A HREF=\"javascript:goAction('"
							+ msgList.getE01WRTNUM()
							+ "')\">"
							+ Util.formatCell(msgList.getE01WRTNUM())
							+ "</A>" + warnImg + ofacImg + "</TD>");
						myRow.append("<TD NOWRAP ALIGN=\"RIGHT\"><A HREF=\"javascript:goAction('"
							+ msgList.getE01WRTNUM()
							+ "')\">"
							+ Util.fcolorCCY(msgList.getE01WRTAMT())
							+ "</A></TD>");
						myRow.append("<INPUT TYPE=HIDDEN NAME=\"TXTDATA"
							+ indexRow
							+ "\" VALUE=\""
							+ Util.formatCell(msgList.getE01WRTDAC())
							+ "<br>");
						myRow.append(Util.formatCell(msgList.getE01WRTCAC()) + "<br>");
						myRow.append(Util.formatCell(msgList.getE01WRTBYO()) + "<br>");
						myRow.append(Util.formatCell(msgList.getE01WRTBNF()) + "<br>");
						myRow.append(Util.formatCell(msgList.getE01WRTBBK()) + "<br>");
						myRow.append(Util.formatCell(msgList.getE01WRTORI()) + "\"></TD>");
						myRow.append("</TR>");
						indexRow++;
						beanList.addRow("", myRow.toString());
					}
					beanList.setFirstRec(list.getFirstRec());
					beanList.setShowNext(list.getShowNext());
					beanList.setShowPrev(list.getFirstRec() > 2);
					
					session.setAttribute("appList", beanList);
					pageName = "EPR1060_pr_incoming_list.jsp";
				}	
			}

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqListPayment(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPR1060", req);
			EPR106001Message msgList = (EPR106001Message) mp.getMessageRecord("EPR106001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01OPECOD("0001");
			msgList.setH01FLGWK2("P");
			try {
				msgList.setE01NUMREC(req.getParameter("Pos").trim());
			} catch (Exception ex) {
				msgList.setE01NUMREC("0");
			}

			mp.sendMessage(msgList);
			MessageRecord msg = mp.receiveMessageRecord();

			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				pageName = "EPR1060_pr_inq_search.jsp";
			} else if ("EPR010001".equals(msg.getFormatName())) {
				session.setAttribute("prMant", msg);
				pageName = "EPR0101_pr_incoming_maint.jsp";
			} else {	
				if (((EPR106001Message)msg).getE01INDOPE().equals("*")) {
					pageName = "MISC_no_result.jsp";
				} else {
					JBObjList list = mp.receiveMessageRecordList("E01INDOPE", "E01NUMREC");
					list.add(0, msg);
					userPO.setPurpose("INQUIRY");
					JBList beanList = new JBList();
					StringBuffer myRow = null;
					String chk = "";
					String priNum = "";
					String warnImg = "";
					String ofacImg = "";
					int indexRow = 0;
					boolean firstTime = true;
					Iterator iterator = list.iterator();
					while (iterator.hasNext()) {
						msgList = (EPR106001Message) iterator.next();
						if (firstTime) {
							firstTime = false;
							chk = "checked";
						} else {
							chk = msgList.getE01WRTNUM().trim().equals(priNum) ? "checked" : "";
						}
						if (msgList.getH01FLGWK3().trim().equals("3")) {
							ofacImg = "<IMG border=\"0\" src=\"" + req.getContextPath() + "/images/warning_16.jpg\" title=\"OFAC Match List\" onClick=\"showOfac('" + msgList.getE01WRTNUM() + "')\">";
						} else {
							ofacImg = "";
						}
	
						myRow = new StringBuffer("<TR>");
						myRow.append("<TD NOWRAP><input type=\"radio\" name=\"PRINUM\" value=\""
							+ msgList.getE01WRTNUM()
							+ "\" "
							+ chk
							+ " onclick=\"showAddInfo('"
							+ msgList.getE01WRTNUM()
							+ "','"
							+ msgList.getE01WRTAMT()								
							+ "',"
							+ indexRow
							+ ")\"></TD>");
						myRow.append("<TD NOWRAP ALIGN=\"LEFT\"><A HREF=\"javascript:goAction('"
							+ msgList.getE01WRTNUM()
							+ "')\">"
							+ Util.formatCell(msgList.getE01WRTNUM())
							+ "</A>" + warnImg + ofacImg + "</TD>");
						myRow.append("<TD NOWRAP ALIGN=\"RIGHT\"><A HREF=\"javascript:goAction('"
							+ msgList.getE01WRTNUM()
							+ "')\">"
							+ Util.fcolorCCY(msgList.getE01WRTAMT())
							+ "</A></TD>");
						myRow.append("<INPUT TYPE=HIDDEN NAME=\"TXTDATA"
							+ indexRow
							+ "\" VALUE=\""
							+ Util.formatCell(msgList.getE01WRTDAC())
							+ "<br>");
						myRow.append(Util.formatCell(msgList.getE01WRTCAC()) + "<br>");
						myRow.append(Util.formatCell(msgList.getE01WRTBYO()) + "<br>");
						myRow.append(Util.formatCell(msgList.getE01WRTBNF()) + "<br>");
						myRow.append(Util.formatCell(msgList.getE01WRTBBK()) + "<br>");
						myRow.append(Util.formatCell(msgList.getE01WRTORI()) + "\"></TD>");
						myRow.append("</TR>");
						indexRow++;
						beanList.addRow("", myRow.toString());
					}
					beanList.setFirstRec(list.getFirstRec());
					beanList.setShowNext(list.getShowNext());
					beanList.setShowPrev(list.getFirstRec() > 2);
					
					session.setAttribute("appList", beanList);
					pageName = "EPR1060_pr_payment_list.jsp";
				}	
			}

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqListOpeningCD(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPR1060", req);
			EPR106001Message msgList = (EPR106001Message) mp.getMessageRecord("EPR106001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01OPECOD("0002");
			msgList.setH01FLGWK2("O");
			try {
				msgList.setE01NUMREC(req.getParameter("Pos").trim());
			} catch (Exception ex) {
				msgList.setE01NUMREC("0");
			}

			mp.sendMessage(msgList);
			MessageRecord msg = mp.receiveMessageRecord();

			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				pageName = "EPR1060_pr_inq_search.jsp";
			} else if ("EPR010001".equals(msg.getFormatName())) {
				session.setAttribute("prMant", msg);
				pageName = "EPR0101_pr_incoming_maint.jsp";
			} else {	
				if (((EPR106001Message)msg).getE01INDOPE().equals("*")) {
					pageName = "MISC_no_result.jsp";
				} else {
					JBObjList list = mp.receiveMessageRecordList("E01INDOPE", "E01NUMREC");
					list.add(0, msg);
					userPO.setPurpose("INQUIRY");
					JBList beanList = new JBList();
					StringBuffer myRow = null;
					String chk = "";
					String priNum = "";
					String warnImg = "";
					String ofacImg = "";
					int indexRow = 0;
					boolean firstTime = true;
					Iterator iterator = list.iterator();
					while (iterator.hasNext()) {
						msgList = (EPR106001Message) iterator.next();
						if (firstTime) {
							firstTime = false;
							chk = "checked";
						} else {
							chk = msgList.getE01WRTNUM().trim().equals(priNum) ? "checked" : "";
						}
						if (msgList.getH01FLGWK3().trim().equals("3")) {
							ofacImg = "<IMG border=\"0\" src=\"" + req.getContextPath() + "/images/warning_16.jpg\" title=\"OFAC Match List\" onClick=\"showOfac('" + msgList.getE01WRTNUM() + "')\">";
						} else {
							ofacImg = "";
						}
	
						myRow = new StringBuffer("<TR>");
						myRow.append("<TD NOWRAP><input type=\"radio\" name=\"PRINUM\" value=\""
							+ msgList.getE01WRTNUM()
							+ "\" "
							+ chk
							+ " onclick=\"showAddInfo('"
							+ msgList.getE01WRTNUM()
							+ "','"
							+ msgList.getE01WRTAMT()								
							+ "',"
							+ indexRow
							+ ")\"></TD>");
						myRow.append("<TD NOWRAP ALIGN=\"LEFT\"><A HREF=\"javascript:goAction('"
							+ msgList.getE01WRTNUM()
							+ "')\">"
							+ Util.formatCell(msgList.getE01WRTNUM())
							+ "</A>" + warnImg + ofacImg + "</TD>");
						myRow.append("<TD NOWRAP ALIGN=\"RIGHT\"><A HREF=\"javascript:goAction('"
							+ msgList.getE01WRTNUM()
							+ "')\">"
							+ Util.fcolorCCY(msgList.getE01WRTAMT())
							+ "</A></TD>");
						myRow.append("<INPUT TYPE=HIDDEN NAME=\"TXTDATA"
							+ indexRow
							+ "\" VALUE=\""
							+ Util.formatCell(msgList.getE01WRTDAC())
							+ "<br>");
						myRow.append(Util.formatCell(msgList.getE01WRTCAC()) + "<br>");
						myRow.append(Util.formatCell(msgList.getE01WRTBYO()) + "<br>");
						myRow.append(Util.formatCell(msgList.getE01WRTBNF()) + "<br>");
						myRow.append(Util.formatCell(msgList.getE01WRTBBK()) + "<br>");
						myRow.append(Util.formatCell(msgList.getE01WRTORI()) + "\"></TD>");
						myRow.append("</TR>");
						indexRow++;
						beanList.addRow("", myRow.toString());
					}
					beanList.setFirstRec(list.getFirstRec());
					beanList.setShowNext(list.getShowNext());
					beanList.setShowPrev(list.getFirstRec() > 2);
					
					session.setAttribute("appList", beanList);
					pageName = "EPR1060_pr_opening_cd_list.jsp";
				}	
			}

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqListOpeningRT(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPR1060", req);
			EPR106001Message msgList = (EPR106001Message) mp.getMessageRecord("EPR106001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01OPECOD("0002");
			msgList.setH01FLGWK2("O");
			try {
				msgList.setE01NUMREC(req.getParameter("Pos").trim());
			} catch (Exception ex) {
				msgList.setE01NUMREC("0");
			}

			mp.sendMessage(msgList);
			MessageRecord msg = mp.receiveMessageRecord();

			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				pageName = "EPR1060_pr_inq_search.jsp";
			} else if ("EPR010001".equals(msg.getFormatName())) {
				session.setAttribute("prMant", msg);
				pageName = "EPR0101_pr_incoming_maint.jsp";
			} else {	
				if (((EPR106001Message)msg).getE01INDOPE().equals("*")) {
					pageName = "MISC_no_result.jsp";
				} else {
					JBObjList list = mp.receiveMessageRecordList("E01INDOPE", "E01NUMREC");
					list.add(0, msg);
					userPO.setPurpose("INQUIRY");
					JBList beanList = new JBList();
					StringBuffer myRow = null;
					String chk = "";
					String priNum = "";
					String warnImg = "";
					String ofacImg = "";
					int indexRow = 0;
					boolean firstTime = true;
					Iterator iterator = list.iterator();
					while (iterator.hasNext()) {
						msgList = (EPR106001Message) iterator.next();
						if (firstTime) {
							firstTime = false;
							chk = "checked";
						} else {
							chk = msgList.getE01WRTNUM().trim().equals(priNum) ? "checked" : "";
						}
						if (msgList.getH01FLGWK3().trim().equals("3")) {
							ofacImg = "<IMG border=\"0\" src=\"" + req.getContextPath() + "/images/warning_16.jpg\" title=\"OFAC Match List\" onClick=\"showOfac('" + msgList.getE01WRTNUM() + "')\">";
						} else {
							ofacImg = "";
						}
	
						myRow = new StringBuffer("<TR>");
						myRow.append("<TD NOWRAP><input type=\"radio\" name=\"PRINUM\" value=\""
							+ msgList.getE01WRTNUM()
							+ "\" "
							+ chk
							+ " onclick=\"showAddInfo('"
							+ msgList.getE01WRTNUM()
							+ "','"
							+ msgList.getE01WRTAMT()								
							+ "',"
							+ indexRow
							+ ")\"></TD>");
						myRow.append("<TD NOWRAP ALIGN=\"LEFT\"><A HREF=\"javascript:goAction('"
							+ msgList.getE01WRTNUM()
							+ "')\">"
							+ Util.formatCell(msgList.getE01WRTNUM())
							+ "</A>" + warnImg + ofacImg + "</TD>");
						myRow.append("<TD NOWRAP ALIGN=\"RIGHT\"><A HREF=\"javascript:goAction('"
							+ msgList.getE01WRTNUM()
							+ "')\">"
							+ Util.fcolorCCY(msgList.getE01WRTAMT())
							+ "</A></TD>");
						myRow.append("<INPUT TYPE=HIDDEN NAME=\"TXTDATA"
							+ indexRow
							+ "\" VALUE=\""
							+ Util.formatCell(msgList.getE01WRTDAC())
							+ "<br>");
						myRow.append(Util.formatCell(msgList.getE01WRTCAC()) + "<br>");
						myRow.append(Util.formatCell(msgList.getE01WRTBYO()) + "<br>");
						myRow.append(Util.formatCell(msgList.getE01WRTBNF()) + "<br>");
						myRow.append(Util.formatCell(msgList.getE01WRTBBK()) + "<br>");
						myRow.append(Util.formatCell(msgList.getE01WRTORI()) + "\"></TD>");
						myRow.append("</TR>");
						indexRow++;
						beanList.addRow("", myRow.toString());
					}
					beanList.setFirstRec(list.getFirstRec());
					beanList.setShowNext(list.getShowNext());
					beanList.setShowPrev(list.getFirstRec() > 2);
					
					session.setAttribute("appList", beanList);
					pageName = "EPR1060_pr_opening_rt_list.jsp";
				}	
			}

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqListOpeningLN(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPR1060", req);
			EPR106001Message msgList = (EPR106001Message) mp.getMessageRecord("EPR106001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01OPECOD("0002");
			msgList.setH01FLGWK2("O");
			try {
				msgList.setE01NUMREC(req.getParameter("Pos").trim());
			} catch (Exception ex) {
				msgList.setE01NUMREC("0");
			}

			mp.sendMessage(msgList);
			MessageRecord msg = mp.receiveMessageRecord();

			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				pageName = "EPR1060_pr_inq_search.jsp";
			} else if ("EPR010001".equals(msg.getFormatName())) {
				session.setAttribute("prMant", msg);
				pageName = "EPR0101_pr_incoming_maint.jsp";
			} else {	
				if (((EPR106001Message)msg).getE01INDOPE().equals("*")) {
					pageName = "MISC_no_result.jsp";
				} else {
					JBObjList list = mp.receiveMessageRecordList("E01INDOPE", "E01NUMREC");
					list.add(0, msg);
					userPO.setPurpose("INQUIRY");
					JBList beanList = new JBList();
					StringBuffer myRow = null;
					String chk = "";
					String priNum = "";
					int indexRow = 0;
					boolean firstTime = true;
					Iterator iterator = list.iterator();
					while (iterator.hasNext()) {
						msgList = (EPR106001Message) iterator.next();
						if (firstTime) {
							firstTime = false;
							chk = "checked";
						} else {
							chk = msgList.getE01WRTNUM().trim().equals(priNum) ? "checked" : "";
						}
	
						myRow = new StringBuffer("<TR>");
						myRow.append("<TD NOWRAP><input type=\"radio\" name=\"PRINUM\" value=\""
							+ msgList.getE01WRTNUM()
							+ "\" "
							+ chk
							+ " onclick=\"showAddInfo('"
							+ msgList.getE01WRTNUM()
							+ "','"
							+ msgList.getE01WRTAMT()								
							+ "',"
							+ indexRow
							+ ")\"></TD>");
						myRow.append("<TD NOWRAP ALIGN=\"CENTER\"><A HREF=\"javascript:goAction('"
							+ msgList.getE01WRTNUM()
							+ "')\">"
							+ Util.formatCell(msgList.getE01WRTNUM())
							+ "</A></TD>");
						myRow.append("<TD NOWRAP ALIGN=\"RIGHT\"><A HREF=\"javascript:goAction('"
							+ msgList.getE01WRTNUM()
							+ "')\">"
							+ Util.fcolorCCY(msgList.getE01WRTAMT())
							+ "</A></TD>");
						myRow.append("<INPUT TYPE=HIDDEN NAME=\"TXTDATA"
							+ indexRow
							+ "\" VALUE=\""
							+ Util.formatCell(msgList.getE01WRTDAC())
							+ "<br>");
						myRow.append(Util.formatCell(msgList.getE01WRTCAC()) + "<br>");
						myRow.append(Util.formatCell(msgList.getE01WRTBYO()) + "<br>");
						myRow.append(Util.formatCell(msgList.getE01WRTBNF()) + "<br>");
						myRow.append(Util.formatCell(msgList.getE01WRTBBK()) + "<br>");
						myRow.append(Util.formatCell(msgList.getE01WRTORI()) + "\"></TD>");
						myRow.append("</TR>");
						indexRow++;
						beanList.addRow("", myRow.toString());
					}
					beanList.setFirstRec(list.getFirstRec());
					beanList.setShowNext(list.getShowNext());
					beanList.setShowPrev(list.getFirstRec() > 2);
					
					session.setAttribute("appList", beanList);
					pageName = "EPR1060_pr_opening_ln_list.jsp";
				}	
			}

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqListOpeningSV(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPR1060", req);
			EPR106001Message msgList = (EPR106001Message) mp.getMessageRecord("EPR106001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01OPECOD("0002");
			msgList.setH01FLGWK2("O");
			try {
				msgList.setE01NUMREC(req.getParameter("Pos").trim());
			} catch (Exception ex) {
				msgList.setE01NUMREC("0");
			}

			mp.sendMessage(msgList);
			MessageRecord msg = mp.receiveMessageRecord();

			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				pageName = "EPR1060_pr_inq_search.jsp";
			} else if ("EPR010001".equals(msg.getFormatName())) {
				session.setAttribute("prMant", msg);
				pageName = "EPR0101_pr_incoming_maint.jsp";
			} else {	
				if (((EPR106001Message)msg).getE01INDOPE().equals("*")) {
					pageName = "MISC_no_result.jsp";
				} else {
					JBObjList list = mp.receiveMessageRecordList("E01INDOPE", "E01NUMREC");
					list.add(0, msg);
					userPO.setPurpose("INQUIRY");
					JBList beanList = new JBList();
					StringBuffer myRow = null;
					String chk = "";
					String priNum = "";
					String warnImg = "";
					String ofacImg = "";
					int indexRow = 0;
					boolean firstTime = true;
					Iterator iterator = list.iterator();
					while (iterator.hasNext()) {
						msgList = (EPR106001Message) iterator.next();
						if (firstTime) {
							firstTime = false;
							chk = "checked";
						} else {
							chk = msgList.getE01WRTNUM().trim().equals(priNum) ? "checked" : "";
						}
						if (msgList.getH01FLGWK3().trim().equals("3")) {
							ofacImg = "<IMG border=\"0\" src=\"" + req.getContextPath() + "/images/warning_16.jpg\" title=\"OFAC Match List\" onClick=\"showOfac('" + msgList.getE01WRTNUM() + "')\">";
						} else {
							ofacImg = "";
						}
	
						myRow = new StringBuffer("<TR>");
						myRow.append("<TD NOWRAP><input type=\"radio\" name=\"PRINUM\" value=\""
							+ msgList.getE01WRTNUM()
							+ "\" "
							+ chk
							+ " onclick=\"showAddInfo('"
							+ msgList.getE01WRTNUM()
							+ "','"
							+ msgList.getE01WRTAMT()								
							+ "',"
							+ indexRow
							+ ")\"></TD>");
						myRow.append("<TD NOWRAP ALIGN=\"LEFT\"><A HREF=\"javascript:goAction('"
							+ msgList.getE01WRTNUM()
							+ "')\">"
							+ Util.formatCell(msgList.getE01WRTNUM())
							+ "</A>" + warnImg + ofacImg + "</TD>");
						myRow.append("<TD NOWRAP ALIGN=\"RIGHT\"><A HREF=\"javascript:goAction('"
							+ msgList.getE01WRTNUM()
							+ "')\">"
							+ Util.fcolorCCY(msgList.getE01WRTAMT())
							+ "</A></TD>");
						myRow.append("<INPUT TYPE=HIDDEN NAME=\"TXTDATA"
							+ indexRow
							+ "\" VALUE=\""
							+ Util.formatCell(msgList.getE01WRTDAC())
							+ "<br>");
						myRow.append(Util.formatCell(msgList.getE01WRTCAC()) + "<br>");
						myRow.append(Util.formatCell(msgList.getE01WRTBYO()) + "<br>");
						myRow.append(Util.formatCell(msgList.getE01WRTBNF()) + "<br>");
						myRow.append(Util.formatCell(msgList.getE01WRTBBK()) + "<br>");
						myRow.append(Util.formatCell(msgList.getE01WRTORI()) + "\"></TD>");
						myRow.append("</TR>");
						indexRow++;
						beanList.addRow("", myRow.toString());
					}
					beanList.setFirstRec(list.getFirstRec());
					beanList.setShowNext(list.getShowNext());
					beanList.setShowPrev(list.getFirstRec() > 2);
					
					session.setAttribute("appList", beanList);
					pageName = "EPR1060_pr_opening_sv_list.jsp";
				}	
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
		
		EPR106001Message msgSch = new EPR106001Message();
		msgSch.setH01USERID(user.getH01USR());
		msgSch.setH01PROGRM("EPR1060");
		msgSch.setH01TIMSYS(getTimeStamp());
		msgSch.setH01SCRCOD("01");
		msgSch.setH01OPECOD("9999");
		
		setMessageRecord(req, msgSch);
		
		session.setAttribute("schBean", msgSch);
		procReqList(user, req, res, session);
	}

	private void procActionSearchT(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		EPR106001Message msgSch = new EPR106001Message();
		msgSch.setH01USERID(user.getH01USR());
		msgSch.setH01PROGRM("EPR1060");
		msgSch.setH01TIMSYS(getTimeStamp());
		msgSch.setH01SCRCOD("01");
		msgSch.setH01OPECOD("0004");
		
		setMessageRecord(req, msgSch);
		
		session.setAttribute("schBean", msgSch);
		procReqList(user, req, res, session);
	}

	private void procReqLogsInquiry(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPR1060", req);
			EPR020001Message msgList = (EPR020001Message) mp.getMessageRecord("EPR020001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01FLGWK1("2");
			try {
				msgList.setE01REFNUM(req.getParameter("REFNUM").trim());
			} catch (Exception e)	{
				msgList.setE01REFNUM("0");
			}

			mp.sendMessage(msgList);
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "EFE0000_enter_inquiry.jsp";
			} else {
				int colNum = 17;
				JBListRec beanList = new JBListRec();
				beanList.init(colNum);
				String myRow[] = new String[colNum];
				for (int i=0; i<colNum; i++) {
					myRow[i] = "";
				}
				Iterator iterator = list.iterator();
				while (iterator.hasNext()) {
					msgList = (EPR020001Message) iterator.next();
					
					myRow[0] = msgList.getE01ACCNUM();
					myRow[1] = msgList.getE01REFNUM();						
					myRow[2] = msgList.getE01PRLFMT();
					myRow[3] = msgList.getE01PRLCCY();
					myRow[4] = Util.fcolorCCY(msgList.getE01AMOUNT());
					myRow[5] = msgList.getE01PRLSRR();
					myRow[6] = msgList.getE01PRLUSR();								
					myRow[7] = msgList.getE01PRLRID();
					myRow[8] = msgList.getE01DSCTST();
					myRow[9] = msgList.getE01DSCMOD();
					myRow[10] = msgList.getE01DSCPRT();
					myRow[11] = Util.formatDate(msgList.getE01PRLSY1(),msgList.getE01PRLSY2(),msgList.getE01PRLSY3());
					myRow[12] = msgList.getE01PRLSYT();
					
					beanList.addRow(msgList.getE01PRLFMT(), myRow);
				}
				session.setAttribute("logs", beanList);
				pageName = "EPR0200_logs_pr.jsp";
			}

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

}
