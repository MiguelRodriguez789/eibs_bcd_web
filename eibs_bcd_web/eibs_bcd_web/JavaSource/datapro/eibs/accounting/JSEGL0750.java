package datapro.eibs.accounting;
 
/**
 * Insert the type's description here.
 * Creation date: (11/5/07 6:08:55 PM)
 * @author: R.Quimper
 */
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EGL075001Message;
import datapro.eibs.beans.EGL075002Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;

public class JSEGL0750 extends JSEIBSServlet {

	// CIF options
	protected static final int R_SEARCH 				= 1;
	protected static final int R_LIST 					= 2;
	protected static final int R_OPTION					= 3;
	protected static final int R_AVERAGE				= 300;
	protected static final int R_BUDGET					= 200;
	protected static final int R_BALANCE				= 400;
	protected static final int R_ENTER_ACC				= 100;
	
	@Override
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen) {
		// Requests
		case R_ENTER_ACC :
			procReqEnterAcc(user, req, res, session);
			break;				
		case R_LIST :
			procReqList(user, req, res, session);
			break;
		case R_OPTION :
			procActionList(user, req, res, session);
			break;
		case R_AVERAGE :
			procReqAverage(user, req, res, session);
			break;
		case R_BUDGET :
			procReqBudget(user, req, res, session);
			break;
		case R_BALANCE:
		    procReqBalances(user, req, res, session);
		    break;			
						
		default :
			forward(devPage, req, res);
			break;
		}
	}

	private void procReqBalances(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";

		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("", req);
			EGL075002Message msgbalance = (EGL075002Message) mp.getMessageRecord("EGL075002");
			msgbalance.setH02USERID(user.getH01USR());
			msgbalance.setH02PROGRM("EGL0750");
			msgbalance.setH02TIMSYS(getTimeStamp());
			msgbalance.setH02FLGWK1(userPO.getHeader8());
			msgbalance.setH02SCRCOD("01");
			msgbalance.setH02OPECOD("0002");
			
			setMessageRecord(req, msgbalance);

			mp.sendMessage(msgbalance);
			MessageRecord msg = mp.receiveMessageRecord();

			if (mp.hasError(msg)) {
				msgError = (ELEERRMessage) msg;
				pageName = "EGL0750_inq_balances.jsp";
			} else {
				msgError = new ELEERRMessage();
				msgbalance = (EGL075002Message) msg;
				pageName = "EGL0750_inq_balances.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("balance", msgbalance);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		int option;
		try {
			option = Integer.parseInt(req.getParameter("opt"));
		} catch (Exception e) {
			option = 0;
		}
		try {
			userPO.setCusNum(req.getParameter("CUSTOMER").trim());
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		switch (option) {
		case 1 : // Consulta GL.
			res.sendRedirect(srctx + "/servlet/datapro.eibs.credit.JSELN0110?SCREEN=1&Pos=0");
			break;
		case 2 : // Balances
		//	procReqPos(user, req, res, ses);
			break;
		case 3 : // promedios
			procReqAverage(user, req, res, session);
			break;
		case 4 : // presupuestos
			procReqBudget(user, req, res, session);
			break;
		case 5 : // estado de cuenta historico
			res.sendRedirect(srctx + "/servlet/datapro.eibs.credit.JSELN0110?SCREEN=1&Pos=0");
			break;
		case 6 : // Customer Account Listing
			res.sendRedirect(srctx + "/servlet/datapro.eibs.credit.JSELN0110?SCREEN=1&Pos=0");
			break;
		default :
			forward("Under_construction.jsp", req, res);
		}
	}

	private void procReqBudget(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";

		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EGL0750", req);
			EGL075002Message msgbudget = (EGL075002Message) mp.getMessageRecord("EGL075002");
		 	msgbudget.setH02USERID(user.getH01USR());
		 	msgbudget.setH02PROGRM("EGL0750");
		 	msgbudget.setH02TIMSYS(getTimeStamp());
		 	msgbudget.setH02FLGWK1(userPO.getHeader8());
		 	msgbudget.setH02SCRCOD("01");
		 	msgbudget.setH02OPECOD("0004");

		 	setMessageRecord(req, msgbudget);
		 	
			mp.sendMessage(msgbudget);
			MessageRecord msg = mp.receiveMessageRecord();

			if (mp.hasError(msg)) {
				msgError = (ELEERRMessage) msg;
				pageName = "ECIF010_cif_client_search.jsp";
			} else {
				msgError = new ELEERRMessage();
				msgbudget = (EGL075002Message) msg;
				pageName = "EGL0750_inq_budget.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("budget", msgbudget);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqAverage(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";

		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EGL0750", req);
			EGL075002Message msgaverage = (EGL075002Message) mp.getMessageRecord("EGL075002");
		 	msgaverage.setH02USERID(user.getH01USR());
		 	msgaverage.setH02PROGRM("EGL0750");
		 	msgaverage.setH02TIMSYS(getTimeStamp());
		 	msgaverage.setH02FLGWK1(userPO.getHeader8());
		 	msgaverage.setH02SCRCOD("01");
		 	msgaverage.setH02OPECOD("0003");
		 	
		 	setMessageRecord(req, msgaverage);

			mp.sendMessage(msgaverage);
			MessageRecord msg = mp.receiveMessageRecord();

			if (mp.hasError(msg)) {
				msgError = (ELEERRMessage) msg;
				pageName = "EGL0750_inq_promedios.jsp";
			} else {
				msgError = new ELEERRMessage();
				msgaverage = (EGL075002Message) msg;
				pageName = "EGL0750_inq_promedios.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("average", msgaverage);

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
			mp = getMessageProcessor("EGL0750", req);
			EGL075001Message msgSearch = (EGL075001Message) mp.getMessageRecord("EGL075001");
			msgSearch.setH01USERID(user.getH01USR());
		 	msgSearch.setH01PROGRM("EGL0750");
		 	msgSearch.setH01TIMSYS(getTimeStamp());
		 	msgSearch.setH01FLGWK1(userPO.getHeader8());
		 	msgSearch.setH01SCRCOD("01");
		 	msgSearch.setH01OPECOD("0004");
		 	
		 	setMessageRecord(req, msgSearch);

			mp.sendMessage(msgSearch);
			JBObjList list = mp.receiveMessageRecordList("E01INDOPE");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "EGL0750_inq_enter1.jsp";
			} else {
				session.setAttribute("cifList", list);
				pageName = "EGL0750_inq_list.jsp";
			}

			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqEnterAcc(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("ACCOUNTS");
		userPO.setPurpose("INQUIRY");
		String opt = null;
		try {
			opt = req.getParameter("OPTION").trim();
		} catch (Exception e) {
			opt = "";
		}
		userPO.setHeader8(opt);
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		
		forward("EGL0750_inq_enter1.jsp", req, res);
	}
	
	
}