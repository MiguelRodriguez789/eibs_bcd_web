package datapro.eibs.products;

import java.awt.Color;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.net.URL;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Hashtable;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lowagie.text.Cell;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.HeaderFooter;
import com.lowagie.text.Image;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.Rectangle;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;

import datapro.eibs.beans.ECH056503Message;
import datapro.eibs.beans.ECIF03001Message;
import datapro.eibs.beans.ECIF03002Message;
import datapro.eibs.beans.EDD000001Message;
import datapro.eibs.beans.EDD000002Message;
import datapro.eibs.beans.EDD000003Message;
import datapro.eibs.beans.EDD000004Message;
import datapro.eibs.beans.EDD000005Message;
import datapro.eibs.beans.EDD000007Message;
import datapro.eibs.beans.EDD000010Message;
import datapro.eibs.beans.EDD009001Message;
import datapro.eibs.beans.EDD009002Message;
import datapro.eibs.beans.EFT000015Message;
import datapro.eibs.beans.ELD000001Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD000002Message;
import datapro.eibs.beans.ESD000004Message;
import datapro.eibs.beans.ESD000005Message;
import datapro.eibs.beans.ESD000006Message;
import datapro.eibs.beans.ESD009001Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0002DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.DecimalField;
import datapro.eibs.sockets.MessageRecord;

public class JSEDD0000 extends JSEIBSServlet {

	protected static final int R_RT_NEW = 1;
	protected static final int A_RT_NEW = 2;
	protected static final int R_RT_MAINTENANCE = 3;
	protected static final int A_RT_MAINTENANCE = 4;
	protected static final int R_RT_OVERDRAFT = 5;
	protected static final int A_RT_OVERDRAFT = 6;
	protected static final int R_RT_LIN_CRED = 7;
	protected static final int A_RT_LIN_CRED = 8;
	protected static final int R_PDF = 9;
	protected static final int R_RT_MONEY = 11;
	protected static final int A_RT_MONEY = 12;
	protected static final int R_RT_CODES = 13;
	protected static final int A_RT_CODES = 14;
	protected static final int R_RT_STATUS = 15;
	protected static final int A_RT_STATUS = 16;
	protected static final int R_RT_TITULARES = 17;
	protected static final int A_RT_TITULARES = 18;
	protected static final int R_RT_FIRMANTES = 19;
	protected static final int A_RT_FIRMANTES = 20;
	protected static final int R_RT_SPECIAL_INST = 21;
	protected static final int A_RT_SPECIAL_INST = 22;
	protected static final int R_RT_BENEFICIARIES = 23;
	protected static final int A_RT_BENEFICIARIES = 24;
	protected static final int R_SV_NEW = 25;
	protected static final int R_SV_MAINTENANCE = 27;
	
	protected static final int A_RT_BASIC = 29;
	protected static final int A_SV_BASIC = 30;
	protected static final int R_INQ_BALANCES = 31;
	protected static final int R_INQ_BASIC = 32;
	protected static final int R_INQ_MONEY = 33;
	protected static final int R_INQ_AVERAG = 34;
	protected static final int R_INQ_CODES = 35;
	protected static final int R_INQ_SIGNERS = 36;
	protected static final int R_INQ_SP_INST = 37;
	protected static final int R_INQ_TIT = 38;
	protected static final int R_INQ_BENE = 39;
	protected static final int R_PRODUCT = 40;
	protected static final int R_RELATED_ACC = 41;
	protected static final int R_DAILY_BAL = 42;
	protected static final int R_RT_PRINT_NEW = 43;
	protected static final int A_RT_PRINT_NEW = 44;
	protected static final int R_RT_OVERNIGHT = 45;
	protected static final int A_RT_OVERNIGHT = 46;
	protected static final int R_RT_LEGAL_REP = 47;
	protected static final int A_RT_LEGAL_REP = 48;
	protected static final int R_INQ_LEGAL_REP = 50;
	protected static final int R_INQ_CHECKBOOK = 51;
	protected static final int R_ACCOUNT_TITLE = 57;
	protected static final int A_ACCOUNT_TITLE = 58;
	protected static final int R_CP_NEW = 60;
	protected static final int R_CP_MAINTENANCE = 61;
	protected static final int A_CP_BASIC = 62;
	protected static final int R_RT_ENTER_NEW = 100;
	protected static final int R_RT_ACC_ANALYSIS = 101;
	protected static final int A_RT_ACC_ANALYSIS = 102;
	protected static final int R_RT_ACC_TELLER_MSG = 103;
	protected static final int A_RT_ACC_TELLER_MSG = 104;
	protected static final int R_INQ_ACCOUNT_ANALYSIS = 105;
	//
	protected static final int R_RT_ENT_CHG_STATUS = 115;
	protected static final int R_SV_ENT_CHG_STATUS = 116;
	protected static final int R_RT_CHG_STATUS = 215;
	protected static final int A_RT_CHG_STATUS = 216;
	//
	protected static final int R_RT_ENTER_STATUS = 150;
	protected static final int A_RT_ENTER_NEW = 200;
	protected static final int R_RT_ENTER_MAINT = 300;
	//
	protected static final int R_SV_CHG_STATUS = 315;
	protected static final int A_SV_CHG_STATUS = 316;
	//
	protected static final int A_RT_ENTER_MAINT = 400;
	protected static final int R_SV_ENTER_NEW = 500;
	protected static final int A_SV_ENTER_NEW = 600;
	protected static final int R_SV_ENTER_MAINT = 700;
	protected static final int A_SV_ENTER_MAINT = 800;
	protected static final int A_SV_SCHED_LIST = 900;
	protected static final int A_SV_SCHED_LIST_INQ = 910;
	protected static final int R_RT_ENTER_PRINT = 1100;
	protected static final int A_RT_ENTER_PRINT = 1200;
	protected static final int R_RT_ENTER_INQUIRY = 1300;
	protected static final int A_RT_ENTER_INQUIRY = 1400;
	protected static final int R_SV_ENTER_INQUIRY = 1500;
	protected static final int A_SV_ENTER_INQUIRY = 1600;
	protected static final int R_SV_ENTER_PRINT = 1700;
	protected static final int A_SV_ENTER_PRINT = 1800;
	protected static final int R_RT_ENTER_SOBREGIRO = 2000;
	protected static final int R_RT_OVERDRAFT_OPC = 2005;
	protected static final int A_RT_OVERDRAFT_OPC = 2006;
	protected static final int R_RT_ENTER_LINEACREDITO = 3000;
	protected static final int R_RT_LINEACREDITO = 3007;
	protected static final int A_RT_LINEACREDITO = 3008;
	protected static final int R_CP_ENTER_NEW = 4500;
	protected static final int R_CP_ENTER_MAINT = 4700;
	protected static final int R_CP_ENTER_INQUIRY = 5500;
	protected static final int R_CP_ENTER_PRINT = 5700;
	protected static final int A_CP_ENTER_NEW = 4600;
	protected static final int A_CP_ENTER_MAINT = 4800;
	protected static final int A_CP_ENTER_INQUIRY = 5600;
	protected static final int A_CP_ENTER_PRINT = 5800;


	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case R_RT_ENTER_NEW :
				procReqRTEnterNew(user, req, res, session);
				break;
			case R_CP_ENTER_NEW:
			case R_SV_ENTER_NEW :
				procReqSVEnterNew(user, req, res, session);
				break;
			case R_RT_ENTER_STATUS:
				procReqSVEnterStatus(user, req, res, session);
				break;
			case R_RT_ENTER_MAINT :
				procReqRTEnterMaint(user, req, res, session);
				break;
			case R_RT_ENT_CHG_STATUS :
				procReqRTEnterChange(user, req, res, session);
				break;	
			case R_SV_ENT_CHG_STATUS :
				procReqSVEnterChange(user, req, res, session);
				break;	
			case R_SV_ENTER_MAINT :
				procReqSVEnterMaint(user, req, res, session);
				break;
			case R_CP_ENTER_MAINT :
				procReqCPEnterMaint(user, req, res, session);
				break;
			case R_RT_ENTER_INQUIRY :
				procReqRTEnterInquiry(user, req, res, session);
				break;
			case R_RT_ENTER_SOBREGIRO :
				procReqRTSobregiro(user, req, res, session);
				break;	
			case R_RT_ENTER_LINEACREDITO :
				procReqRTLineacredito(user, req, res, session);
				break;	
			case R_SV_ENTER_INQUIRY :
				procReqSVEnterInquiry(user, req, res, session);
				break;
			case R_RT_ENTER_PRINT :
				procReqRTEnterPrint(user, req, res, session);
				break;
			case R_SV_ENTER_PRINT :
			case R_CP_ENTER_PRINT :
				procReqSVEnterPrint(user, req, res, session);
				break;
			case R_RT_NEW :
				procReqRTNew(user, req, res, session);
				break;
			case R_RT_MAINTENANCE :
				procReqRTMaintenance(user, req, res, session);
				break;
			case R_RT_OVERDRAFT :
				procReqRTOverdraft(user, req, res, session);
				break;
			case R_RT_OVERDRAFT_OPC :
				procReqRTOverdraftOpc(user, req, res, session);
				break;	
			case R_RT_OVERNIGHT :
				procReqRTOvernight(user, req, res, session);
				break;
			case R_RT_LIN_CRED :
				procReqRTCredit(user, req, res, session);
				break;
			case R_RT_LINEACREDITO :
				procReqRTCreditLine(user, req, res, session);
				break;	
			case R_RT_MONEY :
				procReqRTMoney(user, req, res, session);
				break;
			case R_RT_STATUS :
				procReqStatus(user, req, res, session);
				break;
			case R_RT_CHG_STATUS :
				procReqChgStatus(user, req, res, session);
				break;
			case R_SV_CHG_STATUS :
				procReqSVChgStatus(user, req, res, session);
				break;	
			case R_RT_CODES :
				procReqSpecialCodes(user, req, res, session);
				break;
			case A_RT_CHG_STATUS :
				procActionChgStatus(user, req, res, session);
				break;
			case A_SV_CHG_STATUS :
				procActionSVChgStatus(user, req, res, session);
				break;
	
			case R_ACCOUNT_TITLE :
				procReqAccountTitle(user, req, res, session);
				break;
			case R_RT_TITULARES :
				procReqTit(user, req, res, session);
				break;
			case R_RT_FIRMANTES :
				procReqFirm(user, req, res, session);
				break;
			case R_RT_SPECIAL_INST :
				procReqSpcInst(user, req, res, session);
				break;
			case R_RT_BENEFICIARIES :
				procReqRTBene(user, req, res, session);
				break;
			case R_RT_LEGAL_REP :
				procReqRTLegalRep(user, req, res, session);
				break;
			case R_INQ_BENE :
				procReqInqRTBene(user, req, res, session);
				break;
			case R_INQ_LEGAL_REP :
				procReqInqRTLegalRep(user, req, res, session);
				break;
			case R_RT_ACC_ANALYSIS :
				procReqAccountAnalysis(user, req, res, session);
				break;
			case R_RT_ACC_TELLER_MSG :
				procReqTellerMessages(user, req, res, session);
				break;
			case R_SV_NEW :
				procReqSVNew(user, req, res, session);
				break;
			case R_SV_MAINTENANCE :
				procReqSVMaintenance(user, req, res, session);
				break;
			case R_CP_NEW :
				procReqCPNew(user, req, res, session);
				break;
			case R_CP_MAINTENANCE :
				procReqCPMaintenance(user, req, res, session);
				break;
			case R_INQ_CHECKBOOK :
				procReqInqCheckbook(user, req, res, session);
				break;
			case R_INQ_ACCOUNT_ANALYSIS :
				procReqInqAccountAnalysis(user, req, res, session);
				break;
			case A_RT_BASIC :
				procActionRTBasic(user, req, res, session);
				break;
			case A_RT_OVERDRAFT :
				procActionRTOverdraft(user, req, res, session);
				break;
			case A_RT_OVERDRAFT_OPC :
				procActionRTOverdraftOpc(user, req, res, session);
				break;	
			case A_RT_OVERNIGHT :
				procActionRTOvernight(user, req, res, session);
				break;
			case A_RT_LIN_CRED :
				procActionRTCredit(user, req, res, session);
				break;
			case A_RT_LINEACREDITO :
				procActionRTCreditLine(user, req, res, session);
				break;	
			case A_RT_MONEY :
				procActionRTMoney(user, req, res, session);
				break;
			case A_RT_STATUS :
				procActionStatus(user, req, res, session);
				break;
			case A_ACCOUNT_TITLE :
				procActionAccountTitle(user, req, res, session);
				break;
			case A_RT_CODES :
				procActionSpecialCodes(user, req, res, session);
				break;      
			case A_RT_TITULARES :
				procActionTit(user, req, res, session);
				break;
			case A_RT_FIRMANTES :
				procActionFirm(user, req, res, session);
				break;
			case A_RT_SPECIAL_INST :
				procActionSpcInst(user, req, res, session);
				break;
			case A_RT_BENEFICIARIES :
				procActionRTBene(user, req, res, session);
				break;
			case A_RT_LEGAL_REP :
				procActionRTLegalRep(user, req, res, session);
				break;
			case A_RT_PRINT_NEW :
				procActionPrintNew(user, req, res, session);
				break;
			case A_RT_ACC_ANALYSIS :
				procActionAccountAnalysis(user, req, res, session);
				break;
			case A_RT_ACC_TELLER_MSG :
				procActionTellerMessages(user, req, res, session);
				break;
			case A_SV_BASIC :
				procActionSVBasic(user, req, res, session);
				break;
			case A_RT_ENTER_NEW :
				procActionRTEnterNew(user, req, res, session);
				break;
			case A_SV_ENTER_NEW :
				procActionSVEnterNew(user, req, res, session);
				break;
			case A_CP_ENTER_NEW :
				procActionCPEnterNew(user, req, res, session);
				break;
			case A_RT_ENTER_MAINT :
				procActionEnterMaint(user, req, res, session);
				break;
			case A_SV_ENTER_MAINT :
				procActionEnterSVMaint(user, req, res, session);
				break;
			case A_SV_SCHED_LIST :
				procListSavingsPlan(user, req, res, session);
				break;
			case A_SV_SCHED_LIST_INQ :
				procListSavingsPlanInq(user, req, res, session);
				break;	
			case R_PDF :
				PDFSavingsPlanInq(user, req, res, session);
				break;	
			case A_CP_ENTER_MAINT :
				procActionEnterCPMaint(user, req, res, session);
				break;
			case A_RT_ENTER_INQUIRY :
			case A_SV_ENTER_INQUIRY :
			case A_CP_ENTER_INQUIRY :
				procActionEnterInquiry(user, req, res, session);
				break;
			case A_RT_ENTER_PRINT :
			case A_SV_ENTER_PRINT :
			case A_CP_ENTER_PRINT :
				procActionEnterPrint(user, req, res, session);
				break;
			default :
				forward(devPage, req, res);
				break;
		}
	}

	protected void procReqSVEnterStatus(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession ses)
			throws ServletException, IOException {

		UserPos userPO = new UserPos();
		ses.setAttribute("error", new ELEERRMessage());
		ses.setAttribute("userPO", userPO);
		
		forward("EDD0000_enter_chg_sts.jsp", req, res);
	}


	private void procActionEnterPrint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD009002Message msgRT = (EDD009002Message) mp.getMessageRecord("EDD009002");
			msgRT.setH02USERID(user.getH01USR());
			msgRT.setH02PROGRM("EDD0000");
			msgRT.setH02TIMSYS(getTimeStamp());
			msgRT.setH02SCRCOD("01");
			msgRT.setH02OPECOD("0002");
			try {
				msgRT.setE02ACMACC(req.getParameter("E02ACMACC").trim());
			} catch (Exception e) {
				msgRT.setE02ACMACC("0");
			}

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD009002Message) mp.receiveMessageRecord("EDD009002");

			if (mp.hasError(msgError)) {
				if ("SV".equals(userPO.getOption())) {
					pageName = "EDD0000_sv_enter_print.jsp";
				} else if ("CP".equals(userPO.getOption())) {
					pageName = "EDD0000_cp_enter_print.jsp";
				} else {
					pageName = "EDD0000_rt_enter_print.jsp";
				}
			} else {
				userPO.setAccNum(msgRT.getE02ACMACC());
				pageName = "EDD0000_rt_finish.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtFinish", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	protected void procActionEnterInquiry(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD009001Message msgRT = (EDD009001Message) mp.getMessageRecord("EDD009001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDD0000");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0002");
			try {
				msgRT.setE01ACMACC(req.getParameter("E01ACMACC").trim());
			} catch (Exception e) {
				msgRT.setE01ACMACC("0");
			}

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD009001Message) mp.receiveMessageRecord("EDD009001");

			if (mp.hasError(msgError)) {
				if ("SV".equals(userPO.getOption())) {
					pageName = "EDD0000_sv_enter_inquiry.jsp";
				} else if ("CP".equals(userPO.getOption())) {
					pageName = "EDD0000_cp_enter_inquiry.jsp";
				} else {
					pageName = "EDD0000_rt_enter_inquiry.jsp";
				}
			} else {
				if ("04".equals(msgRT.getE01ACMACD())) {
					userPO.setOption("SV");
				} else if ("06".equals(msgRT.getE01ACMACD())) {
					userPO.setOption("CP");
				} else {
					userPO.setOption("RT");
				}
				userPO.setApplicationCode(msgRT.getE01ACMACD());
				userPO.setBank(msgRT.getE01ACMBNK());
				userPO.setAccNum(msgRT.getE01ACMACC());
				userPO.setIdentifier(msgRT.getE01ACMACC());
				userPO.setCusNum(msgRT.getE01ACMCUN());
				userPO.setHeader2(msgRT.getE01ACMCUN());
				userPO.setCurrency(msgRT.getE01ACMCCY());
				userPO.setHeader3(msgRT.getE01CUSNA1());
				userPO.setCusName(msgRT.getE01CUSNA1());
				userPO.setOfficer(msgRT.getE01ACMOFC() + " - " + msgRT.getE01DSCOFC());
				userPO.setHeader1(msgRT.getE01ACMPRO());
				userPO.setProdCode(msgRT.getE01ACMPRO());
				userPO.setCusType(msgRT.getH01FLGWK3());
				userPO.setHeader10(msgRT.getE01ACMATY());
				userPO.setType(msgRT.getE01ACMATY());
			    userPO.setHeader11(msgRT.getE01ACMACL());
				
				pageName = "EDD0000_rt_inq_balances.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtBalances", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	protected void procActionEnterCPMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000001Message msgRT = (EDD000001Message) mp.getMessageRecord("EDD000001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDD0000");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01FLGWK1("S");
			msgRT.setH01OPECOD("0002");
			try {
				msgRT.setE01ACMACC(req.getParameter("E01ACMACC").trim());
			} catch (Exception e) {
				msgRT.setE01ACMACC("0");
			}

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000001Message) mp.receiveMessageRecord("EDD000001");

			if (mp.hasError(msgError)) {
				pageName = "EDD0000_cp_enter_maint.jsp";
			} else {
				userPO.setOption("CP");
				userPO.setApplicationCode(msgRT.getE01ACMACD());
				userPO.setBank(msgRT.getE01ACMBNK());
				userPO.setAccNum(msgRT.getE01ACMACC());
				userPO.setIdentifier(msgRT.getE01ACMACC());
				userPO.setCusNum(msgRT.getE01ACMCUN());
				userPO.setHeader2(msgRT.getE01ACMCUN());
				userPO.setCurrency(msgRT.getE01ACMCCY());
				userPO.setHeader3(msgRT.getE01CUSNA1());
				userPO.setCusName(msgRT.getE01CUSNA1());
				userPO.setHeader1(msgRT.getE01ACMPRO());
				userPO.setProdCode(msgRT.getE01ACMPRO());
				userPO.setType(msgRT.getE01ACMATY());
				
				pageName = "EDD0000_cp_basic.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cpBasic", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	protected void procActionEnterSVMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000001Message msgRT = (EDD000001Message) mp.getMessageRecord("EDD000001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDD0000");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01FLGWK1("S");
			msgRT.setH01OPECOD("0002");
			try {
				msgRT.setE01ACMACC(req.getParameter("E01ACMACC").trim());
			} catch (Exception e) {
				msgRT.setE01ACMACC("0");
			}

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000001Message) mp.receiveMessageRecord("EDD000001");

			if (mp.hasError(msgError)) {
				pageName = "EDD0000_sv_enter_maint.jsp";
			} else {
				userPO.setOption("SV");
				userPO.setApplicationCode(msgRT.getE01ACMACD());
				userPO.setBank(msgRT.getE01ACMBNK());
				userPO.setAccNum(msgRT.getE01ACMACC());
				userPO.setIdentifier(msgRT.getE01ACMACC());
				userPO.setCusNum(msgRT.getE01ACMCUN());
				userPO.setHeader2(msgRT.getE01ACMCUN());
				userPO.setCurrency(msgRT.getE01ACMCCY());
				userPO.setHeader3(msgRT.getE01CUSNA1());
				userPO.setCusName(msgRT.getE01CUSNA1());
				userPO.setHeader1(msgRT.getE01ACMPRO());
				userPO.setProdCode(msgRT.getE01ACMPRO());
				userPO.setType(msgRT.getE01ACMATY());
				
				pageName = "EDD0000_sv_basic.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("svBasic", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	protected void procListSavingsPlan(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {

		UserPos userPO = getUserPos(session);
		String pageName = "";

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		ELEERRMessage msgError = null;
		EDD000007Message msgSearch = null;
		EDD000007Message msgList = null;
		EDD000007Message msgHeader= null;
		JBList beanList = null;
		ESS0030DSMessage msgUser = null;
		msgUser = (ESS0030DSMessage) session.getAttribute("currUser");

		userPO = (datapro.eibs.beans.UserPos) session.getAttribute("userPO");

		// Send Initial data
		try {
			mp = getMessageProcessor("EDD0000", req);
			msgSearch = (EDD000007Message) mp.getMessageRecord("EDD000007");
			msgSearch.setH07USERID(user.getH01USR());
			msgSearch.setH07PROGRM("EDD0000");
			msgSearch.setH07TIMSYS(getTimeStamp());
			msgSearch.setH07OPECOD("0015");
			msgSearch.setH07SCRCOD("01");
		 	
		 	
			try {
				msgSearch.setE07ACMACC(userPO.getIdentifier());
			} catch (Exception e) {
				flexLog("E07ACMACC");
			}

			msgSearch.send();
			msgSearch.destroy();
			msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDD0000_cp_enter_maint.jsp", req, res);
			}else {
				msgHeader = (EDD000007Message) mp.receiveMessageRecord("EDD000007");
			}
	
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Message
		try {
			
			if (mp.hasError(msgError)) {
				pageName = "EDD0000_cp_enter_maint.jsp";
			} else {

				try {
					beanList = new datapro.eibs.beans.JBList();

				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				boolean firstTime = true;
				String marker = "";
				String myFlag = "";
				StringBuffer myRow = null;
				String chk = "";
				String wkstr="";
				while (true) {

					msgList = (EDD000007Message) mp.receiveMessageRecord("EDD000007");					
					//msgList = (EDD000007Message) newmessage;

					marker = msgList.getH07FLGMAS();

					if (marker.equals("*")) {
						wkstr = "";
						userPO.setHeader13(msgList.getE07TOTACO().trim());
						userPO.setHeader14(msgList.getE07TOTCUM().trim());
						userPO.setHeader15(msgList.getE07TOTDIF().trim());
						if(msgList.getE07AHPFL1().equals("C"))
							wkstr = "CUMPLE";
						else if(msgList.getE07AHPFL1().equals("I"))
							wkstr = "INCUMPLE";
						else if(msgList.getE07AHPFL1().equals("S"))
							wkstr = "SUPERA CUMPLIMIENTO";
						else if(msgList.getE07AHPFL1().equals(""))
							wkstr = "PENDIENTE";
						userPO.setHeader12(wkstr.trim());

						beanList.setShowNext(false);
						break;
					} else {
						if (firstTime) {
							firstTime = false;
							userPO.setHeader16(msgList.getE07ACMCUN().trim());
							userPO.setHeader17(msgList.getE07CUSNA1().trim());
							userPO.setHeader18(msgList.getE07ACMPRO().trim());
							userPO.setHeader19(msgList.getE07CUSIDN().trim());
							userPO.setHeader20(msgList.getE07ACMOPD().trim());
							userPO.setHeader21(msgList.getE07ACMOPM().trim());
							userPO.setHeader22(msgList.getE07ACMOPY().trim());
							userPO.setHeader23(msgList.getE07ADECRI().trim());
							chk = "checked";
						} else {
							chk = "";
						}
						try {
							myRow = new StringBuffer("<TR>");
							myRow.append("<TD NOWRAP ALIGN=center width=\"10%\">"
									+ Util.formatCell(msgList.getE07AHPPNU())
									+ "</TD>");
							myRow.append("<TD NOWRAP ALIGN=CENTER width=\"10%\">"
								+ Util.formatCustomDate( user.getE01DTF(),
									msgList.getBigDecimalE07AHPPDM().intValue(),
									msgList.getBigDecimalE07AHPPDD().intValue(),
									msgList.getBigDecimalE07AHPPDY().intValue())
								+ "</TD>");
							myRow.append("<TD NOWRAP ALIGN=center width=\"20%\">"
								+ Util.formatCell(msgList.getE07AHPPPM())
								+ "</TD>");
							myRow.append("<TD NOWRAP ALIGN=center width=\"20%\">"
								+ Util.formatCell(msgList.getE07AHPPPD())
								+ "</TD>");
							myRow.append("<TD NOWRAP ALIGN=center width=\"20%\">"
								+ Util.formatCell(msgList.getE07AHPBAP())
								+ "</TD>");
							
							if(msgList.getE07AHPFL1().equals("C"))
								wkstr = "CUMPLE";
							else if(msgList.getE07AHPFL1().equals("I"))
								wkstr = "INCUMPLE";
							else if(msgList.getE07AHPFL1().equals("S"))
								wkstr = "SUPERA CUMPLIMIENTO";
							else if(msgList.getE07AHPFL1().equals(""))
								wkstr = "PENDIENTE";
							
							myRow.append("<TD NOWRAP ALIGN=center width=\"20%\">"
									+ Util.formatCell(wkstr)
									+ "</TD>");
							myRow.append("</TR>");
							beanList.addRow(myFlag, myRow.toString());
						} catch (Exception e) {
							flexLog("Row Failed");
						}

					}
				}

				flexLog("Putting java beans into the session");
				session.setAttribute("msgHeader", msgHeader);
				session.setAttribute("savList", beanList);

				pageName = "EDD0000_sv_sched_plan.jsp";				

				forward(pageName, req, res);
				

			}
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}


	
	/**
	 * This method was created in VisualAge.
	 */
	protected void procListSavingsPlanInq(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {

		UserPos userPO = getUserPos(session);
		String pageName = "";

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		ELEERRMessage msgError = null;
		EDD000007Message msgHeader = null;
		EDD000007Message msgSearch = null;
		EDD000007Message msgList = null;
		JBList beanList = null;
		ESS0030DSMessage msgUser = null;
		msgUser = (ESS0030DSMessage) session.getAttribute("currUser");

		userPO = (datapro.eibs.beans.UserPos) session.getAttribute("userPO");

		// Send Initial data
		try {
			mp = getMessageProcessor("EDD0000", req);
			msgSearch = (EDD000007Message) mp.getMessageRecord("EDD000007");
			msgSearch.setH07USERID(user.getH01USR());
			msgSearch.setH07PROGRM("EDD0000");
			msgSearch.setH07TIMSYS(getTimeStamp());
			msgSearch.setH07OPECOD("0015");
			msgSearch.setH07SCRCOD("02");
		 	
		 	
			try {
				msgSearch.setE07ACMACC(userPO.getIdentifier());
			} catch (Exception e) {
				flexLog("E07ACMACC");
			}

			msgSearch.send();
			msgSearch.destroy();
			msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDD0000_cp_enter_maint.jsp", req, res);
			}else {
				msgHeader = (EDD000007Message) mp.receiveMessageRecord("EDD000007");
			}
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Message
		try {
			
			if (mp.hasError(msgError)) {
				pageName = "EDD0000_cp_enter_maint.jsp";
			} else {

				try {
					beanList = new datapro.eibs.beans.JBList();

				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				boolean firstTime = true;
				String marker = "";
				String myFlag = "";
				StringBuffer myRow = null;
				String chk = "";
				String wkstr = "";
				while (true) {

					msgList = (EDD000007Message) mp.receiveMessageRecord("EDD000007");					
					//msgList = (EDD000007Message) newmessage;

					marker = msgList.getH07FLGMAS();

					if (marker.equals("*")) {
						wkstr = "";
						userPO.setHeader13(msgList.getE07TOTACO().trim());
						userPO.setHeader14(msgList.getE07TOTCUM().trim());
						userPO.setHeader15(msgList.getE07TOTDIF().trim());
						if(msgList.getE07AHPFL1().equals("C"))
							wkstr = "CUMPLE";
						else if(msgList.getE07AHPFL1().equals("I"))
							wkstr = "INCUMPLE";
						else if(msgList.getE07AHPFL1().equals("S"))
							wkstr = "SUPERA CUMPLIMIENTO";
						else if(msgList.getE07AHPFL1().equals(""))
							wkstr = "PENDIENTE";
						userPO.setHeader12(wkstr.trim());
						
						beanList.setShowNext(false);
						break;
					} else {
						if (firstTime) {
							firstTime = false;
							userPO.setHeader16(msgList.getE07ACMCUN().trim());
							userPO.setHeader17(msgList.getE07CUSNA1().trim());
							userPO.setHeader18(msgList.getE07ACMPRO().trim());
							userPO.setHeader19(msgList.getE07CUSIDN().trim());
							userPO.setHeader20(msgList.getE07ACMOPD().trim());
							userPO.setHeader21(msgList.getE07ACMOPM().trim());
							userPO.setHeader22(msgList.getE07ACMOPY().trim());
							userPO.setHeader23(msgList.getE07ADECRI().trim());
							chk = "checked";
						} else {
							chk = "";
						}
						try {
							
							myRow = new StringBuffer("<TR>");
							myRow.append("<TD NOWRAP ALIGN=center width=\"10%\">"
									+ Util.formatCell(msgList.getE07AHPPNU())
									+ "</TD>");
							myRow.append("<TD NOWRAP ALIGN=CENTER width=\"10%\">"
								+ Util.formatCustomDate( user.getE01DTF(),
									msgList.getBigDecimalE07AHPPDM().intValue(),
									msgList.getBigDecimalE07AHPPDD().intValue(),
									msgList.getBigDecimalE07AHPPDY().intValue())
								+ "</TD>");
							myRow.append("<TD NOWRAP ALIGN=center width=\"20%\">"
								+ Util.formatCell(msgList.getE07AHPPPM())
								+ "</TD>");
							myRow.append("<TD NOWRAP ALIGN=center width=\"20%\">"
								+ Util.formatCell(msgList.getE07AHPPPD())
								+ "</TD>");
							myRow.append("<TD NOWRAP ALIGN=center width=\"20%\">"
								+ Util.formatCell(msgList.getE07AHPBAP())
								+ "</TD>");
							
							if(msgList.getE07AHPFL1().equals("C"))
								wkstr = "CUMPLE";
							else if(msgList.getE07AHPFL1().equals("I"))
								wkstr = "INCUMPLE";
							else if(msgList.getE07AHPFL1().equals("S"))
								wkstr = "SUPERA CUMPLIMIENTO";
							else if(msgList.getE07AHPFL1().equals(""))
								wkstr = "PENDIENTE";
							
							myRow.append("<TD NOWRAP ALIGN=center width=\"20%\">"
									+ Util.formatCell(wkstr)
									+ "</TD>");
							myRow.append("</TR>");
							beanList.addRow(myFlag, myRow.toString());
						} catch (Exception e) {
							flexLog("Row Failed");
						}

					}
				}

				flexLog("Putting java beans into the session");
				session.setAttribute("savList", beanList);

				pageName = "EDD0000_sv_sched_plan.jsp";				

				forward(pageName, req, res);
				

			}
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}

	protected void PDFSavingsPlanInq(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session)
		throws ServletException, IOException {

		float BLACK = 0.0f;
		float LITEGRAY = 0.9f;
		float DARKGRAY = 0.7f;
		float WHITE = 1.0f;
		
		UserPos userPO = getUserPos(session);
		String pageName = "";

		MessageProcessor mp = null;
		MessageRecord newmessage = null;
		ELEERRMessage msgError = null;
		EDD000007Message msgHeader = null;
		EDD000007Message msgSearch = null;
		EDD000007Message msgList = null;
		JBList beanList = null;
		ESS0030DSMessage msgUser = null;
		msgUser = (ESS0030DSMessage) session.getAttribute("currUser");

		userPO = (datapro.eibs.beans.UserPos) session.getAttribute("userPO");

		// Send Initial data
		try {
			mp = getMessageProcessor("EDD0000", req);
			msgSearch = (EDD000007Message) mp.getMessageRecord("EDD000007");
			msgSearch.setH07USERID(user.getH01USR());
			msgSearch.setH07PROGRM("EDD0000");
			msgSearch.setH07TIMSYS(getTimeStamp());
			msgSearch.setH07OPECOD("0015");
			try {
				msgSearch.setH07SCRCOD(req.getParameter("mod").toString().trim());
			} catch (Exception e) {
				msgSearch.setH07SCRCOD("02");
			}
			
			try {
				msgSearch.setE07ACMACC(userPO.getIdentifier());
			} catch (Exception e) {
				flexLog("E07ACMACC");
			}

			msgSearch.send();
			msgSearch.destroy();
			msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDD0000_cp_enter_maint.jsp", req, res);
			}else {
				msgHeader = (EDD000007Message) mp.receiveMessageRecord("EDD000007");
			}
				
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

		// Receive Message
		try {
			
			if (mp.hasError(msgError)) {
				pageName = "EDD0000_cp_enter_maint.jsp";
			} else {
				
				String title = "";

				String header01 = "";
				String header02 = "";
				String header021= "";
				String header022= "";
				String header03 = "";
				String header04 = "";
				String header05 = "";
				String header06 = "";
				String header07 = "";
				String header08 = "";
				String header09 = "";
				String header10 = "";
				String header11 = "";
				String header12 = "";
				String header13 = "";
				String header14="";

				String detail1 = "";
				String detail2 = "";
				String detail3 = "";
				String detail4 = "";
				String detail5 = "";
				String detail6 = "";
				String detail7 = "";
				String detail8 = "";

				String footer0 = "";
				String footer1 = "";
				String footer2 = "";
				String footer3 = "";

				String page = "";
				String cuscun = "";
				String accnum = "";
				String name = "";
				String add = "";
				String add1 = "";
				String add2 = "";
				String pro = "";
				String ccy = "";
				String bal = "";
				String uncol = "";
				String hold = "";
				String climit = "";
				String avabal = "";
				String grobal = "";
				String purAcc = "";
				String dd1 = "";
				String dd2 = "";
				String dd3 = "";
				String creator = "";
				
				int j = 0;
				int countDebit = 0;
				int countCredit = 0;
				BigDecimal debit = new BigDecimal("0.00");
				BigDecimal credit = new BigDecimal("0.00");
				String dit11 = "";
				String dit21 = "";
				String dit31 = "";
				String dit41 = "";
				String dit51 = "";
				String dit61 = "";
				
				String E01NUTIBMS = "";
				String E01SUITBMS = "";
				
				int NumColumns = 6;
				PdfPTable datatable = new PdfPTable(NumColumns);
				Document doc = null;
				Table table = null;
				Cell cell = null;
				Font normalFont = null;
				Font headerBoldFont = null;
				Paragraph TITLE = null;
				Paragraph BLANK = null;
				PdfWriter docWriter = null;
				ByteArrayOutputStream baosPDF = null;
				
				Hashtable ht = null;

				

				try {
					beanList = new datapro.eibs.beans.JBList();

				} catch (Exception ex) {
					flexLog("Error: " + ex);
				}

				boolean firstTime = true;
				String marker = "";
				String myFlag = "";
				StringBuffer myRow = null;
				String chk = "";
				String wkstr = "";
				while (true) {

					msgList = (EDD000007Message) mp.receiveMessageRecord("EDD000007");					
					
					marker = msgList.getH07FLGMAS();

					if (marker.equals("*")) {
						
						datatable.setComplete(true);
						try{
							doc.add(datatable);
						}catch(NullPointerException e){
							e.printStackTrace();
							flexLog("Error: " + e);
							break;
						}
						table = new Table(1, 1);
						table.setBorderWidth(0);
						table.setCellsFitPage(true);
						table.setPadding(1);
						table.setSpacing(1);
						table.setWidth(100);

						cell = new Cell(BLANK);
						cell.setHorizontalAlignment(Element.ALIGN_LEFT);
						cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
						cell.setBorder(Rectangle.NO_BORDER);
						table.addCell(cell);

						doc.add(table);

						
						wkstr = "";
						if(msgList.getE07AHPFL1().equals("C"))
							wkstr = "CUMPLE";
						else if(msgList.getE07AHPFL1().equals("I"))
							wkstr = "INCUMPLE";
						else if(msgList.getE07AHPFL1().equals("S"))
							wkstr = "SUPERA CUMPLIMIENTO";
						else if(msgList.getE07AHPFL1().equals(""))
							wkstr = "PENDIENTE";
						
						NumColumns = 4;
						datatable = new PdfPTable(NumColumns);

						datatable.getDefaultCell().setPadding(3);
						datatable.getDefaultCell().setGrayFill(DARKGRAY);

						int headerwidths2[] = { 25, 25, 25,25 }; // percentage
						datatable.setWidths(headerwidths2);
						datatable.setWidthPercentage(100); // percentage

						datatable.getDefaultCell().setBorderWidth(1);
						datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
						datatable.addCell(new Paragraph(footer0, headerBoldFont));
						datatable.addCell(new Paragraph(footer1, headerBoldFont));
						datatable.addCell(new Paragraph(footer2, headerBoldFont));
						datatable.addCell(new Paragraph(footer3, headerBoldFont));

						datatable.setHeaderRows(1); // this is the end of the table header

						datatable.getDefaultCell().setGrayFill(WHITE);
						datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
						datatable.addCell(msgList.getE07TOTACO().trim());
						datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
						datatable.addCell(msgList.getE07TOTCUM().trim());
						datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
						datatable.addCell(msgList.getE07TOTDIF());
						datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
						datatable.addCell(wkstr);

						doc.add(datatable);
						
						if (doc != null) doc.close();
						if (docWriter != null) docWriter.close();
						
							StringBuffer sbFilename = new StringBuffer();
							String fn = com.datapro.generic.tool.Util.getTimestamp().toString();
							fn = Util.replace(fn,":", "-");
							fn = Util.replace(fn,".", "-");
							sbFilename.append(fn);
							sbFilename.append(".pdf");
							
							res.setHeader("Cache-Control", "max-age=30");
							res.setContentType("application/pdf");

							StringBuffer sbContentDispValue = new StringBuffer();
							sbContentDispValue.append("inline");
							sbContentDispValue.append("; filename=");
							sbContentDispValue.append(sbFilename);
							
							res.setHeader("Content-disposition", sbContentDispValue.toString());
							res.setContentLength(baosPDF.size());

							ServletOutputStream sos = res.getOutputStream();
							baosPDF.writeTo(sos);
							sos.flush();
						
						beanList.setShowNext(false);
						break;
					} else {
						if (firstTime) {
							firstTime = false;
							cuscun = msgList.getE07ACMCUN();
							accnum = msgList.getE07ACMACC();
							name = Util.unformatHTML(msgList.getE07CUSNA1().trim());
							pro = Util.unformatHTML(msgList.getE07ACMPRO().trim());
							add = Util.unformatHTML(msgList.getE07CUSIDN().trim());
							add1 = Util.unformatHTML(msgList.getE07ACMOPD().trim() 
									+ "/" +msgList.getE07ACMOPM().trim()+"/"+msgList.getE07ACMOPY().trim());
							add2 = Util.unformatHTML(msgList.getE07ADECRI().trim());
							creator = msgList.getE07ACMACC();
							ht = formatInterestTable(msgList);
							
							chk = "checked";
							//
							title = "Plan de Ahorro Programado";

							header01 = "Cuenta";
							header02 = "Cliente"; // Nombre
							header021= "      ";  // Nombre Cuenta
							header022= "      ";  // Nombre Cuenta
							header03 = "      ";  // Direccion
							header04 = "Producto";
							header05 = "Saldo Global";
							header06 = "Saldo";
							header07 = "Saldo Diferido";
							header08 = "Monto Retenido";
							header09 = "Limite de Credito";
							header10 = "Detalle";
							header11 = "Promedio Global";
							//header12 = "Saldo a la Fecha";
							header13 = "Proposito de la Cuenta";
							header14 = "Sucursal";

							detail1 = "Nro. Cuota";
							detail2 = "Fecha Corte";
							detail3 = "Monto Ahorro";
							detail4 = "Monto Consignado";
							detail5 = "Diferencia";
							detail6 = "Observaciones";
							detail7 = "Monto";
							detail8 = "Tasa";

							footer0 = "Total Ahorro";
							footer1 = "Total Consignado";
							footer2 = "Total Diferencia";
							footer3 = "Observaciones";

							page = "Numero de Pagina: ";
							
							String baldat = dd1 + "/" + dd2 + "/" + dd3;
							doc = new Document(PageSize.LETTER, 36, 36, 36, 36);
							
							baosPDF = new ByteArrayOutputStream();
							
							try {
								docWriter = PdfWriter.getInstance(doc, baosPDF);

								doc.addAuthor("eIBS");
								doc.addCreationDate();
								doc.addProducer();
								doc.addCreator(creator);
								if(msgHeader.getH07SCRCOD().equals("01"))
									title +=" - Mantenimiento";
								else
									title +=" - Consulta";
								doc.addTitle(title);
								doc.addKeywords("pdf, itext, Java, open source, http");
								Font actFont = null;
								Font disFont = null;
								Font othFont = null;
								actFont = FontFactory.getFont(FontFactory.HELVETICA, 9, Font.BOLD, Color.BLUE);
								disFont = FontFactory.getFont(FontFactory.HELVETICA, 9, Font.BOLD, Color.RED);
								othFont = FontFactory.getFont(FontFactory.HELVETICA, 9, Font.BOLD);
								normalFont = FontFactory.getFont(FontFactory.HELVETICA, 8, Font.NORMAL);
								headerBoldFont = FontFactory.getFont(FontFactory.HELVETICA, 10, Font.BOLD);
								
								TITLE = new Paragraph(title, headerBoldFont);

								BLANK = new Paragraph("", headerBoldFont);

								HeaderFooter header = new HeaderFooter(TITLE, false);
								header.setBorder(Rectangle.NO_BORDER);
								header.setAlignment(Element.ALIGN_CENTER);
								doc.setHeader(header);

								HeaderFooter footer = new HeaderFooter(new Phrase(page), true);
								footer.setBorder(Rectangle.TOP);
								footer.setAlignment(Element.ALIGN_RIGHT);
								doc.setFooter(footer);

								doc.open();

								table = new Table(2, 7);
								table.setBorderWidth(0);
								table.setCellsFitPage(true);
								table.setPadding(1);
								table.setSpacing(1);
								table.setWidth(100);
								
								cell = new Cell(new Paragraph("Cliente ", othFont));
								cell.setHorizontalAlignment(Element.ALIGN_LEFT);
								cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
								cell.setBorder(Rectangle.NO_BORDER);
								table.addCell(cell);

								cell = new Cell(BLANK);
								cell.setHorizontalAlignment(Element.ALIGN_LEFT);
								cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
								cell.setBorder(Rectangle.NO_BORDER);
								table.addCell(cell);
								
								cell = new Cell(new Paragraph("        " + cuscun+
										"  "+add+"  "+name, normalFont));
								cell.setHorizontalAlignment(Element.ALIGN_LEFT);
								cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
								cell.setBorder(Rectangle.NO_BORDER);
								table.addCell(cell);

								cell = new Cell(BLANK);
								cell.setHorizontalAlignment(Element.ALIGN_LEFT);
								cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
								cell.setBorder(Rectangle.NO_BORDER);
								table.addCell(cell);

								
								cell = new Cell(new Paragraph("Cuenta ", othFont));
								cell.setHorizontalAlignment(Element.ALIGN_LEFT);
								cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
								cell.setBorder(Rectangle.NO_BORDER);
								table.addCell(cell);
	
								cell = new Cell(BLANK);
								cell.setHorizontalAlignment(Element.ALIGN_LEFT);
								cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
								cell.setBorder(Rectangle.NO_BORDER);
								table.addCell(cell);

								dit21 = Util.unformatHTML(msgList.getE07ACMOPD().trim() 
										+ "/" +msgList.getE07ACMOPM().trim()+"/"+msgList.getE07ACMOPY().trim());
								cell = new Cell(new Paragraph("       " + accnum +
										"  "+add2+" / Fecha de apertura: "+dit21, normalFont));
								cell.setHorizontalAlignment(Element.ALIGN_LEFT);
								cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
								cell.setBorder(Rectangle.NO_BORDER);
								table.addCell(cell);

								cell = new Cell(BLANK);
								cell.setHorizontalAlignment(Element.ALIGN_LEFT);
								cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
								cell.setBorder(Rectangle.NO_BORDER);
								table.addCell(cell);
								
								cell = new Cell(BLANK);
								cell.setHorizontalAlignment(Element.ALIGN_LEFT);
								cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
								cell.setBorder(Rectangle.NO_BORDER);
								table.addCell(cell);
								
								String acasts = "";
								if(msgList.getH07FLGWK1().equals("1"))
									cell = new Cell(new Paragraph("Vigente", actFont));
								else if(msgList.getH07FLGWK1().equals("2"))
									cell = new Cell(new Paragraph("No Vigente", disFont));
								else if(msgList.getH07FLGWK1().equals("3"))
									cell = new Cell(new Paragraph("Vencido", disFont));
								
								cell.setHorizontalAlignment(Element.ALIGN_LEFT);
								cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
								cell.setBorder(Rectangle.NO_BORDER);
								table.addCell(cell);

								cell = new Cell(BLANK);
								cell.setHorizontalAlignment(Element.ALIGN_LEFT);
								cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
								cell.setBorder(Rectangle.NO_BORDER);
								table.addCell(cell);
								cell = new Cell(BLANK);
								cell.setHorizontalAlignment(Element.ALIGN_LEFT);
								cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
								cell.setBorder(Rectangle.NO_BORDER);
								table.addCell(cell);


								cell = new Cell(new Paragraph(header14 + " " + user.getE01UBR(), othFont));
								cell.setHorizontalAlignment(Element.ALIGN_LEFT);
								cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
								cell.setBorder(Rectangle.NO_BORDER);
								table.addCell(cell);

								doc.add(table);
								
								table = new Table(1, 1);
								table.setBorderWidth(0);
								table.setCellsFitPage(true);
								table.setPadding(1);
								table.setSpacing(1);
								table.setWidth(100);

								cell = new Cell(BLANK);
								cell.setHorizontalAlignment(Element.ALIGN_LEFT);
								cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
								cell.setBorder(Rectangle.NO_BORDER);
								table.addCell(cell);

								doc.add(table);

								datatable.setComplete(false);

								datatable.getDefaultCell().setPadding(3);
								int headerwidths[] = { 10, 14, 20, 20, 20, 35 }; // percentage
								datatable.setWidths(headerwidths);
								datatable.setWidthPercentage(100); // percentage

								datatable.getDefaultCell().setBorderWidth(1);
								datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
								datatable.getDefaultCell().setGrayFill(DARKGRAY);
								datatable.addCell(new Paragraph(detail1, headerBoldFont));
								datatable.addCell(new Paragraph(detail2, headerBoldFont));
								datatable.addCell(new Paragraph(detail3, headerBoldFont));
								datatable.addCell(new Paragraph(detail4, headerBoldFont));
								datatable.addCell(new Paragraph(detail5, headerBoldFont));
								datatable.addCell(new Paragraph(detail6, headerBoldFont));

								datatable.setHeaderRows(1); // this is the end of the table header

								datatable.getDefaultCell().setBorderWidth(1);

							} catch (DocumentException dex) {
							}
							//
						} else {
							chk = "";
						}
						try {
							//DETALLE
							if(msgList.getE07AHPFL1().equals("C"))
								wkstr = "CUMPLE";
							else if(msgList.getE07AHPFL1().equals("I"))
								wkstr = "INCUMPLE";
							else if(msgList.getE07AHPFL1().equals("S"))
								wkstr = "SUPERA CUMPLIMIENTO";
							else if(msgList.getE07AHPFL1().equals(""))
								wkstr = "PENDIENTE";
							
							j++;
							if (j % 2 == 1) {
								datatable.getDefaultCell().setGrayFill(WHITE);
							} else {
								datatable.getDefaultCell().setGrayFill(LITEGRAY);
							}
							dit11 = msgList.getE07AHPPNU();
							dit21 = Util.unformatHTML(msgList.getE07AHPPDD().trim() 
									+ "/" +msgList.getE07AHPPDM().trim()+"/"+msgList.getE07AHPPDY().trim());
							dit31 = msgList.getE07AHPPPM();
							dit41 = msgList.getE07AHPPPD();
							dit51 = msgList.getE07AHPBAP();;
							dit61 = wkstr; // Observaciones

							datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
							datatable.addCell(new Paragraph(dit11, normalFont));
							datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
							datatable.addCell(new Paragraph(dit21, normalFont));
							datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
							datatable.addCell(new Paragraph(dit31, normalFont));
							datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_RIGHT);
							datatable.addCell(new Paragraph(dit41, normalFont));
							datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_RIGHT);
							datatable.addCell(new Paragraph(dit51, normalFont));
							datatable.getDefaultCell().setHorizontalAlignment(Element.ALIGN_RIGHT);
							datatable.addCell(new Paragraph(dit61, normalFont));
							if (j % 100 == 0) {
								doc.add(datatable);
							}
						} catch (Exception e) {
							flexLog("Row Failed");
						}
					}
				}
							}
		} catch (Exception e) {
			e.printStackTrace();
			flexLog("Error: " + e);
			throw new RuntimeException("Socket Communication Error");
		}

	}

	
	
	
	protected void procActionEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000001Message msgRT = (EDD000001Message) mp.getMessageRecord("EDD000001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDD0000");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01FLGWK1("R");
			msgRT.setH01OPECOD("0002");
			try {
				msgRT.setE01ACMACC(req.getParameter("E01ACMACC").trim());
			} catch (Exception e) {
				msgRT.setE01ACMACC("0");
			}

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000001Message) mp.receiveMessageRecord("EDD000001");

			if (mp.hasError(msgError)) {
				if ("SV".equals(userPO.getOption())) {
					pageName = "EDD0000_sv_enter_maint.jsp";
				} else if ("CP".equals(userPO.getOption())) {
					pageName = "EDD0000_cp_enter_maint.jsp";
				} else {
					pageName = "EDD0000_rt_enter_maint.jsp";
				}
			} else {
				userPO.setApplicationCode(msgRT.getE01ACMACD());
				userPO.setBank(msgRT.getE01ACMBNK());
				userPO.setAccNum(msgRT.getE01ACMACC());
				userPO.setIdentifier(msgRT.getE01ACMACC());
				userPO.setCusNum(msgRT.getE01ACMCUN());
				userPO.setHeader2(msgRT.getE01ACMCUN());
				userPO.setCurrency(msgRT.getE01ACMCCY());
				userPO.setHeader3(msgRT.getE01CUSNA1());
				userPO.setCusName(msgRT.getE01CUSNA1());
				userPO.setHeader1(msgRT.getE01ACMPRO());
				userPO.setProdCode(msgRT.getE01ACMPRO());
				userPO.setType(msgRT.getE01ACMATY());
				userPO.setCusType(msgRT.getH01FLGWK3());
								
				if ("04".equals(msgRT.getE01ACMACD())) {
					userPO.setOption("SV");
					session.setAttribute("svBasic", msgRT);
					pageName = "EDD0000_sv_basic.jsp";
				} else if ("06".equals(msgRT.getE01ACMACD())) {	
					userPO.setOption("CP");
					session.setAttribute("cpBasic", msgRT);
					pageName = "EDD0000_cp_basic.jsp";
				} else {
					userPO.setOption("RT");
					session.setAttribute("rtBasic", msgRT);
					pageName = "EDD0000_rt_basic.jsp";
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procActionCPEnterNew(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000001Message msgRT = (EDD000001Message) mp.getMessageRecord("EDD000001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDD0000");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0001");
			try {
				msgRT.setE01ACMPRO(req.getParameter("E01ACMPRO").trim());
			} catch (Exception e) {
			}
			try {
				msgRT.setE01ACMACC(req.getParameter("E01ACMACC").trim());
			} catch (Exception e) {
			}
			try {
				msgRT.setE01OFFAC1(req.getParameter("E01OFFAC1").trim());
			} catch (Exception e) {
			}
			try {
				msgRT.setE01OFFAM1(req.getParameter("E01ACMAMT").trim());
				msgRT.setH01FLGWK3("T");
			} catch (Exception e) {
			}

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000001Message) mp.receiveMessageRecord("EDD000001");

			userPO.setApplicationCode(msgRT.getE01ACMACD());
			userPO.setBank(msgRT.getE01ACMBNK());
			userPO.setAccNum(msgRT.getE01ACMACC());
			userPO.setIdentifier(msgRT.getE01ACMACC());
			userPO.setCusNum(msgRT.getE01ACMCUN());
			userPO.setHeader2(msgRT.getE01ACMCUN());
			userPO.setCurrency(msgRT.getE01ACMCCY());
			userPO.setHeader3(msgRT.getE01CUSNA1());
			userPO.setCusName(msgRT.getE01CUSNA1());
			userPO.setHeader1(msgRT.getE01ACMPRO());
			userPO.setProdCode(msgRT.getE01ACMPRO());
			userPO.setType(msgRT.getE01ACMATY());
			userPO.setHeader4("N");
			
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cpBasic", msgRT);
			
			if (mp.hasError(msgError)) {
				String firstLink =
					webAppPath
						+ getLangPath(user)
						+ "ESD0711_products_detail.jsp" 
						+ (req.getParameter("appcode") == null ? "" : "?appcode=" + req.getParameter("appcode").trim())
						+ (req.getParameter("typecode") == null ? "" : "&typecode=" + req.getParameter("typecode").trim())
						+ (req.getParameter("generic") == null ? "" : "&generic=" + req.getParameter("generic").trim())
						+ (req.getParameter("title") == null ? "" : "&title=" + req.getParameter("title").trim())
						+ (req.getParameter("bank") == null ? "" : "&bank=" + req.getParameter("bank").trim());
				res.setContentType("text/html");
				PrintWriter out = res.getWriter();
				printProdFrame(out, firstLink, getLangPath(user));
			} else {
				forward("EDD0000_cp_new.jsp", req, res);
			}

		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqRTEnterChange(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("RT");
		userPO.setPurpose("MAINTENANCE");
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		
		forward("EDD0000_rt_enter_change.jsp", req, res);
	}
	

	protected void procReqSVEnterChange(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("SV");
		userPO.setPurpose("MAINTENANCE");
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		
		forward("EDD0000_rt_enter_change.jsp", req, res);
	}

	private void procActionSVEnterNew(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000001Message msgRT = (EDD000001Message) mp.getMessageRecord("EDD000001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDD0000");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0001");
			try {
				msgRT.setE01ACMPRO(req.getParameter("E01ACMPRO").trim());
			} catch (Exception e) {
			}
			try {
				msgRT.setE01ACMACC(req.getParameter("E01ACMACC").trim());
			} catch (Exception e) {
			}
			try {
				msgRT.setE01OFFAC1(req.getParameter("E01OFFAC1").trim());
			} catch (Exception e) {
			}
			try {
				msgRT.setE01OFFAM1(req.getParameter("E01ACMAMT").trim());
				msgRT.setH01FLGWK3("T");
			} catch (Exception e) {
			}

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000001Message) mp.receiveMessageRecord("EDD000001");

			userPO.setApplicationCode(msgRT.getE01ACMACD());
			userPO.setBank(msgRT.getE01ACMBNK());
			userPO.setAccNum(msgRT.getE01ACMACC());
			userPO.setIdentifier(msgRT.getE01ACMACC());
			userPO.setCusNum(msgRT.getE01ACMCUN());
			userPO.setHeader2(msgRT.getE01ACMCUN());
			userPO.setCurrency(msgRT.getE01ACMCCY());
			userPO.setHeader3(msgRT.getE01CUSNA1());
			userPO.setCusName(msgRT.getE01CUSNA1());
			userPO.setHeader1(msgRT.getE01ACMPRO());
			userPO.setProdCode(msgRT.getE01ACMPRO());
			userPO.setType(msgRT.getE01ACMATY());
			userPO.setHeader4("N");
			
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("svBasic", msgRT);
			
			if (mp.hasError(msgError)) {
				String firstLink =
					webAppPath
						+ getLangPath(user)
						+ "ESD0711_products_detail.jsp" 
						+ (req.getParameter("appcode") == null ? "" : "?appcode=" + req.getParameter("appcode").trim())
						+ (req.getParameter("typecode") == null ? "" : "&typecode=" + req.getParameter("typecode").trim())
						+ (req.getParameter("generic") == null ? "" : "&generic=" + req.getParameter("generic").trim())
						+ (req.getParameter("title") == null ? "" : "&title=" + req.getParameter("title").trim())
						+ (req.getParameter("bank") == null ? "" : "&bank=" + req.getParameter("bank").trim());
				res.setContentType("text/html");
				PrintWriter out = res.getWriter();
				printProdFrame(out, firstLink, getLangPath(user));
			} else {
				forward("EDD0000_sv_new.jsp", req, res);
			}

		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procActionRTEnterNew(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000001Message msgRT = (EDD000001Message) mp.getMessageRecord("EDD000001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDD0000");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0001");
			try {
				msgRT.setE01ACMPRO(req.getParameter("E01ACMPRO").trim());
			} catch (Exception e) {
				msgRT.setE01ACMPRO("");
			}
			try {
				msgRT.setE01ACMACC(req.getParameter("E01ACMACC").trim());
			} catch (Exception e) {
			}
			try {
				msgRT.setE01OFFAC1(req.getParameter("E01OFFAC1").trim());
			} catch (Exception e) {
			}
			try {
				msgRT.setE01OFFAM1(req.getParameter("E01ACMAMT").trim());
				msgRT.setH01FLGWK3("T");
			} catch (Exception e) {
			}

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000001Message) mp.receiveMessageRecord("EDD000001");

			userPO.setApplicationCode(msgRT.getE01ACMACD());
			userPO.setBank(msgRT.getE01ACMBNK());
			userPO.setAccNum(msgRT.getE01ACMACC());
			userPO.setIdentifier(msgRT.getE01ACMACC());
			userPO.setCusNum(msgRT.getE01ACMCUN());
			userPO.setHeader2(msgRT.getE01ACMCUN());
			userPO.setCurrency(msgRT.getE01ACMCCY());
			userPO.setHeader3(msgRT.getE01CUSNA1());
			userPO.setCusName(msgRT.getE01CUSNA1());
			userPO.setHeader1(msgRT.getE01ACMPRO());
			userPO.setProdCode(msgRT.getE01ACMPRO());
			userPO.setType(msgRT.getE01ACMATY());
			userPO.setHeader4("N");
			
			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtBasic", msgRT);
			
			if (mp.hasError(msgError)) {
				String firstLink =
					webAppPath
						+ getLangPath(user)
						+ "ESD0711_products_detail.jsp" 
						+ (req.getParameter("appcode") == null ? "" : "?appcode=" + req.getParameter("appcode").trim())
						+ (req.getParameter("typecode") == null ? "" : "&typecode=" + req.getParameter("typecode").trim())
						+ (req.getParameter("generic") == null ? "" : "&generic=" + req.getParameter("generic").trim())
						+ (req.getParameter("title") == null ? "" : "&title=" + req.getParameter("title").trim())
						+ (req.getParameter("bank") == null ? "" : "&bank=" + req.getParameter("bank").trim());
				res.setContentType("text/html");
				PrintWriter out = res.getWriter();
				printProdFrame(out, firstLink, getLangPath(user));
			} else {
				forward("EDD0000_rt_new.jsp", req, res);
			}

		} finally {
			if (mp != null)	mp.close();
		}
	}


	protected void procActionSVBasic(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000001Message msgRT = (EDD000001Message) session.getAttribute("svBasic");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDD0000");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0005");
		 	if ("Y".equals(req.getParameter("APPROVAL"))) msgRT.setH01OPECOD("0006");
		 	
		 	setMessageRecord(req, msgRT);

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			MessageRecord newmessage = mp.receiveMessageRecord();
			
			session.setAttribute("error", msgError);
			
			if (newmessage.getFormatName().equals("EFT000015")) {
				EFT000015Message msgFinish = (EFT000015Message) newmessage;
				userPO.setAccNum(msgFinish.getE15ACCNUM());
				
				session.setAttribute("rtFinish", msgFinish);
				session.setAttribute("userPO", userPO);
				
				forward("EDD0000_rt_confirm.jsp", req, res);
			} else if (newmessage.getFormatName().equals("EDD000001")) {
				msgRT = (EDD000001Message) newmessage;
				userPO.setApplicationCode(msgRT.getE01ACMACD());
				userPO.setBank(msgRT.getE01ACMBNK());
				userPO.setAccNum(msgRT.getE01ACMACC());
				userPO.setIdentifier(msgRT.getE01ACMACC());
				userPO.setCusNum(msgRT.getE01ACMCUN());
				userPO.setHeader2(msgRT.getE01ACMCUN());
				userPO.setCurrency(msgRT.getE01ACMCCY());
				userPO.setHeader3(msgRT.getE01CUSNA1());
				userPO.setCusName(msgRT.getE01CUSNA1());
				userPO.setHeader1(msgRT.getE01ACMPRO());
				userPO.setProdCode(msgRT.getE01ACMPRO());
				userPO.setType(msgRT.getE01ACMATY());
				
				session.setAttribute("svBasic", msgRT);
				session.setAttribute("userPO", userPO);
				
				if (mp.hasError(msgError)) {
					if ("NEW".equals(userPO.getPurpose())) {
						forward("EDD0000_sv_new.jsp", req, res);
					} else {
						forward("EDD0000_sv_basic.jsp", req, res);
					}
				} else {
					if ("MAINTENANCE".equals(userPO.getPurpose())) {
						forward("EDD0000_sv_enter_maint.jsp", req, res);
					} else if ("NEW".equals(userPO.getPurpose())) {
						res.sendRedirect(srctx + bgPage);
					}
				}
			}

		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procActionTellerMessages(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			ESD009001Message msgRT = (ESD009001Message) session.getAttribute("instructions");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDD0000");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0005");
			msgRT.setE01SPIACD("R4");
			
			setMessageRecord(req, msgRT);

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (ESD009001Message) mp.receiveMessageRecord("ESD009001");
			
			userPO.setAccNum(msgRT.getE01SPIACC());

			if (mp.hasError(msgError)) {
				pageName = "EDD0000_rt_teller_instructions.jsp";
			} else {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD0000_rt_basic.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD0000_sv_basic.jsp";
				} else {
					pageName = devPage;
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("instructions", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procActionAccountAnalysis(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000010Message msgRT = (EDD000010Message) session.getAttribute("accAnalysis");
			msgRT.setH10USERID(user.getH01USR());
			msgRT.setH10PROGRM("EDD0000");
			msgRT.setH10TIMSYS(getTimeStamp());
			msgRT.setH10SCRCOD("01");
			msgRT.setH10OPECOD("0005");
			
			setMessageRecord(req, msgRT);

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000010Message) mp.receiveMessageRecord("EDD000010");
			
			userPO.setAccNum(msgRT.getE10ACMACC());

			if (mp.hasError(msgError)) {
				pageName = "EDD0000_rt_account_analysis.jsp";
			} else {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD0000_rt_basic.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD0000_sv_basic.jsp";
				} else {
					pageName = devPage;
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("accAnalysis", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	protected void procActionPrintNew(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000001Message msgRT = (EDD000001Message) mp.getMessageRecord("EDD000001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDD0000");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0002");
			try {
				msgRT.setE01ACMACC(userPO.getAccNum().trim());
			} catch (Exception e) {
				msgRT.setE01ACMACC("0");
			}
			
			setMessageRecord(req, msgRT);

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000001Message) mp.receiveMessageRecord("EDD000001");

			if (mp.hasError(msgError)) {
				if ("SV".equals(userPO.getOption())) {
					pageName = "EDD0000_sv_enter_maint.jsp";
				} else {
					pageName = "EDD0000_rt_enter_maint.jsp";
				}
			} else {
				userPO.setApplicationCode(msgRT.getE01ACMACD());
				userPO.setBank(msgRT.getE01ACMBNK());
				userPO.setAccNum(msgRT.getE01ACMACC());
				userPO.setIdentifier(msgRT.getE01ACMACC());
				userPO.setCusNum(msgRT.getE01ACMCUN());
				userPO.setHeader2(msgRT.getE01ACMCUN());
				userPO.setCurrency(msgRT.getE01ACMCCY());
				userPO.setHeader3(msgRT.getE01CUSNA1());
				userPO.setCusName(msgRT.getE01CUSNA1());
				userPO.setHeader1(msgRT.getE01ACMPRO());
				userPO.setType(msgRT.getE01ACMATY());
				userPO.setProdCode(msgRT.getE01ACMPRO());

				if ("04".equals(msgRT.getE01ACMACD())) {
					userPO.setOption("SV");
					session.setAttribute("svBasic", msgRT);
					pageName = "EDD0000_sv_basic.jsp";
				} else {
					userPO.setOption("RT");
					session.setAttribute("rtBasic", msgRT);
					pageName = "EDD0000_rt_basic.jsp";
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procActionRTLegalRep(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			ESD000004Message msgBene = (ESD000004Message) session.getAttribute("legalRep");
			msgBene.setH04USR(user.getH01USR());
			msgBene.setH04PGM("EDD0000");
			msgBene.setH04TIM(""); //getTimeStamp()
			msgBene.setH04SCR("01");
			msgBene.setH04OPE("0005");
			msgBene.setE04CUN(userPO.getAccNum());
			msgBene.setE04RTP(userPO.getHeader10());
			
			setMessageRecord(req, msgBene);

			mp.sendMessage(msgBene);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgBene = (ESD000004Message) mp.receiveMessageRecord("ESD000004");

			if (mp.hasError(msgError)) {
				pageName = "EDD0000_rt_legal_rep.jsp";
			} else {
				userPO.setAccOpt("LEGALREP");
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD0000_rt_basic.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD0000_sv_basic.jsp";
				} else {
					pageName = devPage;
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("legalRep", msgBene);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procActionRTBene(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			ESD000004Message msgBene = (ESD000004Message) session.getAttribute("bene");
			msgBene.setH04USR(user.getH01USR());
			msgBene.setH04PGM("EDD0000");
			msgBene.setH04TIM(""); //getTimeStamp()
			msgBene.setH04SCR("01");
			msgBene.setH04OPE("0005");
			msgBene.setE04CUN(userPO.getAccNum());
			msgBene.setE04RTP("J");
			
			setMessageRecord(req, msgBene);

			mp.sendMessage(msgBene);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgBene = (ESD000004Message) mp.receiveMessageRecord("ESD000004");

			if (mp.hasError(msgError)) {
				pageName = "EDD0000_rt_bene.jsp";
			} else {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD0000_rt_basic.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD0000_sv_basic.jsp";
				} else {
					pageName = devPage;
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("bene", msgBene);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procActionSpcInst(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			ESD000005Message msgRT = (ESD000005Message) session.getAttribute("rtInst");
			msgRT.setH05USR(user.getH01USR());
			msgRT.setH05PGM("EDD0000");
			msgRT.setH05TIM(""); //getTimeStamp()
			msgRT.setH05SCR("01");
			msgRT.setH05OPE("0005");
			msgRT.setE05ACC(userPO.getAccNum());
			msgRT.setE05ACD(userPO.getApplicationCode());
			
			setMessageRecord(req, msgRT);

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (ESD000005Message) mp.receiveMessageRecord("ESD000005");
			
			userPO.setAccNum(msgRT.getE05ACC());

			if (mp.hasError(msgError)) {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD0000_rt_special_inst.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD0000_sv_special_inst.jsp";
				} else {
					pageName = "error_viewer.jsp";
				}
			} else {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD0000_rt_basic.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD0000_sv_basic.jsp";
				} else {
					pageName = devPage;
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtInst", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procActionFirm(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String country = req.getParameter("COUNTRY") == null ? "" : req.getParameter("COUNTRY").toLowerCase().trim();
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			ESD000004Message msgBene = (ESD000004Message) session.getAttribute("rtFirm");
			msgBene.setH04USR(user.getH01USR());
			msgBene.setH04PGM("EDD0000");
			msgBene.setH04TIM(getTimeStamp());
			msgBene.setH04SCR("01");
			msgBene.setH04OPE("0005");
			msgBene.setE04RTP("S");
			msgBene.setE04CUN(userPO.getAccNum());
			
			setMessageRecord(req, msgBene);

			mp.sendMessage(msgBene);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgBene = (ESD000004Message) mp.receiveMessageRecord("ESD000004");

			if (mp.hasError(msgError)) {
				if (!country.equals("")) {
					pageName = "EDD0000_rt_firm_" + country + ".jsp";
				} else {
					pageName = "EDD0000_rt_firm_generic.jsp";
				}
			} else {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD0000_rt_basic.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD0000_sv_basic.jsp";
				} else {
					pageName = devPage;
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtFirm", msgBene);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procActionTit(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			ESD000006Message msgRT = (ESD000006Message) mp.getMessageRecord("ESD000006");
			msgRT.setH06USR(user.getH01USR());
			msgRT.setH06PGM("EDD0000");
			msgRT.setH06TIM(getTimeStamp());
			msgRT.setH06SCR("01");
			msgRT.setH06OPE("0005");
			msgRT.setE06ACC(userPO.getAccNum());
			msgRT.setE06RTP("H");
			
			setMessageRecord(req, msgRT);

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (ESD000006Message) mp.receiveMessageRecord("ESD000006");
			
			userPO.setAccNum(msgRT.getE06ACC());

			if (mp.hasError(msgError)) {
				pageName = "EDD0000_rt_tit.jsp";
			} else {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD0000_rt_basic.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD0000_sv_basic.jsp";
				} else {
					pageName = devPage;
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtTit", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procActionSpecialCodes(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			ESD000002Message msgRT = (ESD000002Message) session.getAttribute("rtCodes");
			msgRT.setH02USR(user.getH01USR());
			msgRT.setH02PGM("EDD0000");
			msgRT.setH02TIM(getTimeStamp());
			msgRT.setH02SCR("01");
			msgRT.setH02OPE("0005");
			
			setMessageRecord(req, msgRT);

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (ESD000002Message) mp.receiveMessageRecord("ESD000002");
			
			userPO.setAccNum(msgRT.getE02ACC());

			if (mp.hasError(msgError)) {
				pageName = "EDD0000_rt_codes.jsp";
			} else {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD0000_rt_basic.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD0000_sv_basic.jsp";
				} else {
					pageName = devPage;
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtCodes", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procActionAccountTitle(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			ESD000004Message msgMailAddress = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgMailAddress.setH04USR(user.getH01USR());
			msgMailAddress.setH04PGM("ESD0080");
			msgMailAddress.setH04TIM(getTimeStamp());
			msgMailAddress.setH04SCR("01");
			msgMailAddress.setH04OPE("0005");
			msgMailAddress.setE04CUN(userPO.getAccNum());
			msgMailAddress.setE04RTP("1");
			msgMailAddress.setH04WK1("T");
			msgMailAddress.setH04WK3("1");
			
			setMessageRecord(req, msgMailAddress);

			mp.sendMessage(msgMailAddress);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgMailAddress = (ESD000004Message) mp.receiveMessageRecord("ESD000004");

			if (mp.hasError(msgError)) {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD0000_rt_account_title.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD0000_sv_account_title.jsp";
				} else {
					pageName = "error_viewer.jsp";
				}
			} else {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD0000_rt_basic.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD0000_sv_basic.jsp";
				} else {
					pageName = devPage;
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("mailA", msgMailAddress);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procActionStatus(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000002Message msgRT = (EDD000002Message) session.getAttribute("rtStatus");
			msgRT.setH02USERID(user.getH01USR());
			msgRT.setH02PROGRM("EDD0000");
			msgRT.setH02TIMSYS(getTimeStamp());
			msgRT.setH02SCRCOD("01");
			msgRT.setH02OPECOD("0005");
			
			setMessageRecord(req, msgRT);

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000002Message) mp.receiveMessageRecord("EDD000002");
			
			userPO.setAccNum(msgRT.getE02ACMACC());

			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				session.setAttribute("rtStatus", msgRT);

				forward("EDD0000_chg_status.jsp", req, res);
			} else {
				redirectToPage(bgPage, res);
			}

		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqSVChgStatus(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000002Message msgRT = (EDD000002Message) mp.getMessageRecord("EDD000002");
			msgRT.setH02USERID(user.getH01USR());
			msgRT.setH02PROGRM("EDD0000");
			msgRT.setH02TIMSYS(getTimeStamp());
			msgRT.setH02SCRCOD("01");
			msgRT.setH02OPECOD("0002");
			try {
				msgRT.setE02ACMACC(req.getParameter("E01ACMACC").trim());
			} catch (Exception e) {
				msgRT.setE02ACMACC("0");
			}


			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000002Message) mp.receiveMessageRecord("EDD000002");

			if (mp.hasError(msgError)) {
				if ("RT".equals(userPO.getOption())) {
					pageName = "GENERIC_account_enter.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "GENERIC_account_enter.jsp";
				} else {
					pageName = "error_viewer.jsp";
				}
			} else {
				if (msgRT.getE02REQBIO().equals("Y") && !userPO.getThereIsMsg()) {
					userPO.setRedirect("/servlet/datapro.eibs.products.JSEXEDD0000?SCREEN=315&E01ACMACC=" + msgRT.getE02ACMACC());
					userPO.setOption("RT");
					userPO.setProdCode("04");
					userPO.setHeader1("E01ACMACC");
					userPO.setHeader2("H01FLGWK2");
					session.setAttribute("error", msgError);
					session.setAttribute("userPO", userPO);
					redirect("/servlet/datapro.eibs.client.JSEDD8000?SCREEN=2&E01ACMACC=" + msgRT.getE02ACMACC(), res);
				} else {
					pageName = "EDD0000_chg_sv_acc_status.jsp";
				} 	
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtStatus", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}
	
	protected void procReqChgStatus(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000002Message msgRT = (EDD000002Message) mp.getMessageRecord("EDD000002");
			msgRT.setH02USERID(user.getH01USR());
			msgRT.setH02PROGRM("EDD0000");
			msgRT.setH02TIMSYS(getTimeStamp());
			msgRT.setH02SCRCOD("01");
			msgRT.setH02OPECOD("0002");
			try {
				msgRT.setE02ACMACC(req.getParameter("E01ACMACC").trim());
			} catch (Exception e) {
				msgRT.setE02ACMACC("0");
			}


			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000002Message) mp.receiveMessageRecord("EDD000002");

			if (mp.hasError(msgError)) {
				if ("RT".equals(userPO.getOption())) {
					pageName = "GENERIC_account_enter.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "GENERIC_account_enter.jsp";
				} else {
					pageName = "error_viewer.jsp";
				}
			} else {
				if (msgRT.getE02REQBIO().equals("Y") && !userPO.getThereIsMsg()) {
					userPO.setRedirect("/servlet/datapro.eibs.products.JSEXEDD0000?SCREEN=215&E01ACMACC=" + msgRT.getE02ACMACC());
					userPO.setOption("RT");
					userPO.setProdCode("01");
					userPO.setHeader1("E01ACMACC");
					userPO.setHeader2("H01FLGWK2");
					session.setAttribute("error", msgError);
					session.setAttribute("userPO", userPO);
					redirect("/servlet/datapro.eibs.client.JSEDD8000?SCREEN=2&E01ACMACC=" + msgRT.getE02ACMACC(), res);
				} else {
					pageName = "EDD0000_chg_acc_status.jsp";
				} 	
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtStatus", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}
	
	private void procActionChgStatus(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000002Message msgRT = (EDD000002Message) session.getAttribute("rtStatus");
			msgRT.setH02USERID(user.getH01USR());
			msgRT.setH02PROGRM("EDD0000");
			msgRT.setH02TIMSYS(getTimeStamp());
			msgRT.setH02SCRCOD("01");
			msgRT.setH02OPECOD("0005");
			
			setMessageRecord(req, msgRT);

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000002Message) mp.receiveMessageRecord("EDD000002");
			
			userPO.setAccNum(msgRT.getE02ACMACC());

			if (mp.hasError(msgError)) {
				pageName = "EDD0000_chg_acc_status.jsp";
			} else {
				res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSEXEDD0000?SCREEN=115");
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtStatus", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}
	

	private void procActionSVChgStatus(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(session);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000002Message msgRT = (EDD000002Message) session.getAttribute("rtStatus");
			msgRT.setH02USERID(user.getH01USR());
			msgRT.setH02PROGRM("EDD0000");
			msgRT.setH02TIMSYS(getTimeStamp());
			msgRT.setH02SCRCOD("01");
			msgRT.setH02OPECOD("0005");
			
			setMessageRecord(req, msgRT);

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000002Message) mp.receiveMessageRecord("EDD000002");
			
			userPO.setAccNum(msgRT.getE02ACMACC());

			if (mp.hasError(msgError)) {
				pageName = "EDD0000_chg_sv_acc_status.jsp";
			} else {
				res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSEXEDD0000?SCREEN=116");
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtStatus", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}
	
	private void procActionRTMoney(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			ELD000001Message msgRT = (ELD000001Message) session.getAttribute("rtMoney");
			msgRT.setH06USERID(user.getH01USR());
			msgRT.setH06PROGRM("EDD0000");
			msgRT.setH06TIMSYS(getTimeStamp());
			msgRT.setH06SCRCOD("01");
			msgRT.setH06OPECOD("0005");
			
			setMessageRecord(req, msgRT);

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (ELD000001Message) mp.receiveMessageRecord("ELD000001");
			
			userPO.setAccNum(msgRT.getE06LDMACC());

			if (mp.hasError(msgError)) {
				pageName = "EDD0000_rt_money.jsp";
			} else {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD0000_rt_basic.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD0000_sv_basic.jsp";
				} else {
					pageName = devPage;
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtMoney", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procActionRTCreditLine(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000004Message msgRT = (EDD000004Message) session.getAttribute("rtCredit");
			msgRT.setH04USERID(user.getH01USR());
			msgRT.setH04PROGRM("EDD0000");
			msgRT.setH04TIMSYS(getTimeStamp());
			msgRT.setH04SCRCOD("01");
			msgRT.setH04OPECOD("0005");
			
			setMessageRecord(req, msgRT);

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000004Message) mp.receiveMessageRecord("EDD000004");
			
			userPO.setAccNum(msgRT.getE04ACMACC());

			if (mp.hasError(msgError)) {
				pageName = "EDD0000_rt_credit_line.jsp";
			} else {
				pageName = "EDD0000_rt_enter_lineacredito.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtCredit", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procActionRTCredit(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000004Message msgRT = (EDD000004Message) session.getAttribute("rtCredit");
			msgRT.setH04USERID(user.getH01USR());
			msgRT.setH04PROGRM("EDD0000");
			msgRT.setH04TIMSYS(getTimeStamp());
			msgRT.setH04SCRCOD("01");
			msgRT.setH04OPECOD("0005");
			
			setMessageRecord(req, msgRT);

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000004Message) mp.receiveMessageRecord("EDD000004");
			
			userPO.setAccNum(msgRT.getE04ACMACC());

			if (mp.hasError(msgError)) {
				pageName = "EDD0000_rt_credit.jsp";
			} else {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD0000_rt_basic.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD0000_sv_basic.jsp";
				} else {
					pageName = devPage;
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtCredit", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procActionRTOvernight(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000005Message msgRT = (EDD000005Message) session.getAttribute("rtOvernight");
			msgRT.setH05USERID(user.getH01USR());
			msgRT.setH05PROGRM("EDD0000");
			msgRT.setH05TIMSYS(getTimeStamp());
			msgRT.setH05SCRCOD("01");
			msgRT.setH05OPECOD("0005");
			msgRT.setE05ACMACC(userPO.getAccNum());
			
			setMessageRecord(req, msgRT);

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000005Message) mp.receiveMessageRecord("EDD000005");

			if (mp.hasError(msgError)) {
				pageName = "EDD0000_rt_overnight.jsp";
			} else {
				pageName = "EDD0000_rt_basic.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtOvernight", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
		
	}


	private void procActionRTOverdraftOpc(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000003Message msgRT = (EDD000003Message) session.getAttribute("rtOverdraft");
			msgRT.setH03USERID(user.getH01USR());
			msgRT.setH03PROGRM("EDD0000");
			msgRT.setH03TIMSYS(getTimeStamp());
			msgRT.setH03SCRCOD("01");
			msgRT.setH03OPECOD("0005");
			
			setMessageRecord(req, msgRT);

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000003Message) mp.receiveMessageRecord("EDD000003");

			userPO.setAccNum(msgRT.getE03ACMACC());
			
			if (mp.hasError(msgError)) {
				pageName = "EDD0000_rt_overdraft_opc.jsp";
			} else {
				pageName = "EDD0000_rt_enter_sobregiro.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtOverdraft", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procActionRTOverdraft(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000003Message msgRT = (EDD000003Message) session.getAttribute("rtOverdraft");
			msgRT.setH03USERID(user.getH01USR());
			msgRT.setH03PROGRM("EDD0000");
			msgRT.setH03TIMSYS(getTimeStamp());
			msgRT.setH03SCRCOD("01");
			msgRT.setH03OPECOD("0005");
			
			setMessageRecord(req, msgRT);

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000003Message) mp.receiveMessageRecord("EDD000003");

			userPO.setAccNum(msgRT.getE03ACMACC());
			
			if (mp.hasError(msgError)) {
				pageName = "EDD0000_rt_overdraft.jsp";
			} else {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD0000_rt_basic.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD0000_sv_basic.jsp";
				} else {
					pageName = devPage;
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtOverdraft", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	protected void procActionRTBasic(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000001Message msgRT = (EDD000001Message) session.getAttribute("rtBasic");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDD0000");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0005");
		 	if ("Y".equals(req.getParameter("APPROVAL"))) msgRT.setH01OPECOD("0006");
		 	
		 	setMessageRecord(req, msgRT);

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			MessageRecord newmessage = mp.receiveMessageRecord();
			
			session.setAttribute("error", msgError);
			
			if (newmessage.getFormatName().equals("EFT000015")) {
				EFT000015Message msgFinish = (EFT000015Message) newmessage;
				userPO.setAccNum(msgFinish.getE15ACCNUM());
				userPO.setCurrency(msgFinish.getE15CCYCDE());
				userPO.setProdCode(msgFinish.getE15PROCDE());
				
				session.setAttribute("rtFinish", msgFinish);
				session.setAttribute("userPO", userPO);
				
				forward("EDD0000_rt_confirm.jsp", req, res);
				
			} else if (newmessage.getFormatName().equals("EDD000001")) {
				msgRT = (EDD000001Message) newmessage;
				if ("NEW".equals(userPO.getPurpose())) {
					userPO.setIdentifier(msgRT.getE01ACMPRO());
					userPO.setApplicationCode(msgRT.getE01ACMACD());
					userPO.setHeader1(msgRT.getE01ACMCUN());
					userPO.setHeader2(msgRT.getE01CUSNA1());
					userPO.setCurrency(msgRT.getE01ACMCCY());
				}
				session.setAttribute("rtBasic", msgRT);
				session.setAttribute("userPO", userPO);
				
				if (mp.hasError(msgError)) {
					if ("NEW".equals(userPO.getPurpose())) {
						pageName = "EDD0000_rt_new.jsp";
					} else {
						pageName = "EDD0000_rt_basic.jsp";
					}
					forward(pageName, req, res);
				} else {
					if ("NEW".equals(userPO.getPurpose())) {
						res.sendRedirect(srctx + bgPage);
					} else {
						forward("EDD0000_rt_enter_maint.jsp", req, res);
					}
				}
			}
			
		} finally {
			if (mp != null)	mp.close();
		}
	}


	protected void procReqInqAccountAnalysis(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000010Message msgRT = (EDD000010Message) mp.getMessageRecord("EDD000010");
			msgRT.setH10USERID(user.getH01USR());
			msgRT.setH10PROGRM("EDD0000");
			msgRT.setH10TIMSYS(getTimeStamp());
			msgRT.setH10SCRCOD("01");
			msgRT.setH10OPECOD("0002");
			msgRT.setE10ACMACC(userPO.getAccNum());

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000010Message) mp.receiveMessageRecord("EDD000010");

			if (mp.hasError(msgError)) {
				pageName = "EDD0000_rt_inq_balances.jsp";
			} else {
				pageName = "EDD0000_rt_inq_account_analysis.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("accAnalysis", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procReqInqCheckbook(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000001Message msgRT = (EDD000001Message) mp.getMessageRecord("EDD000001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDD0000");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01FLGWK1("R");
			msgRT.setH01OPECOD("0002");
			try {
				msgRT.setE01ACMACC(userPO.getAccNum().trim());
			} catch (Exception e) {
				msgRT.setE01ACMACC("0");
			}

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000001Message) mp.receiveMessageRecord("EDD000001");

			if (mp.hasError(msgError)) {
				if ("SV".equals(userPO.getOption())) {
					pageName = "EDD0000_sv_enter_inquiry.jsp";
				} else {
					pageName = "EDD0000_rt_enter_inquiry.jsp";
				}
			} else {
				if ("04".equals(msgRT.getE01ACMACD())) {
					userPO.setOption("SV");
					userPO.setAccNum(msgRT.getE01ACMACC());
					userPO.setIdentifier(msgRT.getE01ACMACC());
					userPO.setApplicationCode(msgRT.getE01ACMACD());
					userPO.setBank(msgRT.getE01ACMBNK());
					userPO.setCusNum(msgRT.getE01ACMCUN());
					userPO.setHeader1(msgRT.getE01ACMPRO());
					userPO.setHeader2(msgRT.getE01ACMCUN());
					userPO.setHeader3(msgRT.getE01CUSNA1());
					userPO.setCurrency(msgRT.getE01ACMCCY());
					userPO.setCusType(msgRT.getH01FLGWK3());
					
					session.setAttribute("svBasic", msgRT);
					pageName = "EDD0000_sv_basic.jsp";
				} else {
					userPO.setOption("RT");
					userPO.setAccNum(msgRT.getE01ACMACC());
					userPO.setIdentifier(msgRT.getE01ACMACC());
					userPO.setApplicationCode(msgRT.getE01ACMACD());
					userPO.setBank(msgRT.getE01ACMBNK());
					userPO.setCusNum(msgRT.getE01ACMCUN());
					userPO.setHeader1(msgRT.getE01ACMPRO());
					userPO.setHeader2(msgRT.getE01ACMCUN());
					userPO.setHeader3(msgRT.getE01CUSNA1());
					userPO.setCurrency(msgRT.getE01ACMCCY());
					
					session.setAttribute("rtBasic", msgRT);
					pageName = "EDD1000_rt_inq_checkbook.jsp";
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	protected void procReqCPMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000001Message msgRT = (EDD000001Message) mp.getMessageRecord("EDD000001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDD0000");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0002");
			msgRT.setE01ACMACC(userPO.getAccNum());

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000001Message) mp.receiveMessageRecord("EDD000001");

			if (mp.hasError(msgError)) {
				pageName = "EDD0000_cp_enter_maint.jsp";
			} else {
				pageName = "EDD0000_cp_basic.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("cpBasic", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procReqCPNew(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000001Message msgRT = (EDD000001Message) mp.getMessageRecord("EDD000001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDD0000");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0001");
			msgRT.setE01ACMPRO(userPO.getIdentifier());

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000001Message) mp.receiveMessageRecord("EDD000001");

			if (mp.hasError(msgError)) {
				res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSESD0711?TYPE=06");
			} else {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				session.setAttribute("cpNew", msgRT);

				forward("EDD0000_cp_basic.jsp", req, res);
			}

		} finally {
			if (mp != null)	mp.close();
		}
	}


	protected void procReqSVMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000001Message msgRT = (EDD000001Message) mp.getMessageRecord("EDD000001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDD0000");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0002");
			msgRT.setE01ACMACC(userPO.getAccNum());

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000001Message) mp.receiveMessageRecord("EDD000001");

			if (mp.hasError(msgError)) {
				pageName = "EDD0000_sv_enter_maint.jsp";
			} else {
				pageName = "EDD0000_sv_basic.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("svBasic", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procReqSVNew(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000001Message msgRT = (EDD000001Message) mp.getMessageRecord("EDD000001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDD0000");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0001");
			msgRT.setE01ACMPRO(userPO.getIdentifier());

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000001Message) mp.receiveMessageRecord("EDD000001");

			if (mp.hasError(msgError)) {
				res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSESD0711?TYPE=04");
			} else {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				session.setAttribute("svNew", msgRT);
				
				forward("EDD0000_sv_basic.jsp", req, res);
			}

		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procReqTellerMessages(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			ESD009001Message msgRT = (ESD009001Message) mp.getMessageRecord("ESD009001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("ESD0090");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0002");
			msgRT.setE01SPIACC(userPO.getAccNum());
			msgRT.setE01SPIACD("R4");

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (ESD009001Message) mp.receiveMessageRecord("ESD009001");

			if (mp.hasError(msgError)) {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD0000_rt_basic.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD0000_sv_basic.jsp";
				} else {
					pageName = "error_viewer.jsp";
				}
			} else {
				pageName = "EDD0000_rt_teller_instructions.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("instructions", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	protected void procReqAccountAnalysis(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000010Message msgRT = (EDD000010Message) mp.getMessageRecord("EDD000010");
			msgRT.setH10USERID(user.getH01USR());
			msgRT.setH10PROGRM("EDD0000");
			msgRT.setH10TIMSYS(getTimeStamp());
			msgRT.setH10SCRCOD("01");
			msgRT.setH10OPECOD("0002");
			msgRT.setE10ACMACC(userPO.getAccNum());

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000010Message) mp.receiveMessageRecord("EDD000010");

			if (mp.hasError(msgError)) {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD0000_rt_basic.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD0000_sv_basic.jsp";
				} else {
					pageName = "error_viewer.jsp";
				}
			} else {
				pageName = "EDD0000_rt_account_analysis.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("accAnalysis", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	protected void procReqInqRTLegalRep(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "NEW".equals(userPO.getPurpose()) ? "0001" : "0002";
		String type = req.getParameter("Type") == null ? "I" : req.getParameter("Type").trim();
		userPO.setHeader10(type);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			ESD000004Message msgBene = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgBene.setH04USR(user.getH01USR());
			msgBene.setH04PGM("EDD0000");
			msgBene.setH04TIM(getTimeStamp());
			msgBene.setH04SCR("01");
			msgBene.setH04OPE(opCode);
			msgBene.setE04CUN(userPO.getAccNum());
			msgBene.setE04RTP(type);

			mp.sendMessage(msgBene);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgBene = (ESD000004Message) mp.receiveMessageRecord("ESD000004");

			if (mp.hasError(msgError)) {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD0000_rt_inq_bene.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD0000_sv_basic.jsp";
				} else {
					pageName = "error_viewer.jsp";
				}
			} else {
				pageName = "EDD0000_rt_inq_legal_rep.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("legalRep", msgBene);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procReqInqRTBene(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "NEW".equals(userPO.getPurpose()) ? "0001" : "0002";
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			ESD000004Message msgBene = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgBene.setH04USR(user.getH01USR());
			msgBene.setH04PGM("EDD0000");
			msgBene.setH04TIM(getTimeStamp());
			msgBene.setH04SCR("01");
			msgBene.setH04OPE(opCode);
			msgBene.setE04CUN(userPO.getAccNum());
			msgBene.setE04RTP("J");

			mp.sendMessage(msgBene);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgBene = (ESD000004Message) mp.receiveMessageRecord("ESD000004");

			if (mp.hasError(msgError)) {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD0000_rt_inq_bene.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD0000_sv_basic.jsp";
				} else {
					pageName = "error_viewer.jsp";
				}
			} else {
				pageName = "EDD0000_rt_inq_bene.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("bene", msgBene);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	protected void procReqRTLegalRep(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "NEW".equals(userPO.getPurpose()) ? "0001" : "0002";
		userPO.setAccOpt("LEGALREP");
		userPO.setHeader10("I");
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			ESD000004Message msgBene = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgBene.setH04USR(user.getH01USR());
			msgBene.setH04PGM("EDD0000");
			msgBene.setH04TIM(getTimeStamp());
			msgBene.setH04SCR("01");
			msgBene.setH04OPE(opCode);
			msgBene.setE04CUN(userPO.getAccNum());
			msgBene.setE04RTP(userPO.getHeader10());

			mp.sendMessage(msgBene);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgBene = (ESD000004Message) mp.receiveMessageRecord("ESD000004");

			if (mp.hasError(msgError)) {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD0000_rt_basic.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD0000_sv_basic.jsp";
				} else {
					pageName = "error_viewer.jsp";
				}
			} else {
				pageName = "EDD0000_rt_legal_rep.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("legalRep", msgBene);

			forward(pageName, req, res);

		} finally {
			if (mp != null) mp.close();
		}
	}


	protected void procReqRTBene(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "NEW".equals(userPO.getPurpose()) ? "0001" : "0002";
		userPO.setAccOpt("BENE");
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			ESD000004Message msgBene = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgBene.setH04USR(user.getH01USR());
			msgBene.setH04PGM("EDD0000");
			msgBene.setH04TIM(getTimeStamp());
			msgBene.setH04SCR("01");
			msgBene.setH04OPE(opCode);
			msgBene.setE04CUN(userPO.getAccNum());
			msgBene.setE04RTP("J");

			mp.sendMessage(msgBene);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgBene = (ESD000004Message) mp.receiveMessageRecord("ESD000004");

			if (mp.hasError(msgError)) {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD0000_rt_basic.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD0000_sv_basic.jsp";
				} else {
					pageName = "error_viewer.jsp";
				}
			} else {
				pageName = "EDD0000_rt_bene.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("bene", msgBene);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	protected void procReqSpcInst(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "MAINTENANCE".equals(userPO.getPurpose()) ? "0002" : "0004";
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			ESD000005Message msgRT = (ESD000005Message) mp.getMessageRecord("ESD000005");
			msgRT.setH05USR(user.getH01USR());
			msgRT.setH05PGM("EDD0000");
			msgRT.setH05TIM(getTimeStamp());
			msgRT.setH05SCR("01");
			msgRT.setH05OPE(opCode);
			msgRT.setE05ACC(userPO.getAccNum());
			msgRT.setE05ACD(userPO.getApplicationCode());

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (ESD000005Message) mp.receiveMessageRecord("ESD000005");

			if (mp.hasError(msgError)) {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD0000_rt_basic.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD0000_sv_basic.jsp";
				} else {
					pageName = "error_viewer.jsp";
				}
			} else {
				pageName = "EDD0000_rt_special_inst.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtInst", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	protected void procReqFirm(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String country = req.getParameter("COUNTRY") == null ? "" : req.getParameter("COUNTRY").toLowerCase().trim();
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			ESD000004Message msgBene = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgBene.setH04USR(user.getH01USR());
			msgBene.setH04PGM("EDD0000");
			msgBene.setH04TIM(getTimeStamp());
			try {
				msgBene.setH04SCR(req.getParameter("H04SCR").trim());
			} catch (Exception e) {
				msgBene.setH04SCR("07");
			}
			msgBene.setH04OPE("0002");
			msgBene.setE04CUN(userPO.getAccNum());
			msgBene.setE04RTP("S");

			mp.sendMessage(msgBene);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgBene = (ESD000004Message) mp.receiveMessageRecord("ESD000004");

			if (mp.hasError(msgError)) {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD0000_rt_basic.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD0000_sv_basic.jsp";
				} else {
					pageName = "error_viewer.jsp";
				}
			} else {
				if (!country.equals("")) {
					pageName = "EDD0000_rt_firm_" + country + ".jsp";
				} else {
					pageName = "EDD0000_rt_firm_generic.jsp";
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtFirm", msgBene);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	protected void procReqTit(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			ESD000006Message msgRT = (ESD000006Message) mp.getMessageRecord("ESD000006");
			msgRT.setH06USR(user.getH01USR());
			msgRT.setH06PGM("EDD0000");
			msgRT.setH06TIM(getTimeStamp());
			msgRT.setH06SCR("01");
			msgRT.setH06OPE("0002");
			msgRT.setE06ACC(userPO.getAccNum());
			msgRT.setE06RTP("H");

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (ESD000006Message) mp.receiveMessageRecord("ESD000006");

			if (mp.hasError(msgError)) {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD0000_rt_basic.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD0000_sv_basic.jsp";
				} else {
					pageName = "error_viewer.jsp";
				}
			} else {
				pageName = "EDD0000_rt_tit.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtTit", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null) mp.close();
		}
	}


	protected void procReqAccountTitle(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "NEW".equals(userPO.getPurpose()) ? "0001" : "0002";
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			ESD000004Message msgMailA = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgMailA.setH04USR(user.getH01USR());
			msgMailA.setH04PGM("ESD0080");
			msgMailA.setH04TIM(getTimeStamp());
			msgMailA.setH04SCR("01");
			msgMailA.setH04OPE(opCode);
			msgMailA.setE04CUN(userPO.getAccNum());
			msgMailA.setE04RTP("1");
			msgMailA.setH04WK1("T");
			msgMailA.setH04WK3("1");

			mp.sendMessage(msgMailA);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgMailA = (ESD000004Message) mp.receiveMessageRecord("ESD000004");

			if (mp.hasError(msgError)) {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD0000_rt_basic.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD0000_sv_basic.jsp";
				} else {
					pageName = "error_viewer.jsp";
				}
			} else {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD0000_rt_account_title.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD0000_sv_account_title.jsp";
				} else {
					pageName = devPage;
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("mailA", msgMailA);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	protected void procReqSpecialCodes(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			ESD000002Message msgRT = (ESD000002Message) mp.getMessageRecord("ESD000002");
			msgRT.setH02USR(user.getH01USR());
			msgRT.setH02PGM("EDD0000");
			msgRT.setH02TIM(getTimeStamp());
			msgRT.setH02SCR("01");
			msgRT.setH02OPE("0002");
			msgRT.setE02ACC(userPO.getAccNum());

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (ESD000002Message) mp.receiveMessageRecord("ESD000002");

			if (mp.hasError(msgError)) {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD0000_rt_basic.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD0000_sv_basic.jsp";
				} else {
					pageName = "error_viewer.jsp";
				}
			} else {
				pageName = "EDD0000_rt_codes.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtCodes", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	protected void procReqStatus(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000002Message msgRT = (EDD000002Message) mp.getMessageRecord("EDD000002");
			msgRT.setH02USERID(user.getH01USR());
			msgRT.setH02PROGRM("EDD0000");
			msgRT.setH02TIMSYS(getTimeStamp());
			msgRT.setH02SCRCOD("01");
			msgRT.setH02OPECOD("0002");
			try {
				msgRT.setE02ACMACC(req.getParameter("E01ACMACC").trim());
			} catch (Exception e) {
				msgRT.setE02ACMACC(userPO.getAccNum());
			}

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000002Message) mp.receiveMessageRecord("EDD000002");

			if (mp.hasError(msgError)) {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD0000_rt_basic.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD0000_sv_basic.jsp";
				} else if ("CP".equals(userPO.getOption())) {
					pageName = "EDD0000_cp_basic.jsp";
				} else {
					pageName = "error_viewer.jsp";
				}
			} else {
				pageName = "EDD0000_chg_status.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtStatus", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	protected void procReqRTMoney(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			ELD000001Message msgRT = (ELD000001Message) mp.getMessageRecord("ELD000001");
			msgRT.setH06USERID(user.getH01USR());
			msgRT.setH06PROGRM("EDD0000");
			msgRT.setH06TIMSYS(getTimeStamp());
			msgRT.setH06SCRCOD("01");
			msgRT.setH06OPECOD("0002");
			msgRT.setE06LDMACC(userPO.getAccNum());

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (ELD000001Message) mp.receiveMessageRecord("ELD000001");

			if (mp.hasError(msgError)) {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD0000_rt_basic.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD0000_sv_basic.jsp";
				} else {
					pageName = "error_viewer.jsp";
				}
			} else {
				pageName = "EDD0000_rt_money.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtMoney", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procReqRTCreditLine(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000004Message msgRT = (EDD000004Message) mp.getMessageRecord("EDD000004");
			msgRT.setH04USERID(user.getH01USR());
			msgRT.setH04PROGRM("EDD0000");
			msgRT.setH04TIMSYS(getTimeStamp());
			msgRT.setH04SCRCOD("01");
			msgRT.setH04OPECOD("0002");
			try {
				msgRT.setE04ACMACC(req.getParameter("E04ACMACC").trim());
			} catch (Exception e) {
				msgRT.setE04ACMACC("0");
			}

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000004Message) mp.receiveMessageRecord("EDD000004");

			if (mp.hasError(msgError)) {
				pageName = "EDD0000_rt_enter_lineacredito.jsp";
			} else {
				pageName = "EDD0000_rt_credit_line.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtCredit", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	protected void procReqRTCredit(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000004Message msgRT = (EDD000004Message) mp.getMessageRecord("EDD000004");
			msgRT.setH04USERID(user.getH01USR());
			msgRT.setH04PROGRM("EDD0000");
			msgRT.setH04TIMSYS(getTimeStamp());
			msgRT.setH04SCRCOD("01");
			msgRT.setH04OPECOD("0002");
			msgRT.setE04ACMACC(userPO.getAccNum());

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000004Message) mp.receiveMessageRecord("EDD000004");

			if (mp.hasError(msgError)) {
				if ("RT".equals(userPO.getOption())) {
					pageName = "EDD0000_rt_basic.jsp";
				} else if ("SV".equals(userPO.getOption())) {
					pageName = "EDD0000_sv_basic.jsp";
				} else {
					pageName = "error_viewer.jsp";
				}
			} else {
				pageName = "EDD0000_rt_credit.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtCredit", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	protected void procReqRTOvernight(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000005Message msgRT = (EDD000005Message) mp.getMessageRecord("EDD000005");
			msgRT.setH05USERID(user.getH01USR());
			msgRT.setH05PROGRM("EDD0000");
			msgRT.setH05TIMSYS(getTimeStamp());
			msgRT.setH05SCRCOD("01");
			msgRT.setH05OPECOD("0002");
			msgRT.setE05ACMACC(userPO.getAccNum());

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000005Message) mp.receiveMessageRecord("EDD000005");

			if (mp.hasError(msgError)) {
				pageName = "EDD0000_rt_basic.jsp";
			} else {
				pageName = "EDD0000_rt_overnight.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtOvernight", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procReqRTOverdraftOpc(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000003Message msgRT = (EDD000003Message) mp.getMessageRecord("EDD000003");
			msgRT.setH03USERID(user.getH01USR());
			msgRT.setH03PROGRM("EDD0000");
			msgRT.setH03TIMSYS(getTimeStamp());
			msgRT.setH03SCRCOD("01");
			msgRT.setH03OPECOD("0002");
			try {
				msgRT.setE03ACMACC(req.getParameter("E03ACMACC").trim());
			} catch (Exception e) {
				msgRT.setE03ACMACC("0");
			}

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000003Message) mp.receiveMessageRecord("EDD000003");

			if (mp.hasError(msgError)) {
				pageName = "EDD0000_rt_enter_sobregiro.jsp";
			} else {
				pageName = "EDD0000_rt_overdraft_opc.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtOverdraft", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	protected void procReqRTOverdraft(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000003Message msgRT = (EDD000003Message) mp.getMessageRecord("EDD000003");
			msgRT.setH03USERID(user.getH01USR());
			msgRT.setH03PROGRM("EDD0000");
			msgRT.setH03TIMSYS(getTimeStamp());
			msgRT.setH03SCRCOD("01");
			msgRT.setH03OPECOD("0002");
			msgRT.setE03ACMACC(userPO.getAccNum());

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000003Message) mp.receiveMessageRecord("EDD000003");

			if (mp.hasError(msgError)) {
				pageName = "EDD0000_rt_basic.jsp";
			} else {
				pageName = "EDD0000_rt_overdraft.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtOverdraft", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	protected void procReqRTMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
	
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000001Message msgRT = (EDD000001Message) mp.getMessageRecord("EDD000001");
			msgRT.setH01USERID(user.getH01USR());
			msgRT.setH01PROGRM("EDD0000");
			msgRT.setH01TIMSYS(getTimeStamp());
			msgRT.setH01SCRCOD("01");
			msgRT.setH01OPECOD("0002");
			msgRT.setE01ACMACC(userPO.getAccNum());

			mp.sendMessage(msgRT);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgRT = (EDD000001Message) mp.receiveMessageRecord("EDD000001");

			if (mp.hasError(msgError)) {
				pageName = "EDD0000_rt_enter_maint.jsp";
			} else {
				pageName = "EDD0000_rt_basic.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("userPO", userPO);
			session.setAttribute("rtBasic", msgRT);

			forward(pageName, req, res);

		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procReqRTNew(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {

		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDD0000", req);
			EDD000001Message msgCD = (EDD000001Message) mp.getMessageRecord("EDD000001");
			msgCD.setH01USERID(user.getH01USR());
			msgCD.setH01PROGRM("EDD0000");
			msgCD.setH01TIMSYS(getTimeStamp());
			msgCD.setH01SCRCOD("01");
			msgCD.setH01OPECOD("0001");
			msgCD.setE01ACMPRO(userPO.getIdentifier());

			mp.sendMessage(msgCD);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgCD = (EDD000001Message) mp.receiveMessageRecord("EDD000001");

			if (mp.hasError(msgError)) {
				res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSESD0711?TYPE=RT");
			} else {
				session.setAttribute("error", msgError);
				session.setAttribute("userPO", userPO);
				session.setAttribute("rtNew", msgCD);

				forward("EDD0000_rt_basic.jsp", req, res);
			}

		} finally {
			if (mp != null)	mp.close();
		}
	}


	private void procReqSVEnterPrint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("SV");
		userPO.setPurpose("PRINT");
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		
		forward("EDD0000_sv_enter_print.jsp", req, res);
	}


	private void procReqRTEnterPrint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("RT");
		userPO.setPurpose("PRINT");
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		
		forward("EDD0000_rt_enter_print.jsp", req, res);
	}


	protected void procReqSVEnterInquiry(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("SV");
		userPO.setPurpose("INQUIRY");
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		
		forward("EDD0000_sv_enter_inquiry.jsp", req, res);
	}


	private void procReqRTLineacredito(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		session.setAttribute("userPO", new UserPos());
		session.setAttribute("error", new ELEERRMessage());
		
		forward("EDD0000_rt_enter_lineacredito.jsp", req, res);
	}


	private void procReqRTSobregiro(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		session.setAttribute("userPO", new UserPos());
		session.setAttribute("error", new ELEERRMessage());
		
		forward("EDD0000_rt_enter_sobregiro.jsp", req, res);
	}


	protected void procReqRTEnterInquiry(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("RT");
		userPO.setPurpose("INQUIRY");
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		
		forward("EDD0000_rt_enter_inquiry.jsp", req, res);
	}


	protected void procReqCPEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("CP");
		userPO.setPurpose("MAINTENANCE");
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		
		forward("EDD0000_cp_enter_maint.jsp", req, res);
	}


	protected void procReqSVEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("SV");
		userPO.setPurpose("MAINTENANCE");
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		
		forward("EDD0000_sv_enter_maint.jsp", req, res);
	}


	protected void procReqRTEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("RT");
		userPO.setPurpose("MAINTENANCE");
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		
		forward("EDD0000_rt_enter_maint.jsp", req, res);
	}


	private void procReqSVEnterNew(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("SV");
		userPO.setPurpose("NEW");
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		
		forward("EDD0000_sv_enter_new.jsp", req, res);
	}


	private void procReqRTEnterNew(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("RT");
		userPO.setPurpose("NEW");
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		
		forward("EDD0000_rt_enter_new.jsp", req, res);
	}

	protected JBObjList getTitularsDescription(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0002", req);
			EWD0002DSMessage msgCnofc = (EWD0002DSMessage) mp.getMessageRecord("EWD0002DS");
			msgCnofc.setEWDREC("0");
			msgCnofc.setEWDTBL("T8");

			mp.sendMessage(msgCnofc);
			return mp.receiveMessageRecordList("EWDOPE");
		} finally {
			if (mp != null) mp.close();
		}
	}
	
	protected Hashtable formatInterestTable(EDD000007Message ms)
	{
		DecimalFormat interestFormatter = new DecimalFormat("#,##0.000000");
		DecimalFormat rangeFormatter = new DecimalFormat("#,##0");
		String[] keys = {"L","1","2","3","4","5","6","7","8","9","X","Y"};
		final String MESSAGE_MAX = " en adelante";
		final BigDecimal ZERO = new BigDecimal("0");
		BigDecimal interest;
		String amountRange;
		ArrayList amountColumn = new ArrayList();
		ArrayList interestColumn = new ArrayList();
		double rangeMin;
		double rangeMax;
		final double RANGE_MAX_FACTOR = 1.00;
		Hashtable ht = new Hashtable();
		try{//set starting interest rate
			interest = ((DecimalField)ms.getField("E02STHMKR")).getBigDecimal();
		} catch(Exception ex){
			interest = ZERO;
		}
		
		if(interest.compareTo(ZERO)>0)
		{
			
			for(int i = 0; i < keys.length;i++) 
			{
				if(i != 0){
					if(i+1 < keys.length){ //protect against array out of bounds ex.
						interest = ((DecimalField)ms.getField("E02STHMR"+keys[i])).getBigDecimal();
					} else {
						interest = null;
					}
				}
				
				if(interest != null && interest.compareTo(ZERO)>0) {
					rangeMax = ((DecimalField)ms.getField("E02STHMB"+keys[i+1]))
						.getBigDecimal().doubleValue() - RANGE_MAX_FACTOR;
					if(i == 0){
						if(rangeMax != (-RANGE_MAX_FACTOR)){
							rangeMin = ((DecimalField)ms.getField("E02STHMK"+keys[i])).getBigDecimal().doubleValue();
							amountRange = rangeFormatter.format(rangeMin)+" a "+ rangeFormatter.format(rangeMax);
						}else{
							rangeMin = ((DecimalField)ms.getField("E02STHMK"+keys[i])).getBigDecimal().doubleValue();
							amountRange = rangeFormatter.format(rangeMin)+ MESSAGE_MAX;
						}						
					} else {
						if(rangeMax == (-RANGE_MAX_FACTOR)){//make sure maximum amount is not zero
							rangeMin = ((DecimalField)ms.getField("E02STHMB"+keys[i])).getBigDecimal().doubleValue();
							amountRange = rangeFormatter.format(rangeMin)+ MESSAGE_MAX;
							
						} else {
							rangeMin = ((DecimalField)ms.getField("E02STHMB"+keys[i])).getBigDecimal().doubleValue();
							amountRange = rangeFormatter.format(rangeMin)+" a "+ rangeFormatter.format(rangeMax);
						}
						 
					}
					
					//add interest/amount to corresponding column objects
					interestColumn.add(interestFormatter.format(interest.doubleValue())+"%");
					amountColumn.add(amountRange);
				}			
				
			}
			ht.put(interestColumn, amountColumn);
			
		}
		return ht;
	}

	

}
