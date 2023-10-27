package datapro.eibs.products;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EGL001201Message;
import datapro.eibs.beans.EGL001202Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;

public class JSEGL0012 extends JSEIBSServlet {

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
		
		int appCode;
		try {
			appCode = Integer.parseInt(req.getParameter("appCode"));
		} catch (Exception e) {
			appCode = 0;
		}
		String bthNum = req.getParameter("BTHNUM") == null ? "" : req.getParameter("BTHNUM").trim();
		String typeCode = req.getParameter("typeCode") == null ? "" : req.getParameter("typeCode").trim();
		
		JOActionRedirect red =
			new JOActionRedirect(
				typeCode,
				ACC_APPROVAL_INQ,
				appCode,
				bthNum,
				getLangPath(user),
				session);
		res.sendRedirect(srctx + red.action());
	}

	private void procActionApproval(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);

		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EGL0012", req);
			EGL001202Message msgList = (EGL001202Message) mp.getMessageRecord("EGL001202");
			msgList.setH02USERID(user.getH01USR());
			msgList.setH02PROGRM("EGL0012");
			msgList.setH02TIMSYS(getTimeStamp());
			msgList.setE02BTHNUM(req.getParameter("BTHNUM"));
			msgList.setE02ACTION(req.getParameter("action"));
			msgList.setE02MSGTXT(req.getParameter("reason"));

			mp.sendMessage(msgList);
			MessageRecord msg = mp.receiveMessageRecord();

			if (mp.hasError(msg)) {
				msgError = (ELEERRMessage) msg;
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);

				forward("EGL0012_approval_list.jsp", req, res);
			} else {
				procReqApproval(user, req, res, session);
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
			mp = getMessageProcessor("EGL0012", req);
			EGL001201Message msgList = (EGL001201Message) mp.getMessageRecord("EGL001201");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EGL0012");
			msgList.setH01TIMSYS(getTimeStamp());

			mp.sendMessage(msgList);
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "error_viewer.jsp";
			} else {
				String bthNum = req.getParameter("BTHNUM");
				boolean firstTime = bthNum == null;
				StringBuffer myRow = null;
				int indexRow = 0;
				String chk = "";
				JBList beanList = new JBList();
				Iterator iterator = list.iterator();
				while (iterator.hasNext()) {
					msgList = (EGL001201Message) iterator.next();
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = msgList.getE01BTHNUM().trim().equals(bthNum) ? "checked" : "";
					}
					myRow = new StringBuffer("<TR>");
					myRow.append(
						"<TD NOWRAP ALIGN=\"CENTER\" width=\"10%\"><input type=\"radio\" name=\"BTHNUM\" value=\""
							+ msgList.getE01BTHNUM()
							+ "\" "
							+ chk
							+ " onclick=\"showAddInfo("
							+ indexRow
							+ ")\"></TD>");
					myRow.append(
						"<TD NOWRAP ALIGN=\"CENTER\" width=\"10%\"><A HREF=\"javascript:showInqApprovalBatch('"
							+ msgList.getE01BTHNUM()
							+ "', '"
							+ msgList.getE01ORGBNK()
							+ "', '"
							+ msgList.getE01ORGBRN()
							+ "')\">"
							+ Util.formatCell(msgList.getE01BTHNUM())
							+ "</A></TD>");
					myRow.append(
						"<TD NOWRAP ALIGN=\"CENTER\" width=\"10%\"><A HREF=\"javascript:showInqApprovalBatch('"
							+ msgList.getE01BTHNUM()
							+ "', '"
							+ msgList.getE01ORGBNK()
							+ "', '"
							+ msgList.getE01ORGBRN()
							+ "')\">"
							+ Util.formatCell(msgList.getE01ORGBNK())
							+ "</A></TD>");
					myRow.append(
						"<TD NOWRAP ALIGN=\"CENTER\" width=\"10%\"><A HREF=\"javascript:showInqApprovalBatch('"
							+ msgList.getE01BTHNUM()
							+ "', '"
							+ msgList.getE01ORGBNK()
							+ "', '"
							+ msgList.getE01ORGBRN()
							+ "')\">"
							+ Util.formatCell(msgList.getE01ORGBRN())
							+ "</A></TD>");
					myRow.append(
						"<TD NOWRAP ALIGN=\"CENTER\" width=\"10%\"><A HREF=\"javascript:showInqApprovalBatch('"
							+ msgList.getE01BTHNUM()
							+ "', '"
							+ msgList.getE01ORGBNK()
							+ "', '"
							+ msgList.getE01ORGBRN()
							+ "')\">"
							+ Util.formatDate(
								msgList.getE01RUNDT1(),
								msgList.getE01RUNDT2(),
								msgList.getE01RUNDT3())
							+ "</A></TD>");
					myRow.append(
						"<TD NOWRAP ALIGN=\"CENTER\" width=\"10%\"><A HREF=\"javascript:showInqApprovalBatch('"
							+ msgList.getE01BTHNUM()
							+ "', '"
							+ msgList.getE01ORGBNK()
							+ "', '"
							+ msgList.getE01ORGBRN()
							+ "')\">"
							+ Util.formatCell(msgList.getE01USROPE())
							+ "</A></TD>");
					myRow.append(
						"<TD NOWRAP ALIGN=\"CENTER\" width=\"10%\"><A HREF=\"javascript:showInqApprovalBatch('"
							+ msgList.getE01BTHNUM()
							+ "', '"
							+ msgList.getE01ORGBNK()
							+ "', '"
							+ msgList.getE01ORGBRN()
							+ "')\">"
							+ Util.formatCell(msgList.getE01STATUS())
							+ "</A></TD>");
					myRow.append(
						"<TD NOWRAP ALIGN=\"RIGHT\" width=\"10%\"><A HREF=\"javascript:showInqApprovalBatch('"
							+ msgList.getE01BTHNUM()
							+ "', '"
							+ msgList.getE01ORGBNK()
							+ "', '"
							+ msgList.getE01ORGBRN()
							+ "')\">"
							+ Util.formatCCY(msgList.getE01TOTDEB())
							+ "</A></TD>");
					myRow.append(
						"<TD NOWRAP ALIGN=\"RIGHT\" width=\"10%\"><A HREF=\"javascript:showInqApprovalBatch('"
							+ msgList.getE01BTHNUM()
							+ "', '"
							+ msgList.getE01ORGBNK()
							+ "', '"
							+ msgList.getE01ORGBRN()
							+ "')\">"
							+ Util.formatCCY(msgList.getE01TOTCRE())
							+ "</A></TD>");
					myRow.append(
						"<TD NOWRAP ALIGN=\"CENTER\" width=\"10%\"><A HREF=\"javascript:showInqApprovalBatch('"
							+ msgList.getE01BTHNUM()
							+ "', '"
							+ msgList.getE01ORGBNK()
							+ "', '"
							+ msgList.getE01ORGBRN()
							+ "')\">"
							+ Util.formatCell(msgList.getE01TOTTRN())
							+ "</A></TD>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
					indexRow++;
				}
				
				userPO.setPurpose("APPROVAL");
				session.setAttribute("appList", beanList);
				
				if (beanList.getNoResult()) {
					pageName = "MISC_no_result.jsp";
				} else {
					pageName = "EGL0012_approval_list.jsp";
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
		userPO.setRedirect(
				"/servlet/datapro.eibs.products.JSEGL0012?SCREEN="
					+ R_APPROVAL
					+ "&appCode="
					+ req.getParameter("appCode"));
		session.setAttribute("userPO", userPO);
		res.sendRedirect(srctx + "/servlet/datapro.eibs.menu.JSESS0030?SCREEN=7");
	}

}
