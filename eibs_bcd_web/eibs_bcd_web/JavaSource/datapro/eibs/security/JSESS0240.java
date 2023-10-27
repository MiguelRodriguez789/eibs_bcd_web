package datapro.eibs.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.ESS024001Message;
import datapro.eibs.beans.ESS024002Message;
import datapro.eibs.beans.ESS024003Message;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.products.JOActionRedirect;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSESS0240 extends JSEIBSServlet {

	protected static final int R_ENTER 			= 1;
	protected static final int R_LIST 			= 100;
	protected static final int R_INQUIRY		= 300;
	
	protected static final int R_INQ_APPROVAL 	= 400;
	protected static final int R_INQ_DETAIL 	= 500;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			//Request
			case R_ENTER :
				 procReqEnter(user, req, res, session);							
				 break;
			case R_LIST :
				procReqList(user, req, res, session);
				break;
			case R_INQUIRY :
				procReqInquiry(user, req, res, session);
				break;							
			case R_INQ_APPROVAL :
				procReqInqApproval(user, req, res, session);
				break;		
			case R_INQ_DETAIL :
				procReqInqDetail(user, req, res, session);
				break;	
				// END Entering
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procReqInqDetail(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESS0240", req);
			ESS024003Message msgList = (ESS024003Message) mp.getMessageRecord("ESS024003");
			msgList.setH03USERID(user.getH01USR());
			msgList.setH03PROGRM("ESS0240");
			msgList.setH03TIMSYS(getTimeStamp());
			msgList.setH03SCRCOD("01");				
			msgList.setE03NUMREF(req.getParameter("ACCREF"));
			
			mp.sendMessage(msgList);
			
			ESS024002Message msgHeader = (ESS024002Message) mp.getMessageRecord("ESS024002");
			msgHeader = (ESS024002Message) mp.receiveMessageRecord();

			ELEERRMessage msgError = new ELEERRMessage();
			JBObjList list = mp.receiveMessageRecordList("H03FLGMAS");
			
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
				forward(devPage, req, res);
			} else {
				session.setAttribute("header", msgHeader);
				session.setAttribute("dbList", list);
				session.setAttribute("error", msgError);
				forward("ESS0240_db_change_detail_list.jsp", req, res);
			}
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqInqApproval(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		
		String typ = req.getParameter("TYPE") == null ? "" : req.getParameter("TYPE");
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESS0240", req);
			ESS024002Message msgList = (ESS024002Message) mp.getMessageRecord("ESS024002");
			msgList.setH02USERID(user.getH01USR());
			msgList.setH02PROGRM("ESS0240");
			msgList.setH02TIMSYS(getTimeStamp());
			msgList.setH02SCRCOD("01");
			
			if ("C".equals(typ)) {
				msgList.setE02NUMACC(userPO.getCusNum());
			} else if ("CUST".equals(typ)) {
				msgList.setE02NUMACC(userPO.getCusNum());
				msgList.setE02CDTYPE(typ);
			} else {
				msgList.setE02NUMACC(userPO.getAccNum());
			}
			
			try {
				msgList.setE02MNLIPA(req.getParameter("IP"));
			} catch (Exception e) {
				msgList.setE02MNLIPA("");
			}
			try {
				msgList.setE02SELIPA(msgList.getE02MNLIPA());
			} catch (Exception e) {
				msgList.setE02SELIPA("");
			}
			
			try {
				msgList.setE02USERID(req.getParameter("USER"));
			} catch (Exception e) {
				msgList.setE02USERID("");
			}
			try {
				msgList.setE02SELUSR(msgList.getE02USERID());
			} catch (Exception e) {
				msgList.setE02SELUSR("");
			}

			try {
				msgList.setE02MNPUSA(req.getParameter("SUPERVISOR"));
			} catch (Exception e) {
				msgList.setE02MNPUSA("");
			}
			try {
				msgList.setE02SELUSA(msgList.getE02MNPUSA());
			} catch (Exception e) {
				msgList.setE02SELUSA("");
			}

			try {
				msgList.setE02DSCMOD(req.getParameter("EVENTO"));
			} catch (Exception e) {
				msgList.setE02DSCMOD("");
			}
			try {
				msgList.setE02SELMOD(msgList.getE02DSCMOD());
			} catch (Exception e) {
				msgList.setE02SELMOD("");
			}
			
			try {
				msgList.setE02DATERY(req.getParameter("FECHA"));
			} catch (Exception e) {
				msgList.setE02DATERY("");
			}
			
			try {
				msgList.setE02SELDTY(req.getParameter("E02SELDTY"));
			} catch (Exception e) {
				msgList.setE02SELDTY("");
			}
			try {
				msgList.setE02SELDTD(req.getParameter("E02SELDTD"));
			} catch (Exception e) {
				msgList.setE02SELDTD("");
			}
			try {
				msgList.setE02SELDTM(req.getParameter("E02SELDTM"));
			} catch (Exception e) {
				msgList.setE02SELDTY("");
			}

			mp.sendMessage(msgList);
			
			ELEERRMessage msgError = new ELEERRMessage();
			JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");
		
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ESS0240_db_change_list.jsp";
			}
			
			session.setAttribute("dbList", list);
			session.setAttribute("userPO", userPO);
			session.setAttribute("error", msgError);
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqInquiry(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos userPO = getUserPos(session);
		
		String accNum = req.getParameter("ACCNUMBER") == null ? "" : req.getParameter("ACCNUMBER");
		int appCode = 0;
		try {
			appCode = Integer.parseInt(req.getParameter("APCCDE"));
		} catch (Exception e) {
			appCode = 0;
		}
		
		if ("1".equals(userPO.getIdentifier())) {
			res.sendRedirect(srctx + "/servlet/datapro.eibs.client.JSESD1080?SCREEN=8&E01CUN=" + accNum);
		} else if ("0".equals(userPO.getIdentifier())) {
			appCode = 1;
			JOActionRedirect red = new JOActionRedirect(1, appCode, accNum, user.getE01LAN(), session);
			res.sendRedirect(srctx + red.action());
		} else {
			JOActionRedirect red = new JOActionRedirect(1, appCode, accNum, user.getE01LAN(), session);
			res.sendRedirect(srctx + red.action());
		}
	}

	private void procReqList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(session);
		userPO.setIdentifier(req.getParameter("E01FLGFLE") == null ? "" : req.getParameter("E01FLGFLE"));
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESS0240", req);
			ESS024001Message msgSearch = (ESS024001Message) mp.getMessageRecord("ESS024001");
			msgSearch.setH01USERID(user.getH01USR());
			msgSearch.setH01PROGRM("ESS0240");
			msgSearch.setH01TIMSYS(getTimeStamp());
			msgSearch.setH01SCRCOD("01");
			msgSearch.setH01OPECOD("0015");
			
			setMessageRecord(req, msgSearch);
			
			ESS024001Message msgcpy = new ESS024001Message();
			populate(msgSearch, msgcpy);
			
			mp.sendMessage(msgcpy);
			
			ELEERRMessage msgError = new ELEERRMessage();
			JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");
			
			if (mp.hasError(list)) {
				msgError = (ELEERRMessage) mp.getError(list);
				pageName = "ESS0240_db_access_enter.jsp";
			} else {
				pageName = "ESS0240_db_access_list.jsp";
			}
			
			flexLog("Putting java beans into the session");
			session.setAttribute("dbList", list);
			session.setAttribute("userPO", userPO);
			session.setAttribute("error", msgError);
			session.setAttribute("msgDB", msgSearch);
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqEnter(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		ESS024001Message msgSearch = new ESS024001Message();
		msgSearch.setE01FLGFLE("1");
		msgSearch.setE01FLGPRO("1");
		
		session.setAttribute("msgDB", msgSearch);
		session.setAttribute("error", new ELEERRMessage());
		
		forward("ESS0240_db_access_enter.jsp", req, res);
	}

}
