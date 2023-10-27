package datapro.eibs.client;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD000004Message;
import datapro.eibs.beans.ESD000005Message;
import datapro.eibs.beans.ESD000007Message;
import datapro.eibs.beans.ESD008001Message;
import datapro.eibs.beans.ESD008002Message;
import datapro.eibs.beans.ESD008003Message;
import datapro.eibs.beans.ESD008006Message;
import datapro.eibs.beans.ESD008008Message;
import datapro.eibs.beans.ESD008009Message;
import datapro.eibs.beans.ESD008011Message;
import datapro.eibs.beans.ESD008020Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;

public class JSESD0080A extends JSESD0080 {

	protected void procReqPerRef(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgPR = (ESD000004Message) mp.getMessageRecord("ESD000004");
		 	msgPR.setH04USR(user.getH01USR());
		 	msgPR.setH04PGM("ESD0080");
		 	msgPR.setH04TIM(getTimeStamp());
		 	msgPR.setH04SCR("01");
		 	msgPR.setH04OPE("0004");
		 	msgPR.setH04WK1("A");
		 	msgPR.setE04CUN(userPO.getCusNum());
		 	msgPR.setE04RTP("P");
			
			mp.sendMessage(msgPR);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgPR = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ESD0100_client_ap_both_per_ref.jsp";
			}
		 	 
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("perRef", msgPR);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqEnterInq(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos(); 
		userPO.setOption("CLIENT");
		userPO.setPurpose("APPROVAL_INQ");
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		session.setAttribute("client", new ESD008001Message());
		
		forward("ESD0100_client_ap_both_enter.jsp", req, res);
	}

	protected void procActionEnterInq(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD008001Message msgClientPersonal = (ESD008001Message) mp.getMessageRecord("ESD008001");
		 	msgClientPersonal.setH01USR(user.getH01USR());
		 	msgClientPersonal.setH01PGM("ESD0080");
		 	msgClientPersonal.setH01TIM(getTimeStamp());
		 	msgClientPersonal.setH01SCR("01");
		 	msgClientPersonal.setH01OPE("0004");
		 	msgClientPersonal.setH01WK1("A");
		 	
		 	try {
			 	msgClientPersonal.setE01CUN(req.getParameter("E01CUN").trim());
			} catch (Exception e) {
				msgClientPersonal.setE01CUN("0");
			}
		 	msgClientPersonal.setE01IDN("");
			
			mp.sendMessage(msgClientPersonal);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			MessageRecord newmessage = mp.receiveMessageRecord();
			
			if ("ESD008001".equals(newmessage.getFormatName())) {
				msgClientPersonal = (ESD008001Message) newmessage;
				
				userPO.setCusNum(msgClientPersonal.getE01CUN());
				userPO.setOption("CLIENT_P");
				userPO.setHeader1(msgClientPersonal.getE01CUN());
				userPO.setHeader2(msgClientPersonal.getE01IDN());
				userPO.setCusName(msgClientPersonal.getE01NA1());
				userPO.setHeader3(msgClientPersonal.getE01NA1());
				
				session.setAttribute("client", msgClientPersonal);
				if (mp.hasError(msgError)) {
					pageName = "error_viewer.jsp";
				} else {
					pageName = "ESD0100_client_ap_personal_basic.jsp";
				}
			} else if ("ESD008002".equals(newmessage.getFormatName())) {
				ESD008002Message msgClientEntity = (ESD008002Message) newmessage;
				
				userPO.setCusNum(msgClientEntity.getE02CUN());
				userPO.setCusType(msgClientEntity.getE02LGT());
				userPO.setOption("CLIENT_C");
				userPO.setHeader1(msgClientEntity.getE02CUN());
				userPO.setHeader2(msgClientEntity.getE02IDN());
				userPO.setHeader3(msgClientEntity.getE02NA1());
				userPO.setCusName(msgClientEntity.getE02NA1());
				
				session.setAttribute("client", msgClientEntity);
				if (mp.hasError(msgError)) {
					pageName = "error_viewer.jsp";
				} else {
					pageName = "ESD0100_client_ap_corp_basic.jsp";
				}
			} else {
				throw new ServletException("Message " + newmessage.getFormatName() + " received.");
			}
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
		    session.setAttribute("userPO", userPO);
			
			
			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqProEmp(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgPE = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgPE.setH04USR(user.getH01USR());
			msgPE.setH04PGM("ESD0080");
			msgPE.setH04TIM(getTimeStamp());
			msgPE.setH04SCR("01");
			msgPE.setH04OPE("0004");
			msgPE.setH04WK1("A");
			msgPE.setE04CUN(userPO.getCusNum());
			msgPE.setE04RTP("D");
			
			mp.sendMessage(msgPE);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgPE = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ESD0100_client_ap_both_pro_emp.jsp";
			}
		 	 
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("proEmp", msgPE);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqDatCon(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgDC = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgDC.setH04USR(user.getH01USR());
			msgDC.setH04PGM("ESD0080");
			msgDC.setH04TIM(getTimeStamp());
			msgDC.setH04SCR("01");
			msgDC.setH04OPE("0004");
			msgDC.setH04WK1("A");
			msgDC.setE04CUN(userPO.getCusNum());
			msgDC.setE04RTP("M");
			
			mp.sendMessage(msgDC);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgDC = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ESD0100_client_ap_both_dat_con.jsp";
			}
		 	 
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("datCon", msgDC);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqPerDep(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgDE = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgDE.setH04USR(user.getH01USR());
			msgDE.setH04PGM("ESD0080");
			msgDE.setH04TIM(getTimeStamp());
			msgDE.setH04SCR("01");
			msgDE.setH04OPE("0004");
			msgDE.setH04WK1("A");
			msgDE.setE04CUN(userPO.getCusNum());
			msgDE.setE04RTP("C");
			
			mp.sendMessage(msgDE);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgDE = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ESD0100_client_ap_both_per_dep.jsp";
			}
		 	 
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("perDep", msgDE);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqPerFam(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgFR = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgFR.setH04USR(user.getH01USR());
			msgFR.setH04PGM("ESD0080");
			msgFR.setH04TIM(getTimeStamp());
			msgFR.setH04SCR("01");
			msgFR.setH04OPE("0004");
			msgFR.setH04WK1("A");
			msgFR.setE04CUN(userPO.getCusNum());
			msgFR.setE04RTP("F");
			
			mp.sendMessage(msgFR);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgFR = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ESD0100_client_ap_both_per_fam.jsp";
			}
		 	 
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("perFam", msgFR);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqAccountTitle(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgMailA = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgMailA.setH04USR(user.getH01USR());
			msgMailA.setH04PGM("ESD0080");
			msgMailA.setH04TIM(getTimeStamp());
			msgMailA.setH04SCR("01");
			msgMailA.setH04OPE("0004");
			msgMailA.setH04WK1("A");
			msgMailA.setE04CUN(userPO.getCusNum());
			msgMailA.setE04RTP("1");
			msgMailA.setH04WK1("T");
			
			mp.sendMessage(msgMailA);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgMailA = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ESD0100_client_ap_both_account_title.jsp";
			}
		 	 
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("mailA", msgMailA);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procActionEnterPaymentInst(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD008011Message msgClient = (ESD008011Message) mp.getMessageRecord("ESD008011");
		 	msgClient.setH011USR(user.getH01USR());
		 	msgClient.setH011PGM("ESD0080");
		 	msgClient.setH011TIM(getTimeStamp());
		 	msgClient.setH011SCR("01");
		 	msgClient.setH011OPE("0001");
		 	try {
			 	msgClient.setE11CUS(req.getParameter("E11CUS").trim());
			} catch (Exception e) {
				msgClient.setE11CUS("0");
			}
			try {
			 	msgClient.setE11CCY(req.getParameter("E11CCY").trim());
			} catch (Exception e) {
				msgClient.setE11CCY("");
			}
			try {
			 	msgClient.setE11TYP(req.getParameter("E11TYP").trim());
			} catch (Exception e) {
				msgClient.setE11TYP("");
			}
			
			mp.sendMessage(msgClient);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgClient = (ESD008011Message) mp.receiveMessageRecord("ESD008011");
			
			if (mp.hasError(msgError)) {
				pageName = "ESD0100_client_ap_corp_enter_inst.jsp";
			} else {
				pageName = "ESD0100_client_ap_corp_payment_inst.jsp";
			}
		 	 
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("pymInst", msgClient);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqEnterPaymentInst(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("client", new ESD008001Message());
		
		forward("ESD0100_client_ap_corp_enter_inst.jsp", req, res);
	}

	protected void procReqCorpPayInst(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "0003";
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD008011Message msgPayInst = (ESD008011Message) mp.getMessageRecord("ESD008011");
		 	msgPayInst.setH011USR(user.getH01USR());
		 	msgPayInst.setH011PGM("ESD0080");
		 	msgPayInst.setH011TIM(getTimeStamp());
		 	msgPayInst.setH011SCR("01");
		 	msgPayInst.setH011OPE(opCode);
		 	msgPayInst.setE11CUS(userPO.getCusNum());
			try {	 	
		 		msgPayInst.setE11CCY(req.getParameter("CCY").trim());
			} catch (Exception e) {
			}
			
			mp.sendMessage(msgPayInst);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgPayInst = (ESD008011Message) mp.receiveMessageRecord("ESD008011");
			
			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ESD0100_client_ap_corp_payment_instructions.jsp";
			}
		 	 
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("pymInst", msgPayInst);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqKnowYourCustomer(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000005Message msgSpecInst = (ESD000005Message) mp.getMessageRecord("ESD000005");
		 	msgSpecInst.setH05USR(user.getH01USR());
		 	msgSpecInst.setH05PGM("ESD0080");
		 	msgSpecInst.setH05TIM(getTimeStamp());
		 	msgSpecInst.setH05SCR("01");
		 	msgSpecInst.setH05OPE("0004");
		 	msgSpecInst.setH05WK1("A");
		 	msgSpecInst.setE05ACC(userPO.getCusNum());
		 	msgSpecInst.setE05ACD("K1");
			
			mp.sendMessage(msgSpecInst);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgSpecInst = (ESD000005Message) mp.receiveMessageRecord("ESD000005");
			
			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ESD0100_client_ap_both_know_your_customer.jsp";
			}
		 	 
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("specInst", msgSpecInst);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqMarketing(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD008009Message msgMarketing = (ESD008009Message) mp.getMessageRecord("ESD008009");
		 	msgMarketing.setH09USR(user.getH01USR());
		 	msgMarketing.setH09PGM("ESD0080");
		 	msgMarketing.setH09TIM(getTimeStamp());
		 	msgMarketing.setH09SCR("01");
		 	msgMarketing.setH09OPE("0004");
		 	msgMarketing.setH09WK1("A");
		 	msgMarketing.setE09CUN(userPO.getCusNum());
			
			mp.sendMessage(msgMarketing);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgMarketing = (ESD008009Message) mp.receiveMessageRecord("ESD008009");
			
			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ESD0100_client_ap_both_marketing.jsp";
			}
		 	 
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("marketing", msgMarketing);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqLegalRef(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgLR = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgLR.setH04USR(user.getH01USR());
			msgLR.setH04PGM("ESD0080");
			msgLR.setH04TIM(getTimeStamp());
			msgLR.setH04SCR("01");
		 	msgLR.setH04OPE("0004");
		 	msgLR.setH04WK1("A");
			msgLR.setE04CUN(userPO.getCusNum());
			msgLR.setE04RTP("5");
			
			mp.sendMessage(msgLR);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgLR = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ESD0100_client_ap_both_legal_rep.jsp";
			}
		 	 
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("legalRep", msgLR);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqComRef(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgCR = (ESD000004Message) mp.getMessageRecord("ESD000004");
		 	msgCR.setH04USR(user.getH01USR());
		 	msgCR.setH04PGM("ESD0080");
		 	msgCR.setH04TIM(getTimeStamp());
		 	msgCR.setH04SCR("01");
		 	msgCR.setH04OPE("0004");
		 	msgCR.setH04WK1("A");
		 	msgCR.setE04CUN(userPO.getCusNum());
		 	msgCR.setE04RTP("7");
			
			mp.sendMessage(msgCR);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgCR = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ESD0100_client_ap_both_com_ref.jsp";
			}
		 	 
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("comRef", msgCR);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqBankRef(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgBR = (ESD000004Message) mp.getMessageRecord("ESD000004");
		 	msgBR.setH04USR(user.getH01USR());
		 	msgBR.setH04PGM("ESD0080");
		 	msgBR.setH04TIM(getTimeStamp());
		 	msgBR.setH04SCR("01");
		 	msgBR.setH04OPE("0004");
		 	msgBR.setH04WK1("A");
		 	msgBR.setE04CUN(userPO.getCusNum());
		 	msgBR.setE04RTP("6");
			
			mp.sendMessage(msgBR);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgBR = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			if (mp.hasError(msgError)) {
				pageName = "ESD0100_client_both_enter.jsp";
			} else {
				pageName = "ESD0100_client_ap_both_bank_ref.jsp";
			}
		 	 
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("bankRef", msgBR);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqCom(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000007Message msgCom = (ESD000007Message) mp.getMessageRecord("ESD000007");
		 	msgCom.setH07USR(user.getH01USR());
		 	msgCom.setH07PGM("ESD0080");
		 	msgCom.setH07TIM(getTimeStamp());
		 	msgCom.setH07SCR("01");
		 	msgCom.setH07OPE("0004");
		 	msgCom.setH07WK1("A");
		 	msgCom.setE07CUN(userPO.getCusNum());
			
			mp.sendMessage(msgCom);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgCom = (ESD000007Message) mp.receiveMessageRecord("ESD000007");
			
			if (mp.hasError(msgError)) {
				pageName = "ESD0100_client_both_enter.jsp";
			} else {
				pageName = "ESD0100_client_ap_both_com.jsp";
			}
		 	 
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("com", msgCom);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqSpecInst(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000005Message msgSpecInst = (ESD000005Message) mp.getMessageRecord("ESD000005");
		 	msgSpecInst.setH05USR(user.getH01USR());
		 	msgSpecInst.setH05PGM("ESD0080");
		 	msgSpecInst.setH05TIM(getTimeStamp());
		 	msgSpecInst.setH05SCR("01");
		 	msgSpecInst.setH05OPE("0004");
		 	msgSpecInst.setH05WK1("A");
		 	msgSpecInst.setE05ACC(userPO.getCusNum());
		 	msgSpecInst.setE05ACD("C1");
			
			mp.sendMessage(msgSpecInst);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgSpecInst = (ESD000005Message) mp.receiveMessageRecord("ESD000005");
			
			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ESD0100_client_ap_both_special_inst.jsp";
			}
		 	 
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("specInst", msgSpecInst);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqMailAddress(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgMailA = (ESD000004Message) mp.getMessageRecord("ESD000004");
		 	msgMailA.setH04USR(user.getH01USR());
		 	msgMailA.setH04PGM("ESD0080");
		 	msgMailA.setH04TIM(getTimeStamp());
		 	msgMailA.setH04SCR("01");
		 	msgMailA.setH04OPE("0004");
		 	msgMailA.setH04WK1("A");
		 	msgMailA.setE04CUN(userPO.getCusNum());
		 	msgMailA.setE04RTP("1");
			
			mp.sendMessage(msgMailA);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgMailA = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ESD0100_client_ap_both_mail_address.jsp";
			}
		 	 
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("mailA", msgMailA);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqCodes(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD008003Message msgCodes = (ESD008003Message) mp.getMessageRecord("ESD008003");
		 	msgCodes.setH03USR(user.getH01USR());
		 	msgCodes.setH03PGM("ESD0080");
		 	msgCodes.setH03TIM(getTimeStamp());
		 	msgCodes.setH03SCR("01");
		 	msgCodes.setH03OPE("0004");
		 	msgCodes.setH03WK1("A");
		 	msgCodes.setE03CUN(userPO.getCusNum());
			
			mp.sendMessage(msgCodes);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgCodes = (ESD008003Message) mp.receiveMessageRecord("ESD008003");
			
			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ESD0100_client_ap_both_codes.jsp";
			}
		 	 
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("codes", msgCodes);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqCorpCapital(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD008008Message msgCapital = (ESD008008Message) mp.getMessageRecord("ESD008008");
		 	msgCapital.setH08USR(user.getH01USR());
		 	msgCapital.setH08PGM("ESD0080");
		 	msgCapital.setH08TIM(getTimeStamp());
		 	msgCapital.setH08SCR("01");
		 	msgCapital.setH08OPE("0004");
		 	msgCapital.setH08WK1("A");
		 	msgCapital.setE08CUN(userPO.getCusNum());
			
			mp.sendMessage(msgCapital);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgCapital = (ESD008008Message) mp.receiveMessageRecord("ESD008008");
			
			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ESD0100_client_ap_corp_capital.jsp";
			}
		 	 
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("capital", msgCapital);
			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqCorpLiabilities(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgLiabilities = (ESD000004Message) mp.getMessageRecord("ESD000004");
		 	msgLiabilities.setH04USR(user.getH01USR());
		 	msgLiabilities.setH04PGM("ESD0080");
		 	msgLiabilities.setH04TIM(getTimeStamp());
		 	msgLiabilities.setH04SCR("01");
		 	msgLiabilities.setH04OPE("0004");
		 	msgLiabilities.setH04WK1("A");
		 	msgLiabilities.setE04CUN(userPO.getCusNum());
		 	msgLiabilities.setE04RTP("A");
			
			mp.sendMessage(msgLiabilities);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgLiabilities = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ESD0100_client_ap_corp_liabilities.jsp";
			}
		 	 
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("liabilities", msgLiabilities);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqCorpAssets(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgAssets = (ESD000004Message) mp.getMessageRecord("ESD000004");
		 	msgAssets.setH04USR(user.getH01USR());
		 	msgAssets.setH04PGM("ESD0080");
		 	msgAssets.setH04TIM(getTimeStamp());
		 	msgAssets.setH04SCR("01");
		 	msgAssets.setH04OPE("0004");
		 	msgAssets.setH04WK1("A");
		 	msgAssets.setE04CUN(userPO.getCusNum());
		 	msgAssets.setE04RTP("9");
			
			mp.sendMessage(msgAssets);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgAssets = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ESD0100_client_ap_corp_assets.jsp";
			}
		 	 
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("assets", msgAssets);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqCorpBoard(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgBoard = (ESD000004Message) mp.getMessageRecord("ESD000004");
		 	msgBoard.setH04USR(user.getH01USR());
		 	msgBoard.setH04PGM("ESD0080");
		 	msgBoard.setH04TIM(getTimeStamp());
		 	msgBoard.setH04SCR("01");
		 	msgBoard.setH04OPE("0004");
		 	msgBoard.setH04WK1("A");
		 	msgBoard.setE04CUN(userPO.getCusNum());
		 	msgBoard.setE04RTP("3");
			
			mp.sendMessage(msgBoard);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgBoard = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ESD0100_client_ap_corp_board.jsp";
			}
		 	 
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("board", msgBoard);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqCorpStockHolder(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgStockHolder = (ESD000004Message) mp.getMessageRecord("ESD000004");
		 	msgStockHolder.setH04USR(user.getH01USR());
		 	msgStockHolder.setH04PGM("ESD0080");
		 	msgStockHolder.setH04TIM(getTimeStamp());
		 	msgStockHolder.setH04SCR("01");
		 	msgStockHolder.setH04OPE("0004");
		 	msgStockHolder.setH04WK1("A");
		 	msgStockHolder.setE04CUN(userPO.getCusNum());
		 	msgStockHolder.setE04RTP("2");
			
			mp.sendMessage(msgStockHolder);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgStockHolder = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ESD0100_client_ap_corp_stock_holder.jsp";
			}
		 	 
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("stockHolder", msgStockHolder);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqCorpBasic(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD008002Message msgClientEntity = (ESD008002Message) mp.getMessageRecord("ESD008002");
		 	msgClientEntity.setH02USR(user.getH01USR());
		 	msgClientEntity.setH02PGM("ESD0080");
		 	msgClientEntity.setH02TIM(getTimeStamp());
		 	msgClientEntity.setH02SCR("01");
		 	msgClientEntity.setH02OPE("0004");
		 	msgClientEntity.setE02CUN(userPO.getCusNum());
		 	msgClientEntity.setH02WK1("A");
			
			mp.sendMessage(msgClientEntity);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgClientEntity = (ESD008002Message) mp.receiveMessageRecord("ESD008002");
			
			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ESD0100_client_ap_corp_basic.jsp";
			}
		 	 
			userPO.setCusNum(msgClientEntity.getE02CUN());
			userPO.setHeader1(msgClientEntity.getE02CUN());
			userPO.setHeader2(msgClientEntity.getE02IDN());
			userPO.setCusName(msgClientEntity.getE02NA1());
			userPO.setHeader3(msgClientEntity.getE02NA1());
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("client", msgClientEntity);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqPerShortBasic(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD008020Message msgClientPersonal = (ESD008020Message) mp.getMessageRecord("ESD008020");
		 	msgClientPersonal.setH20USR(user.getH01USR());
		 	msgClientPersonal.setH20PGM("ESD0080");
		 	msgClientPersonal.setH20TIM(getTimeStamp());
		 	msgClientPersonal.setH20SCR("01");
		 	msgClientPersonal.setH20OPE("0004");
		 	msgClientPersonal.setH20WK1("A");
		 	try {
		 		msgClientPersonal.setE20CUN(req.getParameter("CUSNUM").trim());
		 	} catch (Exception e) {
		 	}
		 	try {
		 		msgClientPersonal.setE20IDN(req.getParameter("CUSIDN").trim());
		 	} catch (Exception e) {
		 	}
		 	
			mp.sendMessage(msgClientPersonal);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgClientPersonal = (ESD008020Message) mp.receiveMessageRecord("ESD008020");
			
			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ESD0100_client_short_ap_personal_basic.jsp";
			}
			
			userPO.setCusNum(msgClientPersonal.getE20CUN());
			userPO.setCusName(msgClientPersonal.getE20NA1());
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("client", msgClientPersonal);
			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqPerEmployment(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD008006Message msgEmployment = (ESD008006Message) mp.getMessageRecord("ESD008006");
		 	msgEmployment.setH06USR(user.getH01USR());
		 	msgEmployment.setH06PGM("ESD0080");
		 	msgEmployment.setH06TIM(getTimeStamp());
		 	msgEmployment.setH06SCR("01");
		 	msgEmployment.setH06OPE("0004");
		 	msgEmployment.setH06WK1("A");
		 	msgEmployment.setE06CUN(userPO.getCusNum());
			
			mp.sendMessage(msgEmployment);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgEmployment = (ESD008006Message) mp.receiveMessageRecord("ESD008006");
			
			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ESD0100_client_ap_personal_employment.jsp";
			}
		 	 
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("employment", msgEmployment);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqPerBene(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgBene = (ESD000004Message) mp.getMessageRecord("ESD000004");
		 	msgBene.setH04USR(user.getH01USR());
		 	msgBene.setH04PGM("ESD0080");
		 	msgBene.setH04TIM(getTimeStamp());
		 	msgBene.setH04SCR("01");
		 	msgBene.setH04OPE("0004");
		 	msgBene.setH04WK1("A");
		 	msgBene.setE04CUN(userPO.getCusNum());
		 	msgBene.setE04RTP("4");
			
			mp.sendMessage(msgBene);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgBene = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ESD0100_client_ap_personal_bene.jsp";
			}
		 	 
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("bene", msgBene);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqPerBasic(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD008001Message msgClientPersonal = (ESD008001Message) mp.getMessageRecord("ESD008001");
		 	msgClientPersonal.setH01USR(user.getH01USR());
		 	msgClientPersonal.setH01PGM("ESD0080");
		 	msgClientPersonal.setH01TIM(getTimeStamp());
		 	msgClientPersonal.setH01SCR("01");
		 	msgClientPersonal.setH01OPE("0004");
		 	msgClientPersonal.setH01WK1("A");
		 	msgClientPersonal.setE01CUN(userPO.getCusNum());
		 	
			mp.sendMessage(msgClientPersonal);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgClientPersonal = (ESD008001Message) mp.receiveMessageRecord("ESD008001");
			
			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ESD0100_client_ap_personal_basic.jsp";
			}
		 	 
			userPO.setCusNum(msgClientPersonal.getE01CUN());
			userPO.setHeader1(msgClientPersonal.getE01CUN());
			userPO.setHeader2(msgClientPersonal.getE01IDN());
			userPO.setCusName(msgClientPersonal.getE01NA1());
			userPO.setHeader3(msgClientPersonal.getE01NA1());
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("client", msgClientPersonal);
			session.setAttribute("userPO", userPO);
			
			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}
}
