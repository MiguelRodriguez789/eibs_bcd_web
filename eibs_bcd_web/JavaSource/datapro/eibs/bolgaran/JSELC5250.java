package datapro.eibs.bolgaran;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.approval.JOApprovalRedirect;
import datapro.eibs.beans.EDI001002Message;
import datapro.eibs.beans.ELC500001Message;
import datapro.eibs.beans.ELC525001Message;
import datapro.eibs.beans.ELC525002Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.products.JOActionRedirect;
import datapro.eibs.sockets.MessageRecord;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSELC5250 extends JSEIBSServlet {

	protected static final int R_APPROVAL			= 5;
	protected static final int A_APPROVAL			= 2;
	protected static final int R_APPROVAL_INQ		= 3;
	protected static final int R_PASSWORD 			= 1;
	protected static final int PRINT_BG				= 11;
	protected static final int INF_CLIENTE_BG		= 12;
	
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
			case PRINT_BG :
				procActionEnterMaint(user, req, res, session);
				break;
			default :
				forward("MISC_not_available.jsp", req, res);
				break;
		}
	}

	private void procActionEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC5000", req);
			ELC500001Message msgBol = (ELC500001Message) mp.getMessageRecord("ELC500001", user.getH01USR(), "0002");
		 	msgBol.setH01SCRCOD("01");
		 	msgBol.setE01LCMACD("43");		
			msgBol.setE01LCMACC(req.getParameter("NUM") == null ? "" : req.getParameter("NUM"));		
			
			mp.sendMessage(msgBol);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgBol = (ELC500001Message) mp.receiveMessageRecord("ELC500001");
			
			session.setAttribute("bolgaran", msgBol);
			session.setAttribute("error", msgError);
			
			forward("ELC5250_det_boletag.jsp", req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procReqApprovalInq(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		int appCode = 43; 
		String accNum = req.getParameter("ACCNUM") == null ? "" : req.getParameter("ACCNUM");
		String typeCode = req.getParameter("typeCode") == null ? "" : req.getParameter("typeCode");

		JOActionRedirect red = new JOActionRedirect(typeCode,ACC_APPROVAL_INQ, appCode, accNum, getLangPath(user), session);
		res.sendRedirect(srctx + red.action());
	}

	private void procActionApproval(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		String boleta = req.getParameter("ACCNUM") == null ? "" : req.getParameter("ACCNUM");
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC5250", req);
			ELC525002Message msgList = (ELC525002Message) mp.getMessageRecord("ELC525002", user.getH01USR(), "");
			
			msgList.setH02FLGWK2(req.getParameter("H02FLGWK2") == null ? "" : req.getParameter("H02FLGWK2").trim());
			msgList.setE02LCMACC(boleta);
		 	msgList.setE02ACTION(req.getParameter("action") == null ? "" : req.getParameter("action"));
		 	msgList.setE02MSGTXT(req.getParameter("reason") == null ? "" : req.getParameter("reason"));
		 	
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
		 	
		 	if (mp.hasError(msgError)) {
		 		session.setAttribute("error", msgError);
		 		forward("ELC5250_approval_list.jsp", req, res);
		 	} else {
		 		String typCode = req.getParameter("typCode") == null ? "" : "&typCode=" + req.getParameter("typCode");
		 		String appCode = req.getParameter("appCode") == null ? "" : "&appCode=" + req.getParameter("appCode");
				if (msgImg != null) {
					//Update SQL Images
					JOApprovalRedirect action = new JOApprovalRedirect(req, res, msgImg.getE02DCIACD(), msgImg.getE02DCIACC());
					action.action(msgImg.getE02DCITYP(), msgImg.getH02FLGWK3(), "/servlet/datapro.eibs.bolgaran.JSELC5250?SCREEN=5" + appCode + typCode);
				} else {
					res.sendRedirect(srctx + "/servlet/datapro.eibs.bolgaran.JSELC5250?SCREEN=5" + appCode + typCode);
				}
		 	}
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procReqApproval(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos	userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			
			userPO.setPurpose("APPROVAL");
			//Grab Search Parameters
			ELC525001Message searchParameters = (ELC525001Message) session.getAttribute("searchParameters");
			if(null != searchParameters){
				setMessageRecord(req, searchParameters);
			} else {
				searchParameters = new ELC525001Message();
			}				
			
			
			mp = getMessageProcessor("ELC5250", req);
			ELC525001Message msgList = (ELC525001Message) mp.getMessageRecord("ELC525001", user.getH01USR(), "");
		 	msgList.setE01LCMACD("43");
			setMessageRecord(req, msgList);			
		 	
			mp.sendMessage(msgList);
			
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
			ELEERRMessage msgError = new ELEERRMessage();
			
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
				pageName = "error_viewer.jsp";
			} else {
				JBList beanList = new JBList();
				String accNum = req.getParameter("ACCNUM");
				boolean firstTime = accNum == null;
				String chk = "";
				String chkOfac = "";
				String chkWarn = "";
				StringBuffer myRow = null;
				int indexRow = 0;
				list.initRow();
				while (list.getNextRow()) {
					msgList = (ELC525001Message) list.getRecord();
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = msgList.getE01LCMACC().trim().equals(accNum) ? "checked" : "";
					}
					myRow = new StringBuffer("<TR style=\"width:100%\">");
					// mod EMAT 10/01/2001
					// add ofac status : H01FLGWK3 = '3'
					// mod EMAT 10/25/2001
					// add warning status : H01FLGWK2 = 'A'
					chkOfac = (msgList.getH01FLGWK3().equals("3") ? "<a href=\"javascript:showInqOFAC('" + msgList.getE01LCMACC() + "','" + msgList.getH01FLGWK1() +"')\"><img src=\"../images/warning_16.jpg\" alt=\"Lista de Control\" align=\"absmiddle\" border=\"0\" ></a>" : "");
					chkWarn = (msgList.getH01FLGWK2().equals("A") ? "<a href=\"javascript:showInqWarn('" + msgList.getE01LCMACC() + "','" + msgList.getH01FLGWK1() + "')\"><img src=\"../images/warning01.gif\" alt=\"Warnings\" align=\"absmiddle\" border=\"0\" ></a>" : "");
					myRow.append("<TD ALIGN=\"CENTER\"><input type=\"radio\" name=\"ACCNUM\" value=\"" + msgList.getE01LCMACC() + "\" " + chk + " onclick=\"showAddInfo("+indexRow+")\"></TD>");
					myRow.append("<TD ALIGN=\"CENTER\" ><A HREF=\"javascript:showInqApprovalBG('" + msgList.getE01LCMACC() + "','" + msgList.getH01FLGWK1() + "')\">" + Util.formatCell(msgList.getE01LCMACC()) + "</A>"+chkOfac+chkWarn+"</TD>");
					myRow.append("<TD ALIGN=\"CENTER\" ><A HREF=\"javascript:showInqApprovalBG('" + msgList.getE01LCMACC() + "','" + msgList.getH01FLGWK1() + "')\">" + Util.formatCell(msgList.getE01LCMCUN()) + "</A></TD>");
					myRow.append("<TD ><A HREF=\"javascript:showInqApprovalBG('" + msgList.getE01LCMACC() + "','" + msgList.getH01FLGWK1() + "')\">" + Util.formatCell(msgList.getE01CUSNA1())  + "</A></TD>");
					myRow.append("<TD ALIGN=\"CENTER\"> <A HREF=\"javascript:showInqApprovalBG('" + msgList.getE01LCMACC() + "','" + msgList.getH01FLGWK1() + "')\">" + Util.formatCell(msgList.getE01LCMATY() + "/" +  msgList.getE01LCMPRO()) + "</A>");
					myRow.append("<INPUT TYPE=HIDDEN NAME=\"STSOFAC"+indexRow+"\" VALUE=\"" + msgList.getH01FLGWK3() + "\">");
					myRow.append("<INPUT TYPE=HIDDEN NAME=\"STSWARN"+indexRow+"\" VALUE=\"" + msgList.getH01FLGWK2() + "\">");
					
					myRow.append("<INPUT TYPE=HIDDEN NAME=\"TXTDATA"+indexRow+"\" VALUE=\"" + Util.formatCell(msgList.getE01LCMRMK()) + "<br>");
					myRow.append(Util.formatCell(msgList.getE01LCMAMT()) + "<br>");
					myRow.append(Util.formatCell(msgList.getE01LCMCCY()) + "<br>");
					myRow.append(Util.formatCell(msgList.getE01LCMBNK()) + "<br>");
					myRow.append(Util.formatCell(msgList.getE01LCMBRN()) + "<br>");					
					myRow.append(Util.formatCell(msgList.getE01LCMGLN()) + "<br>");
					myRow.append(Util.formatCell(msgList.getE01LCMCCN()) + "<br>");
					myRow.append(Util.formatCell(msgList.getE01LCMUBT()) + "<br>");
					myRow.append(Util.formatCell(msgList.getE01LCMUSR()) + "<br>");
					myRow.append(Util.formatCell(msgList.getE01FLGBUS()) + "<br>");
					myRow.append(Util.formatCell(msgList.getE01FLGIBF()) + "<br>");
					myRow.append(Util.formatCell(msgList.getE01FLGTYP()) + "\"></TD>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
					indexRow ++;				
				}
				beanList.setShowNext(list.getShowNext());
				session.setAttribute("appList", beanList);
				session.setAttribute("searchParameters", searchParameters);
				
				pageName = "ELC5250_approval_list.jsp";
			}
			flexLog("Putting java beans into the session");
			session.setAttribute("userPO", userPO);
			session.setAttribute("error", msgError);
			
		 	forward(pageName, req, res);
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procReqPassword(HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos	userPO = getUserPos(req);
		userPO.setRedirect("/servlet/datapro.eibs.bolgaran.JSELC5250?SCREEN=" + R_APPROVAL + (req.getParameter("ACCNUM") == null ? "" : "&ACCNUM=" + req.getParameter("ACCNUM")));
		session.setAttribute("userPO", userPO);
		res.sendRedirect(srctx +"/servlet/datapro.eibs.menu.JSESS0030?SCREEN=7");
		
		session.removeAttribute("searchParameters");
	}

}
