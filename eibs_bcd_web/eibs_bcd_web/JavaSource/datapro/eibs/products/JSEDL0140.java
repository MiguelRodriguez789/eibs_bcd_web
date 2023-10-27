package datapro.eibs.products;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.approval.JOApprovalRedirect;
import datapro.eibs.beans.EDI001002Message;
import datapro.eibs.beans.EDL014001Message;
import datapro.eibs.beans.EDL014002Message;
import datapro.eibs.beans.EDL014030Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EPV140002Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;

public class JSEDL0140 extends JSEIBSServlet {

	protected static final int R_PASSWORD = 1;
	protected static final int A_APPROVAL = 2;
	protected static final int R_APPROVAL_INQ = 3;
	protected static final int R_APPROVAL = 5;

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
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procReqApprovalInq(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos userPO = getUserPos(req);
		int appCode = Util.parseInt(req.getParameter("appCode"));
		String accNum = req.getParameter("ACCNUM") == null ? "" : req.getParameter("ACCNUM");
		String typeCode = req.getParameter("typeCode") == null ? "" : req.getParameter("typeCode");

		userPO.setAccNum(accNum);
		userPO.setApplicationCode("" + appCode);
		userPO.setType(typeCode);
		
		session.setAttribute("userPO", userPO);
		
		datapro.eibs.products.JOActionRedirect red =
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
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		MessageProcessor mp = null;
		String accNum = req.getParameter("ACCNUM") == null ? "" : req.getParameter("ACCNUM");
		String appCode = req.getParameter("appCode") == null ? "" : req.getParameter("appCode");
		String typCode = req.getParameter("typCode") == null ? "" : req.getParameter("typCode");
		String openVia = req.getParameter("openVia") == null ? "" : req.getParameter("openVia");

		if ("V".equals(openVia)) {
			try {
				mp = getMessageProcessor("EPV1400", req);
				EPV140002Message msgList = (EPV140002Message) mp.getMessageRecord("EPV140002");
				msgList.setH02USERID(user.getH01USR());
				msgList.setH02PROGRM("EPV1400");
				msgList.setH02TIMSYS(getTimeStamp());
				try {
					msgList.setE02DEAACC(accNum);
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
				ELEERRMessage msgError = null;
				MessageRecord msg = null;
				EDI001002Message msgImg = null;
				EDL014030Message msgData = null;
				do {
					msg = mp.receiveMessageRecord();
					if (msg.getFormatName().equals("EDI001002")) { //Update SQL Images
						msgImg = (EDI001002Message) msg;
					} else if (msg.getFormatName().equals("EDL014030")) {
						msgData = (EDL014030Message) msg;
					}
				} while (!msg.getFormatName().equals("ELEERR"));
				
				msgError = (ELEERRMessage) msg;
				
				if (mp.hasError(msgError)) {
					session.setAttribute("error", msgError);
					forward("EDL0140_approval_list.jsp", req, res);
				} else {
					if (msgImg != null) {
						//Update SQL Images
						JOApprovalRedirect action = new JOApprovalRedirect(req, res, msgImg.getE02DCIACD(), msgImg.getE02DCIACC());
						if (msgData != null) {
							session.setAttribute("error", new ELEERRMessage());
							session.setAttribute("receipt", msgData);
							action.action(msgImg.getE02DCITYP(), msgImg.getH02FLGWK3(), "/servlet/datapro.eibs.products.JSEDL0140?SCREEN=" + R_APPROVAL + "&appCode=" + appCode + "&typCode=" + typCode + "&doPrint=1");
						} else {
							session.removeAttribute("error");
							action.action(msgImg.getE02DCITYP(), msgImg.getH02FLGWK3(), "/servlet/datapro.eibs.products.JSEDL0140?SCREEN=" + R_APPROVAL);
						}
					} else {
						if (msgData != null) {
							session.setAttribute("error", new ELEERRMessage());
							session.setAttribute("receipt", msgData);
							res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSEDL0140?SCREEN=5&appCode=" + appCode + "&typCode=" + typCode + "&doPrint=1");
						} else {
							session.removeAttribute("error");
							procReqApproval(user, req, res, session);
						}
					}
				} 
				
			} finally {
				if (mp != null) mp.close();
			}
			
		} else {
			try {
				mp = getMessageProcessor("EDL0140", req);
				EDL014002Message msgList = (EDL014002Message) mp.getMessageRecord("EDL014002");
				msgList.setH02USERID(user.getH01USR());
				msgList.setH02PROGRM("EDL0140");
				msgList.setH02TIMSYS(getTimeStamp());
				try {
					msgList.setE02DEAACC(accNum);
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
					forward("EDL0140_approval_list.jsp", req, res);
				} else if ("EDL014030".equals(msg.getFormatName())) {
					session.setAttribute("error", new ELEERRMessage());
					session.setAttribute("receipt", msg);
					res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSEDL0140?SCREEN=5&appCode=" + appCode + "&typCode=" + typCode + "&doPrint=1");
				} else {
					procReqApproval(user, req, res, session);
				}
				
			} finally {
				if (mp != null) mp.close();
			}
		}
	}

	private void procReqApproval(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			//Set UserPo
			userPO.setHeader10(Util.getReqParameter("appCode", req));
			userPO.setHeader11(Util.getReqParameter("typCode", req));
			
			//Grab Search Parameters
			EDL014001Message searchParameters = (EDL014001Message) session.getAttribute("searchParameters");
			if(null != searchParameters){
				setMessageRecord(req, searchParameters);
			} else {
				searchParameters = new EDL014001Message();
			}
			 
			//Build Message
			mp = getMessageProcessor("EDL0140", req);
			EDL014001Message msgList = (EDL014001Message) mp.getMessageRecord("EDL014001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESS0090");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setE01DEAACD(Util.getReqParameter("appCode", req, userPO.getHeader10()));
			msgList.setH01FLGWK1(Util.getReqParameter("typCode", req, userPO.getHeader11()));
			setMessageRecord(req, msgList);
			
			mp.sendMessage(msgList);
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
			
			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "error_viewer.jsp";
			} else {
				JBList beanList = new JBList();
				String accNum = req.getParameter("ACCNUM");
				boolean firstTime = accNum == null;
				String chk = "";
				String chkOfac = "";
				String chkWarn = "";
				String disabled = "";
				StringBuffer myRow = null;
				list.initRow();
				while (list.getNextRow()) {
					msgList = (EDL014001Message) list.getRecord();
					if (firstTime) {
						if (msgList.getE01DEAACD().equals("14")) {
							userPO.setHeader10("14");
						} else if (msgList.getE01DEAACD().equals("10") && msgList.getH01FLGWK1().equals("V")) {
							userPO.setHeader10("PV");
						} else if (msgList.getE01DEAACD().equals("10")) {
							userPO.setHeader10("LN");
						} else if (msgList.getE01DEAACD().equals("13")) {
							userPO.setHeader10("13");								
						}

						firstTime = false;
						chk = "checked";
					} else {
						if (msgList.getE01DEAACC().trim().equals(accNum))
							chk = "checked";
						else
							chk = "";
					}
					myRow = new StringBuffer("<TR>");
					// mod EMAT 10/01/2001
					// add ofac status : H01FLGWK3 = '3'
					// mod EMAT 10/25/2001
					// add warning status : H01FLGWK2 = 'A'
					
					disabled = (msgList.getH01FLGWK3().equals("3") ? " disabled ": "");
					//chkOfac = (msgList.getH01FLGWK3().equals("3") ? "<a href=\"javascript:showInqOFAC('"
					//		+ msgList.getH01TIMSYS()
					//		+ "')\"><img src=\"" + req.getContextPath() + "/images/warning_16.jpg\" title=\"Lista de Control\" align=\"middle\" border=\"0\" ></a>"
					//		: "");
					chkWarn = (msgList.getH01FLGWK2().equals("A") ? "<a href=\"javascript:showInqWarn('"
							+ msgList.getE01DEAACC()
							+ "')\"><img src=\"" + req.getContextPath() + "/images/warning01.gif\" title=\"Avisos\" align=\"middle\" border=\"0\" ></a>"
							: "");
					myRow.append("<TD NOWRAP width=\"5%\"><input type=\"radio\" " + disabled + " name=\"ACCNUM\" value=\"" + 
							msgList.getE01DEAACC()+ "\" "	+ chk+ " onclick=\"showAddInfo(" + list.getCurrentRow() + ", '" + msgList.getH01FLGWK1().trim() + "')\"></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\" width=\"20%\">" +
							"<A HREF=\"javascript:showInqApproval('" + msgList.getE01DEAACD()	+ "', '"+ msgList.getE01DEAACC() + "', '"+ msgList.getH01FLGWK1()+ "')\">"+ Util.formatCell(msgList.getE01DEAACC())+ "</A>"
							+ chkOfac
							+ chkWarn
							+ "</TD>");
					myRow.append(
						"<TD NOWRAP ALIGN=\"CENTER\" width=\"10%\"><A HREF=\"javascript:showInqApproval('"
							+ msgList.getE01DEAACD()
							+ "', '"
							+ msgList.getE01DEAACC()
							+ "', '"
							+ msgList.getH01FLGWK1()
							+ "')\">"
							+ Util.formatCell(msgList.getE01DEACUN())
							+ "</A></TD>");
					myRow.append(
						"<TD NOWRAP width=\"40%\"><A HREF=\"javascript:showInqApproval('"
							+ msgList.getE01DEAACD()
							+ "', '"
							+ msgList.getE01DEAACC()
							+ "', '"
							+ msgList.getH01FLGWK1()
							+ "')\">"
							+ Util.formatCell(msgList.getE01CUSNA1())
							+ "</A></TD>");
					myRow.append(
						"<TD NOWRAP ALIGN=\"CENTER\" width=\"10%\"><A HREF=\"javascript:showInqApproval('"
							+ msgList.getE01DEAACD()
							+ "', '"
							+ msgList.getE01DEAACC()
							+ "', '"
							+ msgList.getH01FLGWK1()
							+ "')\">"
							+ Util.formatCell(msgList.getE01DEATYP() + "/" + msgList.getE01DEAPRO())
							+ "</A>");
					myRow.append(
							"<TD NOWRAP ALIGN=\"CENTER\" width=\"15%\"><A HREF=\"javascript:showInqApproval('"
								+ msgList.getE01DEAACD()
								+ "', '"
								+ msgList.getE01DEAACC()
								+ "', '"
								+ msgList.getH01FLGWK1()
								+ "')\">"
								+ Util.formatCell(msgList.getE01WARNIN())
								+ "</A>");
					myRow.append(
						"<INPUT TYPE=HIDDEN NAME=\"STSOFAC"
							+ list.getCurrentRow()
							+ "\" VALUE=\""
							+ msgList.getH01FLGWK3()
							+ "\">");
					myRow.append(
						"<INPUT TYPE=HIDDEN NAME=\"STSWARN"
							+ list.getCurrentRow()
							+ "\" VALUE=\""
							+ msgList.getH01FLGWK2()
							+ "\">");

					myRow.append(
						"<INPUT TYPE=HIDDEN NAME=\"TXTDATA"
							+ list.getCurrentRow()
							+ "\" VALUE=\""
							+ Util.formatCell(msgList.getE01DEARMK())
							+ "<br>");
					myRow.append(
						Util.fcolorCCY(msgList.getE01DEAPRI()) + "<br>");
					myRow.append(
						Util.formatCell(msgList.getE01DEACCY()) + "<br>");
					myRow.append(
						Util.formatCell(msgList.getE01DEABNK()) + "<br>");
					myRow.append(
						Util.formatCell(msgList.getE01DEABRN()) + "<br>");
					myRow.append(
						Util.formatCell(msgList.getE01DEAGLN()) + "<br>");
					myRow.append(
						Util.formatCell(msgList.getE01DEACCN()) + "<br>");
					myRow.append(
						Util.formatCell(msgList.getE01DEAUBT()) + "<br>");
					myRow.append(
						Util.formatCell(msgList.getE01DEAUSR()) + "<br>");
					myRow.append(
						Util.formatCell(msgList.getE01FLGBUS()) + "<br>");
					myRow.append(
						Util.formatCell(msgList.getE01FLGIBF()) + "<br>");
					myRow.append(
						Util.formatCell(msgList.getE01FLGTYP())
							+ "\"></TD>");
					myRow.append("</TR>");

					beanList.addRow("", myRow.toString());
				}
				
				userPO.setPurpose("APPROVAL");
				if ("10".equals(req.getParameter("appCode"))) userPO.setOption("LN");
				else if ("13".equals(req.getParameter("appCode"))) userPO.setOption("13");
				else userPO.setOption(req.getParameter("appCode") == null ? "" : req.getParameter("appCode"));
				if (req.getParameter("doPrint") != null) {
					userPO.setRedirect("DO_PRINT");
				}
				if ("G".equals(req.getParameter("typCode"))) {
					userPO.setOption("DF");
				}
				
				flexLog("Putting java beans into the session");
				session.setAttribute("userPO", userPO);
				session.setAttribute("appList", beanList);
				session.setAttribute("error", new ELEERRMessage());
				
				pageName = "EDL0140_approval_list.jsp";
			}
			
			session.setAttribute("searchParameters", searchParameters);
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}


	private void procReqPassword(HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos userPO = getUserPos(req);
		
		String appCode = req.getParameter("appCode") == null ? "" : "&appCode=" + req.getParameter("appCode");
		String typCode = req.getParameter("typCode") == null ? "" : "&typCode=" + req.getParameter("typCode");
		String accNum = req.getParameter("ACCNUM") == null ? "" : "&ACCNUM=" + req.getParameter("ACCNUM");
		
		session.removeAttribute("searchParameters");
		
		userPO.setRedirect(
				"/servlet/datapro.eibs.products.JSEDL0140?SCREEN="
					+ R_APPROVAL
					+ appCode
					+ typCode
					+ accNum);
		session.setAttribute("userPO", userPO);
		
		res.sendRedirect(srctx + "/servlet/datapro.eibs.menu.JSESS0030?SCREEN=7");
	}

}
