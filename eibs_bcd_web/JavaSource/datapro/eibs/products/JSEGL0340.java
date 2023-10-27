package datapro.eibs.products;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EGL034001Message;
import datapro.eibs.beans.EGL034002Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSEGL0340 extends JSEIBSServlet {

	// certificate of deposit 
	protected static final int R_PASSWORD = 1;
	protected static final int R_GENLEDGER = 2;
	protected static final int A_GENLEDGER = 3;
	protected static final int R_CROSSREF = 4;
	protected static final int A_CROSSREF = 5;
	protected static final int A_GENLEDGER_CANCEL = 6;
	// entering options
	protected static final int R_ENTER = 100;
	protected static final int A_ENTER = 200;
	protected static final int A_ENTER_INQ = 300;
	protected static final int R_INQUIRY = 400;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			// Request
			case R_PASSWORD :
				procReqPassword(req, res, session);
				break;
				// Request
			case R_ENTER :
				procReqEnter(user, req, res, session);
				break;
			case R_CROSSREF :
				procReqCrossRef(user, req, res, session);
				break;
				// Action 
			case A_ENTER :
				procActionEnter(user, req, res, session);
				break;
			case A_ENTER_INQ :
				procActionEnterInq(user, req, res, session);
				break;	
			case A_GENLEDGER :
				procActionLedger(user, req, res, session);
				break;
			case A_GENLEDGER_CANCEL :
				procActionLedgerCancel(user, req, res, session);
				break;
			case A_CROSSREF :
				procActionCrossRef(user, req, res, session);
				break;
			case R_INQUIRY :
				procReqInquiry(user, req, res, session);
				break;
				// END Entering
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procActionCrossRef(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EGL0340", req);
			EGL034002Message msgCR = (EGL034002Message) mp.getMessageRecord("EGL034002");
			msgCR.setH02USERID(user.getH01USR());
			msgCR.setH02PROGRM("EGL0340");
			msgCR.setH02TIMSYS(getTimeStamp());
			msgCR.setH02SCRCOD("01");
			msgCR.setH02OPECOD("0005");
			
			setMessageRecord(req, msgCR);
			
			mp.sendMessage(msgCR);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgCR = (EGL034002Message) mp.receiveMessageRecord("EGL034002");
			
			if (mp.hasError(msgError)) {
				pageName = "EGL0340_crossRef_basic.jsp";
			} else {
				pageName = "EGL0340_gledger_confirm.jsp";
			}
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("crossRef", msgCR);
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionLedgerCancel(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EGL0340", req);
			EGL034001Message msgGL = (EGL034001Message) mp.getMessageRecord("EGL034001");
			msgGL.setH01USERID(user.getH01USR());
			msgGL.setH01PROGRM("EGL0340");
			msgGL.setH01TIMSYS(getTimeStamp());
			msgGL.setH01SCRCOD("01");
			msgGL.setH01OPECOD("0009");
			
			setMessageRecord(req, msgGL);
			
			mp.sendMessage(msgGL);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgGL = (EGL034001Message) mp.receiveMessageRecord("EGL034001");
			
			if (mp.hasError(msgError)) {
				pageName = "EGL0340_gledger_basic_cancel.jsp";
			} else {
				pageName = "EGL0340_gledger_enter.jsp";
			}
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("gLedger", msgGL);
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionLedger(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EGL0340", req);
			EGL034001Message msgGL = (EGL034001Message) mp.getMessageRecord("EGL034001");
			msgGL.setH01USERID(user.getH01USR());
			msgGL.setH01PROGRM("EGL0340");
			msgGL.setH01TIMSYS(getTimeStamp());
			msgGL.setH01SCRCOD("01");
			msgGL.setH01OPECOD("0005");
			
			setMessageRecord(req, msgGL);
			
			mp.sendMessage(msgGL);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgGL = (EGL034001Message) mp.receiveMessageRecord("EGL034001");
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("gLedger", msgGL);
			
			if (mp.hasError(msgError)) {
				forward("EGL0340_gledger_basic.jsp", req, res);
			} else {
				if ("".equals(msgGL.getE01GLMACD())
					&& !("Y".equals(msgGL.getE01GLMRVF()))
					&& !("Y".equals(msgGL.getE01GLMPRV()))
					&& "N".equals(msgGL.getE01GLMREV())) {
					forward("EGL0340_gledger_confirm.jsp", req, res);
				} else {
					procReqCrossRef(user, req, res, session);
				}
			}
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionEnterInq(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EGL0340", req);
			EGL034001Message msgGL = (EGL034001Message) mp.getMessageRecord("EGL034001");
			msgGL.setH01USERID(user.getH01USR());
			msgGL.setH01PROGRM("EGL0340");
			msgGL.setH01TIMSYS(getTimeStamp());
			msgGL.setH01SCRCOD("01");
			msgGL.setH01OPECOD("0002");
			
			setMessageRecord(req, msgGL);
			
			mp.sendMessage(msgGL);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgGL = (EGL034001Message) mp.receiveMessageRecord("EGL034001");
			
			if (mp.hasError(msgError)) {
				pageName = "EGL0340_gledger_basic_inq.jsp";
			} else {
				pageName = "EGL0340_gledger_basic_inq.jsp";
			}
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("gLedger", msgGL);
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionEnter(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);
  		try {
			mp = getMessageProcessor("EGL0340", req);
			EGL034001Message msgGL = (EGL034001Message) mp.getMessageRecord("EGL034001");
			msgGL.setH01USERID(user.getH01USR());
			msgGL.setH01PROGRM("EGL0340");
			msgGL.setH01TIMSYS(getTimeStamp());
			msgGL.setH01SCRCOD("01");
			msgGL.setH01OPECOD("0002");
			
			setMessageRecord(req, msgGL);
			
			mp.sendMessage(msgGL);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgGL = (EGL034001Message) mp.receiveMessageRecord("EGL034001");
			
			if (mp.hasError(msgError)) {
				pageName = "EGL0340_gledger_enter.jsp";
			} else {
				if (userPO.getPurpose().equals("MAINTENANCE")) {
					pageName = "EGL0340_gledger_basic.jsp";
				} else {
					pageName = "EGL0340_gledger_basic_cancel.jsp";
				}
			}
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("gLedger", msgGL);
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqCrossRef(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		EGL034001Message msgGL = (EGL034001Message) session.getAttribute("gLedger");
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EGL0340", req);
			EGL034002Message msgCR = (EGL034002Message) mp.getMessageRecord("EGL034002");
			msgCR.setH02USERID(user.getH01USR());
			msgCR.setH02PROGRM("EGL0340");
			msgCR.setH02TIMSYS(getTimeStamp());
			msgCR.setH02SCRCOD("01");
			msgCR.setH02OPECOD("0002");
			// Get Parameters here	
			try {
				msgCR.setE02GLMBNK(msgGL.getE01GLMBNK());
			} catch (Exception e) {
			}
			try {
				msgCR.setE02GLMCCY(msgGL.getE01GLMCCY());
			} catch (Exception e) {
			}
			try {
				msgCR.setE02GLMGLN(msgGL.getE01GLMGLN());
			} catch (Exception e) {
			}
			
			mp.sendMessage(msgCR);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgCR = (EGL034002Message) mp.receiveMessageRecord("EGL034002");
			
			if (mp.hasError(msgError)) {
				pageName = "EGL0340_gledger_basic.jsp";
			} else {
				pageName = "EGL0340_crossRef_basic.jsp";
			}
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("crossRef", msgCR);
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqInquiry(ESS0030DSMessage user, HttpServletRequest req, HttpServletResponse res, HttpSession session) 
		throws IOException, ServletException {
		
		String pageName = "";
		MessageProcessor mp = null;
		UserPos userPO = getUserPos(req);
		try {
			mp = getMessageProcessor("EGL0340", req);
			EGL034002Message msgCR = (EGL034002Message) mp.getMessageRecord("EGL034002");
			msgCR.setH02USERID(user.getH01USR());
			msgCR.setH02PROGRM("EGL0340");
			msgCR.setH02TIMSYS(getTimeStamp());
			msgCR.setH02SCRCOD("01");
			msgCR.setH02OPECOD("0004");
			// Get Parameters here	
			try {
				msgCR.setE02GLMBNK(userPO.getBank());
			} catch (Exception e) {
			}
			try {
				msgCR.setE02GLMCCY(userPO.getCurrency());
			} catch (Exception e) {
			}
			try {
				msgCR.setE02GLMGLN(userPO.getGenLedger());
			} catch (Exception e) {
			}
			
			mp.sendMessage(msgCR);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgCR = (EGL034002Message) mp.receiveMessageRecord("EGL034002");
			
			if (mp.hasError(msgError)) {
				pageName = "EGL0340_crossRef_basic_inquiry.jsp";
			} else {
				pageName = "EGL0340_crossRef_basic_inquiry.jsp";
			}
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("crossRef", msgCR);
			session.setAttribute("userPO", userPO);
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}
	
	private void procReqEnter(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		UserPos userPO = getUserPos(req);
		userPO.setOption("TRANSACTION");
		
		String purpose = req.getParameter("OPT") == null ? "" : req.getParameter("OPT").trim();
		userPO.setPurpose("C".equals(purpose) ? "CANCEL" : "MAINTENANCE");
		
		EGL034001Message glData = new EGL034001Message(); 
		glData.setE01GLMBNK(user.getE01UBK());
		glData.setE01GLMCCY(user.getE01BCU());
		
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		session.setAttribute("gLedger", glData);
		
		forward("EGL0340_gledger_enter.jsp", req, res);
	}

	private void procReqPassword(HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos userPO = getUserPos(req);
		String Option = req.getParameter("OPT") == null ? "M" : req.getParameter("OPT");
		
		userPO.setRedirect(
				"/servlet/datapro.eibs.products.JSEGL0340?SCREEN=" + R_ENTER + "&OPT=" + Option);
		session.setAttribute("userPO", userPO);
		res.sendRedirect(srctx + "/servlet/datapro.eibs.menu.JSESS0030?SCREEN=7");
	}

}
