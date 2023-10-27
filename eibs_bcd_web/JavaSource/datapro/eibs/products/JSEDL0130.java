package datapro.eibs.products;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.sockets.MessageContext;

import datapro.eibs.beans.DataTransaction;
import datapro.eibs.beans.EDL013001Message;
import datapro.eibs.beans.EDL013003Message;
import datapro.eibs.beans.EDL013004Message;
import datapro.eibs.beans.EDL013006Message;
import datapro.eibs.beans.EDL013007Message;
import datapro.eibs.beans.EDL013008Message;
import datapro.eibs.beans.EDL013009Message;
import datapro.eibs.beans.EDL016001Message;
import datapro.eibs.beans.EDL016002Message;
import datapro.eibs.beans.EFT000010Message;
import datapro.eibs.beans.ELD000001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD000002Message;
import datapro.eibs.beans.ESD000004Message;
import datapro.eibs.beans.ESD000005Message;
import datapro.eibs.beans.ESD000006Message;
import datapro.eibs.beans.ESD000008Message;
import datapro.eibs.beans.ESD071111Message;
import datapro.eibs.beans.ESD080001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBListRec;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.SuperServlet;
import datapro.eibs.sockets.MessageRecord;

public class JSEDL0130 extends JSEIBSServlet {

	// certificate of deposit 
	protected static final int R_NEW = 1;
	protected static final int A_NEW = 2;
	protected static final int R_MAINTENANCE = 3;
	protected static final int A_MAINTENANCE = 4;
	protected static final int R_TRANSACTION = 5;
	protected static final int A_TRANSACTION = 6;
	protected static final int R_TITULARES = 7;
	protected static final int A_TITULARES = 8;
	protected static final int R_PAYMENT_PLAN = 9;
	protected static final int A_PAYMENT_PLAN = 10;
	protected static final int R_PRECANCEL = 11;
	protected static final int A_PRECANCEL = 12;
	protected static final int R_SPECIAL_INST = 15;
	protected static final int A_SPECIAL_INST = 16;
	protected static final int R_BENEFICIARY = 17;
	protected static final int A_BENEFICIARY = 18;
	protected static final int R_EXCHANGE = 19;
	protected static final int A_EXCHANGE = 20;
	protected static final int R_CODES = 21;
	protected static final int A_CODES = 22;
	protected static final int R_RENOV_MANT = 33;
	protected static final int A_RENOV_MANT = 34;
	protected static final int R_RENOV_OPEN = 35;
	protected static final int A_RENOV_OPEN = 36;
	protected static final int R_FINISH = 37;
	protected static final int A_FINISH = 38;
	protected static final int R_INT_PREP = 39;
	protected static final int A_INT_PREP = 40;
	protected static final int R_PRINT_FIRST = 47;
	protected static final int A_PRINT_FIRST = 48;

	protected static final int R_OTHERS_TRANS = 49;
	protected static final int R_DISBURSEMENT = 50;
	protected static final int A_DISBURSEMENT = 51;
	protected static final int R_MONEY = 52;
	protected static final int A_MONEY = 53;

	protected static final int R_CD_SIGNERS = 55;
	protected static final int A_CD_SIGNERS = 56;

	protected static final int R_ACCOUNT_TITLE = 57;
	protected static final int A_ACCOUNT_TITLE = 58;
	
	protected static final int R_RENOV_TREASURY = 59;
	protected static final int A_RENOV_TREASURY = 60;
	protected static final int A_ANULL = 62;
	//inquiry options
	protected static final int R_INQUIRY = 13;
	protected static final int R_CODES_INQ = 27;
	protected static final int R_TITULARES_INQ = 29;
	protected static final int R_SPECIAL_INST_INQ = 31;
	protected static final int R_BASIC_INQ = 41;
	protected static final int R_BASIC_CONTR = 42;
	protected static final int R_PROD_INQ = 43;
	protected static final int R_BENE_INQ = 44;
	protected static final int R_CALC_INQ = 45;
	protected static final int R_GARANT_INQ = 46;

	// entering options
	protected static final int R_ENTER_NEW = 100;
	protected static final int R_ENTER_MAINT = 200;
	protected static final int R_ENTER_MAINT_BONO = 201;
	protected static final int R_ENTER_INQUIRY = 300;
	protected static final int R_ENTER_INQUIRY_BONO = 301;
	protected static final int R_ENTER_CANCEL = 700;
	protected static final int R_ENTER_CANCEL_BONO = 702;
	protected static final int R_ENTER_TRANSAC = 900;
	protected static final int R_ENTER_ANULL = 960;
	protected static final int R_ENTER_PRINT = 1100;
	protected static final int R_ENTER_MAINT_T = 1300;
	protected static final int R_ENTER_MAINT_ACC = 1500;
	protected static final int R_ENTER_CANCEL_ACC = 1700;
	protected static final int R_ENTER_AUTHORIZATION = 1800;
    protected static final int R_ENTER_EXCHANGE = 1900;
	
	protected static final int A_ENTER_NEW = 400;
	protected static final int A_ENTER_MAINT = 500;
	protected static final int A_ENTER_INQUIRY = 600;
	protected static final int A_ENTER_CANCEL = 800;
	protected static final int A_ENTER_TRANSAC = 1000;
	protected static final int A_ENTER_ANULL = 1060;
	protected static final int A_ENTER_PRINT = 1200;
	protected static final int A_ENTER_EXCHANGE = 2000;
    protected static final int A_ENTER_AUTHORIZATION = 2100;
    protected String LangPath = "S";
    
 	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		MessageContext mc = null;

		// Here we should get the path from the user profile
		LangPath = super.rootPath + user.getE01LAN() + "/";
		
		switch (screen) {
			// BEGIN CD
			// Request
			case R_NEW :
				procReqNew(user, req, res, session);
				break;
			case R_MAINTENANCE :
				procReqMaintenance(user, req, res, session);
				break;
			case R_BENEFICIARY :
				procReqBene(user, req, res, session);
				break;
			case R_SPECIAL_INST :
				procReqEspInst(user, req, res, session);
				break;
			case R_ACCOUNT_TITLE :
				procReqAccountTitle(user, req, res, session);
				break;											
			case R_TITULARES :
				procReqTit(user, req, res, session);
				break;
			case R_INQUIRY :
				procReqInquiry(user, req, res, session);
				break;
			case R_EXCHANGE :
				procReqExchangeRate(user, req, res, session);
				break;
			case R_CODES :
				procReqSpecialCodes(user, req, res, session);
				break;
			case R_PRECANCEL :
				procReqCancelation(user, req, res, session);
				break;
			case R_TRANSACTION :
				procReqTransaction(user, req, res, session);
				break;
			case R_RENOV_MANT :
				//procReqRenovations(user, req, res, session);
				procReqRenovationsFase0(user, req, res, session);
				break;
			case R_RENOV_TREASURY :
				procReqRenovationsTreasury(user, req, res, session);
				break;
				
			case R_FINISH :
				procReqFinish(user, req, res, session);
				break;
			case R_INT_PREP :
				procReqIntPrep(user, req, res, session);
				break;
			case R_OTHERS_TRANS :
				procReqOthersTransaction(user, req, res, session);
				break;
			case R_DISBURSEMENT :
				procReqDisbursement(user, req, res, session);
				break;
			case R_MONEY :
				procReqCDMoney(user, req, res, session);
				break;
			case R_CD_SIGNERS :
				procReqSigners(user, req, res, session);
				break;
			case R_PAYMENT_PLAN :
				procReqMaintPay(user, req, res, session);
				break;
				//Reports	
			case R_BASIC_CONTR :
				procReqContr(user, req, res, session);
				break;
	
				//Inquiry Options
			case R_CODES_INQ :
				procReqSpecialCodesInq(user, req, res, session);
				break;
			case R_TITULARES_INQ :
				procReqTitInq(user, req, res, session);
				break;
			case R_SPECIAL_INST_INQ :
				procReqEspInstInq(user, req, res, session);
				break;
			case R_BASIC_INQ :
				procReqInqBasic(user, req, res, session);
				break;
			case R_PROD_INQ :
				procReqProductCD(user, req, res, session);
				break;
			case R_BENE_INQ :
				procReqInqBene(user, req, res, session);
				break;
	
				// Action
			case A_NEW :
				procActionNew(user, req, res, session);
				break;
			case A_MAINTENANCE :
				procActionMaintenance(user, req, res, session);
				break;
			case A_BENEFICIARY :
				procActionBene(user, req, res, session);
				break;
			case A_SPECIAL_INST :
				procActionEspInst(user, req, res, session);
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
			case A_ACCOUNT_TITLE :
				procActionAccountTitle(user, req, res, session);
				break;					
				
			case A_PRECANCEL :
				procActionCancelation(user, req, res, session);
				break;
			case A_TRANSACTION :
				procActionTransaction(user, req, res, session);
				break;
			case A_ANULL :
				procActionAnull(mc, user, req, res, session);
				break;	
			case A_RENOV_MANT :
				//procActionRenovations(user, req, res, session);
				procActionRenovationsFase0(user, req, res, session);
				break;
			case A_RENOV_TREASURY :
				procActionRenovationsTreasury(user, req, res, session);
				break;
			case A_FINISH :
				procActionFinish(user, req, res, session);
				break;
			case A_INT_PREP :
				procActionIntPrep(user, req, res, session);
				break;
			case A_PRINT_FIRST :
				procActionPrintNew(user, req, res, session);
				break;
			case A_DISBURSEMENT :
				procActionDisbursement(user, req, res, session);
				break;
			case A_MONEY :
				procActionCDMoney(user, req, res, session);
				break;
			case A_CD_SIGNERS :
				procActionSigners(user, req, res, session);
				break;
			case A_PAYMENT_PLAN :
				procActionMaintPay(user, req, res, session);
				break;
				// END CD
	
				// BEGIN Entering
				// Request
			case R_ENTER_NEW :
				procReqEnterNew(user, req, res, session);
				break;
			case R_ENTER_MAINT :
				procReqEnterMaint(user, req, res, session);
				break;
			case R_ENTER_MAINT_BONO :
				procReqEnterMaintBono(user, req, res, session);
				break;	
			case R_ENTER_CANCEL :
				procReqEnterCancel(user, req, res, session);
				break;
			case R_ENTER_CANCEL_BONO :
				procReqEnterCancelBono(user, req, res, session);
				break;	
			case R_ENTER_TRANSAC :
				procReqEnterTransac(user, req, res, session);
				break;
			case A_ENTER_ANULL :
				procActionEnterAnull(mc, user, req, res, session);
				break;	
			case R_ENTER_ANULL :
				procReqEnterAnull(user, req, res, session);
				break;	
			case R_ENTER_INQUIRY :
				procReqEnterInquiry(user, req, res, session);
				break;
			case R_ENTER_INQUIRY_BONO :
				procReqEnterInquiryBono(user, req, res, session);
				break;	
			case R_ENTER_PRINT :
				procReqEnterPrint(user, req, res, session);
				break;
			case R_ENTER_MAINT_T :
				procReqEnterMaintT(user, req, res, session);
				break;
			case R_ENTER_MAINT_ACC :
				procReqEnterMaintAcc(user, req, res, session);
				break;
			case R_ENTER_AUTHORIZATION: 
	            procReqEnterAuthorization(user, req, res, session);
	            break;
	
			case R_ENTER_CANCEL_ACC :
				procReqEnterCancelAcc(user, req, res, session);
				break;
			case R_ENTER_EXCHANGE :
				procReqEnterExchangeRate(user, req, res, session);
				break;
	
				// Action 
			case A_ENTER_NEW :
				procActionEnterNew(user, req, res, session);
				break;
			case A_ENTER_MAINT :
				procActionEnterMaint(user, req, res, session);
				break;
			case A_ENTER_CANCEL :
				procActionEnterCancel(user, req, res, session);
				break;
			case A_ENTER_TRANSAC :
				procActionEnterTransac(user, req, res, session);
				break;
			case A_ENTER_INQUIRY :
				procActionEnterInquiry(user, req, res, session);
				break;
			case A_ENTER_PRINT :
				procActionEnterPrint(user, req, res, session);
				break;
			case A_ENTER_AUTHORIZATION: 
	            procActionEnterAuthorization(user, req, res, session);
	            break;	
			case A_ENTER_EXCHANGE :
				procActionEnterExchangeRate(user, req, res, session);
				break;
				// END Entering
	
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procActionEnterMaintCustReimpre(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			EDL013001Message msgCD = (EDL013001Message) mp.getMessageRecord("EDL013001");
			msgCD.setH01USERID(user.getH01USR());
			msgCD.setH01PROGRM("EDL0130");
			msgCD.setH01TIMSYS(getTimeStamp());
			msgCD.setH01SCRCOD("01");
			msgCD.setH01OPECOD("0002");
			try {
				msgCD.setE01DEAACC(req.getParameter("E01DEAACC").trim());
			} catch (Exception e) {
			}
			try {
				msgCD.setH01FLGWK2(req.getParameter("H01FLGWK2").trim());
			} catch (Exception e) {
			}

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgCD = (EDL013001Message) mp.receiveMessageRecord("EDL013001");

			if (mp.hasError(msgError)) {
				pageName = "GENERIC_account_enter.jsp";
			} else {
				userPO = new UserPos();
				userPO.setOption("CD");
				userPO.setPurpose("MAINTENANCE");						
				userPO.setAccNum(msgCD.getE01DEAACC());
				userPO.setProdCode(msgCD.getE01DEAPRO());
				userPO.setCusNum(msgCD.getE01DEACUN());
				userPO.setCusName(msgCD.getE01CUSNA1());
				userPO.setApplicationCode(msgCD.getE01DEAACD());
				userPO.setCurrency(msgCD.getE01DEACCY());
				userPO.setType(msgCD.getE01DEATYP());
				pageName = "EDL0130_cd_maint_custodia.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdMant", msgCD);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionEnterExchangeRate(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setAccNum(req.getParameter("E06DEAACC"));
		userPO.setAccNum(req.getParameter("E06DEAACC"));
					
		session.setAttribute("userPO", userPO);
		procReqExchangeRate(user, req, res, session);
	}

	private void procActionEnterAuthorization(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
        userPO.setAccNum(req.getParameter("E06DEAACC"));
        userPO.setAccNum(req.getParameter("E06DEAACC"));
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			EDL013006Message msgCD = (EDL013006Message) mp.getMessageRecord("EDL013006");
            msgCD.setH06USERID(user.getH01USR());
            msgCD.setH06PROGRM("EDL0130");
            msgCD.setH06TIMSYS(SuperServlet.getTimeStamp());
            msgCD.setH06SCRCOD("01");
            msgCD.setH06OPECOD("2100");
            msgCD.setE06DEAACC(userPO.getAccNum());
            msgCD.setE06DEANR1(req.getParameter("E06DEANR1"));

			mp.sendMessage(msgCD);
			MessageRecord msg = mp.receiveMessageRecord();

			if (mp.hasError(msg)) {
				pageName = "EDL0130_cd_enter_authorization.jsp";
			} else {
				pageName = "MISC_message_viewer.jsp?MESSAGE=CLAVE CREADA EXITOSAMENTE";
			}

			session.setAttribute("error", msg);
			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionEnterPrint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			EFT000010Message msgCD = (EFT000010Message) mp.getMessageRecord("EFT000010");
			msgCD.setH10USERID(user.getH01USR());
			msgCD.setH10PROGRM("EDL0130");
			msgCD.setH10TIMSYS(getTimeStamp());
			msgCD.setH10SCRCOD("01");
			msgCD.setH10OPECOD("0002");
			try {
				msgCD.setE10DEAACC(req.getParameter("E10DEAACC").trim());
			} catch (Exception e) {
				msgCD.setE10DEAACC("0");
			}

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (EFT000010Message) mp.receiveMessageRecord("EFT000010");

			if (mp.hasError(msgError)) {
				pageName = "EDL0130_cd_enter_print.jsp";
			} else {
				userPO.setAccNum(msgCD.getE10DEAACC());
				userPO.setProdCode(msgCD.getE10DEAPRO());
				userPO.setCusNum(msgCD.getE10DEACUN());
				userPO.setCusName(msgCD.getE10CUSNA1());
				pageName = "EDL0130_cd_finish.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdFinish", msgCD);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	protected void procActionEnterInquiry(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			EDL016001Message msgCD = (EDL016001Message) mp.getMessageRecord("EDL016001");
			msgCD.setH01USERID(user.getH01USR());
			msgCD.setH01PROGRM("EDL0160");
			msgCD.setH01TIMSYS(getTimeStamp());
			msgCD.setH01SCRCOD("01");
			msgCD.setH01OPECOD("0002");
			try {
				msgCD.setE01DEAACC(req.getParameter("E01DEAACC").trim());
			} catch (Exception e) {
				msgCD.setE01DEAACC("0");
			}

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (EDL016001Message) mp.receiveMessageRecord("EDL016001");

			if (mp.hasError(msgError)) {
				pageName = "EDL0160_cd_enter_inquiry.jsp";
			} else {
				userPO.setAccNum(msgCD.getE01DEAACC());
				userPO.setBank(msgCD.getE01DEABNK());
				userPO.setBranch(msgCD.getE01DEABRN());
				userPO.setProdCode(msgCD.getE01DEAPRO());
				userPO.setCusNum(msgCD.getE01DEACUN());
				userPO.setCusName(msgCD.getE01CUSNA1());
				userPO.setCurrency(msgCD.getE01DEACCY());
				userPO.setType(msgCD.getE01DEATYP());
				pageName = "EDL0160_cd_inquiry.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdInquiry", msgCD);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionEnterTransac(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			EDL013003Message msgCD = (EDL013003Message) mp.getMessageRecord("EDL013003");
			msgCD.setH03USERID(user.getH01USR());
			msgCD.setH03PROGRM("EDL0130");
			msgCD.setH03TIMSYS(getTimeStamp());
			msgCD.setH03SCRCOD("01");
			msgCD.setH03OPECOD("0002");
			try {
				msgCD.setE03DEAACC(req.getParameter("E03DEAACC").trim());
			} catch (Exception e) {
				msgCD.setE03DEAACC("0");
			}

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (EDL013003Message) mp.receiveMessageRecord("EDL013003");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				pageName = "EDL0130_cd_enter_transac.jsp";
				forward(pageName, req, res);
			} else {
				userPO.setAccNum(msgCD.getE03DEAACC());
				session.setAttribute("userPO", userPO);
				session.setAttribute("cdTransac", msgCD);
				procReqTransaction(user, req, res, session);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionEnterCancel(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			EDL013007Message msgCD = (EDL013007Message) mp.getMessageRecord("EDL013007");
			msgCD.setH07USERID(user.getH01USR());
			msgCD.setH07PROGRM("EDL0130");
			msgCD.setH07TIMSYS(getTimeStamp());
			msgCD.setH07SCRCOD("01");
			msgCD.setH07OPECOD("0002");
			try {
				msgCD.setE07DEAACC(req.getParameter("E07DEAACC").trim());
			} catch (Exception e) {
				msgCD.setE07DEAACC("0");
			}

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (EDL013007Message) mp.receiveMessageRecord("EDL013007");

			if (mp.hasError(msgError)) {
				pageName = "EDL0130_cd_enter_cancel.jsp";
			} else {
				userPO.setAccNum(msgCD.getE07DEAACC());
				pageName = "EDL0130_cd_cancel.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdCancel", msgCD);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionEnterNew(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setAccNum(req.getParameter("E01DEAACC"));
		userPO.setProdCode(req.getParameter("E01DEAPRO"));
					
		session.setAttribute("userPO", userPO);
		procReqNew(user, req, res, session);
	}

	private void procReqEnterExchangeRate(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("CD");
		userPO.setPurpose("MAINTENANCE");
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
        session.setAttribute("cdRate", new EDL013006Message());
		
		forward("EDL0130_cd_enter_xchg_rate.jsp", req, res);
	}

	private void procReqEnterCancelAcc(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("CD");
		userPO.setPurpose("MAINTENANCE");
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		
		forward("EDL0130_cd_enter_cancel_acc.jsp", req, res);
	}

	private void procReqEnterAuthorization(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("CD");
		userPO.setPurpose("MAINTENANCE");
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
        session.setAttribute("cdRate", new EDL013006Message());
		
		forward("EDL0130_cd_enter_authorization.jsp", req, res);
	}

	protected void procReqEnterInquiryBono(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

			ELEERRMessage msgError = null;
			UserPos userPO = null;

			try {

				msgError = new ELEERRMessage();
				userPO = new UserPos();
				userPO.setOption("12");
				userPO.setPurpose("INQUIRY");
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);

			} catch (Exception ex) {
				flexLog("Error: " + ex);
			}

			try {
				flexLog("About to call Page: " + LangPath + "EDL0160_cd_enter_inquiry.jsp");
				callPage(LangPath + "EDL0160_cd_enter_inquiry.jsp", req, res);
			} catch (Exception e) {
				flexLog("Exception calling page " + e);
			}

		}
		
	
	private void procReqEnterMaintAcc(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("CD");
		userPO.setPurpose("MAINTENANCE");
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		session.setAttribute("cdMant", new EDL013001Message());
		
		forward("EDL0130_cd_enter_maint_acc.jsp", req, res);
	}

	protected void procReqEnterMaintBono(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

			ELEERRMessage msgError = null;
			UserPos userPO = null;
			EDL013001Message msgCD = null;

			try {

				msgError = new ELEERRMessage();
				userPO = new UserPos();
				userPO.setApplicationCode("12");
				userPO.setPurpose("MAINTENANCE");
				msgCD = new EDL013001Message();
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("cdMant", msgCD);

			} catch (Exception ex) {
				flexLog("Error: " + ex);
			}

			try {
				flexLog("About to call Page: " + LangPath + "EDL0130_cd_enter_maint.jsp");
				callPage(LangPath + "EDL0130_cd_enter_maint.jsp", req, res);
			} catch (Exception e) {
				flexLog("Exception calling page " + e);
			}

		}

	
	private void procReqEnterMaintT(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("CD");
		userPO.setPurpose("MAINTENANCE");
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		session.setAttribute("cdMant", new EDL013001Message());
		
		forward("EDL0130B_cd_enter_maint.jsp", req, res);
	}

	private void procReqEnterPrint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("CD");
		userPO.setPurpose("PRINT");
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		
		forward("EDL0130_cd_enter_print.jsp", req, res);
	}

	protected void procReqEnterInquiry(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("CD");
		userPO.setPurpose("INQUIRY");
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		
		forward("EDL0160_cd_enter_inquiry.jsp", req, res);
	}

	/**
	 * This method was created in VisualAge.
	 */
	protected void procActionEnterAnull(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		EDL013003Message msgCD = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send Initial data
		try {
			//msgCD = (EDL013003Message)ses.getAttribute("cdTransac");
			mp = getMessageProcessor("EDL0130", req);
			msgCD = (EDL013003Message) mp.getMessageRecord("EDL013003");
			msgCD.setH03USERID(user.getH01USR());
			msgCD.setH03PROGRM("EDL0130");
			msgCD.setH03TIMSYS(getTimeStamp());
			msgCD.setH03SCRCOD("03");
			msgCD.setH03OPECOD("0002");
			try {
				msgCD.setE03DEAACC(req.getParameter("E03DEAACC"));
			} catch (Exception e) {
				msgCD.setE03DEAACC("0");
			}
			try {
				userPO.setIdentifier(req.getParameter("E03DEAACC"));
			} catch (Exception e) {
				userPO.setIdentifier("0");
			}

			msgCD.send();
			msgCD.destroy();
			flexLog("EDL013003 Message Sent");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Message
		newmessage = mp.receiveMessageRecord();

		if (mp.hasError(newmessage)) {
			ses.setAttribute("error", newmessage);
			userPO.setPurpose("ENTER");
			ses.setAttribute("userPO", userPO);
			forward("EDL0130_cd_enter_anull.jsp", req, res);
			
		} else {
			newmessage = mp.receiveMessageRecord();
		
			msgCD = new EDL013003Message();
		
				msgCD = (EDL013003Message) newmessage;

				userPO.setAccNum(msgCD.getE03DEAACC());

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);
				ses.setAttribute("cdTransac", msgCD);

				procReqAnull(mc, user, req, res, ses);
		}
		

	}

	
	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqEnterAnull(
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {

		ELEERRMessage msgError = null;
		UserPos userPO = null;

		try {

			
			msgError = new ELEERRMessage();
			userPO = new UserPos();
			//userPO.setOption("CD");
			userPO.setPurpose("CD_TRANSACTION");
			ses.setAttribute("error", msgError);
			ses.setAttribute("userPO", userPO);
			

		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}


        String AppCode = "";		
		try {
			AppCode = req.getParameter("AppCode");
		} catch (Exception e) {
			AppCode = "CD";
		}
		userPO.setOption(AppCode);
		
		
		try {
			flexLog("About to call Page: " + LangPath + "EDL0130_cd_enter_anull.jsp");
			forward("EDL0130_cd_enter_anull.jsp", req, res);
		} catch (Exception e) {
			flexLog("Exception calling page " + e);
		}

	}

	
	private void procReqEnterTransac(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("CD");
		userPO.setPurpose("CD_TRANSACTION");
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		
		forward("EDL0130_cd_enter_transac.jsp", req, res);
	}
	
	
	

	private void procReqEnterCancel(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("CD");
		userPO.setPurpose("MAINTENANCE");
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		
		forward("EDL0130_cd_enter_cancel.jsp", req, res);
	}
	
	protected void procReqEnterCancelBono(
			ESS0030DSMessage user,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession ses)
			throws ServletException, IOException {

			ELEERRMessage msgError = null;
			UserPos userPO = null;

			try {

				msgError = new ELEERRMessage();
				userPO = new UserPos();
				userPO.setOption("12");
				userPO.setPurpose("MAINTENANCE");
				ses.setAttribute("error", msgError);
				ses.setAttribute("userPO", userPO);

			} catch (Exception ex) {
				flexLog("Error: " + ex);
			}

			try {
				flexLog("About to call Page: " + LangPath + "EDL0130_cd_enter_cancel.jsp");
				callPage(LangPath + "EDL0130_cd_enter_cancel.jsp", req, res);
			} catch (Exception e) {
				flexLog("Exception calling page " + e);
			}

		}


	protected void procReqEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("CD");
		userPO.setPurpose("MAINTENANCE");
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		session.setAttribute("cdMant", new EDL013001Message());
		
		forward("EDL0130_cd_enter_maint.jsp", req, res);
	}

	private void procReqEnterNew(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("CD");
		userPO.setPurpose("NEW");
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		
		forward("EDL0130_cd_enter_new.jsp", req, res);
	}

	private void procActionMaintCustReimpre(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			EDL013001Message msgCD = (EDL013001Message) session.getAttribute("cdMant");
			msgCD.setH01USERID(user.getH01USR());
			msgCD.setH01PROGRM("EDL0130");
			msgCD.setH01TIMSYS(getTimeStamp());
			msgCD.setH01SCRCOD("01");
			msgCD.setH01OPECOD("0008");
			
			setMessageRecord(req, msgCD);

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (EDL013001Message) mp.receiveMessageRecord("EDL013001");

			if (mp.hasError(msgError)) {
				userPO.setAccNum(msgCD.getE01DEAACC());
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				session.setAttribute("cdMant", msgCD);
				pageName = "EDL0130_cd_maint_custodia.jsp";
				forward(pageName, req, res);
			} else {
				procReqEnterMaintCustReimpre(user, req, res, session);
			}
			
		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionMaintPay(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		
		int colNum = 6;
		JBListRec pmntList = new JBListRec();
		pmntList.init(colNum);
		
		String myRow[] = new String[colNum];
		for (int i = 0; i < colNum; i++) {
			myRow[i] = "";
		}
		
		String sel = " ";
		for (int row = 0; row < 360; row++) {
			try {
				sel = req.getParameter("DLPPNU_" + row).toUpperCase();
				if (sel.equals(""))
					break;
			} catch (Exception e) {
				break;
			}

			myRow[0] = req.getParameter("DLPPNU_" + row);
			myRow[1] = req.getParameter("DLPPD1_" + row);
			myRow[2] = req.getParameter("DLPPD2_" + row);
			myRow[3] = req.getParameter("DLPPD3_" + row);
			myRow[4] = req.getParameter("DLPPRI_" + row);
			myRow[5] = req.getParameter("DLPINT_" + row);

			pmntList.addRow("", myRow);

		}
		session.setAttribute("pmnt", pmntList);
		
		int opt;
		try {
			opt = Integer.parseInt(req.getParameter("opt"));
		} catch (Exception e) {
			opt = 1;
		}
		
		switch (opt) {
			case 1 : 
				MessageProcessor mp = null;
				mp = getMessageProcessor("EDL0130", req); 
				try {
					pmntList.initRow();
					while (pmntList.getNextRow()) {
						EDL013004Message msgPmnt = (EDL013004Message) mp.getMessageRecord("EDL013004");
						msgPmnt.setH04USERID(user.getH01USR());
						msgPmnt.setH04PROGRM("EDL0130");
						msgPmnt.setH04TIMSYS(getTimeStamp());
						msgPmnt.setH04SCRCOD("01");
						msgPmnt.setH04OPECOD("0005");
						msgPmnt.setE04DEAACC(userPO.getAccNum());
						try {
							msgPmnt.setE04DLPPNU(pmntList.getRecord(0).trim()); //Quota
						} catch (Exception e) {
						}
						try {
							msgPmnt.setE04DLPPDD(pmntList.getRecord(1).trim()); //Date
						} catch (Exception e) {
						}
						try {
							msgPmnt.setE04DLPPDM(pmntList.getRecord(2).trim()); //Date
						} catch (Exception e) {
						}
						try {
							msgPmnt.setE04DLPPDY(pmntList.getRecord(3).trim()); //Date
						} catch (Exception e) {
						}
						try {
							msgPmnt.setE04DLPPRI(pmntList.getRecord(4).trim()); //Principal
						} catch (Exception e) {
						}
						try {
							msgPmnt.setE04DLPINT(pmntList.getRecord(5).trim()); //Interest
						} catch (Exception e) {
						}
						mp.sendMessage(msgPmnt);
					}
					
					EDL013004Message msgPmnt = (EDL013004Message) mp.getMessageRecord("EDL013004");
					
					msgPmnt.setH04USERID(user.getH01USR());
					msgPmnt.setH04PROGRM("EDL0130");
					msgPmnt.setH04TIMSYS(getTimeStamp());
					msgPmnt.setH04SCRCOD("01");
					msgPmnt.setH04OPECOD("0005");
					msgPmnt.setH04FLGMAS("*");
					msgPmnt.setE04DEAACC(userPO.getAccNum());
					
					mp.sendMessage(msgPmnt);
					ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
					JBObjList list = mp.receiveMessageRecordList("H04FLGMAS");
					
					if (mp.hasError(msgError)) {
						session.setAttribute("error", msgError);
						forward("EDL0130_cd_pay_pln_det.jsp", req, res);
					} else {
						list.initRow();
						while (list.getNextRow()) {
							msgPmnt = (EDL013004Message) list.getRecord();
							myRow[0] = msgPmnt.getE04DLPPNU(); // Quote Number
							myRow[1] = msgPmnt.getE04DLPPDD();
							myRow[2] = msgPmnt.getE04DLPPDM();
							myRow[3] = msgPmnt.getE04DLPPDY(); // Date
							myRow[4] = msgPmnt.getE04DLPPRI(); // Principal
							myRow[5] = msgPmnt.getE04DLPINT(); // Interest

							pmntList.addRow("", myRow);
						}
						session.setAttribute("pmnt", pmntList);
						
						res.setContentType("text/html");
						PrintWriter out = res.getWriter();
						out.println("<HTML>");
						out.println("<HEAD>");
						out.println("<TITLE>Close</TITLE>");
						out.println("</HEAD>");
						out.println("<BODY>");
						out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
						out.println("		top.opener.document.forms[0].submit();");
						out.println("		top.close();");
						out.println("</SCRIPT>");
						out.println("<P>Close it!!!</P>");
						out.println("</BODY>");
						out.println("</HTML>");
						out.close();
					}
				} finally {
					if (mp != null) mp.close();
				}
				break;
			case 2 :
				try {
					pmntList.setLastRow();
					int pymNumLast = 1;
					if (!pmntList.getNoResult()) {
						pymNumLast = Integer.parseInt(pmntList.getRecord(0)) + 1;
					}
					int number=0;
					try{
						number = Integer.parseInt(req.getParameter("NUMBER"));
					}catch(NumberFormatException e){
						number = 0;
					}
					int month = 0;
					try{
					  month = Integer.parseInt(req.getParameter("DATE1"));
					}catch(NumberFormatException e){
						month = 0;
					}
					int day = 0;
					try{
						day = Integer.parseInt(req.getParameter("DATE2"));
					}catch(NumberFormatException e){
						day = 0;
					}
					int year = 0;
					try{
						year = Integer.parseInt(req.getParameter("DATE3"));
					}catch(NumberFormatException e){
						year = 0;
					}
					int feq = 0;
					try{
						feq = Integer.parseInt(req.getParameter("FREQUENCY"));
					}catch(NumberFormatException e){
						feq = 0;
					}
					char code = req.getParameter("CODE").toCharArray()[0];
					java.util.Calendar myDate = Calendar.getInstance();
					myDate.set(year, month - 1, day);
					
					for (int row = 0; row < number; row++) {
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
							myRow[3] = y.substring(2);
						} else if (user.getE01DTF().equals("DMY")) {
							myRow[1] = myDate.get(Calendar.DAY_OF_MONTH) + "";
							myRow[2] = (myDate.get(Calendar.MONTH) + 1) + "";
							String y = myDate.get(Calendar.YEAR) + "";
							myRow[3] = y;
						} else {
							String y = myDate.get(Calendar.YEAR) + "";
							myRow[1] = y.substring(2);
							myRow[2] = (myDate.get(Calendar.MONTH) + 1) + "";
							myRow[3] = myDate.get(Calendar.DAY_OF_MONTH) + "";
						}
						// Amount
						myRow[4] = req.getParameter("AMOUNT");
						// Interest
						myRow[5] = "";

						pmntList.addRow("", myRow);
					}
					session.setAttribute("pmnt", pmntList);
					
					forward("EDL0130_cd_pay_pln_det.jsp", req, res);
					
				} catch (Exception e) {
					throw new RuntimeException(e);
				}
				break;
			case 3 :
				String row = req.getParameter("ROW") == null ? "" : ("?ROW=" + req.getParameter("ROW"));
				forward("EDL0130_cd_pay_pln_det.jsp" + row, req, res);
				break;
		}
	}

	private void procActionSigners(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			ESD000004Message msgBene = (ESD000004Message) session.getAttribute("cdFirm");
			msgBene.setH04USR(user.getH01USR());
			msgBene.setH04PGM("EDL0");
			msgBene.setH04TIM(getTimeStamp());
			msgBene.setH04SCR("01");
			msgBene.setH04OPE("0005");
			msgBene.setE04RTP("S");
			msgBene.setE04CUN(userPO.getAccNum());
			
			setMessageRecord(req, msgBene);

			mp.sendMessage(msgBene);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgBene = (ESD000004Message) mp.receiveMessageRecord("ESD000004");

			if (mp.hasError(msgError)) {
				pageName = "EDL0130_cd_firm.jsp";
			} else {
				pageName = "EDL0130_cd_maint.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdFirm", msgBene);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	protected void showERROR(ELEERRMessage m) {
		if (logType != NONE) {

			flexLog("ERROR received.");

			flexLog("ERROR number:" + m.getERRNUM());
			flexLog("ERR001 = " + m.getERNU01() + " desc: " + m.getERDS01());
			flexLog("ERR002 = " + m.getERNU02() + " desc: " + m.getERDS02());
			flexLog("ERR003 = " + m.getERNU03() + " desc: " + m.getERDS03());
			flexLog("ERR004 = " + m.getERNU04() + " desc: " + m.getERDS04());
			flexLog("ERR005 = " + m.getERNU05() + " desc: " + m.getERDS05());
			flexLog("ERR006 = " + m.getERNU06() + " desc: " + m.getERDS06());
			flexLog("ERR007 = " + m.getERNU07() + " desc: " + m.getERDS07());
			flexLog("ERR008 = " + m.getERNU08() + " desc: " + m.getERDS08());
			flexLog("ERR009 = " + m.getERNU09() + " desc: " + m.getERDS09());
			flexLog("ERR010 = " + m.getERNU10() + " desc: " + m.getERDS10());

		}
	}


	private void procActionCDMoney(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			ELD000001Message msgLaunder = (ELD000001Message) session.getAttribute("cdMoney");
			msgLaunder.setH06USERID(user.getH01USR());
			msgLaunder.setH06PROGRM("ELD0000");
			msgLaunder.setH06TIMSYS(getTimeStamp());
			msgLaunder.setH06SCRCOD("01");
			msgLaunder.setH06OPECOD("0005");
			msgLaunder.setH06FLGWK1("1");
			
			setMessageRecord(req, msgLaunder);

			mp.sendMessage(msgLaunder);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgLaunder = (ELD000001Message) mp.receiveMessageRecord("ELD000001");

			if (mp.hasError(msgError)) {
				pageName = "EDL0130_cd_money.jsp";
			} else {
				userPO.setAccNum(msgLaunder.getE06LDMACC());
				pageName = "EDL0130_cd_maint.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdMoney", msgLaunder);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionDisbursement(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			ESD000008Message msgCD = (ESD000008Message) session.getAttribute("cdDisb");
			msgCD.setH08USR(user.getH01USR());
			msgCD.setH08PGM("PAYMTINST");
			msgCD.setH08TIM(getTimeStamp());
			msgCD.setH08SCR("01");
			msgCD.setH08OPE("0005");
			msgCD.setE08ACC(userPO.getAccNum());
			
			setMessageRecord(req, msgCD);

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (ESD000008Message) mp.receiveMessageRecord("ESD000008");

			if (mp.hasError(msgError)) {
				pageName = "EDL0130_cd_disb_inst.jsp";
			} else {
				pageName = "EDL0130_cd_maint.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdDisb", msgCD);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionPrintNew(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			EDL013001Message msgCD = (EDL013001Message) mp.getMessageRecord("EDL013001");
			msgCD.setH01USERID(user.getH01USR());
			msgCD.setH01PROGRM("EDL0130");
			msgCD.setH01TIMSYS(getTimeStamp());
			msgCD.setH01SCRCOD("01");
			msgCD.setH01OPECOD("0002");

			try {
				msgCD.setE01DEAACC(req.getParameter("E10DEAACC").trim());
			} catch (Exception e) {
				msgCD.setE01DEAACC(userPO.getAccNum());
			}

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (EDL013001Message) mp.receiveMessageRecord("EDL013001");

			if (mp.hasError(msgError)) {
				pageName = "EDL0130_cd_enter_maint.jsp";
			} else {
				userPO.setAccNum(msgCD.getE01DEAACC());
				userPO.setProdCode(msgCD.getE01DEAPRO());
				userPO.setCusNum(msgCD.getE01DEACUN());
				userPO.setCusName(msgCD.getE01CUSNA1());
				userPO.setCurrency(msgCD.getE01DEACCY());
				userPO.setType(msgCD.getE01DEATYP());
				pageName = "EDL0130_cd_maint.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdMant", msgCD);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionIntPrep(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			EDL013009Message msgCD = (EDL013009Message) session.getAttribute("cdIntPrep");
			msgCD.setH09USERID(user.getH01USR());
			msgCD.setH09PROGRM("EDL0130");
			msgCD.setH09TIMSYS(getTimeStamp());
			msgCD.setH09SCRCOD("01");
			msgCD.setH09OPECOD("0005");
			
			setMessageRecord(req, msgCD);

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (EDL013009Message) mp.receiveMessageRecord("EDL013009");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				pageName = "EDL0130_cd_prep_int.jsp";
				forward(pageName, req, res);
			} else {
				userPO.setAccNum(msgCD.getE09DEAACC());
				session.setAttribute("userPO", userPO);
				session.setAttribute("cdIntPrep", msgCD);
				procActionEnterMaint(user, req, res, session);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	protected void procActionEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			EDL013001Message msgCD = (EDL013001Message) mp.getMessageRecord("EDL013001");
			msgCD.setH01USERID(user.getH01USR());
			msgCD.setH01PROGRM("EDL0130");
			msgCD.setH01TIMSYS(getTimeStamp());
			msgCD.setH01SCRCOD("01");
			msgCD.setH01OPECOD("0002");
			try {
				msgCD.setE01DEAACC(req.getParameter("E01DEAACC").trim());
			} catch (Exception e) {
				msgCD.setE01DEAACC(userPO.getAccNum());
			}
			try {
				msgCD.setH01FLGWK2(req.getParameter("H01FLGWK2").trim());
			} catch (Exception e) {
			}

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (EDL013001Message) mp.receiveMessageRecord("EDL013001");

			if (mp.hasError(msgError)) {
				pageName = "EDL0130_cd_enter_maint.jsp";
			} else {
				userPO.setAccNum(msgCD.getE01DEAACC());
				userPO.setProdCode(msgCD.getE01DEAPRO());
				userPO.setCusNum(msgCD.getE01DEACUN());
				userPO.setCusName(msgCD.getE01CUSNA1());
				userPO.setCurrency(msgCD.getE01DEACCY());
				userPO.setType(msgCD.getE01DEATYP());
				pageName = "EDL0130_cd_maint.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdMant", msgCD);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionFinish(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			EFT000010Message msgCD = (EFT000010Message) session.getAttribute("cdFinish");
			msgCD.setH10USERID(user.getH01USR());
			msgCD.setH10PROGRM("EDL0130");
			msgCD.setH10TIMSYS(getTimeStamp());
			msgCD.setH10SCRCOD("01");
			msgCD.setH10OPECOD("0002");
			msgCD.setE10DEAACC(userPO.getAccNum());

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (EFT000010Message) mp.receiveMessageRecord("EFT000010");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				pageName = "EDL0130_cd_finish.jsp";
			} else {
				userPO.setAccNum(msgCD.getE10DEAACC());
				if (msgCD.getE10DEAICT().equals("P")
						|| msgCD.getE10DEAICT().equals("A")
						|| msgCD.getE10DEAICT().equals("3")
						|| msgCD.getE10DEAICT().equals("4")) {
					procReqIntPrep(user, req, res, session);
				} else {
					session.setAttribute("userPO", userPO);
					session.setAttribute("cdFinish", msgCD);
					if (userPO.getPurpose().equals("MAINTENANCE")) {
						pageName = "EDL0130_cd_enter_maint.jsp";
						forward(pageName, req, res);
					} else if (userPO.getPurpose().equals("PRINT")) {
						pageName = "EDL0130_cd_enter_print.jsp";
						forward(pageName, req, res);
					} else {
						res.sendRedirect(srctx + "/pages/background.jsp");
					}
				}
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionRenovationsTreasury(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			EDL013008Message msgCD = (EDL013008Message) mp.getMessageRecord("EDL013008");
			msgCD.setH08USERID(user.getH01USR());
			msgCD.setH08PROGRM("EDL0130");
			msgCD.setH08TIMSYS(getTimeStamp());
			msgCD.setH08SCRCOD("01");
			msgCD.setH08OPECOD("0005");
			
			setMessageRecord(req, msgCD);

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (EDL013008Message) mp.receiveMessageRecord("EDL013008");

			if (mp.hasError(msgError)) {
				pageName = "EWD0334_cancel_renov_options.jsp";
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				session.setAttribute("cdRenov", msgCD);

				forward(pageName, req, res);
			} else {
				userPO.setAccNum(msgCD.getE08DEAACC());
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEWD0334Ren?SCREEN=2&SWDACC=" + userPO.getAccNum() + "&SWDCUN=" + userPO.getCusNum() + "&SWDCCY=" + userPO.getCurrency() + "&RWDDAY=" + userPO.getProdCode());
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}
	
	/**
	 * This method was created in VisualAge.
	 */
	protected void procActionAnull(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
		
		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		EDL013003Message msgCDO = null;
		EDL013003Message msgCD = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;

		try {
			msgError = new ELEERRMessage();
		} catch (Exception ex) {
			flexLog("Error: " + ex);
		}

		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");

		// Send Initial data
		try {
			flexLog("Send Initial Data");
			mp = getMessageProcessor("EDL0130", req);
			msgCD = (EDL013003Message)mp.getMessageRecord("EDL013003");
			msgCDO = (EDL013003Message) ses.getAttribute("cdTransac");
			msgCD.setH03USERID(user.getH01USR());
			msgCD.setH03PROGRM("EDL0130");
			msgCD.setH03TIMSYS(getTimeStamp());
			msgCD.setH03SCRCOD("03");
			msgCD.setH03OPECOD("0005");
			
			msgCD.setE03DEAACD(req.getParameter("E03DEAACD"));
			msgCD.setE03DEAACC(req.getParameter("E03DEAACC"));
			msgCD.setE03DEAMEP(req.getParameter("E03DEAMEP"));
			msgCD.setE03TRNPRI(req.getParameter("E03TRNPRI"));
			msgCD.setE03TRNREA(req.getParameter("E03TRNREA"));
			msgCD.setE03TRNINT(req.getParameter("E03TRNINT"));
			msgCD.setE03TRNADJ(req.getParameter("E03TRNADJ"));
			msgCD.setE03TRNPRF(msgCDO.getE03TRNPRF());
			msgCD.setE03DEAWHL(req.getParameter("E03DEAWHL"));
			msgCD.setE03DEATAX(req.getParameter("E03DEATAX"));
			msgCD.setE03DEATOT(req.getParameter("E03DEATOT"));
			msgCD.setE03DEANR1(req.getParameter("E03DEANR1"));
			msgCD.setE03TRNVDM(req.getParameter("E03TRNVDM"));
			msgCD.setE03TRNVDD(req.getParameter("E03TRNVDD"));
			msgCD.setE03TRNVDY(req.getParameter("E03TRNVDY"));
			msgCD.setE03TRNBNK(req.getParameter("E03TRNBNK"));
			msgCD.setE03TRNBRN(req.getParameter("E03TRNBRN"));
			msgCD.setE03TRNCCY(req.getParameter("E03TRNCCY"));
			msgCD.setE03TRNGLN(req.getParameter("E03TRNGLN"));
			msgCD.setE03TRNACC(req.getParameter("E03TRNACC"));

			// all the fields here
			java.util.Enumeration enu = msgCD.fieldEnumeration();
			datapro.eibs.sockets.MessageField field = null;
			String value = null;
			while (enu.hasMoreElements()) {
				field = (datapro.eibs.sockets.MessageField) enu.nextElement();
				try {
					value = req.getParameter(field.getTag()).toUpperCase();
					if (value != null) {
						field.setString(value);
					}
				} catch (Exception e) {
				}
			}

			msgCD.send();
			//mc.sendMessage(msgCD);
			msgCD.destroy();
			flexLog("EDL013003 Message Sent");
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		try {
			newmessage = mp.receiveMessageRecord();

			if(mp.hasError(newmessage)){
				ses.setAttribute("error", newmessage);
				userPO.setPurpose("ENTER");
				ses.setAttribute("userPO", userPO);
				forward("EDL0130_cd_anull.jsp", req, res);
			}else{
				//msgCD = (EDL013003Message) newmessage;
				// showESD008004(msgCD);

				userPO.setAccNum(msgCD.getE03DEAACC());

				flexLog("Putting java beans into the session");
				ses.setAttribute("error", msgError);
				ses.setAttribute("cdTransac", msgCD);
				ses.setAttribute("userPO", userPO);

				callPage(LangPath + "EDL0130_cd_anull_confirm.jsp", req, res);
				
			} 

		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}


	private void procActionRenovationsFase0(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			EDL013008Message msgCD = (EDL013008Message) mp.getMessageRecord("EDL013008");
			msgCD.setH08USERID(user.getH01USR());
			msgCD.setH08PROGRM("EDL0130");
			msgCD.setH08TIMSYS(getTimeStamp());
			msgCD.setH08SCRCOD("01");
			msgCD.setH08OPECOD("0005");
			
			setMessageRecord(req, msgCD);

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (EDL013008Message) mp.receiveMessageRecord("EDL013008");

			if (mp.hasError(msgError)) {
				pageName = "EDL0130_cd_renov_options.jsp";
			} else {
				userPO.setAccNum(msgCD.getE08DEAACC());
				pageName = "EDL0130_cd_maint.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdRenov", msgCD);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionTransaction(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			EDL013003Message msgCD = (EDL013003Message) session.getAttribute("cdTransac");
			msgCD.setH03USERID(user.getH01USR());
			msgCD.setH03PROGRM("EDL0130");
			msgCD.setH03TIMSYS(getTimeStamp());
			msgCD.setH03SCRCOD("01");
			msgCD.setH03OPECOD("0005");
			
			setMessageRecord(req, msgCD);

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (EDL013003Message) mp.receiveMessageRecord("EDL013003");

			if (mp.hasError(msgError)) {
				pageName = "EDL0130_cd_transac.jsp";
			} else {
				userPO.setAccNum(msgCD.getE03DEAACC());
				pageName = "EDL0130_cd_transaction_confirm.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdTransac", msgCD);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionCancelation(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opeCode = (req.getParameter("opt").equals("1")) ? "0005" : "0011";
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			EDL013007Message msgCD = (EDL013007Message) session.getAttribute("cdCancel");
			msgCD.setH07USERID(user.getH01USR());
			msgCD.setH07PROGRM("EDL0130");
			msgCD.setH07TIMSYS(getTimeStamp());
			msgCD.setH07SCRCOD("01");
			msgCD.setH07OPECOD(opeCode);
			
			setMessageRecord(req, msgCD);

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (EDL013007Message) mp.receiveMessageRecord("EDL013007");

			if (mp.hasError(msgError)) {
				pageName = "EDL0130_cd_cancel.jsp";
			} else {
				userPO.setAccNum(msgCD.getE07DEAACC());
				if (opeCode.equals("0005")) {
					pageName = "EDL0130_cd_cancel_confirm.jsp";
				} else {
					pageName = "EDL0130_cd_cancel.jsp";
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdCancel", msgCD);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionAccountTitle(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			ESD000004Message msgMailAddress = (ESD000004Message) mp.getMessageRecord("ESD000004");
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
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgMailAddress = (ESD000004Message) mp.receiveMessageRecord("ESD000004");

			if (mp.hasError(msgError)) {
				pageName = "EDL0130_cd_account_title.jsp";
			} else {
				pageName = "EDL0130_cd_maint.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("mailA", msgMailAddress);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionSpecialCodes(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			ESD000002Message msgCD = (ESD000002Message) session.getAttribute("cdCodes");
			msgCD.setH02USR(user.getH01USR());
			msgCD.setH02PGM("EDL0130");
			msgCD.setH02TIM(getTimeStamp());
			msgCD.setH02SCR("01");
			msgCD.setH02OPE("0005");
			
			setMessageRecord(req, msgCD);

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (ESD000002Message) mp.receiveMessageRecord("ESD000002");

			if (mp.hasError(msgError)) {
				pageName = "EDL0130_cd_codes.jsp";
			} else {
				userPO.setAccNum(msgCD.getE02ACC());
				pageName = "EDL0130_cd_maint.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdCodes", msgCD);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionExchangeRate(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			EDL013006Message msgCD = (EDL013006Message) session.getAttribute("cdRate");
			msgCD.setH06USERID(user.getH01USR());
			msgCD.setH06PROGRM("EDL0130");
			msgCD.setH06TIMSYS(getTimeStamp());
			msgCD.setH06SCRCOD("01");
			msgCD.setH06OPECOD("0005");
			
			setMessageRecord(req, msgCD);

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (EDL013006Message) mp.receiveMessageRecord("EDL013006");

			if (mp.hasError(msgError)) {
				pageName = "EDL0130_cd_xchg_rate.jsp";
			} else {
				userPO.setAccNum(msgCD.getE06DEAACC());
				pageName = "EDL0130_cd_maint.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdRate", msgCD);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionTit(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			ESD000006Message msgCD = (ESD000006Message) mp.getMessageRecord("ESD000006");
			msgCD.setH06USR(user.getH01USR());
			msgCD.setH06PGM("EDL0130");
			msgCD.setH06TIM(getTimeStamp());
			msgCD.setH06SCR("01");
			msgCD.setH06OPE("0005");
			msgCD.setE06ACC(userPO.getAccNum());
			msgCD.setE06RTP("H");
			
			setMessageRecord(req, msgCD);

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (ESD000006Message) mp.receiveMessageRecord("ESD000006");

			if (mp.hasError(msgError)) {
				pageName = "EDL0130_cd_tit.jsp";
			} else {
				userPO.setAccNum(msgCD.getE06ACC());
				pageName = "EDL0130_cd_maint.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdTit", msgCD);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionEspInst(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			ESD000005Message msgCD = (ESD000005Message) session.getAttribute("cdInst");
			msgCD.setH05USR(user.getH01USR());
			msgCD.setH05PGM("EDL0130");
			msgCD.setH05TIM(getTimeStamp());
			msgCD.setH05SCR("01");
			msgCD.setH05OPE("0005");
			msgCD.setE05ACC(userPO.getAccNum());
			msgCD.setE05ACD(userPO.getApplicationCode());
			
			setMessageRecord(req, msgCD);

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (ESD000005Message) mp.receiveMessageRecord("ESD000005");

			if (mp.hasError(msgError)) {
				pageName = "EDL0130_cd_special_inst.jsp";
			} else {
				pageName = "EDL0130_cd_maint.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdInst", msgCD);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionBene(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			ESD000004Message msgBene = (ESD000004Message) session.getAttribute("bene");
			msgBene.setH04USR(user.getH01USR());
			msgBene.setH04PGM("EDL0130");
			msgBene.setH04TIM(getTimeStamp());
			msgBene.setH04SCR("01");
			msgBene.setH04OPE("0005");
			msgBene.setE04RTP("J");
			
			setMessageRecord(req, msgBene);
			msgBene.setE04CUN(userPO.getAccNum());
			
			mp.sendMessage(msgBene);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgBene = (ESD000004Message) mp.receiveMessageRecord("ESD000004");

			if (mp.hasError(msgError)) {
				pageName = "EDL0130_cd_bene.jsp";
			} else {
				pageName = "EDL0130_cd_maint.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("bene", msgBene);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	protected void procActionMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String action = req.getParameter("ACTION") == null ? "F" : req.getParameter("ACTION").trim();
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			EDL013001Message msgCD = (EDL013001Message) session.getAttribute("cdMant");
			msgCD.setH01USERID(user.getH01USR());
			msgCD.setH01PROGRM("EDL0130");
			msgCD.setH01TIMSYS(getTimeStamp());
			msgCD.setH01SCRCOD("01");
			msgCD.setH01OPECOD("0005");
			if (action.equals("C"))	{
				msgCD.setH01OPECOD("0006");
			}	
			
			setMessageRecord(req, msgCD);

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			MessageRecord newmessage = mp.receiveMessageRecord();

			if (mp.hasError(msgError)) {
				pageName = "EDL0130_cd_maint.jsp";
			} else {
				if (newmessage.getFormatName().equals("EDL013009")) {
					EDL013009Message msgCDInt = (EDL013009Message) newmessage;

					userPO.setAccNum(msgCDInt.getE09DEAACC());
					userPO.setCurrency(msgCDInt.getE09TRNCCY());
					userPO.setCusName(msgCDInt.getE09CUSNA1());
					userPO.setCusNum(msgCDInt.getE09DEACUN());
					userPO.setProdCode(msgCDInt.getE09DEAPRO());
					
					session.setAttribute("cdIntPrep", msgCDInt);
					pageName = "EDL0130_cd_prep_int.jsp";
				} else if (newmessage.getFormatName().equals("EFT000010")) {
					EFT000010Message msgCDNew = (EFT000010Message) newmessage;
					
					userPO.setAccNum(msgCDNew.getE10DEAACC());
					
					session.setAttribute("cdFinish", msgCDNew);
					pageName = "EDL0130_cd_confirm.jsp";
				} else if (newmessage.getFormatName().equals("EDL013001")) {
					msgCD = (EDL013001Message) newmessage;
					
					userPO.setAccNum(msgCD.getE01DEAACC());
					
					session.setAttribute("cdMant", msgCD);
					pageName = "EDL0130_cd_enter_maint.jsp";
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procActionNew(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String action = req.getParameter("ACTION") == null ? "F" : req.getParameter("ACTION").trim();
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			EDL013001Message msgCD = (EDL013001Message) session.getAttribute("cdNew");;
			msgCD.setH01USERID(user.getH01USR());
			msgCD.setH01PROGRM("EDL0130");
			msgCD.setH01TIMSYS(getTimeStamp());
			msgCD.setH01SCRCOD("01");
			msgCD.setH01OPECOD("0005");
			
			setMessageRecord(req, msgCD);
			if (action.equals("C"))	{
				msgCD.setH01OPECOD("0006");
			}	

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			MessageRecord newmessage = mp.receiveMessageRecord();

			if (mp.hasError(msgError)) {
				if (newmessage.getFormatName().equals("EDL013001")) {
					msgCD = (EDL013001Message) newmessage;
					
					userPO.setAccNum(msgCD.getE01DEAACC());
					userPO.setCurrency(msgCD.getE01DEACCY());
					userPO.setCusName(msgCD.getE01CUSNA1());
					userPO.setCusNum(msgCD.getE01DEACUN());
					userPO.setProdCode(msgCD.getE01DEAPRO());
					
					session.setAttribute("cdNew", msgCD);
					pageName = "EDL0130_cd_opening.jsp";

					session.setAttribute("error", msgError);
					session.setAttribute("userPO", userPO);
					forward(pageName, req, res);
				} else {
					//TODO
				}
			} else {
				if (newmessage.getFormatName().equals("EDL013009")) {
					EDL013009Message msgCDInt = (EDL013009Message) newmessage;
					
					userPO.setAccNum(msgCDInt.getE09DEAACC());
					userPO.setCurrency(msgCDInt.getE09TRNCCY());
					userPO.setCusName(msgCDInt.getE09CUSNA1());
					userPO.setCusNum(msgCDInt.getE09DEACUN());
					userPO.setProdCode(msgCDInt.getE09DEAPRO());

					session.setAttribute("cdIntPrep", msgCDInt);
					
					pageName = "EDL0130_cd_prep_int.jsp";

					session.setAttribute("error", msgError);
					session.setAttribute("userPO", userPO);
					forward(pageName, req, res);
				} else if (newmessage.getFormatName().equals("EFT000010")) {
					EFT000010Message msgCDNew = (EFT000010Message) newmessage;
					
					userPO.setAccNum(msgCDNew.getE10DEAACC());
					userPO.setCurrency(msgCDNew.getE10DEACCY());
					userPO.setCusName(msgCDNew.getE10CUSNA1());
					userPO.setCusNum(msgCDNew.getE10DEACUN());
					userPO.setProdCode(msgCDNew.getE10DEAPRO());
					
					if (action.equals("R")) {
						procReqRenovations(user, req, res, session);
					} else {
						session.setAttribute("cdFinish", msgCDNew);
						pageName = "EDL0130_cd_confirm.jsp";
						forward(pageName, req, res);
					}
				} else {
					if (action.equals("C")) {
						msgCD = (EDL013001Message) newmessage;
						session.setAttribute("cdNew", msgCD);
						pageName = "EDL0130_cd_opening.jsp";

						session.setAttribute("error", msgError);
						session.setAttribute("userPO", userPO);
						forward(pageName, req, res);
					} else {
						//TODO
					}
				}
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqRenovations(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			EDL013008Message msgCD = (EDL013008Message) mp.getMessageRecord("EDL013008");
			msgCD.setH08USERID(user.getH01USR());
			msgCD.setH08PROGRM("EDL0130");
			msgCD.setH08TIMSYS(getTimeStamp());
			msgCD.setH08SCRCOD("01");
			msgCD.setH08OPECOD("0002");
			msgCD.setE08DEAACC(userPO.getAccNum());

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (EDL013008Message) mp.receiveMessageRecord("EDL013008");

			if (mp.hasError(msgError)) {
				pageName = "EDL0130_cd_maint.jsp";
			} else {
				pageName = "EDL0130_cd_renov_options.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdRenov", msgCD);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqInqBene(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			ESD000004Message msgBene = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgBene.setH04USR(user.getH01USR());
			msgBene.setH04PGM("EDL0130");
			msgBene.setH04TIM(getTimeStamp());
			msgBene.setH04SCR("01");
			msgBene.setH04OPE("0002");
			msgBene.setE04CUN(userPO.getAccNum());
			msgBene.setE04RTP("J");

			mp.sendMessage(msgBene);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgBene = (ESD000004Message) mp.receiveMessageRecord("ESD000004");

			if (mp.hasError(msgError)) {
				pageName = "EDL0160_cd_inquiry.jsp";
			} else {
				pageName = "EDL0130_cd_inq_bene.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("bene", msgBene);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqProductCD(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			ESD071111Message msgProdCD = (ESD071111Message) mp.getMessageRecord("ESD071111");
			msgProdCD.setH11USERID(user.getH01USR());
			msgProdCD.setH11PROGRM("ESD0711");
			msgProdCD.setH11TIMSYS(getTimeStamp());
			msgProdCD.setH11SCRCOD("01");
			msgProdCD.setH11OPECOD("0004");
			msgProdCD.setE11APCCDE(userPO.getProdCode());
			msgProdCD.setE11APCBNK(userPO.getBank());

			mp.sendMessage(msgProdCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgProdCD = (ESD071111Message) mp.receiveMessageRecord("ESD071111");

			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "EDL0130_cd_inq_products.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdProdInq", msgProdCD);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqInqBasic(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			EDL016002Message msgCD = (EDL016002Message) mp.getMessageRecord("EDL016002");
			msgCD.setH02USERID(user.getH01USR());
			msgCD.setH02PROGRM("EDL0160");
			msgCD.setH02TIMSYS(getTimeStamp());
			msgCD.setH02SCRCOD("01");
			msgCD.setH02OPECOD("0002");
			msgCD.setE02DEAACC(userPO.getAccNum());
			msgCD.setE02DEAACD("CD");

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (EDL016002Message) mp.receiveMessageRecord("EDL016002");

			if (mp.hasError(msgError)) {
				pageName = "EDL0130_cd_enter_maint.jsp";
			} else {
				pageName = "EDL0130_cd_inq_basic.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdMant", msgCD);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqEspInstInq(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			ESD000005Message msgCD = (ESD000005Message) mp.getMessageRecord("ESD000005");
			msgCD.setH05USR(user.getH01USR());
			msgCD.setH05PGM("EDL0130");
			msgCD.setH05TIM(getTimeStamp());
			msgCD.setH05SCR("01");
			msgCD.setH05OPE("0004");
			msgCD.setE05ACC(userPO.getAccNum());
			msgCD.setE05ACD(userPO.getApplicationCode());

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (ESD000005Message) mp.receiveMessageRecord("ESD000005");

			if (mp.hasError(msgError)) {
				pageName = "EDL0160_cd_inquiry.jsp";
			} else {
				pageName = "EDL0130_cd_inq_special_inst.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdInst", msgCD);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqTitInq(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			ESD000006Message msgCD = (ESD000006Message) mp.getMessageRecord("ESD000006");
			msgCD.setH06USR(user.getH01USR());
			msgCD.setH06PGM("EDL0130");
			msgCD.setH06TIM(getTimeStamp());
			msgCD.setH06SCR("01");
			msgCD.setH06OPE("0002");
			msgCD.setE06ACC(userPO.getAccNum());
			msgCD.setE06RTP("H");

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (ESD000006Message) mp.receiveMessageRecord("ESD000006");

			if (mp.hasError(msgError)) {
				pageName = "EDL0160_cd_inquiry.jsp";
			} else {
				pageName = "EDL0130_cd_inq_tit.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdTit", msgCD);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqSpecialCodesInq(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			ESD000002Message msgCD = (ESD000002Message) mp.getMessageRecord("ESD000002");
			msgCD.setH02USR(user.getH01USR());
			msgCD.setH02PGM("EDL0130");
			msgCD.setH02TIM(getTimeStamp());
			msgCD.setH02SCR("01");
			msgCD.setH02OPE("0004");
			msgCD.setE02ACC(userPO.getAccNum());

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (ESD000002Message) mp.receiveMessageRecord("ESD000002");

			if (mp.hasError(msgError)) {
				pageName = "EDL0160_cd_inquiry.jsp";
			} else {
				pageName = "EDL0130_cd_inq_codes.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdCodes", msgCD);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqContr(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			EFT000010Message msgCD = (EFT000010Message) mp.getMessageRecord("EFT000010");
			msgCD.setH10USERID(user.getH01USR());
			msgCD.setH10PROGRM("EDL0130");
			msgCD.setH10TIMSYS(getTimeStamp());
			msgCD.setH10SCRCOD("01");
			msgCD.setH10OPECOD("0004");
			msgCD.setE10DEAACC(userPO.getAccNum());

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (EFT000010Message) mp.receiveMessageRecord("EFT000010");

			if (mp.hasError(msgError)) {
				pageName = "EDL0130_cd_finish.jsp";
			} else {
				pageName = "EDL0130_rp_contract.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("report", msgCD);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqEnterMaintCustReimpre(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("CD");
		userPO.setPurpose("MAINTENANCE");
		userPO.setRedirect("/servlet/datapro.eibs.products.JSEDL0130?SCREEN=2500");
		userPO.setProdCode("CD");
		//Others Parameters
		userPO.setHeader1("E01DEAACC");
		userPO.setHeader2("H01FLGWK2");
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		
		forward("GENERIC_account_enter.jsp", req, res);
	}

	private void procReqMaintPay(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		mp = getMessageProcessor("EDL0130", req);
		
		try {
			EDL013004Message msgPmnt = (EDL013004Message) mp.getMessageRecord("EDL013004");
			msgPmnt.setH04USERID(user.getH01USR());
			msgPmnt.setH04PROGRM("EDL0130");
			msgPmnt.setH04TIMSYS(getTimeStamp());
			msgPmnt.setH04SCRCOD("01");
			msgPmnt.setH04OPECOD("0002");
			try {
				msgPmnt.setE04DEAACC(userPO.getAccNum().trim());
			} catch (Exception e) {
				msgPmnt.setE04DEAACC("0");
			}
			
			if(req.getParameter("mod")!=null){
				userPO.setOption("INQ"); //Inquiry
			}
			
			mp.sendMessage(msgPmnt);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			JBObjList list = mp.receiveMessageRecordList("H04FLGMAS");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				pageName = "error_viewer.jsp";
			} else {
				int colNum = 6;
				String myRow[] = new String[colNum];
				for (int i = 0; i < colNum; i++) {
					myRow[i] = "";
				}
				JBListRec pmntList = new JBListRec();
				pmntList.init(6);
				Iterator iterator = list.iterator();
				while (iterator.hasNext()) {
					msgPmnt = (EDL013004Message) iterator.next();
					myRow[0] = msgPmnt.getE04DLPPNU(); // Quote Number
					myRow[1] = msgPmnt.getE04DLPPDD();
					myRow[2] = msgPmnt.getE04DLPPDM();
					myRow[3] = msgPmnt.getE04DLPPDY(); // Date
					myRow[4] = msgPmnt.getE04DLPPRI(); // Principal
					myRow[5] = msgPmnt.getE04DLPINT(); // Interest

					pmntList.addRow("", myRow);
				}
				session.setAttribute("userPO", userPO);
				session.setAttribute("pmnt", pmntList);
				pageName = "EDL0130_cd_pay_pln_det.jsp";
			}
			
			session.setAttribute("userPO", userPO);
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqSigners(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			ESD000004Message msgBene = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgBene.setH04USR(user.getH01USR());
			msgBene.setH04PGM("EDL0130");
			msgBene.setH04TIM(getTimeStamp());
			msgBene.setH04SCR("01");
			msgBene.setH04OPE("0002");
			msgBene.setE04CUN(userPO.getAccNum());
			msgBene.setE04RTP("S");

			mp.sendMessage(msgBene);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgBene = (ESD000004Message) mp.receiveMessageRecord("ESD000004");

			if (mp.hasError(msgError)) {
				pageName = "EDL0130_cd_enter_maint.jsp";
			} else {
				pageName = "EDL0130_cd_firm.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdFirm", msgBene);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqCDMoney(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			ELD000001Message msgLaunder = (ELD000001Message) mp.getMessageRecord("ELD000001");
			msgLaunder.setH06USERID(user.getH01USR());
			msgLaunder.setH06PROGRM("EDL0130");
			msgLaunder.setH06TIMSYS(getTimeStamp());
			msgLaunder.setH06SCRCOD("01");
			msgLaunder.setH06OPECOD("0002");
			msgLaunder.setE06LDMACC(userPO.getAccNum());
			msgLaunder.setH06FLGWK1("1");

			mp.sendMessage(msgLaunder);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgLaunder = (ELD000001Message) mp.receiveMessageRecord("ELD000001");

			if (mp.hasError(msgError)) {
				pageName = "EDL0130_cd_maint.jsp";
			} else {
				pageName = "EDL0130_cd_money.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdMoney", msgLaunder);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqDisbursement(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			ESD000008Message msgCD = (ESD000008Message) mp.getMessageRecord("ESD000008");
			msgCD.setH08USR(user.getH01USR());
			msgCD.setH08PGM("PAYMTINST");
			msgCD.setH08TIM(getTimeStamp());
			msgCD.setH08SCR("01");
			msgCD.setH08OPE("0003");
			msgCD.setE08ACC(userPO.getAccNum());

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (ESD000008Message) mp.receiveMessageRecord("ESD000008");

			if (mp.hasError(msgError)) {
				pageName = "EDL0130_cd_maint.jsp";
			} else {
				pageName = "EDL0130_cd_disb_inst.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdDisb", msgCD);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqOthersTransaction(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos userPO = getUserPos(req);
		DataTransaction transData = new DataTransaction();
		transData.setWrkFile("4");
		transData.setAccNum(userPO.getAccNum());
		session.setAttribute("transData", transData);
		
		res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSEGL0035?SCREEN=1");
	}

	private void procReqIntPrep(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			EDL013009Message msgCD = (EDL013009Message) mp.getMessageRecord("EDL013009");
			msgCD.setH09USERID(user.getH01USR());
			msgCD.setH09PROGRM("EDL0130");
			msgCD.setH09TIMSYS(getTimeStamp());
			msgCD.setH09SCRCOD("01");
			msgCD.setH09OPECOD("0002");
			msgCD.setE09DEAACC(userPO.getAccNum());

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (EDL013009Message) mp.receiveMessageRecord("EDL013009");

			if (mp.hasError(msgError)) {
				pageName = "EDL0130_cd_finish.jsp";
			} else {
				pageName = "EDL0130_cd_prep_int.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdIntPrep", msgCD);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqFinish(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			EFT000010Message msgCD = (EFT000010Message) mp.getMessageRecord("EFT000010");
			msgCD.setH10USERID(user.getH01USR());
			msgCD.setH10PROGRM("EDL0130");
			msgCD.setH10TIMSYS(getTimeStamp());
			msgCD.setH10SCRCOD("01");
			msgCD.setH10OPECOD("0002");
			msgCD.setE10DEAACC(userPO.getAccNum());

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (EFT000010Message) mp.receiveMessageRecord("EFT000010");

			if (mp.hasError(msgError)) {
				pageName = "EDL0130_cd_opening.jsp";
			} else {
				pageName = "EDL0130_cd_finish.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdFinish", msgCD);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqRenovationsTreasury(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			EDL013008Message msgCD = (EDL013008Message) mp.getMessageRecord("EDL013008");
			msgCD.setH08USERID(user.getH01USR());
			msgCD.setH08PROGRM("EDL0130");
			msgCD.setH08TIMSYS(getTimeStamp());
			msgCD.setH08SCRCOD("01");
			msgCD.setH08OPECOD("0002");
			msgCD.setE08DEAACC(req.getParameter("ACCOUNT"));

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (EDL013008Message) mp.receiveMessageRecord("EDL013008");

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEWD0334Ren?SCREEN=2&SWDACC=" + userPO.getAccNum() + "&SWDCUN=" + userPO.getCusNum() + "&SWDCCY=" + userPO.getCurrency() + "&RWDDAY=" + userPO.getProdCode());
			} else {
				pageName = "EWD0334_cancel_renov_options.jsp";
				session.setAttribute("userPO", userPO);
				session.setAttribute("cdRenov", msgCD);

				forward(pageName, req, res);
			}

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqRenovationsFase0(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			EDL013008Message msgCD = (EDL013008Message) mp.getMessageRecord("EDL013008");
			msgCD.setH08USERID(user.getH01USR());
			msgCD.setH08PROGRM("EDL0130");
			msgCD.setH08TIMSYS(getTimeStamp());
			msgCD.setH08SCRCOD("01");
			msgCD.setH08OPECOD("0002");
			msgCD.setE08DEAACC(userPO.getAccNum());

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (EDL013008Message) mp.receiveMessageRecord("EDL013008");

			if (mp.hasError(msgError)) {
				pageName = "EDL0130_cd_maint.jsp";
			} else {
				pageName = "EDL0130_cd_renov_options.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdRenov", msgCD);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqTransaction(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			EDL013003Message msgCD = (EDL013003Message) mp.getMessageRecord("EDL013003");
			msgCD.setH03USERID(user.getH01USR());
			msgCD.setH03PROGRM("EDL0130");
			msgCD.setH03TIMSYS(getTimeStamp());
			msgCD.setH03SCRCOD("01");
			msgCD.setH03OPECOD("0002");
			msgCD.setE03DEAACC(userPO.getAccNum());

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (EDL013003Message) mp.receiveMessageRecord("EDL013003");

			if (mp.hasError(msgError)) {
				pageName = "EDL0130_cd_maint.jsp";
			} else {
				pageName = "EDL0130_cd_transac.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdTransac", msgCD);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqCancelation(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			EDL013007Message msgCD = (EDL013007Message) mp.getMessageRecord("EDL013007");
			msgCD.setH07USERID(user.getH01USR());
			msgCD.setH07PROGRM("EDL0130");
			msgCD.setH07TIMSYS(getTimeStamp());
			msgCD.setH07SCRCOD("01");
			msgCD.setH07OPECOD("0002");
			msgCD.setE07DEAACC(userPO.getAccNum());

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (EDL013007Message) mp.receiveMessageRecord("EDL013007");

			if (mp.hasError(msgError)) {
				pageName = "EDL0130_cd_maint.jsp";
			} else {
				pageName = "EDL0130_cd_cancel.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdCancel", msgCD);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqSpecialCodes(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = userPO.getPurpose().equals("MAINTENANCE") ? "0002" : "0004";
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			ESD000002Message msgCD = (ESD000002Message) mp.getMessageRecord("ESD000002");
			msgCD.setH02USR(user.getH01USR());
			msgCD.setH02PGM("EDL0130");
			msgCD.setH02TIM(getTimeStamp());
			msgCD.setH02SCR("01");
			msgCD.setH02OPE(opCode);
			msgCD.setE02ACC(userPO.getAccNum());

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msgCD = (ESD000002Message) mp.receiveMessageRecord("ESD000002");

			if (mp.hasError(msgError)) {
				pageName = "EDL0130_cd_codes.jsp";
			} else {
				pageName = "EDL0130_cd_codes.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdCodes", msgCD);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	private void procReqExchangeRate(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			EDL013006Message msgCD = (EDL013006Message) mp.getMessageRecord("EDL013006");
			msgCD.setH06USERID(user.getH01USR());
			msgCD.setH06PROGRM("EDL0130");
			msgCD.setH06TIMSYS(getTimeStamp());
			msgCD.setH06SCRCOD("01");
			msgCD.setH06OPECOD("0002");
			msgCD.setE06DEAACC(userPO.getAccNum());
			
			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgCD = (EDL013006Message) mp.receiveMessageRecord("EDL013006");
			
			if (mp.hasError(msgError)) {
				pageName = "EDL0130_cd_maint.jsp";
			} else {
				pageName = "EDL0130_cd_xchg_rate.jsp";
			}
			
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdRate", msgCD);
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqInquiry(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			EDL016001Message msgCD = (EDL016001Message) mp.getMessageRecord("EDL016001");
			
			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgCD = (EDL016001Message) mp.receiveMessageRecord("EDL016001");
			
			if (mp.hasError(msgError)) {
				pageName = "EDL0160_cd_enter_inquiry.jsp";
			} else {
				pageName = "EDL0160_cd_inquiry.jsp";
			}
			
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdInquiry", msgCD);
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqTit(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			ESD000006Message msgCD = (ESD000006Message) mp.getMessageRecord("ESD000006");
			msgCD.setH06USR(user.getH01USR());
			msgCD.setH06PGM("EDL0130");
			msgCD.setH06TIM(getTimeStamp());
			msgCD.setH06SCR("01");
			msgCD.setH06OPE("0002");
			msgCD.setE06ACC(userPO.getAccNum());
			msgCD.setE06RTP("H");
			
			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgCD = (ESD000006Message) mp.receiveMessageRecord("ESD000006");
			
			if (mp.hasError(msgError)) {
				pageName = "EDL0130_cd_enter_maint.jsp";
			} else {
				pageName = "EDL0130_cd_tit.jsp";
			}
			
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdTit", msgCD);
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqAccountTitle(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = userPO.getPurpose().equals("NEW") ? "0001" : "0002";
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
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
			
			if (mp.hasError(msgError)) {
				pageName = "EDL0130_cd_maint.jsp";
			} else {
				pageName = "EDL0130_cd_account_title.jsp";
			}
			
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("mailA", msgMailA);
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqEspInst(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			ESD000005Message msgCD = (ESD000005Message) mp.getMessageRecord("ESD000005");
			msgCD.setH05USR(user.getH01USR());
			msgCD.setH05PGM("EDL0130");
			msgCD.setH05TIM(getTimeStamp());
			msgCD.setH05SCR("01");
			msgCD.setH05OPE("0002");
			msgCD.setE05ACC(userPO.getAccNum());
			msgCD.setE05ACD(userPO.getApplicationCode());
			
			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgCD = (ESD000005Message) mp.receiveMessageRecord("ESD000005");
			
			if (mp.hasError(msgError)) {
				pageName = "EDL0130_cd_maint.jsp";
			} else {
				pageName = "EDL0130_cd_special_inst.jsp";
			}
			
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdInst", msgCD);
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqBene(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		String opCode = userPO.getPurpose().equals("NEW") ? "0001" : "0002";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			ESD000004Message msgBene = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgBene.setH04USR(user.getH01USR());
			msgBene.setH04PGM("EDL0130");
			msgBene.setH04TIM(getTimeStamp());
			msgBene.setH04SCR("01");
			msgBene.setH04OPE(opCode);
			msgBene.setE04CUN(userPO.getAccNum());
			msgBene.setE04RTP("J");
			
			mp.sendMessage(msgBene);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgBene = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			if (mp.hasError(msgError)) {
				pageName = "EDL0130_cd_enter_maint.jsp";
			} else {
				pageName = "EDL0130_cd_bene.jsp";
			}
			
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("bene", msgBene);
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0130", req);
			EDL013001Message msgCD = (EDL013001Message) mp.getMessageRecord("EDL013001");
			msgCD.setH01USERID(user.getH01USR());
			msgCD.setH01PROGRM("EDL0130");
			msgCD.setH01TIMSYS(getTimeStamp());
			msgCD.setH01SCRCOD("01");
			msgCD.setH01OPECOD("0002");
			msgCD.setE01DEAACC(userPO.getAccNum());
			
			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgCD = (EDL013001Message) mp.receiveMessageRecord("EDL013001");
			
			if (mp.hasError(msgError)) {
				pageName = "EDL0130_cd_enter_maint.jsp";
			} else {
				pageName = "EDL0130_cd_maint.jsp";
			}
			
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cdMant", msgCD);
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
		
	}

	private void procReqNew(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			userPO.setApplicationCode(req.getParameter("appcode"));
			mp = getMessageProcessor("EDL0130", req);
			EDL013001Message msgCD = (EDL013001Message) mp.getMessageRecord("EDL013001");
			msgCD.setH01USERID(user.getH01USR());
			msgCD.setH01PROGRM("EDL0130");
			msgCD.setH01TIMSYS(getTimeStamp());
			msgCD.setH01SCRCOD("01");
			msgCD.setH01OPECOD("0001");
			msgCD.setE01DEAPRO(userPO.getProdCode());
			msgCD.setE01OFFAC1(userPO.getHeader15());
			msgCD.setE01DEAREF(userPO.getHeader15());
			msgCD.setH01FLGWK3("T");
			msgCD.setE01DEAOAM(userPO.getHeader16());
			msgCD.setE01OFFAM1(userPO.getHeader16());
			msgCD.setE01DEAACC(userPO.getAccNum());
			
			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgCD = (EDL013001Message) mp.receiveMessageRecord("EDL013001");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
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
			} else {
				if (session.getAttribute("currClient") != null ) {
					ESD080001Message currClient = (ESD080001Message)session.getAttribute("currClient");
					msgCD.setE01DEACUN(currClient.getE01CUSCUN());
					msgCD.setE01CUSNA1(currClient.getE01CUSNA1());
				}
				
				session.setAttribute("userPO", userPO);
				session.setAttribute("cdNew", msgCD);
				
				forward("EDL0130_cd_opening.jsp", req, res);
				
			}
			
		} finally {
			if (mp != null) mp.close();
		}
		
	}
	
	/**
	 * This method was created in VisualAge.
	 */
	protected void procReqAnull(
		MessageContext mc,
		ESS0030DSMessage user,
		HttpServletRequest req,
		HttpServletResponse res,
		HttpSession ses)
		throws ServletException, IOException {
		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		EDL013003Message msgCD = null;
		ELEERRMessage msgError = null;
		UserPos userPO = null;
		boolean IsNotError = false;
		
		userPO = (datapro.eibs.beans.UserPos) ses.getAttribute("userPO");
		String opCode = "0002";

		// Send Initial data
		try {
			mp = getMessageProcessor("EDL0130", req);
			msgCD = (EDL013003Message) mp.getMessageRecord("EDL013003");
			msgCD.setH03USERID(user.getH01USR());
			msgCD.setH03PROGRM("EDL0130");
			msgCD.setH03TIMSYS(getTimeStamp());
			msgCD.setH03SCRCOD("03");
			msgCD.setH03OPECOD(opCode);
			msgCD.setE03DEAACC(userPO.getAccNum());
			msgCD.send();
			msgCD.destroy();
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		newmessage = mp.receiveMessageRecord();
		
		if (mp.hasError(newmessage)) {
			ses.setAttribute("error", newmessage);
			userPO.setPurpose("ENTER");
			ses.setAttribute("userPO", userPO);
			forward("error_viewer.jsp", req, res);
		} else {
			newmessage = mp.receiveMessageRecord();
			// Receive Error Message
			msgCD = new EDL013003Message();
			msgCD = (EDL013003Message) newmessage;
				// showESD008004(msgCD);

			flexLog("Putting java beans into the session");
			ses.setAttribute("error", msgError);
			ses.setAttribute("cdTransac", msgCD);
			flexLog("About to call Page: " + LangPath + "EDL0130_cd_anull.jsp");
			callPage(LangPath + "EDL0130_cd_anull.jsp", req, res);
			
			}
			
		
	}


}
