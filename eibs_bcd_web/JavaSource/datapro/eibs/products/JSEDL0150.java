package datapro.eibs.products;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.DataTransaction;
import datapro.eibs.beans.EDL015001Message;
import datapro.eibs.beans.EDL015002Message;
import datapro.eibs.beans.EDL015003Message;
import datapro.eibs.beans.EDL015004Message;
import datapro.eibs.beans.EDL015005Message;
import datapro.eibs.beans.EDL015009Message;
import datapro.eibs.beans.EDL015206Message;
import datapro.eibs.beans.EDL015210Message;
import datapro.eibs.beans.EDL015230Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD000002Message;
import datapro.eibs.beans.ESD000004Message;
import datapro.eibs.beans.ESD000005Message;
import datapro.eibs.beans.ESD000006Message;
import datapro.eibs.beans.ESD001401Message;
import datapro.eibs.beans.ESD080001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBListRec;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;

public class JSEDL0150 extends JSEIBSServlet {

	// certificate of deposit 
	protected static final int R_NEW = 1;
	protected static final int A_NEW = 2;
	protected static final int R_MAINTENANCE = 3;
	protected static final int R_TRANSACTION = 5;
	protected static final int A_TRANSACTION = 6;
	protected static final int R_TITULARES = 7;
	protected static final int A_TITULARES = 8;
	protected static final int R_PRECANCEL = 9;
	protected static final int A_PRECANCEL = 10;
	protected static final int R_SPECIAL_INST = 11;
	protected static final int A_SPECIAL_INST = 12;
	protected static final int R_EXCHANGE = 13;
	protected static final int A_EXCHANGE = 14;
	protected static final int R_CODES = 15;
	protected static final int A_CODES = 16;
	protected static final int R_FINISH = 17;
	protected static final int A_FINISH = 18;
	protected static final int R_INT_PREP = 19;
	protected static final int A_INT_PREP = 20;
	protected static final int R_CANCEL_DET = 21;
	protected static final int A_CANCEL_DET = 22;
	protected static final int R_PRINT_NEW = 21;
	protected static final int A_PRINT_NEW = 22;
	protected static final int R_GEN_INF = 23;
	protected static final int A_GEN_INF = 24;
	protected static final int R_NEW_TRAN = 25;
	protected static final int A_NEW_TRAN = 26;
	protected static final int R_OTHERS_TRANS = 27;
	protected static final int R_NEW_PARTICIPATION = 31;
	protected static final int A_NEW_PARTICIPATION = 32;
	protected static final int R_CANCEL_DEBIT = 33;
	protected static final int A_CANCEL_DEBIT = 34;
	protected static final int R_CANCEL_BLOQUEO = 333;
	protected static final int A_CANCEL_BLOQUEO = 344;
	protected static final int R_ADDCODES = 35;
	protected static final int A_ADDCODES = 36;
	protected static final int R_DATOS_CES = 45;
	protected static final int R_ACCOUNT_TITLE = 57;
	protected static final int A_ACCOUNT_TITLE = 58;
	protected static final int A_REFRESH_CYCLE = 60;
	// entering options
	protected static final int R_ENTER_NEW = 100;
	protected static final int A_ENTER_NEW = 200;
	protected static final int R_ENTER_MAINT = 300;
	protected static final int A_ENTER_MAINT = 400;
	protected static final int A_MAINT_TO_BEAN = 500;
	protected static final int A_MAINT_TO_SCK = 502;
	protected static final int A_MAINT_DED = 504;
	protected static final int A_MAINT_COLL = 506;
	protected static final int A_MAINT_PMNT = 508;
	protected static final int A_MAINT_PMNT_PLUS = 509;
	protected static final int A_ENTER_CANCEL = 600;
	protected static final int R_ENTER_TRANSAC = 700;
	protected static final int A_ENTER_TRANSAC = 800;
	protected static final int R_ENTER_PRINT = 900;
	protected static final int A_ENTER_PRINT = 1000;
	protected static final int R_ENTER_CALC = 1100;
	protected static final int A_ENTER_CALC = 1200;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

        switch(screen){
			// BEGIN CD
			// Request
			case R_MAINTENANCE :
				procReqMaint(user, req, res, session);
				break;
			case R_SPECIAL_INST :
				procReqEspInst(user, req, res, session);
				break;
			case R_TITULARES :
				procReqTit(user, req, res, session);
				break;
			case R_EXCHANGE :
				procReqExchangeRate(user, req, res, session);
				break;
			case R_ACCOUNT_TITLE :
				procReqAccountTitle(user, req, res, session);
				break;																								
			case R_CODES :
				procReqSpecialCodes(user, req, res, session);
				break;
			case R_ADDCODES :
				procReqAdditionalsCodes(user, req, res, session);
				break;						
			case R_INT_PREP :
				procReqIntPrep(user, req, res, session);
				break;
			case R_OTHERS_TRANS :
				procReqOthersTransaction(user, req, res, session);
				break;
			case R_CANCEL_DEBIT :
				procReqCancelDebit(user, req, res, session);
				break;
			case R_CANCEL_BLOQUEO :
				procReqCancelBloqueo(user, req, res, session);
				break;
				// Action
			case A_SPECIAL_INST :
				procActionEspInst(user, req, res, session);
				break;
			case A_MAINT_TO_BEAN :
				procActionMaintPageToBeans(req, res, session);
				break;
			case A_MAINT_TO_SCK :
				procActionMaintBeansToSck(user, req, res, session);
				break;
			case A_MAINT_DED :
				procActionMaintDed(req, res, session);
				break;
			case A_MAINT_COLL :
				procActionMaintColl(req, res, session);
				break;
			case A_MAINT_PMNT :
				procActionMaintPay(user, req, res, session);
				break;
			case A_MAINT_PMNT_PLUS :
				procActionMaintPayIrreg(user, req, res, session);
				break;
			case A_TITULARES :
				procActionTit(user, req, res, session);
				break;
			case A_EXCHANGE :
				procActionExchangeRate(user, req, res, session);
				break;
			case A_CODES :
				procActionSpecialCodes(user, req, res, session);
				break;
			case A_ADDCODES :
				procActionAdditionalCodes(user, req, res, session);
				break;						
			case A_PRINT_NEW :
				procActionPrintNew(user, req, res, session);
				break;
			case A_NEW_TRAN :
				procActionNewTran(user, req, res, session);
				break;
			case A_REFRESH_CYCLE :
				//procActionRefreshCycle(user, req, res, session);
				break;
			case A_CANCEL_DEBIT :
				procActionCancelDebit(user, req, res, session);
				break;
			case A_CANCEL_BLOQUEO :
				procActionCancelBloqueo(user, req, res, session);
				break;
				// END LN
				// BEGIN Entering
				// Request
			case R_ENTER_NEW :
				procReqEnterNew(user, req, res, session);
				break;
			case R_ENTER_MAINT :
				procReqEnterMaint(user, req, res, session);
				break;
				// Action 
			case A_ENTER_NEW :
				procActionEnterNew(user, req, res, session);
				break;
			case A_ENTER_MAINT :
				procActionEnterMaint(user, req, res, session);
				break;
			case A_ACCOUNT_TITLE :
				procActionAccountTitle(user, req, res, session);
				break;	
			case R_DATOS_CES :
				procReqDatosCes(user, req, res, session);
				break;
				// END Entering
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procReqDatosCes(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("MAINTENANCE");
		session.setAttribute("userPO", userPO);
		
		DataTransaction cesData = new DataTransaction();
		cesData.setAccNum(userPO.getAccNum());
		cesData.setRefNum(userPO.getHeader2());
		session.setAttribute("cesData", cesData);
		
		res.sendRedirect(srctx + "/servlet/datapro.eibs.client.JSESD4020?SCREEN=1");
	}

	private void procActionAccountTitle(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0000", req);
			ESD000004Message msgMailAddress = (ESD000004Message) mp.getMessageRecord("ESD000004");
			// msgMailAddress = (ESD000004Message)ses.getAttribute("mailA");
			msgMailAddress.setH04USR(user.getH01USR());
			msgMailAddress.setH04PGM("ESD0080");
			msgMailAddress.setH04TIM(getTimeStamp());
			msgMailAddress.setH04SCR("01");
			msgMailAddress.setH04OPE("0005");
			msgMailAddress.setE04CUN(userPO.getAccNum());
			msgMailAddress.setE04RTP("1");
			msgMailAddress.setH04WK1("T");
			msgMailAddress.setH04WK3("2");
			
			setMessageRecord(req, msgMailAddress);

			mp.sendMessage(msgMailAddress);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgMailAddress = (ESD000004Message) mp.receiveMessageRecord("ESD000004");

			session.setAttribute("error", msgError);
			session.setAttribute("mailA", msgMailAddress);

			if (mp.hasError(msgError)) {
				forward("EDL0150_ln_account_title.jsp", req, res);
			} else {
				forward("EDL0150_ln_basic.jsp", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}
	}

	protected void procActionEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0150", req);
			EDL015001Message msgLN = (EDL015001Message) mp.getMessageRecord("EDL015001");
			msgLN.setH01USERID(user.getH01USR());
			msgLN.setH01PROGRM("EDL0150");
			msgLN.setH01TIMSYS(getTimeStamp());
			msgLN.setH01SCRCOD("01");
			msgLN.setH01OPECOD("0002");
			msgLN.setE01DEAACD("10");
			try {
				msgLN.setE01DEAACC(req.getParameter("E01DEAACC").trim());
			} catch (Exception e) {
			}
			try {
				msgLN.setH01FLGWK2(req.getParameter("H01FLGWK2").trim());
			} catch (Exception e) {
			}

			mp.sendMessage(msgLN);

			if (procRecMaintData(mp, user, req, res, session)) {
				forward("EDL0150_ln_basic.jsp", req, res);
			} else {
				forward("EDL0150_ln_enter_maint.jsp", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionEnterNew(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0150", req);
			EDL015001Message msgLN = (EDL015001Message) mp.getMessageRecord("EDL015001");
			msgLN.setH01USERID(user.getH01USR());
			msgLN.setH01PROGRM("EDL0150");
			msgLN.setH01TIMSYS(getTimeStamp());
			msgLN.setH01SCRCOD("01");
			msgLN.setH01OPECOD("0001");
			msgLN.setE01DEAACD("10");
			
			setMessageRecord(req, msgLN);

			mp.sendMessage(msgLN);

			if (procRecMaintData(mp, user, req, res, session)) {
				if (session.getAttribute("currClient")!= null && session.getAttribute("lnBasic") != null ) {
					ESD080001Message currClient = (ESD080001Message) session.getAttribute("currClient");
					EDL015001Message lnBasic = (EDL015001Message) session.getAttribute("lnBasic");
					lnBasic.setE01DEACUN(currClient.getE01CUSCUN());
					lnBasic.setE01CUSNA1(currClient.getE01CUSNA1());
					session.setAttribute("lnBasic", lnBasic);
				}
				forward("EDL0150_ln_basic.jsp", req, res);
			} else {
				String firstLink =
					webAppPath
						+ getLangPath(user)
						+ "ESD0711_products_detail.jsp?appcode="
						+ req.getParameter("appcode").trim()
						+ "&typecode="
						+ req.getParameter("typecode").trim()
						+ "&generic="
						+ req.getParameter("generic").trim()
						+ "&title="
						+ req.getParameter("title").trim()
						+ "&bank="
						+ req.getParameter("bank").trim();
				res.setContentType("text/html");
				PrintWriter out = res.getWriter();
				printProdFrame(out, firstLink, getLangPath(user));
			}

		} finally {
			if (mp != null) mp.close();
		}
	}

	protected void procReqEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("LN");
		userPO.setPurpose("MAINTENANCE");
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		
		forward("EDL0150_ln_enter_maint.jsp", req, res);
	}

	private void procReqEnterNew(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("LN");
		userPO.setPurpose("NEW");
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		
		forward("EDL0150_ln_enter_new.jsp", req, res);
	}

	private void procActionCancelDebit(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0150", req);
			EDL015210Message msgLN = (EDL015210Message) session.getAttribute("lnAutoDebit");
			msgLN.setH10USERID(user.getH01USR());
			msgLN.setH10PROGRM("EDL0152");
			msgLN.setH10TIMSYS(getTimeStamp());
			msgLN.setH10SCRCOD("01");
			msgLN.setH10OPECOD("0005");
			
			setMessageRecord(req, msgLN);

			mp.sendMessage(msgLN);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgLN = (EDL015210Message) mp.receiveMessageRecord("EDL015210");

			session.setAttribute("error", msgError);
			session.setAttribute("lnAutoDebit", msgLN);

			if (mp.hasError(msgError)) {
				forward("EDL0150_ln_cancel_auto_debit.jsp", req, res);
			} else {
				if ("NEW".equals(userPO.getPurpose())) {
					forward("EDL0150_ln_new_transac.jsp", req, res);
				} else {
					forward("EPV0150_loans_basic_information.jsp", req, res);
				}	
			}

		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionCancelBloqueo(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0150", req);
			EDL015210Message msgLN = (EDL015210Message) session.getAttribute("lnAutoDebit");
			msgLN.setH10USERID(user.getH01USR());
			msgLN.setH10PROGRM("EDL0152");
			msgLN.setH10TIMSYS(getTimeStamp());
			msgLN.setH10SCRCOD("01");
			msgLN.setH10OPECOD("0055");
			
			setMessageRecord(req, msgLN);

			mp.sendMessage(msgLN);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgLN = (EDL015210Message) mp.receiveMessageRecord("EDL015210");

			session.setAttribute("error", msgError);
			session.setAttribute("lnAutoDebit", msgLN);

			if (mp.hasError(msgError)) {
				forward("EDL0150_ln_cancel_bloqueo_pago.jsp", req, res);
			} else {
				if ("NEW".equals(userPO.getPurpose())) {
					forward("EDL0150_ln_new_transac.jsp", req, res);
				} else {
					forward("EPV0150_loans_basic_information.jsp", req, res);
				}	
			}

		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionNewTran(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0150", req);
			EDL015230Message msgGenInf = (EDL015230Message) session.getAttribute("lnGenTran");
			msgGenInf.setH30USERID(user.getH01USR());
			msgGenInf.setH30PROGRM("EDL0150");
			msgGenInf.setH30TIMSYS(getTimeStamp());
			msgGenInf.setH30SCRCOD("01");
			msgGenInf.setH30OPECOD("0005");
			
			setMessageRecord(req, msgGenInf);

			mp.sendMessage(msgGenInf);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgGenInf = (EDL015230Message) mp.receiveMessageRecord("EDL015230");

			session.setAttribute("error", msgError);
			session.setAttribute("lnGenTran", msgGenInf);

			if (mp.hasError(msgError)) {
				forward("EDL0150_ln_new_transac.jsp", req, res);
			} else {
				userPO.setHeader2(msgGenInf.getE30DEACUN());
				userPO.setCusName(msgGenInf.getE30DEACUN());
				userPO.setHeader3(msgGenInf.getE30CUSNA1());
				userPO.setCusName(msgGenInf.getE30CUSNA1());
				userPO.setIdentifier(msgGenInf.getE30DEAACC());
				userPO.setAccNum(msgGenInf.getE30DEAACC());
				userPO.setHeader1(msgGenInf.getE30DEAPRO());
				userPO.setProdCode(msgGenInf.getE30DEAPRO());
				userPO.setCurrency(msgGenInf.getE30DEACCY());
				userPO.setHeader5(msgGenInf.getE30TRNPRI());
				userPO.setHeader6(msgGenInf.getE30DEATRM());
				userPO.setHeader7(msgGenInf.getE30DEATRC());
				userPO.setBank(msgGenInf.getE30DEABNK());
				userPO.setBranch(msgGenInf.getE30DEABRN());
				
				String recalc = msgGenInf.getH30FLGWK2() == null ? " " : msgGenInf.getH30FLGWK2().trim();

				if (recalc.trim().equals("X")) {
					session.setAttribute("userPO", userPO);
					forward("EDL0150_ln_new_transac.jsp", req, res);
				} else if (userPO.getPurpose().equals("NEW")) {
					userPO.setPurpose("MAINTENANCE");
					session.setAttribute("userPO", userPO);
					forward("EDL0150_ln_confirm.jsp", req, res);
				} else if (userPO.getPurpose().equals("MAINTENANCE")) {
					session.setAttribute("userPO", userPO);
					forward("EDL0150_ln_enter_maint.jsp", req, res);
				}
			}

		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionPrintNew(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0150", req);
			EDL015001Message msgLN = (EDL015001Message) mp.getMessageRecord("EDL015001");
			msgLN.setH01USERID(user.getH01USR());
			msgLN.setH01PROGRM("EDL0130");
			msgLN.setH01TIMSYS(""); //getTimeStamp()
			msgLN.setH01SCRCOD("01");
			msgLN.setH01OPECOD("0002");
			msgLN.setE01DEAACD("10");
			try {
				msgLN.setE01DEAACC(userPO.getAccNum().trim());
			} catch (Exception e) {
				msgLN.setE01DEAACC("0");
			}

			mp.sendMessage(msgLN);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgLN = (EDL015001Message) mp.receiveMessageRecord("EDL015001");

			session.setAttribute("error", msgError);
			session.setAttribute("lnBasic", msgLN);

			if (mp.hasError(msgError)) {
				forward("EDL0150_ln_enter_maint.jsp", req, res);
			} else {
				userPO.setHeader2(msgLN.getE01DEACUN());
				userPO.setCusName(msgLN.getE01DEACUN());
				userPO.setHeader3(msgLN.getE01CUSNA1());
				userPO.setCusName(msgLN.getE01CUSNA1());
				userPO.setIdentifier(msgLN.getE01DEAACC());
				userPO.setAccNum(msgLN.getE01DEAACC());
				userPO.setHeader1(msgLN.getE01DEAPRO());
				userPO.setProdCode(msgLN.getE01DEAPRO());
				userPO.setCurrency(msgLN.getE01DEACCY());
				userPO.setApplicationCode(msgLN.getE01DEAACD());
				session.setAttribute("userPO", userPO);
				
				forward("EDL0150_ln_basic.jsp", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionAdditionalCodes(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0000", req);
			ESD001401Message msgLN = (ESD001401Message) session.getAttribute("lnCodes");
			msgLN.setH14USR(user.getH01USR());
			msgLN.setH14PGM("ESD0014");
			msgLN.setH14TIM(getTimeStamp());
			msgLN.setH14SCR("01");
			msgLN.setH14OPE("0005");
			
			setMessageRecord(req, msgLN);

			mp.sendMessage(msgLN);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgLN = (ESD001401Message) mp.receiveMessageRecord("ESD001401");

			session.setAttribute("error", msgError);
			session.setAttribute("lnCodes", msgLN);

			if (mp.hasError(msgError)) {
				forward("EDL0150_ln_addcodes.jsp", req, res);
			} else {
				if ("NEW".equals(userPO.getPurpose())) {
					forward("EDL0150_ln_new_transac.jsp", req, res);
				} else {
					forward("EDL0150_ln_basic.jsp", req, res);
				}	
			}

		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionSpecialCodes(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0150", req);
			ESD000002Message msgLN = (ESD000002Message) session.getAttribute("lnCodes");
			msgLN.setH02USR(user.getH01USR());
			msgLN.setH02PGM("EDL0130");
			msgLN.setH02TIM(getTimeStamp());
			msgLN.setH02SCR("01");
			msgLN.setH02OPE("0005");
			msgLN.setH02WK1("M");
			setMessageRecord(req, msgLN);

			mp.sendMessage(msgLN);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgLN = (ESD000002Message) mp.receiveMessageRecord("ESD000002");

			session.setAttribute("error", msgError);
			session.setAttribute("lnCodes", msgLN);

			if (mp.hasError(msgError)) {
				forward("EDL0150_ln_codes.jsp", req, res);
			} else {
				if ("NEW".equals(userPO.getPurpose())) {
					forward("EDL0150_ln_new_transac.jsp", req, res);
				} else {
					forward("EPV0150_loans_basic_information.jsp", req, res);
				}	
			}

		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionExchangeRate(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0150", req);
			EDL015206Message msgLN = (EDL015206Message) session.getAttribute("lnRate");
			msgLN.setH06USERID(user.getH01USR());
			msgLN.setH06PROGRM("EDL0150");
			msgLN.setH06TIMSYS(getTimeStamp());
			msgLN.setH06SCRCOD("01");
			msgLN.setH06OPECOD("0005");
			
			setMessageRecord(req, msgLN);

			mp.sendMessage(msgLN);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgLN = (EDL015206Message) mp.receiveMessageRecord("EDL015206");

			session.setAttribute("error", msgError);
			session.setAttribute("lnRate", msgLN);

			if (mp.hasError(msgError)) {
				forward("EDL0150_ln_xchg_rate.jsp", req, res);
			} else {
				if ("NEW".equals(userPO.getPurpose())) {
					forward("EDL0150_ln_new_transac.jsp", req, res);
				} else {
					forward("EDL0150_ln_basic.jsp", req, res);
				}	
			}

		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionTit(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0150", req);
			ESD000006Message msgLN = (ESD000006Message) mp.getMessageRecord("ESD000006");
			msgLN.setH06USR(user.getH01USR());
			msgLN.setH06PGM("EDL0150");
			msgLN.setH06TIM(""); //getTimeStamp()
			msgLN.setH06SCR("01");
			msgLN.setH06OPE("0005");
			msgLN.setE06ACC(userPO.getAccNum());
			msgLN.setE06RTP("H");
			
			setMessageRecord(req, msgLN);

			mp.sendMessage(msgLN);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgLN = (ESD000006Message) mp.receiveMessageRecord("ESD000006");

			session.setAttribute("error", msgError);
			session.setAttribute("lnTit", msgLN);

			if (mp.hasError(msgError)) {
				forward("EDL0150_ln_tit.jsp", req, res);
			} else {
				if ("NEW".equals(userPO.getPurpose())) {
					forward("EDL0150_ln_new_transac.jsp", req, res);
				} else {
					forward("EDL0150_ln_basic.jsp", req, res);
				}	
			}

		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionMaintPayIrreg(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		int colNum = 2;
		JBListRec pmntPList = new JBListRec();
		pmntPList.init(colNum);
		String myRow[] = new String[colNum];
		for (int i = 0; i < colNum; i++) {
			myRow[i] = "";
		}
		for (int row = 1; row < 31; row++) {
			try {
				String sel = req.getParameter("DLPPNU_" + row).toUpperCase();
				if ("".equals(sel)) break;
			} catch (Exception e) {
				break;
			}
			myRow[0] = req.getParameter("DLPPNU_" + row);
			myRow[1] = req.getParameter("DLPPRI_" + row);

			pmntPList.addRow("", myRow);
		}
		session.setAttribute("pmntPlus", pmntPList);
		
		int opt = (int) Util.parseFloat(req.getParameter("opt"));
		switch (opt) {
			case 2 :
				pmntPList.setLastRow();
				int pymNumLast = 1;
				if (!pmntPList.getNoResult()) {
					pymNumLast = (int) Util.parseFloat(pmntPList.getRecord(0)) + 1;
				}
				int number = (int) Util.parseFloat(req.getParameter("NUMBER"));

				for (int row = 0; row < number; row++) {
					// Payment Number
					myRow[0] = pymNumLast + row + "";
					// Amount
					myRow[1] = req.getParameter("AMOUNT");

					pmntPList.addRow("", myRow);
				}
				session.setAttribute("pmntPlus", pmntPList);
				forward("EDL0150_ln_pay_pln_irreg.jsp", req, res);
				break;
			case 3 :
				String row = req.getParameter("ROW") == null ? "" : "?ROW=" + req.getParameter("ROW").trim();
				forward("EDL0150_ln_pay_pln_irreg.jsp" + row, req, res);
				break;
			default : 
				forward(res);	
				break;
		}
	}

	private void procActionMaintPay(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		int totalRows = (int) Util.parseFloat(req.getParameter("ROW"));
		int colNum = 7;
		
		JBListRec pmntList = new JBListRec();
		pmntList.init(colNum);
		String myRow[] = new String[colNum];
		for (int i = 0; i < colNum; i++) {
			myRow[i] = "";
		}
		
		for (int row = 1; row <= totalRows; row++) {
			try {
				String sel = req.getParameter("DLPPNU_" + row).toUpperCase();
				if ("".equals(sel)) break;
			} catch (Exception e) {
				break;
			}
			myRow[0] = req.getParameter("DLPPNU_" + row);
			myRow[1] = req.getParameter("DLPPD1_" + row);
			myRow[2] = req.getParameter("DLPPD2_" + row);
			myRow[3] = req.getParameter("DLPPD3_" + row);
			myRow[4] = Util.formatCCY(req.getParameter("DLPPRI_" + row));
			myRow[5] = Util.formatCCY(req.getParameter("DLPINT_" + row));
			myRow[6] = Util.formatCCY(req.getParameter("DLPIIP_" + row));

			pmntList.addRow("", myRow);
		}
		session.setAttribute("pmnt", pmntList);
		
		int opt = (int) Util.parseFloat(req.getParameter("opt"));
		switch (opt) {
			case 2 :
				pmntList.setLastRow();
				int pymNumLast = 1;
				if (!pmntList.getNoResult()) {
					pymNumLast = (int) Util.parseFloat(pmntList.getRecord(0)) + 1;
				}
				int number = (int) Util.parseFloat(req.getParameter("NUMBER"));
				int month = (int) Util.parseFloat(req.getParameter("DATE1"));
				int day = (int) Util.parseFloat(req.getParameter("DATE2"));
				int year = 2000 + (int) Util.parseFloat(req.getParameter("DATE3"));
				int feq = (int) Util.parseFloat(req.getParameter("FREQUENCY"));
				char code;
				try {
					code = req.getParameter("CODE").toCharArray()[0];
				} catch (Exception e) {
					code = ' ';
				}
				Calendar myDate = Calendar.getInstance();
				myDate.set(year, month - 1, day);
				for (int row = 0; row < number; row++) {
					// Payment Number
					myRow[0] = pymNumLast + row + "";
					if (row > 0) {
						switch (code) {
							case 'D' :
								myDate.add(Calendar.DATE, feq);
								break;
							case 'M' :
								myDate.add(Calendar.MONTH, feq);
								break;
							case 'Y' :
								myDate.add(Calendar.YEAR, feq);
								break;
						}
					}
					if (user.getE01DTF().equals("MDY")) {
						myRow[1] = (myDate.get(Calendar.MONTH) + 1) + "";
						myRow[2] = myDate.get(Calendar.DAY_OF_MONTH) + "";
						String y = myDate.get(Calendar.YEAR) + "";
						myRow[3] = y.length() > 2 ? y.substring(2) : y;
					} else if (user.getE01DTF().equals("DMY")) {
						myRow[1] = myDate.get(Calendar.DAY_OF_MONTH) + "";
						myRow[2] = (myDate.get(Calendar.MONTH) + 1) + "";
						String y = myDate.get(Calendar.YEAR) + "";
						myRow[3] = y.length() > 2 ? y.substring(2) : y;
					} else {
						String y = myDate.get(Calendar.YEAR) + "";
						myRow[1] = y.length() > 2 ? y.substring(2) : y;
						myRow[2] = (myDate.get(Calendar.MONTH) + 1) + "";
						myRow[3] = myDate.get(Calendar.DAY_OF_MONTH) + "";
					}
					// Amount
					myRow[4] = Util.formatCCY(req.getParameter("AMOUNT"));
					// Interest
					myRow[5] = "";
					// Include Interest in Payments
					myRow[6] = Util.formatCCY(req.getParameter("INTEREST"));

					pmntList.addRow("", myRow);
				}
				session.setAttribute("pmnt", pmntList);
				forward("EDL0150_ln_pay_pln_det.jsp", req, res);
				break;
			case 3 :
				String row = req.getParameter("ROW") == null ? "" : "?ROW=" + req.getParameter("ROW").trim();
				forward("EDL0150_ln_pay_pln_det.jsp" + row, req, res);
				break;
			default : 
				forward(res);	
				break;
		}
	}

	private void procActionMaintColl(HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException {
		
		int colNum = 5;
		JBListRec collList = new JBListRec();
		collList.init(colNum);
		String myRow[] = new String[colNum];
		for (int i = 0; i < colNum; i++) {
			myRow[i] = "";
		}
		
		for (int row = 0; row < 10; row++) {
			try {
				String sel = req.getParameter("RCLACB_" + row).toUpperCase();
				if ("".equals(sel)) break;
			} catch (Exception e) {
				break;
			}
			try {
				myRow[0] = req.getParameter("RCLACB_" + row).toUpperCase();
			} catch (Exception e) {
			}
			try {
				myRow[1] = req.getParameter("RCLTYB_" + row).toUpperCase();
			} catch (Exception e) {
			}
			try {
				myRow[2] = req.getParameter("RCLCCY_" + row).toUpperCase();
			} catch (Exception e) {
			}
			try {
				myRow[3] = req.getParameter("RCLAMT_" + row).toUpperCase();
			} catch (Exception e) {
			}
			try {
				myRow[4] = req.getParameter("RCLF04_" + row).toUpperCase();
			} catch (Exception e) {
			}
			collList.addRow("", myRow);
		}
		session.setAttribute("coll", collList);

		forward(res);	
	}

	private void procActionMaintDed(HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException {
		
		JBListRec dedList = (JBListRec) session.getAttribute("ded");
		if (dedList != null) {
			dedList.initRow();
			while (dedList.getNextRow()) {
				String sel = " ";
				try {
					sel = req.getParameter("DLISEL_" + dedList.getCurrentRow()).trim();
					sel = "".equals(sel) ? " " : sel;
				} catch (Exception e) {
					sel = " ";
				}
				dedList.setRecord(sel, 23, dedList.getCurrentRow());
				dedList.setRecord(req.getParameter("DLICDE_" + dedList.getCurrentRow()), 4, dedList.getCurrentRow());
				dedList.setRecord(req.getParameter("DLINME_" + dedList.getCurrentRow()).toUpperCase(), 10, dedList.getCurrentRow());
				dedList.setRecord(req.getParameter("DLIPLZ_" + dedList.getCurrentRow()).toUpperCase(), 16, dedList.getCurrentRow());
				dedList.setRecord(req.getParameter("DLIDPM_" + dedList.getCurrentRow()), 5, dedList.getCurrentRow());
				dedList.setRecord(req.getParameter("DLIFAC_" + dedList.getCurrentRow()), 6, dedList.getCurrentRow());
			}
			session.setAttribute("ded", dedList);
		}
		forward(res);	
	}
	
	private void forward(HttpServletResponse res) throws IOException {
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		out.println("<HTML>");
		out.println("<HEAD>");
		out.println("<TITLE>Close</TITLE>");
		out.println("</HEAD>");
		out.println("<BODY>");
		out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
		out.println("		top.opener.document.forms[0].SCREEN.value = 500");
		out.println("		top.opener.document.forms[0].submit();");
		out.println("		top.close();");
		out.println("</SCRIPT>");
		out.println("<P>Close it!!!</P>");
		out.println("</BODY>");
		out.println("</HTML>");
		out.close();
	}

	private void procActionMaintBeansToSck(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0150", req);
			EDL015001Message msgLN = (EDL015001Message) session.getAttribute("lnBasic");
			msgLN.setH01USERID(user.getH01USR());
			msgLN.setH01PROGRM("EDL0150");
			msgLN.setH01TIMSYS(getTimeStamp());
			msgLN.setH01SCRCOD("01");
			msgLN.setH01OPECOD("0005");
			
			setMessageRecord(req, msgLN);
			
			mp.sendMessage(msgLN);
		
			String subname = "";
			JBListRec dedList = null;
			for (int i=1; i<6; i++) {
				if (i == 1) {
					dedList = (JBListRec) session.getAttribute("tax");
					subname = "T";
				} else if (i == 2) {
					dedList = (JBListRec) session.getAttribute("com");
					subname = "C";
				} else if (i == 3) {
					dedList = (JBListRec) session.getAttribute("ins");
					subname = "I";
				} else if (i == 4) {
					dedList = (JBListRec) session.getAttribute("iva");
					subname = "V";
				} else
					dedList = (JBListRec) session.getAttribute("ded");
				
				if (dedList != null) {
					dedList.initRow();
					while (dedList.getNextRow()) {
						EDL015002Message msgDed = (EDL015002Message) mp.getMessageRecord("EDL015002");
						msgDed.setH02USERID(user.getH01USR());
					 	msgDed.setH02PROGRM("EDL0150");
					 	msgDed.setH02TIMSYS(getTimeStamp());
					 	msgDed.setH02SCRCOD("01");
					 	msgDed.setH02OPECOD("0005");
									 
						try {
							msgDed.setE02DEDAMT(dedList.getRecord(2).trim());
						} catch (Exception e) {
						}
						try {
							msgDed.setE02DLIPBC(dedList.getRecord(21).trim());
						} catch (Exception e) {
						}
						try {
							msgDed.setE02BSEAMT(dedList.getRecord(0).trim());
						} catch (Exception e) {
						}
						try {
							msgDed.setE02DLIAPC(dedList.getRecord(0).trim());
						} catch (Exception e) {
						}
						try {
							msgDed.setE02DLIPBC(req.getParameter("E02DLIPBC").trim());
						} catch (Exception e) {
						}
						try {
							msgDed.setE02DLIDAC(req.getParameter("E02DLIDAC").trim());
						} catch (Exception e) {
						}
						if (i < 5) {
							try {
								msgDed.setE02DEDAMT(req.getParameter("E02DEDAMT"
										+ subname + dedList.getCurrentRow()).trim());

							} catch (Exception e) {
							}
							if (i == 3) {
								try {
									msgDed.setE02DLIPBC(req
											.getParameter("E02DLIPBC" + subname
													+ dedList.getCurrentRow()).trim());
								} catch (Exception e) {
								}
								if (dedList.getRecord(22).equals("3")) {
									try {
										msgDed.setE02BSEAMT(req
												.getParameter("E02BSEAMT" + subname
														+ dedList.getCurrentRow()).trim());
									} catch (Exception e) {
									}
								}
							}
						}
						try {
							msgDed.setE02DEAACC(dedList.getRecord(1).trim());
						} catch (Exception e) {
						} //			 
						try {
							msgDed.setE02DLIAPC(dedList.getRecord(3).trim());
						} catch (Exception e) {
						} // 
						try {
							msgDed.setE02DLICDE(dedList.getRecord(4).trim());
						} catch (Exception e) {
						} // 
						try {
							msgDed.setE02DLIDPM(dedList.getRecord(5).trim());
						} catch (Exception e) {
						} // 
						try {
							msgDed.setE02DLIFAC(dedList.getRecord(6).trim());
						} catch (Exception e) {
						} // 
						try {
							msgDed.setE02DLIIVA(dedList.getRecord(7).trim());
						} catch (Exception e) {
						} // 
						try {
							msgDed.setE02DLIIVB(dedList.getRecord(8).trim());
						} catch (Exception e) {
						} // 
						try {
							if (i == 2) {
								msgDed.setE02DLIIVP(req.getParameter("E02DLIIVP"
										+ subname + dedList.getCurrentRow()).trim());
							} else {
								msgDed.setE02DLIIVP(dedList.getRecord(9).trim());
							}
						} catch (Exception e) {
						} // 
						try {
							msgDed.setE02DLINME(dedList.getRecord(10).trim());
						} catch (Exception e) {
						} // CHARGE NAME
						try {
							msgDed.setE02DLIOAC(dedList.getRecord(11).trim());
						} catch (Exception e) {
						} // 
						try {
							msgDed.setE02DLIOBK(dedList.getRecord(12).trim());
						} catch (Exception e) {
						} // 
						try {
							msgDed.setE02DLIOBR(dedList.getRecord(13).trim());
						} catch (Exception e) {
						} // 
						try {
							msgDed.setE02DLIOCY(dedList.getRecord(14).trim());
						} catch (Exception e) {
						} // 
						try {
							msgDed.setE02DLIOGL(dedList.getRecord(15).trim());
						} catch (Exception e) {
						} // 
						try {
							msgDed.setE02DLIPLZ(dedList.getRecord(16).trim());
						} catch (Exception e) {
						} // 
						try {
							msgDed.setE02DLIPRO(dedList.getRecord(17).trim());
						} catch (Exception e) {
						} // 
						try {
							msgDed.setE02FACTOR(dedList.getRecord(18).trim());
						} catch (Exception e) {
						} // 
						try {
							msgDed.setE02MAXAMT(dedList.getRecord(19).trim());
						} catch (Exception e) {
						} // 
						try {
							msgDed.setE02MINAMT(dedList.getRecord(20).trim());
						} catch (Exception e) {
						} //
						try {
							msgDed.setE02DLISEG(dedList.getRecord(22).trim());
						} catch (Exception e) {
						} // 
						try {
							msgDed.setE02DLISEL(dedList.getRecord(23).trim());
						} catch (Exception e) {
						} //
						try {
							msgDed.setE02DLIAPC(dedList.getRecord(24).trim());
						} catch (Exception e) {
						} //
						try {
							msgDed.setE02DLINPM(dedList.getRecord(26).trim());
						} catch (Exception e) {
						}
						try {
							msgDed.setE02DLINPD(dedList.getRecord(27).trim());
						} catch (Exception e) {
						}
						try {
							msgDed.setE02DLINPY(dedList.getRecord(28).trim());
						} catch (Exception e) {
						}
						
						mp.sendMessage(msgDed);
					}
				}
			}
			EDL015002Message msgDed = (EDL015002Message) mp.getMessageRecord("EDL015002");
			msgDed.setH02USERID(user.getH01USR());
		 	msgDed.setH02PROGRM("EDL0150");
		 	msgDed.setH02TIMSYS(getTimeStamp());
		 	msgDed.setH02SCRCOD("01");
		 	msgDed.setH02OPECOD("0005");
			msgDed.setH02FLGMAS("*");
			
			mp.sendMessage(msgDed);
			
			JBListRec pmntList = (JBListRec) session.getAttribute("pmnt");
			if (pmntList != null) {
				pmntList.initRow();
				while (pmntList.getNextRow()) {
					EDL015003Message msgPmnt = (EDL015003Message) mp.getMessageRecord("EDL015003");
					msgPmnt.setH03USERID(user.getH01USR());
					msgPmnt.setH03PROGRM("EDL0150");
					msgPmnt.setH03TIMSYS(getTimeStamp());
					msgPmnt.setH03SCRCOD("01");
					msgPmnt.setH03OPECOD("0005");
					try {
						msgPmnt.setE03DEAACC(userPO.getAccNum().trim());
					} catch (Exception e) {
					}
					try {
						msgPmnt.setE03DLPPNU(pmntList.getRecord(0).trim()); // Quota
					} catch (Exception e) {
					}
					try {
						msgPmnt.setE03DLPPDD(pmntList.getRecord(1).trim()); // Date
					} catch (Exception e) {
					}
					try {
						msgPmnt.setE03DLPPDM(pmntList.getRecord(2).trim()); // Date
					} catch (Exception e) {
					}
					try {
						msgPmnt.setE03DLPPDY(pmntList.getRecord(3).trim()); // Date
					} catch (Exception e) {
					}
					try {
						msgPmnt.setE03DLPPRI(pmntList.getRecord(4).trim()); // Principal
					} catch (Exception e) {
					}
					try {
						msgPmnt.setE03DLPINT(pmntList.getRecord(5).trim()); // Interest
					} catch (Exception e) {
					}
					try {
						msgPmnt.setE03DLPIIP(pmntList.getRecord(6).trim()); // Interest
					} catch (Exception e) {
					}

					mp.sendMessage(msgPmnt);
				}
				EDL015003Message msgPmnt = (EDL015003Message) mp.getMessageRecord("EDL015003");
				msgPmnt.setH03USERID(user.getH01USR());
				msgPmnt.setH03PROGRM("EDL0150");
				msgPmnt.setH03TIMSYS(getTimeStamp());
				msgPmnt.setH03SCRCOD("01");
				msgPmnt.setH03OPECOD("0005");
				msgPmnt.setH03FLGMAS("*");
				
				mp.sendMessage(msgPmnt);
			}

			JBListRec collList = (JBListRec) session.getAttribute("coll");
			if (collList != null) {
				collList.initRow();
				while (collList.getNextRow()) {
					EDL015004Message msgColl = (EDL015004Message) mp.getMessageRecord("EDL015004");
					msgColl.setH04USERID(user.getH01USR());
					msgColl.setH04PROGRM("EDL0150");
					msgColl.setH04TIMSYS(getTimeStamp());
					msgColl.setH04SCRCOD("01");
					msgColl.setH04OPECOD("0005");
					try {
						msgColl.setE04DEAACC(userPO.getAccNum().trim());
					} catch (Exception e) {
					}
					try {
						msgColl.setE04RCLACB(Util.formatBlank(collList.getRecord(0).toUpperCase()));
						//Code
					} catch (Exception e) {
					}
					try {
						msgColl.setE04RCLTYB(Util.formatBlank(collList.getRecord(1).toUpperCase()));
						//Name
					} catch (Exception e) {
					}
					try {
						msgColl.setE04RCLCCY(collList.getRecord(2).toUpperCase()); //Police
					} catch (Exception e) {
					}
					try {
						msgColl.setE04RCLAMT(collList.getRecord(3).trim()); //Deduction
					} catch (Exception e) {
					}
					try {
						msgColl.setE04RCLF04(collList.getRecord(4).trim()); //FOGAPE
					} catch (Exception e) {
					}
					mp.sendMessage(msgColl);
				}
				EDL015004Message msgColl = (EDL015004Message) mp.getMessageRecord("EDL015004");
				msgColl.setH04USERID(user.getH01USR());
				msgColl.setH04PROGRM("EDL0150");
				msgColl.setH04TIMSYS(getTimeStamp());
				msgColl.setH04SCRCOD("01");
				msgColl.setH04OPECOD("0005");
				msgColl.setH04FLGMAS("*");
				
				mp.sendMessage(msgColl);
			}
			
			JBListRec pmntPList = (JBListRec) session.getAttribute("pmntPlus");
			if (pmntPList != null) {
				pmntPList.initRow();
				while (pmntPList.getNextRow()) {
					EDL015005Message msgPmntP = (EDL015005Message) mp.getMessageRecord("EDL015005");
					msgPmntP.setH05USERID(user.getH01USR());
					msgPmntP.setH05PROGRM("EDL0150");
					msgPmntP.setH05TIMSYS(getTimeStamp());
					msgPmntP.setH05SCRCOD("01");
					msgPmntP.setH05OPECOD("0005");
					try {
						msgPmntP.setE05DEAACC(userPO.getAccNum().trim());
					} catch (Exception e) {
					}
					try {
						msgPmntP.setE05DLPPNU(pmntPList.getRecord(0).trim()); //Quota
					} catch (Exception e) {
					}
					try {
						msgPmntP.setE05DLPVEX(pmntPList.getRecord(1).trim()); //Principal
					} catch (Exception e) {
					}

					mp.sendMessage(msgPmntP);
				}
				EDL015005Message msgPmntP = (EDL015005Message) mp.getMessageRecord("EDL015005");
				msgPmntP.setH05USERID(user.getH01USR());
				msgPmntP.setH05PROGRM("EDL0150");
				msgPmntP.setH05TIMSYS(getTimeStamp());
				msgPmntP.setH05SCRCOD("01");
				msgPmntP.setH05OPECOD("0005");
				msgPmntP.setH05FLGMAS("*");
				
				mp.sendMessage(msgPmntP);
			}
			
			EDL015009Message msgEnd = (EDL015009Message) mp.getMessageRecord("EDL015009");
			msgEnd.setH09USERID(user.getH01USR());
			msgEnd.setH09PROGRM("EDL0150");
			msgEnd.setH09TIMSYS(getTimeStamp());
			msgEnd.setH09SCRCOD("01");
			msgEnd.setH09OPECOD("0005");
			try {
				msgEnd.setE09DEAACC(userPO.getAccNum().trim());
			} catch (Exception e) {
			}
			
			mp.sendMessage(msgEnd);
			
			if (procRecMaintData(mp, user, req, res, session)) {  // There are no errors	
				String recalc = req.getParameter("E01RCLFLC") == null ? " " : req.getParameter("E01RCLFLC");
				
				if (recalc.trim().equals("X")) {
					forward("EDL0150_ln_basic.jsp", req, res);	
				} else if(userPO.getPurpose().equals("MAINTENANCE") && !(userPO.getHeader10().equals("CONF"))) {												
					forward("EDL0150_ln_enter_maint.jsp", req, res);	
				} else if (userPO.getHeader10().equals("CONF")) {
					forward("EDL0150_ln_new_transac.jsp", req, res);	
				} else {
					forward("EDL0150_ln_basic.jsp", req, res);	
				}
			} else {  // There are errors
				forward("EDL0150_ln_basic.jsp", req, res);	
			}
		
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionMaintPageToBeans(HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		EDL015001Message msgLN = (EDL015001Message) session.getAttribute("lnBasic");
		msgLN.setH01TIMSYS(getTimeStamp());
		msgLN.setH01OPECOD("0005");
		
		setMessageRecord(req, msgLN);
		
		session.setAttribute("lnBasic", msgLN);
		forward("EDL0150_ln_basic.jsp", req, res);
	}

	private void procActionEspInst(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0150", req);
			ESD000005Message msgLN = (ESD000005Message) session.getAttribute("lnInst");
			msgLN.setH05USR(user.getH01USR());
			msgLN.setH05PGM("EDL0150");
			msgLN.setH05TIM(""); //getTimeStamp()
			msgLN.setH05SCR("01");
			msgLN.setH05OPE("0005");
			msgLN.setE05ACC(userPO.getAccNum());
			msgLN.setE05ACD("10");
			msgLN.setH05WK1("M");
			
			setMessageRecord(req, msgLN);

			mp.sendMessage(msgLN);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgLN = (ESD000005Message) mp.receiveMessageRecord("ESD000005");

			session.setAttribute("error", msgError);
			session.setAttribute("lnInst", msgLN);

			if (mp.hasError(msgError)) {
				forward("EDL0150_ln_special_inst.jsp", req, res);
			} else {
				if ("NEW".equals(userPO.getPurpose())) {
					forward("EDL0150_ln_new_transac.jsp", req, res);
				} else {
					forward("EPV0150_loans_basic_information.jsp", req, res);
				}	
			}

		} finally {
			if (mp != null) mp.close();
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
			msgLN.setH10OPECOD("0002");
			msgLN.setE10DEAACC(userPO.getAccNum());

			mp.sendMessage(msgLN);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgLN = (EDL015210Message) mp.receiveMessageRecord("EDL015210");

			session.setAttribute("error", msgError);
			session.setAttribute("lnAutoDebit", msgLN);

			if (mp.hasError(msgError)) {
				forward("EDL0150_ln_basic.jsp", req, res);
			} else {
				forward("EDL0150_ln_cancel_auto_debit.jsp", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}
	}
	
	protected void procReqCancelBloqueo(ESS0030DSMessage user,
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
			msgLN.setH10OPECOD("0022");
			msgLN.setH10FLGWK1(userPO.getPurpose().substring(0,1)); // M=MAINTENANCE A=APPROVAL_INQ
			msgLN.setE10DEAACC(userPO.getAccNum());
			
			String iFrame = req.getParameter("iFrame") == null ? "false" : req.getParameter("iFrame").toLowerCase().trim();
			
			mp.sendMessage(msgLN);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgLN = (EDL015210Message) mp.receiveMessageRecord("EDL015210");

			session.setAttribute("error", msgError);
			session.setAttribute("lnAutoDebit", msgLN);

			if (mp.hasError(msgError)) {
				forward("EPV0150_loans_basic_information.jsp", req, res);
			//	forward("EDL0150_ln_basic.jsp", req, res);
			} else {
				forward("EDL0150_ln_cancel_bloqueo_pago.jsp?iFrame=" + iFrame, req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}
	}

	protected void procReqOthersTransaction(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos userPO = getUserPos(req);
		
		String purpose = req.getParameter("PURPOSE") == null ? "" : "&PURPOSE=" + req.getParameter("PURPOSE").trim();
		
		DataTransaction transData = new DataTransaction();
		transData.setWrkFile("4");
		transData.setAccNum(userPO.getAccNum());
        transData.setProdtype(userPO.getType());
		session.setAttribute("transData", transData);
		
		res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSEGL0035?SCREEN=1" + purpose);
	}

	private void procReqIntPrep(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0150", req);
			EDL015009Message msgLN = (EDL015009Message) mp.getMessageRecord("EDL015009");
			msgLN.setH09USERID(user.getH01USR());
			msgLN.setH09PROGRM("EDL0150");
			msgLN.setH09TIMSYS(""); //getTimeStamp()
			msgLN.setH09SCRCOD("01");
			msgLN.setH09OPECOD("0002");
			msgLN.setE09DEAACC(userPO.getAccNum());

			mp.sendMessage(msgLN);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgLN = (EDL015009Message) mp.receiveMessageRecord("EDL015009");

			session.setAttribute("error", msgError);
			session.setAttribute("lnIntPrep", msgLN);

			if (mp.hasError(msgError)) {
				forward("EDL0130_cd_finish.jsp", req, res);
			} else {
				forward("EDL0130_cd_prep_int.jsp", req, res);
			}

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
			mp = getMessageProcessor("ESD0000", req);
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
				if ("NEW".equals(userPO.getPurpose())) {
					forward("EDL0150_ln_new_transac.jsp", req, res);
				} else {
					forward("EDL0150_ln_basic.jsp", req, res);
				}	
			} else {
				forward("EDL0150_ln_addcodes.jsp", req, res);
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
			msgLN.setH02PGM("EDL0150");
			msgLN.setH02TIM(""); //getTimeStamp()
			msgLN.setH02SCR("01");
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
				if ("NEW".equals(userPO.getPurpose())) {
					forward("EDL0150_ln_new_transac.jsp", req, res);
				} else {
					forward("EPV0150_loans_basic_information.jsp", req, res);
				}	
			} else {
				forward("EDL0150_ln_codes.jsp", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}
	}

	protected void procReqAccountTitle(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "NEW".equals(userPO.getPurpose()) ? "0001" : "0002";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0000", req);
			ESD000004Message msgMailA = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgMailA.setH04USR(user.getH01USR());
			msgMailA.setH04PGM("ESD0080");
			msgMailA.setH04TIM(getTimeStamp());
			msgMailA.setH04SCR("01");
			msgMailA.setH04OPE(opCode);
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
				forward("EDL0150_ln_basic.jsp", req, res);
			} else {
				forward("EDL0150_ln_account_title.jsp", req, res);
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
			msgLN.setH06OPECOD("0002");
			msgLN.setE06DEAACC(userPO.getAccNum());

			mp.sendMessage(msgLN);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgLN = (EDL015206Message) mp.receiveMessageRecord("EDL015206");

			session.setAttribute("error", msgError);
			session.setAttribute("lnRate", msgLN);

			if (mp.hasError(msgError)) {
				forward("EDL0150_ln_basic.jsp", req, res);
			} else {
				forward("EDL0150_ln_xchg_rate.jsp", req, res);
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
			msgLN.setH06OPE("0002");
			msgLN.setE06ACC(userPO.getAccNum());
			msgLN.setE06RTP("H");

			mp.sendMessage(msgLN);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgLN = (ESD000006Message) mp.receiveMessageRecord("ESD000006");

			session.setAttribute("error", msgError);
			session.setAttribute("lnTit", msgLN);

			if (mp.hasError(msgError)) {
				if ("NEW".equals(userPO.getPurpose())) {
					forward("EDL0150_ln_new_transac.jsp", req, res);
				} else {
					forward("EDL0150_ln_basic.jsp", req, res);
				}
			} else {
				forward("EDL0150_ln_tit.jsp", req, res);
			}

		} finally {
			if (mp != null) mp.close();
		}
	}

	protected void procReqEspInst(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		MessageRecord mr = null;
		ELEERRMessage msgError = null;
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
			mr = mp.receiveMessageRecord();
			
			if(mr instanceof ELEERRMessage){
				msgError = (ELEERRMessage) mr;
			} else {
				msgLN = (ESD000005Message) mr;
			}			
			
			session.setAttribute("error", msgError);
			session.setAttribute("lnInst", msgLN);
			
			if (mp.hasError(msgError)) {
				if ("NEW".equals(userPO.getPurpose())) {
					forward("EDL0150_ln_new_transac.jsp", req, res);
				} else {
					forward("EPV0150_loans_basic_information.jsp", req, res);
				}
			} else {
				forward("EDL0150_ln_special_inst.jsp", req, res);
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
			msgLN.setH01OPECOD("0002");
			msgLN.setE01DEAACD("10");
			msgLN.setH01FLGWK1("A");
			try {
				msgLN.setE01DEAACC(userPO.getAccNum());
			} catch (Exception e) {
				msgLN.setE01DEAACC("0");
			}
			
			mp.sendMessage(msgLN);
			
			if (procRecMaintData(mp, user, req, res, session)) { // There are no errors
				forward("EDL0150_ln_basic.jsp", req, res);
			} else {
				forward("EDL0150_ln_enter_maint.jsp", req, res);
			}
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	protected boolean procRecMaintData(MessageProcessor mp,
			ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos userPO = getUserPos(req);
		
		int colNum = 29;
		
		JBListRec dedList = new JBListRec();
		dedList.init(colNum);
		JBListRec taxList = new JBListRec();
		taxList.init(colNum);
		JBListRec ivaList = new JBListRec();
		ivaList.init(colNum);
		JBListRec comList = new JBListRec();
		comList.init(colNum);
		JBListRec insList = new JBListRec();
		insList.init(colNum);
		JBListRec pmntList = new JBListRec();
		pmntList.init(7);
		JBListRec collList = new JBListRec();
		collList.init(5);
		JBListRec pmntPList = new JBListRec();
		pmntPList.init(2);
		
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		session.setAttribute("lnBasic", new EDL015001Message());
		session.setAttribute("ded", dedList);
		session.setAttribute("pmnt", pmntList);
		session.setAttribute("pmntPlus", pmntPList);
		session.setAttribute("coll", collList);
		
		MessageRecord newmessage = mp.receiveMessageRecord();
		boolean hasError = mp.hasError(newmessage);
		
		session.setAttribute("error", newmessage);
		
		while (true) {  
			newmessage = mp.receiveMessageRecord();
			if (newmessage.getFormatName().equals("EDL015001")) {
				EDL015001Message msgLN = (EDL015001Message) newmessage;
				userPO.setIdentifier(msgLN.getE01DEAACC());
				userPO.setAccNum(msgLN.getE01DEAACC());
				userPO.setApplicationCode(msgLN.getE01DEAACD());  
				userPO.setHeader1(msgLN.getE01DEAPRO());
				userPO.setProdCode(msgLN.getE01DEAPRO());
				userPO.setHeader2(msgLN.getE01DEACUN());
				userPO.setCusNum(msgLN.getE01DEACUN());
				userPO.setHeader3(msgLN.getE01CUSNA1());
				userPO.setCusName(msgLN.getE01CUSNA1());
				userPO.setHeader4(msgLN.getE01DSCPRO());
				userPO.setCurrency(msgLN.getE01DEACCY());
				userPO.setBank(msgLN.getE01DEABNK());
				userPO.setBranch(msgLN.getE01DEABRN());
				userPO.setType(msgLN.getE01DEATYP());
				
				session.setAttribute("userPO", userPO);
				session.setAttribute("lnBasic", msgLN);
			} else if (newmessage.getFormatName().equals("EDL015009")) {
				userPO.setHeader10("BASIC");
				session.setAttribute("userPO", userPO);
				break;
			} else if (newmessage.getFormatName().equals("EDL015002")) {
				colNum = 29;
				String myRow[] = new String[colNum];
				for (int i=0; i<colNum; i++) {
					myRow[i] = "";
				}
				String marker = "";
				while (true) {
					EDL015002Message msgDed = (EDL015002Message) newmessage;
					marker = msgDed.getH02FLGMAS();
					if ("*".equals(marker)) break;
					int typ = (int) Util.parseFloat(msgDed.getE02DLIAPC());
					//Quote List
					myRow[0] =  msgDed.getE02BSEAMT().trim();	// 
					myRow[1] =  msgDed.getE02DEAACC().trim();	// 
					myRow[2] =  msgDed.getE02DEDAMT().trim();	// 
					myRow[3] =  msgDed.getE02DLIAPC().trim();	// 
					myRow[4] =  msgDed.getE02DLICDE().trim();	// 
					myRow[5] =  msgDed.getE02DLIDPM().trim();	// 
					myRow[6] =  msgDed.getE02DLIFAC().trim();	// 
					myRow[7] =  msgDed.getE02DLIIVA().trim();	// 
					myRow[8] =  msgDed.getE02DLIIVB().trim();	// 
					myRow[9] =  msgDed.getE02DLIIVP().trim();	// 
					myRow[10] =  msgDed.getE02DLINME().trim();	//CHARGE NAME 
					myRow[11] =  msgDed.getE02DLIOAC().trim();	// 
					myRow[12] =  msgDed.getE02DLIOBK().trim();	// 
					myRow[13] =  msgDed.getE02DLIOBR().trim();	// 
					myRow[14] =  msgDed.getE02DLIOCY().trim();	// 
					myRow[15] =  msgDed.getE02DLIOGL().trim();	// 
					myRow[16] =  msgDed.getE02DLIPLZ().trim();	// 
					myRow[17] =  msgDed.getE02DLIPRO().trim();	// 
					myRow[18] =  msgDed.getE02FACTOR().trim();	// 
					myRow[19] =  msgDed.getE02MAXAMT().trim();	// 
					myRow[20] =  msgDed.getE02MINAMT().trim();	// 
					myRow[21] =  msgDed.getE02DLIPBC().trim();	//
					myRow[22] =  msgDed.getE02DLISEG().trim();	//
					myRow[23] =  msgDed.getE02DLISEL().trim();	//
					myRow[24] =  msgDed.getE02DLIAPC().trim();	//
					myRow[25] =  msgDed.getE02DLIDAC().trim();	//
					myRow[26] =  msgDed.getE02DLINPM().trim();	//
					myRow[27] =  msgDed.getE02DLINPD().trim();	//
					myRow[28] =  msgDed.getE02DLINPY().trim();	//
					
					if ("L".equals(msgDed.getE02DLIPRO().trim())) {
						dedList.addRow("", myRow);
					} else {
						switch (typ) {				
							case 1 : //taxes
									taxList.addRow("", myRow);
									break;
							case 2 ://commissions
									comList.addRow("", myRow);
									break;
							case 3 ://insurance
									insList.addRow("", myRow);
									break;
							default ://other charges
									ivaList.addRow("", myRow);
									break;
						}
					}
					newmessage = mp.receiveMessageRecord();
				}
				session.setAttribute("ded", dedList);
				session.setAttribute("tax", taxList);
				session.setAttribute("ins", insList);
				session.setAttribute("com", comList);
				session.setAttribute("iva", ivaList);
			} else if (newmessage.getFormatName().equals("EDL015003")) {
				colNum = 7;
				String myRow[] = new String[colNum];
				for (int i=0; i<colNum; i++) {
					myRow[i] = "";
				}
				String marker = "";
				while (true) {
					EDL015003Message msgPmnt = (EDL015003Message) newmessage;
					marker = msgPmnt.getH03FLGMAS();
					if ("*".equals(marker)) break;
					//Quote List
					myRow[0] =  Util.trim(msgPmnt.getE03DLPPNU());	// Quote Number
					myRow[1] =  Util.trim(msgPmnt.getE03DLPPDD());	// Date
					myRow[2] =  Util.trim(msgPmnt.getE03DLPPDM());	// Date
					myRow[3] =  Util.trim(msgPmnt.getE03DLPPDY());	// Date
					myRow[4] =  Util.trim(msgPmnt.getE03DLPPRI());	// Principal
					myRow[5] =  Util.trim(msgPmnt.getE03DLPINT());	// Interest
					myRow[6] =  Util.trim(msgPmnt.getE03DLPIIP());	// Interest Included
						
					pmntList.addRow("", myRow);
					newmessage = mp.receiveMessageRecord();
				}
				session.setAttribute("pmnt", pmntList);
			} else if (newmessage.getFormatName().equals("EDL015004")) {
				colNum = 5;
				String myRow[] = new String[colNum];
				for (int i=0; i<colNum; i++) {
					myRow[i] = "";
				}
				String marker = "";
				while (true) {
					EDL015004Message msgColl = (EDL015004Message) newmessage;
					marker = msgColl.getH04FLGMAS();
					if ("*".equals(marker)) break;
					//Quote List
					myRow[0] =  Util.formatCell(msgColl.getE04RCLACB());	// Collateral Number
					myRow[1] =  Util.formatCell(msgColl.getE04RCLTYB());	// Type
					myRow[2] =  Util.formatCell(msgColl.getE04RCLCCY());	   // Currency
					myRow[3] =  Util.formatCell(msgColl.getE04RCLAMT());	// Amount
					myRow[4] =  Util.formatCell(msgColl.getE04RCLF04());	// FOGAPE
						
					collList.addRow("", myRow);
					newmessage = mp.receiveMessageRecord();
				}
				session.setAttribute("coll", collList);
			} else if (newmessage.getFormatName().equals("EDL015005")) {
				colNum = 2;
				String myRow[] = new String[colNum];
				for (int i=0; i<colNum; i++) {
					myRow[i] = "";
				}
				String marker = "";
				while (true) {
					EDL015005Message msgPmntP = (EDL015005Message) newmessage;
					marker = msgPmntP.getH05FLGMAS();
					if ("*".equals(marker)) break;
					//Quote List
					myRow[0] =  Util.trim(msgPmntP.getE05DLPPNU());	// Quote Number
					myRow[1] =  Util.trim(msgPmntP.getE05DLPVEX());	// Principal
						
					pmntPList.addRow("", myRow);
					newmessage = mp.receiveMessageRecord();
				}
				session.setAttribute("pmntPlus", pmntPList);
			} else if (newmessage.getFormatName().equals("EDL015230")) {
				EDL015230Message msgNewOK = (EDL015230Message) newmessage;
				userPO.setIdentifier(msgNewOK.getE30DEAACC());
				userPO.setAccNum(msgNewOK.getE30DEAACC());
				userPO.setHeader10("CONF");
				session.setAttribute("userPO", userPO);
				session.setAttribute("lnGenTran", msgNewOK);
				break;
			}
		}
		return !hasError;
	}

}
