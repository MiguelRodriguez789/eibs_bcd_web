package datapro.eibs.products;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.approval.JOApprovalRedirect;
import datapro.eibs.beans.EDD100001Message;
import datapro.eibs.beans.EDD100002Message;
import datapro.eibs.beans.EDI001001Message;
import datapro.eibs.beans.EDI001002Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBListRec;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSEDD1000 extends JSEIBSServlet {

	protected static final int R_PASSWORD				= 1;
	protected static final int A_APPROVAL				= 2;
	protected static final int R_APPROVAL_INQ			= 3;
	protected static final int R_APPROVAL				= 5;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case R_PASSWORD :
				procReqPassword(user, req, res, session);
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
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procReqApprovalInq(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos userPO = getUserPos(req);
		int appCode = 0;
		try {
			appCode = Integer.parseInt(req.getParameter("appCode"));
		} catch (Exception e) {
			appCode = 0;
		}
		String accNum = req.getParameter("ACCNUM") == null ? "" : req.getParameter("ACCNUM");
		String typeCode = req.getParameter("typeCode") == null ? "" : req.getParameter("typeCode");
		userPO.setIdentifier(accNum);
		JOActionRedirect red =
			new datapro.eibs.products.JOActionRedirect(
				typeCode,
				ACC_APPROVAL_INQ,
				appCode,
				accNum,
				getLangPath(user),
				session);
		res.sendRedirect(srctx + red.action());
	}

	private void procActionApproval(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD1000", req);
			EDD100002Message msgList = (EDD100002Message) mp.getMessageRecord("EDD100002");
			msgList.setH02USERID(user.getH01USR());
		 	msgList.setH02PROGRM("EDD1000");
		 	msgList.setH02TIMSYS(getTimeStamp());
		 	try {
			 	msgList.setE02ACMACC(req.getParameter("ACCNUM").trim());
			} catch (Exception e) {
			 	msgList.setE02ACMACC("");
			}
		 	try {
			 	msgList.setE02ACTION(req.getParameter("action").trim());
			} catch (Exception e) {
			 	msgList.setE02ACTION("");
			}
		 	try {
			 	msgList.setE02MSGTXT(req.getParameter("reason").trim());
			} catch (Exception e) {
			 	msgList.setE02MSGTXT("");
			}
			
			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = null;
			MessageRecord msg = null;
			EDI001002Message msgImg = null;
			
			String appCode2 = req.getParameter("appCode") == null ? "" : "&appCode=" + req.getParameter("appCode");
			JOApprovalRedirect action2 = null;
			do {
				msg = mp.receiveMessageRecord();
				if (msg.getFormatName().equals("EDI001002")) { //Update SQL Images
					msgImg = (EDI001002Message) msg;
					if (msgImg.getH02FLGWK3().equals("S")){ // Signers
						action2 = new JOApprovalRedirect(req, res, msgImg.getE02DCIACD(), msgImg.getE02DCIACC());
						action2.action(msgImg.getE02DCITYP(), msgImg.getH02FLGWK3(), msgImg.getE02DCISEQ(), msgImg.getH02FLGWK2(),
								"/servlet/datapro.eibs.products.JSEDD1000?SCREEN=" + R_APPROVAL + appCode2,
								msgImg.getE02CRLIDT(),msgImg.getE02CRLEDT());
					}
				}
			} while (!msg.getFormatName().equals("ELEERR"));
						
			msgError = (ELEERRMessage) msg;
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDD1000_approval_list.jsp", req, res);
			} else {
				session.removeAttribute("appList");
				String appCode = req.getParameter("appCode") == null ? "" : "&appCode=" + req.getParameter("appCode");
				if (msgImg != null) {
					//Update SQL Images
					JOApprovalRedirect action = new JOApprovalRedirect(req, res, msgImg.getE02DCIACD(), msgImg.getE02DCIACC());
					if (!msgImg.getH02FLGWK3().equals("S"))
						action.action(msgImg.getE02DCITYP(), msgImg.getH02FLGWK3(), "/servlet/datapro.eibs.products.JSEDD1000?SCREEN=" + R_APPROVAL + appCode);
				} else {
					res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSEDD1000?SCREEN=" + R_APPROVAL + appCode);
				}
			}
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqApproval(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos	userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD1000", req);
			EDD100001Message msgList = (EDD100001Message) mp.getMessageRecord("EDD100001");
			msgList.setH01USERID(user.getH01USR());
		 	msgList.setH01PROGRM("EDD1000");
		 	msgList.setH01TIMSYS(getTimeStamp());
		 	try {
			 	msgList.setE01ACMACD(req.getParameter("appCode").trim());
			} catch (Exception e) {
			 	msgList.setE01ACMACD("");
			}
			
			mp.sendMessage(msgList);
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
			
			if (mp.hasError(list)) {
				ELEERRMessage msgError = (ELEERRMessage) mp.getError(list);
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				JBList beanList = new JBList();
				StringBuffer myRow = null;
				String accNum = req.getParameter("ACCNUM");
				boolean firstTime = accNum == null;
				String chk = "";
				String chkOfac = "";
				String chkWarn = "";
				String disabled = "";
				list.initRow();
				while (list.getNextRow()) {
					msgList = (EDD100001Message) list.getRecord();
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = msgList.getE01ACMACC().trim().equals(accNum) ? "checked" : "";
					}
					myRow = new StringBuffer("<TR>");
					// mod EMAT 10/01/2001
					// add ofac status : H01FLGWK3 = '3'
					// mod EMAT 10/25/2001
					// add Warning status : H01FLGWK2 = 'A'
					disabled = (msgList.getH01FLGWK3().equals("3") ? " disabled ": "");
					//chkOfac = (msgList.getH01FLGWK3().equals("3") ? "<a href=\"javascript:showInqOFAC('"
					//		+ msgList.getH01TIMSYS()
					//		+ "')\"><img src=\"" + req.getContextPath() + "/images/warning_16.jpg\" title=\"Control List\" align=\"middle\" border=\"0\" ></a>"
					//		: "");
					chkWarn = (msgList.getH01FLGWK2().equals("A") ? "<a href=\"javascript:showInqWarn('"
							+ msgList.getE01ACMACC()
							+ "')\"><img src=\"" + req.getContextPath() + "/images/warning01.gif\" title=\"Avisos\" align=\"middle\" border=\"0\" ></a>"
							: "");
					myRow
							.append("<TD NOWRAP ALIGN=\"CENTER\" width=\"5%\" ><input type=\"radio\"  " + disabled + " name=\"ACCNUM\" value=\""
									+ msgList.getE01ACMACC()
									+ "\" "
									+ chk
									+ " onclick=\"showAddInfo("
									+ list.getCurrentRow()
									+ ")\"></TD>");
					myRow
							.append("<TD NOWRAP ALIGN=\"CENTER\" width=\"20%\"><A HREF=\"javascript:showInqApprovalDDA('"
									+ msgList.getE01ACMACD()
									+ "', '"
									+ msgList.getE01ACMACC()
									+ "', '"
									+ msgList.getH01FLGWK1()
									+ "')\">"
									+ Util.formatCell(msgList.getE01ACMACC())
									+ "</A>" + chkOfac + chkWarn + "</TD>");
					myRow
							.append("<TD NOWRAP ALIGN=\"CENTER\" width=\"15%\"><A HREF=\"javascript:showInqApprovalDDA('"
									+ msgList.getE01ACMACD()
									+ "', '"
									+ msgList.getE01ACMACC()
									+ "', '"
									+ msgList.getH01FLGWK1()
									+ "')\">"
									+ Util.formatCell(msgList.getE01ACMCUN())
									+ "</A></TD>");
					myRow
							.append("<TD NOWRAP width=\"40%\"><A HREF=\"javascript:showInqApprovalDDA('"
									+ msgList.getE01ACMACD()
									+ "', '"
									+ msgList.getE01ACMACC()
									+ "', '"
									+ msgList.getH01FLGWK1()
									+ "')\">"
									+ Util.formatCell(msgList.getE01CUSNA1())
									+ "</A></TD>");
					myRow
							.append("<TD NOWRAP ALIGN=\"CENTER\" width=\"20%\"><A HREF=\"javascript:showInqApprovalDDA('"
									+ msgList.getE01ACMACD()
									+ "', '"
									+ msgList.getE01ACMACC()
									+ "', '"
									+ msgList.getH01FLGWK1()
									+ "')\">"
									+ Util.formatCell(msgList.getE01ACMPRO())
									+ "</A>");
					myRow.append("<INPUT TYPE=HIDDEN NAME=\"STSOFAC" + list.getCurrentRow()
							+ "\" VALUE=\"" + msgList.getH01FLGWK3() + "\">");
					myRow.append("<INPUT TYPE=HIDDEN NAME=\"STSWARN" + list.getCurrentRow()
							+ "\" VALUE=\"" + msgList.getH01FLGWK2() + "\">");
					myRow.append("<INPUT TYPE=HIDDEN NAME=\"TXTDATA" + list.getCurrentRow()
							+ "\" VALUE=\""
							+ Util.formatCell(msgList.getE01ACMRMK()) + "<br>");
					myRow.append(Util.fcolorCCY(msgList.getE01ACMBAL())
							+ "<br>");
					myRow.append(Util.formatCell(msgList.getE01ACMCCY())
							+ "<br>");
					myRow.append(Util.formatCell(msgList.getE01ACMBNK())
							+ "<br>");
					myRow.append(Util.formatCell(msgList.getE01ACMBRN())
							+ "<br>");
					myRow.append(Util.formatCell(msgList.getE01ACMGLN())
							+ "<br>");
					myRow.append(Util.formatCell(msgList.getE01ACMCCN())
							+ "<br>");
					myRow.append(Util.formatCell(msgList.getE01ACMDIB())
							+ "<br>");
					myRow.append(Util.formatCell(msgList.getE01ACMUSR())
							+ "\"></TD>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				userPO.setPurpose("APPROVAL");
				if ("RT".equalsIgnoreCase(req.getParameter("appCode"))) {
					userPO.setOption("RT");
				} else if ("04".equalsIgnoreCase(req.getParameter("appCode"))) {
					userPO.setOption("SV");
				} else {
					userPO.setOption("CP");
				}
				flexLog("Putting java beans into the session");
				session.setAttribute("userPO", userPO);
				session.setAttribute("appList", beanList);
				session.setAttribute("error", new ELEERRMessage());
				
				if (beanList.getNoResult()) {
					pageName = "MISC_no_result.jsp";
				} else {
					pageName = "EDD1000_approval_list.jsp";
				}
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqPassword(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException {
		
		String appCode = req.getParameter("appCode") == null ? "" : "&appCode=" + req.getParameter("appCode");
		String account = req.getParameter("ACCNUM") == null ? "" : "&ACCNUM=" + req.getParameter("ACCNUM");
		
		UserPos	userPO = getUserPos(req);
		userPO.setRedirect("/servlet/datapro.eibs.products.JSEDD1000?SCREEN=" + R_APPROVAL 
				+ appCode 
				+ account);
		session.setAttribute("userPO", userPO);
		res.sendRedirect(srctx + "/servlet/datapro.eibs.menu.JSESS0030?SCREEN=7");
	}

}
