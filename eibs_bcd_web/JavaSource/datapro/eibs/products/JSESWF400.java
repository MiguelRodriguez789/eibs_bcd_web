package datapro.eibs.products;

/**
 * Insert the type's description here.
 * Creation date: (2/15/12 6:38:55 PM)
 * @author: Luis Crosby
 */
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.ESWF40001Message;
import datapro.eibs.beans.ESWF40002Message;
import datapro.eibs.beans.ESWF40003Message;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

public class JSESWF400 extends JSEIBSServlet {

	protected static final int R_SEARCH = 100;
	protected static final int R_SEARCH_COLL = 107;
	protected static final int A_SEARCH = 6;
	protected static final int R_NEW = 7;
	protected static final int R_MAINT = 71;
	protected static final int A_NEW_MAINT = 8;
	protected static final int A_VALIDATE = 26;
	/**
	 * 
	 */
	protected static final int R_PASSWORD = 1;
	protected static final int R_APPROVAL = 500;
	protected static final int R_APPROVAL_COLL = 507;
	
	protected static final int A_APPROVAL = 501;
	protected static final int A_DELETE = 502;
	protected static final int A_REJECT = 503;

	protected static final int A_LOGS = 18;

	protected static final int R_T_APPROVAL = 6;
	protected static final int R_COPY = 10;

	protected static final int R_INQ = 3;
	protected static final int R_INQ_A = 9;
	
	protected static final int R_SEARCH_FF = 900;
	protected static final int R_SEARCH_COLL_FF = 950;
	protected static final int A_SEARCH_FF = 906;
	protected static final int R_NEW_FF = 907;
	protected static final int R_MAINT_FF = 971;
	protected static final int A_NEW_MAINT_FF = 908;
	protected static final int A_VALIDATE_FF = 926;
	/**
	 * 
	 */
	protected static final int R_PASSWORD_FF = 901;
	protected static final int R_APPROVAL_FF = 905;
	protected static final int R_APPROVAL_COLL_FF = 955;
	
	protected static final int A_APPROVAL_FF = 9501;
	protected static final int A_DELETE_FF = 9502;
	protected static final int A_REJECT_FF = 9503;

	protected static final int A_LOGS_FF = 918;

	protected static final int R_T_APPROVAL_FF = 96;
	protected static final int R_COPY_FF = 10;

	protected static final int R_INQ_FF = 903;
	protected static final int R_INQ_A_FF = 909;

	protected String LangPath = "S";

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		switch (screen) {
		case R_SEARCH:
			procReqSearch(user, req, res, session);
			break;
		case R_SEARCH_FF:
			procReqSearchFF(user, req, res, session);
			break;
		case R_SEARCH_COLL:
			procReqCollSearch(user, req, res, session);
			break;	
		case R_SEARCH_COLL_FF:
			procReqCollSearchFF(user, req, res, session);
			break;	
		case R_APPROVAL:
		case R_APPROVAL_COLL:			
		case A_SEARCH:
			procActionSearch(user, req, res, session, screen);
			break;
		case R_APPROVAL_FF:
		case R_APPROVAL_COLL_FF:
		case A_SEARCH_FF:
			procActionSearchFF(user, req, res, session, screen);
			break;
		case R_NEW:
			procReqNew(user, req, res, session);
			break;
		case R_NEW_FF:
			procReqNewFF(user, req, res, session);
			break;
		case R_MAINT:
		case R_INQ_A:
			procReqMaint(user, req, res, session, screen);
			break;
		case R_MAINT_FF:
		case R_INQ_A_FF:
			procReqMaintFF(user, req, res, session, screen);
			break;
		case A_NEW_MAINT:
			procActionNewMaint(user, req, res, session, screen);
			break;
		case A_NEW_MAINT_FF:
			procActionNewMaintFF(user, req, res, session, screen);
			break;
		case A_VALIDATE:
			procActionNewMaint(user, req, res, session, screen);
			break;
		case A_VALIDATE_FF:
			procActionNewMaintFF(user, req, res, session, screen);
			break;
		case A_APPROVAL:
		case A_DELETE:
		case A_REJECT:
			procActionApprovalDeleteReject(user, req, res, session);
			break;
		case A_APPROVAL_FF:
		case A_DELETE_FF:
		case A_REJECT_FF:
			procActionApprovalDeleteRejectFF(user, req, res, session);
			break;
		}
	}

	/**
	 * LCrosby
	 */
	private void procReqSearch(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession ses) throws ServletException {
		String PageToCall = "";
		try {
			PageToCall = "/pages/s/ESWF400_lc_qa_enter_maint.jsp";
			callPage(PageToCall, req, res);

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage());
		}
	}
	
	private void procReqSearchFF(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession ses) throws ServletException {
		String PageToCall = "";
		try {
			PageToCall = "/pages/s/ESWF400_lc_ff_enter_maint.jsp";
			callPage(PageToCall, req, res);

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage());
		}
	}
	
	/**
	 * LCrosby
	 */
	private void procReqCollSearch(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession ses) throws ServletException {
		String PageToCall = "";
		try {
			PageToCall = "/pages/s/ESWF400_lc_qa_enter_maint.jsp";
			req.setAttribute("typ", "COLL");
			callPage(PageToCall, req, res);

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage());
		}
	}	
	
	private void procReqCollSearchFF(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession ses) throws ServletException {
		String PageToCall = "";
		try {
			PageToCall = "/pages/s/ESWF400_lc_ff_enter_maint.jsp";
			req.setAttribute("typ", "COLL");
			callPage(PageToCall, req, res);

		} catch (Exception e) {
			throw new ServletException(e.getClass().getName() + " --> "
					+ e.getMessage());
		}
	}	

	/**
	 * LCrosby
	 */
	protected void procReqNew(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		UserPos userPO = (datapro.eibs.beans.UserPos) session
				.getAttribute("userPO");

		String typ = "";
		
		MessageProcessor mp = null;
		try {
			
			userPO.setPurpose("NEW");
			
			mp = getMessageProcessor("ESWF400", req);

			ESWF40002Message lcqa = (ESWF40002Message) mp.getMessageRecord(
					"ESWF40002", user.getH01USR(), "0001");
			lcqa.setE02LCOACC(req.getParameter("LCOACC"));
			
			typ = req.getParameter("typ") !=null ? req.getParameter("typ") : "";
			
			if (typ.equals("COLL"))
				lcqa.setH02FLGWK3("7");
			else
				lcqa.setH02FLGWK3("4");			
			
			mp.sendMessage(lcqa);
			lcqa = (ESWF40002Message) mp.receiveMessageRecord();

			req.setAttribute ("typ", typ);
			
			req.setAttribute("LCOACC", req.getParameter("LCOACC"));
			session.setAttribute("userPO", userPO);
			session.setAttribute("lcqa", lcqa);
			forward("ESWF400_lc_qa_format_maint.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	protected void procReqNewFF(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session)
			throws ServletException, IOException {

		UserPos userPO = (datapro.eibs.beans.UserPos) session
				.getAttribute("userPO");

		String typ = "";
		
		MessageProcessor mp = null;
		try {
			
			userPO.setPurpose("NEW");
			
			mp = getMessageProcessor("ESWF400", req);

			ESWF40002Message lcqa = (ESWF40002Message) mp.getMessageRecord(
					"ESWF40002", user.getH01USR(), "0001");
			lcqa.setE02LCOACC(req.getParameter("LCOACC"));
			
			typ = req.getParameter("typ") !=null ? req.getParameter("typ") : "";
			
			if (typ.equals("COLL"))
				lcqa.setH02FLGWK3("7");
			else
				lcqa.setH02FLGWK3("4");			
			
			lcqa.setE02LCOFMT("COLL".equals(typ)?"499":"799");
			
			mp.sendMessage(lcqa);
			lcqa = (ESWF40002Message) mp.receiveMessageRecord();

			req.setAttribute ("typ", typ);
			
			req.setAttribute("LCOACC", req.getParameter("LCOACC"));
			session.setAttribute("userPO", userPO);
			session.setAttribute("lcqa", lcqa);
			forward("ESWF400_lc_ff_format_maint.jsp", req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	/**
	 * LCrosby
	 */
	protected void procReqMaint(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session, int screen)
			throws ServletException, IOException {

		UserPos userPO = (datapro.eibs.beans.UserPos) session
				.getAttribute("userPO");

		MessageProcessor mp = null;
		
		String typ = "";
		
		try {
			mp = getMessageProcessor("ESWF400", req);

			ESWF40002Message lcqa = (ESWF40002Message) mp.getMessageRecord(
					"ESWF40002", user.getH01USR(), "0002");
			lcqa.setE02LCOACC(req.getParameter("LCOACC"));
			lcqa.setE02LCOSEQ(req.getParameter("LCOSEQ"));
			
			typ = req.getParameter("typ") !=null ? req.getParameter("typ") : "";

			if (screen == R_INQ_A)
				userPO.setPurpose("INQUIRY");
			else
				userPO.setPurpose("MAINTENANCE");
			
			if (typ.equals("COLL"))
				lcqa.setH02FLGWK3("7");
			else
				lcqa.setH02FLGWK3("4");
			
			mp.sendMessage(lcqa);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			lcqa = (ESWF40002Message) mp.receiveMessageRecord();

			session.setAttribute("error", msgError);
			req.setAttribute ("typ", typ);
			if (!mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("lcqa", lcqa);
				forward("ESWF400_lc_qa_format_maint.jsp", req, res);
			} else {
				forward("error_viewer.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	protected void procReqMaintFF(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session, int screen)
			throws ServletException, IOException {

		UserPos userPO = (datapro.eibs.beans.UserPos) session
				.getAttribute("userPO");

		MessageProcessor mp = null;
		
		String typ = "";
		
		try {
			mp = getMessageProcessor("ESWF400", req);

			ESWF40002Message lcqa = (ESWF40002Message) mp.getMessageRecord(
					"ESWF40002", user.getH01USR(), "0002");
			lcqa.setE02LCOACC(req.getParameter("LCOACC"));
			lcqa.setE02LCOSEQ(req.getParameter("LCOSEQ"));
			
			typ = req.getParameter("typ") !=null ? req.getParameter("typ") : "";

			if (screen == R_INQ_A_FF)
				userPO.setPurpose("INQUIRY");
			else
				userPO.setPurpose("MAINTENANCE");
			
			if (typ.equals("COLL"))
				lcqa.setH02FLGWK3("7");
			else
				lcqa.setH02FLGWK3("4");
			
			lcqa.setE02LCOFMT("COLL".equals(typ)?"499":"799");
			
			mp.sendMessage(lcqa);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			lcqa = (ESWF40002Message) mp.receiveMessageRecord();

			session.setAttribute("error", msgError);
			req.setAttribute ("typ", typ);
			if (!mp.hasError(msgError)) {
				session.setAttribute("userPO", userPO);
				session.setAttribute("lcqa", lcqa);
				forward("ESWF400_lc_ff_format_maint.jsp", req, res);
			} else {
				forward("error_viewer.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	protected void procActionNewMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		UserPos userPO = (datapro.eibs.beans.UserPos) session
				.getAttribute("userPO");

		MessageProcessor mp = null;
		String typ = "";
		try {

			mp = getMessageProcessor("ESWF400", req);

			ESWF40002Message msgSWFF = (ESWF40002Message) mp
					.getMessageRecord("ESWF40002");
			msgSWFF.setH02USERID(user.getH01USR());
			msgSWFF.setH02PROGRM("ESWF400");
			msgSWFF.setH02TIMSYS(getTimeStamp());

			setMessageRecord(req, msgSWFF);

			if (screen == A_NEW_MAINT)
				msgSWFF.setH02OPECOD("0003");
			else if (screen == A_VALIDATE)
				msgSWFF.setH02OPECOD("0006");

			typ = req.getParameter("typ");
			
			if (typ.equals("COLL")) 
				msgSWFF.setH02FLGWK3("7");
			else
				msgSWFF.setH02FLGWK3("4");
			
			mp.sendMessage(msgSWFF);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgSWFF = (ESWF40002Message) mp.receiveMessageRecord();

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("lcqa", msgSWFF);
			req.setAttribute("typ", typ);
			
			if (!mp.hasError(msgError)) {
				if (screen == A_NEW_MAINT)
					redirectToPage(
							"/servlet/datapro.eibs.products.JSESWF400?SCREEN=6&E01LCOACC="
									+ msgSWFF.getE02LCOACC() + "&typ=" + typ, res);
				else if (screen == A_VALIDATE)
					forward("ESWF400_lc_qa_format_maint.jsp", req, res);
			} else {
				forward("ESWF400_lc_qa_format_maint.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	protected void procActionNewMaintFF(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		UserPos userPO = (datapro.eibs.beans.UserPos) session
				.getAttribute("userPO");

		MessageProcessor mp = null;
		String typ = "";
		try {

			mp = getMessageProcessor("ESWF400", req);

			ESWF40002Message msgSWFF = (ESWF40002Message) mp
					.getMessageRecord("ESWF40002");
			msgSWFF.setH02USERID(user.getH01USR());
			msgSWFF.setH02PROGRM("ESWF400");
			msgSWFF.setH02TIMSYS(getTimeStamp());

			setMessageRecord(req, msgSWFF);

			if (screen == A_NEW_MAINT_FF)
				msgSWFF.setH02OPECOD("0003");
			else if (screen == A_VALIDATE_FF)
				msgSWFF.setH02OPECOD("0006");

			typ = req.getParameter("typ");
			
			if (typ.equals("COLL")) 
				msgSWFF.setH02FLGWK3("7");
			else
				msgSWFF.setH02FLGWK3("4");
			
			//msgSWFF.setE02LCOFMT("COLL".equals(typ)?"499":"799");
			
			mp.sendMessage(msgSWFF);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();
			msgSWFF = (ESWF40002Message) mp.receiveMessageRecord();

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("lcqa", msgSWFF);
			req.setAttribute("typ", typ);
			
			if (!mp.hasError(msgError)) {
				if (screen == A_NEW_MAINT_FF)
					redirectToPage(
							"/servlet/datapro.eibs.products.JSESWF400?SCREEN=906&E01LCOACC="
									+ msgSWFF.getE02LCOACC() + "&typ=" + typ, res);
				else if (screen == A_VALIDATE_FF)
					forward("ESWF400_lc_ff_format_maint.jsp", req, res);
			} else {
				forward("ESWF400_lc_ff_format_maint.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	/**
	 * LCrosby
	 */
	protected void procActionSearch(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		UserPos userPO = (datapro.eibs.beans.UserPos) session
				.getAttribute("userPO");
		String LCOACC = null;
		String typ = "";
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("ESWF400", req);

			ESWF40001Message msgList = (ESWF40001Message) mp.getMessageRecord(
					"ESWF40001", user.getH01USR(), "0015");

			if (screen == R_APPROVAL) {
				msgList.setH01SCRCOD("AA");
			}
			else if (screen == A_SEARCH) {
				msgList.setH01SCRCOD("01");
				typ = req.getParameter("typ");
			}
			else  if (screen == R_APPROVAL_COLL) {
				msgList.setH01SCRCOD("AA");				
				typ = "COLL";
			}

			LCOACC = req.getParameter("E01LCOACC") != null ? req
					.getParameter("E01LCOACC") : "";
			
			msgList.setE01LCOACC(LCOACC);
			
			if (typ.equals("COLL"))
				msgList.setH01FLGWK3("7");
			else
				msgList.setH01FLGWK3("4");
				

			mp.sendMessage(msgList);

			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				forward("error_viewer.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("ESWF40001List", list);
				req.setAttribute("LCOACC", LCOACC);
				req.setAttribute("typ", typ);
				
				if (screen == R_APPROVAL || screen == R_APPROVAL_COLL)
					forwardOnSuccess("ESWF400_lc_qa_format_approval_list.jsp",
							req, res);
				else
					forwardOnSuccess("ESWF400_lc_qa_format_maint_list.jsp",
							req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	protected void procActionSearchFF(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		UserPos userPO = (datapro.eibs.beans.UserPos) session
				.getAttribute("userPO");
		String LCOACC = null;
		String typ = "";
		MessageProcessor mp = null;
		
		try {
			mp = getMessageProcessor("ESWF400", req);

			ESWF40001Message msgList = (ESWF40001Message) mp.getMessageRecord(
					"ESWF40001", user.getH01USR(), "0015");

			if (screen == R_APPROVAL_FF) {
				msgList.setH01SCRCOD("AA");
			}
			else if (screen == A_SEARCH_FF) {
				msgList.setH01SCRCOD("01");
				typ = req.getParameter("typ");
			}
			else  if (screen == R_APPROVAL_COLL_FF) {
				msgList.setH01SCRCOD("AA");				
				typ = "COLL";
			}

			LCOACC = req.getParameter("E01LCOACC") != null ? req
					.getParameter("E01LCOACC") : "";
			
			msgList.setE01LCOACC(LCOACC);
			
			if (typ.equals("COLL"))
				msgList.setH01FLGWK3("7");
			else
				msgList.setH01FLGWK3("4");
				
			msgList.setE01LCOFMT("COLL".equals(typ)?"499":"799");
			
			mp.sendMessage(msgList);

			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				forward("error_viewer.jsp", req, res);
			} else {
				session.setAttribute("userPO", userPO);
				session.setAttribute("ESWF40001List", list);
				req.setAttribute("LCOACC", LCOACC);
				req.setAttribute("typ", typ);
				
				if (screen == R_APPROVAL_FF || screen == R_APPROVAL_COLL_FF)
					forwardOnSuccess("ESWF400_lc_ff_format_approval_list.jsp",
							req, res);
				else
					forwardOnSuccess("ESWF400_lc_ff_format_maint_list.jsp",
							req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}
	/**
	 * LCrosby
	 */
	protected void procActionApprovalDeleteReject(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		MessageProcessor mp = null;
		String lcoacc = null;

		String typ = "";
		
		// Send Initial data
		try {
			flexLog("Send Initial Data");
			mp = getMessageProcessor("ESWF400", req);
			ESWF40003Message msg = (ESWF40003Message) mp.getMessageRecord(
					"ESWF40003", user.getH01USR(), "XXXX");
			
			typ = req.getParameter("typ") != null ? req.getParameter("typ") : "";
			if (typ.equals("COLL"))
				msg.setH03FLGWK3("7");
			else
				msg.setH03FLGWK3("4");
			
			try {
			 	msg.setE03MSGTXT(req.getParameter("reason"));
			 	flexLog("Text: " + req.getParameter("reason"));
			}
			catch (Exception e) {}

			lcoacc = req.getParameter("LCOACC");
			msg.setE03LCOACC(lcoacc);
			msg.setE03LCOREF(req.getParameter("REFNUM"));
			msg.setE03ACTION(req.getParameter("ACTION"));
			msg.setE03LCOSEQ(req.getParameter("LCOSEQ"));
			mp.sendMessage(msg);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();

			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			req.setAttribute("typ", typ);

			if (!mp.hasError(msgError)) {
				if (typ.equals("COLL"))
					redirectToPage(
						"/servlet/datapro.eibs.products.JSESWF400?SCREEN=507", res);
				else
					redirectToPage(
							"/servlet/datapro.eibs.products.JSESWF400?SCREEN=500", res);
			} else {
				forward("ESWF400_lc_qa_format_approval_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	protected void procActionApprovalDeleteRejectFF(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		MessageProcessor mp = null;
		String lcoacc = null;

		String typ = "";
		
		// Send Initial data
		try {
			flexLog("Send Initial Data");
			mp = getMessageProcessor("ESWF400", req);
			ESWF40003Message msg = (ESWF40003Message) mp.getMessageRecord(
					"ESWF40003", user.getH01USR(), "XXXX");
			
			typ = req.getParameter("typ") != null ? req.getParameter("typ") : "";
			if (typ.equals("COLL"))
				msg.setH03FLGWK3("7");
			else
				msg.setH03FLGWK3("4");
			
			try {
			 	msg.setE03MSGTXT(req.getParameter("reason"));
			 	flexLog("Text: " + req.getParameter("reason"));
			}
			catch (Exception e) {}

			lcoacc = req.getParameter("LCOACC");
			msg.setE03LCOACC(lcoacc);
			msg.setE03LCOREF(req.getParameter("REFNUM"));
			msg.setE03ACTION(req.getParameter("ACTION"));
			msg.setE03LCOSEQ(req.getParameter("LCOSEQ"));
			msg.setE03LCOFMT("COLL".equals(typ)?"499":"799");
			mp.sendMessage(msg);

			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord();

			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			req.setAttribute("typ", typ);

			if (!mp.hasError(msgError)) {
				if (typ.equals("COLL"))
					redirectToPage(
						"/servlet/datapro.eibs.products.JSESWF400?SCREEN=955", res);
				else
					redirectToPage(
							"/servlet/datapro.eibs.products.JSESWF400?SCREEN=905", res);
			} else {
				forward("ESWF400_lc_ff_format_approval_list.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	/**
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 */

	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqPassword(HttpServletRequest req,
			HttpServletResponse res, HttpSession ses) throws ServletException,
			IOException {

		UserPos userPO = null;

		try {

			userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
			userPO
					.setRedirect("/servlet/datapro.eibs.products.JSESWF400?SCREEN="
							+ R_APPROVAL
							+ (req.getParameter("REFNUM") == null ? ""
									: "&REFNUM=" + req.getParameter("REFNUM")));
			ses.setAttribute("userPO", userPO);
			res.sendRedirect(super.srctx
					+ "/servlet/datapro.eibs.menu.JSESS0030?SCREEN=7");

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}
}