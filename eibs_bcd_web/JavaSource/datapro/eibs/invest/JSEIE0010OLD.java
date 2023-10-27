package datapro.eibs.invest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EIE001001Message;
import datapro.eibs.beans.EIE001101Message;
import datapro.eibs.beans.ELD000001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD000004Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * 
 */

public class JSEIE0010OLD extends JSEIBSServlet {

	// Request	
	protected static final  int R_ENTER_NEW_UPD = 100;
	protected static final  int R_PORTFOLIO_MGMT = 1;
	protected static final  int R_PORTFOLIO_CASH = 3;
	protected static final  int R_PORTFOLIO_BENEF = 5;
	protected static final  int R_MONEY = 52;
	// Action 
	protected static final  int A_ENTER_NEW_UPD = 200;
	protected static final  int A_PORTFOLIO_MGMT = 2;
	protected static final  int A_PORTFOLIO_CASH = 4;
	protected static final  int A_PORTFOLIO_BENEF = 6;
	protected static final  int A_MONEY = 53;
	
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen) {

		case A_PORTFOLIO_MGMT :
			procActionMaintenance(user, req, res, session);
			break;
		case R_PORTFOLIO_MGMT :
			procReqMaintenance(user, req, res, session);
			break;
		case R_PORTFOLIO_BENEF :
			procReqPortBene(user, req, res, session);
			break;
		case R_ENTER_NEW_UPD :
			procReqEnterNew(user, req, res, session);
			break;
		case A_ENTER_NEW_UPD :
			procActionEnterNew(user, req, res, session);
			break;
		case R_PORTFOLIO_CASH :
			procReqCashAccount(user, req, res, session);
			break;
		case A_PORTFOLIO_CASH :
			procActionCashAccount(user, req, res, session);
			break;
		case R_MONEY :
			procReqInvMoney(user, req, res, session);
			break;
		case A_MONEY:
			procActionInvMoney(user, req, res, session);
			break;					

		default :
			forward(devPage, req, res);
			break;
		}
	}

	private void procActionInvMoney(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELD0000", req);
			ELD000001Message msgLaunder = (ELD000001Message) session.getAttribute("cdMoney");
			msgLaunder.setH06USERID(user.getH01USR());
			msgLaunder.setH06PROGRM("ELD0000");
			msgLaunder.setH06TIMSYS(getTimeStamp());
			msgLaunder.setH06SCRCOD("PR");
			msgLaunder.setH06OPECOD("0005");
			msgLaunder.setH06FLGWK1("5");

			setMessageRecord(req, msgLaunder);
			
			mp.sendMessage(msgLaunder);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgLaunder = (ELD000001Message) mp.receiveMessageRecord("ELD000001");

			if (mp.hasError(msgError)) {
				pageName = "EIE0010_inv_money.jsp";
			} else {
				pageName = "ESD0088_cus_port_basic.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("cdMoney", msgLaunder);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	protected void procReqInvMoney(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELD0000", req);
			ELD000001Message msgLaunder = (ELD000001Message) mp.getMessageRecord("ELD000001");
			msgLaunder.setH06USERID(user.getH01USR());
			msgLaunder.setH06PROGRM("ELD0000");
			msgLaunder.setH06TIMSYS(getTimeStamp());
			msgLaunder.setH06SCRCOD("PR");  // Investment flag
			msgLaunder.setH06OPECOD("0002");
			msgLaunder.setE06LDMACC(userPO.getIdentifier());
			msgLaunder.setH06FLGWK1("5");

			mp.sendMessage(msgLaunder);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgLaunder = (ELD000001Message) mp.receiveMessageRecord("ELD000001");

			if (mp.hasError(msgError)) {
				pageName = "EIE0010_inv_port_basic.jsp";
			} else {
				pageName = "EIE0010_inv_money.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("cdMoney", msgLaunder);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionCashAccount(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EIE0011", req);
			EIE001101Message msgPortAcc = (EIE001101Message) session.getAttribute("invAcc");
			msgPortAcc.setH01USERID(user.getH01USR());
			msgPortAcc.setH01PROGRM("EIE001101");
			msgPortAcc.setH01TIMSYS(getTimeStamp());
			msgPortAcc.setH01SCRCOD("01");
			msgPortAcc.setH01OPECOD("0005");
			
			setMessageRecord(req, msgPortAcc);

			mp.sendMessage(msgPortAcc);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgPortAcc = (EIE001101Message) mp.receiveMessageRecord("EIE001101");

			if (mp.hasError(msgError)) {
				pageName = "EIE0010_inv_port_acc.jsp";
			} else {
				pageName = "EIE0010_inv_port_basic.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("invAcc", msgPortAcc);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	protected void procReqCashAccount(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EIE0011", req);
			EIE001101Message msgPortAcc = (EIE001101Message) mp.getMessageRecord("EIE001101");
			msgPortAcc.setH01USERID(user.getH01USR());
			msgPortAcc.setH01PROGRM("EIE0011");
			msgPortAcc.setH01TIMSYS(getTimeStamp());
			msgPortAcc.setH01SCRCOD("01");
			msgPortAcc.setH01OPECOD("0015");

			try {
				msgPortAcc.setE01PCACUN(userPO.getCusNum().trim());
			} catch (Exception e) {
				msgPortAcc.setE01PCACUN("0");
			}

			try {
				msgPortAcc.setE01PCANUM(userPO.getIdentifier().trim());
			} catch (Exception e) {
				msgPortAcc.setE01PCANUM("0");
			}

			mp.sendMessage(msgPortAcc);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgPortAcc = (EIE001101Message) mp.receiveMessageRecord("EIE001101");

			if (mp.hasError(msgError)) {
				pageName = "EIE0010_inv_port_basic.jsp";
			} else {
				pageName = "EIE0010_inv_port_acc.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("invAcc", msgPortAcc);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	protected void procActionEnterNew(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		
		String opCode = req.getParameter("OPCODE") == null ? "0002" : req.getParameter("OPCODE");
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EIE0010", req);
			EIE001001Message msgPortfolio = (EIE001001Message) mp.getMessageRecord("EIE001001");
			msgPortfolio.setH01USERID(user.getH01USR());
			msgPortfolio.setH01PROGRM("EIE0010");
			msgPortfolio.setH01TIMSYS(getTimeStamp());
			msgPortfolio.setH01SCRCOD("01");
			msgPortfolio.setH01OPECOD(opCode);

			try {
				msgPortfolio.setE01PRFCUN(req.getParameter("E01PRFCUN").trim());
			} catch (Exception e) {
				msgPortfolio.setE01PRFCUN(userPO.getCusNum());
			}

			try {
				msgPortfolio.setD01CUSNA1(req.getParameter("D01CUSNA1").trim());
			} catch (Exception e) {
				
			}

			try {
				msgPortfolio.setE01PRFNUM(req.getParameter("E01PRFNUM").trim());
			} catch (Exception e) {
				msgPortfolio.setE01PRFNUM(userPO.getIdentifier());
			}

			mp.sendMessage(msgPortfolio);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgPortfolio = (EIE001001Message) mp.receiveMessageRecord("EIE001001");

			if (mp.hasError(msgError)) {
				pageName = "EIE0010_inv_enter_port_new.jsp";
			} else {
				if (opCode.equals("0001")) {
					userPO.setPurpose("NEW");
				} else {
					userPO.setPurpose("MAINTENANCE");
					userPO.setCusNum(msgPortfolio.getE01PRFCUN());
					userPO.setIdentifier(msgPortfolio.getE01PRFNUM());
				}
				pageName = "EIE0010_inv_port_basic.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("invPort", msgPortfolio);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqEnterNew(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		session.setAttribute("userPO", new UserPos());
		
		forward("EIE0010_inv_enter_port_new.jsp", req, res);
	}

	protected void procReqPortBene(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			ESD000004Message msgBene = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgBene.setH04USR(user.getH01USR());
			msgBene.setH04PGM("EDD0000");
			msgBene.setH04TIM(getTimeStamp());
			msgBene.setH04SCR("01");
			msgBene.setH04OPE("0002");
			msgBene.setE04CUN(userPO.getIdentifier());
			msgBene.setE04RTP("I");

			mp.sendMessage(msgBene);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgBene = (ESD000004Message) mp.receiveMessageRecord("ESD000004");

			if (mp.hasError(msgError)) {
				pageName = "EIE0010_inv_port_basic.jsp";
			} else {
				pageName = "EIE0010_inv_port_bene.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("bene", msgBene);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	protected void procReqMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EIE0010", req);
			EIE001001Message msgPortfolio = (EIE001001Message) mp.getMessageRecord("EIE001001");
			msgPortfolio.setH01USERID(user.getH01USR());
			msgPortfolio.setH01PROGRM("EIE0010");
			msgPortfolio.setH01TIMSYS(getTimeStamp());
			msgPortfolio.setH01SCRCOD("01");
			msgPortfolio.setH01OPECOD("0002");

			try {
				msgPortfolio.setE01PRFCUN(userPO.getCusNum().trim());
			} catch (Exception e) {
				msgPortfolio.setE01PRFCUN("0");
			}

			try {
				msgPortfolio.setE01PRFNUM(userPO.getIdentifier().trim());
			} catch (Exception e) {
				msgPortfolio.setE01PRFNUM("0");
			}

			mp.sendMessage(msgPortfolio);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgPortfolio = (EIE001001Message) mp.receiveMessageRecord("EIE001001");

			if (mp.hasError(msgError)) {
				pageName = "EIE0010_inv_enter_port_new.jsp";
			} else {
				pageName = "EIE0010_inv_port_basic.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("invPort", msgPortfolio);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EIE0010", req);
			EIE001001Message msgPortfolio = (EIE001001Message) session.getAttribute("invPort");
			msgPortfolio.setH01USERID(user.getH01USR());
			msgPortfolio.setH01PROGRM("EIE0010");
			msgPortfolio.setH01TIMSYS(getTimeStamp());
			msgPortfolio.setH01SCRCOD("01");
			msgPortfolio.setH01OPECOD("0005");
			
			setMessageRecord(req, msgPortfolio);

			mp.sendMessage(msgPortfolio);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgPortfolio = (EIE001001Message) mp.receiveMessageRecord("EIE001001");

			if (mp.hasError(msgError)) {
				pageName = "EIE0010_inv_port_basic.jsp";
			} else {
				if (userPO.getPurpose().equals("NEW")) {
					userPO.setPurpose("MAINTENANCE");
					userPO.setCusNum(msgPortfolio.getE01PRFCUN());
					userPO.setIdentifier(msgPortfolio.getE01PRFNUM());
					pageName = "EIE0010_inv_port_confirm.jsp";
				} else {
					pageName = "EIE0010_inv_enter_port_new.jsp";
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("invPort", msgPortfolio);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

}
