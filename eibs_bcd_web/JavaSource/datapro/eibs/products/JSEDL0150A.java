package datapro.eibs.products;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.DataTransaction;
import datapro.eibs.beans.EDL015001Message;
import datapro.eibs.beans.EDL015005Message;
import datapro.eibs.beans.EDL015206Message;
import datapro.eibs.beans.EDL015210Message;
import datapro.eibs.beans.EDL015230Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD000002Message;
import datapro.eibs.beans.ESD000004Message;
import datapro.eibs.beans.ESD000005Message;
import datapro.eibs.beans.ESD000006Message;
import datapro.eibs.beans.ESD001401Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;

public class JSEDL0150A extends JSEDL0150 {

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

        switch (screen) {
			case R_GEN_INF :
				procReqGenInf(user, req, res, session);
				break;
	 	case R_NEW_TRAN :
	  	case R_OTHERS_TRANS :	 
	  			procReqOthersTransaction(user, req, res, session);	
	 		break;
			default :
				super.processRequest(user, req, res, session, screen);
				break;
        }
	}
	
	protected void procActionEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0150", req);
			EDL015001Message msgLN = (EDL015001Message) mp.getMessageRecord("EDL015001");
			msgLN.setH01USERID(user.getH01USR());
			msgLN.setH01PROGRM("EDL0150");
			msgLN.setH01TIMSYS(getTimeStamp());
			msgLN.setH01SCRCOD("01");
			msgLN.setH01OPECOD("0004");
			msgLN.setE01DEAACD("10");
			msgLN.setH01FLGWK1("A");
			try {
				msgLN.setE01DEAACC(req.getParameter("E01DEAACC").trim());
			} catch (Exception e) {
				msgLN.setE01DEAACC(userPO.getAccNum().trim());
			}

			mp.sendMessage(msgLN);

			if (procRecMaintData(mp, user, req, res, session)) {
				forward("EDL0140_ln_ap_basic.jsp", req, res);
			} else {
				forward("error_viewer.jsp", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}
	}

	protected void procReqEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("LN");
		userPO.setPurpose("APPROVAL_INQ");
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		
		forward("EDL0150_ln_enter_maint.jsp", req, res);
	}

	protected void procReqOthersTransaction(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos userPO = getUserPos(req);
		
		DataTransaction transData = new DataTransaction();
		transData.setWrkFile("4");
		transData.setAccNum(userPO.getAccNum());
		session.setAttribute("transData", transData);
		
		res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSEGL0035I?SCREEN=1");
	}

	private void procReqNewTransaction(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0150", req);
			EDL015230Message msgLN = (EDL015230Message) mp.getMessageRecord("EDL015230");
			msgLN.setH30USERID(user.getH01USR());
			msgLN.setH30PROGRM("EDL0130");
			msgLN.setH30TIMSYS(getTimeStamp());
			msgLN.setH30SCRCOD("01");
			msgLN.setH30OPECOD("0004");
			msgLN.setE30DEAACC(userPO.getAccNum());
			msgLN.setH30FLGWK1("A");

			mp.sendMessage(msgLN);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgLN = (EDL015230Message) mp.receiveMessageRecord("EDL015230");

			if (mp.hasError(msgError)) {
				pageName = "EDL0140_ln_ap_basic.jsp";
			} else {
				pageName = "EDL0140_ln_ap_new_transac.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("lnGenTran", msgLN);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
		
	}

	protected void procReqCancelDebit(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0150", req);
			EDL015210Message msgLN = (EDL015210Message) mp.getMessageRecord("EDL015210");
			msgLN.setH10USERID(user.getH01USR());
			msgLN.setH10PROGRM("EDL0150");
			msgLN.setH10TIMSYS(""); //getTimeStamp()
			msgLN.setH10SCRCOD("01");
			msgLN.setH10OPECOD("0004");
			msgLN.setE10DEAACC(userPO.getAccNum());

			mp.sendMessage(msgLN);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgLN = (EDL015210Message) mp.receiveMessageRecord("EDL015210");

			session.setAttribute("error", msgError);
			session.setAttribute("lnAutoDebit", msgLN);

			if (mp.hasError(msgError)) {
				forward("EDL0140_ln_ap_basic.jsp", req, res);
			} else {
				forward("EDL0140_ln_cancel_auto_debit.jsp", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqGenInf(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0150", req);
			EDL015005Message msgGenInf = (EDL015005Message) mp.getMessageRecord("EDL015005");
			msgGenInf.setH05USERID(user.getH01USR());
			msgGenInf.setH05PROGRM("EDL0150");
			msgGenInf.setH05TIMSYS(getTimeStamp());
			msgGenInf.setH05SCRCOD("01");
			msgGenInf.setH05OPECOD("0004");
			msgGenInf.setE05DEAACC(userPO.getAccNum());
			msgGenInf.setH05FLGWK1("A");
			
			mp.sendMessage(msgGenInf);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgGenInf = (EDL015005Message) mp.receiveMessageRecord("EDL015005");
			
			if (mp.hasError(msgError)) {
				pageName = "EDL0140_ln_ap_mant.jsp";
			} else {
				pageName = "EDL0140_ln_ap_gen_inf.jsp";
			}
			
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("lnGenInf", msgGenInf);
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	protected void procReqAdditionalsCodes(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "MAINTENANCE".equals(userPO.getPurpose()) ? "0002" : "0004";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0014", req);
			ESD001401Message msgLN = (ESD001401Message) mp.getMessageRecord("ESD001401");
			msgLN.setH14USR(user.getH01USR());
			msgLN.setH14PGM("ESD0014");
			msgLN.setH14TIM(getTimeStamp()); //getTimeStamp()
			msgLN.setH14SCR("01");
			msgLN.setH14OPE(opCode);
			msgLN.setE14ACC(userPO.getAccNum());

			mp.sendMessage(msgLN);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgLN = (ESD001401Message) mp.receiveMessageRecord("ESD001401");

			session.setAttribute("error", msgError);
			session.setAttribute("lnCodes", msgLN);

			if (mp.hasError(msgError)) {
				forward("EDL0140_ln_ap_basic.jsp", req, res);
			} else {
				forward("EDL0140_ln_ap_addcodes.jsp", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}
	}

	protected void procReqAccountTitle(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0000", req);
			ESD000004Message msgMailA = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgMailA.setH04USR(user.getH01USR());
			msgMailA.setH04PGM("ESD0080");
			msgMailA.setH04TIM(getTimeStamp());
			msgMailA.setH04SCR("01");
			msgMailA.setH04OPE("0004");
			msgMailA.setE04CUN(userPO.getAccNum());
			msgMailA.setE04RTP("1");
			msgMailA.setH04WK1("T");
			msgMailA.setH04WK3("2");

			mp.sendMessage(msgMailA);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgMailA = (ESD000004Message) mp.receiveMessageRecord("ESD000004");

			session.setAttribute("error", msgError);
			session.setAttribute("mailA", msgMailA);

			if (mp.hasError(msgError)) {
				forward("EDL0140_ln_ap_basic.jsp", req, res);
			} else {
				forward("EDL0140_ln_ap_account_title.jsp", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}
	}

	protected void procReqSpecialCodes(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "MAINTENANCE".equals(userPO.getPurpose()) ? "0002" : "0004";
		MessageProcessor mp = null;
		MessageRecord mr = null;
		ELEERRMessage msgError = null;		
		
		try {
			mp = getMessageProcessor("ESD0000", req);
			ESD000002Message msgLN = (ESD000002Message) mp.getMessageRecord("ESD000002");
			msgLN.setH02USR(user.getH01USR());
			msgLN.setH02PGM("ESD0000");
			msgLN.setH02TIM(""); //getTimeStamp()
			msgLN.setH02SCR("01");
			msgLN.setH02WK1("A");
			msgLN.setH02OPE(opCode);
			msgLN.setE02ACC(userPO.getAccNum());

			mp.sendMessage(msgLN);
			mr = mp.receiveMessageRecord();
			
			if(mr instanceof ELEERRMessage){
				msgError = (ELEERRMessage) mr;
			} else {
				msgLN = (ESD000002Message) mr;
			}
			
			session.setAttribute("error", msgError);
			session.setAttribute("lnCodes", msgLN);


			if (mp.hasError(msgError)) {
				forward("EDL0140_ln_ap_basic.jsp", req, res);
			} else {
				forward("EDL0140_ln_ap_codes.jsp", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}
	}

	protected void procReqExchangeRate(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0150", req);
			EDL015206Message msgLN = (EDL015206Message) mp.getMessageRecord("EDL015206");
			msgLN.setH06USERID(user.getH01USR());
			msgLN.setH06PROGRM("EDL0150");
			msgLN.setH06TIMSYS(""); //getTimeStamp()
			msgLN.setH06SCRCOD("01");
			msgLN.setH06OPECOD("0004");
			msgLN.setE06DEAACC(userPO.getAccNum());
			msgLN.setH06FLGWK1("A");

			mp.sendMessage(msgLN);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgLN = (EDL015206Message) mp.receiveMessageRecord("EDL015206");

			session.setAttribute("error", msgError);
			session.setAttribute("lnRate", msgLN);

			if (mp.hasError(msgError)) {
				forward("EDL0140_ln_ap_basic.jsp", req, res);
			} else {
				forward("EDL0140_ln_ap_xchg_rate.jsp", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}
	}

	protected void procReqTit(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0000", req);
			ESD000006Message msgLN = (ESD000006Message) mp.getMessageRecord("ESD000006");
			msgLN.setH06USR(user.getH01USR());
			msgLN.setH06PGM("EDL0150");
			msgLN.setH06TIM(""); //getTimeStamp()
			msgLN.setH06SCR("01");
			msgLN.setH06OPE("0004");
			msgLN.setE06ACC(userPO.getAccNum());
			msgLN.setE06RTP("H");

			mp.sendMessage(msgLN);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgLN = (ESD000006Message) mp.receiveMessageRecord("ESD000006");

			session.setAttribute("error", msgError);
			session.setAttribute("lnTit", msgLN);
			
			if (mp.hasError(msgError)) {
				forward("EDL0140_ln_ap_basic.jsp", req, res);
			} else {
				forward("EDL0140_ln_ap_tit.jsp", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}
	}
	
	protected void procReqEspInst(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0000", req);
			ESD000005Message msgLN = (ESD000005Message) mp.getMessageRecord("ESD000005");
			msgLN.setH05USR(user.getH01USR());
			msgLN.setH05PGM("EDL0150");
			msgLN.setH05TIM(""); //getTimeStamp()
			msgLN.setH05SCR("01");
			msgLN.setH05OPE("0002");
			msgLN.setE05ACC(userPO.getAccNum());
			msgLN.setE05ACD("10");
			
			mp.sendMessage(msgLN);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgLN = (ESD000005Message) mp.receiveMessageRecord("ESD000005");
			
			session.setAttribute("error", msgError);
			session.setAttribute("lnInst", msgLN);
			
			if (mp.hasError(msgError)) {
				forward("EDL0140_ln_ap_basic.jsp", req, res);
			} else {
				forward("EDL0140_ln_ap_special_inst.jsp", req, res);
			}
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	protected void procReqMaint(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0150", req);
			EDL015001Message msgLN = (EDL015001Message) mp.getMessageRecord("EDL015001");
			msgLN.setH01USERID(user.getH01USR());
			msgLN.setH01PROGRM("EDL0150");
			msgLN.setH01TIMSYS(getTimeStamp());
			msgLN.setH01SCRCOD("01");
			msgLN.setH01OPECOD("0004");
			msgLN.setE01DEAACD("10");
			msgLN.setH01FLGWK1("A");
			try {
				msgLN.setE01DEAACC(userPO.getAccNum());
			} catch (Exception e) {
				msgLN.setE01DEAACC("0");
			}
			
			mp.sendMessage(msgLN);
			
			if (procRecMaintData(mp, user, req, res, session)) { // There are no errors
				forward("EDL0140_ln_ap_basic.jsp", req, res);
			} else {
				forward("EDL0150_ln_enter_maint.jsp", req, res);
			}
			
		} finally {
			if (mp != null) mp.close();
		}
	}

}
