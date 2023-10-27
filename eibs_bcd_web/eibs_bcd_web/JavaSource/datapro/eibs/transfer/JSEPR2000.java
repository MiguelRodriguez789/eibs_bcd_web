package datapro.eibs.transfer;

/**
 * Insert the type's description here.
 * Creation date: (7/03/03 6:08:55 PM)
 * @author: Ramses
 */
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.EPR200001Message;
import datapro.eibs.beans.EPR200002Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;

public class JSEPR2000 extends JSEIBSServlet {

	protected static final int R_ENTER_MAINT = 100;	
	protected static final int R_LIST = 200;
	protected static final int A_LIST = 300;
	protected static final int R_SET_OPT = 400;
	
	protected static final int R_MAINT = 1;
	protected static final int A_MAINT = 2;
	
	protected static final int R_ENTER_INQ = 500;
	protected static final int A_ENTER_INQ = 600;
	

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen) {
		case R_ENTER_MAINT :					
			procReqEnterMaint(user, req, res, session);
			break;
		case R_SET_OPT :					
			procSetOption(user, req, res, session);
			break;
		case R_ENTER_INQ :					
			procReqEnterInq(user, req, res, session);
			break;	
		case A_LIST :
			procActionList(user, req, res, session);
			break;
		case R_LIST :
			procReqList(user, req, res, session);
			break;
		case A_ENTER_INQ :
			procActionEnterInq(user, req, res, session);
			break;						
		case A_MAINT :
			procActionMaint(user, req, res, session);
			break;
		default :
			forward(devPage, req, res);
			break;
	}
	}


	private void procActionMaint(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPR2000", req);
			EPR200001Message msgPR = (EPR200001Message) session.getAttribute("prBasic");
			msgPR.setH01USERID(user.getH01USR());
			msgPR.setH01PROGRM("EPR2000");
			msgPR.setH01TIMSYS(getTimeStamp());
			msgPR.setH01SCRCOD("01");
			msgPR.setH01OPECOD("0005");
			
			setMessageRecord(req, msgPR);

			mp.sendMessage(msgPR);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgPR = (EPR200001Message) mp.receiveMessageRecord("EPR200001");

			if (mp.hasError(msgError)) {
				pageName = "EPR2000_pr_maint.jsp";
			} else {
				pageName = "EPR2000_pr_confirm.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("prBasic", msgPR);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	private void procActionEnterInq(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPR2000", req);
			EPR200002Message msgPR = (EPR200002Message) mp.getMessageRecord("EPR200002");
			msgPR.setH02USERID(user.getH01USR());
			msgPR.setH02PROGRM("EPR2000");
			msgPR.setH02TIMSYS(getTimeStamp());
			msgPR.setH02SCRCOD("01");
			msgPR.setH02OPECOD("0015");
			try {
				msgPR.setE02SELACC(req.getParameter("E02SELACC"));
				userPO.setAccNum(req.getParameter("E02SELACC"));
			} catch (Exception e){
				msgPR.setE02SELACC("0");
			}

			mp.sendMessage(msgPR);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			JBObjList list = mp.receiveMessageRecordList("H02FLGWK3");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				pageName = "GENERIC_account_enter.jsp";
			} else {
				session.setAttribute("prList", list);				
				pageName = "EPR2000_pr_deb_list.jsp";
			}

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	private void procReqList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EPR2000", req);
			EPR200001Message msgPR = (EPR200001Message) mp.getMessageRecord("EPR200001");
			msgPR.setH01USERID(user.getH01USR());
			msgPR.setH01PROGRM("EPR2000");
			msgPR.setH01TIMSYS(getTimeStamp());
			msgPR.setH01SCRCOD("01");
			msgPR.setH01OPECOD("0015");
			try {
				msgPR.setE01PRPDAC(req.getParameter("E01PRPDAC"));
				userPO.setAccNum(req.getParameter("E01PRPDAC"));
			} catch (Exception e) {
				msgPR.setE01PRPDAC("0");
			}

			mp.sendMessage(msgPR);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			JBObjList list = mp.receiveMessageRecordList("H01FLGWK3");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				pageName = "GENERIC_account_enter.jsp";
			} else {
				session.setAttribute("prList", list);				
				pageName = "EPR2000_pr_list.jsp";
			}

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	private void procActionList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			int row = Integer.parseInt(req.getParameter("ROW"));
			JBObjList prList = (JBObjList) session.getAttribute("prList");
			EPR200001Message msgVG = (EPR200001Message) prList.get(row);
			msgVG.setH01USERID(user.getH01USR());
			msgVG.setH01PROGRM("EPR0000");
			msgVG.setH01TIMSYS(getTimeStamp());
			msgVG.setH01SCRCOD("01");
			msgVG.setH01OPECOD("0009");

			mp.sendMessage(msgVG);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgVG = (EPR200001Message) mp.receiveMessageRecord("EPR200001");

			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				prList.setRecord(msgVG, row);
				pageName = "EPR2000_pr_list.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	private void procReqEnterInq(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption(req.getParameter("option") != null ? req.getParameter("option") : "CC");
		userPO.setPurpose("INQUIRY");
		userPO.setRedirect("/servlet/datapro.eibs.transfer.JSEPR2000?SCREEN=600");
		userPO.setProdCode("RM");
		//Others Parameters
		userPO.setHeader1("E02SELACC");
		userPO.setHeader2("E02PRPNUM");
		
		session.setAttribute("userPO", userPO);
		
		forward("GENERIC_account_enter.jsp", req, res);
	}


	private void procSetOption(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		UserPos userPO = getUserPos(req);
		
		MessageRecord message = null;
		if ("M".equals(req.getParameter("opt")) || "I".equals(req.getParameter("opt"))) {
			try {
				int row = Integer.parseInt(req.getParameter("ROW"));
				JBObjList prList = (JBObjList) session.getAttribute("prList");
    			prList.setCurrentRow(row);
				message = (MessageRecord) prList.getRecord();
				session.setAttribute("prBasic", message);
				userPO.setPurpose("M".equals(req.getParameter("opt")) ? "MAINTENANCE" : "INQUIRY");
			} catch (Exception e) {
				ELEERRMessage msgError = new ELEERRMessage();
				addError(msgError, "", "", e.getMessage());
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			}
		} else {
			message = (MessageRecord) session.getAttribute("prHeader");
			if (message instanceof EPR200001Message) {
				EPR200001Message prHeader = (EPR200001Message) message; 
				EPR200001Message prBasic = new EPR200001Message();
 				prBasic.setE01PRPDBK(prHeader.getE01PRPDBK());
 				prBasic.setE01PRPDBR(prHeader.getE01PRPDBR());
 				prBasic.setE01PRPDCY(prHeader.getE01PRPDCY());
 				prBasic.setE01PRPDGL(prHeader.getE01PRPDGL());
 				prBasic.setE01PRPDSA(prHeader.getE01PRPDSA());
 				prBasic.setE01PRPDCC(prHeader.getE01PRPDCC());
 				session.setAttribute("prBasic", prBasic);
			} else if (message instanceof EPR200002Message) {
				EPR200002Message prHeader = (EPR200002Message) message; 
				EPR200002Message prBasic = new EPR200002Message();
 				prBasic.setE02PRPDBK(prHeader.getE02PRPDBK());
 				prBasic.setE02PRPDBR(prHeader.getE02PRPDBR());
 				prBasic.setE02PRPDCY(prHeader.getE02PRPDCY());
 				prBasic.setE02PRPDGL(prHeader.getE02PRPDGL());
 				prBasic.setE02PRPDSA(prHeader.getE02PRPDSA());
 				prBasic.setE02PRPDCC(prHeader.getE02PRPDCC());
 				session.setAttribute("prBasic", prBasic);
			}
			userPO.setPurpose("NEW");
		}
		
		if ("INQUIRY".equals(userPO.getPurpose())) {
			if (message instanceof EPR200001Message) {
				pageName = "EPR2000_pr_inquiry.jsp";
			} else if (message instanceof EPR200002Message) {
				pageName = "EPR2000_pr_deb_inquiry.jsp";
			}
		} else {
			pageName = "EPR2000_pr_maint.jsp";
		}
		
		forward(pageName, req, res);
	}


	private void procReqEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption(req.getParameter("option") != null ? req.getParameter("option") : "PR_OP");
		userPO.setPurpose("MAINTENANCE");
		userPO.setRedirect("/servlet/datapro.eibs.transfer.JSEPR2000?SCREEN=200");
		userPO.setProdCode("RM");
		//Others Parameters
		userPO.setHeader1("E01PRPDAC");
		userPO.setHeader2("E01PRPNUM");
		
		session.setAttribute("userPO", userPO);
		
		forward("GENERIC_account_enter.jsp", req, res);
	}

}