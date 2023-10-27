package datapro.eibs.client;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD000004Message;
import datapro.eibs.beans.ESD000005Message;
import datapro.eibs.beans.ESD000007Message;
import datapro.eibs.beans.ESD000011Message;
import datapro.eibs.beans.ESD008001Message;
import datapro.eibs.beans.ESD008002Message;
import datapro.eibs.beans.ESD008003Message;
import datapro.eibs.beans.ESD008006Message;
import datapro.eibs.beans.ESD008008Message;
import datapro.eibs.beans.ESD008009Message;
import datapro.eibs.beans.ESD008010Message;
import datapro.eibs.beans.ESD008011Message;
import datapro.eibs.beans.ESD008015Message;
import datapro.eibs.beans.ESD008020Message;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.IdentificationData;
import datapro.eibs.beans.JBListRec;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.CharacterField;
import datapro.eibs.sockets.MessageRecord;

public class JSESD0080 extends JSEIBSServlet {

	// personal client options
	protected static final int R_P_BASIC 				= 1;
	protected static final int A_P_BASIC 				= 2;
	protected static final int R_P_BENE 				= 3;
	protected static final int A_P_BENE 				= 4;
	protected static final int R_P_EMPLOYMENT 			= 5;
	protected static final int A_P_EMPLOYMENT 			= 6;
	protected static final int R_P_SHORT_BASIC 			= 7;
	protected static final int A_P_SHORT_BASIC 			= 8;
	protected static final int R_KNOW_CUSTOMER 			= 49;
	protected static final int A_KNOW_CUSTOMER 			= 50;
	// corporative client options
	protected static final int R_C_BASIC 				= 11;
	protected static final int A_C_BASIC 				= 12;
	protected static final int R_C_STOCK_HOLDER 		= 13;
	protected static final int A_C_STOCK_HOLDER 		= 14;
	protected static final int R_C_BOARD 				= 15;
	protected static final int A_C_BOARD 				= 16;
	protected static final int R_C_ASSETS 				= 17;
	protected static final int A_C_ASSETS 				= 18;
	protected static final int R_C_LIABILITIES 			= 19;
	protected static final int A_C_LIABILITIES 			= 20;
	protected static final int R_C_CAPITAL				= 21;
	protected static final int A_C_CAPITAL				= 22;
	// personal & corporative client options
	protected static final int R_CODES 					= 31;
	protected static final int A_CODES 					= 32;
	protected static final int R_MAIL_ADDRESS 			= 33;
	protected static final int A_MAIL_ADDRESS 			= 34;
	protected static final int R_SPECIAL_INST 			= 35;
	protected static final int A_SPECIAL_INST 			= 36;
	protected static final int R_COM 					= 37;
	protected static final int A_COM 					= 38;
	protected static final int R_BANK_REF 				= 39;
	protected static final int A_BANK_REF 				= 40;
	protected static final int R_COM_REF 				= 41;
	protected static final int A_COM_REF 				= 42;
 	protected static final int R_PER_REF 				= 43;
	protected static final int A_PER_REF 				= 44;
	protected static final int R_LEGAL_REP 				= 45;
	protected static final int A_LEGAL_REP 				= 46;
	protected static final int R_MARKETING 				= 47;
	protected static final int A_MARKETING 				= 48;
	protected static final int R_PAY_INSTRUCTION 		= 51;
	protected static final int A_PAY_INSTRUCTION 		= 52;
	protected static final int R_PAY_INSTRUCTION_FRAME	= 53;
	protected static final int R_ID_CHANGE_ENTER		= 54;
	protected static final int A_ID_CHANGE_ENTER		= 55;
	protected static final int A_ID_CHANGE_MAINT		= 56; 
	protected static final int R_ENTER_PAY_TYPE			= 61;
	protected static final int A_ENTER_PAY_TYPE			= 62;
	protected static final int A_PAY_TYPE				= 64;
	protected static final int R_ACCOUNT_TITLE 			= 65;
	protected static final int A_ACCOUNT_TITLE 			= 66;
	protected static final int R_CLIENT_DEBIDA 			= 67;
    protected static final int A_CLIENT_DEBIDA 			= 68;
	protected static final int R_PER_FAM 				= 70;
	protected static final int A_PER_FAM 				= 71;
	protected static final int R_PER_DEP 				= 75;
	protected static final int A_PER_DEP 				= 76;
	protected static final int R_DAT_CON 				= 80;
	protected static final int A_DAT_CON 				= 81;
	protected static final int R_PRO_EMP 				= 85;
	protected static final int A_PRO_EMP 				= 86;
	// entering options
	protected static final int R_ENTER_NEW 				= 100;
	protected static final int R_NEW_SHORT				= 101;
	protected static final int A_NEW_SHORT				= 150;
	protected static final int R_ENTER_MAINT 			= 200;
	protected static final int R_ENTER_SHORT 			= 250;
	protected static final int R_ENTER_SHORT_INQUIRY	= 255;
	protected static final int R_ENTER_INQUIRY 			= 300;
	protected static final int A_ENTER_NEW	 			= 400;
	protected static final int A_ENTER_MAINT	 		= 500;
	protected static final int A_ENTER_INQ	 			= 600;
	protected static final int R_ENTER_REPORT	 		= 700;
	protected static final int A_ENTER_REPORT	 		= 800;
	protected static final int R_REPORT	 				= 900;
	protected static final int A_FATCA	 				= 1000;

	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			// BEGIN Personal
			// Request
			case R_P_BASIC :
				procReqPerBasic(user, req, res, session);
				break;
			case R_P_SHORT_BASIC :
				procReqPerShortBasic(user, req, res, session);
				break;
			case R_P_BENE :
				procReqPerBene(user, req, res, session);
				break;
			case R_P_EMPLOYMENT :
				procReqPerEmployment(user, req, res, session);
				break;
			// Action
			case A_P_BASIC :
				procActionPerBasic(user, req, res, session);
				break;
			case A_P_SHORT_BASIC :
				procActionPerShortBasic(user, req, res, session);
				break;
			case A_P_BENE :
				procActionPerBene(user, req, res, session);
				break;
			case A_P_EMPLOYMENT :
				procActionPerEmployment(user, req, res, session);
				break;
			// END Personal
			// BEGIN Corporative 
			// Request
			case R_C_BASIC :
				procReqCorpBasic(user, req, res, session);
				break;
			case R_C_STOCK_HOLDER :
				procReqCorpStockHolder(user, req, res, session);
				break;
			case R_C_BOARD :
				procReqCorpBoard(user, req, res, session);
				break;
			case R_C_ASSETS :
				procReqCorpAssets(user, req, res, session);
				break;
			case R_C_LIABILITIES :
				procReqCorpLiabilities(user, req, res, session);
				break;
			case R_C_CAPITAL :
				procReqCorpCapital(user, req, res, session);
				break;
			// Action
			case A_C_BASIC :
				procActionCorpBasic(user, req, res, session);
				break;
			case A_C_STOCK_HOLDER :
				procActionCorpStockHolder(user, req, res, session);
				break;
			case A_C_BOARD :
				procActionCorpBoard(user, req, res, session);
				break;
			case A_C_ASSETS :
				procActionCorpAssets(user, req, res, session);
				break;
			case A_C_LIABILITIES :
				procActionCorpLiabilities(user, req, res, session);
				break;
			case A_C_CAPITAL :
				break;
			// END Corporative 
			// BEGIN Personal & Corporative 
			// Request
			case R_CODES :
				procReqCodes(user, req, res, session);
				break;
			case R_MAIL_ADDRESS :
				procReqMailAddress(user, req, res, session);
				break;
			case R_ACCOUNT_TITLE :
				procReqAccountTitle(user, req, res, session);
				break;					
			case R_SPECIAL_INST :
				procReqSpecInst(user, req, res, session);
				break;
			case R_KNOW_CUSTOMER :
				procReqKnowYourCustomer(user, req, res, session);
				break;
			case R_COM :
				procReqCom(user, req, res, session);
				break;
			case R_BANK_REF :
				procReqBankRef(user, req, res, session);
				break;
			case R_COM_REF :
				procReqComRef(user, req, res, session);
				break;
			case R_PER_REF :
				procReqPerRef(user, req, res, session);
				break;
			case R_PER_FAM :
				procReqPerFam(user, req, res, session);
				break;	
			case R_PER_DEP :
				procReqPerDep(user, req, res, session);
				break;			
			case R_DAT_CON :
				procReqDatCon(user, req, res, session);
				break;		
			case R_PRO_EMP :
				procReqProEmp(user, req, res, session);
				break;		
			case R_LEGAL_REP :
				procReqLegalRef(user, req, res, session);
				break;
			case R_MARKETING :
				procReqMarketing(user, req, res, session);
				break;
			case R_PAY_INSTRUCTION :
				procReqCorpPayInst(user, req, res, session);
				break;
			case R_PAY_INSTRUCTION_FRAME :
				forward("ESD0080_client_corp_payment_instructions_frame.jsp", req, res);
				break;
			case R_ID_CHANGE_ENTER :
				procReqIDChangeEnter(user, req, res, session);
				break;
			case R_ENTER_PAY_TYPE : 
				procReqEnterPaymentInst(user, req, res, session);
				break;	
			case A_ENTER_PAY_TYPE : 
				procActionEnterPaymentInst(user, req, res, session);
				break;
			case A_PAY_TYPE :
				procActionCorpPayInstType(user, req, res, session);
				break;
			// Action
			case A_CODES :
				procActionCodes(user, req, res, session);
				break;
			case A_MAIL_ADDRESS :
				procActionMailAddress(user, req, res, session);
				break;
			case A_ACCOUNT_TITLE :
				procActionAccountTitle(user, req, res, session);
				break;			
			case R_CLIENT_DEBIDA :
				procReqDebida(user, req, res, session);
				break;
			case A_CLIENT_DEBIDA :
				procActionDebida(user, req, res, session);
				break;	
			case A_SPECIAL_INST :
				procActionSpecialInst(user, req, res, session);
				break;
			case A_KNOW_CUSTOMER :
				procActionKnowYourCustomer(user, req, res, session);
				break;
			case A_COM :
				procActionCom(user, req, res, session);
				break;
			case A_BANK_REF :
				procActionBankRef(user, req, res, session);
				break;
			case A_COM_REF :
				procActionComRef(user, req, res, session);
				break;
			case A_PER_REF :
				procActionPerRef(user, req, res, session);
				break;
			case A_PER_FAM :
				procActionPerFam(user, req, res, session);
				break;	
			case A_PER_DEP :
				procActionPerDep(user, req, res, session);
				break;	
			case A_DAT_CON :
				procActionDatCon(user, req, res, session);
				break;		
			case A_PRO_EMP :
				procActionProEmp(user, req, res, session);
				break;	
			case A_LEGAL_REP :
				procActionLegalRep(user, req, res, session);
				break;
			case A_MARKETING :
				procActionMarketing(user, req, res, session);
				break;
			case A_PAY_INSTRUCTION :
				procActionCorpPayInst(user, req, res, session);
				break;
			case A_ID_CHANGE_ENTER :
				procActionIDChangeEnter(user, req, res, session);
				break;
			case A_ID_CHANGE_MAINT :
				procActionIDChangeMaint(user, req, res, session);
				break;
			// END Personal & Corporative 
			// BEGIN Entering
			// Request
			case R_ENTER_NEW : 
				procReqEnterNew(user, req, res, session);
				break;
			case R_ENTER_MAINT : 
				procReqEnterMaint(user, req, res, session);
				break;
			case R_NEW_SHORT:
				procReqEnterShortNew(user, req, res, session, screen);				
				break;
			case A_NEW_SHORT:				
				procEnterShortNew(user, req, res, session, screen);				
				break;

			case R_ENTER_SHORT_INQUIRY : 
			case R_ENTER_SHORT : 
				procReqEnterShort(user, req, res, session, screen);
				break;
			case R_ENTER_INQUIRY : 
				procReqEnterInq(user, req, res, session);
				break;
			// Action 
			case A_ENTER_NEW : 
				procActionEnterNew(user, req, res, session);
				break;
			case A_ENTER_MAINT : 
				procActionEnterMaint(user, req, res, session);
				break;
			case A_ENTER_INQ : 
				procActionEnterInq(user, req, res, session);
				break;
			// END Entering
			// Reports
			case R_ENTER_REPORT : 
				procReqEnterReport(user, req, res, session);
				break;
			case A_ENTER_REPORT : 
				procActionEnterReport(user, req, res, session);
				break;
			case R_REPORT :
				procReqReport(user, req, res, session);
				break;
			case A_FATCA :
				procActFatca(user, req, res, session);
				break;
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procEnterShortNew(ESS0030DSMessage user,HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) 
			throws ServletException, IOException{
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("NEW");
		String pageName = "";
		MessageProcessor mp = null;
		IdentificationData idData = null;
		try {
			idData = new IdentificationData( req.getParameter("IDN"), req.getParameter("COUNTRY"), req.getParameter("TYPE"));
			idData.setType(Util.getReqParameter("TID", req));
			
			mp = getMessageProcessor("ESD0080", req);
			ESD008020Message msgClientPersonal = (ESD008020Message) mp.getMessageRecord("ESD008020");
		 	msgClientPersonal.setH20USR(user.getH01USR());
		 	msgClientPersonal.setH20PGM("ESD0080");
		 	msgClientPersonal.setH20TIM(getTimeStamp());
		 	msgClientPersonal.setH20SCR("01");
		 	msgClientPersonal.setH20OPE("0002");
		 	msgClientPersonal.setE20LGT(idData.getLegalType());
		 	msgClientPersonal.setE20IDN(idData.getTokenizedId());
		 	msgClientPersonal.setE20PID(idData.getCountry());
		 	msgClientPersonal.setE20TID(idData.getType());
		 	msgClientPersonal.setH20WK1(Util.getReqParameter("H20WK1", req, "S"));
		 	msgClientPersonal.setH20WK2(Util.getReqParameter("WK2", req));
		 	msgClientPersonal.setE20CFL2(Util.getReqParameter("E20CFL2", req));
			
			mp.sendMessage(msgClientPersonal);
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgClientPersonal = (ESD008020Message) mp.receiveMessageRecord("ESD008020");
			idData.setCountryDescription(msgClientPersonal.getD20PID());
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				pageName = "ESD0080_short_client_both_enter_new.jsp";
				req.setAttribute("idData", idData);
				
			} else {
				userPO.setCusNum(msgClientPersonal.getE20CUN());
				userPO.setIdentifier(msgClientPersonal.getE20IDN());
				userPO.setCusName(msgClientPersonal.getE20NA1());
				userPO.setID(msgClientPersonal.getE20IDN());
				userPO.setCusType(msgClientPersonal.getE20LGT().trim());
				userPO.setHeader17(Util.addLeftZeros(4, msgClientPersonal.getE20TID()));
				userPO.setOption("CLIENT_SHORT");
				userPO.setApplicationCode("C1");

				session.setAttribute("client", msgClientPersonal);
				session.setAttribute("userPO", userPO);
				if(userPO.getCusType().equals("2")){
					pageName = "ESD0080_client_short_personal_basic.jsp";
				} else {
					pageName = "ESD0080_client_short_corp_basic.jsp";
				}
			}

			forward(pageName, req, res);
			} finally {
				if (mp != null)	mp.close();
			}
	}

	private void procActFatca(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		//Process FATCA Questions List
		
		IdentificationData idData = new IdentificationData(
				req.getParameter("IDN"), req.getParameter("COUNTRY"), "PERSONAL");
		idData.setCountryDescription(req.getParameter("COUNTRYDSC"));
		req.setAttribute("idData", idData);
		
		forward("ESD0080_client_both_enter_new.jsp", req, res);
	}

	private void procReqFatca(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		// TODO Get FATCA Questions List
		
		session.setAttribute("fatca", null);
		forward("ESD0080_client_both_enter_fatca.jsp", req, res);
	}

	private void procReqReport(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD008010Message msgClient = (ESD008010Message) mp.getMessageRecord("ESD008010");
		 	msgClient.setH10USR(user.getH01USR());
		 	msgClient.setH10PGM("ESD0080");
		 	msgClient.setH10TIM(getTimeStamp());
		 	msgClient.setH10OPE("0004");
		 	try {
		 		msgClient.setE10CUN(userPO.getCusNum().trim());
		 	} catch (Exception e) {
			 	msgClient.setE10CUN("0");
		 	}
		 	
		 	mp.sendMessage(msgClient);
		 	ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
		 	msgClient = (ESD008010Message) mp.receiveMessageRecord("ESD008010");
		 	
		 	if (mp.hasError(msgError)) {
				res.setContentType("text/html");
				printClose(res.getWriter());
		 	} else {
		 		int colNum = 20;
		 		JBListRec beanList = new JBListRec();
		 		beanList.init(colNum);
		 		String myRow[] = new String[colNum];
				for (int i=0; i<colNum; i++) {
					myRow[i] = "";
				}
		 		while (true) {
		 			ESD000011Message msgList = (ESD000011Message) mp.receiveMessageRecord("ESD000011");
		 			if ("F".equals(msgList.getH11MAS())) {
		 				break;
		 			} else if (!"*".equals(msgList.getH11MAS())) {
		 				char sel = msgList.getE11RTP().length() > 0 ? msgList.getE11RTP().charAt(0) : ' ';
		 				switch (sel) {
							case '1':
								msgClient.setXFLAG0("Y");
								break;
							case '4':
								msgClient.setXFLAG1("Y");
								break;
							case '5':
								msgClient.setE10UC3("Y");
								break;
							case '6':
								msgClient.setE10UC4("Y");
								break;
							case '7':
								msgClient.setE10UC5("Y");
								break;
							case '8':
								msgClient.setE10UC6("Y");
								break;
							case '9':
								msgClient.setE10UC7("Y");
								break;
							case 'A':
								msgClient.setE10UC8("Y");
								break;
		 				}
						myRow[0] =  Util.formatCell(msgList.getE11MA1());	// Mailing Address 1
						myRow[1] =  Util.formatCell(msgList.getE11MA2());	// Mailing Address 2
						myRow[2] =  Util.formatCell(msgList.getE11MA3());	// Mailing Address 3
						myRow[3] =  Util.formatCell(msgList.getE11CTY());	// City
						myRow[4] =  Util.formatCell(msgList.getD11STE());	// State
						myRow[5] =  Util.formatCell(msgList.getE11ZPC());	// Zip Code
						myRow[6] =  Util.formatCell(msgList.getE11POB());	// POBox
						myRow[7] =  Util.formatCell(msgList.getE11CTR());	// Country
						myRow[8] =  Util.formatCell(msgList.getE11HPN());	// Phone;
						myRow[9] =  Util.formatCell(msgList.getD11BNC());	// Citizenship
						myRow[10] =  Util.formatCell(msgList.getE11BNI());	// Identification
						myRow[11] =  Util.formatCell(msgList.getE11BSX());	// Sex
						myRow[12] =  Util.formatCell(msgList.getE11BMS());	// Marital Status
						myRow[13] =  Util.formatCell(msgList.getD11TID());	// Identification Type
						myRow[14] =  Util.formatCell(msgList.getD11PID());	// Identification Country
						myRow[15] =  Util.formatCCY(msgList.getE11AM1());	// Amount 1
						myRow[16] =  Util.formatCCY(msgList.getE11AM2());	// Amount 1
						myRow[17] =  Util.formatDate(msgList.getE11DT1(), msgList.getE11DT2(), msgList.getE11DT3()); // Date

						beanList.addRow(msgList.getE11RTP(), myRow);
		 			}
		 		}
				session.setAttribute("clientList", beanList);
				session.setAttribute("client", msgClient);
				
				forward("ESD0080_client_report.jsp", req, res);
		 	}
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActionEnterReport(ESS0030DSMessage user,
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
				userPO.setID(msgClientPersonal.getE01IDN());
				userPO.setIdentifier(msgClientPersonal.getE01IDN());
				userPO.setHeader2(msgClientPersonal.getE01IDN());
				userPO.setCusName(msgClientPersonal.getE01NA1());
				userPO.setHeader3(msgClientPersonal.getE01NA1());
				
				//session.setAttribute("client", msgClientPersonal);
				if (mp.hasError(msgError)) {
					pageName = "ESD0080_client_report_enter.jsp";
				} else {
					pageName = "ESD0080_client_report_summary.jsp";
				}
			} else if ("ESD008002".equals(newmessage.getFormatName())) {
				ESD008002Message msgClientEntity = (ESD008002Message) newmessage;
				
				userPO.setCusNum(msgClientEntity.getE02CUN());
				userPO.setCusType(msgClientEntity.getE02LGT());
				userPO.setOption("CLIENT_C");
				userPO.setHeader1(msgClientEntity.getE02CUN());
				userPO.setID(msgClientEntity.getE02IDN());
				userPO.setIdentifier(msgClientEntity.getE02IDN());
				userPO.setHeader2(msgClientEntity.getE02IDN());
				userPO.setHeader3(msgClientEntity.getE02NA1());
				userPO.setCusName(msgClientEntity.getE02NA1());
				
				//session.setAttribute("client", msgClientEntity);
				if (mp.hasError(msgError)) {
					pageName = "ESD0080_client_report_enter.jsp";
				} else {
					pageName = "ESD0080_client_report_summary.jsp";
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

	private void procReqEnterReport(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos(); 
		userPO.setOption("CLIENT");
		userPO.setPurpose("REPORT");
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		session.setAttribute("client", new ESD008001Message());
		
		forward("ESD0080_client_report_enter.jsp", req, res);
	}

	protected void procActionEnterInq(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("INQUIRY");
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
		 	msgClientPersonal.setH01WK1("I");
		 	try {
			 	msgClientPersonal.setE01CUN(req.getParameter("E01CUN").trim());
			} catch (Exception e) {
				msgClientPersonal.setE01CUN("0");
			}
			try {
		 		msgClientPersonal.setE01IDN(req.getParameter("E01IDN").trim());			 		
			} catch (Exception e) {
				msgClientPersonal.setE01IDN("");
			}
			
			mp.sendMessage(msgClientPersonal);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			MessageRecord newmessage = mp.receiveMessageRecord();
			
			if ("ESD008001".equals(newmessage.getFormatName())) {
				msgClientPersonal = (ESD008001Message) newmessage;
				
				userPO.setCusNum(msgClientPersonal.getE01CUN());
				userPO.setOption("CLIENT_P");
				userPO.setApplicationCode("C1");
				userPO.setHeader1(msgClientPersonal.getE01CUN());
				userPO.setID(msgClientPersonal.getE01IDN());
				userPO.setIdentifier(msgClientPersonal.getE01IDN());
				userPO.setHeader2(msgClientPersonal.getE01IDN());
				userPO.setCusName(msgClientPersonal.getE01NA1());
				userPO.setHeader3(msgClientPersonal.getE01NA1());
				
				session.setAttribute("client", msgClientPersonal);
				if (mp.hasError(msgError)) {
					pageName = "ESD0080_client_inq_both_enter.jsp";
				} else {
					pageName = "ESD0080_client_inq_personal_basic.jsp";
				}
			} else if ("ESD008002".equals(newmessage.getFormatName())) {
				ESD008002Message msgClientEntity = (ESD008002Message) newmessage;
				
				userPO.setCusNum(msgClientEntity.getE02CUN());
				userPO.setCusType(msgClientEntity.getE02LGT());
				userPO.setOption("CLIENT_C");
				userPO.setApplicationCode("C1");
				userPO.setHeader1(msgClientEntity.getE02CUN());
				userPO.setID(msgClientEntity.getE02IDN());
				userPO.setIdentifier(msgClientEntity.getE02IDN());
				userPO.setHeader2(msgClientEntity.getE02IDN());
				userPO.setHeader3(msgClientEntity.getE02NA1());
				userPO.setCusName(msgClientEntity.getE02NA1());
				
				session.setAttribute("client", msgClientEntity);
				if (mp.hasError(msgError)) {
					pageName = "ESD0080_client_inq_both_enter.jsp";
				} else {
					pageName = "ESD0080_client_inq_corp_basic.jsp";
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

	private void procActionEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("MAINTENANCE");
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD008001Message msgClientPersonal = (ESD008001Message) mp.getMessageRecord("ESD008001");
		 	msgClientPersonal.setH01USR(user.getH01USR());
		 	msgClientPersonal.setH01PGM("ESD0080");
		 	msgClientPersonal.setH01TIM(getTimeStamp());
		 	msgClientPersonal.setH01SCR("01");
		 	msgClientPersonal.setH01OPE("0002");
		 	try {
			 	msgClientPersonal.setE01CUN(req.getParameter("E01CUN").trim());
			} catch (Exception e) {
				msgClientPersonal.setE01CUN("0");
			}
			try {
		 		msgClientPersonal.setE01IDN(req.getParameter("E01IDN").trim());			 		
			} catch (Exception e) {
				msgClientPersonal.setE01IDN("");
			}
			
			mp.sendMessage(msgClientPersonal);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			MessageRecord newmessage = mp.receiveMessageRecord();
			
			if ("ESD008001".equals(newmessage.getFormatName())) {
				msgClientPersonal = (ESD008001Message) newmessage;
				
				userPO.setCusNum(msgClientPersonal.getE01CUN());
				userPO.setOption("CLIENT_P");
				userPO.setApplicationCode("C1");
				userPO.setCusType(msgClientPersonal.getE01LGT());
				userPO.setHeader1(msgClientPersonal.getE01CUN());
				userPO.setID(msgClientPersonal.getE01IDN());
				userPO.setIdentifier(msgClientPersonal.getE01IDN());
				userPO.setHeader2(msgClientPersonal.getE01IDN());
				userPO.setHeader3(msgClientPersonal.getE01NA1());
				userPO.setCusName(msgClientPersonal.getE01NA1());
				
				session.setAttribute("client", msgClientPersonal);
				if (mp.hasError(msgError)) {
					pageName = "ESD0080_client_both_enter.jsp";
				} else {
					pageName = "ESD0080_client_personal_basic.jsp";
				}
			} else if ("ESD008002".equals(newmessage.getFormatName())) {
				ESD008002Message msgClientEntity = (ESD008002Message) newmessage;
				
				userPO.setCusNum(msgClientEntity.getE02CUN());
				userPO.setCusType(msgClientEntity.getE02LGT());
				userPO.setOption("CLIENT_C");
				userPO.setApplicationCode("C1");
				userPO.setHeader1(msgClientEntity.getE02CUN());
				userPO.setHeader2(msgClientEntity.getE02IDN());
				userPO.setID(msgClientEntity.getE02IDN());
				userPO.setIdentifier(msgClientEntity.getE02IDN());
				userPO.setHeader3(msgClientEntity.getE02NA1());
				userPO.setCusName(msgClientEntity.getE02NA1());
				
				session.setAttribute("client", msgClientEntity);
				if (mp.hasError(msgError)) {
					pageName = "ESD0080_client_enter.jsp";
				} else {
					pageName = "ESD0080_client_corp_basic.jsp";
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

	private void procActionEnterNew(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setPurpose("NEW");
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			
			IdentificationData idData = null;
			
			if ("PERSONAL".equals(req.getParameter("TYPE")) || "USERP".equals(req.getParameter("TYPE"))) {
				idData = new IdentificationData(req.getParameter("IDN"), req.getParameter("COUNTRY"), "PERSONAL");
				
				ESD008001Message msgClientPersonal = (ESD008001Message) mp.getMessageRecord("ESD008001");
			 	msgClientPersonal.setH01USR(user.getH01USR());
			 	msgClientPersonal.setH01PGM("ESD0080");
			 	msgClientPersonal.setH01TIM(getTimeStamp());
			 	msgClientPersonal.setH01SCR("01");
			 	msgClientPersonal.setH01OPE("0001");
			 	msgClientPersonal.setE01FL1("1");
			 	msgClientPersonal.setE01LGT("2");
			 	msgClientPersonal.setE01TYP("USERP".equals(req.getParameter("TYPE")) ? "U" : "R");
			 	try {
			 		msgClientPersonal.setE01CUN(req.getParameter("CUN").trim());
				} catch (Exception e) {
					msgClientPersonal.setE01CUN("0");
				}
				try {
					msgClientPersonal.setE01TID(req.getParameter("TID").trim());
					idData.setType( msgClientPersonal.getE01TID() );
				} catch (Exception e) {
					msgClientPersonal.setE01TID("");
				}
				msgClientPersonal.setE01IDN(idData.getTokenizedId());
				msgClientPersonal.setE01PID(idData.getCountry());
				msgClientPersonal.setE01GEC(idData.getCountry());
				msgClientPersonal.setE01CFL2(Util.getReqParameter("E01CFL2", req));
				msgClientPersonal.setH01WK2(Util.getReqParameter("WK2", req));
				
				mp.sendMessage(msgClientPersonal);
			} else {
				idData = new IdentificationData(
						req.getParameter("IDN"), req.getParameter("COUNTRY"), req.getParameter("TYPE"));
				
				ESD008002Message msgClientEntity = (ESD008002Message) mp.getMessageRecord("ESD008002");
			 	msgClientEntity.setH02USR(user.getH01USR());
			 	msgClientEntity.setH02PGM("ESD0080");
			 	msgClientEntity.setH02TIM(getTimeStamp());
			 	msgClientEntity.setH02SCR("01");
			 	msgClientEntity.setE02FL1("1");
			 	msgClientEntity.setE02LGT("OTHER".equals(req.getParameter("TYPE")) ? "3" : "1");
			 	msgClientEntity.setE02TYP("USERC".equals(req.getParameter("TYPE")) ? "U" : "R");
			 	msgClientEntity.setH02OPE("0001");
			 	try {
			 		msgClientEntity.setE02CUN(req.getParameter("CUN").trim());
				} catch (Exception e) {
					msgClientEntity.setE02CUN("0");
				}
				try {
					msgClientEntity.setE02TID(req.getParameter("TID").trim());
					idData.setType( msgClientEntity.getE02TID() );
				} catch (Exception e) {
					msgClientEntity.setE02TID("");
				}
				msgClientEntity.setE02IDN(idData.getTokenizedId());
				msgClientEntity.setE02PID(idData.getCountry());
				msgClientEntity.setE02GEC(idData.getCountry());
				msgClientEntity.setH02WK2(Util.getReqParameter("WK2", req));
			 	
				mp.sendMessage(msgClientEntity);
			}
			
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			MessageRecord newmessage = mp.receiveMessageRecord();
			
			if ("ESD008001".equals(newmessage.getFormatName())) {
				ESD008001Message msgClientPersonal = (ESD008001Message) newmessage;
				
				userPO.setCusNum(msgClientPersonal.getE01CUN());
				userPO.setID(msgClientPersonal.getE01IDN());
				userPO.setIdentifier(msgClientPersonal.getE01IDN());
				userPO.setCusName(msgClientPersonal.getE01NA1());
				userPO.setOption("CLIENT_P");
				userPO.setApplicationCode("C1");
				
				idData.setCountryDescription(msgClientPersonal.getD01GEC());
				
				session.setAttribute("client", msgClientPersonal);
				if (mp.hasError(msgError)) {
					pageName = "ESD0080_client_both_enter_new.jsp";
				} else {
					if ("USERP".equals(req.getParameter("TYPE"))) {
						pageName = "ESD0080_client_usuario_personal_basic.jsp";
					} else {
						pageName = "ESD0080_client_personal_basic.jsp";
					}
				}
			} else if ("ESD008002".equals(newmessage.getFormatName())) {
				ESD008002Message msgClientEntity = (ESD008002Message) newmessage;
				session.setAttribute("client", msgClientEntity);
				
				userPO.setCusNum(msgClientEntity.getE02CUN());
				userPO.setID(msgClientEntity.getE02IDN());
				userPO.setIdentifier(msgClientEntity.getE02IDN());
				userPO.setCusName(msgClientEntity.getE02NA1());
				userPO.setOption("CLIENT_C");
				userPO.setApplicationCode("C1");
				
				idData.setCountryDescription(msgClientEntity.getD02GEC());
				
				if (mp.hasError(msgError)) {
					pageName = "ESD0080_client_both_enter_new.jsp";
				} else {
					pageName = "ESD0080_client_corp_basic.jsp";
				}
			} else {
				throw new ServletException("Message " + newmessage.getFormatName() + " received.");
			}
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
		    session.setAttribute("userPO", userPO);

			req.setAttribute("idData", idData);
			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqEnterInq(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos(); 
		userPO.setOption("CLIENT");
		userPO.setPurpose("INQUIRY");
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		session.setAttribute("client", new ESD008001Message());
		
		forward("ESD0080_client_inq_both_enter.jsp", req, res);
	}
	
	
	private void procReqEnterShortNew(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		
		UserPos userPO = new UserPos(); 
		userPO.setOption("CLIENT_SHORT");
		userPO.setPurpose("NEW");
		IdentificationData idData = new IdentificationData();
		idData.setCountry(user.getE01CTR());
		idData.setCountryDescription(user.getE01CTD());
		req.setAttribute("idData", idData);		
		session.setAttribute("userPO", userPO);
		session.setAttribute("client", new ESD008020Message());
		forwardOnSuccess("ESD0080_short_client_both_enter_new.jsp", req, res);
	}	
	
	

	private void procReqEnterShort(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		
		UserPos userPO = new UserPos(); 
		userPO.setOption("CLIENT_SHORT");
		if(screen == R_ENTER_SHORT){
			userPO.setPurpose("MAINTENANCE");
		} else {
			userPO.setPurpose("INQUIRY");
		}
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		
		session.setAttribute("client", new ESD008020Message());
		
		forward("ESD0080_client_short_enter_identification_option.jsp", req, res);
	}

	private void procReqEnterMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos(); 
		userPO.setOption("CLIENT");
		userPO.setPurpose("MAINTENANCE");
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		session.setAttribute("client", new ESD008001Message());
		
		forward("ESD0080_client_both_enter.jsp", req, res);
	}

	private void procReqEnterNew(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos(); 
		userPO.setOption("CLIENT");
		userPO.setPurpose("NEW");
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		
		IdentificationData idData = new IdentificationData();
		idData.setCountry(user.getE01CTR());
		idData.setCountryDescription(user.getE01CTD());
		req.setAttribute("idData", idData);
		
		forward("ESD0080_client_both_enter_new.jsp", req, res);
	}

	private void procActionIDChangeMaint(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD008015Message msgClient = (ESD008015Message) mp.getMessageRecord("ESD008015");
			msgClient.setH15USR(user.getH01USR());
		 	msgClient.setH15PGM("ESD0080");
		 	msgClient.setH15TIM(getTimeStamp());
		 	msgClient.setH15SCR("01");
		 	msgClient.setH15OPE("0005");
		 	msgClient.setH15OPE("Y".equals(req.getParameter("APPROVAL")) ? "0006" : "");
		 	try {
				msgClient.setE15IDN(req.getParameter("IDN").trim());
			} catch (Exception e) {
			}
			setMessageRecord(req, msgClient);
			
			mp.sendMessage(msgClient);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgClient = (ESD008015Message) mp.receiveMessageRecord("ESD008015");
			
			userPO.setCusNum(msgClient.getE15CUN());
			userPO.setHeader1(msgClient.getE15CUN());
			userPO.setHeader2(msgClient.getE15IDN());		
			userPO.setID(msgClient.getE15IDN());			
			userPO.setIdentifier(msgClient.getE15IDN());			
			userPO.setCusName(msgClient.getE15NA1());
			userPO.setHeader3(msgClient.getE15NA1());
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
		    session.setAttribute("userPO", userPO);
			
			if (mp.hasError(msgError)) {
				forward("ESD0080_client_id_change.jsp", req, res);
			} else {
				redirect("datapro.eibs.client.JSESD0080?SCREEN=54", res);
			}
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActionIDChangeEnter(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD008015Message msgClient = (ESD008015Message) mp.getMessageRecord("ESD008015");
		 	msgClient.setH15USR(user.getH01USR());
		 	msgClient.setH15PGM("ESD0080");
		 	msgClient.setH15TIM(getTimeStamp());
		 	msgClient.setH15SCR("01");
		 	msgClient.setH15OPE("0002");
		 	try {
			 	msgClient.setE15CUN(req.getParameter("E01CUN").trim());
			} catch (Exception e) {
				msgClient.setE15CUN("0");
			}
			try {
		 		msgClient.setE15IDN(req.getParameter("E01IDN").trim());
			} catch (Exception e) {
				msgClient.setE15IDN("");
			}
			
			mp.sendMessage(msgClient);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgClient = (ESD008015Message) mp.receiveMessageRecord("ESD008015");
			
			userPO.setCusNum(msgClient.getE15CUN());
			userPO.setCusType(msgClient.getE15LGT());
			userPO.setHeader1(msgClient.getE15CUN());
			userPO.setHeader2(msgClient.getE15IDN());
			userPO.setID(msgClient.getE15IDN());
			userPO.setIdentifier(msgClient.getE15IDN());
			userPO.setCusName(msgClient.getE15NA1());
			userPO.setHeader3(msgClient.getE15NA1());
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("msgClient", msgClient);
			session.setAttribute("userPO", userPO);
			
			if (mp.hasError(msgError)) {
				pageName = "ESD0080_client_id_change_enter.jsp";
			} else {
				pageName = "ESD0080_client_id_change.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActionCorpPayInst(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "S".equals(req.getParameter("ACTION")) ? "0005" : "0004";
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
		 	setMessageRecord(req, msgPayInst);
			
			mp.sendMessage(msgPayInst);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgPayInst = (ESD008011Message) mp.receiveMessageRecord("ESD008011");
			
			if (mp.hasError(msgError)) {
				pageName = "ESD0080_client_corp_payment_inst.jsp"; //Check this page.
			} else {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_corp_payment_instructions.jsp";
				} else {
					pageName = "ESD0080_client_corp_payment_instructions.jsp";
				}
			}
		 	 
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("pymInst", msgPayInst);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActionMarketing(ESS0030DSMessage user,
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
		 	msgMarketing.setH09OPE("0005");
		 	msgMarketing.setE09CUN(userPO.getCusNum());
			setMessageRecord(req, msgMarketing);
			
			mp.sendMessage(msgMarketing);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgMarketing = (ESD008009Message) mp.receiveMessageRecord("ESD008009");
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("marketing", msgMarketing);
			
			if (mp.hasError(msgError)) {
				pageName = "ESD0080_client_both_marketing.jsp";
			} else {
				if ("CLIENT_P".equals(userPO.getOption())) {
					pageName = "ESD0080_client_personal_basic.jsp";
				} else {
					pageName = "ESD0080_client_corp_basic.jsp";
				}
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActionLegalRep(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgLegalRep = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgLegalRep.setH04USR(user.getH01USR());
		 	msgLegalRep.setH04PGM("ESD0080");
		 	msgLegalRep.setH04TIM(getTimeStamp());
		 	msgLegalRep.setH04SCR("01");
		 	msgLegalRep.setH04OPE("0005");
		 	msgLegalRep.setE04CUN(userPO.getCusNum());
		 	msgLegalRep.setE04RTP("5");
			setMessageRecord(req, msgLegalRep);
			
			mp.sendMessage(msgLegalRep);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgLegalRep = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("legalRep", msgLegalRep);
			
			if (mp.hasError(msgError)) {
				pageName = "ESD0080_client_both_legal_rep.jsp";
			} else {
				if ("2".equals(userPO.getCusType())) {
					pageName = "ESD0080_client_personal_basic.jsp";
				} else {
					pageName = "ESD0080_client_corp_basic.jsp";
				}
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActionProEmp(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgProEmp = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgProEmp.setH04USR(user.getH01USR());
			msgProEmp.setH04PGM("ESD0080");
			msgProEmp.setH04TIM(getTimeStamp());
			msgProEmp.setH04SCR("01");
			msgProEmp.setH04OPE("0005");
			msgProEmp.setE04CUN(userPO.getCusNum());
			msgProEmp.setE04RTP("D");
			setMessageRecord(req, msgProEmp);
			
			mp.sendMessage(msgProEmp);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgProEmp = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("datCon", msgProEmp);
			
			if (mp.hasError(msgError)) {
				pageName = "ESD0080_client_both_pro_emp.jsp";
			} else {
				if ("CLIENT_P".equals(userPO.getOption())) {
					pageName = "ESD0080_client_personal_basic.jsp";
				} else {
					pageName = "ESD0080_client_corp_basic.jsp";
				}
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActionDatCon(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgDatCon = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgDatCon.setH04USR(user.getH01USR());
			msgDatCon.setH04PGM("ESD0080");
			msgDatCon.setH04TIM(getTimeStamp());
			msgDatCon.setH04SCR("01");
			msgDatCon.setH04OPE("0005");
			msgDatCon.setE04CUN(userPO.getCusNum());
			msgDatCon.setE04RTP("M");
			setMessageRecord(req, msgDatCon);
			
			mp.sendMessage(msgDatCon);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgDatCon = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("datCon", msgDatCon);
			
			if (mp.hasError(msgError)) {
				pageName = "ESD0080_client_both_dat_con.jsp";
			} else {
				if ("CLIENT_P".equals(userPO.getOption())) {
					pageName = "ESD0080_client_personal_basic.jsp";
				} else {
					pageName = "ESD0080_client_corp_basic.jsp";
				}
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActionPerDep(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgPerDep = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgPerDep.setH04USR(user.getH01USR());
			msgPerDep.setH04PGM("ESD0080");
			msgPerDep.setH04TIM(getTimeStamp());
			msgPerDep.setH04SCR("01");
			msgPerDep.setH04OPE("0005");
			msgPerDep.setE04CUN(userPO.getCusNum());
			msgPerDep.setE04RTP("C");
			setMessageRecord(req, msgPerDep);
			
			mp.sendMessage(msgPerDep);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgPerDep = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("perDep", msgPerDep);
			
			if (mp.hasError(msgError)) {
				pageName = "ESD0080_client_both_per_dep.jsp";
			} else {
				if ("CLIENT_P".equals(userPO.getOption())) {
					pageName = "ESD0080_client_personal_basic.jsp";
				} else {
					pageName = "ESD0080_client_corp_basic.jsp";
				}
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActionPerFam(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgPerFam = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgPerFam.setH04USR(user.getH01USR());
			msgPerFam.setH04PGM("ESD0080");
			msgPerFam.setH04TIM(getTimeStamp());
			msgPerFam.setH04SCR("01");
			msgPerFam.setH04OPE("0005");
			msgPerFam.setE04CUN(userPO.getCusNum());
			msgPerFam.setE04RTP("F");
			setMessageRecord(req, msgPerFam);
			
			mp.sendMessage(msgPerFam);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgPerFam = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("perFam", msgPerFam);
			
			if (mp.hasError(msgError)) {
				pageName = "ESD0080_client_both_per_fam.jsp";
			} else {
				if ("CLIENT_P".equals(userPO.getOption())) {
					pageName = "ESD0080_client_personal_basic.jsp";
				} else {
					pageName = "ESD0080_client_corp_basic.jsp";
				}
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActionPerRef(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgPerRef = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgPerRef.setH04USR(user.getH01USR());
		 	msgPerRef.setH04PGM("ESD0080");
		 	msgPerRef.setH04TIM(getTimeStamp());
		 	msgPerRef.setH04SCR("01");
		 	msgPerRef.setH04OPE("0005");
		 	msgPerRef.setE04CUN(userPO.getCusNum());
		 	msgPerRef.setE04RTP("P");
			setMessageRecord(req, msgPerRef);
			
			mp.sendMessage(msgPerRef);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgPerRef = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("perRef", msgPerRef);
			
			if (mp.hasError(msgError)) {
				pageName = "ESD0080_client_both_per_ref.jsp";
			} else {
				if ("CLIENT_P".equals(userPO.getOption())) {
					pageName = "ESD0080_client_personal_basic.jsp";
				} else {
					pageName = "ESD0080_client_corp_basic.jsp";
				}
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActionComRef(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgComRef = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgComRef.setH04USR(user.getH01USR());
		 	msgComRef.setH04PGM("ESD0080");
		 	msgComRef.setH04TIM(getTimeStamp());
		 	msgComRef.setH04SCR("01");
		 	msgComRef.setH04OPE("0005");
		 	msgComRef.setE04CUN(userPO.getCusNum());
		 	msgComRef.setE04RTP("7");
			setMessageRecord(req, msgComRef);
			
			mp.sendMessage(msgComRef);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgComRef = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("comRef", msgComRef);
			
			if (mp.hasError(msgError)) {
				pageName = "ESD0080_client_both_com_ref.jsp";
			} else {
				if ("CLIENT_P".equals(userPO.getOption())) {
					pageName = "ESD0080_client_personal_basic.jsp";
				} else {
					pageName = "ESD0080_client_corp_basic.jsp";
				}
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActionBankRef(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgBankRef = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgBankRef.setH04USR(user.getH01USR());
		 	msgBankRef.setH04PGM("ESD0080");
		 	msgBankRef.setH04TIM(getTimeStamp());
		 	msgBankRef.setH04SCR("01");
		 	msgBankRef.setH04OPE("0005");
		 	msgBankRef.setE04CUN(userPO.getCusNum());
		 	msgBankRef.setE04RTP("6");
			setMessageRecord(req, msgBankRef);
			
			mp.sendMessage(msgBankRef);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgBankRef = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("bankRef", msgBankRef);
			
			if (mp.hasError(msgError)) {
				pageName = "ESD0080_client_both_bank_ref.jsp";
			} else {
				if ("CLIENT_P".equals(userPO.getOption())) {
					pageName = "ESD0080_client_personal_basic.jsp";
				} else {
					pageName = "ESD0080_client_corp_basic.jsp";
				}
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActionCom(ESS0030DSMessage user, HttpServletRequest req,
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
		 	msgCom.setH07OPE("0005");
		 	msgCom.setE07CUN(userPO.getCusNum());
			setMessageRecord(req, msgCom);
			
			mp.sendMessage(msgCom);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgCom = (ESD000007Message) mp.receiveMessageRecord("ESD000007");
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("com", msgCom);
			
			if (mp.hasError(msgError)) {
				pageName = "ESD0080_client_both_com.jsp";
			} else {
				if ("CLIENT_P".equals(userPO.getOption())) {
					pageName = "ESD0080_client_personal_basic.jsp";
				} else {
					pageName = "ESD0080_client_corp_basic.jsp";
				}
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActionKnowYourCustomer(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000005Message msgSpecialInst = (ESD000005Message) mp.getMessageRecord("ESD000005");
			msgSpecialInst.setH05USR(user.getH01USR());
		 	msgSpecialInst.setH05PGM("ESD0080");
		 	msgSpecialInst.setH05TIM(getTimeStamp());
		 	msgSpecialInst.setH05SCR("01");
		 	msgSpecialInst.setH05OPE("0005");
		 	msgSpecialInst.setE05ACD("K1");
		 	msgSpecialInst.setE05ACC(userPO.getCusNum());
			setMessageRecord(req, msgSpecialInst);
			
			mp.sendMessage(msgSpecialInst);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgSpecialInst = (ESD000005Message) mp.receiveMessageRecord("ESD000005");
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("specInst", msgSpecialInst);
			
			if (mp.hasError(msgError)) {
				pageName = "ESD0080_client_both_know_your_customer.jsp";
			} else {
				if ("CLIENT_P".equals(userPO.getOption())) {
					pageName = "ESD0080_client_personal_basic.jsp";
				} else {
					pageName = "ESD0080_client_corp_basic.jsp";
				}
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActionSpecialInst(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000005Message msgSpecialInst = (ESD000005Message) mp.getMessageRecord("ESD000005");
			msgSpecialInst.setH05USR(user.getH01USR());
		 	msgSpecialInst.setH05PGM("ESD0080");
		 	msgSpecialInst.setH05TIM(getTimeStamp());
		 	msgSpecialInst.setH05SCR("01");
		 	msgSpecialInst.setH05OPE("0005");
		 	msgSpecialInst.setE05ACD("C1");
		 	msgSpecialInst.setE05ACC(userPO.getCusNum());
			setMessageRecord(req, msgSpecialInst);
			
			mp.sendMessage(msgSpecialInst);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgSpecialInst = (ESD000005Message) mp.receiveMessageRecord("ESD000005");
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("specInst", msgSpecialInst);
			
			if (mp.hasError(msgError)) {
				pageName = "ESD0080_client_both_special_inst.jsp";
			} else {
				if ("CLIENT_P".equals(userPO.getOption())) {
					pageName = "ESD0080_client_personal_basic.jsp";
				} else {
					pageName = "ESD0080_client_corp_basic.jsp";
				}
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActionDebida(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgDebida = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgDebida.setH04USR(user.getH01USR());
			msgDebida.setH04PGM("ESD0080");
			msgDebida.setH04TIM(getTimeStamp());
			msgDebida.setH04SCR("01");
			msgDebida.setH04OPE("0005");
			msgDebida.setE04CUN(userPO.getCusNum());
			msgDebida.setE04RTP("*");
			setMessageRecord(req, msgDebida);
			
			mp.sendMessage(msgDebida);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgDebida = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("Debida", msgDebida);
			
			if (mp.hasError(msgError)) {
				forward("ESD0080_client_both_debida.jsp", req, res);
			} else {
				if ("2".equals(userPO.getCusType())) {
					redirect("datapro.eibs.client.JSESD0080?SCREEN=1", res);
				} else {
					redirect("datapro.eibs.client.JSESD0080?SCREEN=11", res);
				}
			}
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procReqDebida(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "0002";
		if ("NEW".equals(userPO.getPurpose())) {
			opCode = "0001";
		} else if ("INQUIRY".equals(userPO.getPurpose())) {
			opCode = "0004";
		}	
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgLR = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgLR.setH04USR(user.getH01USR());
			msgLR.setH04PGM("ESD0080");
			msgLR.setH04TIM(getTimeStamp());
			msgLR.setH04SCR("01");
			msgLR.setH04OPE(opCode);
			msgLR.setE04CUN(userPO.getCusNum());
			msgLR.setE04RTP("*");
			
			mp.sendMessage(msgLR);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgLR = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			if (mp.hasError(msgError)) {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_enter.jsp";
				} else {
					pageName = "ESD0080_client_both_enter.jsp";
				}
			} else {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_debida.jsp";
				} else {
					pageName = "ESD0080_client_both_debida.jsp";
				}
			}
		 	 
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("debida", msgLR);

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
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgMailAddress = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgMailAddress.setH04USR(user.getH01USR());
			msgMailAddress.setH04PGM("ESD0080");
			msgMailAddress.setH04TIM(getTimeStamp());
			msgMailAddress.setH04SCR("01");
			msgMailAddress.setH04OPE("0005");
			msgMailAddress.setE04CUN(userPO.getCusNum());
			msgMailAddress.setE04RTP("1");
			msgMailAddress.setH04WK1("T");
			setMessageRecord(req, msgMailAddress);
			
			mp.sendMessage(msgMailAddress);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgMailAddress = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("mailA", msgMailAddress);
			
			if (mp.hasError(msgError)) {
				pageName = "ESD0080_client_both_account_title.jsp";
			} else {
				if ("CLIENT_P".equals(userPO.getOption())) {
					pageName = "ESD0080_client_personal_basic.jsp";
				} else {
					pageName = "ESD0080_client_corp_basic.jsp";
				}
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActionMailAddress(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgMailAddress = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgMailAddress.setH04USR(user.getH01USR());
		 	msgMailAddress.setH04PGM("ESD0080");
		 	msgMailAddress.setH04TIM(getTimeStamp());
		 	msgMailAddress.setH04SCR("01");
		 	msgMailAddress.setH04OPE("0005");
		 	msgMailAddress.setE04CUN(userPO.getCusNum());
		 	msgMailAddress.setE04RTP("1");
			setMessageRecord(req, msgMailAddress);
			
			mp.sendMessage(msgMailAddress);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgMailAddress = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("mailA", msgMailAddress);
			
			if (mp.hasError(msgError)) {
				pageName = "ESD0080_client_both_mail_address.jsp";
			} else {
				if ("CLIENT_P".equals(userPO.getOption())) {
					pageName = "ESD0080_client_personal_basic.jsp";
				} else {
					pageName = "ESD0080_client_corp_basic.jsp";
				}
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActionCorpAssets(ESS0030DSMessage user,
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
		 	msgAssets.setH04OPE("0005");
		 	msgAssets.setE04CUN(userPO.getCusNum());
		 	msgAssets.setE04RTP("9");
			setMessageRecord(req, msgAssets);
			
			mp.sendMessage(msgAssets);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgAssets = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("assets", msgAssets);
			
			if (mp.hasError(msgError)) {
				pageName = "ESD0080_client_corp_assets.jsp";
			} else {
				if ("CLIENT_P".equals(userPO.getOption())) {
					pageName = "ESD0080_client_personal_basic.jsp";
				} else {
					pageName = "ESD0080_client_corp_basic.jsp";
				}
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActionCorpBoard(ESS0030DSMessage user,
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
		 	msgBoard.setH04OPE("0005");
		 	msgBoard.setE04CUN(userPO.getCusNum());
		 	msgBoard.setE04RTP("3");
			setMessageRecord(req, msgBoard);
			
			mp.sendMessage(msgBoard);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgBoard = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("board", msgBoard);
			
			if (mp.hasError(msgError)) {
				pageName = "ESD0080_client_corp_board.jsp";
			} else {
				pageName = "ESD0080_client_corp_basic.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActionCorpStockHolder(ESS0030DSMessage user,
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
		 	msgStockHolder.setH04OPE("0005");
		 	msgStockHolder.setE04CUN(userPO.getCusNum());
		 	msgStockHolder.setE04RTP("2");
			setMessageRecord(req, msgStockHolder);
			
			mp.sendMessage(msgStockHolder);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgStockHolder = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("stockHolder", msgStockHolder);
			
			if (mp.hasError(msgError)) {
				pageName = "ESD0080_client_corp_stock_holder.jsp";
			} else {
				pageName = "ESD0080_client_corp_basic.jsp";
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActionCorpBasic(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD008002Message msgClient = (ESD008002Message) mp.getMessageRecord("ESD008002");
			msgClient.setH02USR(user.getH01USR());
		 	msgClient.setH02PGM("ESD0080");
		 	msgClient.setH02TIM(getTimeStamp());
		 	msgClient.setH02SCR("01");
		 	msgClient.setH02OPE("0005");
		 	msgClient.setH02OPE("Y".equals(req.getParameter("APPROVAL")) ? "0006" : "");
			try {
			 	msgClient.setE02CUN(req.getParameter("E02CUN").trim());
			} catch (Exception e) {
			 	msgClient.setE02CUN("");
			}
			
			
			((CharacterField)msgClient.getField("E02IAD")).setStringUD(Util.getReqParameter("E02IAD", req));
			((CharacterField)msgClient.getField("E02WEB")).setStringUD(Util.getReqParameter("E02WEB", req));
			((CharacterField)msgClient.getField("E02CUMIAD")).setStringUD(Util.getReqParameter("E02CUMIAD", req));
			((CharacterField)msgClient.getField("E02CUMWEB")).setStringUD(Util.getReqParameter("E02CUMWEB", req));

			msgClient.setE02LGT("1"); // Client Corporative
			setMessageRecord(req, msgClient);
			String tes = "1".equals(req.getParameter("E02FL8_TES")) ? "T" : "";
			String fid = "1".equals(req.getParameter("E02FL8_FID")) ? "F" : "";
			String fem = "1".equals(req.getParameter("E02FL8_FEM")) ? "E" : "";
			String ter = "1".equals(req.getParameter("E02FL8_TER")) ? "R" : "";
			msgClient.setE02FL8(tes + fid + fem + ter);
			
			mp.sendMessage(msgClient);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgClient = (ESD008002Message) mp.receiveMessageRecord("ESD008002");
			
			if (mp.hasError(msgError)) {
				pageName = "ESD0080_client_corp_basic.jsp";
			} else {
				if ("NEW".equals(userPO.getPurpose()) || "A".equals(msgClient.getE02SFR())) {
					pageName = "ESD0080_client_corp_confirm.jsp";
				} else {
					pageName = "ESD0080_client_corp_basic.jsp";
				}
				userPO.setPurpose("MAINTENANCE");
			}
			
			userPO.setCusNum(msgClient.getE02CUN());
			userPO.setHeader1(msgClient.getE02CUN());
			userPO.setHeader2(msgClient.getE02IDN());
			userPO.setID(msgClient.getE02IDN());			
			userPO.setIdentifier(msgClient.getE02IDN());			
			userPO.setCusName(msgClient.getE02NA1());
			userPO.setHeader3(msgClient.getE02NA1());
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("client", msgClient);
		    session.setAttribute("userPO", userPO);
			
			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActionCodes(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD008003Message msgCodes = (ESD008003Message) mp.getMessageRecord("ESD008003");
			msgCodes.setH03USR(user.getH01USR());
		 	msgCodes.setH03PGM("ESD0080");
		 	msgCodes.setH03TIM(getTimeStamp());
		 	msgCodes.setH03SCR("01");
		 	msgCodes.setH03OPE("0005");
		 	msgCodes.setE03CUN(userPO.getCusNum());
			setMessageRecord(req, msgCodes);
			
			mp.sendMessage(msgCodes);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgCodes = (ESD008003Message) mp.receiveMessageRecord("ESD008003");
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("codes", msgCodes);
			
			if (mp.hasError(msgError)) {
				forward("ESD0080_client_both_codes.jsp", req, res);
			} else {
				if ("CLIENT_P".equals(userPO.getOption())) {
					redirect("datapro.eibs.client.JSESD0080?SCREEN=1", res);
				} else {
					redirect("datapro.eibs.client.JSESD0080?SCREEN=11", res);
				}
			}
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqCorpCapital(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "0002";
		if ("NEW".equals(userPO.getPurpose())) {
			opCode = "0001";
		} else if ("INQUIRY".equals(userPO.getPurpose())) {
			opCode = "0004";
		}	
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD008008Message msgCapital = (ESD008008Message) mp.getMessageRecord("ESD008008");
		 	msgCapital.setH08USR(user.getH01USR());
		 	msgCapital.setH08PGM("ESD0080");
		 	msgCapital.setH08TIM(getTimeStamp());
		 	msgCapital.setH08SCR("01");
		 	msgCapital.setH08OPE(opCode);
		 	msgCapital.setE08CUN(userPO.getCusNum());
			
			mp.sendMessage(msgCapital);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgCapital = (ESD008008Message) mp.receiveMessageRecord("ESD008008");
			
			if (mp.hasError(msgError)) {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_enter.jsp";
				} else {
					pageName = "ESD0080_client_both_enter.jsp";
				}
			} else {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_corp_capital.jsp";
				} else {
					pageName = "ESD0080_client_corp_capital.jsp";
				}
				BigDecimal liquid = new BigDecimal("0.00");
				BigDecimal asset = msgCapital.getBigDecimalE08A11();
				BigDecimal liabilities = msgCapital.getBigDecimalE08L11();
				
				liquid = liquid.add(asset);
				liquid = liquid.subtract(liabilities);						
				userPO.setHeader21(Util.formatCCY(liquid.toString()));
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

	private void procActionCorpPayInstType(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "S".equals(req.getParameter("ACTION")) ? "0005" : "0004";
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
		 	setMessageRecord(req, msgPayInst);
			if ("".equals(msgPayInst.getE11OFB())) {
				try {
					msgPayInst.setE11OFA(req.getParameter("E11CTA").trim());
				} catch (Exception e) {
				}
			} else {
				try {
					msgPayInst.setE11OFA(req.getParameter("E11GL").trim());
				} catch (Exception e) {
				}
			}
			
			mp.sendMessage(msgPayInst);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgPayInst = (ESD008011Message) mp.receiveMessageRecord("ESD008011");
			
			if (mp.hasError(msgError)) {
				pageName = "ESD0080_client_corp_payment_inst.jsp";
			} else {
				pageName = "ESD0080_client_corp_enter_inst.jsp";
			}
		 	 
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("pymInst", msgPayInst);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procActionEnterPaymentInst(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
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
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_corp_enter_inst.jsp";
				} else {
					pageName = "ESD0080_client_corp_enter_inst.jsp";
				}
			} else {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_corp_payment_inst.jsp";
				} else {
					pageName = "ESD0080_client_corp_payment_inst.jsp";
				}
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
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("client", new ESD008001Message());
		
		if ("INQUIRY".equals(userPO.getPurpose())) {
			pageName = "ESD0080_client_inq_corp_enter_inst.jsp";
		} else {
			pageName = "ESD0080_client_corp_enter_inst.jsp";
		}
		forward(pageName, req, res);
	}

	private void procReqIDChangeEnter(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos(); 
		userPO.setOption("CLIENT");
		userPO.setPurpose("MAINTENANCE");
		session.setAttribute("error", new ELEERRMessage());
		session.setAttribute("userPO", userPO);
		
		forward("ESD0080_client_id_change_enter.jsp", req, res);
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
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_corp_basic.jsp";
				} else {
					pageName = "ESD0080_client_corp_basic.jsp";
				}
			}
		 	 
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("pymInst", msgPayInst);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqMarketing(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "0002";
		if ("NEW".equals(userPO.getPurpose())) {
			opCode = "0001";
		} else if ("INQUIRY".equals(userPO.getPurpose())) {
			opCode = "0004";
		}	
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD008009Message msgMarketing = (ESD008009Message) mp.getMessageRecord("ESD008009");
		 	msgMarketing.setH09USR(user.getH01USR());
		 	msgMarketing.setH09PGM("ESD0080");
		 	msgMarketing.setH09TIM(getTimeStamp());
		 	msgMarketing.setH09SCR("01");
		 	msgMarketing.setH09OPE(opCode);
		 	msgMarketing.setE09CUN(userPO.getCusNum());
			
			mp.sendMessage(msgMarketing);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgMarketing = (ESD008009Message) mp.receiveMessageRecord("ESD008009");
			
			if (mp.hasError(msgError)) {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_enter.jsp";
				} else {
					pageName = "ESD0080_client_both_enter.jsp";
				}
			} else {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_marketing.jsp";
				} else {
					pageName = "ESD0080_client_both_marketing.jsp";
				}
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
		String opCode = "0002";
		if ("NEW".equals(userPO.getPurpose())) {
			opCode = "0001";
		} else if ("INQUIRY".equals(userPO.getPurpose())) {
			opCode = "0004";
		}	
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgLR = (ESD000004Message) mp.getMessageRecord("ESD000004");
		 	msgLR.setH04USR(user.getH01USR());
		 	msgLR.setH04PGM("ESD0080");
		 	msgLR.setH04TIM(getTimeStamp());
		 	msgLR.setH04SCR("01");
		 	msgLR.setH04OPE(opCode);
		 	msgLR.setE04CUN(userPO.getCusNum());
		 	msgLR.setE04RTP("5");
			
			mp.sendMessage(msgLR);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgLR = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			if (mp.hasError(msgError)) {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_enter.jsp";
				} else {
					pageName = "ESD0080_client_both_enter.jsp";
				}
			} else {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_legal_rep.jsp";
				} else {
					pageName = "ESD0080_client_both_legal_rep.jsp";
				}
			}
		 	 
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("legalRep", msgLR);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqProEmp(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "0002";
		if ("NEW".equals(userPO.getPurpose())) {
			opCode = "0001";
		} else if ("INQUIRY".equals(userPO.getPurpose())) {
			opCode = "0004";
		}	
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgPE = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgPE.setH04USR(user.getH01USR());
			msgPE.setH04PGM("ESD0080");
			msgPE.setH04TIM(getTimeStamp());
			msgPE.setH04SCR("01");
			msgPE.setH04OPE(opCode);
			msgPE.setE04CUN(userPO.getCusNum());
			msgPE.setE04RTP("D");
			
			mp.sendMessage(msgPE);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgPE = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			if (mp.hasError(msgError)) {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_enter.jsp";
				} else {
					pageName = "ESD0080_client_both_enter.jsp";
				}
			} else {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_pro_emp.jsp";
				} else {
					pageName = "ESD0080_client_both_pro_emp.jsp";
				}
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
		String opCode = "0002";
		if ("NEW".equals(userPO.getPurpose())) {
			opCode = "0001";
		} else if ("INQUIRY".equals(userPO.getPurpose())) {
			opCode = "0004";
		}	
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgDC = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgDC.setH04USR(user.getH01USR());
			msgDC.setH04PGM("ESD0080");
			msgDC.setH04TIM(getTimeStamp());
			msgDC.setH04SCR("01");
			msgDC.setH04OPE(opCode);
			msgDC.setE04CUN(userPO.getCusNum());
			msgDC.setE04RTP("M");
			
			mp.sendMessage(msgDC);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgDC = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			if (mp.hasError(msgError)) {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_enter.jsp";
				} else {
					pageName = "ESD0080_client_both_enter.jsp";
				}
			} else {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_dat_con.jsp";
				} else {
					pageName = "ESD0080_client_both_dat_con.jsp";
				}
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
		String opCode = "0002";
		if ("NEW".equals(userPO.getPurpose())) {
			opCode = "0001";
		} else if ("INQUIRY".equals(userPO.getPurpose())) {
			opCode = "0004";
		}	
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgDE = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgDE.setH04USR(user.getH01USR());
			msgDE.setH04PGM("ESD0080");
			msgDE.setH04TIM(getTimeStamp());
			msgDE.setH04SCR("01");
			msgDE.setH04OPE(opCode);
			msgDE.setE04CUN(userPO.getCusNum());
			msgDE.setE04RTP("C");
			
			mp.sendMessage(msgDE);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgDE = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			if (mp.hasError(msgError)) {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_enter.jsp";
				} else {
					pageName = "ESD0080_client_both_enter.jsp";
				}
			} else {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_per_dep.jsp";
				} else {
					pageName = "ESD0080_client_both_per_dep.jsp";
				}
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
		String opCode = "0002";
		if ("NEW".equals(userPO.getPurpose())) {
			opCode = "0001";
		} else if ("INQUIRY".equals(userPO.getPurpose())) {
			opCode = "0004";
		}	
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgFR = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgFR.setH04USR(user.getH01USR());
			msgFR.setH04PGM("ESD0080");
			msgFR.setH04TIM(getTimeStamp());
			msgFR.setH04SCR("01");
			msgFR.setH04OPE(opCode);
			msgFR.setE04CUN(userPO.getCusNum());
			msgFR.setE04RTP("F");
			
			mp.sendMessage(msgFR);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgFR = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			if (mp.hasError(msgError)) {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_enter.jsp";
				} else {
					pageName = "ESD0080_client_both_enter.jsp";
				}
			} else {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_per_fam.jsp";
				} else {
					pageName = "ESD0080_client_both_per_fam.jsp";
				}
			}
		 	 
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("perFam", msgFR);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqPerRef(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "0002";
		if ("NEW".equals(userPO.getPurpose())) {
			opCode = "0001";
		} else if ("INQUIRY".equals(userPO.getPurpose())) {
			opCode = "0004";
		}	
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgPR = (ESD000004Message) mp.getMessageRecord("ESD000004");
		 	msgPR.setH04USR(user.getH01USR());
		 	msgPR.setH04PGM("ESD0080");
		 	msgPR.setH04TIM(getTimeStamp());
		 	msgPR.setH04SCR("01");
		 	msgPR.setH04OPE(opCode);
		 	msgPR.setE04CUN(userPO.getCusNum());
		 	msgPR.setE04RTP("P");
			
			mp.sendMessage(msgPR);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgPR = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			if (mp.hasError(msgError)) {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_enter.jsp";
				} else {
					pageName = "ESD0080_client_both_enter.jsp";
				}
			} else {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_per_ref.jsp";
				} else {
					pageName = "ESD0080_client_both_per_ref.jsp";
				}
			}
		 	 
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("perRef", msgPR);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqComRef(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "0002";
		if ("NEW".equals(userPO.getPurpose())) {
			opCode = "0001";
		} else if ("INQUIRY".equals(userPO.getPurpose())) {
			opCode = "0004";
		}	
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgCR = (ESD000004Message) mp.getMessageRecord("ESD000004");
		 	msgCR.setH04USR(user.getH01USR());
		 	msgCR.setH04PGM("ESD0080");
		 	msgCR.setH04TIM(getTimeStamp());
		 	msgCR.setH04SCR("01");
		 	msgCR.setH04OPE(opCode);
		 	msgCR.setE04CUN(userPO.getCusNum());
		 	msgCR.setE04RTP("7");
			
			mp.sendMessage(msgCR);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgCR = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			if (mp.hasError(msgError)) {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_enter.jsp";
				} else {
					pageName = "ESD0080_client_both_enter.jsp";
				}
			} else {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_com_ref.jsp";
				} else {
					pageName = "ESD0080_client_both_com_ref.jsp";
				}
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
		String opCode = "0002";
		if ("NEW".equals(userPO.getPurpose())) {
			opCode = "0001";
		} else if ("INQUIRY".equals(userPO.getPurpose())) {
			opCode = "0004";
		}	
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgBR = (ESD000004Message) mp.getMessageRecord("ESD000004");
		 	msgBR.setH04USR(user.getH01USR());
		 	msgBR.setH04PGM("ESD0080");
		 	msgBR.setH04TIM(getTimeStamp());
		 	msgBR.setH04SCR("01");
		 	msgBR.setH04OPE(opCode);
		 	msgBR.setE04CUN(userPO.getCusNum());
		 	msgBR.setE04RTP("6");
			
			mp.sendMessage(msgBR);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgBR = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			if (mp.hasError(msgError)) {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_enter.jsp";
				} else {
					pageName = "ESD0080_client_both_enter.jsp";
				}
			} else {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_bank_ref.jsp";
				} else {
					pageName = "ESD0080_client_both_bank_ref.jsp";
				}
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
		String opCode = "0002";
		if ("NEW".equals(userPO.getPurpose())) {
			opCode = "0001";
		} else if ("INQUIRY".equals(userPO.getPurpose())) {
			opCode = "0004";
		}	
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000007Message msgCom = (ESD000007Message) mp.getMessageRecord("ESD000007");
		 	msgCom.setH07USR(user.getH01USR());
		 	msgCom.setH07PGM("ESD0080");
		 	msgCom.setH07TIM(getTimeStamp());
		 	msgCom.setH07SCR("01");
		 	msgCom.setH07OPE(opCode);
		 	msgCom.setE07CUN(userPO.getCusNum());
			
			mp.sendMessage(msgCom);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgCom = (ESD000007Message) mp.receiveMessageRecord("ESD000007");
			
			if (mp.hasError(msgError)) {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_enter.jsp";
				} else {
					pageName = "ESD0080_client_both_enter.jsp";
				}
			} else {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_com.jsp";
				} else {
					pageName = "ESD0080_client_both_com.jsp";
				}
			}
		 	 
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("com", msgCom);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqKnowYourCustomer(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "0002";
		if ("NEW".equals(userPO.getPurpose())) {
			opCode = "0001";
		} else if ("INQUIRY".equals(userPO.getPurpose())) {
			opCode = "0004";
		}	
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000005Message msgSpecInst = (ESD000005Message) mp.getMessageRecord("ESD000005");
		 	msgSpecInst.setH05USR(user.getH01USR());
		 	msgSpecInst.setH05PGM("ESD0080");
		 	msgSpecInst.setH05TIM(getTimeStamp());
		 	msgSpecInst.setH05SCR("01");
		 	msgSpecInst.setH05OPE(opCode);
		 	msgSpecInst.setE05ACC(userPO.getCusNum());
		 	msgSpecInst.setE05ACD("K1");
			
			mp.sendMessage(msgSpecInst);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgSpecInst = (ESD000005Message) mp.receiveMessageRecord("ESD000005");
			
			if (mp.hasError(msgError)) {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_enter.jsp";
				} else {
					pageName = "ESD0080_client_both_enter.jsp";
				}
			} else {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_know_your_customer.jsp";
				} else {
					pageName = "ESD0080_client_both_know_your_customer.jsp";
				}
			}
		 	 
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("specInst", msgSpecInst);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqSpecInst(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "0002";
		if ("NEW".equals(userPO.getPurpose())) {
			opCode = "0001";
		} else if ("INQUIRY".equals(userPO.getPurpose())) {
			opCode = "0004";
		}	
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000005Message msgSpecInst = (ESD000005Message) mp.getMessageRecord("ESD000005");
		 	msgSpecInst.setH05USR(user.getH01USR());
		 	msgSpecInst.setH05PGM("ESD0080");
		 	msgSpecInst.setH05TIM(getTimeStamp());
		 	msgSpecInst.setH05SCR("01");
		 	msgSpecInst.setH05OPE(opCode);
		 	msgSpecInst.setE05ACC(userPO.getCusNum());
		 	msgSpecInst.setE05ACD("C1");
			
			mp.sendMessage(msgSpecInst);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgSpecInst = (ESD000005Message) mp.receiveMessageRecord("ESD000005");
			
			if (mp.hasError(msgError)) {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_enter.jsp";
				} else {
					pageName = "ESD0080_client_both_enter.jsp";
				}
			} else {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_special_inst.jsp";
				} else {
					pageName = "ESD0080_client_both_special_inst.jsp";
				}
			}
		 	 
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("specInst", msgSpecInst);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqAccountTitle(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "0002";
		if ("NEW".equals(userPO.getPurpose())) {
			opCode = "0001";
		} else if ("INQUIRY".equals(userPO.getPurpose())) {
			opCode = "0004";
		}	
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgMailA = (ESD000004Message) mp.getMessageRecord("ESD000004");
			msgMailA.setH04USR(user.getH01USR());
			msgMailA.setH04PGM("ESD0080");
			msgMailA.setH04TIM(getTimeStamp());
			msgMailA.setH04SCR("01");
			msgMailA.setH04OPE(opCode);
			msgMailA.setE04CUN(userPO.getCusNum());
			msgMailA.setE04RTP("1");
			msgMailA.setH04WK1("T");
			
			mp.sendMessage(msgMailA);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgMailA = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			if (mp.hasError(msgError)) {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_enter.jsp";
				} else {
					pageName = "ESD0080_client_both_enter.jsp";
				}
			} else {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_account_title.jsp";
				} else {
					pageName = "ESD0080_client_both_account_title.jsp";
				}
			}
		 	 
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("mailA", msgMailA);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqMailAddress(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "0002";
		if ("NEW".equals(userPO.getPurpose())) {
			opCode = "0001";
		} else if ("INQUIRY".equals(userPO.getPurpose())) {
			opCode = "0004";
		}	
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgMailA = (ESD000004Message) mp.getMessageRecord("ESD000004");
		 	msgMailA.setH04USR(user.getH01USR());
		 	msgMailA.setH04PGM("ESD0080");
		 	msgMailA.setH04TIM(getTimeStamp());
		 	msgMailA.setH04SCR("01");
		 	msgMailA.setH04OPE(opCode);
		 	msgMailA.setE04CUN(userPO.getCusNum());
		 	msgMailA.setE04RTP("1");
			
			mp.sendMessage(msgMailA);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgMailA = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			if (mp.hasError(msgError)) {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_enter.jsp";
				} else {
					pageName = "ESD0080_client_both_enter.jsp";
				}
			} else {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_mail_address.jsp";
				} else {
					pageName = "ESD0080_client_both_mail_address.jsp";
				}
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
		String opCode = "0002";
		if ("NEW".equals(userPO.getPurpose())) {
			opCode = "0001";
		} else if ("INQUIRY".equals(userPO.getPurpose())) {
			opCode = "0004";
		}	
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD008003Message msgCodes = (ESD008003Message) mp.getMessageRecord("ESD008003");
		 	msgCodes.setH03USR(user.getH01USR());
		 	msgCodes.setH03PGM("ESD0080");
		 	msgCodes.setH03TIM(getTimeStamp());
		 	msgCodes.setH03SCR("01");
		 	msgCodes.setH03OPE(opCode);
		 	msgCodes.setE03CUN(userPO.getCusNum());
			
			mp.sendMessage(msgCodes);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgCodes = (ESD008003Message) mp.receiveMessageRecord("ESD008003");
			
			if (mp.hasError(msgError)) {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_enter.jsp";
				} else {
					pageName = "ESD0080_client_both_enter.jsp";
				}
			} else {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_codes.jsp";
				} else {
					pageName = "ESD0080_client_both_codes.jsp";
				}
			}
		 	 
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("codes", msgCodes);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActionCorpLiabilities(ESS0030DSMessage user,
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
		 	msgLiabilities.setH04OPE("0005");
		 	msgLiabilities.setE04CUN(userPO.getCusNum());
		 	msgLiabilities.setE04RTP("A");
			setMessageRecord(req, msgLiabilities);
			
			mp.sendMessage(msgLiabilities);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgLiabilities = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("liabilities", msgLiabilities);
			
			if (mp.hasError(msgError)) {
				pageName = "ESD0080_client_corp_liabilities.jsp";
			} else {
				if ("CLIENT_P".equals(userPO.getOption())) {
					pageName = "ESD0080_client_personal_basic.jsp";
				} else {
					pageName = "ESD0080_client_corp_basic.jsp";
				}
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqCorpLiabilities(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "0002";
		if ("NEW".equals(userPO.getPurpose())) {
			opCode = "0001";
		} else if ("INQUIRY".equals(userPO.getPurpose())) {
			opCode = "0004";
		}	
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgLiabilities = (ESD000004Message) mp.getMessageRecord("ESD000004");
		 	msgLiabilities.setH04USR(user.getH01USR());
		 	msgLiabilities.setH04PGM("ESD0080");
		 	msgLiabilities.setH04TIM(getTimeStamp());
		 	msgLiabilities.setH04SCR("01");
		 	msgLiabilities.setH04OPE(opCode);
		 	msgLiabilities.setE04CUN(userPO.getCusNum());
		 	msgLiabilities.setE04RTP("A");
			
			mp.sendMessage(msgLiabilities);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgLiabilities = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			if (mp.hasError(msgError)) {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_enter.jsp";
				} else {
					pageName = "ESD0080_client_both_enter.jsp";
				}
			} else {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_corp_liabilities.jsp";
				} else {
					pageName = "ESD0080_client_corp_liabilities.jsp";
				}
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
		String opCode = "0002";
		if ("NEW".equals(userPO.getPurpose())) {
			opCode = "0001";
		} else if ("INQUIRY".equals(userPO.getPurpose())) {
			opCode = "0004";
		}	
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgAssets = (ESD000004Message) mp.getMessageRecord("ESD000004");
		 	msgAssets.setH04USR(user.getH01USR());
		 	msgAssets.setH04PGM("ESD0080");
		 	msgAssets.setH04TIM(getTimeStamp());
		 	msgAssets.setH04SCR("01");
		 	msgAssets.setH04OPE(opCode);
		 	msgAssets.setE04CUN(userPO.getCusNum());
		 	msgAssets.setE04RTP("9");
			
			mp.sendMessage(msgAssets);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgAssets = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			if (mp.hasError(msgError)) {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_enter.jsp";
				} else {
					pageName = "ESD0080_client_both_enter.jsp";
				}
			} else {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_corp_assets.jsp";
				} else {
					pageName = "ESD0080_client_corp_assets.jsp";
				}
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
		String opCode = "0002";
		if ("NEW".equals(userPO.getPurpose())) {
			opCode = "0001";
		} else if ("INQUIRY".equals(userPO.getPurpose())) {
			opCode = "0004";
		}	
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgBoard = (ESD000004Message) mp.getMessageRecord("ESD000004");
		 	msgBoard.setH04USR(user.getH01USR());
		 	msgBoard.setH04PGM("ESD0080");
		 	msgBoard.setH04TIM(getTimeStamp());
		 	msgBoard.setH04SCR("01");
		 	msgBoard.setH04OPE(opCode);
		 	msgBoard.setE04CUN(userPO.getCusNum());
		 	msgBoard.setE04RTP("3");
			
			mp.sendMessage(msgBoard);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgBoard = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			if (mp.hasError(msgError)) {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_enter.jsp";
				} else {
					pageName = "ESD0080_client_both_enter.jsp";
				}
			} else {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_corp_board.jsp";
				} else {
					pageName = "ESD0080_client_corp_board.jsp";
				}
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
		String opCode = "0002";
		if ("NEW".equals(userPO.getPurpose())) {
			opCode = "0001";
		} else if ("INQUIRY".equals(userPO.getPurpose())) {
			opCode = "0004";
		}	
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgStockHolder = (ESD000004Message) mp.getMessageRecord("ESD000004");
		 	msgStockHolder.setH04USR(user.getH01USR());
		 	msgStockHolder.setH04PGM("ESD0080");
		 	msgStockHolder.setH04TIM(getTimeStamp());
		 	msgStockHolder.setH04SCR("01");
		 	msgStockHolder.setH04OPE(opCode);
		 	msgStockHolder.setE04CUN(userPO.getCusNum());
		 	msgStockHolder.setE04RTP("2");
			
			mp.sendMessage(msgStockHolder);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgStockHolder = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			if (mp.hasError(msgError)) {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_enter.jsp";
				} else {
					pageName = "ESD0080_client_both_enter.jsp";
				}
			} else {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_corp_stock_holder.jsp";
				} else {
					pageName = "ESD0080_client_corp_stock_holder.jsp";
				}
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
		String opCode = "0002";
		if ("NEW".equals(userPO.getPurpose())) {
			opCode = "0001";
		} else if ("INQUIRY".equals(userPO.getPurpose())) {
			opCode = "0004";
		}	
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD008002Message msgClientEntity = (ESD008002Message) mp.getMessageRecord("ESD008002");
		 	msgClientEntity.setH02USR(user.getH01USR());
		 	msgClientEntity.setH02PGM("ESD0080");
		 	msgClientEntity.setH02TIM(getTimeStamp());
		 	msgClientEntity.setH02SCR("01");
		 	msgClientEntity.setH02OPE(opCode);
		 	
		 	if ("INQUIRY".equals(userPO.getPurpose())) {
				msgClientEntity.setH02WK1("I");		
		 	}
		 
		 	msgClientEntity.setE02CUN(userPO.getCusNum());
			
			mp.sendMessage(msgClientEntity);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgClientEntity = (ESD008002Message) mp.receiveMessageRecord("ESD008002");
			
			if (mp.hasError(msgError)) {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_enter.jsp";
				} else {
					pageName = "ESD0080_client_both_enter.jsp";
				}
			} else {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_corp_basic.jsp";
				} else {
					pageName = "ESD0080_client_corp_basic.jsp";
				}
			}
		 	 
			userPO.setCusNum(msgClientEntity.getE02CUN());
			userPO.setHeader1(msgClientEntity.getE02CUN());
			userPO.setHeader2(msgClientEntity.getE02IDN());
			userPO.setID(msgClientEntity.getE02IDN());
			userPO.setIdentifier(msgClientEntity.getE02IDN());
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

	private void procActionPerEmployment(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		MessageProcessor mp = null;
		String pageName = "";
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD008006Message msgEmployment = (ESD008006Message) mp.getMessageRecord("ESD008006");
			msgEmployment.setH06USR(user.getH01USR());
		 	msgEmployment.setH06PGM("ESD0080");
		 	msgEmployment.setH06TIM(getTimeStamp());
		 	msgEmployment.setH06SCR("01");
		 	msgEmployment.setH06OPE("0005");
			// all the fields here
		 	msgEmployment.setE06CUN(userPO.getCusNum());
			setMessageRecord(req, msgEmployment);
			
			mp.sendMessage(msgEmployment);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgEmployment = (ESD008006Message) mp.receiveMessageRecord("ESD008006");
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("employment", msgEmployment);
			
			if (mp.hasError(msgError)) {
				forward("ESD0080_client_personal_employment.jsp", req, res);
			} else {
				if (!userPO.getOption().equals("CLIENT_SHORT")){
					redirect("datapro.eibs.client.JSESD0080?SCREEN=1", res);
				} else {
					if(userPO.getCusType().equals("2")){
						pageName = "ESD0080_client_short_personal_basic.jsp";
					} else {
						pageName = "ESD0080_client_short_corp_basic.jsp";
					}
					forward(pageName, req, res);
				}
			}
			
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActionPerBene(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
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
		 	msgBene.setH04OPE("0005");
		 	msgBene.setE04CUN(userPO.getCusNum());
			msgBene.setE04RTP("4");
			setMessageRecord(req, msgBene);
			
			mp.sendMessage(msgBene);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgBene = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			if (mp.hasError(msgError)) {
				pageName = "ESD0080_client_personal_bene.jsp";
			} else {
				pageName = "ESD0080_client_personal_basic.jsp";
			}
			
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("bene", msgBene);
			
			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActionPerShortBasic(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD008020Message msgClientPersonal = (ESD008020Message) session.getAttribute("client");
			msgClientPersonal.setH20USR(user.getH01USR());
		 	msgClientPersonal.setH20PGM("ESD0080");
		 	msgClientPersonal.setH20TIM(getTimeStamp());
		 	msgClientPersonal.setH20SCR("01");
		 	msgClientPersonal.setH20OPE("0005");
			msgClientPersonal.setE20CUN(req.getParameter("E20CUN"));
			setMessageRecord(req, msgClientPersonal);
			
			((CharacterField)msgClientPersonal.getField("E20IAD")).setStringUD(Util.getReqParameter("E20IAD", req));
			((CharacterField)msgClientPersonal.getField("E20WEB")).setStringUD(Util.getReqParameter("E20WEB", req));
			((CharacterField)msgClientPersonal.getField("E20CUMIAD")).setStringUD(Util.getReqParameter("E20CUMIAD", req));
			((CharacterField)msgClientPersonal.getField("E20CUMWEB")).setStringUD(Util.getReqParameter("E20CUMWEB", req));
			
			mp.sendMessage(msgClientPersonal);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgClientPersonal = (ESD008020Message) mp.receiveMessageRecord("ESD008020");
			
			userPO.setOption("CLIENT_SHORT");
			userPO.setApplicationCode("C1");
			userPO.setCusNum(msgClientPersonal.getE20CUN());
			userPO.setIdentifier(msgClientPersonal.getE20IDN());
			userPO.setCusName(msgClientPersonal.getE20NA1());
			userPO.setCusType(msgClientPersonal.getE20LGT());
			userPO.setHeader1(msgClientPersonal.getE20CUN());
			userPO.setHeader2(msgClientPersonal.getE20IDN());
			userPO.setHeader3(msgClientPersonal.getE20NA1());
			userPO.setID(msgClientPersonal.getE20IDN());
			userPO.setHeader17(Util.addLeftZeros(4, msgClientPersonal.getE20TID()));				
			
			if (mp.hasError(msgError)) {
				if(userPO.getCusType().equals("2")){
					pageName = "ESD0080_client_short_personal_basic.jsp";
				} else {
					pageName = "ESD0080_client_short_corp_basic.jsp";
				}				
			} else {
				pageName = "ESD0080_client_short_personal_confirm.jsp";
			}
			
			session.setAttribute("error", msgError);
			session.setAttribute("client", msgClientPersonal);
		    session.setAttribute("userPO", userPO);
			
			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	private void procActionPerBasic(ESS0030DSMessage user,
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
		 	msgClientPersonal.setH01OPE("0005");
		 	if ("Y".equals(req.getParameter("APPROVAL"))) {
			 	msgClientPersonal.setH01OPE("0006");
		 	}
		 	try {
				msgClientPersonal.setE01CUN(req.getParameter("E01CUN").trim());
			} catch (Exception e) {
				msgClientPersonal.setE01CUN("");
			}
		 	
			((CharacterField)msgClientPersonal.getField("E01IAD")).setStringUD(Util.getReqParameter("E01IAD", req));
			((CharacterField)msgClientPersonal.getField("E01WEB")).setStringUD(Util.getReqParameter("E01WEB", req));
			((CharacterField)msgClientPersonal.getField("E01CUMIAD")).setStringUD(Util.getReqParameter("E01CUMIAD", req));
			((CharacterField)msgClientPersonal.getField("E01CUMWEB")).setStringUD(Util.getReqParameter("E01CUMWEB", req));
		 	
		 	
		 	
			msgClientPersonal.setE01LGT("2"); // Client Personal
			setMessageRecord(req, msgClientPersonal);
			String tes = "1".equals(req.getParameter("E01FL8_TES")) ? "T" : "";
			String fid = "1".equals(req.getParameter("E01FL8_FID")) ? "F" : "";
			String fem = "1".equals(req.getParameter("E01FL8_FEM")) ? "E" : "";
			String ter = "1".equals(req.getParameter("E01FL8_TER")) ? "R" : "";
		 	msgClientPersonal.setE01FL8(tes + fid + fem + ter);
		 	
		 	if( req.getParameter("E01UF10") != null ){
		 		msgClientPersonal.setE01UF10( "1" );
		 	}
			
			mp.sendMessage(msgClientPersonal);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgClientPersonal = (ESD008001Message) mp.receiveMessageRecord("ESD008001");
			
			if (mp.hasError(msgError)) {
				pageName = "ESD0080_client_personal_basic.jsp";
			} else {
				if ("NEW".equals(userPO.getPurpose()) || "A".equals(msgClientPersonal.getE01SFR())) {
					pageName = "ESD0080_client_personal_confirm.jsp";
				} else {
					pageName = "ESD0080_client_personal_basic.jsp";
				}
				userPO.setPurpose("MAINTENANCE");
			}
			
			userPO.setCusNum(msgClientPersonal.getE01CUN());
			userPO.setHeader1(msgClientPersonal.getE01CUN());
			userPO.setHeader2(msgClientPersonal.getE01IDN());
			userPO.setIdentifier(msgClientPersonal.getE01IDN());
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

	protected void procReqPerEmployment(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "0002";
		if ("NEW".equals(userPO.getPurpose())) {
			opCode = "0001";
		} else if ("INQUIRY".equals(userPO.getPurpose())) {
			opCode = "0004";
		}	
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD008006Message msgEmployment = (ESD008006Message) mp.getMessageRecord("ESD008006");
		 	msgEmployment.setH06USR(user.getH01USR());
		 	msgEmployment.setH06PGM("ESD0080");
		 	msgEmployment.setH06TIM(getTimeStamp());
		 	msgEmployment.setH06SCR("01");
		 	msgEmployment.setH06OPE(opCode);
		 	msgEmployment.setE06CUN(userPO.getCusNum());
			
			mp.sendMessage(msgEmployment);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgEmployment = (ESD008006Message) mp.receiveMessageRecord("ESD008006");
			
			if (mp.hasError(msgError)) {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_enter.jsp";
				} else {
					pageName = "ESD0080_client_both_enter.jsp";
				}
			} else {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_personal_employment.jsp";
				} else {
					pageName = "ESD0080_client_personal_employment.jsp";
				}
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
		String opCode = "0002";
		if ("NEW".equals(userPO.getPurpose())) {
			opCode = "0001";
		} else if ("INQUIRY".equals(userPO.getPurpose())) {
			opCode = "0004";
		}	
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD000004Message msgBene = (ESD000004Message) mp.getMessageRecord("ESD000004");
		 	msgBene.setH04USR(user.getH01USR());
		 	msgBene.setH04PGM("ESD0080");
		 	msgBene.setH04TIM(getTimeStamp());
		 	msgBene.setH04SCR("01");
		 	msgBene.setH04OPE(opCode);
		 	msgBene.setE04CUN(userPO.getCusNum());
		 	msgBene.setE04RTP("4");
			
			mp.sendMessage(msgBene);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgBene = (ESD000004Message) mp.receiveMessageRecord("ESD000004");
			
			if (mp.hasError(msgError)) {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_enter.jsp";
				} else {
					pageName = "ESD0080_client_both_enter.jsp";
				}
			} else {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_personal_bene.jsp";
				} else {
					pageName = "ESD0080_client_personal_bene.jsp";
				}
			}
		 	 
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("bene", msgBene);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqPerShortBasic(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = ""; String opCode = "0002";
		MessageProcessor mp = null;
		
		if ("NEW".equals(userPO.getPurpose())) {
			opCode = "0002";
		} else if ("INQUIRY".equals(userPO.getPurpose())) {
			opCode = "0004";
		}			
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD008020Message msgClientPersonal = (ESD008020Message) mp.getMessageRecord("ESD008020");
		 	msgClientPersonal.setH20USR(user.getH01USR());
		 	msgClientPersonal.setH20PGM("ESD0080");
		 	msgClientPersonal.setH20TIM(getTimeStamp());
		 	msgClientPersonal.setH20SCR("01");
		 	msgClientPersonal.setH20OPE(opCode);
		 	try {
		 		msgClientPersonal.setE20IDN(req.getParameter("E20IDN").trim());
		 	} catch (Exception e) {
		 		msgClientPersonal.setE20IDN(userPO.getID());
		 	}
		 	try {
		 		msgClientPersonal.setE20TID(req.getParameter("E20TID").trim());
		 	} catch (Exception e) {
		 		msgClientPersonal.setE20TID(userPO.getHeader17());
		 	}
		 	try {
		 		msgClientPersonal.setE20PID(req.getParameter("E20PID").trim());
		 	} catch (Exception e) {
		 		msgClientPersonal.setE20PID(user.getE01CTR());
		 	}
		 	try {
		 		msgClientPersonal.setH20WK1(req.getParameter("H20WK1").trim());
		 	} catch (Exception e) {
		 		msgClientPersonal.setH20WK1("S");
		 	}
		 	
			mp.sendMessage(msgClientPersonal);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgClientPersonal = (ESD008020Message) mp.receiveMessageRecord("ESD008020");
			
			userPO.setOption("CLIENT_SHORT");
			userPO.setApplicationCode("C1");
			userPO.setHeader1(msgClientPersonal.getE20CUN());
			userPO.setHeader2(msgClientPersonal.getE20IDN());
			userPO.setHeader3(msgClientPersonal.getE20NA1());
			userPO.setCusNum(msgClientPersonal.getE20CUN());
			userPO.setIdentifier(msgClientPersonal.getE20IDN());
			userPO.setCusName(msgClientPersonal.getE20NA1());
			userPO.setCusType(msgClientPersonal.getE20LGT());
			userPO.setID(msgClientPersonal.getE20IDN());
			userPO.setHeader17(Util.addLeftZeros(4, msgClientPersonal.getE20TID()));
			
			
			if (mp.hasError(msgError)) {
				if ("S".equals(msgClientPersonal.getH20WK1())) {
					pageName = "ESD0080_client_short_enter_identification_option.jsp";
				} else {
					pageName = "ESD0080_client_short_enter_identification.jsp";
				}
			} else {
				if(userPO.getCusType().equals("2")){
					pageName = "ESD0080_client_short_personal_basic.jsp";
				} else {
					pageName = "ESD0080_client_short_corp_basic.jsp";
				}				
			}

			session.setAttribute("error", msgError);
			session.setAttribute("client", msgClientPersonal);
			session.setAttribute("userPO", userPO);

			forward(pageName, req, res);
		} finally {
			if (mp != null)	mp.close();
		}
	}

	protected void procReqPerBasic(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		String opCode = "0002";
		if ("NEW".equals(userPO.getPurpose())) {
			opCode = "0001";
		} else if ("INQUIRY".equals(userPO.getPurpose())) {
			opCode = "0004";
		}	
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0080", req);
			ESD008001Message msgClientPersonal = (ESD008001Message) mp.getMessageRecord("ESD008001");
		 	msgClientPersonal.setH01USR(user.getH01USR());
		 	msgClientPersonal.setH01PGM("ESD0080");
		 	msgClientPersonal.setH01TIM(getTimeStamp());
		 	msgClientPersonal.setH01SCR("01");
		 	msgClientPersonal.setH01OPE(opCode);

		 	if ("INQUIRY".equals(userPO.getPurpose())) {
		 		msgClientPersonal.setH01WK1("I");		
		 	}

		 	msgClientPersonal.setE01CUN(userPO.getCusNum());
		 	
			mp.sendMessage(msgClientPersonal);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgClientPersonal = (ESD008001Message) mp.receiveMessageRecord("ESD008001");
			
			if (mp.hasError(msgError)) {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_both_enter.jsp";
				} else {
					pageName = "ESD0080_client_both_enter.jsp";
				}
			} else {
				if ("INQUIRY".equals(userPO.getPurpose())) {
					pageName = "ESD0080_client_inq_personal_basic.jsp";
				} else {
					pageName = "ESD0080_client_personal_basic.jsp";
				}
			}
		 	 
			userPO.setCusNum(msgClientPersonal.getE01CUN());
			userPO.setHeader1(msgClientPersonal.getE01CUN());
			userPO.setID(msgClientPersonal.getE01IDN());
			userPO.setIdentifier(msgClientPersonal.getE01IDN());
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
