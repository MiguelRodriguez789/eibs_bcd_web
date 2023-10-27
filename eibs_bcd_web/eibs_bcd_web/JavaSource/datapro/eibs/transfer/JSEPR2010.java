package datapro.eibs.transfer;

/**
 * Insert the type's description here.
 * Creation date: (5/11/2004 4:02:17 PM)
 * @author: Ramses Amaro
**/

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EPR200001Message;
import datapro.eibs.beans.EPR201001Message;
import datapro.eibs.beans.EPR201002Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;

public class JSEPR2010 extends JSEIBSServlet {

	protected static final int R_APPROVAL = 5;
	protected static final int A_APPROVAL = 2;
	protected static final int R_APPROVAL_INQ = 3;
	protected static final int R_PASSWORD = 100;
	
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
			procReqApprovalInqury(user, req, res, session);
			break;
		default :
			forward(devPage, req, res);
			break;
		}
	}
/*
	private void procReqApprovalInq(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos userPO = getUserPos(req);
		int appCode = 0;
		try {
			appCode = Integer.parseInt(req.getParameter("appCode"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		String accNum = req.getParameter("ACCNUM");
		String typeCode = req.getParameter("typeCode");
		
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
*/
	private void procReqApprovalInqury(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPR2000", req);
			EPR200001Message prBasic = (EPR200001Message) mp.getMessageRecord("EPR200001");
			prBasic.setH01USERID(user.getH01USR());
			prBasic.setH01PROGRM("EPR2010");
			prBasic.setH01TIMSYS(getTimeStamp());
			prBasic.setH01SCRCOD("01");
			prBasic.setH01OPECOD("0004");
			try {
 				prBasic.setE01PRPDBK(req.getParameter("bank").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
 				prBasic.setE01PRPDAC(req.getParameter("account").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
 				prBasic.setE01PRPNUM(req.getParameter("reference").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}

			mp.sendMessage(prBasic);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			prBasic = (EPR200001Message) mp.receiveMessageRecord("EPR200001");

			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "EPR2010_pr_app_inquiry.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("prBasic", prBasic);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionApproval(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		MessageProcessor mp = null;
		try {
			int row = Integer.parseInt(req.getParameter("ROW"));
			JBObjList beanList = (JBObjList) session.getAttribute("appList");
			EPR201001Message bean = (EPR201001Message) beanList.get(row);
			
			mp = getMessageProcessor("EPR2010", req);
			EPR201002Message msgList = (EPR201002Message) mp.getMessageRecord("EPR201002");
			msgList.setH02USERID(user.getH01USR());
			msgList.setH02PROGRM("EPR2010");
			msgList.setH02TIMSYS(getTimeStamp());
			msgList.setE02PRPNUM(bean.getE01PRPNUM());
			msgList.setE02PRPDAC(bean.getE01PRPDAC());
			msgList.setE02PRPDBK(bean.getE01PRPDBK());
			try {
				msgList.setE02ACTION(req.getParameter("action").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msgList.setE02MSGTXT(req.getParameter("reason").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}

			mp.sendMessage(msgList);
			MessageRecord msg = mp.receiveMessageRecord();

			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
				forward("EPR2010_approval_list.jsp", req, res);
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
			mp = getMessageProcessor("EPR2010", req);
			EPR201001Message msgList = (EPR201001Message) mp.getMessageRecord("EPR201001");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EPR2010");
			msgList.setH01TIMSYS(getTimeStamp());

			mp.sendMessage(msgList);
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "error_viewer.jsp";
			} else {
				session.setAttribute("appList", list);
				if (list.isEmpty()) {
					pageName = "MISC_no_result.jsp";
				} else {
					pageName = "EPR2010_approval_list.jsp";
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
		userPO.setRedirect("/servlet/datapro.eibs.transfer.JSEPR2010?SCREEN=" + R_APPROVAL);
		
		res.sendRedirect(srctx + "/servlet/datapro.eibs.menu.JSESS0030?SCREEN=7");
	}

}