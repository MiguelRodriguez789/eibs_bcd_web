package datapro.eibs.trade;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.datapro.generic.tool.Util;

import datapro.eibs.beans.EDC009001Message;
import datapro.eibs.beans.EDC010001Message;
import datapro.eibs.beans.EDC010002Message;
import datapro.eibs.beans.ELEERRMessage;
import datapro.eibs.beans.ESD000002Message;
import datapro.eibs.beans.ESD000005Message;
import datapro.eibs.beans.ESD071105Message;
import datapro.eibs.beans.ESD0715DSMessage;
import datapro.eibs.beans.ESS0030DSMessage;
import datapro.eibs.beans.JBObjList;
import datapro.eibs.beans.UserPos;
import datapro.eibs.master.JSEIBSServlet;
import datapro.eibs.master.MessageProcessor;
import datapro.eibs.sockets.MessageRecord;
/**
 * @version 	1.0
 * @author	erodriguez
 */
public class JSEDC0100 extends JSEIBSServlet {

	protected static final int R_BASIC_INQ = 1;
	protected static final int R_CODES_INQ = 3;
	protected static final int R_STATEMENT = 5;
	protected static final int A_STATEMENT = 6;
	protected static final int R_SPECIAL_INST_INQ = 7;
	protected static final int R_PRODUCTS = 9;
	protected static final int R_RATE_TB = 11;
	protected static final int R_GUARANTEE = 13;
	protected static final int R_DOCUMENT = 15;

	// entering options
	protected static final int R_ENTER_INQUIRY = 100;
	protected static final int A_ENTER_INQUIRY = 200;
	protected static final int R_LIST			= 210;
	
	protected static final int A_ENTER_INQUIRY_ACC	= 900;
	protected static final int R_ENTER_INQUIRY_HIS	= 425;
	
	protected void processRequest(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res,
			HttpSession session, int screen) throws ServletException,
			IOException {
		
		switch (screen)	{
		case R_LIST :
			procReqList(user, req, res, session);
			break;
		case R_BASIC_INQ :
			procReqInqBasic(user, req, res, session);
			break;
		case R_CODES_INQ :
			procReqSpecialCodesInq(user, req, res, session);
			break;
		case R_SPECIAL_INST_INQ :
			procReqEspInstInq(user, req, res, session);
			break;
		case R_PRODUCTS :
			procReqProductLC(user, req, res, session);
			break;
		case R_RATE_TB :
			procReqInqTable(user, req, res, session);
			break;
		case R_ENTER_INQUIRY :
			procReqEnterInquiry(req, res, session);
			break;
		case A_ENTER_INQUIRY :
			procActionEnterInquiry(user, req, res, session);
			break;
		case A_ENTER_INQUIRY_ACC :
			procActionEnterInquiryACC(user, req, res, session);
			break;
		case R_ENTER_INQUIRY_HIS :
			procReqHistoryList(user, req, res, session);
			break;
		default :
			break;
		}
	}

	private void procReqList(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDC0100", req);
			EDC009001Message msg = (EDC009001Message) mp.getMessageRecord("EDC009001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDC0100");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0015");
			
			setMessageRecord(req, msg);

			mp.sendMessage(msg);
			JBObjList list = mp.receiveMessageRecordList("H01FLGMAS");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "EDC0090_dc_enter_inquiry.jsp";
			} else {
				pageName = "EDC0090_dc_inquiry_list.jsp";
			}

			session.setAttribute("jbList", list);

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

		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDC0100", req);
			EDC010001Message msg = (EDC010001Message) mp.getMessageRecord("EDC010001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDC0100");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0004");
			msg.setE01DCMACC(userPO.getIdentifier());

			mp.sendMessage(msg);
			MessageRecord message = mp.receiveMessageRecord();

			if (mp.hasError(message)) {
				msgError = (ELEERRMessage) message;
				pageName = "EDC0100_coll_enter_inquiry.jsp";
			} else {
				msgError = new ELEERRMessage();
				msg = (EDC010001Message) message;
				userPO.setIdentifier(msg.getE01DCMACC());
				userPO.setProdCode(msg.getE01DCMPRO());
				userPO.setBank(msg.getE01DCMBNK());
				userPO.setHeader1(msg.getE01DCMPRO());
				userPO.setHeader2(msg.getE01DCMCUN());
				userPO.setHeader3(msg.getE01CUSNA1());
				userPO.setCurrency(msg.getE01DCMCCY());
				userPO.setHeader21(msg.getE01DCMSTY());
				userPO.setHeader22(msg.getE01DCMTAR());
				userPO.setHeader23(msg.getE01DCMATY());
				userPO.setAccNum(msg.getE01DCMACC());
				userPO.setSource("COBRANZA");
				session.setAttribute("collBasic", msg);
				pageName = "EDC0100_coll_doc_inq_basic.jsp";
			}

			session.setAttribute("error", msgError);

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

		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDC0100", req);
			ESD000002Message msg = (ESD000002Message) mp.getMessageRecord("ESD000002");
			msg.setH02USR(user.getH01USR());
			msg.setH02PGM("EDC0100");
			msg.setH02TIM(getTimeStamp());
			msg.setH02SCR("01");
			msg.setH02OPE("0004");
			msg.setE02ACC(userPO.getIdentifier());

			mp.sendMessage(msg);
			MessageRecord message = mp.receiveMessageRecord();

			if (mp.hasError(message)) {
				msgError = (ELEERRMessage) message;
				if (userPO.getHeader21().equals("D")) {
					pageName = "EDC0100_coll_doc_inq_basic.jsp";
				} else {
					pageName = "EDC0100_coll_simp_inq_basic.jsp";
				}
			} else {
				msgError = new ELEERRMessage();
				session.setAttribute("collCodes", message);
				pageName = "EDC0100_coll_inq_codes.jsp";
			}

			session.setAttribute("error", msgError);

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

		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDC0100", req);
			ESD000005Message msg = (ESD000005Message) mp.getMessageRecord("ESD000005");
			msg.setH05USR(user.getH01USR());
			msg.setH05PGM("EDC0100");
			msg.setH05TIM(getTimeStamp());
			msg.setH05SCR("01");
			msg.setH05OPE("0004");
			msg.setE05ACC(userPO.getIdentifier());
			msg.setE05ACD("CL");

			mp.sendMessage(msg);
			MessageRecord message = mp.receiveMessageRecord();

			if (mp.hasError(message)) {
				msgError = (ELEERRMessage) message;
				if (userPO.getHeader21().equals("D")) {
					pageName = "EDC0100_coll_doc_inq_basic.jsp";
				} else {
					pageName = "EDC0100_coll_simp_inq_basic.jsp";
				}
			} else {
				msgError = new ELEERRMessage();
				session.setAttribute("collInst", message);
				pageName = "EDC0100_coll_inq_special_inst.jsp";
			}

			session.setAttribute("error", msgError);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqProductLC(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";

		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDC0100", req);
			ESD071105Message msg = (ESD071105Message) mp.getMessageRecord("ESD071105");
			msg.setH05USERID(user.getH01USR());
			msg.setH05PROGRM("EDC0100");
			msg.setH05TIMSYS(getTimeStamp());
			msg.setH05SCRCOD("01");
			msg.setH05OPECOD("0004");
			msg.setE05APCCDE(userPO.getHeader1());
			msg.setE05APCBNK(userPO.getBank());

			mp.sendMessage(msg);
			MessageRecord message = mp.receiveMessageRecord();

			if (mp.hasError(message)) {
				msgError = (ELEERRMessage) message;
				if (userPO.getHeader21().equals("D")) {
					pageName = "EDC0100_coll_doc_inq_basic.jsp";
				} else {
					pageName = "EDC0100_coll_simp_inq_basic.jsp";
				}
			} else {
				msgError = new ELEERRMessage();
				session.setAttribute("colProdInq", message);
				pageName = "EDC0100_coll_inq_products.jsp";
			}

			session.setAttribute("error", msgError);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqInqTable(ESS0030DSMessage user, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";

		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDC0100", req);
			ESD0715DSMessage msg = (ESD0715DSMessage) mp.getMessageRecord("ESD0715DS");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDC0100");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0004");
			msg.setE01SELBNK(userPO.getBank());
			msg.setE01SELTLN(Util.justifyRight(userPO.getHeader22(), 2));
			msg.setE01SELTYP(userPO.getHeader23());

			mp.sendMessage(msg);
			MessageRecord message = mp.receiveMessageRecord();

			if (mp.hasError(message)) {
				msgError = (ELEERRMessage) message;
				if (userPO.getHeader21().equals("D")) {
					pageName = "EDC0100_coll_doc_inq_basic.jsp";
				} else {
					pageName = "EDC0100_coll_simp_inq_basic.jsp";
				}
			} else {
				msgError = new ELEERRMessage();
				session.setAttribute("colProdInq", message);
				pageName = "EDC0100_coll_inq_fee_tab.jsp";
			}

			session.setAttribute("error", msgError);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procReqEnterInquiry(HttpServletRequest req,
			HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setOption("DV");
		userPO.setPurpose("INQUIRY");
		
		session.setAttribute("error", new ELEERRMessage());
		forward("EDC0100_coll_enter_inquiry.jsp", req, res);
	}

	private void procActionEnterInquiry(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";

		ELEERRMessage msgError = null;
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDC0100", req);
			EDC010001Message msg = (EDC010001Message) mp.getMessageRecord("EDC010001");
			msg.setH01USERID(user.getH01USR());
			msg.setH01PROGRM("EDC0100");
			msg.setH01TIMSYS(getTimeStamp());
			msg.setH01SCRCOD("01");
			msg.setH01OPECOD("0004");
			try {
				msg.setE01DCMACC(req.getParameter("E01DCMACC").trim());
			} catch (Exception e)	{
				msg.setE01DCMACC("0");
			}

			mp.sendMessage(msg);
			MessageRecord message = mp.receiveMessageRecord();

			if (mp.hasError(message)) {
				msgError = (ELEERRMessage) message;
				pageName = "EDC0100_coll_enter_inquiry.jsp";
			} else {
				msgError = new ELEERRMessage();
				msg = (EDC010001Message) message;
				userPO.setIdentifier(msg.getE01DCMACC());
				userPO.setAccNum(msg.getE01DCMACC());
				userPO.setBank(msg.getE01DCMBNK());
				userPO.setHeader1(msg.getE01DCMPRO());
				userPO.setHeader2(msg.getE01DCMCUN());
				userPO.setHeader3(msg.getE01CUSNA1());
				userPO.setCurrency(msg.getE01DCMCCY());
				userPO.setHeader21(msg.getE01DCMSTY());
				userPO.setHeader22(msg.getE01DCMTAR());
				userPO.setHeader23(msg.getE01DCMATY());
				userPO.setOfficer(msg.getE01DCMOFC() + " - " + msg.getE01DSCOFC());
				
				if (userPO.getHeader21().equals("D")) {
					pageName = "EDC0100_coll_doc_inq_basic.jsp";
				} else {
					pageName = "EDC0100_coll_simp_inq_basic.jsp";
				}
				session.setAttribute("collBasic", msg);
			}
			session.setAttribute("userPO_DC", userPO);
			session.setAttribute("userPO", userPO);
			session.setAttribute("error", msgError);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}

	private void procActionEnterInquiryACC(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		userPO.setOption("DC");
		userPO.setPurpose("INQUIRY");
		
		session.setAttribute("error", new ELEERRMessage());
		forward("EDC0110_dc_enter_inquiry.jsp", req, res);
	}

	private void procReqHistoryList(ESS0030DSMessage user,
			HttpServletRequest req, HttpServletResponse res, HttpSession session) throws ServletException, IOException {
		
		UserPos userPO = getUserPos(req);
		String pageName = "";
		MessageProcessor mp = null;
		try {
			mp = getMessageProcessor("EDC0100", req);
			EDC010002Message msg010002 = (EDC010002Message) mp.getMessageRecord("EDC010002");
			msg010002.setH02USERID(user.getH01USR());
			msg010002.setH02PROGRM("EDC0100");
			msg010002.setH02TIMSYS(getTimeStamp());
			msg010002.setH02OPECOD("0015");
			try {
				msg010002.setE02DCLACC(req.getParameter("E02DCLACC").trim());
			} catch (Exception e) {
				msg010002.setE02DCLACC(userPO.getIdentifier());
			}

			mp.sendMessage(msg010002);
			JBObjList list = mp.receiveMessageRecordList("H02FLGMAS");

			if (mp.hasError(list)) {
				session.setAttribute("error", mp.getError(list));
				pageName = "EDC0110_dc_enter_inquiry.jsp";
			} else {
				Iterator iterator = list.iterator();
				while (iterator.hasNext()) {
					msg010002 = (EDC010002Message) iterator.next();
					userPO.setAccNum(msg010002.getE02DCLACC());
					userPO.setBank(msg010002.getE02DCMBNK());
					userPO.setCurrency(msg010002.getE02DCMCCY());
					userPO.setProdCode(msg010002.getE02DCMPRO());
					break;
				}
				if (list.isEmpty()) {
					pageName = "MISC_no_result.jsp";
				} else {
					pageName = "EDC0110_dc_inquiry_list.jsp";
				}
			}

			session.setAttribute("jbList", list);

			forward(pageName, req, res);

		} finally {
			if (mp != null)
				mp.close();
		}
		
	}
	
}
