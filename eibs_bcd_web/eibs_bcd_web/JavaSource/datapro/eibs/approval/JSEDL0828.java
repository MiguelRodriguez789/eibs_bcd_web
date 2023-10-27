package datapro.eibs.approval;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.EDL082501Message;
import datapro.eibs.beans.EDL082801Message;
import datapro.eibs.beans.EDL082802Message;
import datapro.eibs.beans.EDL087601Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.EWD0145DSMessage;
import datapro.eibs.beans.JBListRec;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;

public class JSEDL0828 extends JSEIBSServlet {

	protected static final int R_PASSWORD 		= 1;
	protected static final int R_LIST 			= 2;
	protected static final int A_LIST 			= 3;
	protected static final int R_PAY_DETAIL 	= 4;
	protected static final int R_CANCEL_DETAIL 	= 5;
	protected static final int R_SUMMARY 		= 6;
	protected static final int R_ADJUST_DETAIL 	= 7;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
			// Requests
			case R_PASSWORD :
				procReqPassword(user, req, res, session);
				break;
			case R_LIST :
				procReqList(user, req, res, session);
				break;
			case R_PAY_DETAIL :
				procReqPayDetail(user, req, res, session);
				break;
			case R_CANCEL_DETAIL :
				procReqCancelDetail(user, req, res, session);
				break;
				// Actions
			case A_LIST :
				procActionList(user, req, res, session);
				break;
			case R_ADJUST_DETAIL :
			    procReqAdjustDetail(user, req, res, session);
				break;    
			default :
				forward(devPage, req, res);
				break;
		}
	}

	private void procReqAdjustDetail(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0876", req);
			EDL087601Message msgAdjDoc = (EDL087601Message) mp.getMessageRecord("EDL087601");
			msgAdjDoc.setH01USERID(user.getH01USR());
			msgAdjDoc.setH01PROGRM("EDL0876");
			msgAdjDoc.setH01TIMSYS(getTimeStamp());
			msgAdjDoc.setH01SCRCOD("01");
			msgAdjDoc.setH01OPECOD("0004");
			try {
				msgAdjDoc.setE01DLDNLN(req.getParameter("Loan").trim());
			} catch (Exception e) {
			}
			try {
				msgAdjDoc.setE01DLDDID(req.getParameter("ID").trim());
			} catch (Exception e) {
			}
			try {
				msgAdjDoc.setE01DLDNDR(req.getParameter("Doc").trim());
			} catch (Exception e) {
			}
			try {
				msgAdjDoc.setE01DLDDTP(req.getParameter("Type").trim());
			} catch (Exception e) {
			}
			
			mp.sendMessage(msgAdjDoc);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgAdjDoc = (EDL087601Message) mp.receiveMessageRecord("EDL087601");
			
			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "EDL0828_pay_inq_ln_adjustments.jsp";
			}
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("lnAdjustment", msgAdjDoc);
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procActionList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0828", req);
			EDL082802Message msgList = (EDL082802Message) mp.getMessageRecord("EDL082802");
			msgList.setH02USERID(user.getH01USR());
			msgList.setH02PROGRM("EDL0828");
			msgList.setH02TIMSYS(getTimeStamp());
			try {
				msgList.setE02SELDID(req.getParameter("ID").trim());
			} catch (Exception e) {
			}
			try {
				msgList.setE02SELDTP(req.getParameter("Type").trim());
			} catch (Exception e) {
			}
			try {
				msgList.setE02SELNDR(req.getParameter("Doc").trim());
			} catch (Exception e) {
			}
			try {
				msgList.setE02SELNLN(req.getParameter("Loan").trim());
			} catch (Exception e) {
			}
			try {
				msgList.setE02ACTION(req.getParameter("action").trim());
			} catch (Exception e) {
			}
			try {
				msgList.setE02MSGTXT(req.getParameter("reason").trim());
			} catch (Exception e) {
			}
			
			mp.sendMessage(msgList);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			
			if (mp.hasError(msgError)) {
				session.setAttribute("error", msgError);
				forward("EDL0828_doc_ap_list.jsp", req, res);
			} else {
				procReqPassword(user, req, res, session);
			}
			
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqCancelDetail(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EWD0145", req);
			EWD0145DSMessage msgPay = (EWD0145DSMessage) mp.getMessageRecord("EWD0145DS");	
			try {
				msgPay.setE01SELLNS(req.getParameter("Loan").trim());
			} catch (Exception e) {
			}
			try {
				msgPay.setE01SELIDE(req.getParameter("ID").trim());
			} catch (Exception e) {
			}
			try {
				msgPay.setE01SELGIR(req.getParameter("Doc").trim());
			} catch (Exception e) {
			}
			msgPay.setE01SELSTS("A");
			
			mp.sendMessage(msgPay);
			MessageRecord msg = mp.receiveMessageRecord();
			
			if (mp.hasError(msg)) {
				session.setAttribute("error", msg);
			} else if ("EWD0145DS".equals(msg.getFormatName())) {
				msgPay = (EWD0145DSMessage) msg;
				
				int colNum = 30;
				String myRow[] = new String[colNum];
				for (int i = 0; i < colNum; i++) {
					myRow[i] = "";
				}
				
				JBListRec docList = new JBListRec();
				docList.init(colNum);
				
				BigDecimal capital = msgPay.getBigDecimalE01DLDNAM().subtract(msgPay.getBigDecimalE01DLDPAM());
				BigDecimal total = capital;
				BigDecimal penalty = msgPay.getBigDecimalE01DLDIPA().subtract(msgPay.getBigDecimalE01DLDIPD());
				total = total.add(penalty);
				BigDecimal interest = msgPay.getBigDecimalE01DLDOIA().subtract(msgPay.getBigDecimalE01DLDPIA());
				total = total.add(interest);
				total = total.add(msgPay.getBigDecimalE01DLDREV());
				
			    myRow[0] = msgPay.getE01DLDNDR(); // Doc. Number
				myRow[1] = msgPay.getE01DLDDID(); // Acceptant ID
				myRow[2] = msgPay.getE01DLDNME(); // Acceptant Name
				myRow[3] = Util.formatCCY(msgPay.getE01DLDOAM()); // Amount 
				myRow[4] = Util.formatCustomDate(user.getE01DTF(),
							msgPay.getBigDecimalE01DLDMAM().intValue(),
							msgPay.getBigDecimalE01DLDMAD().intValue(),
							msgPay.getBigDecimalE01DLDMAY().intValue()); // Mat. Date
				myRow[5] = Util.formatCCY(penalty.toString()); // penalty amount
				myRow[6] = msgPay.getE01DLDDTP(); // Type Doc.
				myRow[7] = msgPay.getE01DLDNLN(); // Loans Number
				myRow[8] = msgPay.getE01DLDRST(); // Status
				myRow[9] = msgPay.getE01CUSNA1(); // Client
			    myRow[10] = msgPay.getE01DLDBNK(); // bank
			    myRow[11] = msgPay.getE01DLDBRN(); // branch
			    myRow[12] = msgPay.getE01DLDCCY(); // currency
			    myRow[13] = msgPay.getE01DLDGLN(); // GL
			    myRow[14] = Util.formatCCY(capital.toString()); // capital amount
			    myRow[15] = Util.formatCCY(interest.toString()); // interest amount
			    myRow[16] = Util.formatCCY(msgPay.getE01DLDREV()); // rev. amount
			    myRow[17] = Util.formatCCY(total.toString()); // total amount
			    myRow[18] = Util.formatCustomDate(user.getE01DTF(),
			    			msgPay.getBigDecimalE01DLDRFM().intValue(),
			    			msgPay.getBigDecimalE01DLDRFD().intValue(),
			    			msgPay.getBigDecimalE01DLDRFY().intValue()); // Open. Date
				myRow[19] = msgPay.getE01DLDGPD(); // Grace Period
				myRow[20] = msgPay.getE01DLDREW()+" - "+msgPay.getE01DSCREW(); //payment via
				myRow[21] = msgPay.getE01DLDPYW()+" - "+msgPay.getE01DSCPYW(); //plaza de pago
				myRow[22] = msgPay.getE01DLDREM()+" - "+msgPay.getE01DSCREM(); //agente cobrador
				//for checks
				myRow[23] = msgPay.getE01DLDKBK(); // check bank
			    myRow[24] = msgPay.getE01DLDKBR(); // check branch
			    myRow[25] = msgPay.getE01DLDCTA(); // account number
			    myRow[26] = msgPay.getE01DLDCHQ(); // check number
				myRow[27] = Util.formatCustomDate(user.getE01DTF(),
							msgPay.getBigDecimalE01DLDPDM().intValue(),
							msgPay.getBigDecimalE01DLDPDD().intValue(),
							msgPay.getBigDecimalE01DLDPDY().intValue()); // Envio a camara
				myRow[28] = msgPay.getE01DEACUN(); // Client Number
				myRow[29] = msgPay.getE01DLDARC(); // Interest Rate
				
				docList.addRow("", myRow);
				
				mp.close();
				
				mp = getMessageProcessor("EDL0825", req);
				EDL082501Message msgPayDoc = (EDL082501Message) mp.getMessageRecord("EDL082501");
				msgPayDoc.setH01USERID(user.getH01USR());
				msgPayDoc.setH01PROGRM("EDL0825");
				msgPayDoc.setH01TIMSYS(getTimeStamp());
				msgPayDoc.setH01SCRCOD("01");
				msgPayDoc.setH01OPECOD("0002");
				try {
					msgPayDoc.setE01SELNLN(req.getParameter("Loan").trim());
				} catch (Exception e) {
				}
				try {
					msgPayDoc.setE01SELDID(req.getParameter("ID").trim());
				} catch (Exception e) {
				}
				try {
					msgPayDoc.setE01SELNDR(req.getParameter("Doc").trim());
				} catch (Exception e) {
				}
				try {
					msgPayDoc.setE01SELDTP(req.getParameter("Type").trim());
				} catch (Exception e) {
				}
				msgPayDoc.setH01FLGWK1("Q");
				
				mp.sendMessage(msgPayDoc);
				ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
				msgPayDoc = (EDL082501Message) mp.receiveMessageRecord("EDL082501");
				
		    	flexLog("Putting java beans into the session");
		    	session.setAttribute("error", msgError);
		    	session.setAttribute("docList", docList);
		    	session.setAttribute("payDoc", msgPayDoc);
				
		    	if (mp.hasError(msgError)) {
					pageName = "error_viewer.jsp";
				} else {
					pageName = "EDL0828_cancel_ap_det.jsp";
				}
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqPayDetail(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0828", req);
			EDL082501Message msgPayDoc = (EDL082501Message) mp.getMessageRecord("EDL082501");
			msgPayDoc.setH01USERID(user.getH01USR());
			msgPayDoc.setH01PROGRM("EDL0825");
			msgPayDoc.setH01TIMSYS(getTimeStamp());
			msgPayDoc.setH01SCRCOD("01");
			msgPayDoc.setH01OPECOD("0002");
			msgPayDoc.setE01SELNLN(req.getParameter("Loan"));
			msgPayDoc.setE01SELDID(req.getParameter("ID"));
			msgPayDoc.setE01SELNDR(req.getParameter("Doc"));
			msgPayDoc.setE01SELDTP(req.getParameter("Type"));
			msgPayDoc.setH01FLGWK1("P");
			
			mp.sendMessage(msgPayDoc);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			msgPayDoc = (EDL082501Message) mp.receiveMessageRecord("EDL082501");
			
			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "EDL0828_pay_ap_det.jsp";
			}
			flexLog("Putting java beans into the session");
			session.setAttribute("error", msgError);
			session.setAttribute("payDoc", msgPayDoc);
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException, ServletException {
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDL0828", req);
			EDL082801Message msgList = (EDL082801Message) mp.getMessageRecord("EDL082801");
			msgList.setH01USERID(user.getH01USR());
			msgList.setH01PROGRM("EDL0828");
			msgList.setH01TIMSYS(getTimeStamp());
			msgList.setH01SCRCOD("01");
			msgList.setH01OPECOD("0000");
			
			mp.sendMessage(msgList);
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");
			
			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "error_viewer.jsp";
			} else {
				int colNum = 9;
				JBListRec beanList = new JBListRec();
				beanList.init(colNum);
				JBListRec beanAccList = new JBListRec();
				beanAccList.init(colNum);
				
				String myFlag = "";
				String myRow[] = new String[colNum];
				String myAccRow[] = new String[colNum];
				BigDecimal totPerACC = new BigDecimal("0");

				for (int i = 0; i < colNum; i++) {
					myRow[i] = "";
					myAccRow[i] = "";
				}
				
				list.initRow();
				while (list.getNextRow()) {
					msgList = (EDL082801Message) list.getRecord();
					if (!myFlag.equals(msgList.getE01DEAACC())) {
						myFlag = msgList.getE01DLDNLN();
						totPerACC = new BigDecimal("0");

						myAccRow[0] = msgList.getE01DLDNLN(); // Account Number
						myAccRow[1] = msgList.getE01DEACUN(); // Customer Number
						myAccRow[2] = msgList.getE01CUSNA1(); // Customer Name
						myAccRow[3] = msgList.getE01DEAPRO(); // Product
						myAccRow[4] = msgList.getE01TRNTOT(); // Net Balance
						myAccRow[5] = msgList.getE01WKPUSR(); // User	

						beanAccList.addRow(myFlag, myAccRow);
					}
					myRow[0] = msgList.getE01DLDNDR(); // Doc Number
					myRow[1] = msgList.getE01DLDDID(); // Acceptor ID
					myRow[2] = msgList.getE01ACPNME(); // Acceptor Name
					myRow[3] = msgList.getE01TRNTOT(); // Amount to Pay
					myRow[4] = msgList.getE01PAGTOT(); // Amount Paid	
					myRow[5] = msgList.getE01REMARK(); // Status
					myRow[6] = msgList.getE01DLDDTP(); // Type Doc.
					myRow[7] = msgList.getE01DLDNLN(); // Loan Number
					myRow[8] = msgList.getH01FLGWK1(); // Flag "D" devolution, "A" adjust
					
					beanList.addRow(myFlag, myRow);
					totPerACC = totPerACC.add(msgList.getBigDecimalE01TRNTOT());
					beanAccList.setRecord(totPerACC.toString(), 4, beanAccList.getLastRec());
				}
				flexLog("Putting java beans into the session");
				session.setAttribute("docList", beanList);
				session.setAttribute("accList", beanAccList);
				
				if (beanAccList.getNoResult()) {
					pageName = "MISC_no_result.jsp";
				} else {
					pageName = "EDL0828_doc_ap_list.jsp";
				}
			}
			
			forward(pageName, req, res);
		} finally {
			if (mp != null) mp.close();
		}
	}

	private void procReqPassword(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setRedirect("/servlet/datapro.eibs.approval.JSEDL0828?SCREEN=2");
		session.setAttribute("userPO", userPO);
		
		redirect("/servlet/datapro.eibs.menu.JSESS0030?SCREEN=7", res);
	}

}
