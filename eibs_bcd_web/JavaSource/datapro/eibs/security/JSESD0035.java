package datapro.eibs.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD003501Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSESD0035 extends JSEIBSServlet {

	protected static final int R_ENTER  = 1;
	protected static final int R_LIST   = 3;
	protected static final int A_LIST   = 4;
	protected static final int A_MAINT  = 5;
	protected static final int A_DELETE = 6;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case R_ENTER :
				procReqEnter(user, req, res, session);
				break;
			case R_LIST :
				procReqList(user, req, res, session);
				break;
			case A_LIST :
				procActionList(user, req, res, session);
				break;
			case A_MAINT :
				procActionMaintenance(user, req, res, session);
				break;
			case A_DELETE :
				procActionDelete(user, req, res, session);
				break;
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procActionDelete(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		JBObjList codList = (JBObjList) session.getAttribute("codList");
		int row = -1;
		MessageProcessor mp = null;
		try {
			row = Integer.parseInt(req.getParameter("ROW"));
			
			mp = getMessageProcessor("ESD0035", req);
			ESD003501Message msgCode = (ESD003501Message) codList.get(row);
			msgCode.setH01USERID(user.getH01USR());
			msgCode.setH01PROGRM("ESD0035");
			msgCode.setH01TIMSYS(getTimeStamp());
			msgCode.setH01SCRCOD("01");
			msgCode.setH01OPECOD("0004");
			
			mp.sendMessage(msgCode);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgCode = (ESD003501Message) mp.receiveMessageRecord("ESD003501");
				
			if (mp.hasError(msgError)) {
				flexLog("Putting java beans into the session");
				session.setAttribute("error", msgError);
				session.setAttribute("msgCode", msgCode);
				session.setAttribute("userPO", userPO);
				forward("ESD0035_ref_codes_user_access_list.jsp", req, res);
			} else {
				res.sendRedirect(srctx + "/servlet/datapro.eibs.security.JSESD0035?SCREEN=3&E01CREUSR=" + userPO.getIdentifier());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException(e.getMessage());
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0035", req);
			ESD003501Message msgCode = (ESD003501Message) mp.getMessageRecord("ESD003501");
			msgCode.setH01USERID(user.getH01USR());
			msgCode.setH01PROGRM("ESD0035");
			msgCode.setH01TIMSYS(getTimeStamp());
			msgCode.setH01SCRCOD("01");
			msgCode.setH01OPECOD("0005");
			msgCode.setE01CREUSR(userPO.getIdentifier());
			msgCode.setE01CREALL(req.getParameter("E01CREALL") == null ? "" : req.getParameter("E01CREALL"));
			msgCode.setE01CRETCN(req.getParameter("E01CRETCN") == null ? "" : req.getParameter("E01CRETCN"));
			
			mp.sendMessage(msgCode);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgCode = (ESD003501Message) mp.receiveMessageRecord("ESD003501");
				
			if (mp.hasError(msgError)) {
				flexLog("Putting java beans into the session");
				session.setAttribute("error", msgError);
				session.setAttribute("msgCode", msgCode);
				session.setAttribute("userPO", userPO);
				forward("ESD0035_ref_codes_user_access_list.jsp", req, res);
			} else {
				res.sendRedirect(srctx + "/servlet/datapro.eibs.security.JSESD0035?SCREEN=3&E01CREUSR=" + userPO.getIdentifier());
			}
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) {
		
		try {
			int option = Integer.parseInt(req.getParameter("opt"));
			
			switch (option) {
				case 1 : // Add
					procActionMaintenance(user, req, res, session);
					break;
				case 4 : // Delete
					procActionDelete(user, req, res, session);
					break;
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("Invalid option Error");
		}
	}

	private void procReqList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0035", req);
			ESD003501Message msgSearch = (ESD003501Message) mp.getMessageRecord("ESD003501");
			msgSearch.setH01USERID(user.getH01USR());
			msgSearch.setH01PROGRM("ESD0035");
			msgSearch.setH01TIMSYS(getTimeStamp());
			msgSearch.setH01SCRCOD("01");
			msgSearch.setH01OPECOD("0015");
			//all the fields here
			try {
				msgSearch.setE01CREUSR(req.getParameter("E01CREUSR") == null ? "" : req.getParameter("E01CREUSR"));
			} catch (Exception e) {
				msgSearch.setE01CREUSR("");
			}
			userPO.setIdentifier(msgSearch.getE01CREUSR());
			
			mp.sendMessage(msgSearch);
			
			ELEERRMessage msgError = new ELEERRMessage();
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
			
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
				pageName = "ESD0035_ref_codes_user_access_enter.jsp";
			} else {
				pageName = "ESD0035_ref_codes_user_access_list.jsp";
			}
			flexLog("Putting java beans into the session");
			session.setAttribute("codList", list);
			session.setAttribute("userPO", userPO);
			session.setAttribute("error", msgError);
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqEnter(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		session.setAttribute("user", new ESD003501Message());
		session.setAttribute("error", new ELEERRMessage());
		
		forward("ESD0035_ref_codes_user_access_enter.jsp", req, res);
	}

}
