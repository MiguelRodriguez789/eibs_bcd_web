package datapro.eibs.credit;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ELN004001Message;
import datapro.eibs.beans.ELN004002Message;
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
public class JSELN0040 extends JSEIBSServlet {

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
		
		int appCode = 0;
		try {
			appCode = Integer.parseInt(req.getParameter("appCode"));
		} catch (Exception e) {
			appCode = 0;
		}
  		String cus_line = req.getParameter("ACCNUM") == null ? "" : req.getParameter("ACCNUM");
		String cusNum = Util.leftValue(cus_line);
		String lnNum = Util.rightValue(cus_line);
		
		JOActionRedirect red =
			new datapro.eibs.products.JOActionRedirect(
				lnNum,
				ACC_APPROVAL_INQ,
				appCode,
				cusNum,
				getLangPath(user),
				session);
		res.sendRedirect(srctx + red.action());
	}

	private void procActionApproval(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELN0040", req);
			ELN004002Message msgList = (ELN004002Message) mp.getMessageRecord("ELN004002");
			msgList.setH02USERID(user.getH01USR());
		 	msgList.setH02PROGRM("ELN0040");
		 	msgList.setH02TIMSYS(getTimeStamp());
		 	
		 	String cus_line = req.getParameter("ACCNUM") == null ? "" : req.getParameter("ACCNUM");
			try {
				String cusNum = Util.leftValue(cus_line);
			 	msgList.setE02LNECUN(cusNum);
			} catch (Exception e) {
			 	msgList.setE02LNECUN("0");
			}
			try {
				String lnNum = Util.rightValue(cus_line);
			 	msgList.setE02LNENUM(lnNum);
			} catch (Exception e) {
			 	msgList.setE02LNENUM("0");
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
		 	MessageRecord msg = mp.receiveMessageRecord();
			
		 	if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				forward("ELN0040_approval_list.jsp", req, res);
		 	} else {
				res.sendRedirect(srctx + "/servlet/datapro.eibs.credit.JSELN0040?SCREEN=1");
		 	}
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqApproval(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0140", req);
			ELN004001Message msgList = (ELN004001Message) mp.getMessageRecord("ELN004001");
			msgList.setH01USERID(user.getH01USR());
		 	msgList.setH01PROGRM("ESS0090");
		 	msgList.setH01TIMSYS(getTimeStamp());
		 	try {
		 		msgList.setH01FLGWK1(userPO.getOption());
		 	} catch(Exception e) {
		 		msgList.setH01FLGWK1("");
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
				String key = "";
				String chk = "";
				list.initRow();
				while (list.getNextRow()) {
					msgList = (ELN004001Message) list.getRecord();
					key = msgList.getE01LNECUN().trim() + "_" + msgList.getE01LNENUM().trim();
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = key.trim().equals(accNum) ? "checked" : "";
					}
					myRow = new StringBuffer("<TR>");
					myRow
							.append("<TD NOWRAP align=\"CENTER\"><input type=\"radio\" name=\"ACCNUM\" value=\""
									+ key
									+ "\" "
									+ chk
									+ " onclick=\"showAddInfo("
									+ list.getCurrentRow()
									+ ")\"></TD>");
					myRow
							.append("<TD NOWRAP align=\"CENTER\"><A HREF=\"javascript:showInqApprovalCL('"
									+ msgList.getE01LNEACD()
									+ "', '"
									+ key
									+ "')\">"
									+ Util.formatCell(msgList.getE01LNECUN())
									+ "</A></TD>");
					myRow
							.append("<TD NOWRAP align=\"CENTER\"><A HREF=\"javascript:showInqApprovalCL('"
									+ msgList.getE01LNEACD()
									+ "', '"
									+ key
									+ "')\">"
									+ Util.formatCell(msgList.getE01LNENUM())
									+ "</A></TD>");
					myRow
							.append("<TD NOWRAP><A HREF=\"javascript:showInqApprovalCL('"
									+ msgList.getE01LNEACD()
									+ "', '"
									+ key
									+ "')\">"
									+ Util.formatCell(msgList.getE01CUSNA1())
									+ "</A></TD>");
					myRow
							.append("<TD NOWRAP><A HREF=\"javascript:showInqApprovalCL('"
									+ msgList.getE01LNEACD()
									+ "', '"
									+ key
									+ "')\">"
									+ Util.formatCell(msgList.getE01OPETYP())
									+ "</A></TD>");
					myRow
							.append("<TD NOWRAP ALIGN=\"RIGHT\"><A HREF=\"javascript:showInqApprovalCL('"
									+ msgList.getE01LNEACD()
									+ "', '"
									+ key
									+ "')\">"
									+ Util.fcolorCCY(msgList.getE01LNEAMN())
									+ "</A></TD>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setLastRec(list.getLastRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				userPO.setPurpose("APPROVAL");
				userPO.setOption("CL");
				flexLog("Putting java beans into the session");
				session.setAttribute("userPO", userPO);
				session.setAttribute("appList", beanList);
				session.setAttribute("error", new ELEERRMessage());
				
				if (beanList.getNoResult()) {
					pageName = "MISC_no_result.jsp";
				} else {
					pageName = "ELN0040_approval_list.jsp";
				}
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqPassword(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException {
		
		String account = req.getParameter("ACCNUM") == null ? "" : "&ACCNUM=" + req.getParameter("ACCNUM");
		
		UserPos userPO = getUserPos(req);
		String option = "";
		try {
	 		option = req.getParameter("OPTION");
	 	} catch(Exception e) {
	 		option = "";
	 	}
		userPO.setOption(option);
		userPO.setRedirect(
				"/servlet/datapro.eibs.credit.JSELN0040?SCREEN="
					+ R_APPROVAL
					+ account);
		session.setAttribute("userPO", userPO);
		res.sendRedirect(srctx + "/servlet/datapro.eibs.menu.JSESS0030?SCREEN=7");
	}

}
