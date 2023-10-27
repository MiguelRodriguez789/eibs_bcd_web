package datapro.eibs.salesplatform;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.approval.JOApprovalRedirect;
import datapro.eibs.beans.EDI001002Message;
import datapro.eibs.beans.EDL091101Message;
import datapro.eibs.beans.EPV015001Message;
import datapro.eibs.beans.EPV140002Message;
import datapro.eibs.beans.EPV140001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;

public class JSEPV1400 extends JSEIBSServlet {

	protected static final int R_PASSWORD = 1;
	protected static final int R_APPROVAL = 2;
	protected static final int A_APPROVAL = 3;
	protected static final int R_APPROVAL_INQ = 4;
	protected static final int R_MAINT_LOAN = 400;

	protected void processRequest(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
		throws ServletException, IOException {

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
			case R_MAINT_LOAN:
				procReqMaintLoan(user, req, res, session);
				break;
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procReqPassword(HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws IOException {

		UserPos userPO = getUserPos(req);
		
		String appCode = req.getParameter("appCode") == null ? "" : "&appCode=" + req.getParameter("appCode");
		String typCode = req.getParameter("typCode") == null ? "" : "&typCode=" + req.getParameter("typCode");
		String oviCode = req.getParameter("oviCode") == null ? "" : "&oviCode=" + req.getParameter("oviCode");
		String stsCode = req.getParameter("stsCode") == null ? "" : "&stsCode=" + req.getParameter("stsCode");
		String accNum  = req.getParameter("ACCNUM") == null ? ""  : "&ACCNUM="  + req.getParameter("ACCNUM");
		
		userPO.setRedirect( "/servlet/datapro.eibs.salesplatform.JSEPV1400?SCREEN=" + R_APPROVAL + appCode + typCode + oviCode + stsCode + accNum);
		session.setAttribute("userPO", userPO);
		session.removeAttribute("searchParameters");
		
		res.sendRedirect(srctx + "/servlet/datapro.eibs.menu.JSESS0030?SCREEN=7");

	}

	private void procReqApproval(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			//Grab Search Parameters
			EPV140001Message searchParameters = (EPV140001Message) session.getAttribute("searchParameters");
			if(null != searchParameters){
				setMessageRecord(req, searchParameters);
			} else {
				searchParameters = new EPV140001Message();
			}					
			
			
			mp = getMessageProcessor("EPV1400", req);
			EPV140001Message msgList = (EPV140001Message) mp.getMessageRecord("EPV140001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EPV1400");
			msgList.setH01TIMSYS(getTimeStamp());
			setMessageRecord(req, msgList);
			
			msgList.setH01FLGWK1(req.getParameter("typCode") == null ? "" : req.getParameter("typCode").trim());
			msgList.setH01FLGWK2(req.getParameter("oviCode") == null ? "" : req.getParameter("oviCode").trim());
			msgList.setH01FLGWK3(req.getParameter("stsCode") == null ? "" : req.getParameter("stsCode").trim());
			msgList.setE01DEAACD(req.getParameter("appCode") == null ? "" : req.getParameter("appCode").trim());
			
			userPO.setHeader1(req.getParameter("typCode") == null ? "" : req.getParameter("typCode").trim());
			userPO.setHeader2(req.getParameter("oviCode") == null ? "" : req.getParameter("oviCode").trim());
			userPO.setHeader3(req.getParameter("stsCode") == null ? "" : req.getParameter("stsCode").trim());
			userPO.setApplicationCode(req.getParameter("appCode") == null ? "" : req.getParameter("appCode").trim());
			
			mp.sendMessage(msgList);
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
			
			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				forward(devPage, req, res);
			} else {
				JBList beanList = new JBList();
				String accNum = req.getParameter("ACCNUM");
				boolean firstTime = accNum == null;
				String chk = "";
				String chkOfac = "";
				String chkWarn = "";
				StringBuffer myRow = null;
				list.initRow();
				while (list.getNextRow()) {
					msgList = (EPV140001Message) list.getRecord();
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						if (msgList.getE01DEAACC().trim().equals(accNum))
							chk = "checked";
						else
							chk = "";
					}
					myRow = new StringBuffer("<TR>");
					chkOfac = (msgList.getH01FLGWK3().equals("3")? "<a href=\"javascript:showInqOFAC('"	+ msgList.getE01DEAACC()+ "')\"><img src=\"../images/warning_16.jpg\" title=\"OFAC Match List\" align=\"absmiddle\" border=\"0\" ></a>": "");
					chkWarn = (msgList.getH01FLGWK2().equals("A")? "<a href=\"javascript:showInqWarn('"	+ msgList.getE01DEAACC()+ "')\"><img src=\"../images/warning01.gif\" title=\"Warnings\" align=\"absmiddle\" border=\"0\" ></a>": "");
					myRow.append("<TD NOWRAP width=\"5%\"><input type=\"radio\" name=\"ACCNUM\" value=\"" + 
							msgList.getE01DEAACC()+ "\" "	+ chk+ " onclick=\"showAddInfo(" + list.getCurrentRow() + ")\"></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\" width=\"20%\">" +
							"<A HREF=\"javascript:showInqApprovalCredito('" + msgList.getE01DEAACD()	+ "', '"+ msgList.getE01DEAACC() + "', '"+ msgList.getH01FLGWK1()+ "')\">"+ Util.formatCell(msgList.getE01DEAACC())+ "</A>"
							+ chkOfac
							+ chkWarn
							+ "</TD>");
					myRow.append(
						"<TD NOWRAP ALIGN=\"CENTER\" width=\"15%\"><A HREF=\"javascript:showInqApprovalCredito('"
							+ msgList.getE01DEAACD()
							+ "', '"
							+ msgList.getE01DEAACC()
							+ "', '"
							+ msgList.getH01FLGWK1()
							+ "')\">"
							+ Util.formatCell(msgList.getE01DEACUN())
							+ "</A></TD>");
					myRow.append(
						"<TD NOWRAP ALIGN=\"CENTER\" width=\"40%\"><A HREF=\"javascript:showInqApprovalCredito('"
							+ msgList.getE01DEAACD()
							+ "', '"
							+ msgList.getE01DEAACC()
							+ "', '"
							+ msgList.getH01FLGWK1()
							+ "')\">"
							+ Util.formatCell(msgList.getE01CUSNA1())
							+ "</A></TD>");
					myRow.append(
						"<TD NOWRAP ALIGN=\"CENTER\" width=\"20%\"><A HREF=\"javascript:showInqApprovalCredito('"
							+ msgList.getE01DEAACD()
							+ "', '"
							+ msgList.getE01DEAACC()
							+ "', '"
							+ msgList.getH01FLGWK1()
							+ "')\">"
							+ Util.formatCell(msgList.getE01DEATYP())
							+ "&nbsp;"
							+ "&nbsp;"
							+ Util.formatCell(msgList.getE01DEAPRO())
							+ "</A></TD>");
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
				
				session.setAttribute("userPO", userPO);
				session.setAttribute("appList", beanList);
				
				session.setAttribute("searchParameters", searchParameters);
				forward("EPV1400_approval_list.jsp", req, res);
			}
			
			
		} finally {
			if (mp != null) mp.close();
		}		
	}

	private void procActionApproval(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws IOException, ServletException {

		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPV1400", req);
			EPV140002Message msgList = (EPV140002Message) mp.getMessageRecord("EPV140002");
			msgList.setH02USERID(user.getH01USR());
			msgList.setH02PROGRM("EPV1400");
			msgList.setH02TIMSYS(getTimeStamp());

			msgList.setE02DEAACC(req.getParameter("ACCNUM").trim());
			msgList.setE02ACTION(req.getParameter("action").trim());
			msgList.setE02MSGTXT(req.getParameter("reason").trim());
			
			mp.sendMessage(msgList);
			ELEERRMessage msgError = null;
			MessageRecord msg = null;
			EDI001002Message msgImg = null;
			do {
				msg = mp.receiveMessageRecord();
				if (msg.getFormatName().equals("EDI001002")) { //Update SQL Images
					msgImg = (EDI001002Message) msg;
				}
			} while (!msg.getFormatName().equals("ELEERR"));
			
			msgError = (ELEERRMessage) msg;
			
			String appCode = req.getParameter("appCode") == null ? "" : "&appCode=" + req.getParameter("appCode");
			String typCode = req.getParameter("typCode") == null ? "" : "&typCode=" + req.getParameter("typCode");
			String oviCode = req.getParameter("oviCode") == null ? "" : "&oviCode=" + req.getParameter("oviCode");
			String stsCode = req.getParameter("stsCode") == null ? "" : "&stsCode=" + req.getParameter("stsCode");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msg);
				forward("EPV1400_approval_list.jsp", req, res);
			} else {
				if (msgImg != null) {
					//Update SQL Images
					JOApprovalRedirect action = new JOApprovalRedirect(req, res, msgImg.getE02DCIACD(), msgImg.getE02DCIACC());
					action.action(msgImg.getE02DCITYP(), msgImg.getH02FLGWK3(), "/servlet/datapro.eibs.salesplatform.JSEPV1400?SCREEN=2" + appCode + typCode + oviCode + stsCode);
				} else {
					res.sendRedirect(srctx + "/servlet/datapro.eibs.salesplatform.JSEPV1400?SCREEN=2" + appCode + typCode + oviCode + stsCode);
				}
			}
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqApprovalInq(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;

		if (userPO.getHeader20().trim().equals("PRORROGA_CUOTAS")||userPO.getHeader20().trim().equals("PRORROGA_DESPLAZAMIENTO")) {	
			procReqApprovalInqProrroga(user, req, res, session);
		} else {

			try {
				mp = getMessageProcessor("EPV0150", req);
				EPV015001Message msgLN = (EPV015001Message) mp.getMessageRecord("EPV015001");
				msgLN.setH01USERID(user.getH01USR());
				msgLN.setH01PROGRM("EPV0150");
				msgLN.setH01TIMSYS(getTimeStamp());
				msgLN.setH01SCRCOD("01");
				msgLN.setH01OPECOD("0004");
				msgLN.setE01DEAACD("10");
				msgLN.setH01FLGWK1("A");
				
				try {
					msgLN.setE01DEAACC(req.getParameter("ACCNUM").trim());
				} catch (Exception e) {
					msgLN.setE01DEAACC(userPO.getAccNum().trim());
				}
				userPO.setPurpose("APPROVAL_INQ");
				
				mp.sendMessage(msgLN);
				
				ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
				msgLN = (EPV015001Message) mp.receiveMessageRecord("EPV015001");
			
				if (mp.hasError(msgError)) {
					session.setAttribute("error", msgError);
					session.setAttribute("userPO", userPO);
					forward("EPV1400_approval_list.jsp", req, res);
				} else {
					userPO.setIdentifier(msgLN.getE01DEAACC());
					userPO.setAccNum(msgLN.getE01DEAACC());
					userPO.setApplicationCode(msgLN.getE01DEAACD());
					userPO.setBank(msgLN.getE01DEABNK());
					userPO.setHeader1(msgLN.getE01DEAPRO());
					userPO.setProdCode(msgLN.getE01DEAPRO());
					userPO.setHeader2(msgLN.getE01DEACUN());
					userPO.setCusNum(msgLN.getE01DEACUN());
					userPO.setHeader3(msgLN.getE01CUSNA1());
					userPO.setCusName(msgLN.getE01CUSNA1());
					userPO.setCurrency(msgLN.getE01DEACCY());
					userPO.setOfficer(msgLN.getE01DEAOFC() + " - " + msgLN.getE01DSCOFC());
		
					userPO.setHeader23(msgLN.getE01DEACLF());
					userPO.setHeader22(msgLN.getE01DEATLN());
					userPO.setHeader21(msgLN.getE01DEATYP());
		
					session.setAttribute("userPO", userPO);
					session.setAttribute("lnBasic", msgLN);
					session.setAttribute("error", msgError);
					if (userPO.getHeader20().trim().equals("PRORROGA_CUOTAS")||userPO.getHeader20().trim().equals("PRORROGA_DESPLAZAMIENTO"))
					{	
						forward("EPV0150_ln_ap_gen_inf_prorroga.jsp", req, res);
					}
					else
					{
						//Needed For Plan de Pagos, JSPAYMENT PLAN used in ln-paymentplan.jsp	
						session.setAttribute("messageName","lnBasic");						
						session.setAttribute("error", msgError);
						forward("EPV0150_loans_approval_basic.jsp", req, res);
					}
				}
		
			} finally {
				if (mp != null) mp.close();
			}
		
		}

	}
	
	private void procReqApprovalInqProrroga(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws IOException, ServletException {
	
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		MessageRecord newmessage = null;

		try {
			mp = getMessageProcessor("EDL0911", req);
			
			EDL091101Message msg = (EDL091101Message) mp.getMessageRecord("EDL091101");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDL0911");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0004");

			try {
				msg.setE01DEAACC(req.getParameter("ACCNUM").trim());
			} catch (Exception e) {
				msg.setE01DEAACC(userPO.getAccNum().trim());
			}
			
			userPO.setPurpose("AppInquiry");
			userPO.setOption("AppInquiry");

			mp.sendMessage(msg);
		  	newmessage = mp.receiveMessageRecord();			
			
			if (newmessage.getFormatName().equals("ELEERR")){
				ELEERRMessage msgError = (ELEERRMessage) newmessage;
			}	
			msg = (EDL091101Message) newmessage;
	 		JBObjList list = mp.receiveMessageRecordList("E02ENDFLD");
			session.setAttribute("userPO", userPO);
			session.setAttribute("header", msg);
			session.setAttribute("list", list);
			userPO.setHeader21(msg.getE01TIPPRG());
			userPO.setHeader22(msg.getE01NUMMES());
			userPO.setHeader23(msg.getH01FLGWK2());
			
			forward("EDL0911_prorroga_desplazar_fecha.jsp", req, res);

		} finally {
			if (mp != null) mp.close();
		}
		
	}

	private void procReqMaintLoan(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		String accNum = "";
		
		try {
			mp = getMessageProcessor("EPV0150", req);
			
			userPO.setPurpose("MAINTENANCE");
			userPO.setOption("AV");
			
			EPV015001Message msgLoan = (EPV015001Message) mp.getMessageRecord("EPV015001");
			msgLoan.setH01USERID(user.getH01USR());
			msgLoan.setH01PROGRM("EPV0150");
			msgLoan.setH01TIMSYS(getTimeStamp());
			msgLoan.setH01SCRCOD("01");
			msgLoan.setH01OPECOD("0002");
	
			accNum = req.getParameter("ACCNUM") == null ? "0" : req.getParameter("ACCNUM").trim();
			if (!accNum.equals("0")) {
				userPO.setAccNum(accNum.trim());
			}
			msgLoan.setE01DEAACC(userPO.getAccNum());

			mp.sendMessage(msgLoan);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgLoan = (EPV015001Message) mp.receiveMessageRecord();
	
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
			} else {
				userPO.setIdentifier(msgLoan.getE01DEAACC());
				userPO.setAccNum(msgLoan.getE01DEAACC());
				userPO.setApplicationCode(msgLoan.getE01DEAACD());
				userPO.setBank(msgLoan.getE01DEABNK());
				userPO.setHeader1(msgLoan.getE01DEAPRO());
				userPO.setProdCode(msgLoan.getE01DEAPRO());
				userPO.setHeader2(msgLoan.getE01DEACUN());
				userPO.setCusNum(msgLoan.getE01DEACUN());
				userPO.setHeader3(msgLoan.getE01CUSNA1());
				userPO.setCusName(msgLoan.getE01CUSNA1());
				userPO.setCurrency(msgLoan.getE01DEACCY());
				userPO.setOfficer(msgLoan.getE01DEAOFC() + " - " + msgLoan.getE01DSCOFC());
	
				userPO.setHeader23(msgLoan.getE01DEACLF());
				userPO.setHeader22(msgLoan.getE01DEATLN());
				userPO.setHeader21(msgLoan.getE01DEATYP());
	
				session.setAttribute("userPO", userPO);
				session.setAttribute("lnBasic", msgLoan);
				forward("EPV0150_loans_basic_information.jsp", req, res);
			}
						
		} finally {
			if(mp !=null)
				mp.close();
		}
	}

}
