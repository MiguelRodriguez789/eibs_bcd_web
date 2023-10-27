package datapro.eibs.client;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ESD010001Message;
import datapro.eibs.beans.ESD010002Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.products.JOActionRedirect;
import datapro.eibs.sockets.MessageRecord;

public class JSESD0100 extends JSEIBSServlet {

	protected static final int R_PASSWORD 		= 1;
	protected static final int A_APPROVAL 		= 2;
	protected static final int R_APPROVAL_INQ 	= 3;
	protected static final int R_APPROVAL 		= 5;
	protected static final int R_VALID 		    = 9;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case R_PASSWORD:
				procReqPassword(req, res, session);
				break;
			case R_APPROVAL:
				procReqApproval(user, req, res, session);
				break;
			case A_APPROVAL:
				procActionApproval(user, req, res, session);
				break;
			case R_APPROVAL_INQ:
				procReqApprovalInq(user, req, res, session);
				break;
			case R_VALID:
				procReqValidate(user, req, res, session);
				break;	
			default:
				forward(devPage, req, res);
				break;
		}
	}

	private void procReqApprovalInq(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		String accNum = req.getParameter("ACCNUM") == null ? "" : req.getParameter("ACCNUM");
		
		JOActionRedirect red = new JOActionRedirect(ACC_APPROVAL_INQ, 0, accNum, user.getE01LAN(), session);
		res.sendRedirect(srctx + red.action());
	}

	private void procActionApproval(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		MessageProcessor mp = null;
		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) session.getAttribute("userPO");
		try {
			String queue = req.getParameter("QUEUE") == null ? "1" : req.getParameter("QUEUE");
			String area = req.getParameter("AREA") == null ? "CUST" : req.getParameter("AREA");
			mp = getMessageProcessor("ESD0100", req);
			ESD010002Message msgList = (ESD010002Message) mp.getMessageRecord("ESD010002");
			msgList.setH02USERID(user.getH01USR());
			msgList.setH02PROGRM("ESD0100");
			msgList.setH02TIMSYS(getTimeStamp());
			msgList.setH02FLGWK3(area.equals("CUST") ? " " : "3");
			msgList.setH02OPECOD(area.equals("CUST") ? " " : area);
			msgList.setE02CUSCUN(req.getParameter("ACCNUM") == null ? "" : req.getParameter("ACCNUM").trim());
			msgList.setE02OFANRO(req.getParameter("ACCNUM") == null ? "" : req.getParameter("ACCNUM").trim());  
			msgList.setE02ACTION(req.getParameter("action") == null ? "" : req.getParameter("action").trim());
			msgList.setE02MSGTXT(req.getParameter("reason") == null ? "" : req.getParameter("reason").trim());
			
			mp.sendMessage(msgList);
			MessageRecord msg = mp.receiveMessageRecord();
			
			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				forward("ESD0100_approval_list.jsp", req, res);
			} else {
				redirect("/servlet/datapro.eibs.client.JSESD0100?SCREEN=1&QUEUE="+ queue +"&AREA="+ area, res);	
			}
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqApproval(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(session);
		MessageProcessor mp = null;
		String queue;
		String area;
		
		try {
			//Grab Search Parameters
			ESD010001Message searchParameters = (ESD010001Message) session.getAttribute("searchParameters");
			if(null != searchParameters){
				setMessageRecord(req, searchParameters);
			} else {
				searchParameters = new ESD010001Message();
			}			
			
			//Begin Socket Message
			mp = getMessageProcessor("ESD0100", req);
			ESD010001Message msgList = (ESD010001Message) mp.getMessageRecord("ESD010001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("ESD0100");
			msgList.setH01TIMSYS(getTimeStamp());
			setMessageRecord(req, msgList);
			
			queue = req.getParameter("QUEUE") == null ? "1" : req.getParameter("QUEUE");
			area = req.getParameter("AREA") == null ? "CUST" : req.getParameter("AREA");
			if (area.equals("CUST")) {
				if (queue.equals("2")) {
					msgList.setH01OPECOD("0002");      // Control List QUEUE
				} else if (queue.equals("3")) {
					msgList.setH01OPECOD("0003");      // Negocios QUEUE	
				} else if (queue.equals("9")) {
					msgList.setH01OPECOD("0009");      // Taxes QUEUE
				} else {
					msgList.setH01OPECOD("0001");      // Normal QUEUE 
				} 
			} else {
				msgList.setH01OPECOD(area);          // Control List QUEUE 	
			}
			
			mp.sendMessage(msgList);
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
			
			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				forward("error_viewer.jsp", req, res);
			} else {	
				JBList beanList = new JBList();
				StringBuffer myRow = null;
				String chk = "";
				String chkOfac = "";
				String chkWarn = "";
				String chkRej = "";
				String key = "";
				String chkAcc = "";
				String acc = "";
				String chkCus = "";
				String accNum = req.getParameter("ACCNUM");
				boolean firstTime = accNum == null;
				list.initRow();
				while (list.getNextRow()) {
					msgList = (ESD010001Message) list.getRecord();
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						if (msgList.getE01CUSCUN().trim().equals(accNum))
							chk = "checked";
						else
							chk = "";
					}
					myRow = new StringBuffer("<TR>");
					// Add Control List Status : H01FLGWK3 = '3'
					if (msgList.getH01FLGWK3().equals("3")) {
						if(!area.equals("0015") && !area.equals("0020")) {
						  chkOfac = "<a href=\"javascript:showInqOFAC('"+ msgList.getE01CUSLN3()
                  			      + "')\"><img src=\"" + req.getContextPath() + "/images/warning_16.jpg\" title=\"Lista de Control\" align=\"middle\" border=\"0\" ></a>";
						}  
						key = msgList.getE01CUSLN3();
					} else {
						key = msgList.getE01CUSCUN();
					}
					chkCus = "<A HREF=\"javascript:custInquiry('" + msgList.getE01CUSCUN() + "','" + msgList.getH01SCRCOD() + "')\">";
					chkAcc = "";
					acc = msgList.getE01CUSCUN();
					if (!msgList.getE01MOD().equals("1")) {
						if (msgList.getE01MOD().equals("2")) {
						  chkAcc = "<A HREF=\"javascript:showInqApproval('" + msgList.getE01ACD() + "','" + msgList.getE01ACC() + "')\">";
						}
						if (msgList.getE01MOD().equals("3")) {
							  chkAcc = "<A HREF=\"javascript:showInqApprovalDDA('" + msgList.getE01ACD() + "','" + msgList.getE01ACC() + "')\">";
						}
						chkAcc = chkAcc	+ "<img src=\"" + req.getContextPath() + "/images/1bori.gif\" title=\"Consultar Cuenta\" align=\"middle\" border=\"0\" ></a>";
						acc = msgList.getE01ACC();
					}	
					chkWarn = (msgList.getH01FLGWK2().equals("A")? "<a href=\"javascript:showInqWarn('"	+ acc  + "')\"><img src=\"" + req.getContextPath() + "/images/warning01.gif\" alt=\"Alerta\" align=\"middle\" border=\"0\" ></a>": "");
					chkRej = (msgList.getH01FLGWK1().equals("R")? "<a><img src=\"" + req.getContextPath() + "/images/rejected.png\" alt=\"Rechazado\" align=\"middle\" border=\"0\" ></a>": "");
					//
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\" width=\"10%\"><input type=\"radio\" name=\"ACCNUM\" value=\""
									+ key
									+ "\" "
									+ chk
									+ " onclick=\"showAddInfo("
									+ list.getCurrentRow()
									+ ")\"></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"LEFT\" width=\"10%\">"
									+ chkCus
									+ Util.formatCell(msgList.getE01CUSCUN())
									+ "</A>"
									+ chkAcc
									+ chkOfac
									+ chkWarn
									+ chkRej
									+ "</TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\" width=\"50%\">"
									+ chkCus
									+ Util.formatCell(msgList.getE01CUSNA1()) + "</A></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\" width=\"30%\">"
									+ chkCus
									+ Util.formatCell(msgList.getE01CUSIDN()) + "</A>");
					myRow.append("<INPUT TYPE=HIDDEN NAME=\"STSOFAC"
									+ list.getCurrentRow() + "\" VALUE=\""
									+ msgList.getH01FLGWK3() + "\">");
					myRow.append("<INPUT TYPE=HIDDEN NAME=\"TXTDATA"
									+ list.getCurrentRow() + "\" VALUE=\""
									+ Util.formatCell(msgList.getE01CUSRMK())
									+ "<br>");
					myRow.append(Util.formatCell(msgList.getE01CUSTID())
									+ "<br>");
					myRow.append(Util.formatCell(msgList.getE01CUSPID())
									+ "<br>");
					myRow.append(Util.formatCell(msgList.getE01CUSDIB())
									+ "<br>");
					myRow.append(Util.formatCell(msgList.getE01CUSUSR())
									+ "\"></TD>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				userPO.setOption("CLIENT");
				userPO.setPurpose("APPROVAL");
				userPO.setHeader22(area);
				userPO.setHeader23(queue);

				flexLog("Putting java beans into the session");
				session.setAttribute("userPO", userPO);
				session.setAttribute("appList", beanList);
				session.setAttribute("searchParameters", searchParameters);
				
				forward("ESD0100_approval_list.jsp", req, res);
			}
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqValidate(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		MessageProcessor mp = null;
		UserPos userPO = null;
		userPO = (datapro.eibs.beans.UserPos) session.getAttribute("userPO");
		try {
			mp = getMessageProcessor("ESD0100", req);
			ESD010002Message msgList = (ESD010002Message) mp.getMessageRecord("ESD010002");
			msgList.setH02USERID(user.getH01USR());
			msgList.setH02PROGRM("ESD0100");
			msgList.setH02TIMSYS(getTimeStamp());
			msgList.setH02OPECOD("0009");
			msgList.setE02CUSCUN(userPO.getCusNum());
			msgList.setE02ACTION("V");
			
			mp.sendMessage(msgList);
			MessageRecord msg = mp.receiveMessageRecord();
			
			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				msg = mp.receiveMessageRecord();
			} 
			session.setAttribute("client", msg);
			forward("ESD1080_client_relation_check.jsp", req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}
	private void procReqPassword(HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos userPO = getUserPos(session);
		userPO.setRedirect("/servlet/datapro.eibs.client.JSESD0100?SCREEN="
				+ R_APPROVAL
				+ (req.getParameter("QUEUE") == null ? "1" : "&QUEUE=" + req.getParameter("QUEUE"))
				+ (req.getParameter("AREA") == null ? "CUST" : "&AREA=" + req.getParameter("AREA"))
				+ (req.getParameter("ACCNUM") == null ? "" : "&ACCNUM="
						+ req.getParameter("ACCNUM")));

		session.removeAttribute("searchParameters");
		session.setAttribute("userPO", userPO);
		redirect("/servlet/datapro.eibs.menu.JSESS0030?SCREEN=7", res);	
	}

}