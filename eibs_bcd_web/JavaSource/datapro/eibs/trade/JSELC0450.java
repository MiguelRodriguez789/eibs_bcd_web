package datapro.eibs.trade;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datapro.eibs.beans.ELC044001Message;
import datapro.eibs.beans.ELC044501Message;
import datapro.eibs.beans.ELC045001Message;
import datapro.eibs.beans.ELC045002Message;
import datapro.eibs.beans.ELC045005Message;
import datapro.eibs.beans.ELC046001Message;
import datapro.eibs.beans.ELC046002Message;
import datapro.eibs.beans.ELC046003Message;
import datapro.eibs.beans.ELC046004Message;
import datapro.eibs.beans.ELC046005Message;
import datapro.eibs.beans.ELC046006Message;
import datapro.eibs.beans.ELC051003Message;
import datapro.eibs.beans.ELC056101Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD000002Message;
import datapro.eibs.beans.ESD000005Message;
import datapro.eibs.beans.ESD071104Message;
import datapro.eibs.beans.ESD0714DSMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBLCHist;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.master.Util;
import datapro.eibs.sockets.MessageRecord;

/**
 * @author erodriguez
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class JSELC0450 extends JSEIBSServlet {

	// Letter of Credit 
	protected static final int R_BASIC_INQ			= 1;
	protected static final int R_CODES_INQ			= 3;
	protected static final int R_COMMISSIONS_INQ	= 5;
	protected static final int A_STATEMENT			= 6;	
	protected static final int R_SPECIAL_INST_INQ	= 7;
	protected static final int R_PRODUCTS			= 9;
	protected static final int R_RATE_TB			= 11;
	protected static final int R_GUARANTEE			= 13;
	protected static final int R_DOCUMENT			= 15;
	protected static final int R_SWIFT_INQUIRY		= 52;

	// entering options
	protected static final int R_ENTER_INQUIRY		= 100;	
	protected static final int A_ENTER_INQUIRY		= 200;
	protected static final int R_LIST				= 210;
	protected static final int R_ENTER_INQUIRY_EXP = 300;
	protected static final int R_LIST_EXP = 410;
	
	protected static final int R_HIST_MAINT			= 420;
	
	protected static final int R_ENTER_INQUIRY_HIS	= 425;
	protected static final int R_HISTORY_DETAIL		= 430;
	protected static final int R_HISTORY_DETAIL_FM	= 435;
	protected static final int R_HISTORY_DETAIL_CREDIT	= 500;
	protected static final int A_ENTER_INQUIRY_ACC	= 900;
	
	protected static final int A_ENTER_INQUIRY_TRANS_LIST	= 1000;
	protected static final int A_ENTER_INQUIRY_ASIGN_LIST	= 1100;
	protected static final int A_ENTER_INQUIRY_TRANS	= 1050;
	protected static final int A_ENTER_INQUIRY_ASIGN	= 1150;
	
	protected static final int R_NEGOTIATION_HISTORY_DETAIL	= 2000;
	protected static final int R_TRANSFER_HISTORY_DETAIL	= 2100;
	protected static final int R_TRANSFER_COMMISIONS_HISTORY_DETAIL	= 2150;
	protected static final int R_ASSIGNMENT_HISTORY_DETAIL	= 2200;
	
	protected static final int R_SWIFT_HISTORY_DETAIL	= 51;
	protected static final int R_SWIFT_COMISSIONS_HISTORY_DETAIL = 5105;
	protected static final int R_SWIFT_DOCS_HISTORY_DETAIL	= 5102;
	
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {

		switch (screen) {
		//Inquiry Options
		case R_BASIC_INQ :
			procReqInqBasic(user, req, res, session);
			break;									
		case R_CODES_INQ :
			procReqSpecialCodesInq(user, req, res, session);
			break;
		case R_SPECIAL_INST_INQ :
			procReqEspInstInq(user, req, res, session);
			break;
		case R_PRODUCTS:
			procReqProductLC(user, req, res, session);
			break;
		case R_RATE_TB:
			procReqInqTable(user, req, res, session);
			break;
		case R_GUARANTEE:
			procReqCollAssets(req, res, session);
			break;
		// Request
		case R_ENTER_INQUIRY : 
			procReqEnterInquiry(req, res, session);
			break;
		case R_LIST :
			procReqList(user, req, res, session);
			break;
		case R_LIST_EXP:
			procReqListExpiration(user, req, res, session);
			break;	
		case R_ENTER_INQUIRY_EXP:
			procReqEnterInquiryExpiration(req, res, session);
			break;	
		// Action 
		case A_ENTER_INQUIRY : 
			procActionEnterInquiry(user, req, res, session);
			break;
		case R_SWIFT_INQUIRY : 
			requestConsultaOther(user, req, res, session);
			break;
		case R_HIST_MAINT :
			procReqHistMaintenance(user, req, res, session);
			break;
		case R_ENTER_INQUIRY_HIS :
			procReqHistoryList(user, req, res, session);
			break;
		case A_ENTER_INQUIRY_ACC :
			procActionEnterInquiryACC(user, req, res, session);
			break;
		case R_HISTORY_DETAIL_FM :
		case R_HISTORY_DETAIL :
			procReqHistoryDetail(user, req, res, session, screen);
			break;
		case R_HISTORY_DETAIL_CREDIT :
			procReqHistoryDetailCredit(user, req, res, session);
			break;
		case A_ENTER_INQUIRY_TRANS_LIST :
			procActionEnterInquiryTrans(user, req, res, session);
			break;
		case A_ENTER_INQUIRY_ASIGN_LIST :
			procActionEnterInquiryAsign(user, req, res, session);
			break;
		case A_ENTER_INQUIRY_TRANS :
			procReqTransfer(user, req, res,session, screen);
			break;
		case A_ENTER_INQUIRY_ASIGN :
			procReqAssign(user, req, res,session, screen);
			break;
		case R_NEGOTIATION_HISTORY_DETAIL :
			requestNegotiationHist(user, req, res, session, screen);
			break;
		case R_TRANSFER_HISTORY_DETAIL :
			procReqTransferHist(user, req, res, session, screen);
			break;
		case R_ASSIGNMENT_HISTORY_DETAIL :
			procReqAssignHist(user, req, res, session, screen);
			break;	
		case R_TRANSFER_COMMISIONS_HISTORY_DETAIL :
			procReqTransferCommissionHist(user, req, res, session, screen);
			break;	
		case R_SWIFT_HISTORY_DETAIL :
			procReqSwiftHist(user, req, res, session, screen);
			break;	
		case R_SWIFT_COMISSIONS_HISTORY_DETAIL :
			procReqSwiftCommissionsHist(user, req, res, session, screen);
			break;	
		case R_SWIFT_DOCS_HISTORY_DETAIL :
			procReqSwiftDocsHist(user, req, res, session, screen);
			break;	
		default :
			forward(devPage, req, res);
			break;
		}
	}


	protected void procReqInqBasic(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		if (Util.parseBigDecimal(userPO.getAccNum()).longValue() == 0) {
			userPO.setAccNum(userPO.getIdentifier());
		} else if (Util.parseBigDecimal(userPO.getIdentifier()).longValue() == 0) {
			userPO.setIdentifier(userPO.getAccNum());
		}
		String pageName = "";

		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC0450", req);
			ELC045001Message msg = (ELC045001Message) mp.getMessageRecord("ELC045001", user.getH01USR(), "0004");
			msg.setH01SCRCOD("01");
			msg.setE01LCMACC(userPO.getIdentifier());

			mp.sendMessage(msg);
			MessageRecord newmsg = mp.receiveMessageRecord();

			if (mp.hasError(newmsg)) {
				msgError = (ELEERRMessage) newmsg;
				pageName = "ELC0450_lc_enter_inquiry.jsp";
			} else {
				msgError = new ELEERRMessage();
				session.setAttribute("lcBasic", newmsg);
				pageName = "ELC0450_lc_inq_basic.jsp";
			}

			session.setAttribute("error", msgError);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	protected void procReqSpecialCodesInq(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";

		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0000", req);
			ESD000002Message msg = (ESD000002Message) mp.getMessageRecord("ESD000002", user.getH01USR(), "0004");
			msg.setH02SCR("01");
			msg.setH02OPE("0004");
			msg.setE02ACC(userPO.getIdentifier());

			mp.sendMessage(msg);
			MessageRecord newmsg = mp.receiveMessageRecord();

			if (mp.hasError(newmsg)) {
				msgError = (ELEERRMessage) newmsg;
				pageName = "ELC0450_lc_inq_basic.jsp";
			} else {
				msgError = new ELEERRMessage();
				session.setAttribute("lcCodes", newmsg);
				pageName = "ELC0450_lc_inq_codes.jsp";
			}

			session.setAttribute("error", msgError);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	protected void procReqEspInstInq(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";

		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0000", req);
			ESD000005Message msg = (ESD000005Message) mp.getMessageRecord("ESD000005", user.getH01USR(), "0004");
			msg.setH05SCR("01");
			msg.setH05OPE("0004");
			msg.setE05ACC(userPO.getIdentifier());
			msg.setE05ACD("40");

			mp.sendMessage(msg);
			MessageRecord newmsg = mp.receiveMessageRecord();

			if (mp.hasError(newmsg)) {
				msgError = (ELEERRMessage) newmsg;
				pageName = "ELC0450_lc_inq_basic.jsp";
			} else {
				msgError = new ELEERRMessage();
				session.setAttribute("lcInst", newmsg);
				pageName = "ELC0450_lc_inq_special_inst.jsp";
			}

			session.setAttribute("error", msgError);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	protected void procReqProductLC(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";

		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0711", req);
			ESD071104Message msg = (ESD071104Message) mp.getMessageRecord("ESD071104");
			msg.setH04USERID(user.getH01USR());
			msg.setH04OPECOD("0004");
			msg.setH04SCRCOD("01");
			msg.setE04APCCDE(userPO.getHeader1());
			msg.setE04APCBNK(userPO.getBank());

			mp.sendMessage(msg);
			MessageRecord newmsg = mp.receiveMessageRecord();

			if (mp.hasError(newmsg)) {
				msgError = (ELEERRMessage) newmsg;
				pageName = "ELC0450_lc_inq_basic.jsp";
			} else {
				msgError = new ELEERRMessage();
				session.setAttribute("lcProdInq", newmsg);
				pageName = "ELC0450_lc_inq_products.jsp";
			}

			session.setAttribute("error", msgError);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	protected void procReqInqTable(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";

		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ESD0714", req);
			ESD0714DSMessage msg = (ESD0714DSMessage) mp.getMessageRecord("ESD0714DS", user.getH01USR(), "0004");
			msg.setH01SCRCOD("01");
			msg.setE01SELBNK(userPO.getBank());
			msg.setE01SELTLN(Util.justifyRight(userPO.getHeader22(), 2));
			msg.setE01SELTYP(userPO.getHeader21());

			mp.sendMessage(msg);
			MessageRecord newmsg = mp.receiveMessageRecord();

			if (mp.hasError(newmsg)) {
				msgError = (ELEERRMessage) newmsg;
				pageName = "ELC0450_lc_inq_basic.jsp";
			} else {
				msgError = new ELEERRMessage();
				session.setAttribute("lctProdInq", newmsg);
				pageName = "ELC0450_lc_inq_fee_tab.jsp";
			}

			session.setAttribute("error", msgError);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	protected void procReqCollAssets(HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws IOException {
		
		String key = "";
		try {
			key = "&userPOKey" + req.getParameter("userPOKey").trim();
		} catch (Exception e) {
			// TODO: handle exception
		}
		res.sendRedirect(srctx + "/servlet/datapro.eibs.client.JSERA0000?SCREEN=1" + key);	
	}


	protected void procReqEnterInquiry(HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		initTransaction(userPO, "LC", "INQUIRY");
		
		forward("ELC0450_lc_enter_inquiry.jsp", req, res);
	}


	protected void procReqList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC0440", req);
			ELC044001Message msg044001 = (ELC044001Message) mp.getMessageRecord("ELC044001", user.getH01USR(), "0015");

			setMessageRecord(req, msg044001);
			
			mp.sendMessage(msg044001);
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "ELC0450_lc_enter_inquiry.jsp";
			} else {
				session.setAttribute("jbList", list);				
				pageName = "ELC0450_lc_inquiry_list.jsp";
			}

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	protected void procReqListExpiration(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC0440", req);
			ELC044501Message msg044001 = (ELC044501Message) mp.getMessageRecord("ELC044501", user.getH01USR(), "0015");
		    msg044001.setH01USERID(user.getH01USR());
		    msg044001.setH01OPECOD("0015");
		    msg044001.setH01PROGRM("ELC0445");
		    
		    setMessageRecord(req, msg044001);

			mp.sendMessage(msg044001);
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "ELC0450_lc_enter_inquiry_expiration.jsp";
			} else {
				session.setAttribute("jbList", list);				
				pageName = "ELC0450_lc_inquiry_expiration_list.jsp";
			}

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	protected void procReqEnterInquiryExpiration(HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		initTransaction(userPO, "LC", "INQUIRY");
		
		req.setAttribute("userPOKey", req.getParameter("userPOKey"));
		forward("ELC0450_lc_enter_inquiry_expiration.jsp", req, res);
	}


	protected void procActionEnterInquiry(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";

		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC0450", req);
			ELC045001Message msg = (ELC045001Message) mp.getMessageRecord("ELC045001", user.getH01USR(), "0002");
			msg.setH01SCRCOD("01");
			msg.setE01LCMACD("LC");
			try {
				msg.setE01LCMACC(req.getParameter("E01LCMACC").trim());
			} catch (Exception e)	{
				msg.setE01LCMACC("0");
			}

			mp.sendMessage(msg);
			MessageRecord newmsg = mp.receiveMessageRecord();

			if (mp.hasError(newmsg)) {
				msgError = (ELEERRMessage) newmsg;
				pageName = "ELC0450_lc_enter_inquiry.jsp";
			} else {
				msgError = new ELEERRMessage();
				msg = (ELC045001Message) newmsg;
				userPO.setCusNum(msg.getE01LCMCUN());
				userPO.setCusName(msg.getE01CUSNA1());
				userPO.setIdentifier(msg.getE01LCMACC());
				userPO.setAccNum(msg.getE01LCMACC());
				userPO.setBank(msg.getE01LCMBNK());
				userPO.setHeader1(msg.getE01LCMPRO());
				userPO.setHeader2(msg.getE01LCMCUN());
				userPO.setHeader3(msg.getE01CUSNA1());
				userPO.setCurrency(msg.getE01LCMCCY());
				userPO.setHeader22(msg.getE01LCMTAR());
				userPO.setHeader21(msg.getE01LCMATY());
				userPO.setOfficer(msg.getE01LCMOFC() + " - " + msg.getE01DSCOFC());
				userPO.setHeader10(msg.getE01LCMAP1());
				userPO.setHeader11(msg.getE01LCMAP2());
				userPO.setHeader12(msg.getE01LCMAP3());
				userPO.setHeader13(msg.getE01LCMAP4());
				userPO.setHeader14(msg.getE01LCMAPA());
				userPO.setProdCode(msg.getE01LCMPRO());
				
				pageName = "ELC0450_lc_inq_basic.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("lcBasic", msg);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	protected void requestConsultaOther(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		initTransaction(userPO, "", "INQUIRY");
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC0510", req);
			ELC051003Message msg051003 = (ELC051003Message) mp.getMessageRecord("ELC051003", user.getH01USR(), "0002");
			msg051003.setE03LCDACC(userPO.getAccNum());
			try {
				msg051003.setE03LCDFCD(req.getParameter("fcode").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}

			mp.sendMessage(msg051003);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msg051003 = (ELC051003Message) mp.receiveMessageRecord("ELC051003");

			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ELC0450_lc_field_info_inquiry.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("msg", msg051003);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	protected void procReqHistMaintenance(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC0450", req);
			ELC045002Message msgList = (ELC045002Message) mp.getMessageRecord("ELC045002");
			msgList.setH02USERID(user.getH01USR());
			msgList.setH02PROGRM("ELC0450");
			msgList.setH02TIMSYS(getTimeStamp());
			msgList.setH02SCRCOD("01");
			msgList.setH02OPECOD("015");
			try {
				msgList.setE02LCLACC(userPO.getIdentifier());
				userPO.setAccNum(userPO.getIdentifier());
			} catch (Exception e) {
				// TODO: handle exception
			}

			mp.sendMessage(msgList);
			JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ELC0450_db_change_list.jsp";
			}

			session.setAttribute("dbList", list);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	protected void procReqHistoryList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC0450", req);
			ELC045002Message msg045002 = (ELC045002Message) mp.getMessageRecord("ELC045002", user.getH01USR(), "0015");
			try {
				msg045002.setE02LCLACC(req.getParameter("E02LCLACC").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}

			mp.sendMessage(msg045002);
			JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "ELC0460_lc_enter_inquiry.jsp";
			} else {
				if(list.size() > 0) {
					msg045002 = (ELC045002Message) list.get(0);
				
					userPO.setAccNum(msg045002.getE02LCLACC());
					userPO.setBank(msg045002.getE02LCMBNK());
					userPO.setCurrency(msg045002.getE02LCMCCY());
					userPO.setProdCode(msg045002.getE02LCMPRO());
					
					session.setAttribute("jbList", list);
					
					pageName = "ELC0460_lc_inquiry_list.jsp";
				} else {
					pageName = "MISC_no_result.jsp";
				}
			}

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	protected void procActionEnterInquiryACC(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		initTransaction(userPO, "LC", "INQUIRY");
		
		forward("ELC0460_lc_enter_inquiry.jsp", req, res);
	}


	protected void procReqHistoryDetail(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC0460", req);
			ELC046001Message msg046001 = (ELC046001Message) mp.getMessageRecord("ELC046001", user.getH01USR(), "0004");
			
			if (screen == R_HISTORY_DETAIL_FM) {
				JBLCHist bLCHist = (JBLCHist) session.getAttribute("bLCHist");
				msg046001.setE01LCMACC(bLCHist.getACC());
				msg046001.setE01LCMTDY(bLCHist.getTDY());
				msg046001.setE01LCMTDM(bLCHist.getTDM());
				msg046001.setE01LCMTDD(bLCHist.getTDD());
				msg046001.setE01LCMTTM(bLCHist.getTTM());
				msg046001.setE01LCMADM(bLCHist.getAD1());
				msg046001.setE01LCMADD(bLCHist.getAD2());
				msg046001.setE01LCMADY(bLCHist.getAD3());
				msg046001.setE01LCMATM(bLCHist.getATM());
				msg046001.setE01DSCTTP(bLCHist.getDSCTTP());
				msg046001.setE01LCMOPR(bLCHist.getOPR());
				msg046001.setE01APPREJ(bLCHist.getAPPREJ());
				msg046001.setE01LCMSUP(bLCHist.getSUP());
				msg046001.setE01LCMCCY(bLCHist.getCCY());
				msg046001.setE01LCMPRO(bLCHist.getPRO());
				msg046001.setE01LCMBNK(bLCHist.getBNK());
			} else {
				try {
					msg046001.setE01LCMACC(req.getParameter("E01LCMACC").trim());
				} catch (Exception e) {
					msg046001.setE01LCMACC(userPO.getAccNum().trim());
				}
				try {
					msg046001.setE01DSCTTP(req.getParameter("E01DSCTTP").trim());
				} catch (Exception e) {
					msg046001.setE01DSCTTP(userPO.getHeader1().trim());
				}
				try {
					msg046001.setE01LCMOPR(req.getParameter("E01LCMOPR").trim());
				} catch (Exception e) {
					msg046001.setE01LCMOPR(userPO.getHeader2().trim());
				}
				try {
					msg046001.setE01APPREJ(req.getParameter("E01APPREJ").trim());
				} catch (Exception e) {
					msg046001.setE01APPREJ(userPO.getHeader4().trim());
				}
				try {
					msg046001.setE01LCMSUP(req.getParameter("E01LCMSUP").trim());
				} catch (Exception e) {
					msg046001.setE01LCMSUP(userPO.getHeader5().trim());
				}
				try {
					msg046001.setE01LCMTDM(req.getParameter("E01LCMTDM").trim());
				} catch (Exception e) {
					msg046001.setE01LCMTDM(userPO.getHeader10().trim());
				}
				try {
					msg046001.setE01LCMTDD(req.getParameter("E01LCMTDD").trim());
				} catch (Exception e) {
					msg046001.setE01LCMTDD(userPO.getHeader11().trim());
				}
				try {
					msg046001.setE01LCMTDY(req.getParameter("E01LCMTDY").trim());
				} catch (Exception e) {
					msg046001.setE01LCMTDY(userPO.getHeader12().trim());
				}
				try {
					msg046001.setE01LCMADM(req.getParameter("E01LCMADM").trim());
				} catch (Exception e) {
					msg046001.setE01LCMADM(userPO.getHeader13().trim());
				}
				try {
					msg046001.setE01LCMADD(req.getParameter("E01LCMADD").trim());
				} catch (Exception e) {
					msg046001.setE01LCMADD(userPO.getHeader14().trim());
				}
				try {
					msg046001.setE01LCMADY(req.getParameter("E01LCMADY").trim());
				} catch (Exception e) {
					msg046001.setE01LCMADY(userPO.getHeader15().trim());
				}
				try {
					msg046001.setE01LCMTTM(req.getParameter("E01LCMTTM").trim());
				} catch (Exception e) {
					msg046001.setE01LCMTTM(userPO.getHeader16().trim());
				}
				try {
					userPO.setID(req.getParameter("E02LCLTNO").trim());
				} catch (Exception e) {
					userPO.setID("0");
				}
			}
			msg046001.setH01FLGWK1("A");

			mp.sendMessage(msg046001);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msg046001 = (ELC046001Message) mp.receiveMessageRecord("ELC046001");

			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				JBLCHist bLCHist = new JBLCHist();
				bLCHist.setACC(msg046001.getE01LCMACC());
				try {
					bLCHist.setTNO(req.getParameter("E02LCLTNO").trim());
				} catch (Exception e) {
					// TODO: handle exception
				}
				bLCHist.setTDY(msg046001.getE01LCMTDY());
				bLCHist.setTDM(msg046001.getE01LCMTDM());
				bLCHist.setTDD(msg046001.getE01LCMTDD());
				bLCHist.setTTM(msg046001.getE01LCMTTM());
				bLCHist.setAD1(msg046001.getE01LCMADM());
				bLCHist.setAD2(msg046001.getE01LCMADD());
				bLCHist.setAD3(msg046001.getE01LCMADY());
				bLCHist.setATM(msg046001.getE01LCMATM());
				bLCHist.setDSCTTP(msg046001.getE01DSCTTP());
				bLCHist.setOPR(msg046001.getE01LCMOPR());
				bLCHist.setAPPREJ(msg046001.getE01APPREJ());
				bLCHist.setSUP(msg046001.getE01LCMSUP());
				bLCHist.setCCY(msg046001.getE01LCMCCY());
				bLCHist.setPRO(msg046001.getE01LCMPRO());
				bLCHist.setBNK(msg046001.getE01LCMBNK());;
				
				session.setAttribute("bLCHist", bLCHist);	
				
				userPO.setAccNum(msg046001.getE01LCMACC()); //Account
				userPO.setHeader1(msg046001.getE01DSCTTP()); //Operation Type
				userPO.setHeader2(msg046001.getE01LCMOPR()); //Operator
				userPO.setHeader3(Util.formatCustomDate(user.getE01DTF(), msg046001.getE01LCMTDM(), msg046001.getE01LCMTDD(), msg046001.getE01LCMTDY()) 
						+ " " +  Util.formatTime(msg046001.getE01LCMTTM())); //Date Time.
				userPO.setHeader4(msg046001.getE01APPREJ()); //Approval
				userPO.setHeader5(msg046001.getE01LCMSUP()); //Supervisor
				userPO.setHeader6(Util.formatCustomDate(user.getE01DTF(),msg046001.getE01LCMADM(), msg046001.getE01LCMADD(), msg046001.getE01LCMADY()) 
						+ " " +  Util.formatTime(msg046001.getE01LCMATM())); // Date Time
				
				if (msg046001.getE01LCMTYP().equals("O")) {
					if("Y".equals(msg046001.getE01DOMFLG()) || "Y".equals(req.getParameter("E01DOMFLG"))){
						pageName = "ELC0460_lc_inquiry_local.jsp";
					} else {
						pageName = "ELC0460_lc_inquiry_import.jsp";
					}
				} else if (msg046001.getE01LCMTYP().equals("I")) {
					pageName = "ELC0460_lc_inquiry_export.jsp";
				} else if (msg046001.getE01LCMTYP().equals("S")) {
					pageName = "ELC0460_lc_inq_basic_outgoing_sb.jsp";
				} else if (msg046001.getE01LCMTYP().equals("R")) {
					pageName = "ELC0460_lc_inq_basic_incoming_sb.jsp";
				}				
			}

			session.setAttribute("error", msgError);
			session.setAttribute("msg046001", msg046001);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	protected void procReqHistoryDetailCredit(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		
		JBLCHist bLCHist = (JBLCHist) session.getAttribute("bLCHist");
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC0460", req);
			ELC046002Message msg046002 = (ELC046002Message) mp.getMessageRecord("ELC046002", user.getH01USR(), "0004");
			msg046002.setE02LCMACC(bLCHist.getACC());
			msg046002.setE02LCMTDY(bLCHist.getTDY());
			msg046002.setE02LCMTDM(bLCHist.getTDM());
			msg046002.setE02LCMTDD(bLCHist.getTDD());
			msg046002.setE02LCMTTM(bLCHist.getTTM());
			msg046002.setE02LCMADM(bLCHist.getAD1());
			msg046002.setE02LCMADD(bLCHist.getAD2());
			msg046002.setE02LCMADY(bLCHist.getAD3());
			msg046002.setE02LCMATM(bLCHist.getATM());
			msg046002.setE02DSCTTP(bLCHist.getDSCTTP());
			msg046002.setE02LCMOPR(bLCHist.getOPR());
			msg046002.setE02APPREJ(bLCHist.getAPPREJ());
			msg046002.setE02LCMSUP(bLCHist.getSUP());
			msg046002.setE02LCMCCY(bLCHist.getCCY());
			msg046002.setE02LCMPRO(bLCHist.getPRO());
			msg046002.setE02LCMBNK(bLCHist.getBNK());

			mp.sendMessage(msg046002);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msg046002 = (ELC046002Message) mp.receiveMessageRecord("ELC046002");

			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				if("N".equals(msg046002.getE02LCMOPT())) {
					pageName = "ELC0460_lc_details.jsp";
				} else {
					pageName = "ELC0460_lc_details_m.jsp";	
				}
			}

			session.setAttribute("error", msgError);
			session.setAttribute("msg046002", msg046002);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	protected void procActionEnterInquiryTrans(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		initTransaction(userPO, "", "INQUIRY");
		userPO.setID(user.getE01INT()); //Country Code
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC0450", req);
			ELC045005Message msg05 = (ELC045005Message) mp.getMessageRecord("ELC045005", user.getH01USR(), "0015");
			msg05.setH05SCRCOD("01");
			msg05.setH05FLGWK3("T");
			try {
				msg05.setE05LCMACC(userPO.getAccNum());
			} catch (Exception e) {
			}

			mp.sendMessage(msg05);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			JBObjList list = mp.receiveMessageRecordList("H05FLGMAS");

			if (mp.hasError(msgError)) {
				pageName = "ELC0450_lc_inq_basic.jsp";
				ELC045001Message lcBasic = (ELC045001Message) session.getAttribute("lcBasic");
				
				if (lcBasic.getE01LCMTYP().equals("O")) {
					if("Y".equals(lcBasic.getE01DOMFLG()) || "Y".equals(req.getParameter("E01DOMFLG"))){
						pageName = "ELC0450_lc_inq_basic_local.jsp";
					} else {
						pageName = "ELC0450_lc_inq_basic_import.jsp";
					}
				} else if (lcBasic.getE01LCMTYP().equals("I")) {
					pageName = "ELC0450_lc_inq_basic_export.jsp";
				} else if (lcBasic.getE01LCMTYP().equals("S")) {
					pageName = "ELC0450_lc_inq_basic_outgoing_sb.jsp";
				} else if (lcBasic.getE01LCMTYP().equals("R")) {
					pageName = "ELC0450_lc_inq_basic_incoming_sb.jsp";
				}
			} else {
				pageName = "ELC0450_lc_transfer_list.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("jbList", list);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	protected void procActionEnterInquiryAsign(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		initTransaction(userPO, "", "INQUIRY");
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC0450", req);
			ELC045005Message msg07 = (ELC045005Message) mp.getMessageRecord("ELC045005", user.getH01USR(), "0015");
			msg07.setH05FLGWK3("A");
			msg07.setH05SCRCOD("01");
			try {
				msg07.setE05LCMACC(userPO.getIdentifier());
			} catch (Exception e) {
			}

			mp.sendMessage(msg07);
			ELEERRMessage msgError = (ELEERRMessage) mp.receiveMessageRecord("ELEERR");
			JBObjList list = mp.receiveMessageRecordList("H05FLGMAS");

			if (mp.hasError(msgError)) {
				pageName = "ELC0450_lc_enter_transfer.jsp";
			} else {
				pageName = "ELC0450_lc_assignment_list.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("jbList", list);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	protected void procReqTransfer(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		initTransaction(userPO, "", "INQUIRY");
		userPO.setID(user.getE01INT()); //Country Code
		
		String opCode = req.getParameter("opCode") == null ? "0004" : req.getParameter("opCode").trim();
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC0450", req);
			ELC045005Message msg07 = (ELC045005Message) mp.getMessageRecord("ELC045005", user.getH01USR(), opCode);
			msg07.setH05SCRCOD("01");
			msg07.setH05FLGWK3("T");
			msg07.setE05LCMACC(userPO.getIdentifier());

			try {
				msg07.setE05LCTNUM(req.getParameter("E05LCTNUM"));
			} catch (Exception e) {
				msg07.setE05LCTNUM("");
			}

			mp.sendMessage(msg07);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msg07 = (ELC045005Message) mp.receiveMessageRecord("ELC045005");

			if (mp.hasError(msgError)) {
				pageName = "ELC0450_lc_transfer_list.jsp";
			} else {
				pageName = "ELC0450_lc_transfer.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("msg045005", msg07);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	protected void procReqAssign(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		initTransaction(userPO, "", "INQUIRY");
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC0450", req);
			ELC045005Message msg07 = (ELC045005Message) mp.getMessageRecord("ELC045005", user.getH01USR(), "0004");
			msg07.setH05FLGWK3("A");
			msg07.setH05SCRCOD("01");
			msg07.setE05LCMACC(userPO.getIdentifier());
			try {
				msg07.setE05LCTNUM(req.getParameter("E05LCTNUM").trim());
			} catch (Exception e) {
				msg07.setE05LCTNUM("");
			}

			mp.sendMessage(msg07);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msg07 = (ELC045005Message) mp.receiveMessageRecord("ELC045005");

			if (mp.hasError(msgError)) {
				pageName = "ELC0450_lc_assignment_list.jsp";
			} else {
				pageName = "ELC0450_lc_assignment.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("msg045005", msg07);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	protected void requestNegotiationHist(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		initTransaction(userPO, String.valueOf(screen), "VIEW");
		
		String pageName = "";

		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC0561", req);
			ELC056101Message msgInq = (ELC056101Message) mp.getMessageRecord("ELC056101", user.getH01USR(), "0004");
			msgInq.setH01FLGWK3("H");
			try {
				msgInq.setE01LCRNUM(req.getParameter("E01LCMACC").trim());
			} catch (Exception e) {
			}
			try {
				msgInq.setE01DRWNUM(req.getParameter("E02LCLTNO").trim());
			} catch (Exception e) {
			}

			mp.sendMessage(msgInq);
			MessageRecord msg = mp.receiveMessageRecord();

			if (mp.hasError(msg)) {
				msgError = (ELEERRMessage) msg;
				pageName = "error_viewer.jsp";
			} else {
				msgError = new ELEERRMessage();
				msgInq = (ELC056101Message) msg;
				try {
					userPO.setHeader1(req.getParameter("E01DSCTTP"));
					userPO.setHeader2(req.getParameter("E01LCMOPR"));
					userPO.setHeader3(Util.formatCustomDate(user.getE01DTF(), req.getParameter("E01LCMTDM"), req.getParameter("E01LCMTDD"), req.getParameter("E01LCMTDY")) 
							+ " " +  Util.formatTime(req.getParameter("E01LCMTTM")));
					userPO.setHeader4(req.getParameter("E01APPREJ"));
					userPO.setHeader5(req.getParameter("E01LCMSUP"));
					userPO.setHeader6(Util.formatCustomDate(user.getE01DTF(), req.getParameter("E01LCMADM"), req.getParameter("E01LCMADD"), req.getParameter("E01LCMADY")) 
							+ " " +  Util.formatTime(req.getParameter("E01LCMATM")));
				} catch (Exception e) {
					// TODO: handle exception
				}
				int opcode = 0;
				try {
					opcode = Integer.valueOf(req.getParameter("E02LCLOTP")).intValue();
					//opcode = Integer.parseInt(msgInq.getE01OPCODE().trim());
				} catch (Exception e) {
					opcode = 0;
				}
				switch (opcode)	{
				/*1 = pago / a la vista
					2 = aceptacion
					3 = acept/descontada
					4 = pago diferido
					5 = financiacion
					6 = cancelacion
					9 = solo coboro de comisiones*/
					case 0:
					case 1:
					case 6: 
						pageName = "ELC0561_lc_nego_sp_readonly_hist.jsp"; 
						break;
					case 2:
					case 4: 
						pageName = "ELC0561_lc_nego_acp_readonly_hist.jsp"; 
						break;
					case 9: 
						pageName = "ELC0561_lc_nego_com_readonly_hist.jsp"; 
						break;
					case 3:
					case 5: 
						pageName = "ELC0561_lc_nego_ref_readonly_hist.jsp"; 
						break;
					default: 
						pageName = "error_viewer.jsp";
						break;
				}
				
			}

			session.setAttribute("error", msgError);
			session.setAttribute("msg01", msgInq);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	protected void procReqTransferHist(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setID(user.getE01INT()); //Country Code
		initTransaction(userPO, "", "INQUIRY");
		
		String opCode = req.getParameter("opCode") == null ? "0004" : req.getParameter("opCode").trim();
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC0460", req);
			ELC046005Message msg05 = (ELC046005Message) mp.getMessageRecord("ELC046005", user.getH01USR(), opCode);
			msg05.setH05SCRCOD("01");
			msg05.setH05FLGWK3("T");
			try {
				msg05.setE05LCMACC(req.getParameter("E02LCLACC").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msg05.setE05LCTNUM(req.getParameter("E02LCLTNO").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			if(req.getParameter("E02LCLTDY") != null)
				msg05.setE05LCMTDY(req.getParameter("E02LCLTDY"));
			if(req.getParameter("E02LCLTDM") != null)
				msg05.setE05LCMTDM(req.getParameter("E02LCLTDM"));
			if(req.getParameter("E02LCLTDD") != null)
				msg05.setE05LCMTDD(req.getParameter("E02LCLTDD"));
			if(req.getParameter("E02LCLTTM") != null)
				msg05.setE05LCMTTM(req.getParameter("E02LCLTTM"));
			if(req.getParameter("E02LCLADM") != null)
				msg05.setE05LCMADM(req.getParameter("E02LCLADM"));
			if(req.getParameter("E02LCLADD") != null)
				msg05.setE05LCMADD(req.getParameter("E02LCLADD"));
			if(req.getParameter("E02LCLADY") != null)
				msg05.setE05LCMADY(req.getParameter("E02LCLADY"));
			if(req.getParameter("E02LCLATM") != null)
				msg05.setE05LCMATM(req.getParameter("E02LCLATM"));
			if(req.getParameter("E02DSCTTP") != null)
				msg05.setE05DSCTTP(req.getParameter("E02DSCTTP"));
			if(req.getParameter("E02LCLOPR") != null)
				msg05.setE05LCMOPR(req.getParameter("E02LCLOPR"));
			if(req.getParameter("E02APPREJ") != null)
				msg05.setE05APPREJ(req.getParameter("E02APPREJ"));
			if(req.getParameter("E02LCLSUP") != null)
				msg05.setE05LCMSUP(req.getParameter("E02LCLSUP"));
			if(req.getParameter("E02LCLCCY") != null)
				msg05.setE05LCMCCY(req.getParameter("E02LCLCCY"));
			if(req.getParameter("E02LCLPRO") != null)
				msg05.setE05LCMPRO(req.getParameter("E02LCLPRO"));
			if(req.getParameter("E02LCLBNK") != null)
				msg05.setE05LCMBNK(req.getParameter("E02LCLBNK"));

			mp.sendMessage(msg05);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msg05 = (ELC046005Message) mp.receiveMessageRecord("ELC046005");

			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				userPO.setHeader1(msg05.getE05DSCTTP());
				userPO.setHeader2(msg05.getE05LCMOPR());
				userPO.setHeader3(Util.formatCustomDate(user.getE01DTF(),msg05.getE05LCMTDM(), msg05.getE05LCMTDD(), msg05.getE05LCMTDY()) 
						+ " " +  Util.formatTime(msg05.getE05LCMTTM()));
				userPO.setHeader4(msg05.getE05APPREJ());
				userPO.setHeader5(msg05.getE05LCMSUP());
				userPO.setHeader6(Util.formatCustomDate(user.getE01DTF(), msg05.getE05LCMADM(), msg05.getE05LCMADD(), msg05.getE05LCMADY()) + " " 
				+  Util.formatTime(msg05.getE05LCMATM()));
				
				pageName = "ELC0460_lc_transfer.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("msg046005", msg05);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	protected void procReqAssignHist(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		initTransaction(userPO, "", "INQUIRY");
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC0460", req);
			ELC046005Message msg05 = (ELC046005Message) mp.getMessageRecord("ELC046005", user.getH01USR(), "0004");
			msg05.setH05FLGWK3("A");
			msg05.setH05SCRCOD("01");
			try {
				msg05.setE05LCMACC(req.getParameter("E02LCLACC").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				msg05.setE05LCTNUM(req.getParameter("E02LCLTNO").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			if(req.getParameter("E02LCLTDY") != null)
				msg05.setE05LCMTDY(req.getParameter("E02LCLTDY"));
			if(req.getParameter("E02LCLTDM") != null)
				msg05.setE05LCMTDM(req.getParameter("E02LCLTDM"));
			if(req.getParameter("E02LCLTDD") != null)
				msg05.setE05LCMTDD(req.getParameter("E02LCLTDD"));
			if(req.getParameter("E02LCLTTM") != null)
				msg05.setE05LCMTTM(req.getParameter("E02LCLTTM"));
			if(req.getParameter("E02LCLADM") != null)
				msg05.setE05LCMADM(req.getParameter("E02LCLADM"));
			if(req.getParameter("E02LCLADD") != null)
				msg05.setE05LCMADD(req.getParameter("E02LCLADD"));
			if(req.getParameter("E02LCLADY") != null)
				msg05.setE05LCMADY(req.getParameter("E02LCLADY"));
			if(req.getParameter("E02LCLATM") != null)
				msg05.setE05LCMATM(req.getParameter("E02LCLATM"));
			if(req.getParameter("E02DSCTTP") != null)
				msg05.setE05DSCTTP(req.getParameter("E02DSCTTP"));
			if(req.getParameter("E02LCLOPR") != null)
				msg05.setE05LCMOPR(req.getParameter("E02LCLOPR"));
			if(req.getParameter("E02APPREJ") != null)
				msg05.setE05APPREJ(req.getParameter("E02APPREJ"));
			if(req.getParameter("E02LCLSUP") != null)
				msg05.setE05LCMSUP(req.getParameter("E02LCLSUP"));
			if(req.getParameter("E02LCLCCY") != null)
				msg05.setE05LCMCCY(req.getParameter("E02LCLCCY"));
			if(req.getParameter("E02LCLPRO") != null)
				msg05.setE05LCMPRO(req.getParameter("E02LCLPRO"));
			if(req.getParameter("E02LCLBNK") != null)
				msg05.setE05LCMBNK(req.getParameter("E02LCLBNK"));

			mp.sendMessage(msg05);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msg05 = (ELC046005Message) mp.receiveMessageRecord("ELC046005");

			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				userPO.setHeader1(msg05.getE05DSCTTP());
				userPO.setHeader2(msg05.getE05LCMOPR());
				userPO.setHeader3(Util.formatCustomDate(user.getE01DTF(), msg05.getE05LCMTDM(), msg05.getE05LCMTDD(), msg05.getE05LCMTDY()) 
						+ " " +  Util.formatTime(msg05.getE05LCMTTM()));
				userPO.setHeader4(msg05.getE05APPREJ());
				userPO.setHeader5(msg05.getE05LCMSUP());
				userPO.setHeader6(Util.formatCustomDate(user.getE01DTF(), msg05.getE05LCMADM(), msg05.getE05LCMADD(), msg05.getE05LCMADY()) 
						+ " " +  Util.formatTime(msg05.getE05LCMATM()));
				
				pageName = "ELC0460_lc_assignment.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("msg046005", msg05);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	protected void procReqTransferCommissionHist(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session, int screen) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setID(user.getE01INT()); //Country Code
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC0460", req);
			ELC046005Message msg05 = (ELC046005Message) session.getAttribute("msg046005");
			msg05.setH05OPECOD("0008");
			msg05.setH05SCRCOD("01");
			msg05.setH05FLGWK3("T");

			mp.sendMessage(msg05);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msg05 = (ELC046005Message) mp.receiveMessageRecord("ELC046005");

			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ELC0460_lc_transfer_commissi.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("msg046005", msg05);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	protected void procReqSwiftHist(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		initTransaction(userPO, "", "INQUIRY");
		
		JBLCHist bLCHist = (JBLCHist) session.getAttribute("bLCHist");
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC0460", req);
			ELC046003Message msg03 = (ELC046003Message) mp.getMessageRecord("ELC046003", user.getH01USR(), "0004");
			msg03.setH03FLGWK3("A");
			msg03.setH03SCRCOD("01");
			msg03.setE03LCDACC(bLCHist.getACC());
			msg03.setE03LCDANU(bLCHist.getTNO());
			try {
				msg03.setE03LCDFCD(req.getParameter("fcode").trim());
			} catch (Exception e) {
				// TODO: handle exception
			}
			msg03.setE03LCDTDY(bLCHist.getTDY());
			msg03.setE03LCDTDM(bLCHist.getTDM());
			msg03.setE03LCDTDD(bLCHist.getTDD());
			msg03.setE03LCDTTM(bLCHist.getTTM());
			msg03.setE03LCMADM(bLCHist.getAD1());
			msg03.setE03LCMADD(bLCHist.getAD2());
			msg03.setE03LCMADY(bLCHist.getAD3());
			msg03.setE03LCMATM(bLCHist.getATM());
			msg03.setE03DSCTTP(bLCHist.getDSCTTP());
			msg03.setE03LCMOPR(bLCHist.getOPR());
			msg03.setE03APPREJ(bLCHist.getAPPREJ());
			msg03.setE03LCMSUP(bLCHist.getSUP());
			//msg03.setE03LCDCCY(bLCHist.getCCY());
			msg03.setE03LCDPRO(bLCHist.getPRO());
			msg03.setE03LCDBNK(bLCHist.getBNK());

			mp.sendMessage(msg03);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msg03 = (ELC046003Message) mp.receiveMessageRecord("ELC046003");

			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ELC0460_lc_field_info.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("msg046003", msg03);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	protected void procReqSwiftCommissionsHist(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		initTransaction(userPO, "", "INQUIRY");
		
		JBLCHist bLCHist = (JBLCHist) session.getAttribute("bLCHist");
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC0460", req);
			ELC046004Message msg04 = (ELC046004Message) mp.getMessageRecord("ELC046004", user.getH01USR(), "0004");
			msg04.setH04FLGWK3("A");
			msg04.setH04SCRCOD("01");
			msg04.setE04LCMACC(bLCHist.getACC());
			msg04.setE04LCMTDY(bLCHist.getTDY());
			msg04.setE04LCMTDM(bLCHist.getTDM());
			msg04.setE04LCMTDD(bLCHist.getTDD());
			msg04.setE04LCMTTM(bLCHist.getTTM());
			msg04.setE04LCMADM(bLCHist.getAD1());
			msg04.setE04LCMADD(bLCHist.getAD2());
			msg04.setE04LCMADY(bLCHist.getAD3());
			msg04.setE04LCMATM(bLCHist.getATM());
			msg04.setE04DSCTTP(bLCHist.getDSCTTP());
			msg04.setE04LCMOPR(bLCHist.getOPR());
			msg04.setE04APPREJ(bLCHist.getAPPREJ());
			msg04.setE04LCMSUP(bLCHist.getSUP());
			//msg04.setE04LCDCCY(bLCHist.getCCY());
			msg04.setE04LCMPRO(bLCHist.getPRO());
			msg04.setE04LCMBNK(bLCHist.getBNK());

			mp.sendMessage(msg04);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msg04 = (ELC046004Message) mp.receiveMessageRecord("ELC046004");

			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ELC0460_lc_commissi.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("msg046004", msg04);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}


	protected void procReqSwiftDocsHist(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		initTransaction(userPO, "", "INQUIRY");
		
		JBLCHist bLCHist = (JBLCHist) session.getAttribute("bLCHist");
		
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("ELC0460", req);
			ELC046006Message msg06 = (ELC046006Message) mp.getMessageRecord("ELC046006", user.getH01USR(), "0004");
			msg06.setH06FLGWK3("A");
			msg06.setH06SCRCOD("01");
			msg06.setE06LCMACC(bLCHist.getACC());
			msg06.setE06LCMTDY(bLCHist.getTDY());
			msg06.setE06LCMTDM(bLCHist.getTDM());
			msg06.setE06LCMTDD(bLCHist.getTDD());
			msg06.setE06LCMTTM(bLCHist.getTTM());
			msg06.setE06LCMADM(bLCHist.getAD1());
			msg06.setE06LCMADD(bLCHist.getAD2());
			msg06.setE06LCMADY(bLCHist.getAD3());
			msg06.setE06LCMATM(bLCHist.getATM());
			msg06.setE06DSCTTP(bLCHist.getDSCTTP());
			msg06.setE06LCMOPR(bLCHist.getOPR());
			msg06.setE06APPREJ(bLCHist.getAPPREJ());
			msg06.setE06LCMSUP(bLCHist.getSUP());
			msg06.setE06LCMPRO(bLCHist.getPRO());
			msg06.setE06LCMBNK(bLCHist.getBNK());

			mp.sendMessage(msg06);
			ELEERRMessage msgError = (ELEERRMessage) mp
					.receiveMessageRecord("ELEERR");
			msg06 = (ELC046006Message) mp.receiveMessageRecord("ELC046006");

			if (mp.hasError(msgError)) {
				pageName = "error_viewer.jsp";
			} else {
				pageName = "ELC0460_lc_documents.jsp";
			}

			session.setAttribute("error", msgError);
			session.setAttribute("msg046006", msg06);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
	}

	protected void initTransaction(UserPos userPO, String optMenu, String purpose) {
		if (!optMenu.equals("")) userPO.setOption(optMenu);
		if (!purpose.equals("")) userPO.setPurpose(purpose);
	}
}
