package datapro.eibs.products;

/**
 * Insert the type's description here.
 * Creation date: (8/28/2000 4:02:17 PM)
 * @author: Orestes Garcia
**/

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EOF011502Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.ETL051001Message;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;

public class JSEOF0115A extends JSEIBSServlet {

	protected static final int R_APPROVAL				= 9;
	protected static final int A_APPROVAL				= 2;
	protected static final int R_APPROVAL_INQ			= 3;
	protected static final int R_LIST_PRINT				= 5;
	protected static final int A_LIST_PRINT		    	= 8;
	protected static final int R_PASSWORD				= 1;
	
	protected static final int R_APPROVAL_LIST			= 10;
	protected static final int A_APPROVAL_LIST			= 11;
	protected static final int A_APPROVAL_FROM_MENU		= 12;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen) {
		case R_PASSWORD :
			procReqPassword(req, res, session);
			break;
		case R_APPROVAL :
			procReqApproval(user, req, res, session);
			break;
		case A_APPROVAL :
			procActionApproval(user, req, res, session);
			break;
		case R_APPROVAL_INQ :
			procReqApprovalInq(user, req, res, session);
			break;
		case R_LIST_PRINT : 
			procReqPrint(user, req, res, session);
			break;
			
		case R_APPROVAL_LIST : 
			procReqApprovalList(user, req, res, session);
			break;
		case A_APPROVAL_LIST : 
			procActionApprovalList(user, req, res, session);
			break;
		case A_APPROVAL_FROM_MENU : 
			procActionApprovalFromMenu(user, req, res, session);
			break;
		

		default :
			forward(devPage, req, res);
			break;
		}
	}

	private void procActionApprovalFromMenu(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		session.setAttribute("oldMsgList", session.getAttribute("msgList"));

		ArrayList errorList = new ArrayList();
		ArrayList recordList = new ArrayList();
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("", req);
			EOF011502Message msg02 = (EOF011502Message) mp.getMessageRecord("EOF011502");
			msg02.setH02USERID(user.getH01USR());
			msg02.setH02PROGRM("EOF0115");
			msg02.setH02TIMSYS(getTimeStamp());
			msg02.setE02OFMCKN(userPO.getIdentifier());
			msg02.setE02OFMCCY(userPO.getCurrency());
			msg02.setE02ACTION("A");
			
			EOF011502Message cpymsg = new EOF011502Message();
			populate(msg02, cpymsg);
			recordList.add(cpymsg);

			mp.sendMessage(msg02);
			MessageRecord msg = mp.receiveMessageRecord();

			if (mp.hasError(msg)) {
				errorList.add(msg);
			}

			session.setAttribute("CONFIRM", "CONFIRM");
			session.setAttribute("errorList", errorList);
			session.setAttribute("recordList", recordList);
			procReqApprovalList(user, req, res, session);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionApprovalList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		session.setAttribute("oldMsgList", session.getAttribute("msgList"));
		String redirectScreen = req.getParameter("RD") == null ? "1" : req.getParameter("RD").trim();
		
		ArrayList errorList = new ArrayList();
		ArrayList recordList = new ArrayList();
		boolean isDelete = false;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EOF0115", req);
			
			int totalRecords = Util.parseInt(req.getParameter("total_records"));
			for (int i = 0; i < totalRecords; i++) {
				
				String chk_ccy = req.getParameter("RECNUM" + i);
				if (chk_ccy == null || chk_ccy.equals("")) continue;
				
				EOF011502Message msg02 = (EOF011502Message) mp.getMessageRecord("EOF011502");
				msg02.setH02USERID(user.getH01USR());
				msg02.setH02PROGRM("ESS0090");
				msg02.setH02TIMSYS(getTimeStamp());
				String chkNum = Util.leftValue(chk_ccy);
				String ccy = Util.rightValue(chk_ccy);
				msg02.setE02OFMCKN(chkNum);
				msg02.setE02OFMCCY(ccy);
				try {
					msg02.setE02ACTION(req.getParameter("action").trim());
					isDelete = msg02.getE02ACTION().equals("D");
				} catch (Exception e) {
				}
				try {
					msg02.setE02MSGTXT(req.getParameter("reason").trim());
				} catch (Exception e) {
				}
				
				EOF011502Message cpymsg = new EOF011502Message();
				populate(msg02, cpymsg);
				recordList.add(cpymsg);
				
				mp.sendMessage(msg02);
				MessageRecord msg = mp.receiveMessageRecord();
				
				if (mp.hasError(msg)) {
					errorList.add(msg);
					if (isDelete) {
						session.setAttribute("error", msg);
						session.setAttribute("CONFIRM", "NO");
						if (redirectScreen.equals("1")) 
							procReqApproval(user, req, res, session);
						else
							procReqApprovalList(user, req, res, session);
						return;
					}
				}
			}
			
			session.setAttribute("recordList", recordList);
			session.setAttribute("errorList", errorList);
			session.setAttribute("CONFIRM", "CONFIRM");
			if (redirectScreen.equals("1")) 
				procReqApproval(user, req, res, session);
			else
				procReqApprovalList(user, req, res, session);
		
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqApprovalList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ETL0510", req);
			ETL051001Message msgSearch = (ETL051001Message) mp.getMessageRecord("ETL051001");
			msgSearch.setH01USERID(user.getH01USR());
			msgSearch.setH01PROGRM("ETL0510");
			msgSearch.setH01TIMSYS(getTimeStamp());
			msgSearch.setH01SCRCOD("01");
			msgSearch.setH01OPECOD("0004");
			msgSearch.setH01FLGWK1("A");
			try {
				int posi = Integer.parseInt(req.getParameter("Pos"));
				msgSearch.setE01NUMREC(posi + "");
			} catch (Exception e) {
				msgSearch.setE01NUMREC("0");
			}
			msgSearch.setE01SELDTY("1");
			msgSearch.setE01SELSCH("");

			mp.sendMessage(msgSearch);
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "EOF0115_of_chk_enter_maint.jsp";
			} else {
				ArrayList msgList = new ArrayList();
				Iterator iterator = list.iterator();
				while (iterator.hasNext()) {
					msgSearch = (ETL051001Message) iterator.next();
					msgList.add(msgSearch);
				}
				session.setAttribute("msgList", msgList);
				pageName = "EOF0115_of_chk_apr_list.jsp";
			}

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqPrint(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		forward("EOF0115_of_chk_print.jsp", req, res);
	}

	private void procReqApprovalInq(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos userPO = getUserPos(req);
		int appCode = 87;
		String accNum = req.getParameter("ACCNUM") == null ? "" : req.getParameter("ACCNUM").trim();
		String ccy = req.getParameter("Currency") == null ? "" : req.getParameter("Currency").trim();
		
		userPO.setIdentifier(accNum);
		userPO.setCurrency(ccy);
		userPO.setPurpose("APPROVAL");
		session.setAttribute("userPO", userPO);

		JOActionRedirect red = new JOActionRedirect(ccy, ACC_APPROVAL_INQ, appCode, accNum, getLangPath(user), session);
		res.sendRedirect(srctx + red.action());
	}

	private void procActionApproval(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String option =  req.getParameter("OPTION");
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EOF0115", req);
			EOF011502Message msgList = (EOF011502Message) mp.getMessageRecord("EOF011502");
			msgList.setH02USERID(user.getH01USR());
		 	msgList.setH02PROGRM("EOF0115");
		 	msgList.setH02TIMSYS(getTimeStamp());
		 	
		 	String chk_ccy = req.getParameter("ACCNUM");
		 	try {
		 		String chkNum = Util.leftValue(chk_ccy);
		 		msgList.setE02OFMCKN(chkNum);
			} catch (Exception e) {
			}
		 	try {
		 		String ccy = Util.rightValue(chk_ccy);
		 		msgList.setE02OFMCCY(ccy);
			} catch (Exception e) {
			}
		 	try {
		 		msgList.setE02ACTION(req.getParameter("action").trim());
			} catch (Exception e) {
			}
		 	try {
		 		msgList.setE02MSGTXT(req.getParameter("reason").trim());
			} catch (Exception e) {
			}
		 	
			mp.sendMessage(msgList);
			MessageRecord msg = mp.receiveMessageRecord();

			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				forward("EOF0115_of_chk_approval_list.jsp", req, res);
			} else {
				res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSEOF0115A?SCREEN=1&OPTION=" + option);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqApproval(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ETL0510", req);
			ETL051001Message msgSearch = (ETL051001Message) mp.getMessageRecord("ETL051001");
			msgSearch.setH01USERID(user.getH01USR());
		 	msgSearch.setH01PROGRM("ETL0510");
		 	msgSearch.setH01TIMSYS(getTimeStamp());
		 	msgSearch.setH01SCRCOD("01");
		 	msgSearch.setH01OPECOD("0004");
		 	msgSearch.setH01FLGWK1("A");
		 	try {
		 		int posi = Integer.parseInt(req.getParameter("Pos"));
		 		msgSearch.setE01NUMREC(String.valueOf(posi));
			} catch (Exception e) {
				msgSearch.setE01NUMREC("0");
			}
		 	String option = "";
		 	try {
		 		option = req.getParameter("OPTION").trim();
			} catch (Exception e) {
				option = "3";
			}
			msgSearch.setE01SELDTY(option);
			userPO.setOption(option);
		 	msgSearch.setE01SELSCH(" ");

			mp.sendMessage(msgSearch);
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE", "E01NUMREC");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "EOF0115_of_chk_enter_maint.jsp";
			} else {
				JBList beanList = new JBList();
				StringBuffer myRow = null;
				int indexRow = 0;
				Iterator iterator = list.iterator();
				while (iterator.hasNext()) {
					ETL051001Message msgList = (ETL051001Message) iterator.next();
					
					String strPurpose = "I";
					String showRef = "showOffChkApproval('" + msgList.getE01OFMNCH() + "', '" + msgList.getE01OFMCCY() + "', '" + strPurpose + "')";
					
					myRow = new StringBuffer("<TR>");
					// Add Control List Status : H01FLGWK3 = '3'
					String chkOfac = "";
					//if (msgList.getH01FLGWK3().equals("3")) {
					//	chkOfac = "<a href=\"javascript:showInqOFAC('"+ msgList.getE01OFMACC()
					//		+ "')\"><img src=\"" + req.getContextPath() + "/images/warning_16.jpg\" title=\"Lista de Control\" align=\"middle\" border=\"0\" ></a>";
					//}
					myRow.append("<TD NOWRAP ALIGN=\"center\" width=\"5%\"><input type=\"radio\" name=\"ACCNUM\" value=\"" + msgList.getE01OFMNCH() + "_" + msgList.getE01OFMCCY() + "\" onClick=\"highlightRow('dataTable', "+ indexRow +")\"></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"center\" width=\"10%\"><A HREF=\"javascript:" + showRef + "\">" + Util.formatCell(msgList.getE01OFMNCH()) + "</A>" + chkOfac + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=\"center\" width=\"7%\"><A HREF=\"javascript:" + showRef + "\">" + Util.formatCell(msgList.getE01OFMCCY()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"center\" width=\"8%\"><A HREF=\"javascript:" + showRef + "\">" + Util.formatCell(msgList.getE01OFMBRN()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"left\" width=\"30%\"><A HREF=\"javascript:" + showRef + "\">" + Util.formatCell(msgList.getE01OFMBNF()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"right\" width=\"10%\"><A HREF=\"javascript:" + showRef + "\">" + Util.formatCell(msgList.getE01OFMMCH()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"center\" width=\"20%\"><A HREF=\"javascript:" + showRef + "\">" + Util.formatCell(msgList.getE01OFMSTS()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"center\" width=\"10%\"><A HREF=\"javascript:" + showRef + "\">" + Util.formatCustomDate(user.getE01DTF(),msgList.getE01OFMIDM(),msgList.getE01OFMIDD(),msgList.getE01OFMIDY()) + "</A></TD>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowPrev(list.getShowPrev());
				beanList.setShowNext(list.getShowNext());
				
				session.setAttribute("dvList", beanList);
				
				if (beanList.getNoResult()) {
					pageName = "MISC_no_result.jsp";
				} else {
					pageName = "EOF0115_of_chk_approval_list.jsp";
				}
			}

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqPassword(HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos userPO = getUserPos(req);
		
		int screen = R_APPROVAL;
		try {
			screen = Integer.parseInt(req.getParameter("RD").trim());
		} catch (Exception e) {
		}
		int Pos = 0;
		try {
			Pos = Integer.parseInt(req.getParameter("Pos"));
		} catch (Exception e) {
		}
		
		String option = req.getParameter("OPTION");
		
		userPO.setRedirect("/servlet/datapro.eibs.products.JSEOF0115A?SCREEN=" + screen + "&Pos="+ Pos + "&OPTION="+ option);
		session.setAttribute("userPO", userPO);
		res.sendRedirect(srctx + "/servlet/datapro.eibs.menu.JSESS0030?SCREEN=7");
	}


}