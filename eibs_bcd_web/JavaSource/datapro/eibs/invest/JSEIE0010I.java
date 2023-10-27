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
import datapro.eibs.beans.ESD000006Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;

/**
 * Insert the type's description here.
 * Creation date: (1/19/00 6:08:55 PM)
 * @author: David Mavilla
 */

public class JSEIE0010I extends JSEIE0010 {
	
	protected static final  int R_ACC_HOLDERS	= 7;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen) {
		case R_ACC_HOLDERS :
			procReqInqTit(user, req, res, session);
			break;
		default :
			super.processRequest(user, req, res, session, screen);
			break;
		}	
	}


	private void procReqInqTit(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";

		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			ESD000006Message msgRT = (ESD000006Message) mp.getMessageRecord("ESD000006");
		 	msgRT.setH06USR(user.getH01USR());
		 	msgRT.setH06PGM("EDD0000");
		 	msgRT.setH06TIM(getTimeStamp());
		 	msgRT.setH06SCR("01");
		 	msgRT.setH06OPE("0004");
		 	msgRT.setE06ACC(req.getParameter("HOLDERS"));
		 	msgRT.setE06RTP("H");

			mp.sendMessage(msgRT);
			MessageRecord msg = mp.receiveMessageRecord();

			if (mp.hasError(msg)) {
				msgError = (ELEERRMessage) msg;
				pageName = "EDD0000_rt_inq_balances.jsp";
			} else {
				msgError = new ELEERRMessage();
				msgRT = (ESD000006Message) msg;
				pageName = "EIE0010_inv_acc_holders.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("rtTit", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	protected void procReqMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
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
				res.sendRedirect(srctx + 
						 "/servlet/datapro.eibs.invest.JSEWD0302?SCREEN=100" 
						 + "&CODE=" + msgPortfolio.getE01PRFNUM() 
						 + "&CUSTOMER=" + msgPortfolio.getE01PRFCUN()
						 );			
			} else {
				session.setAttribute("error", msgError);
				session.setAttribute("invPort", msgPortfolio);

				forward("EIE0010I_inv_port_basic.jsp", req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	protected void procActionEnterNew(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
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
			}

			try {
				msgPortfolio.setE01PRFNUM(userPO.getIdentifier().trim());
			} catch (Exception e) {
			}

			mp.sendMessage(msgPortfolio);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgPortfolio = (EIE001001Message) mp.receiveMessageRecord("EIE001001");

			if (mp.hasError(msgError)) {
				 res.sendRedirect(srctx + 
					 "/servlet/datapro.eibs.invest.JSEWD0302?SCREEN=100" 
					 + "&CODE=" + msgPortfolio.getE01PRFNUM() 
					 + "&CUSTOMER=" + msgPortfolio.getE01PRFCUN());
			} else {
				userPO.setCusNum(msgPortfolio.getE01PRFCUN());
				userPO.setIdentifier(msgPortfolio.getE01PRFNUM());
				
				session.setAttribute("error", msgError);
				session.setAttribute("invPort", msgPortfolio);

				forward("EIE0010I_inv_port_basic.jsp", req, res);
			}

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
				pageName = "EIE0010I_inv_port_basic.jsp";
			} else {
				pageName = "EIE0010I_inv_port_acc.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("invAcc", msgPortAcc);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
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
				pageName = "EIE0010I_inv_port_basic.jsp";
			} else {
				pageName = "EIE0010I_inv_port_bene.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("bene", msgBene);

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
				pageName = "EIE0010I_inv_port_basic.jsp";
			} else {
				pageName = "EIE0010I_inv_money.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("cdMoney", msgLaunder);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

}
