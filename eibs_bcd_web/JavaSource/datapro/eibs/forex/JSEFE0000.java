package datapro.eibs.forex;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDL0120DSMessage;
import datapro.eibs.beans.EFE0120DSMessage;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.ETR0120DSMessage;
import datapro.eibs.beans.EWD0001RMessage;
import datapro.eibs.beans.EWD0001SMessage;
import datapro.eibs.beans.EWD0301DSMessage;
import datapro.eibs.beans.JBList;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.TrOption;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;

public class JSEFE0000 extends JSEIBSServlet {

	protected static final int R_ENTER_BASIC		= 100;
	protected static final int R_ENTER_INQUIRY		= 300;
	protected static final int R_ENTER_PROF			= 500;
	protected static final int R_ENTER_CALC			= 700;
	protected static final int R_ENTER_LIN			= 900;
	protected static final int R_ENTER_SET			= 1100;
	protected static final int R_ENTER_DELETE		= 1300;
	protected static final int R_ENTER_CUST_DEALS	= 1500;
	protected static final int A_ENTER_BASIC		= 200;
	protected static final int A_ENTER_DELETE		= 400;
	protected static final int A_ENTER_DELETE_DEALS	= 1800;
	protected static final int A_ENTER_DELETE_FRA	= 2000;
	protected static final int A_ENTER_CUST_DEALS	= 2200;
	protected static final int R_PRODUCTS_BASIC		= 3000;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			case R_ENTER_BASIC :
				procReqEnterBasic(user, req, res, session);
				break;
			case R_PRODUCTS_BASIC :
				procReqProductsBasic(user, req, res, session);
				break;
			case R_ENTER_INQUIRY :
				procReqEnterInquiry(user, req, res, session);
				break;
			case R_ENTER_PROF :
				procReqEnterProfitability(user, req, res, session);
				break;
			case R_ENTER_CALC :
				procReqEnterCalculator(user, req, res, session);
				break;
			case R_ENTER_LIN :
				procReqEnterLinCred(user, req, res, session);
				break;
			case R_ENTER_SET :
				procReqEnterSettlement(user, req, res, session);
				break;
			case R_ENTER_DELETE :
				procReqEnterDelete(user,req, res, session);
				break;
			case R_ENTER_CUST_DEALS :
				procReqEnterCustDeals(user ,req, res, session);
				break;	
			case A_ENTER_BASIC :
				procActionEnterBasic(user, req, res, session);
				break;
			case A_ENTER_DELETE :
				procActionEnterDelete(user, req, res, session);
				break;
			case A_ENTER_DELETE_DEALS :
				procActionEnterDeleteDeals(user, req, res, session);
				break;					
			case A_ENTER_DELETE_FRA :
				procActionEnterDeleteFRA(user, req, res, session);
				break;
			case A_ENTER_CUST_DEALS :
				procActionCustDeals(user, req, res, session);
				break;	
				
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procActionCustDeals(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		String PROGRAM = req.getParameter("PROGRAM") == null ? "" : req.getParameter("PROGRAM");
		String REFERENCE = req.getParameter("REFERENCE") == null ? "" : req.getParameter("REFERENCE");
		
		int optio = 0;
		if (PROGRAM.equals("EDL0160")) {
			optio = 1;
		} else if (PROGRAM.equals("EFE0160")) {
			optio = 2;
		} else if (PROGRAM.equals("ETR0160")) {
			optio = 3;
		}
				
		switch (optio) {
			case 1 : //EDL0160			   
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEDL0130IT?SCREEN=600&E01DEAACC=" + REFERENCE);
				break;	
			case 2 : //EFE0160			   
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEFE0160?SCREEN=40&E01FEMACC=" + REFERENCE);
				break;	
			case 3 : //ETR0160			   
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSETR0160?SCREEN=100&E01FRAACC=" + REFERENCE);
				break;	
			default :
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSETR0160?SCREEN=100&E01FRAACC=" + REFERENCE);
				break;
  		}
	}

	private void procActionEnterDeleteFRA(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFE0120", req);
			ETR0120DSMessage msgFex = (ETR0120DSMessage) mp.getMessageRecord("ETR0120DS");
		 	msgFex.setH01USERID(user.getH01USR());
		 	msgFex.setH01PROGRM("ETR0120");
		 	msgFex.setH01TIMSYS(getTimeStamp());
		 	msgFex.setH01SCRCOD("01");
		 	msgFex.setH01OPECOD("0004");	
		 	
			try {
				msgFex.setE01WFRREF(req.getParameter("E01FESREF").trim());
			} catch (Exception e) {
				msgFex.setE01WFRREF("0");
			}
			try {
				msgFex.setE01WFRDID(req.getParameter("E01FESDID").trim());
			} catch (Exception e) {
				msgFex.setE01WFRDID("0");
			}
			
			mp.sendMessage(msgFex);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgFex = (ETR0120DSMessage) mp.receiveMessageRecord("ETR0120DS");
			
			session.setAttribute("error", msgError);
			if (mp.hasError(msgError)) {
				procReqEnterDelete(user, req, res, session);
			} else {
				userPO.setIdentifier(msgFex.getE01WFRREF());
				pageName = "EFE0120_del_confirm.jsp";
				
				flexLog("Putting java beans into the session");
				session.setAttribute("userPO", userPO);
				
				forward(pageName, req, res);
			}
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionEnterDeleteDeals(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFE0120", req);
			EDL0120DSMessage msgFex = (EDL0120DSMessage) mp.getMessageRecord("EDL0120DS");
		 	msgFex.setH01USERID(user.getH01USR());
		 	msgFex.setH01PROGRM("EDL0120");
		 	msgFex.setH01TIMSYS(getTimeStamp());
		 	msgFex.setH01SCRCOD("01");
		 	msgFex.setH01OPECOD("0004");

			try {
				msgFex.setE01DLSREF(req.getParameter("E01FESREF").trim());
			} catch (Exception e) {
				msgFex.setE01DLSREF("0");
			}
			try {
				msgFex.setE01DLSDID(req.getParameter("E01FESDID").trim());
			} catch (Exception e) {
				msgFex.setE01DLSDID("");
			}
			
			mp.sendMessage(msgFex);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgFex = (EDL0120DSMessage) mp.receiveMessageRecord("EDL0120DS");
			
			session.setAttribute("error", msgError);
			if (mp.hasError(msgError)) {
				procReqEnterDelete(user, req, res, session);
			} else {
				userPO.setIdentifier(msgFex.getE01DLSREF());
				pageName = "EFE0120_del_confirm.jsp";
				
				flexLog("Putting java beans into the session");
				session.setAttribute("userPO", userPO);
				
				forward(pageName, req, res);
			}
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionEnterDelete(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EFE0120", req);
			EFE0120DSMessage msgFex = (EFE0120DSMessage) mp.getMessageRecord("EFE0120DS");
		 	msgFex.setH01USERID(user.getH01USR());
		 	msgFex.setH01PROGRM("EFE0120P");
		 	msgFex.setH01TIMSYS(getTimeStamp());
		 	msgFex.setH01SCRCOD("01");
		 	msgFex.setH01OPECOD("0004");

			try {
				msgFex.setE01FESREF(req.getParameter("E01FESREF").trim());
			} catch (Exception e) {
				msgFex.setE01FESREF("0");
			}
			try {
				msgFex.setE01FESDID(req.getParameter("E01FESDID").trim());
			} catch (Exception e) {
				msgFex.setE01FESDID("");
			}
			
			mp.sendMessage(msgFex);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgFex = (EFE0120DSMessage) mp.receiveMessageRecord("EFE0120DS");
			
			session.setAttribute("error", msgError);
			if (mp.hasError(msgError)) {
				procReqEnterDelete(user, req, res, session);
			} else {
				userPO.setIdentifier(msgFex.getE01FESREF());
				pageName = "EFE0120_del_confirm.jsp";
				
				flexLog("Putting java beans into the session");
				session.setAttribute("userPO", userPO);
				
				forward(pageName, req, res);
			}
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionEnterBasic(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos userPO = new UserPos();
		TrOption trOption= new TrOption();
				
		String DEATYPO = req.getParameter("E01FESTYPO") == null ? "" : req.getParameter("E01FESTYPO").trim();
		String INPTTYP =req.getParameter("INPTTYP") == null ? "" : req.getParameter("INPTTYP").trim();
		String INPTOPTA = req.getParameter("INPTOPT") == null ? "0" : req.getParameter("INPTOPT").trim();
		String ACCOUNTINQ = req.getParameter("ACCOUNT") == null ? "" : req.getParameter("ACCOUNT").trim(); 
		String RefNumb = req.getParameter("E01FESREF") == null ? "" : req.getParameter("E01FESREF").trim(); 
		String CusAux = req.getParameter("CUNCOD") == null ? "" : req.getParameter("CUNCOD").trim();
		String CusNumb = req.getParameter("CUSTOMER") == null ? "" : req.getParameter("CUSTOMER").trim();
		String DeaID = req.getParameter("E01FESDID") == null ? "" : req.getParameter("E01FESDID").trim();
		String AccNum = req.getParameter("ACCNUM") == null ? "" : req.getParameter("ACCNUM").trim();
		String source = req.getParameter("SOURCE") == null ? "" : req.getParameter("SOURCE").trim();
		String dsc = req.getParameter("INPTDSC") == null ? "" : req.getParameter("INPTDSC").trim();	
		String pty = (req.getParameter("INPTPTY") == null ? " " : req.getParameter("INPTPTY"));
		userPO.setOption(pty);

		trOption.setHeader2(dsc);
		
		if (!CusAux.equals("") && !CusAux.equals("0")) CusNumb = CusAux; 
		
		int inptOPTAux = 0;
		if (!RefNumb.equals("")) {
			inptOPTAux = Util.parseInt(DEATYPO);
			INPTTYP=req.getParameter("REFTYP");
		} else if (!INPTOPTA.equals("0")) {
			inptOPTAux = Util.parseInt(INPTOPTA);
		}
		userPO.setType(INPTTYP);
		
		session.setAttribute("trOption", trOption);
		session.setAttribute("userPO", userPO);
		
		int inptOPT = 0;
		switch (inptOPTAux) {
			case 31 : //Spot
				inptOPT = 0;
				break;
			case 32 : //Forward
				inptOPT = 3;	
				break;
			case 33 : //SWAP
				inptOPT = 4;
				break;
			case 34 : //Option
				inptOPT = 5;
				break;
			case 35 : //FRA
				inptOPT = 12;
				break;
			case 12 : //CDS
				inptOPT = 9;
				break;
			case 14 : //ACC
				inptOPT = 7;
				break;
			case 13 : //Commercial Papers
				inptOPT = 8;
				break;
			case 11 : //Time Deposits
				inptOPT = 6;
				break;
			case 15 : //Federal Funds
				inptOPT = 70;
				break;
			case 95 : //Financial Blocks
				inptOPT = 130;
				break;
			case 42 : //Lines of Credit
				inptOPT = 42;
				break;	  	
			default :
				inptOPT = Util.parseInt(INPTOPTA);
		}

		switch (inptOPT) {
			case 0 : //Spot
				trOption.setHeader1("2");
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEFE0120P?SCREEN=200&E01FESCUN=" + CusNumb + "&E01FESTYP=" + INPTTYP + "&E01FESREF=" + RefNumb + "&E01FESDID=" + DeaID + "&E01FESTIN=" + source);
				break;				
			case 1 : //Fast Spot
				trOption.setHeader1("1");
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEFE0120P?SCREEN=600&E01FESTYP=" + INPTTYP + "&E01FESREF=" + RefNumb + "&E01FESTIN=" + source);
				break;				
			case 2 : //Spot
				trOption.setHeader1("2");
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEFE0120P?SCREEN=200&E01FESCUN=" + CusNumb + "&E01FESTYP=" + INPTTYP + "&E01FESREF=" + RefNumb + "&E01FESTIN=" + source);
				break;
			case 3  ://Forward
				trOption.setHeader1("3");
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEFE0120P?SCREEN=1000&E01FESCUN=" + CusNumb + "&E01FESTYP=" + INPTTYP + "&E01FESREF=" + RefNumb + "&E01FESTIN=" + source);
				break;					
			case 4  ://Swap
				trOption.setHeader1("4");
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEFE0120P?SCREEN=1200&E01FESCUN=" + CusNumb + "&E01FESTYP=" + INPTTYP + "&E01FESREF=" + RefNumb + "&E01FESTIN=" + source);
				break;										
			case 5  ://Option
				trOption.setHeader1("5");	
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEFE0120P?SCREEN=800&E01FESCUN=" + CusNumb + "&E01FESTYP=" + INPTTYP + "&E01FESREF=" + RefNumb + "&E01FESTIN=" + source);
				break;
			case 6  ://Deposits	
				trOption.setHeader1("6");
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEDL0120?SCREEN=200&E01DLSCUN=" + CusNumb + "&E01FESTYP=" + INPTTYP + "&E01DLSREF=" + RefNumb + "&E01DLSSTS=" + source);
				break;	
			case 7  ://Bankers Acceptance
				trOption.setHeader1("7");	
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEDL0120?SCREEN=800&E01DLSCUN=" + CusNumb + "&E01FESTYP=" + INPTTYP + "&E01DLSREF=" + RefNumb + "&E01DLSSTS=" + source);
				break;
			case 8  ://Commercial Papers
				trOption.setHeader1("8");	
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEDL0120?SCREEN=600&E01DLSDID=" + DeaID + "&E01FESTYP=" + INPTTYP + "&E01DLSREF=" + RefNumb + "&E01DLSCUN=" + CusNumb + "&E01DLSSTS=" + source + "&E01DLSPTY=" + pty);
				break;
			case 9  ://CDS	
				trOption.setHeader1("9");
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEDL0120?SCREEN=1000&E01DLSCUN=" + CusNumb + "&E01FESTYP=" + INPTTYP + "&E01DLSREF=" + RefNumb + "&E01DLSSTS=" + source);
				break;
			case 10  ://Loans
				trOption.setHeader1("10");	
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEDL0120?SCREEN=400&E01DLSCUN=" + CusNumb + "&E01FESTYP=" + INPTTYP + "&E01DLSREF=" + RefNumb + "&E01DLSSTS=" + source);
				break;																																												
			case 11  :// Not Delivered Forward
				trOption.setHeader1("11");
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEFE0120P?SCREEN=1400&E01FESCUN=" + CusNumb + "&E01FESTYP=" + INPTTYP  + "&E01FESREF=" + RefNumb + "&E01FESTIN=" + source);
				break;											
			case 12  ://FRA
				trOption.setHeader1("12");	
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSETR0120?SCREEN=200&E01WFRCUN=" + CusNumb + "&E01WFRPRO="+ INPTTYP + "&E01WFRREF=" + RefNumb + "&E01WFRDID=" + DeaID );
				break;												
			case 42  ://Line of Credit Maintenance
				trOption.setHeader1("42");	
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSELN0000T?SCREEN=200&CUSNUM=" + CusNumb +  "&LNENUM=" + RefNumb);
				break;
			case 43  ://Customer Deals
				trOption.setHeader1("61");
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEFE0000?SCREEN=1500&CUSTOMER=" + CusNumb);
				break;																													
			case 61  ://Customer Details
				trOption.setHeader1("61");
				res.sendRedirect(srctx + "/servlet/datapro.eibs.client.JSESD0080?SCREEN=600&E01CUN=" + CusNumb);
				break;
			case 62  ://Customer Limits
				trOption.setHeader1("62");
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEWD0322?SCREEN=1&E01FESCUN=" + CusNumb);
				break;
			case 65  ://Currency Rates
				trOption.setHeader1("65");
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEWD0328?SCREEN=1&BankNumber=" + user.getE01UBK());
				break;																				
			case 66  ://Currency Positions
				trOption.setHeader1("66");
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEWD0323?SCREEN=1");
				break;
			case 68  ://Incomplete Deals
				trOption.setHeader1("68");
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEWD0321I");
				break;																																								
			case 69  :// Deals in process
				trOption.setHeader1("69");
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEWD0325T");
				break;	
			case 70  ://Federal Funds
				trOption.setHeader1("70");	
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEDL0120?SCREEN=1200&E01DLSCUN=" + CusNumb + "&E01FESTYP=" + INPTTYP + "&E01DLSREF=" + RefNumb + "&E01DLSSTS=" + source);
				break;
			case 71  ://Placements	
				trOption.setHeader1("71");
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEDL0120?SCREEN=1400&E01DLSCUN=" + CusNumb + "&E01FESTYP=" + INPTTYP + "&E01DLSREF=" + RefNumb + "&E01DLSSTS=" + source);
				break;																																							
			case 100  ://Maintenance Foreign Exchange	
				trOption.setHeader1("100");
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEFE0120P?SCREEN=40&E01FESREF=" + RefNumb + "&E01FESDID=" + DeaID + "&E01FESTIN=" + source);
				break;
			case 102  ://Customer Limits Maintenance
				trOption.setHeader1("102");
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEWD0322S?SCREEN=1&E01FESCUN=" + CusNumb);
				break;
			case 103  ://Maintenance Deals
				trOption.setHeader1("103");	
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEDL0120?SCREEN=14&E01DLSREF=" + RefNumb + "&E01DLSDID=" + DeaID + "&E01DLSSTS=" + source);
				break;	
			case 104  ://Incomplete Deals Maintenance
				trOption.setHeader1("104");
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEWD0325S?SCREEN=1");
				break;	
			case 110  ://Foreign Exchange Accounts
				trOption.setHeader1("110");
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEWD0333?ACCOUNT=" + ACCOUNTINQ);
				break;																																																										
			case 111  ://Forward Rate Agreements Accounts
				trOption.setHeader1("111");
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEWD0332?ACCOUNT=" + ACCOUNTINQ);
				break;	
			case 112  ://Deals Accounts
				trOption.setHeader1("112");
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEWD0334?ACCOUNT=" + ACCOUNTINQ);
				break;	
			case 120  ://Logs Inquiry
				trOption.setHeader1("120");
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEPR0200?SCREEN=1&E01ACCNUM=" + AccNum);
				break;
			case 121  ://Wire Transfers
				trOption.setHeader1("121");
				res.sendRedirect(srctx + "/servlet/datapro.eibs.products.JSEPR1060?SCREEN=10");
				break;
			case 130  ://Financial Blocks	
				trOption.setHeader1("130");
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEDL0120?SCREEN=1600&E01DLSCUN=" + CusNumb + "&E01FESTYP=" + INPTTYP + "&E01DLSREF=" + RefNumb + "&E01DLSSTS=" + source);
				break;																																																																																																														
			default :
				res.sendRedirect(srctx + "/servlet/datapro.eibs.forex.JSEFE0120P?SCREEN=600&E01FESTYP=" + INPTTYP + "&E01FESTIN=" + source);
		}
	}

	private void procReqEnterCustDeals(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setCusNum(req.getParameter("CUSTOMER") == null ? "" : req.getParameter("CUSTOMER").trim());
		session.setAttribute("userPO", userPO);
		session.setAttribute("error", new ELEERRMessage());
		
		forward("EWD0335_inq_selection.jsp", req, res);
	}

	private void procReqEnterDelete(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = new UserPos();
		userPO.setOption("FEX");
		userPO.setPurpose("MAINTENANCE");
		session.setAttribute("userPO", userPO);
		
		forward("EFE0000_fe_enter_delete.jsp", req, res);
	}

	private void procReqEnterSettlement(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0001", req);
			EWD0001RMessage msgCust = (EWD0001RMessage) mp.getMessageRecord("EWD0001R");
			msgCust.setRWDUSR(user.getH01USR());
			msgCust.setRWDSHR("A");
			msgCust.setRWDTYP("T");
			try {
				msgCust.setRWDFRC(req.getParameter("FromRecord").trim());
			} catch (Exception e) {
				msgCust.setRWDFRC("0");
			}
			
			mp.sendMessage(msgCust);
			JBObjList list = mp.receiveMessageRecordList("SWDOPE", "SWDREC");
			
			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "error_viewer.jsp";
			} else {
				JBList beanList = new JBList();
				StringBuffer myRow = null;
				boolean firstTime = true;
				String chk = "";
				list.initRow();
				while (list.getNextRow()) {
					EWD0001SMessage msgCustS = (EWD0001SMessage) list.getRecord();
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					myRow = new StringBuffer();
					myRow.append("<TR>");
					myRow.append("<TD NOWRAP><input type=\"radio\" name=\"CUSTOMER\" value=\"" + msgCustS.getSWDCUN() + "\" " + chk + " onClick=\"\"></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\">" + Util.formatCell(msgCustS.getSWDCUN()) + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=\"LEFT\">" + Util.formatCell(msgCustS.getSWDNA1()) + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=\"CENTER\">" + Util.formatCell(msgCustS.getSWDIDN()) + "</TD>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				session.setAttribute("custList", beanList);
				session.setAttribute("userPO", userPO);
				
				req.setAttribute("NameSearch", "A"); 
				req.setAttribute("Type", "T"); 
				pageName = "EFE0000_fe_enter_set.jsp";
			}
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqEnterLinCred(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0001", req);
			EWD0001RMessage msgCust = (EWD0001RMessage) mp.getMessageRecord("EWD0001R");
			msgCust.setRWDUSR(user.getH01USR());
			msgCust.setRWDSEL("C");
			msgCust.setRWDTYP("T");
			try {
				msgCust.setRWDFRC(req.getParameter("FromRecord").trim());
			} catch (Exception e) {
				msgCust.setRWDFRC("0");
			}
			
			mp.sendMessage(msgCust);
			JBObjList list = mp.receiveMessageRecordList("SWDOPE", "SWDREC");
			
			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "error_viewer.jsp";
			} else {
				JBList beanList = new JBList();
				StringBuffer myRow = null;
				boolean firstTime = true;
				String chk = "";
				list.initRow();
				while (list.getNextRow()) {
					EWD0001SMessage msgCustS = (EWD0001SMessage) list.getRecord();
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					myRow = new StringBuffer();
					myRow.append("<TR>");
					myRow.append("<TD NOWRAP><input type=\"radio\" name=\"CUSTOMER\" value=\"" + msgCustS.getSWDCUN() + "\" " + chk + "></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"left\">" + Util.formatCell(msgCustS.getSWDCUN()) + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=\"LEFT\">" + Util.formatCell(msgCustS.getSWDNA1()) + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=\"LEFT\">" + Util.formatCell(msgCustS.getSWDIDN()) + "</TD>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				session.setAttribute("custList", beanList);
				session.setAttribute("userPO", userPO);
				
				req.setAttribute("NameSearch", "A"); 
				req.setAttribute("Type", "T"); 
				pageName = "EFE0000_fe_enter_lin.jsp";
			}
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqEnterCalculator(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0001", req);
			EWD0001RMessage msgCust = (EWD0001RMessage) mp.getMessageRecord("EWD0001R");
			msgCust.setRWDUSR(user.getH01USR());
			msgCust.setRWDSHR("A");
			msgCust.setRWDTYP("T");
			try {
				msgCust.setRWDFRC(req.getParameter("FromRecord").trim());
			} catch (Exception e) {
				msgCust.setRWDFRC("0");
			}
			
			mp.sendMessage(msgCust);
			JBObjList list = mp.receiveMessageRecordList("SWDOPE", "SWDREC");
			
			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "error_viewer.jsp";
			} else {
				JBList beanList = new JBList();
				StringBuffer myRow = null;
				boolean firstTime = true;
				String chk = "";
				list.initRow();
				while (list.getNextRow()) {
					EWD0001SMessage msgCustS = (EWD0001SMessage) list.getRecord();
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					myRow = new StringBuffer();
					myRow.append("<TR>");
					myRow.append("<TD NOWRAP><input type=\"radio\" name=\"CUSTOMER\" value=\"" + msgCustS.getSWDCUN() + "\" " + chk + "></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"LEFT\">" + Util.formatCell(msgCustS.getSWDCUN()) + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=\"LEFT\">" + Util.formatCell(msgCustS.getSWDNA1()) + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=\"LEFT\">" + Util.formatCell(msgCustS.getSWDIDN()) + "</TD>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				session.setAttribute("custList", beanList);
				session.setAttribute("userPO", userPO);
				
				req.setAttribute("NameSearch", "A"); 
				req.setAttribute("Type", "T"); 
				pageName = "EFE0000_fe_enter_calc.jsp";
			}
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqEnterProfitability(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0001", req);
			EWD0001RMessage msgCust = (EWD0001RMessage) mp.getMessageRecord("EWD0001R");
			msgCust.setRWDUSR(user.getH01USR());
			msgCust.setRWDSHR("A");
			msgCust.setRWDTYP("T");
			try {
				msgCust.setRWDFRC(req.getParameter("FromRecord").trim());
			} catch (Exception e) {
				msgCust.setRWDFRC("0");
			}
			
			mp.sendMessage(msgCust);
			JBObjList list = mp.receiveMessageRecordList("SWDOPE", "SWDREC");
			
			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "error_viewer.jsp";
			} else {
				JBList beanList = new JBList();
				StringBuffer myRow = null;
				boolean firstTime = true;
				String chk = "";
				list.initRow();
				while (list.getNextRow()) {
					EWD0001SMessage msgCustS = (EWD0001SMessage) list.getRecord();
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					myRow = new StringBuffer();
					myRow.append("<TR>");
					myRow.append("<TD NOWRAP><input type=\"radio\" name=\"CUSTOMER\" value=\"" + msgCustS.getSWDCUN() + "\" " + chk + "></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"LEFT\">" + Util.formatCell(msgCustS.getSWDCUN()) + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=\"LEFT\">" + Util.formatCell(msgCustS.getSWDNA1()) + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=\"LEFT\">" + Util.formatCell(msgCustS.getSWDIDN()) + "</TD>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				session.setAttribute("custList", beanList);
				session.setAttribute("userPO", userPO);
				
				req.setAttribute("NameSearch", "A"); 
				req.setAttribute("Type", "T"); 
				pageName = "EFE0000_fe_enter_prof.jsp";
			}
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqEnterInquiry(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0001", req);
			EWD0301DSMessage msgCust = (EWD0301DSMessage) mp.getMessageRecord("EWD0301DS");
			msgCust.setRWDUSR(user.getH01USR());
			try {
				msgCust.setRWDTYP(req.getParameter("SOURCE").trim());
			} catch (Exception e) {
				msgCust.setRWDTYP("T");
			}
			if (msgCust.getRWDTYP() == null) msgCust.setRWDTYP("T");
				
			try {
				msgCust.setRWDFRC(req.getParameter("FromRecord").trim());
			} catch (Exception e) {
				msgCust.setRWDFRC("0");
			}
			
			mp.sendMessage(msgCust);
			JBObjList objList = mp.receiveMessageRecordList("SWDOPE");
			
			if (mp.hasError(objList)) {
				session.setAttribute("error", mp.getError(objList));
				pageName = "error_viewer.jsp";
			} else {
				session.setAttribute("prdList", objList);
				JBObjList list = mp.receiveMessageRecordList("SWDOPE", "SWDREC");
				JBList beanList = new JBList();
				StringBuffer myRow = null;
				boolean firstTime = true;
				String chk = "";
				list.initRow();
				while (list.getNextRow()) {
					EWD0001SMessage msgCustS = (EWD0001SMessage) list.getRecord();
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					myRow = new StringBuffer();
					myRow.append("<TR>");
					myRow.append("<TD NOWRAP><input type=\"radio\" name=\"CUSTOMER\" value=\"" + msgCustS.getSWDCUN() + "\" " + chk + "></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"LEFT\">" + Util.formatCell(msgCustS.getSWDCUN()) + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=\"LEFT\">" + Util.formatCell(msgCustS.getSWDNA1()) + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=\"LEFT\">" + Util.formatCell(msgCustS.getSWDIDN()) + "</TD>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}	
				beanList.setFirstRec(list.getFirstRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				session.setAttribute("custList", beanList);
				session.setAttribute("userPO", userPO);
				
				req.setAttribute("NameSearch", "A"); 
				req.setAttribute("Type", "T"); 
				pageName = "EFE0000_fe_enter_inquiry.jsp";
			}
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqProductsBasic(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0001", req);
			EWD0301DSMessage msgCust = (EWD0301DSMessage) mp.getMessageRecord("EWD0301DS");
			msgCust.setRWDUSR(user.getH01USR());
			
			String type = req.getParameter("SOURCE") == null ? "T" : req.getParameter("SOURCE").trim();
			msgCust.setRWDTYP(type.equals("") ? "T" : type);
				
			try {
				msgCust.setRWDFRC(req.getParameter("FromRecord").trim());
			} catch (Exception e) {
				msgCust.setRWDFRC("0");
			}
			
			mp.sendMessage(msgCust);
			JBObjList objList = mp.receiveMessageRecordList("SWDOPE");
			
			if (mp.hasError(objList)) {
				session.setAttribute("error", mp.getError(objList));
				pageName = "error_viewer.jsp";
			} else {
				session.setAttribute("prdList", objList);
				JBObjList list = mp.receiveMessageRecordList("SWDOPE", "SWDREC");
				JBList beanList = new JBList();
				StringBuffer myRow = null;
				boolean firstTime = true;
				String chk = "";
				list.initRow();
				while (list.getNextRow()) {
					EWD0001SMessage msgCustS = (EWD0001SMessage) list.getRecord();
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					myRow = new StringBuffer();
					myRow.append("<TR>");
					myRow.append("<TD NOWRAP><input type=\"radio\" name=\"CUSTOMER\" value=\"" + msgCustS.getSWDCUN() + "\" " + chk + "></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"LEFT\">" + Util.formatCell(msgCustS.getSWDCUN()) + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=\"LEFT\">" + Util.formatCell(msgCustS.getSWDNA1()) + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=\"LEFT\">" + Util.formatCell(msgCustS.getSWDIDN()) + "</TD>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}	
				beanList.setFirstRec(list.getFirstRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				session.setAttribute("custList", beanList);
				session.setAttribute("userPO", userPO);
				
				TrOption options = session.getAttribute("trOption") == null ? new TrOption() : (TrOption) session.getAttribute("trOption");
				session.setAttribute("trOption", options);
				
				req.setAttribute("Type", type); 
				pageName = "EFE0000_fe_enter_var_opt.jsp";
			}
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqEnterBasic(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		UserPos userPO = getUserPos(req);
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0001", req);
			EWD0001RMessage msgCust = (EWD0001RMessage) mp.getMessageRecord("EWD0001R");
			msgCust.setRWDUSR(user.getH01USR());
			msgCust.setRWDSHR("A");
			msgCust.setRWDTYP("T");
			try {
				msgCust.setRWDFRC(req.getParameter("FromRecord").trim());
			} catch (Exception e) {
				msgCust.setRWDFRC("0");
			}
			
			mp.sendMessage(msgCust);
			JBObjList list = mp.receiveMessageRecordList("SWDOPE", "SWDREC");
			
			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "error_viewer.jsp";
			} else {
				JBList beanList = new JBList();
				StringBuffer myRow = null;
				boolean firstTime = true;
				String chk = "";
				list.initRow();
				while (list.getNextRow()) {
					EWD0001SMessage msgCustS = (EWD0001SMessage) list.getRecord();
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					myRow = new StringBuffer();
					myRow.append("<TR>");
					myRow.append("<TD NOWRAP><input type=\"radio\" name=\"CUSTOMER\" value=\"" + msgCustS.getSWDCUN() + "\" " + chk + "></TD>");
					myRow.append("<TD NOWRAP ALIGN=\"LEFT\">" + Util.formatCell(msgCustS.getSWDCUN()) + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=\"LEFT\">" + Util.formatCell(msgCustS.getSWDNA1()) + "</TD>");
					myRow.append("<TD NOWRAP ALIGN=\"LEFT\">" + Util.formatCell(msgCustS.getSWDIDN()) + "</TD>");
					myRow.append("</TR>");
					beanList.addRow("", myRow.toString());
				}
				beanList.setFirstRec(list.getFirstRec());
				beanList.setShowNext(list.getShowNext());
				beanList.setShowPrev(list.getShowPrev());
				
				session.setAttribute("custList", beanList);
				session.setAttribute("userPO", userPO);
				
				req.setAttribute("NameSearch", "A"); 
				req.setAttribute("Type", "T"); 
				pageName = "EFE0000_fe_enter_var_opt.jsp";
			}
			
			forward(pageName, req, res);
			
		} finally {
			if (mp != null) mp.close();
		}
	}

}
